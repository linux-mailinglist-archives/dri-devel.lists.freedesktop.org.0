Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED83A8A67
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166656E486;
	Tue, 15 Jun 2021 20:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2569B6E486
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 20:44:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 10BF6613B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623789878;
 bh=1+8B+vjKdvh1KjlCR11qvP4pVDRvQuDHKSGmpwB9d34=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XPZ7m2DEqPfGoeuGHQBFTztkX+tbJO75w7iLAeYat1T5TRFxDpioNKQL6T1/T17rf
 ARsn+SUh/Tbhcog7hKkHxxNWGxfolfL7D5nWdUF1CmhX0oK+VJ3uqBDs552pIvVClr
 Nc3jM0mL3erUXvxeL50kx/FafMfnuXUDT/aVys+btL9ArV0p2iRFF3Xj0kcIyXlT6C
 Wo2zSoRcy6RHrSwAJikKNinnBYlV8G0/uJQafDZ7NwCkOw0U4FMCno6AmLqZBnlQWX
 O7JdNTgBjzBA12UdBBYVYn/N1w7uRHs4OjIAufuGUm38O8seT3GJvPnnhilkXZjyIm
 qWfrG4MxlmzXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 00F94612A2; Tue, 15 Jun 2021 20:44:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213053] WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
 Radeon 6700XT
Date: Tue, 15 Jun 2021 20:44:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: skobkin-ru@ya.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213053-2300-NABlvKoHpP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213053-2300@https.bugzilla.kernel.org/>
References: <bug-213053-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213053

