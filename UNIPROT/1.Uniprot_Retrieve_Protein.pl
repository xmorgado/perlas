

###############################################################
############   Declare Functions  ############################
###############################################################
use LWP::Simple;

my @PROTS;
sub ReadFile;
sub RetrieveGenome;


###############################################################
############		Main     ##############################
@PROTS=ReadFile;
foreach my $ID (@PROTS){
	print"Retrieving UNIPROT protein $ID\n";
	RetrieveGenome($ID);
}
#ReadID;

###############################################################
###############################################################

sub ReadFile{
	open FILE,  "$ARGV[0]" or die "I can not open the input FILE\n";
	my @prots;
	while (my $line=<FILE>){
		chomp $line;
		print "$line\n";
		push(@prots,$line);
		#$prots{$content[0]}=($content[1],$content[2]);
		#print"$content[0]=>$prots{$content[0]}\n\n";
		}
	return @prots;
}

###############################################################
##2	Upload Genomes to RAST using SVR svr_submit_RAST_job.pl and my account
sub RetrieveGenome{
	my $ID=shift;
	`wget http://www.uniprot.org/uniprot/$ID.fasta`;
}
#wget http://www.uniprot.org/uniprot/B1LHD3.fasta
