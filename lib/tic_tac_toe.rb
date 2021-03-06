class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      "true"
    end
  end

  def turn_count
    @board.count{ |token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    elsif !valid_move?(index)
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  end

  def full?
    @board.all? do |box|
     box == "X" || box == "O"
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      false
    end
  end

  def winner
    if won?
     return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
   elsif draw?
      puts "Cat's Game!"
   end
 end


end
