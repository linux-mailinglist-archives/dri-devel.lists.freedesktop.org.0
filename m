Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D2390A23
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 21:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7526EAD4;
	Tue, 25 May 2021 19:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F258F6EAD4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 19:58:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C80886124C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621972734;
 bh=GlRdBfG5HwRRrV//jD4ZPfF0ZDpMD98zMf59swiBhws=;
 h=From:To:Subject:Date:From;
 b=T9k6hU2Tuenk31dBYlGKYCS0SND2Qu9K+JB4zx/LKsOzj9dtAmhHBganXEX4MjLgM
 iWElQt9TWWt6Qmx92oSa6oH7m2C9G3sDcKeXBeGA8Q5QMtSJENQvbghHk36rU+qsdq
 4S80ci0snFEB29FNKGBnesolrNlKhWPDX9ezi7bf1oird0efvRBy2dRImXU5aiB/jD
 RR8Z5oCJw0ExpXRTi8EZUxOn7xU7FC0MMbcTukNjiIpZugOit2k59LqRrcMAow0vhF
 hvYR0c9HNJpQd6ePS2eeZQ+TUSwN27UO++RuW0l4ZgvLBfbjOhkNwy6EifpuismeQS
 B0+I/nrX3QdZw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BEEB46113C; Tue, 25 May 2021 19:58:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213211] New: kernel BUG at drivers/gpu/drm/qxl/qxl_display.c:293!
Date: Tue, 25 May 2021 19:58:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ne-vlezay80@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213211-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213211

            Bug ID: 213211
           Summary: kernel BUG at drivers/gpu/drm/qxl/qxl_display.c:293!
           Product: Drivers
           Version: 2.5
    Kernel Version: 4.12.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ne-vlezay80@yandex.ru
        Regression: No

