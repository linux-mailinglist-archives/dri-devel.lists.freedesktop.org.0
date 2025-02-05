Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC5A288E6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 12:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA210E1A3;
	Wed,  5 Feb 2025 11:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k0C/eHsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C9810E1A3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 11:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F7EB5C67FF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 11:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DEA0C4CEE8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738753797;
 bh=EldRButvIyKHFz3g8Eynadsn2tH+6tdvc4jFTaTFuJY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k0C/eHsEwBInCQc0Su4xO1KQcod6/9Jr/2nPiIF4HqZSnFeIgmV55N/Nkvg6J0ViQ
 HK81rjm9o4CviZYpd3vrfyOPx06GO2ShSM/bngfHCZ6XpwBbT+JJDz5+iJC3HoQelU
 SwiGMEUVb4S/m1+ulVaqKPuRgDCL3YmnoWnp6zY9R9lZKa2TjeRXSXzbCHvZx/suXi
 /xXUoZsxsG/fyYo8iXta4F4BvHhOwLKCrmyY+dsdNQX5Erz/gezXJocYCAnwSqRofA
 s+vuf3rLIEmi+UpnjnpWpcCbCfLPVs43ADM4KxG0eOz02ORMYau8YFFVqJtHoMM10L
 L8aWzpmfm86Xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 161B0C41606; Wed,  5 Feb 2025 11:09:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200531] amdgpu: *ERROR* REG_WAIT timeout when a display is put
 to sleep
Date: Wed, 05 Feb 2025 11:09:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ramses@well-founded.dev
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-200531-2300-PcrbFxAEhz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200531-2300@https.bugzilla.kernel.org/>
References: <bug-200531-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D200531

Ramses VdP (ramses@well-founded.dev) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ramses@well-founded.dev

--- Comment #13 from Ramses VdP (ramses@well-founded.dev) ---
This still happens on 6.13.1:

f=C3=A9v 05 10:07:39 framework kernel: amdgpu 0000:c1:00.0: [drm] REG_WAIT =
timeout
1us * 100 tries - dcn31_program_compbuf_size line:142
f=C3=A9v 05 10:07:39 framework kernel: ------------[ cut here ]------------
f=C3=A9v 05 10:07:39 framework kernel: WARNING: CPU: 11 PID: 2133 at
drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn31/dcn31_hubbub.c:151
dcn31_program_compbuf_size+0xd2/0x240 [amdgpu]
f=C3=A9v 05 10:07:39 framework kernel: Modules linked in: rfcomm snd_seq_du=
mmy
snd_hrtimer snd_seq ccm algif_aead crypto_null dummy wireguard des3_ede_x86=
_64
curve25519_x86_64 libchacha20poly1305 chacha_x86_64 poly>
f=C3=A9v 05 10:07:39 framework kernel:  snd_hda_codec_generic
snd_hda_scodec_component snd_compress snd_usb_audio snd_hda_codec_hdmi ac97=
_bus
igc snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_acp_legacy_commo>
f=C3=A9v 05 10:07:39 framework kernel:  serio_raw tcp_bbr sch_fq uinput tun=
 tap
