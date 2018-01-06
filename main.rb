prompt = "..> "

#BEGIN FUNCTIONS
def chart(username, prompt)
  open_chart = open("ChartDefault.txt")
  puts "Enter \'all\' to see the entire chart."
  puts "Enter \'single\' to see a single line from the chart."
  print prompt
  response = $stdin.gets.chomp

  if response == "all"
    puts open_chart.read
  elsif response == "single"
    line_search(prompt)
  else
    puts "That is not a valid response"
    chart(username, prompt)
  end

  puts "\nAre you finished?\n"
  print prompt

  response = $stdin.gets.chomp

  if response == "yes"
    main_menu(username, prompt)
  elsif response == "no"
    chart(username, prompt)
  else
    puts "That is not a valid response"
  end

end

def header()
  header = open("Welcome_Header.txt")
  puts header.read
end

def status(username, prompt)
  puts "\nGreen across the board Dr. #{username}.\n\n"
  main_menu(username, prompt)
end

def line_search(prompt)
  puts "What line would you like to review?"
  print prompt
  line_number = $stdin.gets.chomp.to_i
  open_chart = File.open("ChartDefault.txt").read

  #validate search line_number
  total_lines = File.foreach("ChartDefault.txt").count.to_i
  if line_number > total_lines
    print "I'm sorry, please choose a lower number."
  else
    puts open_chart.lines[1...4]
    puts open_chart.lines[line_number]
  end
end

def main_menu(username, prompt)
    puts "What would you like to do today Dr. #{username}?"
    puts "1 - Population Graph"
    puts "2 - Park Status"
    print prompt
    response = $stdin.gets.chomp

    if response == "1"
      chart(username, prompt)
    elsif response == "2"
      status(username, prompt)
    elsif response == "exit" or "quit"
      puts "\nHave a great day Dr. #{username}!"
    else
      puts "Not a valid option, please try again."
      main_menu(username, prompt)
    end
end

def login(username)
  puts "Good Morning Dr. #{username}."
end
# END FUNCTIONS

header()
print "Please login: "
username = $stdin.gets.chomp
login(username)
main_menu(username, prompt)
