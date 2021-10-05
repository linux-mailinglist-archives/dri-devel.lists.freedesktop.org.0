Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC1421B5E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA246E2B8;
	Tue,  5 Oct 2021 01:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FC46E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:03:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 62821615A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633395813;
 bh=QJ2kdBpRtBDPY76McwJ3vdUPssiCPP1VrFwgm2HvnsU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C0bRNVyghTGmPf9jdHgX/9YKS7TiBf3X04whWd8nGg9e09ovtoRHqRPlFlEpZEv0W
 hT4VGJHv5A61MOpCrszG326UsvScy1cd//TpTpJ5yciC5oarGMICVdjQlheE7IL5KH
 USVzceDHvV39q2Co+r72s77aDanqe9a3+U1ztmCYbmXAn7Tke83uoCsQ1edEGoPzIC
 TDSYcwXp9okvFzXHz/dIOifMbxp4AwLAbSX/wlQfMs1EpdhxCixlCvcNqdASglWYWr
 cWoDhTSbf0/0H2pY3R4dGJU8Nhb6fJBjzS69JEjBL0yP7RutMDM9kLxQTp0csQTwkq
 jC5WK/0DqoFTw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 511FB610A6; Tue,  5 Oct 2021 01:03:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206349] WARNING: dcn20_validate_bandwidth+0x87/0x9e [ amdgpu on
 5700 XT ]
Date: Tue, 05 Oct 2021 01:03:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jimmy@boombatower.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206349-2300-mai7Ng295f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206349-2300@https.bugzilla.kernel.org/>
References: <bug-206349-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206349

