Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493181D66C
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 21:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5070210E02F;
	Sat, 23 Dec 2023 20:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680CD10E02F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 20:17:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 51DF6B80A0A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 20:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 007FAC433D9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703362643;
 bh=Zmqba4uvrxVYLW8+x2KHAkkxsi7nGCkg4hRR/ooTing=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tHZkghvmcmT64iGsO61xugL0KpOh4hPPN5zqXvaDbQLBcoI8XqrLIXtvxsjYJNJni
 SEGXKmLBwRUvpZq49APpRMZ/E3mBoJjxwS453aKU5Yfub7b1INgVqnA299HnYZUaOs
 0QN+bZ+vLQ/C+6yTu9Cr60mE9RvyENMpn+laSMCcemgcrgSJHi8DgYUxL1C+7UJa4Y
 ZtVROSK6WNqfIhujmqjVyCf1nTlOEUAvrcmy72pVZf6z5OHy3GyPFu036LzMYMg2it
 mNf+r7gcl9xF3qlMakEZ6l3FDKa+2K5ED+2yKBZAJv8WNJSEp9GjkZ6RpDjzxTfVZy
 Y+ObLUxiWUmOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E5EE2C53BD2; Sat, 23 Dec 2023 20:17:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Sat, 23 Dec 2023 20:17:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andimewi@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213983-2300-V5rr3dCb78@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

--- Comment #9 from Andimewi (andimewi@gmx.net) ---
Remains in 6.5.0-14
Sometimes system freezes!

