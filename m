Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605935A993
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A6E6EC67;
	Sat, 10 Apr 2021 00:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453F36EC67
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:38:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12FB06101E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618015117;
 bh=ii0y09Jk4ZqlL/a2PcVueDMc2wPxoPIUa+69ldGgksM=;
 h=From:To:Subject:Date:From;
 b=d+6G+nVL/W5O/713IPEllMKrJ8vzNawG+0K74nrRLFVSgVFZ1yuV4nNSHGANJyri6
 12K8q/xBqm6tvrmeZyrhH+stRv8JEHZhypVTElIvxEnF7Vpv2odW7ljpKIt7fh1REM
 rnw2XZ9nmKeGivCmVOnaTKcXzwd6Pi0r4xyndwjkWSCe29eVY562lZmeSu2FSNC07V
 qhbNAznGE7L8f+95Da2AWDBz0dCu+dVtjN9snN6JvHuWOutXFN7VlexGqYrqfOr2vD
 4xO2DjyG/PV2AEEj/SnU+ZSl8caERagHoWG+udrOaajJ91cCOqtFvxh8qm7qvVqxm/
 fkOj7yor6r3+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 05ED36113C; Sat, 10 Apr 2021 00:38:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212635] New: nouveau 0000:04:00.0: fifo: fault 00 [READ] at
 0000000000380000 engine 00 [GR] client 14 [HUB/SCC] reason 02 [PTE] on
 channel 5 [007fabf000 X[570]]
Date: Sat, 10 Apr 2021 00:38:36 +0000
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
Message-ID: <bug-212635-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212635

            Bug ID: 212635
           Summary: nouveau 0000:04:00.0: fifo: fault 00 [READ] at
                    0000000000380000 engine 00 [GR] client 14 [HUB/SCC]
                    reason 02 [PTE] on channel 5 [007fabf000 X[570]]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 296315
  --> https://bugzilla.kernel.org/attachment.cgi?id=296315&action=edit
dmesg (kernel 5.11.12)

Happened during browsing on Firefox, WebGL conformance tests were running in
the background
(https://www.khronos.org/registry/webgl/sdk/tests/webgl-conformance-tests.html?version=2.0.1).
The screen went blank, but I got to desktop back again and the machine stayed
usable.

[...]
nouveau 0000:04:00.0: fifo: fault 00 [READ] at 0000000000380000 engine 00 [GR]
client 14 [HUB/SCC] reason 02 [PTE] on channel 5 [007fabf000 X[570]]
nouveau 0000:04:00.0: fifo: channel 5: killed
nouveau 0000:04:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:04:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:04:00.0: X[570]: channel 5 killed!
nouveau 0000:04:00.0: fifo: fault 00 [READ] at 0000000000380000 engine 00 [GR]
client 14 [HUB/SCC] reason 02 [PTE] on channel 5 [007fabf000 X[570]]
nouveau 0000:04:00.0: fifo: channel 5: killed
nouveau 0000:04:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:04:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:04:00.0: X[570]: channel 5 killed!
nouveau 0000:04:00.0: fifo: fault 00 [READ] at 0000000000380000 engine 00 [GR]
client 14 [HUB/SCC] reason 02 [PTE] on channel 5 [007fabf000 X[570]]
nouveau 0000:04:00.0: fifo: channel 5: killed
nouveau 0000:04:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:04:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:04:00.0: X[570]: channel 5 killed!
nouveau 0000:04:00.0: fifo: fault 00 [READ] at 0000000000380000 engine 00 [GR]
client 14 [HUB/SCC] reason 02 [PTE] on channel 5 [007fabf000 X[570]]
nouveau 0000:04:00.0: fifo: channel 5: killed
nouveau 0000:04:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:04:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:04:00.0: X[570]: channel 5 killed!


 # inxi -b
System:    Kernel: 5.11.12-gentoo-Excavator x86_64 bits: 64 Desktop: MATE
1.24.0 
           Distro: Gentoo Base System release 2.7 
Machine:   Type: Desktop Mobo: ASRock model: A320M-HDV R3.0 serial:
M80-BA024200938 UEFI: American Megatrends v: P3.10 
           date: 06/26/2019 
CPU:       Info: Quad Core AMD A10-9700E RADEON R7 10 COMPUTE CORES 4C+6G [MCP]
speed: 3300 MHz min/max: 800/3000 MHz 
Graphics:  Device-1: NVIDIA GK208B [GeForce GT 710] driver: nouveau v: kernel 
           Display: x11 server: X.Org 1.20.10 driver: modesetting resolution:
1920x1080~60Hz 
           OpenGL: renderer: NV106 v: 4.3 Mesa 20.3.5 
Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169 

 # lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Family 15h (Models 60h-6fh)
I/O Memory Management Unit
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Host Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Root Port
00:02.5 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Root Port
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Host Bridge
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Root Port
00:08.0 Encryption controller: Advanced Micro Devices, Inc. [AMD] Carrizo
Platform Security Processor
00:09.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Carrizo Audio Dummy
Host Bridge
00:09.2 Audio device: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Audio Controller
00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 20)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller
[AHCI mode] (rev 49)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 49)
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 4a)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 11)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
60h-6fh) Processor Function 5
01:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 43bc (rev 02)
01:00.1 SATA controller: Advanced Micro Devices, Inc. [AMD] Device 43b8 (rev
02)
01:00.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 43b3 (rev 02)
02:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 300 Series Chipset PCIe
Port (rev 02)
02:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 300 Series Chipset PCIe
Port (rev 02)
02:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 300 Series Chipset PCIe
Port (rev 02)
04:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710]
(rev a1)
04:00.1 Audio device: NVIDIA Corporation GK208 HDMI/DP Audio Controller (rev
a1)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411
PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 Non-Volatile memory controller: Sandisk Corp WD Black 2019/PC SN750
NVMe SSD
07:00.0 USB controller: ASMedia Technology Inc. ASM2142 USB 3.1 Host Controller

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