Jimmy Berry (jimmy@boombatower.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jimmy@boombatower.com

--- Comment #1 from Jimmy Berry (jimmy@boombatower.com) ---
Looks like I have the same thing on 5.14.6 with a Radeon 6900 XT.

From 5.13.8 I was able to run 4 x 4k @ 60hz + 2 x 4k @30hz. Hardware should
support all 6 at 60hz, but that is all I can get to work. As of the update =
to
5.14.6 I can now only run 3 x 4k @ 60hz + 3 x 4k @ 30hz.

Wondering if this error is related. I can supply more detail.


[   43.785782] ------------[ cut here ]------------
[   43.785784] WARNING: CPU: 20 PID: 1392 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dsc.c:267
dsc2_disable+0x12b/0x140 [amdgpu]
[   43.785879] Modules linked in: af_packet dmi_sysfs dm_crypt essiv authenc
trusted asn1_encoder tee intel_rapl_msr intel_rapl_common edac_mce_amd
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi kvm snd_usb_audio
snd_hda_codec uvcvideo snd_usbmidi_lib snd_hda_core snd_rawmidi irqbypass
videobuf2_vmalloc snd_seq_device videobuf2_memops snd_hwdep eeepc_wmi
videobuf2_v4l2 asus_wmi snd_pcm videobuf2_common battery sparse_keymap rfki=
ll
joydev video pcspkr snd_timer wmi_bmof i2c_piix4 snd k10temp igc soundcore
tiny_power_button gpio_amdpt gpio_generic acpi_cpufreq button fuse configfs
ext4 mbcache jbd2 hid_logitech_hidpp hid_logitech_dj hid_generic usbhid amd=
gpu
drm_ttm_helper ttm iommu_v2 gpu_sched i2c_algo_bit drm_kms_helper
crct10dif_pclmul crc32_pclmul crc32c_intel syscopyarea sysfillrect sysimgblt
ghash_clmulni_intel fb_sys_fops cec xhci_pci xhci_pci_renesas rc_core xhci_=
hcd
drm usbcore
[   43.785899]  aesni_intel nvme ccp crypto_simd cryptd nvme_core sp5100_tco
wmi v4l2loopback(O) videodev mc sg dm_multipath dm_mod scsi_dh_rdac scsi_dh=
_emc
scsi_dh_alua msr
[   43.785906] CPU: 20 PID: 1392 Comm: Xorg.bin Tainted: G        W  O=20=
=20=20=20=20
5.14.6-1-default #1 openSUSE Tumbleweed
539bdc3afabb63aa01656ffde27ce5025c985e0c
[   43.785908] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAM=
ING,
BIOS 1401 12/03/2020
[   43.785908] RIP: 0010:dsc2_disable+0x12b/0x140 [amdgpu]
[   43.785987] Code: 10 65 48 2b 04 25 28 00 00 00 75 25 48 83 c4 18 5b c3 =
8b
53 10 8b 4c 24 0c bf 04 00 00 00 48 c7 c6 50 15 9c c0 e8 95 fc 8b 00 <0f> 0=
b e9
75 ff ff ff e8 c9 5b ae ec 66 0f 1f 84 00 00 00 00 00 0f
[   43.785988] RSP: 0018:ffffa32302df3608 EFLAGS: 00010246
[   43.785989] RAX: 0000000000000000 RBX: ffff8d30610c6000 RCX:
0000000000000000
[   43.785990] RDX: 0000000000000004 RSI: ffffffffc09c1550 RDI:
0000000000000000
[   43.785990] RBP: ffff8d30610c6000 R08: ffffa32302df3610 R09:
0000000000000004
[   43.785990] R10: 0000000000000000 R11: 0000000a319e8f4b R12:
ffff8d30c5220000
[   43.785991] R13: ffff8d30c52214a8 R14: ffff8d3c08550000 R15:
ffff8d3044934000
[   43.785992] FS:  00007efc485ea940(0000) GS:ffff8d3f2ef00000(0000)
knlGS:0000000000000000
[   43.785992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.785993] CR2: 00007efc2405a358 CR3: 0000000107c2a000 CR4:
0000000000750ee0
[   43.785993] PKRU: 55555554
[   43.785994] Call Trace:
[   43.785997]  dp_set_dsc_on_stream+0x2be/0x360 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786074]  ? drm_dp_dpcd_write+0x65/0xd0 [drm_kms_helper
750f79a7da02c8d460f017cfe9bf7182a2652479]
[   43.786081]  dp_set_dsc_enable+0x6a/0x80 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786152]  dcn20_reset_hw_ctx_wrap+0x11c/0x370 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786228]  dce110_apply_ctx_to_hw+0x4f/0x560 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786301]  ? __free_pages_ok+0x2d8/0x410
[   43.786304]  dc_commit_state+0x333/0xa80 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786374]  amdgpu_dm_atomic_commit_tail+0x53a/0x25f0 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786452]  ? dcn30_validate_bandwidth+0x11f/0x270 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786526]  ? kfree+0xba/0x3c0
[   43.786528]  ? dm_plane_helper_prepare_fb+0x1b4/0x270 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786602]  ? __cond_resched+0x16/0x40
[   43.786604]  ? __wait_for_common+0x3b/0x160
[   43.786605]  ? __cond_resched+0x16/0x40
[   43.786605]  ? __wait_for_common+0x3b/0x160
[   43.786607]  commit_tail+0x94/0x120 [drm_kms_helper
750f79a7da02c8d460f017cfe9bf7182a2652479]
[   43.786614]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper
750f79a7da02c8d460f017cfe9bf7182a2652479]
[   43.786619]  drm_atomic_helper_set_config+0x70/0xb0 [drm_kms_helper
750f79a7da02c8d460f017cfe9bf7182a2652479]
[   43.786625]  drm_mode_setcrtc+0x1d3/0x6d0 [drm
13a94d3e4d6d5c79a58cf45473f1abe284f6b940]
[   43.786637]  ? drm_mode_getcrtc+0x170/0x170 [drm
13a94d3e4d6d5c79a58cf45473f1abe284f6b940]
[   43.786645]  drm_ioctl_kernel+0xaa/0xf0 [drm
13a94d3e4d6d5c79a58cf45473f1abe284f6b940]
[   43.786655]  drm_ioctl+0x213/0x3e0 [drm
13a94d3e4d6d5c79a58cf45473f1abe284f6b940]
[   43.786663]  ? drm_mode_getcrtc+0x170/0x170 [drm
13a94d3e4d6d5c79a58cf45473f1abe284f6b940]
[   43.786672]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu
791908deeeccac56f7b565af20aa0cff4bc40e3b]
[   43.786727]  __x64_sys_ioctl+0x82/0xb0
[   43.786730]  do_syscall_64+0x5c/0x80
[   43.786732]  ? syscall_exit_to_user_mode+0x18/0x40
[   43.786733]  ? do_syscall_64+0x69/0x80
[   43.786734]  ? exit_to_user_mode_prepare+0x19b/0x230
[   43.786736]  ? syscall_exit_to_user_mode+0x18/0x40
[   43.786737]  ? do_syscall_64+0x69/0x80
[   43.786738]  ? exit_to_user_mode_prepare+0x1ab/0x230
[   43.786739]  ? syscall_exit_to_user_mode+0x18/0x40
[   43.786739]  ? do_syscall_64+0x69/0x80
[   43.786740]  ? exit_to_user_mode_prepare+0x1ab/0x230
[   43.786741]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   43.786742] RIP: 0033:0x7efc48b3722b
[   43.786743] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 =
e0
41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d bd 2b 0f 00 f7 d8 64 89 01 48
[   43.786744] RSP: 002b:00007fff6c24c2e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   43.786745] RAX: ffffffffffffffda RBX: 00007fff6c24c320 RCX:
00007efc48b3722b
[   43.786745] RDX: 00007fff6c24c320 RSI: 00000000c06864a2 RDI:
000000000000000d
[   43.786746] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000561bbfb3f170
[   43.786746] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   43.786747] R13: 000000000000000d R14: 0000561bbfb3f170 R15:
0000000000000000
[   43.786748] ---[ end trace f0d9cdc734575b61 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
