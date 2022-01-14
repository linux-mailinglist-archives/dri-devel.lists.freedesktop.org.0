Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9948F079
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 20:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83510E120;
	Fri, 14 Jan 2022 19:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616810E120
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:33:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F7C461EC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 895E0C36AE9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642188806;
 bh=V1TUbGDycWxslUq2VfpDk3Nct+Y6RP8ZAJ86YlOkcDI=;
 h=From:To:Subject:Date:From;
 b=DmzLWW/XjrYCgoOkfDpAbcQ2lREBjdeYZ2h0I1VNtyP+rJN/LLSxD9QZEAKRERFuB
 GoOtXFF041Bpqhw80UFR8vpdhjj9/yKTvabMaBzbwiGv+FafNuDB2Em0vN8VIJCsbJ
 MRkzedCn+JP8HINvXmLfwgtqqyHOgAuVgod/5GcCo6kMsqzpJgrZyWfWI6xZJWtfKx
 kKhkwRI3ovHSbF3K3Hcoli7nuku40v37Ccv7bUG3ajgwG+2FrtFQ5e3Q6ETiI4Nc+x
 bAfJgGSvoE2Fha3VF4uvy+Yz8TB6H+HVI4nFfagBG+abRhUO96ijmKepi5nSHCRWH6
 lbcuM75OdsjRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 70422CC13AA; Fri, 14 Jan 2022 19:33:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215494] New: [radeon, rv370] Running piglit
 shaders@glsl-vs-raytrace-bug26691 test causes hard lockup & reboot
Date: Fri, 14 Jan 2022 19:33:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-215494-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215494

            Bug ID: 215494
           Summary: [radeon, rv370] Running piglit
                    shaders@glsl-vs-raytrace-bug26691 test causes hard
                    lockup & reboot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: alexdeucher@gmail.com
        Regression: No

Created attachment 300268
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300268&action=3Dedit
kernel dmesg (kernel 5.16.0, Ryzen 9 5950X)

Running the piglit festsuite (git-11ee10ba04) for
https://gitlab.freedesktop.org/mesa/mesa/-/issues/3152 via './piglit run -1
quick -l verbose -s --dmesg' on a Radeon X600 causes the X600 to hard locku=
p &
reboot. On my system this happens with kernel 5.15.11, 5.16.0, mesa 21.3.4 =
and
mesa 22 (git-8b3d947267).

I had a closer look and found out that shaders@glsl-vs-raytrace-bug26691 ca=
uses
the lockup. Running "./piglit/bin/glsl-vs-raytrace-bug26691 -auto -fbo" as a
single test works sometimes the 1st time, but re-running it a 2nd or a 3rd =
time
always causes the lockup:

[...]
[  518.794824] radeon: wait for empty RBBM fifo failed! Bad things might
happen.
[  519.110152] Failed to wait GUI idle while programming pipes. Bad things
might happen.
[  519.111220] radeon 0000:07:00.0: Saved 59 dwords of commands on ring 0.
[  519.111247] radeon 0000:07:00.0: (r300_asic_reset:426)
RBBM_STATUS=3D0x8411C100
[  519.616733] radeon 0000:07:00.0: (r300_asic_reset:445)
RBBM_STATUS=3D0x8401C100
[  520.118160] radeon 0000:07:00.0: (r300_asic_reset:457)
RBBM_STATUS=3D0x8400C100
[  520.118231] radeon 0000:07:00.0: failed to reset GPU
[  520.319694] pcieport 0000:00:03.1: AER: Corrected error received:
0000:00:03.1
[  520.319723] pcieport 0000:00:03.1: PCIe Bus Error: severity=3DCorrected,
type=3DTransaction Layer, (Receiver ID)
[  520.319729] pcieport 0000:00:03.1:   device [1022:1483] error
status/mask=3D00002000/00004000
[  520.319735] pcieport 0000:00:03.1:    [13] NonFatalErr=20=20=20=20=20=20=
=20=20=20=20=20
[  520.722345] pcieport 0000:00:03.1: AER: Corrected error received:
0000:00:03.1


For regular desktop usage the X600 seems ok so far. Some data about the sys=
tem:

 $ inxi -b
System:
  Host: prototype Kernel: 5.16.0-Zen3 x86_64 bits: 64 Desktop: Openbox 3.6.=
1=20
  Distro: Gentoo Base System release 2.7=20
Machine:
  Type: Desktop Mobo: ASRock model: B450M Steel Legend=20
  serial: <superuser/root required> UEFI: American Megatrends v: P4.20=20
  date: 08/03/2021=20
CPU:
  Info: 16-Core AMD Ryzen 9 5950X [MT MCP] speed: 3685 MHz=20
  min/max: 2200/3400 MHz=20
Graphics:
  Device-1: AMD RV370 [Radeon X600/X600 SE] driver: radeon v: kernel=20
  Display: x11 server: X.Org 1.20.14 driver: ati,radeon=20
  unloaded: fbdev,modesetting resolution: 1920x1080~60Hz=20
  OpenGL: renderer: ATI RV370 v: 2.1 Mesa 22.0.0-devel (git-8b3d947267)=20
Network:
  Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet=20
  driver: r8169=20

 # lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Ro=
ot
Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Starship/Matisse IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:01.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:05.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 61)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 7
01:00.0 Non-Volatile memory controller: Sandisk Corp WD Blue SN550 NVMe SSD
(rev 01)
02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series Chips=
et
USB 3.1 XHCI Controller (rev 01)
02:00.1 SATA controller: Advanced Micro Devices, Inc. [AMD] 400 Series Chip=
set
SATA Controller (rev 01)
02:00.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Bridge (rev 01)
03:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
03:01.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
03:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset P=
CIe
Port (rev 01)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 15)
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
V370
[Radeon X600/X600 SE]
07:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV380
[Radeon X300/X550/X1050 Series] (Secondary)
08:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse PCIe Dummy Function
09:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse Reserved SPP
09:00.1 Encryption controller: Advanced Micro Devices, Inc. [AMD]
Starship/Matisse Cryptographic Coprocessor PSPCPP
09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller

 # lspci -s 07:00.0 -vv
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
V370
[Radeon X600/X600 SE] (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RV370 [Radeon
X600/X600 SE]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 59
        IOMMU group: 2
        Region 0: Memory at e8000000 (64-bit, prefetchable) [size=3D128M]
        Region 2: Memory at fce30000 (64-bit, non-prefetchable) [size=3D64K]
        Region 4: I/O ports at e000 [size=3D256]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <256=
ns,
L1 <4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE- FLReset-
SlotPowerLimit 75.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <2us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee01000  Data: 0022
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
                AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 04000001 0000200f 07070000 b8cdf5fd
        Kernel driver in use: radeon
        Kernel modules: radeon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