macvlan bridge stp llc kvm_amd ccp kvm fuse efi_pstore configfs nfnetlink z=
ram
842_decompress 842_compress lz4hc_compress lz4_compress>
f=C3=A9v 05 10:07:39 framework kernel: CPU: 11 UID: 1000 PID: 2133 Comm: ni=
ri Not
tainted 6.13.1 #1-NixOS
f=C3=A9v 05 10:07:39 framework kernel: Hardware name: Framework Laptop 13 (=
AMD Ryzen
7040Series)/FRANMDCP07, BIOS 03.05 03/29/2024
f=C3=A9v 05 10:07:39 framework kernel: RIP:
0010:dcn31_program_compbuf_size+0xd2/0x240 [amdgpu]
f=C3=A9v 05 10:07:39 framework kernel: Code: 48 8b 43 28 8b 88 d8 01 00 00 =
48 8b 43
20 0f b6 50 76 48 8b 43 18 8b b0 14 01 00 00 e8 17 a1 0e 00 85 c0 0f 85 45 =
01
00 00 90 <0f> 0b 90 48 8b 44 24 08 65 48 2b 04 25 28>
f=C3=A9v 05 10:07:39 framework kernel: RSP: 0018:ffffab7d061d7708 EFLAGS: 0=
0010202
f=C3=A9v 05 10:07:39 framework kernel: RAX: 0000000000000001 RBX: ffff951f4=
35a3400
RCX: 0000000000000000
f=C3=A9v 05 10:07:39 framework kernel: RDX: 0000000000000000 RSI: 000000000=
0000000
RDI: 0000000000000000
f=C3=A9v 05 10:07:39 framework kernel: RBP: 0000000000000004 R08: 000000000=
0000000
R09: 0000000000000000
f=C3=A9v 05 10:07:39 framework kernel: R10: 0000000000000000 R11: 000000000=
0000000
R12: ffff952280200000
f=C3=A9v 05 10:07:39 framework kernel: R13: ffff951f5b400000 R14: ffff951f4=
35a3400
R15: 0000000000000004
f=C3=A9v 05 10:07:39 framework kernel: FS:  00007fe2f88c5d00(0000)
GS:ffff952e1ff80000(0000) knlGS:0000000000000000
f=C3=A9v 05 10:07:39 framework kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
f=C3=A9v 05 10:07:39 framework kernel: CR2: 0000556b362d7dc0 CR3: 000000043=
19ec000
CR4: 0000000000f50ef0
f=C3=A9v 05 10:07:39 framework kernel: PKRU: 55555554
f=C3=A9v 05 10:07:39 framework kernel: Call Trace:
f=C3=A9v 05 10:07:39 framework kernel:  <TASK>
f=C3=A9v 05 10:07:39 framework kernel:  ? dcn31_program_compbuf_size+0xd2/0=
x240
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? __warn.cold+0x93/0xf6
f=C3=A9v 05 10:07:39 framework kernel:  ? dcn31_program_compbuf_size+0xd2/0=
x240
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? report_bug+0x10d/0x150
f=C3=A9v 05 10:07:39 framework kernel:  ? handle_bug+0x61/0xb0
f=C3=A9v 05 10:07:39 framework kernel:  ? exc_invalid_op+0x17/0x80
f=C3=A9v 05 10:07:39 framework kernel:  ? asm_exc_invalid_op+0x1a/0x20
f=C3=A9v 05 10:07:39 framework kernel:  ? dcn31_program_compbuf_size+0xd2/0=
x240
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? dcn31_program_compbuf_size+0xc9/0=
x240
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  dcn20_optimize_bandwidth+0xe4/0x240=
 [amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  dc_commit_state_no_check+0xc6c/0xeb0
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  dc_commit_streams+0x283/0x470 [amdg=
pu]
f=C3=A9v 05 10:07:39 framework kernel:  amdgpu_dm_atomic_commit_tail+0x67d/=
0x3760
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? dcn314_validate_bandwidth+0x100/0=
x2c0
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? srso_alias_return_thunk+0x5/0xfbe=
f5
f=C3=A9v 05 10:07:39 framework kernel:  ? amdgpu_dm_atomic_check+0x161f/0x1=
800
[amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  ? srso_alias_return_thunk+0x5/0xfbe=
f5
f=C3=A9v 05 10:07:39 framework kernel:  ? __wait_for_common+0x192/0x1d0
f=C3=A9v 05 10:07:39 framework kernel:  ? __pfx_schedule_timeout+0x10/0x10
f=C3=A9v 05 10:07:39 framework kernel:  commit_tail+0x91/0x130
f=C3=A9v 05 10:07:39 framework kernel:  drm_atomic_helper_commit+0x126/0x150
f=C3=A9v 05 10:07:39 framework kernel:  drm_atomic_commit+0xaf/0xf0
f=C3=A9v 05 10:07:39 framework kernel:  ? __pfx___drm_printfn_info+0x10/0x10
f=C3=A9v 05 10:07:39 framework kernel:  drm_mode_atomic_ioctl+0xada/0xd30
f=C3=A9v 05 10:07:39 framework kernel:  ? __wake_up_sync_key+0x3b/0x60
f=C3=A9v 05 10:07:39 framework kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/=
0x10
f=C3=A9v 05 10:07:39 framework kernel:  drm_ioctl_kernel+0xb5/0x110
f=C3=A9v 05 10:07:39 framework kernel:  drm_ioctl+0x288/0x4e0
f=C3=A9v 05 10:07:39 framework kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/=
0x10
f=C3=A9v 05 10:07:39 framework kernel:  amdgpu_drm_ioctl+0x4b/0x90 [amdgpu]
f=C3=A9v 05 10:07:39 framework kernel:  __x64_sys_ioctl+0xa0/0xe0
f=C3=A9v 05 10:07:39 framework kernel:  do_syscall_64+0xb7/0x210
f=C3=A9v 05 10:07:39 framework kernel:  entry_SYSCALL_64_after_hwframe+0x77=
/0x7f
f=C3=A9v 05 10:07:39 framework kernel: RIP: 0033:0x556b36a97c4c
f=C3=A9v 05 10:07:39 framework kernel: Code: 4c 89 6c 24 18 4c 89 64 24 20 =
4c 89 74
24 28 0f 57 c0 0f 11 44 24 30 89 c7 48 8d 54 24 08 b8 10 00 00 00 be bc 64 =
38
c0 0f 05 <49> 89 c7 48 83 3b 00 74 09 4c 89 c7 ff 15>
f=C3=A9v 05 10:07:39 framework kernel: RSP: 002b:00007ffc5fd86420 EFLAGS: 0=
0000213
ORIG_RAX: 0000000000000010
f=C3=A9v 05 10:07:39 framework kernel: RAX: ffffffffffffffda RBX: 00007ffc5=
fd864c0
RCX: 0000556b36a97c4c
f=C3=A9v 05 10:07:39 framework kernel: RDX: 00007ffc5fd86428 RSI: 00000000c=
03864bc
RDI: 0000000000000028
f=C3=A9v 05 10:07:39 framework kernel: RBP: 0000000000000000 R08: 0000556b6=
3cc7fd0
R09: 0000000000000001
f=C3=A9v 05 10:07:39 framework kernel: R10: 0000000000000000 R11: 000000000=
0000213
R12: 0000556b63da5590
f=C3=A9v 05 10:07:39 framework kernel: R13: 0000556b63cc7ff0 R14: 0000556b6=
40923f0
R15: 0000000000000000
f=C3=A9v 05 10:07:39 framework kernel:  </TASK>
f=C3=A9v 05 10:07:39 framework kernel: ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