[   77.102746] ------------[ cut here ]------------
[   77.102768] kernel BUG at drivers/gpu/drm/qxl/qxl_display.c:293!
[   77.102866] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[   77.102894] CPU: 2 PID: 503 Comm: Xorg Tainted: G           OE=20=20=20=
=20
5.12.6-arch1-1 #1
[   77.102906] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.10.2-1 04/01/2014
[   77.102919] RIP: 0010:qxl_crtc_update_monitors_config+0x33f/0x360 [qxl]
[   77.102953] Code: 5c 41 5d 41 5e 41 5f e9 af 3b 00 00 44 8b 69 10 45 85 =
ed
74 23 45 31 ed 45 31 ff 45 31 c9 48 c7 c0 68 f6 8c c0 e9 a4 fd ff ff <0f> 0=
b 48
89 f2 48 c7 c6 6c f6 8c c0 eb a6 45 31 c9 45 31 ff e9 d0
[   77.102956] RSP: 0018:ffffb6258101b8f0 EFLAGS: 00010246
[   77.102963] RAX: ffffb62580626000 RBX: 0000000000000000 RCX:
0000000000000001
[   77.102965] RDX: 0000000000000004 RSI: ffffffffc08cef28 RDI:
0000000000000000
[   77.102966] RBP: ffff88f483c9e000 R08: 0000000000000300 R09:
0000000000000000
[   77.102968] R10: 0000000000000001 R11: 0000000000000001 R12:
0000000000000000
[   77.102969] R13: 0000000000000400 R14: 0000000000000300 R15:
0000000000000000
[   77.102972] FS:  00007fc01a95d940(0000) GS:ffff88f4bed00000(0000)
knlGS:0000000000000000
[   77.102974] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.102976] CR2: 00007fe4e72df9a0 CR3: 00000000146ac000 CR4:
00000000000406e0
[   77.102979] Call Trace:
[   77.103000]  drm_atomic_helper_commit_planes+0x1bc/0x220 [drm_kms_helper]
[   77.103086]  drm_atomic_helper_commit_tail+0x42/0x80 [drm_kms_helper]
[   77.103108]  commit_tail+0xce/0x120 [drm_kms_helper]
[   77.103131]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[   77.103163]  drm_client_modeset_commit_atomic+0x1fc/0x240 [drm]
[   77.103303]  drm_client_modeset_commit_locked+0x56/0x150 [drm]
[   77.103340]  drm_fb_helper_set_par+0x75/0xd0 [drm_kms_helper]
[   77.103366]  fb_set_var+0x1d3/0x390
[   77.103415]  ? kvm_sched_clock_read+0x14/0x40
[   77.103435]  ? sched_clock+0x5/0x10
[   77.103440]  ? sched_clock_cpu+0xc/0xb0
[   77.103454]  fbcon_blank+0x186/0x280
[   77.103466]  do_unblank_screen+0xaa/0x150
[   77.103485]  vt_ioctl+0xdf4/0x13c0
[   77.103491]  ? restore_sigcontext+0x167/0x1d0
[   77.103496]  tty_ioctl+0x377/0x930
[   77.103515]  ? mntput_no_expire+0x4a/0x270
[   77.103527]  ? call_rcu+0x9c/0x290
[   77.103534]  __x64_sys_ioctl+0x82/0xb0
[   77.103547]  do_syscall_64+0x33/0x40
[   77.103578]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   77.103589] RIP: 0033:0x7fc01a7b559b
[   77.103597] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 =
e0
41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a5 a8 0c 00 f7 d8 64 89 01 48
[   77.103599] RSP: 002b:00007ffd1ef648f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   77.103602] RAX: ffffffffffffffda RBX: 000055c2aa426d20 RCX:
00007fc01a7b559b
[   77.103604] RDX: 0000000000000000 RSI: 0000000000004b3a RDI:
000000000000000c
[   77.103605] RBP: 0000000000000001 R08: 0000000000000000 R09:
00000000000a0000
[   77.103607] R10: 00007fc01a9f8ba0 R11: 0000000000000246 R12:
00007ffd1ef64990
[   77.103608] R13: 00000000000000bf R14: 0000000000000008 R15:
0000000000000005
[   77.103615] Modules linked in: tcp_bbr tun edac_mce_amd kvm_amd qxl ccp
snd_intel8x0 squashfs drm_ttm_helper ttm ppdev drm_kms_helper kvm loop
irqbypass snd_ac97_codec crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel ac97_bus snd_pcm snd_timer lzo_rle snd cec joydev syscopyarea
psmouse mousedev pcspkr sysfillrect crypto_simd cryptd mac_hid sysimgblt
fb_sys_fops soundcore parport_pc parport qemu_fw_cfg i2c_piix4 intel_agp
intel_gtt zram sg vhba(OE) drm fuse agpgart bpf_preload ip_tables x_tables
btrfs blake2b_generic libcrc32c crc32c_generic xor raid6_pq sr_mod cdrom
ata_generic pata_acpi virtio_net net_failover failover virtio_blk virtio_rng
virtio_input rng_core serio_raw atkbd libps2 crc32c_intel i8042 virtio_pci
virtio_pci_modern_dev ata_piix floppy serio
[   77.103884] ---[ end trace e0e0313ab8fbe380 ]---
[   77.103890] RIP: 0010:qxl_crtc_update_monitors_config+0x33f/0x360 [qxl]
[   77.103897] Code: 5c 41 5d 41 5e 41 5f e9 af 3b 00 00 44 8b 69 10 45 85 =
ed
74 23 45 31 ed 45 31 ff 45 31 c9 48 c7 c0 68 f6 8c c0 e9 a4 fd ff ff <0f> 0=
b 48
89 f2 48 c7 c6 6c f6 8c c0 eb a6 45 31 c9 45 31 ff e9 d0
[   77.103898] RSP: 0018:ffffb6258101b8f0 EFLAGS: 00010246
[   77.103900] RAX: ffffb62580626000 RBX: 0000000000000000 RCX:
0000000000000001
[   77.103902] RDX: 0000000000000004 RSI: ffffffffc08cef28 RDI:
0000000000000000
[   77.103903] RBP: ffff88f483c9e000 R08: 0000000000000300 R09:
0000000000000000
[   77.103904] R10: 0000000000000001 R11: 0000000000000001 R12:
0000000000000000
[   77.103909] R13: 0000000000000400 R14: 0000000000000300 R15:
0000000000000000
[   77.103913] FS:  00007fc01a95d940(0000) GS:ffff88f4bed00000(0000)
knlGS:0000000000000000
[   77.103915] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.103916] CR2: 00007fe4e72df9a0 CR3: 00000000146ac000 CR4:
00000000000406e0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