[12068.780248] WARNING: CPU: 11 PID: 2001 at drivers/gpu/drm/ttm/ttm_bo.c:3=
26
ttm_bo_release+0x299/0x2c0 [ttm]
[12068.780285] Modules linked in: bnep bluetooth ecdh_generic ecc veth
snd_seq_dummy snd_hrtimer xt_nat xt_tcpudp xt_conntrack nft_chain_nat
xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat nf_tables nfnetli=
nk
br_netfilter bridge stp llc overlay dm_crypt cfg80211 binfmt_misc joydev
input_leds intel_rapl_msr intel_rapl_common snd_hda_codec_realtek edac_mce_=
amd
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep
snd_pcm snd_seq_midi nls_iso8859_1 snd_seq_midi_event snd_rawmidi kvm snd_s=
eq
snd_seq_device snd_timer irqbypass snd rapl wmi_bmof k10temp ccp soundcore
i2c_piix4 gpio_amdpt mac_hid msr dm_multipath parport_pc ppdev lp parport
efi_pstore dmi_sysfs ip_tables x_tables autofs4 btrfs blake2b_generic raid10
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid=
6_pq
libcrc32c raid1 raid0 multipath linear amdgpu amdxcp iommu_v2
[12068.780551]  drm_buddy gpu_sched hid_generic radeon video i2c_algo_bit
drm_suballoc_helper drm_ttm_helper ttm drm_display_helper cec crct10dif_pcl=
mul
rc_core crc32_pclmul usbhid polyval_clmulni polyval_generic hid
ghash_clmulni_intel aesni_intel drm_kms_helper crypto_simd nvme r8169 cryptd
drm xhci_pci nvme_core realtek ahci xhci_pci_renesas libahci nvme_common wmi
[12068.780653] CPU: 11 PID: 2001 Comm: Xorg Not tainted 6.5.0-14-generic
#14-Ubuntu
[12068.780662] Hardware name: Micro-Star International Co., Ltd. MS-7A39/B3=
50M
GAMING PRO (MS-7A39), BIOS 2.P3 07/16/2022
[12068.780667] RIP: 0010:ttm_bo_release+0x299/0x2c0 [ttm]
[12068.780695] Code: 48 8b 7b 90 e8 88 4c d0 e9 e9 e1 fd ff ff c7 43 2c 00 =
00
00 00 48 8b 7b 08 e8 a3 53 00 00 e9 5d ff ff ff 0f 0b e9 b0 fd ff ff <0f> 0=
b e9
9e fd ff ff be 03 00 00 00 e8 a6 e7 3c e9 e9 21 ff ff ff
[12068.780702] RSP: 0018:ffffb92b0317fc80 EFLAGS: 00010202
[12068.780710] RAX: 0000000000000000 RBX: ffff9769c40919e0 RCX:
0000000000000000
[12068.780716] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
ffff9769c40919e0
[12068.780721] RBP: ffffb92b0317fce0 R08: 0000000000000000 R09:
0000000000000000
[12068.780725] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
[12068.780730] R13: ffff9769d24646e0 R14: ffff9769c4091878 R15:
ffff976a3b8423c0
[12068.780735] FS:  00007f37d2401ac0(0000) GS:ffff976ceecc0000(0000)
knlGS:0000000000000000
[12068.780741] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[12068.780747] CR2: 00007f37b6e29c00 CR3: 000000012f150000 CR4:
00000000003506e0
[12068.780753] Call Trace:
[12068.780759]  <TASK>
[12068.780768]  ? show_regs+0x6d/0x80
[12068.780781]  ? __warn+0x89/0x160
[12068.780792]  ? ttm_bo_release+0x299/0x2c0 [ttm]
[12068.780822]  ? report_bug+0x17e/0x1b0
[12068.780837]  ? handle_bug+0x51/0xa0
[12068.780848]  ? exc_invalid_op+0x18/0x80
[12068.780857]  ? asm_exc_invalid_op+0x1b/0x20
[12068.780874]  ? ttm_bo_release+0x299/0x2c0 [ttm]
[12068.780902]  ? srso_return_thunk+0x5/0x10
[12068.780911]  ? __call_rcu_common.constprop.0+0xa0/0x2b0
[12068.780925]  ttm_bo_put+0x3c/0x70 [ttm]
[12068.780952]  radeon_bo_unref+0x1e/0x40 [radeon]
[12068.781083]  radeon_gem_object_free+0x34/0x60 [radeon]
[12068.781220]  drm_gem_object_free+0x1d/0x40 [drm]
[12068.781337]  drm_gem_dmabuf_release+0x46/0x70 [drm]
[12068.781446]  dma_buf_release+0x3e/0xa0
[12068.781457]  __dentry_kill+0x100/0x190
[12068.781467]  dput+0x19d/0x320
[12068.781476]  __fput+0x150/0x2c0
[12068.781487]  ____fput+0xe/0x20
[12068.781494]  task_work_run+0x61/0xa0
[12068.781504]  exit_to_user_mode_loop+0x100/0x130
[12068.781516]  exit_to_user_mode_prepare+0xa5/0xb0
[12068.781526]  syscall_exit_to_user_mode+0x29/0x60
[12068.781536]  do_syscall_64+0x68/0x90
[12068.781543]  ? syscall_exit_to_user_mode+0x37/0x60
[12068.781550]  ? srso_return_thunk+0x5/0x10
[12068.781558]  ? do_syscall_64+0x68/0x90
[12068.781564]  ? srso_return_thunk+0x5/0x10
[12068.781579]  ? radeon_drm_ioctl+0x70/0x90 [radeon]
[12068.781697]  ? srso_return_thunk+0x5/0x10
[12068.781735]  ? exit_to_user_mode_prepare+0x91/0xb0
[12068.781745]  ? srso_return_thunk+0x5/0x10
[12068.781753]  ? syscall_exit_to_user_mode+0x37/0x60
[12068.781761]  ? srso_return_thunk+0x5/0x10
[12068.781768]  ? do_syscall_64+0x68/0x90
[12068.781776]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[12068.781784] RIP: 0033:0x7f37d27238ef
[12068.781828] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c=
2 3d
00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[12068.781834] RSP: 002b:00007ffd3f5be970 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[12068.781842] RAX: 0000000000000000 RBX: 000055e2463fe9a0 RCX:
00007f37d27238ef
[12068.781847] RDX: 00007ffd3f5bea18 RSI: 0000000040086409 RDI:
0000000000000014
[12068.781852] RBP: 00007ffd3f5bea18 R08: 0000000000000007 R09:
0000000000000007
[12068.781856] R10: 0000000000000007 R11: 0000000000000246 R12:
0000000040086409
[12068.781861] R13: 0000000000000014 R14: 000055e24706c9c0 R15:
000055e2464886a8
[12068.781877]  </TASK>
[12068.781881] ---[ end trace 0000000000000000 ]---

System:
  Host: master Kernel: 6.5.0-14-generic arch: x86_64 bits: 64
    Desktop: KDE Plasma v: 5.27.8 Distro: Ubuntu 23.10 (Mantic Minotaur)
Machine:
  Type: Desktop System: Micro-Star product: MS-7A39 v: 1.0
    serial: <superuser required>
  Mobo: MSI model: B350M GAMING PRO (MS-7A39) v: 1.0
    serial: <superuser required> UEFI: American Megatrends LLC. v: 2.P3
    date: 07/16/2022
CPU:
  Info: 6-core AMD Ryzen 5 1600 [MT MCP] speed (MHz): avg: 1535
    min/max: 1550/3200
Graphics:
  Device-1: AMD Tobago PRO [Radeon R7 360 / R9 OEM] driver: radeon v: kernel
  Display: x11 server: X.Org v: 1.21.1.7 with: Xwayland v: 23.2.0 driver: X:
    loaded: radeon unloaded: fbdev,modesetting,vesa dri: radeonsi gpu: rade=
on
    resolution: 2560x1440~60Hz
  API: OpenGL v: 4.5 Mesa 23.2.1-1ubuntu3.1 renderer: BONAIRE ( LLVM 15.0.7
    DRM 2.50 6.5.0-14-generic)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
