Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F9799DF1
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 13:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4292A10E150;
	Sun, 10 Sep 2023 11:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A6110E150
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4D660C6C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8214C433C7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694346968;
 bh=k+k8rX2fZUIOOXxvYpLZZE6FhI8DBI0C/jPJ5xRhn7c=;
 h=From:To:Subject:Date:From;
 b=rC14sp5dwaYZ8SUrFnMIfZH5Rb3JPI3I5hDdYkmXHynkmZveLVMgEvamJfk4ZoTxV
 455ck93Q4Uy4Dplk6KbIlILNjeDnXeOALQAr+EMm2w7esbYM1MXQwJL07RZyC3a8PC
 r6IChNjwxjWrnDpCQqitncbVzIp1/+teMx9UkYogdWehsTr36MPdPXs9rW8+TN5ikk
 DrthK/sVCVNwyb61SGU1O8VfoiKyx9IRxyzbrt8AIZDCQyUnMlUiq8X5sDcVy0hGB7
 Ic/j0hO7izM2U+HrAMP8ZSWAnfEv7yHgJTHY2+YJ53XCDPyAEP4bNbR/59iya6kYpo
 8I62492hug1vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D0C93C53BD0; Sun, 10 Sep 2023 11:56:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217896] New: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
 information: process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
Date: Sun, 10 Sep 2023 11:56:08 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217896-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217896

            Bug ID: 217896
           Summary: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
                    information: process Xwayland pid 2985 thread
                    Xwayland:cs0 pid 3129
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

I have been using this kernel for a few days, 6.5.2.
This version brings quite a lot of improvements, but I notice a issue with =
the
AMD video GPU.

Error:=20
dmesg -l err
[ 5788.382725] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_low time=
out,
signaled seq=3D480904, emitted seq=3D480906
[ 5788.383216] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process yandex_browser pid 3520 thread yandex_bro:cs0 pid 3533
[ 5789.881712] amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[ 5789.882217] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <gfx_v9_0> failed -110
[ 5789.882844] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* GPU Recovery Fail=
ed:
-110
[ 5800.316409] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_low time=
out,
signaled seq=3D480906, emitted seq=3D480909
[ 5800.317011] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
[ 5801.729521] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!

dmesg | grep RIP
[ 5800.392141] RIP: 0010:amdgpu_irq_put+0x49/0x70 [amdgpu]

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
    CPU(s) scaling MHz:  30%
    CPU max MHz:         4680,0000
    CPU min MHz:         400,0000
    BogoMIPS:            6596,80
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
pdpe1
                         gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc
cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4=
_1
sse
                         4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm
cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw =
ibs
ski
                         nit wdt tce topoext perfctr_core perfctr_nb bpext
perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmm=
call
fsg
                         sbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a
rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_l=
lc
cqm_oc
                         cup_llc cqm_mbm_total cqm_mbm_local clzero irperf
xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale
vmcb_clea
                         n flushbyasid decodeassists pausefilter pfthreshold
avic v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid
overfl
                         ow_recov succor smca fsrm
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
  Gather data sampling:  Not affected
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Not affected
  Retbleed:              Not affected
  Spec rstack overflow:  Mitigation; safe RET, no microcode
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via
prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user
pointer sanitization
  Spectre v2:            Mitigation; Retpolines, IBPB conditional, IBRS_FW,
STIBP always-on, RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Not affected
  Tsx async abort:       Not affected


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
01:00.1 Audio device: NVIDIA Corporation GA106 High Definition Audio Contro=
ller
(rev a1)
02:00.0 Network controller: MEDIATEK Corp. MT7921 802.11ax PCI Express Wire=
less
Network Adapter
03:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD
Controller PM9A1/PM9A3/980PRO
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c4)
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

lspci -s 04:00.0 -vv
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c4) (prog-if =
00
[VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 1722
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 62
        IOMMU group: 5
        Region 0: Memory at fe10000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at fe20000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at d000 [size=3D256]
        Region 5: Memory at fc500000 (32-bit, non-prefetchable) [size=3D512=
K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us=
, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrP=
rP-
LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not Supported, Ext=
Fmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
10BitTagReq- OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Reti=
mer+
2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0=
dB
preshoot
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable- Count=3D1/4 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable+ Count=3D4 Masked-
                Vector table: BAR=3D5 offset=3D00042000
                PBA: BAR=3D5 offset=3D00043000
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D010 <?>
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2b0 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable+, Smallest Translation Unit: 00
        Capabilities: [2c0 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00000100, Page Request Allocation:
00000000
        Capabilities: [2d0 v1] Process Address Space ID (PASID)
                PASIDCap: Exec+ Priv+, Max PASID Width: 10
                PASIDCtl: Enable- Exec- Priv-
        Capabilities: [400 v1] Data Link Feature <?>
        Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
        Capabilities: [440 v1] Lane Margining at the Receiver <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
