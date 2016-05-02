﻿
# Microsoft Deployment Workbench Server Health Validate

#hard coded due to restrction on invoke-pester -script ScriptName  <--needed to pass argument for stored xml data
$CurrentBaseline = Import-Clixml -Path C:\OneDrive\Develop\Git\PSPesterDashboardKickstarter.HV1\OperationalBaselines\MockSnapshots\DSMG01.Baseline.xml

#Import saved AD snapshot
$Snapshot = Import-Clixml -Path C:\OneDrive\Develop\Git\PSPesterDashboardKickstarter.HV1\OperationalBaselines\MockBaseLines\DSMG01.Baseline.xml

Describe "Microsoft Deployment Workbench server operational readiness" {
    
    Context 'Verifying MDT Monitoring' {
        it "Monitor Data $($CurrentBaseline.MonitorData)" {
            $CurrentBaseline.MonitorData | Should be $Snapshot.MonitorData
        }
    } # end Context MDT Monitoring
    Context 'Verifying Deployment Share Statistics' {
        it "Operating Systems $($CurrentBaseline.ShareStatistics.OperatingSystems)" {
            $CurrentBaseline.ShareStatistics.OperatingSystems | Should be $Snapshot.ShareStatistics.OperatingSystems
        }
        it "Operating Systems $($CurrentBaseline.ShareStatistics.OperatingSystems)" {
            $CurrentBaseline.ShareStatistics.TaskSequences | Should be $Snapshot.ShareStatistics.TaskSequences
        }
    } # end context MDT Share Statistics
} # end Describe
