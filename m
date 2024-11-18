Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B59D0EFB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 11:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3201710E36F;
	Mon, 18 Nov 2024 10:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KTYrjia7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095E010E36F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 10:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE57C5C501F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9D83C4CECC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731927206;
 bh=m53B9mDv5OL5TZhsm4VdlFPRneRji6sTJFEPnpAVhy8=;
 h=From:To:Subject:Date:From;
 b=KTYrjia70gm34hJMBUQr8+kM/P+/1NXhaI7TiGYMN3q+7LdHTbWqSCHTCE//ktLuK
 SevK3vKM5MwWAcG1EPKRVQWHDnPhlg0E6aD/H3Bo5fL9ZbND8o2dUKTSt/uFlFNmgx
 b8Dj46kaCT9Gxo7l89LgwgwJX7oYBpQZVdm6vehYtOgY/VQtNWnnu1hjiQTqwqLNBy
 +DZdznGccjeYzr8EstRzAd+xpZDyZBnpNvc88MgKhbBfucz699lIa3U5YsRO+79nZ2
 trt5jukX6tFcVK3QK6WpbPoy/UKvoJzw+u4s+BPumJzq7I8GP6RLhJRSjK7LnkbzPO
 U8afzsxa8f9OA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AF8D0CAB784; Mon, 18 Nov 2024 10:53:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219507] New: nouveau: GeForce GT 710: irq 166 handler
 nvkm_intr+0x0/0x1b3 [nouveau] enabled interrupts
Date: Mon, 18 Nov 2024 10:53:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: newchief@king.net.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219507-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219507

            Bug ID: 219507
           Summary: nouveau: GeForce GT 710: irq 166 handler
                    nvkm_intr+0x0/0x1b3 [nouveau] enabled interrupts
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: newchief@king.net.pl
        Regression: No

Maybe it's not immediately bad (no observable problems yet), but any warnin=
gs
in interrupts are always bad and make the system not trustworthy.

After inserting popular MSI graphics card (GeForce GT 710 based) newly
purchased on Amazon, I'm seeing this in dmesg:

