Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB54447D8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 19:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90E373D82;
	Wed,  3 Nov 2021 18:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2646373D82
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 18:01:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EF62C6113E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635962470;
 bh=kKFG6XL13b7soR+5V119NgRM/Rlud5Qhup9YYxt8RjQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SW9mmJf4okP0mXGtghq/zoZM5OT4jKB2IOtbki8tPktdHeyTUVuiW7xV34q79xl9p
 gH4dlG582bH+rQACaJTS6qTprdIjEBUFinO+RxR4zuLN2yPLRf9ishX6prR51aMqcz
 1KgSgHUzjkvoegg/y8bLNQ744VHnpHoE+d563z/9PaFLdGl/bvXDwF1Im698IqL8L9
 W7truQ3cNAtSwqNwfkHwaKvl6SVo/YrCmVVlxDIjpMNHINInwn2M2d+xwZNEtakE8h
 XJ3799DtTkdUwB2pvs3YuU8pezJkz1eG/8yqtanvtxTSP/rryb1KnSMf/WT7ERjI7P
 WUAbCDtJjI53A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ECB9D61103; Wed,  3 Nov 2021 18:01:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Wed, 03 Nov 2021 18:01:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-2RwZXG8L6T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Lang Yu from comment #5)
> Created attachment 299383 [details]
> fix a potential dma-buf release warning
>=20
> Please have a try with attached patch. Thanks!
Thanks! Applied the patch on top of v5.15 but still get:

[...]
------------[ cut here ]------------
WARNING: CPU: 2 PID: 519 at drivers/gpu/drm/ttm/ttm_bo.c:409
ttm_bo_release+0xb64/0xe40 [ttm]
Modules linked in: rfkill dm_crypt nhpoly1305_sse2 nhpoly1305 chacha_generic
chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher joydev input_le=
ds
led_class hid_generic usbhid dm_mod hid ohci_pci raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx evdev f2fs crc32_generic
lz4hc_compress lz4_compress lz4_decompress crc32_pclmul amdgpu md_mod
aesni_intel libaes crypto_simd cryptd ext4 crc16 mbcache fam15h_power
snd_hda_codec_hdmi jbd2 k10temp ehci_pci ohci_hcd snd_hda_intel ehci_hcd
snd_intel_dspcfg xhci_pci drm_ttm_helper i2c_piix4 snd_hda_codec ttm mfd_co=
re
snd_hwdep snd_hda_core gpu_sched xhci_hcd i2c_algo_bit snd_pcm drm_kms_help=
er
usbcore snd_timer syscopyarea sysfillrect snd sysimgblt usb_common fb_sys_f=
ops
soundcore acpi_cpufreq video processor button zram zsmalloc nfsd nct6775
hwmon_vid hwmon auth_rpcgss drm lockd grace fuse drm_panel_orientation_quir=
ks
backlight configfs sunrpc efivarfs
CPU: 2 PID: 519 Comm: X Not tainted 5.15.0-bdver3+ #3
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A88M-G/3.1, BI=
OS
P1.40C 11/21/2016
RIP: 0010:ttm_bo_release+0xb64/0xe40 [ttm]
Code: c1 ea 03 80 3c 02 00 0f 85 77 01 00 00 48 8b bb f0 fe ff ff b9 28 23 =
00
00 31 d2 be 01 00 00 00 e8 81 c9 54 da e9 d3 fe ff ff <0f> 0b e9 1c f5 ff f=
f 4c
89 e7 e8 4d 5a 54 da e9 26 fc ff ff be 03
RSP: 0018:ffffc900018afb18 EFLAGS: 00010202
RAX: 0000000000000007 RBX: ffff88813d2a7298 RCX: 000000000000001c
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88813d2a7298
RBP: ffff88813d2a7000 R08: ffffffffc0b63689 R09: ffff88813d2a729b
R10: ffffed1027a54e53 R11: 0000000000000001 R12: dffffc0000000000
R13: ffff8881748d03a8 R14: ffff8881748d03f0 R15: ffff88810b138b40
FS:  00007fa8bfe7adc0(0000) GS:ffff8883d1700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562b379a2098 CR3: 0000000142970000 CR4: 00000000000506e0
Call Trace:
 ? fsnotify_grab_connector+0xcc/0x190
 amdgpu_bo_unref+0x2c/0x60 [amdgpu]
 amdgpu_gem_object_free+0xc0/0x100 [amdgpu]
 ? amdgpu_gem_object_mmap+0xe0/0xe0 [amdgpu]
 ? call_rcu+0x37f/0x730
 ? trace_hardirqs_on+0x1c/0x110
 drm_gem_dmabuf_release+0x82/0xb0 [drm]
 dma_buf_release+0x127/0x230
 __dentry_kill+0x376/0x550
 ? dma_buf_file_release+0x177/0x200
 __fput+0x2c0/0x8c0
 task_work_run+0xc5/0x150
 do_exit+0x799/0x20c0
 ? mm_update_next_owner+0x6d0/0x6d0
 do_group_exit+0xe7/0x290
 __x64_sys_exit_group+0x35/0x40
 do_syscall_64+0x66/0x90
 ? do_syscall_64+0xe/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa8bf6fc2f9
Code: Unable to access opcode bytes at RIP 0x7fa8bf6fc2cf.
RSP: 002b:00007ffc95722778 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa8bf7e4920 RCX: 00007fa8bf6fc2f9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 00007fa8bf7e4920 R08: fffffffffffffd40 R09: 000000000098b190
R10: 00007fa8bef086b8 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 000000000000066a R15: 0000000000000000
irq event stamp: 887428545
hardirqs last  enabled at (887428551): [<ffffffff9a1f801c>]
vprintk_emit+0x2dc/0x310
hardirqs last disabled at (887428556): [<ffffffff9a1f7fcb>]
vprintk_emit+0x28b/0x310
softirqs last  enabled at (887427644): [<ffffffff9a0d0165>]
__irq_exit_rcu+0xe5/0x120
softirqs last disabled at (887427625): [<ffffffff9a0d0165>]
__irq_exit_rcu+0xe5/0x120
---[ end trace 1b4ae7cf543ff5f4 ]---
[...]

It does not trigger on every reboot though, the machine needs to have been
running for a few hrs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
