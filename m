Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B624F1B7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 06:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6F16EC5D;
	Mon, 24 Aug 2020 04:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC14B6EC5D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 04:03:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209019] New: [drm:dpcd_set_source_specific_data [amdgpu]]
 *ERROR* Error in DP aux read transaction, not writing source specific data
Date: Mon, 24 Aug 2020 04:03:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209019-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=209019

            Bug ID: 209019
           Summary: [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR*
                    Error in DP aux read transaction, not writing source
                    specific data
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rtmasura+kernel@hotmail.com
        Regression: No

In kernel 5.8.1 and kernel 5.8.2 I am having an issue with multiple displays.
It's losing detection of one of my monitors and causing it to re-detect the
monitors, and detects it, then loses it again, and re-detects, and so forth
until it does eventually detect the monitor and the issue goes away for some
time. It's random, I can't reproduce it at will. 

I have managed to trigger it:
1. By maximizing a window on a monitor that is not the one it loses connection
to.

2. The screen graphical effect such as when xfce-screenshooter darkens the
screen to  capture a region


Let me know if there's anything else I can provide. I think Arch Linux is
currently at 5.8.3, so I'll do an upgrade.




uname -a:                                                                       
Linux abiggun 5.8.2-arch1-1 #1 SMP PREEMPT Thu, 20 Aug 2020 20:45:00 +0000
x86_64 GNU/Linux



dmesg:
[21159.093638] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21159.542494] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21169.281470] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21169.712677] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21179.389388] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21179.832841] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21180.189786] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[21193.108746] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[21203.108238] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21203.563296] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21231.665363] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21232.103796] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21232.201005] [drm:dc_link_detect_helper [amdgpu]] *ERROR* No EDID read.
[21232.450766] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[21234.635424] [drm:retrieve_link_cap [amdgpu]] *ERROR* retrieve_link_cap: Read
dpcd data failed.
[21255.768880] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21256.214181] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21266.041592] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21266.514366] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21268.894874] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR* Error in DP
aux read transaction, not writing source specific data
[21269.334409] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21269.431262] [drm:dc_link_detect_helper [amdgpu]] *ERROR* No EDID read.
[21269.679883] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[21272.604484] [drm] amdgpu_dm_irq_schedule_work FAILED src 1
[21273.016019] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12



lscpu:
Architecture:                    x86_64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Little Endian
Address sizes:                   48 bits physical, 48 bits virtual
CPU(s):                          6
On-line CPU(s) list:             0-5
Thread(s) per core:              1
Core(s) per socket:              6
Socket(s):                       1
NUMA node(s):                    1
Vendor ID:                       AuthenticAMD
CPU family:                      16
Model:                           10
Model name:                      AMD Phenom(tm) II X6 1090T Processor
Stepping:                        0
CPU MHz:                         3297.796
BogoMIPS:                        6423.85
Virtualization:                  AMD-V
L1d cache:                       384 KiB
L1i cache:                       384 KiB
L2 cache:                        3 MiB
L3 cache:                        6 MiB
NUMA node0 CPU(s):               0-5
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Not affected
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Not affected
Vulnerability Spec store bypass: Not affected
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and
__user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Full AMD retpoline, STIBP
disabled, RSB filling
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep
mtrr pge mca cmov pat pse36 clflush mmx fxsr sse
                                  sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm 3dnowext 3dnow constant_tsc rep_good n
                                 opl nonstop_tsc cpuid extd_apicid aperfmperf
pni monitor cx16 popcnt lahf_lm cmp_legacy svm 
                                 extapic cr8_legacy abm sse4a misalignsse
3dnowprefetch osvw ibs skinit wdt cpb hw_pstate vmm
                                 call npt lbrv svm_lock nrip_save pausefilter




lspci (note: the nvidia card is blacklisted and passed to KVM guests. Vega56 is
the one connected to the monitors):
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890 Northbridge
only single slot PCI-e GFX Hydra part (rev 02)
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memory
Management Unit (IOMMU)
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GFX port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 0)
00:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 3)
00:0b.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD990 PCI to
PCI bridge (PCI Express GFX2 port 0)
00:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP2 Port 0)
00:11.0 RAID bus controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 SATA Controller [RAID5 mode] (rev 40)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller
(rev 42)
00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 Azalia
(Intel HDA) (rev 40)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0
LPC host controller (rev 40)
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI
Bridge (rev 40)
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI2 Controller
00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Address Map
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor
Link Control
02:00.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:04.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:05.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:06.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:08.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
03:09.0 PCI bridge: PLX Technology, Inc. PEX 8624 24-lane, 6-Port PCI Express
Gen 2 (5.0 GT/s) Switch [ExpressLane] (rev bb)
04:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
04:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
06:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
06:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
07:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
07:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network Connection
(rev 01)
09:00.0 VGA compatible controller: NVIDIA Corporation GP104GL [Quadro P4000]
(rev a1)
09:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller
(rev a1)
0a:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev
03)
0b:00.0 SATA controller: JMicron Technology Corp. JMB363 SATA/IDE Controller
(rev 03)
0b:00.1 IDE interface: JMicron Technology Corp. JMB363 SATA/IDE Controller (rev
03)
0c:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Vega 10 PCIe Bridge (rev
c3)
0d:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Vega 10 PCIe Bridge
0e:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Vega
10 XL/XT [Radeon RX Vega 56/64] (rev c3)
0e:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Vega 10 HDMI Audio
[Radeon Vega 56/64]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
