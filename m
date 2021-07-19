Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98B3CD5B0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531F89E9B;
	Mon, 19 Jul 2021 13:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0D89F41
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:29:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6ED856100C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626701377;
 bh=peTJYXhTaPw6bIjk5tLPx5fDB34mo8bQAUAi654S7/U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZVnCdTBycZhKOwIjqj55Txp2cxmTN3+47XuM3VPeJTnj2BlXi+/9MRgv7jDGdrolU
 tjdJit/c0iieXNosG9di+zRPRq+1E0lmPsj+FkYTYSPHl5DWh93GMIMcPe4S31SLXH
 /L00PZ+gRZpcu6Myhvj6byU5Qwb5H2OJqw1sc5DeSPTd2MF3lTsrt09AjHhTeOKqr0
 MkKSzA/Mg5Fk9D+n7dVu2D6IKmZgBBmq5Z/uGy1+7Xjt+YL1a+rGXqKKFzkkyB5woa
 H+EMS+0BpjYXc2VhybWUu4pPHRxweeLeFx/zqvzD047lmn1jjr6OgEzdZQTghQB04Y
 wPveqLgqBXiYw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 667C961186; Mon, 19 Jul 2021 13:29:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 19 Jul 2021 13:29:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213201-2300-Mgi1rriqLM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297921
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297921&action=3Dedit
output of /sys/kernel/debug/kmemleak (kernel 5.14-rc2)

Looking slightly different on kernel v5.14-rc2 on another board w. another =
CPU
(ASRock A88M-G/3.1 w. AMD A10-8750)

[...]
unreferenced object 0xffff888142247988 (size 56):
  comm "systemd-udevd", pid 206, jiffies 4294882633 (age 2086.390s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 0d 01 70 00 00 00 00 00  ..........p.....
    13 5e 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .^..............
  backtrace:
    [<ffffffffa93fc402>] kmem_cache_alloc+0x10a/0x1e3
    [<ffffffffa9a5d413>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffffa9a5a5ad>] acpi_ps_create_op+0x4b1/0x8ec
    [<ffffffffa9a590b8>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffffa9a5c360>] acpi_ps_parse_aml+0x1cd/0x6fa
    [<ffffffffa9a5de90>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffffa9a4da85>] acpi_ns_evaluate+0x64c/0x886
    [<ffffffffa9a55a32>] acpi_evaluate_object+0x335/0x690
    [<ffffffffc115f531>] amdgpu_atcs_call.constprop.0+0x141/0x1bd [amdgpu]
    [<ffffffffc115fa8a>] amdgpu_atcs_pci_probe_handle.isra.0+0x147/0x2a1
[amdgpu]
    [<ffffffffc1160a9a>] amdgpu_acpi_detect+0xd1/0x38e [amdgpu]
    [<ffffffffc1cb30aa>] hid_lookup_collection+0xaa/0x176 [hid]
    [<ffffffffa90017dc>] do_one_initcall+0x159/0x31d
    [<ffffffffa91d0584>] do_init_module+0x1ae/0x573
    [<ffffffffa91d5b2b>] load_module+0x5063/0x5f46
    [<ffffffffa91d6ccc>] __do_sys_finit_module+0xf6/0x145
unreferenced object 0xffff888142246338 (size 56):
  comm "systemd-udevd", pid 206, jiffies 4294882633 (age 2086.390s)
  hex dump (first 32 bytes):
    88 79 24 42 81 88 ff ff 0d 01 2d 00 00 00 00 00  .y$B......-.....
    14 5e 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .^..............
  backtrace:
    [<ffffffffa93fc402>] kmem_cache_alloc+0x10a/0x1e3
    [<ffffffffa9a5d413>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffffa9a5a5ad>] acpi_ps_create_op+0x4b1/0x8ec
    [<ffffffffa9a590b8>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffffa9a5c360>] acpi_ps_parse_aml+0x1cd/0x6fa
    [<ffffffffa9a5de90>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffffa9a4da85>] acpi_ns_evaluate+0x64c/0x886
    [<ffffffffa9a55a32>] acpi_evaluate_object+0x335/0x690
    [<ffffffffc115f531>] amdgpu_atcs_call.constprop.0+0x141/0x1bd [amdgpu]
    [<ffffffffc115fa8a>] amdgpu_atcs_pci_probe_handle.isra.0+0x147/0x2a1
[amdgpu]
    [<ffffffffc1160a9a>] amdgpu_acpi_detect+0xd1/0x38e [amdgpu]
    [<ffffffffc1cb30aa>] hid_lookup_collection+0xaa/0x176 [hid]
    [<ffffffffa90017dc>] do_one_initcall+0x159/0x31d
    [<ffffffffa91d0584>] do_init_module+0x1ae/0x573
    [<ffffffffa91d5b2b>] load_module+0x5063/0x5f46
    [<ffffffffa91d6ccc>] __do_sys_finit_module+0xf6/0x145


 # inxi -bZ
System:    Host: yea Kernel: 5.14.0-rc2-bdver3 x86_64 bits: 64 Desktop: MATE
1.24.1=20
           Distro: Gentoo Base System release 2.7=20
Machine:   Type: Desktop Mobo: ASRock model: A88M-G/3.1 serial: N/A=20
           UEFI: American Megatrends v: P1.40C date: 11/21/2016=20
CPU:       Info: Quad Core AMD A10-8750 Radeon R7 12 Compute Cores 4C+8G [M=
CP]
speed: 1809 MHz=20
           min/max: 1400/3500 MHz=20
Graphics:  Device-1: AMD Kaveri [Radeon R7 Graphics] driver: amdgpu v: kern=
el=20
           Display: x11 server: X.Org 1.20.11 driver: amdgpu,ati unloaded:
fbdev,modesetting=20
           resolution: 1920x1080~60Hz=20
           OpenGL: renderer: AMD KAVERI (DRM 3.42.0 5.14.0-rc2-bdver3 LLVM
12.0.0)=20
           v: 4.6 Mesa 21.1.4=20
Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
