Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5144118C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 01:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441C2896E9;
	Mon,  1 Nov 2021 00:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81468896E9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 00:02:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D6FB610A2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 00:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635724959;
 bh=jiiHEB+8ZMc+7FOuHRWEOvRdkmxbqZYSs1NK9d5aK+E=;
 h=From:To:Subject:Date:From;
 b=PybuITC+p0N5yPbbCuZhIdNnlxhaMavsBM8jMVzF8V+8r0tiDWt45MqhCrWHeF3ek
 /6s+9baCii76xIPRdUFR2J98fn1uddVCi52KekSX1go+DsFOKX02IBwRb3JPCoDMd1
 83erjxBR185ZWuBhL1D2xO4XC831gpGlV49HOSbqtYDY8kvICiglsHwAkPkLDe1puR
 U2oi5+XuMk4Qed7Wvf2Qu5XfHYjAYAh4lU2bsBiC9Iu5LAe6x2vYfsnuw5NfmZdLnl
 7GbnuHze1hFiOWgBEdIXUDxbCiLlghCJduGH0efXChIKjmaefp5L9qSQ8TaEwcbCyR
 lkwQNwJyt5n6g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 46F0260F14; Mon,  1 Nov 2021 00:02:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] New: amdgpu freezes HP laptop at start up
Date: Mon, 01 Nov 2021 00:02:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

            Bug ID: 214901
           Summary: amdgpu freezes HP laptop at start up
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: spasswolf@web.de
        Regression: No

