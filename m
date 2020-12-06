Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C07D2D0570
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 15:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7071389DD3;
	Sun,  6 Dec 2020 14:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6797989DD3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 14:16:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210517] New: nouveau: DRM: failed to map fb: -28 (GeForce 6600
 LE, ppc64)
Date: Sun, 06 Dec 2020 14:16:56 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210517-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210517

            Bug ID: 210517
           Summary: nouveau: DRM: failed to map fb: -28 (GeForce 6600 LE,
                    ppc64)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10-rc6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 293963
  --> https://bugzilla.kernel.org/attachment.cgi?id=293963&action=edit
dmesg (kernel 5.10-rc6, PowerMac G5 11,2)

With kernel 5.10-rc6 I only get a blank screen at boot, as soon as the display
is switching from OpenFirmware to nouveau DRM. With kernel 5.9.12 this works
fine. Also 5.10-rc6 with a Radeon X1600 works fine.

 # grep nouveau dmesg_510-rc6_g5 
fb0: switching to nouveaufb from OFfb NVDA,Displ
nouveau 0000:0a:00.0: NVIDIA NV43 (043200a4)
nouveau 0000:0a:00.0: bios: version 05.43.02.75.00
nouveau 0000:0a:00.0: fb: 128 MiB DDR1
nouveau 0000:0a:00.0: DRM: VRAM: 124 MiB
nouveau 0000:0a:00.0: DRM: GART: 512 MiB
nouveau 0000:0a:00.0: DRM: TMDS table version 1.1
nouveau 0000:0a:00.0: DRM: DCB version 3.0
nouveau 0000:0a:00.0: DRM: DCB outp 00: 01000100 00000028
nouveau 0000:0a:00.0: DRM: DCB outp 01: 03000102 00000000
nouveau 0000:0a:00.0: DRM: DCB outp 02: 04011210 00000028
nouveau 0000:0a:00.0: DRM: DCB outp 03: 02111212 02000100
nouveau 0000:0a:00.0: DRM: DCB outp 04: 02011211 0020c070
nouveau 0000:0a:00.0: DRM: DCB conn 00: 1030
nouveau 0000:0a:00.0: DRM: DCB conn 01: 2130
nouveau 0000:0a:00.0: DRM: failed to initialise sync subsystem, -28
nouveau 0000:0a:00.0: DRM: Setting dpms mode 3 on TV encoder (output 4)
nouveau 0000:0a:00.0: DRM: failed to map fb: -28
[drm] Initialized nouveau 1.3.1 20120801 for 0000:0a:00.0 on minor 0

 # grep nouveau dmesg_5912_g5 
fb0: switching to nouveaufb from OFfb NVDA,Displ
nouveau 0000:0a:00.0: NVIDIA NV43 (043200a4)
nouveau 0000:0a:00.0: bios: version 05.43.02.75.00
nouveau 0000:0a:00.0: fb: 128 MiB DDR1
nouveau 0000:0a:00.0: DRM: VRAM: 124 MiB
nouveau 0000:0a:00.0: DRM: GART: 512 MiB
nouveau 0000:0a:00.0: DRM: TMDS table version 1.1
nouveau 0000:0a:00.0: DRM: DCB version 3.0
nouveau 0000:0a:00.0: DRM: DCB outp 00: 01000100 00000028
nouveau 0000:0a:00.0: DRM: DCB outp 01: 03000102 00000000
nouveau 0000:0a:00.0: DRM: DCB outp 02: 04011210 00000028
nouveau 0000:0a:00.0: DRM: DCB outp 03: 02111212 02000100
nouveau 0000:0a:00.0: DRM: DCB outp 04: 02011211 0020c070
nouveau 0000:0a:00.0: DRM: DCB conn 00: 1030
nouveau 0000:0a:00.0: DRM: DCB conn 01: 2130
nouveau 0000:0a:00.0: DRM: MM: using M2MF for buffer copies
nouveau 0000:0a:00.0: DRM: Setting dpms mode 3 on TV encoder (output 4)
nouveau 0000:0a:00.0: DRM: allocated 1680x1050 fb: 0x9000, bo 000000004e24135e
nouveau 0000:0a:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[drm] Initialized nouveau 1.3.1 20120801 for 0000:0a:00.0 on minor 0


Some data about the card:
 # lspci -v -s 0000:0a:00.0
0000:0a:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600
LE] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation NV43 [GeForce 6600 LE]
        Device tree node:
/sys/firmware/devicetree/base/pci@0,f0000000/NVDA,Parent@0
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at b8000000 (64-bit, prefetchable) [size=128M]
        Memory at b1000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at b0000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Kernel modules: nouveau


Some data about the machine:
 # inxi -b --no-host
System:    Kernel: 5.9.12-gentoo-PowerMacG5 ppc64 bits: 64 Desktop: MATE 1.24.1
Distro: Gentoo Base System release 2.7 
Machine:   Type: PowerPC Device System: PowerMac11 2 details: PowerMac11 2 rev:
1.1 (pvr 0044 0101) serial: R6V 
CPU:       Info: Dual Core PPC970MP altivec supported [MCP] speed: 2300 MHz
min/max: 1150/2300 MHz 
Graphics:  Device-1: NVIDIA NV43 [GeForce 6600 LE] driver: N/A 
           Device-2: Advanced Micro Devices [AMD/ATI] RV530 [Radeon X1600 PRO]
driver: radeon v: kernel 
           Display: x11 server: X.Org 1.20.8 driver: ati,radeon resolution:
1680x1050~60Hz 
           OpenGL: renderer: ATI RV530 v: 2.1 Mesa 20.3.0 
Network:   Device-1: Broadcom and subsidiaries NetXtreme BCM5780 Gigabit
Ethernet driver: tg3 
           Device-2: Broadcom and subsidiaries NetXtreme BCM5780 Gigabit
Ethernet driver: tg3 
           Device-3: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
