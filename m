Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6455F776
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E871E113D72;
	Wed, 29 Jun 2022 07:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C33711272A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:07:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 353EE61AF0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B173C3411E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656486452;
 bh=zzupi4LYoqmWu/sW7uYPDplb3eQWqvmt3MVCq7Qfinc=;
 h=From:To:Subject:Date:From;
 b=iYjhex0EchFDn49xsmlSXSxQ89+Tgo04myRiRkvHU6I5jRoCZzBTGAF+ZUyUowmGn
 EMhNIM5K2Jno4Mr8sg9KoiPyGJZXcfaGkiVDRq0AoBBkP+tnH4Kj8G/f1gKB4iCX0/
 2K/h1yfNt4HkbUE0alYRUnmo3H9oysIh4aZgFmfIIlGlZVTmfiEGeT6JqWbWRAIm/i
 0hy6RwOc3zMS9rq+rXGGvsXlLl6P7Ry8miSwvx7TQvnedrpiiJ0nXFkLjnUK/BNS+o
 Vq+n4j/d/pRx2Vl2ZLLEJmm9+d9i+3NtkqqL1fk5kp10KljAxCgIXaD0E6AFh178GU
 1RNx66g1D7sVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 83FF7CC13AD; Wed, 29 Jun 2022 07:07:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216188] New: nvidiafb: unknown NV_ARCH
Date: Wed, 29 Jun 2022 07:07:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216188-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216188

            Bug ID: 216188
           Summary: nvidiafb: unknown NV_ARCH
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

I notice this with 5.18.6 vanilla kernel:

dmesg | grep nvidiafb
[    3.540222] nvidiafb 0000:01:00.0: enabling device (0000 -> 0003)
[    3.540378] nvidiafb: Device ID: 10de2520=20
[    3.540379] nvidiafb: unknown NV_ARCH


lspci -s 01:00.0 -vvvvv
01:00.0 VGA compatible controller: NVIDIA Corporation GA106M [GeForce RTX 3=
060
Mobile / Max-Q] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. GA106M [GeForce RTX 3060 Mobile /
Max-Q]
        Physical Slot: 0
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 68
        IOMMU group: 8
        Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at fc00000000 (64-bit, prefetchable) [size=3D8G]
        Region 3: Memory at fe00000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at fc000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0+,D1-,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ FLRese=
t-
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <1us, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s (downgraded), Width x8 (downgraded)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP-
LTR+
                         10BitTagComp+ 10BitTagReq+ OBFF Via message, ExtFm=
t-
EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Reti=
mer+
2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedD=
is-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
                        Status: NegoPending- InProgress-
        Capabilities: [250 v1] Latency Tolerance Reporting
                Max snoop latency: 0ns
                Max no snoop latency: 0ns
        Capabilities: [258 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
                          PortCommonModeRestoreTime=3D255us PortTPowerOnTim=
e=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
                L1SubCtl2: T_PwrOn=3D10us
        Capabilities: [128 v1] Power Budgeting <?>
        Capabilities: [420 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 <?>
        Capabilities: [900 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [bb0 v1] Physical Resizable BAR
                BAR 0: current size: 16MB, supported: 16MB
                BAR 1: current size: 8GB, supported: 64MB 128MB 256MB 512MB=
 1GB
2GB 4GB 8GB
                BAR 3: current size: 32MB, supported: 32MB
        Capabilities: [c1c v1] Physical Layer 16.0 GT/s <?>
        Capabilities: [d00 v1] Lane Margining at the Receiver <?>
        Capabilities: [e00 v1] Data Link Feature <?>
        Kernel modules: nvidiafb, nouveau

lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne Root
Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe=
 GPP
Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 7
01:00.0 VGA compatible controller: NVIDIA Corporation GA106M [GeForce RTX 3=
060
Mobile / Max-Q] (rev a1)
01:00.1 Audio device: NVIDIA Corporation Device 228e (rev a1)
02:00.0 Network controller: MEDIATEK Corp. MT7921 802.11ax PCI Express Wire=
less
Network Adapter
03:00.0 Non-Volatile memory controller: Intel Corporation Device f1aa (rev =
03)
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne (rev c4)
04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon =
High
Definition Audio Controller
04:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17h
(Models 10h-1fh) Platform Security Processor
04:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB
3.1
04:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB
3.1
04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 01)
04:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD
Audio Controller


lscpu
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         48 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  16
  On-line CPU(s) list:   0-15
Vendor ID:               AuthenticAMD
  BIOS Vendor ID:        Advanced Micro Devices, Inc.
  Model name:            AMD Ryzen 9 5900HS with Radeon Graphics
    BIOS Model name:     AMD Ryzen 9 5900HS with Radeon Graphics=20=20=20=
=20=20=20=20=20
Unknown CPU @ 3.3GHz
    BIOS CPU family:     107
    CPU family:          25
    Model:               80
    Thread(s) per core:  2
    Core(s) per socket:  8
    Socket(s):           1
    Stepping:            0
    Frequency boost:     enabled
    CPU(s) scaling MHz:  26%
    CPU max MHz:         4679.2959
    CPU min MHz:         1200.0000
    BogoMIPS:            6587.68
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
pdpe1g
                         b rdtscp lm constant_tsc rep_good nopl nonstop_tsc
cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4=
_1
sse4_
                         2 movbe popcnt aes xsave avx f16c rdrand lahf_lm
cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw =
ibs
skinit
                          wdt tce topoext perfctr_core perfctr_nb bpext
perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmm=
call
fsgsbas
                         e bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a rdseed
adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc
cqm_occup_l
                         lc cqm_mbm_total cqm_mbm_local clzero irperf
xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale
vmcb_clean flus
                         hbyasid decodeassists pausefilter pfthreshold avic
v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid
overflow_reco
                         v succor smca fsrm
Virtualization features:=20
  Virtualization:        AMD-V
Caches (sum of all):=20=20=20=20=20
  L1d:                   256 KiB (8 instances)
  L1i:                   256 KiB (8 instances)
  L2:                    4 MiB (8 instances)
  L3:                    16 MiB (1 instance)
NUMA:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-15
Vulnerabilities:=20=20=20=20=20=20=20=20=20
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Spec store bypass:     Vulnerable
  Spectre v1:            Vulnerable: __user pointer sanitization and userco=
py
barriers only; no swapgs barriers
  Spectre v2:            Vulnerable, IBPB: disabled, STIBP: disabled
  Srbds:                 Not affected
  Tsx async abort:       Not affected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