Nov  1 00:22:49 bart kernel: [    2.139660] Oops: 0000 [#1] PREEMPT SMP NOP=
TI
Nov  1 00:22:49 bart kernel: [    2.139665] CPU: 3 PID: 113 Comm: systemd-u=
devd
Not tainted 5.15.0 #1
Nov  1 00:22:49 bart kernel: [    2.139671] Hardware name: HP HP Laptop
15-bw0xx/8332, BIOS F.21 11/17/2017
Nov  1 00:22:49 bart kernel: [    2.139675] RIP:
0010:smu8_dpm_powergate_acp+0x7/0x30 [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.140165] Code: fd ff 8b 54 24 0c 48 8b 3=
c 24
31 c9 be 13 00 00 00 e8 7d fe fd ff 31 c0 48 83 c4 10 c3 66 0f 1f 44 00 00 =
48
8b 87 c0 01 00 00 <40> 38 b0 db 01 00 00 74 1b 31 d2 40 84 f6 74 0a be 0b 0=
0 00
00 e9
Nov  1 00:22:49 bart kernel: [    2.140173] RSP: 0018:ffffafc6804d7bf0 EFLA=
GS:
00010286
Nov  1 00:22:49 bart kernel: [    2.140177] RAX: 0000000000000000 RBX:
ffff97d209b00000 RCX: 000000000000000a
Nov  1 00:22:49 bart kernel: [    2.140181] RDX: 0000000000000000 RSI:
0000000000000000 RDI: ffff97d384c89000
Nov  1 00:22:49 bart kernel: [    2.140184] RBP: ffff97d384c89000 R08:
0000000000000282 R09: ffffeb368a132200
Nov  1 00:22:49 bart kernel: [    2.140188] R10: 0000000000000000 R11:
0000000000000001 R12: 0000000000000009
Nov  1 00:22:49 bart kernel: [    2.140191] R13: ffff97d209b00010 R14:
ffff97d209b00000 R15: 0000000000000000
Nov  1 00:22:49 bart kernel: [    2.140195] FS:  00007f285ce788c0(0000)
GS:ffff97d4ef580000(0000) knlGS:0000000000000000
Nov  1 00:22:49 bart kernel: [    2.140200] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov  1 00:22:49 bart kernel: [    2.140203] CR2: 00000000000001db CR3:
0000000107d3e000 CR4: 00000000001506e0
Nov  1 00:22:49 bart kernel: [    2.140207] Call Trace:
Nov  1 00:22:49 bart kernel: [    2.140214]=20
pp_set_powergating_by_smu+0x1bb/0x280 [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.140560]  acp_hw_fini+0x13c/0x140 [amdgp=
u]
Nov  1 00:22:49 bart kernel: [    2.140893]  amdgpu_device_fini_hw+0x208/0x=
2d5
[amdgpu]
Nov  1 00:22:49 bart kernel: [    2.141294]=20
amdgpu_driver_load_kms.cold+0x72/0x94 [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.141641]  amdgpu_pci_probe+0x127/0x1b0
[amdgpu]
Nov  1 00:22:49 bart kernel: [    2.141941]  pci_device_probe+0xf5/0x160
Nov  1 00:22:49 bart kernel: [    2.141948]  really_probe+0x1f0/0x400
Nov  1 00:22:49 bart kernel: [    2.141954]  __driver_probe_device+0xf9/0x1=
70
Nov  1 00:22:49 bart kernel: [    2.141958]  driver_probe_device+0x27/0xa0
Nov  1 00:22:49 bart kernel: [    2.141961]  __driver_attach+0xbd/0x1d0
Nov  1 00:22:49 bart kernel: [    2.141964]  ? __device_attach_driver+0xe0/=
0xe0
Nov  1 00:22:49 bart kernel: [    2.141968]  ? __device_attach_driver+0xe0/=
0xe0
Nov  1 00:22:49 bart kernel: [    2.141971]  bus_for_each_dev+0x75/0xc0
Nov  1 00:22:49 bart kernel: [    2.141974]  ? klist_add_tail+0x4f/0x90
Nov  1 00:22:49 bart kernel: [    2.141979]  bus_add_driver+0x143/0x200
Nov  1 00:22:49 bart kernel: [    2.141982]  driver_register+0x86/0xd0
Nov  1 00:22:49 bart kernel: [    2.141985]  ? 0xffffffffc0ae8000
Nov  1 00:22:49 bart kernel: [    2.141988]  do_one_initcall+0x47/0x170
Nov  1 00:22:49 bart kernel: [    2.142030]  ? kmem_cache_alloc+0x280/0x3a0
Nov  1 00:22:49 bart kernel: [    2.142037]  do_init_module+0x51/0x220
Nov  1 00:22:49 bart kernel: [    2.142043]  __do_sys_finit_module+0xca/0x1=
40
Nov  1 00:22:49 bart kernel: [    2.142049]  do_syscall_64+0x3b/0xc0
Nov  1 00:22:49 bart kernel: [    2.142067]=20
entry_SYSCALL_64_after_hwframe+0x44/0xae
Nov  1 00:22:49 bart kernel: [    2.142073] RIP: 0033:0x7f285ccbb5e9
Nov  1 00:22:49 bart kernel: [    2.142077] Code: 00 c3 66 2e 0f 1f 84 00 0=
0 00
00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 =
4c
8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 58 0c 00 f7 d8 6=
4 89
01 48
Nov  1 00:22:49 bart kernel: [    2.142084] RSP: 002b:00007ffd135b22b8 EFLA=
GS:
00000246 ORIG_RAX: 0000000000000139
Nov  1 00:22:49 bart kernel: [    2.142089] RAX: ffffffffffffffda RBX:
000055ee3452a270 RCX: 00007f285ccbb5e9
Nov  1 00:22:49 bart kernel: [    2.142092] RDX: 0000000000000000 RSI:
00007f285ce6fe2d RDI: 000000000000000f
Nov  1 00:22:49 bart kernel: [    2.142105] RBP: 0000000000020000 R08:
0000000000000000 R09: 000055ee34525f10
Nov  1 00:22:49 bart kernel: [    2.142109] R10: 000000000000000f R11:
0000000000000246 R12: 00007f285ce6fe2d
Nov  1 00:22:49 bart kernel: [    2.142112] R13: 0000000000000000 R14:
000055ee34528600 R15: 000055ee3452a270
Nov  1 00:22:49 bart kernel: [    2.142116] Modules linked in: ahci
crct10dif_pclmul crct10dif_common libahci crc32_pclmul crc32c_intel xhci_pci
ehci_pci psmouse amdgpu(+) libata scsi_mod scsi_common ehci_hcd xhci_hcd
usbcore i2c_piix4 usb_common r8169 realtek mdio_devres drm_ttm_helper libphy
ttm mfd_core gpu_sched
Nov  1 00:22:49 bart kernel: [    2.142146] CR2: 00000000000001db
Nov  1 00:22:49 bart kernel: [    2.142160] ---[ end trace 175b07c8f6d66881
]---


Booting continues and later another Oops appears


Nov  1 00:22:49 bart kernel: [    2.947122] Oops: 0002 [#2] PREEMPT SMP NOP=
TI
Nov  1 00:22:49 bart kernel: [    2.947127] CPU: 3 PID: 39 Comm: kworker/3:1
Tainted: G      D           5.15.0 #1
Nov  1 00:22:49 bart kernel: [    2.947134] Hardware name: HP HP Laptop
15-bw0xx/8332, BIOS F.21 11/17/2017
Nov  1 00:22:49 bart kernel: [    2.947137] Workqueue: events
amdgpu_uvd_idle_work_handler [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.947597] RIP:
0010:smu8_dpm_powergate_uvd+0xe/0xc0 [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.947942] Code: 7e cb e9 ad fd ff ff b8 f=
4 ff
ff ff eb d9 e8 a9 16 64 db 66 0f 1f 84 00 00 00 00 00 55 48 8b 87 c0 01 00 =
00
40 84 f6 48 89 fd <40> 88 b0 d8 01 00 00 74 37 48 8b 3f 31 d2 be 08 00 00 0=
0 e8
ba a5
Nov  1 00:22:49 bart kernel: [    2.947948] RSP: 0018:ffffafc6801afe38 EFLA=
GS:
00010202
Nov  1 00:22:49 bart kernel: [    2.947952] RAX: 0000000000000000 RBX:
0000000000000000 RCX: 0000000100000000
Nov  1 00:22:49 bart kernel: [    2.947955] RDX: 0000000000000001 RSI:
0000000000000001 RDI: ffff97d384c89000
Nov  1 00:22:49 bart kernel: [    2.947958] RBP: ffff97d384c89000 R08:
ffff97d4ef59dca0 R09: ffff97d4ef535eb4
Nov  1 00:22:49 bart kernel: [    2.947960] R10: 0000000000000007 R11:
0000000000000005 R12: ffff97d384c89018
Nov  1 00:22:49 bart kernel: [    2.947963] R13: 0000000000000001 R14:
ffff97d209b082f8 R15: ffff97d4ef5a1d05
Nov  1 00:22:49 bart kernel: [    2.947966] FS:  0000000000000000(0000)
GS:ffff97d4ef580000(0000) knlGS:0000000000000000
Nov  1 00:22:49 bart kernel: [    2.947970] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov  1 00:22:49 bart kernel: [    2.947972] CR2: 00000000000001d8 CR3:
0000000107d44000 CR4: 00000000001506e0
Nov  1 00:22:49 bart kernel: [    2.947975] Call Trace:
Nov  1 00:22:49 bart kernel: [    2.947981]=20
pp_set_powergating_by_smu+0xdd/0x280 [amdgpu]
Nov  1 00:22:49 bart kernel: [    2.948380]  amdgpu_dpm_enable_uvd+0x79/0x1=
a0
[amdgpu]
Nov  1 00:22:49 bart kernel: [    2.948715]  process_one_work+0x1c0/0x330
Nov  1 00:22:49 bart kernel: [    2.948723]  worker_thread+0x4b/0x3c0
Nov  1 00:22:49 bart kernel: [    2.948727]  ? rescuer_thread+0x360/0x360
Nov  1 00:22:49 bart kernel: [    2.948730]  kthread+0x12d/0x160
Nov  1 00:22:49 bart kernel: [    2.948734]  ? set_kthread_struct+0x30/0x30
Nov  1 00:22:49 bart kernel: [    2.948738]  ret_from_fork+0x22/0x30
Nov  1 00:22:49 bart kernel: [    2.948743] Modules linked in: efivarfs aut=
ofs4
ext4 crc32c_generic crc16 mbcache jbd2 sd_mod t10_pi sr_mod crc_t10dif cdrom
crct10dif_generic ahci crct10dif_pclmul crct10dif_common libahci crc32_pclm=
ul
crc32c_intel xhci_pci ehci_pci psmouse amdgpu(+) libata scsi_mod scsi_common
ehci_hcd xhci_hcd usbcore i2c_piix4 usb_common r8169 realtek mdio_devres
drm_ttm_helper libphy ttm mfd_core gpu_sched
Nov  1 00:22:49 bart kernel: [    2.948794] CR2: 00000000000001d8
Nov  1 00:22:49 bart kernel: [    2.948798] ---[ end trace 175b07c8f6d66882
]---
Nov  1 00:22:49 bart kernel: [    2.948801] RIP:
0010:smu8_dpm_powergate_acp+0x7/0x30 [amdgpu]

This error also occurs using 5.15-rc7.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