Alexey (skobkin-ru@ya.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |skobkin-ru@ya.ru

--- Comment #3 from Alexey (skobkin-ru@ya.ru) ---
Also RX 6800 XT here:

Jun 15 23:05:38 kernel: [drm] fb depth is 24
Jun 15 23:05:38 kernel: [drm]    pitch is 10240
Jun 15 23:05:38 kernel: [drm] REG_WAIT timeout 1us * 100000 tries -
mpc2_assert_idle_mpcc line:480
Jun 15 23:05:38 kernel: ------------[ cut here ]------------
Jun 15 23:05:38 kernel: WARNING: CPU: 8 PID: 650 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:959
dcn30_set_hubp_blank+0x20f/0x220 [amdgpu]
Jun 15 23:05:38 kernel: Modules linked in: pcc_cpufreq(-) algif_aead md4 iw=
lmvm
joydev input_leds hid_generic bnep btusb btrtl btbcm btintel bluetooth
snd_usb_audio(+) snd_usbmidi_lib snd_rawmidi snd_seq_device mc
snd_hda_codec_realte>
Jun 15 23:05:38 kernel: CPU: 8 PID: 650 Comm: kworker/8:2 Tainted: G       =
 W=20=20
      5.12.10-gentoo-skobkin #1
Jun 15 23:05:38 kernel: Hardware name: To Be Filled By O.E.M. To Be Filled =
By
O.E.M./X399 Taichi, BIOS P3.90 12/04/2019
Jun 15 23:05:38 kernel: Workqueue: events work_for_cpu_fn
Jun 15 23:05:38 kernel: RIP: 0010:dcn30_set_hubp_blank+0x20f/0x220 [amdgpu]
Jun 15 23:05:38 kernel: Code: 31 f6 48 8b 07 48 8b 40 50 e8 0d e4 f1 d9 48 =
8b
9b d0 02 00 00 48 85 db 75 df eb 8c 0f 0b e9 46 ff ff ff 0f 0b e9 be fe ff =
ff
<0f> 0b e9 42 fe ff ff 66 2e 0f 1f 84 00 00 00 00 00 41 57 41 56 45
Jun 15 23:05:38 kernel: RSP: 0018:ffffab11127f7480 EFLAGS: 00010246
Jun 15 23:05:38 kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX:
0000000000000008
Jun 15 23:05:38 kernel: RDX: 0000000000000000 RSI: 0000000000003ab3 RDI:
ffff9e964c820000
Jun 15 23:05:38 kernel: RBP: ffff9e9655b601e8 R08: ffffab11127f746c R09:
0000000000000002
Jun 15 23:05:38 kernel: R10: 3038343a656e696c R11: 343a656e696c2063 R12:
ffff9e9655b601e8
Jun 15 23:05:38 kernel: R13: ffff9e9655b601e8 R14: ffff9e964f190000 R15:
0000000000000000
Jun 15 23:05:38 kernel: FS:  0000000000000000(0000) GS:ffff9e9e1f400000(000=
0)
knlGS:0000000000000000
Jun 15 23:05:38 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 15 23:05:38 kernel: CR2: 00007fceb9544884 CR3: 000000033a810000 CR4:
00000000003506e0
Jun 15 23:05:38 kernel: Call Trace:
Jun 15 23:05:38 kernel:  dcn10_wait_for_mpcc_disconnect+0x10d/0x190 [amdgpu]
Jun 15 23:05:38 kernel:  dcn20_plane_atomic_disable+0x39/0x110 [amdgpu]
Jun 15 23:05:38 kernel:  dcn20_disable_plane+0x1f/0x40 [amdgpu]
Jun 15 23:05:38 kernel:  dcn10_init_pipes+0x300/0x3f0 [amdgpu]
Jun 15 23:05:38 kernel:  dce110_enable_accelerated_mode+0x96/0x260 [amdgpu]
Jun 15 23:05:38 kernel:  dc_commit_state+0x97c/0xa90 [amdgpu]
Jun 15 23:05:38 kernel:  amdgpu_dm_atomic_commit_tail+0x459/0x20a0 [amdgpu]
Jun 15 23:05:38 kernel:  commit_tail+0x8d/0x120 [drm_kms_helper]
Jun 15 23:05:38 kernel:  drm_atomic_helper_commit+0x10e/0x140 [drm_kms_help=
er]
Jun 15 23:05:38 kernel:  drm_client_modeset_commit_atomic+0x1e3/0x230 [drm]
Jun 15 23:05:38 kernel:  drm_client_modeset_commit_locked+0x51/0x150 [drm]
Jun 15 23:05:38 kernel:  drm_client_modeset_commit+0x1f/0x40 [drm]
Jun 15 23:05:38 kernel:  drm_fb_helper_set_par+0xa0/0xd0 [drm_kms_helper]
Jun 15 23:05:38 kernel:  fbcon_init+0x29d/0x540
Jun 15 23:05:38 kernel:  visual_init+0xc4/0x120
Jun 15 23:05:38 kernel:  do_bind_con_driver.isra.0+0x1bc/0x2c0
Jun 15 23:05:38 kernel:  do_take_over_console+0x110/0x180
Jun 15 23:05:38 kernel:  do_fbcon_takeover+0x52/0xb0
Jun 15 23:05:38 kernel:  register_framebuffer+0x1ef/0x310
Jun 15 23:05:38 kernel:  __drm_fb_helper_initial_config_and_unlock+0x331/0x=
4a0
[drm_kms_helper]
Jun 15 23:05:38 kernel:  amdgpu_fbdev_init+0xb4/0xf0 [amdgpu]
Jun 15 23:05:38 kernel:  amdgpu_device_init.cold+0x116e/0x18ad [amdgpu]
Jun 15 23:05:38 kernel:  amdgpu_driver_load_kms+0x53/0x190 [amdgpu]
Jun 15 23:05:38 kernel:  amdgpu_pci_probe+0xb7/0x130 [amdgpu]
Jun 15 23:05:38 kernel:  local_pci_probe+0x3d/0x70
Jun 15 23:05:38 kernel:  work_for_cpu_fn+0x11/0x20
Jun 15 23:05:38 kernel:  process_one_work+0x210/0x3b0
Jun 15 23:05:38 kernel:  worker_thread+0x1f4/0x3c0
Jun 15 23:05:38 kernel:  ? rescuer_thread+0x3a0/0x3a0
Jun 15 23:05:38 kernel:  kthread+0x116/0x130
Jun 15 23:05:38 kernel:  ? kthread_associate_blkcg+0xa0/0xa0
Jun 15 23:05:38 kernel:  ret_from_fork+0x22/0x30
Jun 15 23:05:38 kernel: ---[ end trace fe613a36cb72f141 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
