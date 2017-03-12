# read the data into a dataframe then save only data from 2/1 and 2/2

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
selected<- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert the Date to Date class
selected$Date <- as.Date(selected$Date, format="%d/%m/%Y")

# convert the Time variable to Time class
selected$Time <- strptime(paste(selected$Date, selected$Time), format="%Y-%m-%d %H:%M:%S")

# data is ready to plot.

# histogram, then copy to png file
with(selected, hist(Global_active_power, col="red", 
                         breaks=15,
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()