[    9.451569] Loading firmware: regulatory.db
[    9.452199] Loading firmware: regulatory.db.p7s
[   10.616519] ------------[ cut here ]------------
[   10.616522] irq 166 handler nvkm_intr+0x0/0x1b3 [nouveau] enabled interr=
upts
[   10.616581] WARNING: CPU: 7 PID: 0 at kernel/irq/handle.c:161
__handle_irq_event_percpu+0xe6/0x13a
[   10.616586] Modules linked in: cfg80211 8021q uvcvideo uvc videobuf2_vma=
lloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev snd_usb_audio
snd_usbmidi_lib snd_rawmidi pl2303 cp210x snd_seq_device xpad mc input_leds
usbserial ff_memless joydev snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio nouveau snd_hda_intel snd_intel_dspcfg x86_pkg_temp_thermal
led_class snd_hda_codec drm_exec gpu_sched snd_hda_core drm_ttm_helper
kvm_intel ttm snd_hwdep snd_pcm i2c_algo_bit kvm irqbypass drm_display_help=
er
i2c_i801 snd_timer pcspkr drm_kms_helper snd i2c_smbus fan video button
vboxnetadp(O) vboxnetflt(O) vboxdrv(O) coretemp drm i2c_core backlight fuse
dm_mod nfnetlink efivarfs ip_tables x_tables usbhid xhci_pci xhci_hcd ahci
libahci usbcore libata usb_common
[   10.616615] CPU: 7 PID: 0 Comm: swapper/7 Tainted: G           O=20=20=
=20=20=20=20
6.6.58-gentoo-r1-x86_64 #1
[   10.616617] Hardware name: HP HP Pavilion Desktop TP01-3xxx/89B5, BIOS F=
.24
01/04/2024
[   10.616617] RIP: 0010:__handle_irq_event_percpu+0xe6/0x13a
[   10.616619] Code: 00 9c 58 0f ba e0 09 73 24 80 3d 2f 37 ad 01 00 75 1a =
48
8b 13 89 ee 48 c7 c7 7d a4 24 ad c6 05 1a 37 ad 01 01 e8 a0 e5 f9 ff <0f> 0=
b fa
41 83 fd 02 75 2f 48 83 7b 20 00 75 1d f0 48 0f ba 6b 40
[   10.616620] RSP: 0018:ffffbd05004b8f48 EFLAGS: 00010282
[   10.616621] RAX: 0000000000000000 RBX: ffff97fa40c6db00 RCX:
0000000000000027
[   10.616622] RDX: 0000000000000000 RSI: ffffffffad25313f RDI:
00000000ffffffff
[   10.616623] RBP: 00000000000000a6 R08: 0000000000000000 R09:
0000000000000000
[   10.616624] R10: 0000000000000041 R11: 0000000000000000 R12:
ffff97fa4799ca00
[   10.616624] R13: 0000000000000001 R14: 0000000000000000 R15:
0000000000000000
[   10.616625] FS:  0000000000000000(0000) GS:ffff98019f7c0000(0000)
knlGS:0000000000000000
[   10.616626] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.616626] CR2: 00007f9bc80e1488 CR3: 00000002a5a42000 CR4:
0000000000750ee0
[   10.616627] PKRU: 55555554
[   10.616628] Call Trace:
[   10.616629]  <IRQ>
[   10.616631]  ? __warn+0x99/0x11a
[   10.616634]  ? report_bug+0xdb/0x155
[   10.616636]  ? __handle_irq_event_percpu+0xe6/0x13a
[   10.616638]  ? handle_bug+0x3c/0x63
[   10.616639]  ? exc_invalid_op+0x13/0x60
[   10.616640]  ? asm_exc_invalid_op+0x16/0x20
[   10.616644]  ? __handle_irq_event_percpu+0xe6/0x13a
[   10.616645]  ? __handle_irq_event_percpu+0xe6/0x13a
[   10.616647]  handle_irq_event_percpu+0xf/0x32
[   10.616648]  handle_irq_event+0x34/0x53
[   10.616650]  handle_edge_irq+0xb0/0xcf
[   10.616652]  __common_interrupt+0x40/0xac
[   10.616655]  common_interrupt+0xa5/0xd0
[   10.616656]  </IRQ>
[   10.616657]  <TASK>
[   10.616657]  asm_common_interrupt+0x22/0x40
[   10.616659] RIP: 0010:finish_task_switch.isra.0+0x148/0x21a
[   10.616662] Code: e6 13 00 41 80 a6 0c 04 00 00 fb 31 c9 4c 89 e7 89 4b =
34
e8 5c d3 ff ff 4c 89 e7 e8 bc 03 96 00 fb 65 48 8b 04 25 80 b6 02 00 <66> 9=
0 4d
85 ed 75 2b eb 7a 4c 8b a0 c0 02 00 00 4d 85 e4 74 ed 65
[   10.616663] RSP: 0018:ffffbd05001bfe78 EFLAGS: 00000282
[   10.616664] RAX: ffff97fa40848000 RBX: ffff97fa42a63e00 RCX:
0000000000000000
[   10.616665] RDX: 0000000000000002 RSI: ffffffffad25313f RDI:
00000000ffffffff
[   10.616665] RBP: ffffbd05001bfea8 R08: 0000000000000000 R09:
000073746e657665
[   10.616666] R10: 8080808080808080 R11: fefefefefefefeff R12:
ffff98019f7ebec0
[   10.616666] R13: 0000000000000000 R14: ffff97fa40848000 R15:
ffff97fa40848580
[   10.616668]  ? finish_task_switch.isra.0+0x13e/0x21a
[   10.616670]  __schedule+0x5e8/0x622
[   10.616672]  schedule_idle+0x27/0x34
[   10.616673]  cpu_startup_entry+0x2a/0x2c
[   10.616676]  start_secondary+0xf0/0xf0
[   10.616677]  secondary_startup_64_no_verify+0x166/0x16b
[   10.616679]  </TASK>
[   10.616680] ---[ end trace 0000000000000000 ]---
[   11.088891] tun: Universal TUN/TAP device driver, 1.6

It's Gentoo Linux with Plasma and SDDM. I've tried two distribution (genker=
nel)
kernels: linux-6.6.52-gentoo and linux-6.6.58-gentoo-r1, both with the same
warning in dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
