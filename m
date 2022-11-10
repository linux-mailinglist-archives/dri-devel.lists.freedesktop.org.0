Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F93623AC3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 05:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB9510E65B;
	Thu, 10 Nov 2022 04:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9C10E65A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 04:02:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B9B261D84
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 04:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 775CDC4314E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 04:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668052923;
 bh=0RHqSCCvEpy4uNjIkA71JaT6/kneP8MUH8QC6BXFKLQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uXuAVIOv33WI07Xp12gf8OEBcL0kY8DNdeSDJmRydCGdwHg2pT0QYqZZe9f3e8DO/
 pmBc5Ux4Y4Gw3dxS1HTzb+sJzmmbVa7GPQLYBXoQ9wN3tqsvh+mmr7vXk7PQmCp8Ky
 bvuM5MHCWb11duP6J6OSIh42LV/ONSecXl6uhmgUI9zCSUEw+gEff0gkzzBVwpPwjH
 NQ7V+UhmjynVVt20hoI01mLmcRJlLdL4z9rowgDxoK72gJNYDCCd/YANIVqy3JxGh0
 FtQiB3zQFnqJPhaGMwI5k06hPx49kDcgYRFpRP4ddCldykKp563jfSXcWicspmfv8u
 gjNheg2lcYGbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 660BBC433E4; Thu, 10 Nov 2022 04:02:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Thu, 10 Nov 2022 04:02:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: francesco.burelli@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204181-2300-jM2dhlNQC1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204181

buro (francesco.burelli@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |francesco.burelli@proton.me

--- Comment #68 from buro (francesco.burelli@proton.me) ---
Hello, I get similar system freeze and I know exactly how to reproduce it (=
on
my machine): just visit https://www.unrealengine.com/ with Firefox 106.0.3 =
and
you get the freeze. It happens also in others websites but more randomly.
If you need more info I can give you, many thanks.

Info about my graphic card:

07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Tahiti XT [Radeon HD 7970/8970 OEM / R9 280X] (prog-if 00 [VGA controller])
        Subsystem: PC Partner Limited / Sapphire Technology Device 3001

uname -a
Linux arch-tower 6.0.6-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 29 Oct 2022 14:0=
8:39
+0000 x86_64 GNU/Linux

The log from journalctl:

Nov 09 19:30:29 arch-tower kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000020
Nov 09 19:30:29 arch-tower kernel: #PF: supervisor read access in kernel mo=
de
Nov 09 19:30:29 arch-tower kernel: #PF: error_code(0x0000) - not-present pa=
ge
Nov 09 19:30:29 arch-tower kernel: PGD 0 P4D 0=20
Nov 09 19:30:29 arch-tower kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
Nov 09 19:30:29 arch-tower kernel: CPU: 7 PID: 220976 Comm: firefox:cs0 Not
tainted 6.0.6-arch1-1 #1 a46cc4b882cfc11c3bbb09d6a0fab3dcad53b5c2
Nov 09 19:30:29 arch-tower kernel: Hardware name: System manufacturer System
Product Name/PRIME A320M-K, BIOS 5207 08/30/2019
Nov 09 19:30:29 arch-tower kernel: RIP: 0010:amdgpu_sa_bo_free+0x57/0x150
[amdgpu]
Nov 09 19:30:29 arch-tower kernel: Code: 00 00 4c 8b 60 20 48 89 d5 4c 89 e=
7 e8
22 fd 4b c3 48 85 ed 0f 84 a4 00 00 00 48 8b 45 30 a8 01 0f 85 98 00 00 00 =
48
8b 45 08 <48> 8b 40 20 48 85 c0 74 0c 48 89 ef e8 48 1e 6c c3 84 c0 75 77 4c
Nov 09 19:30:29 arch-tower kernel: RSP: 0018:ffffb2c98cedfa70 EFLAGS: 00010=
246
Nov 09 19:30:29 arch-tower kernel: RAX: 0000000000000000 RBX: ffff948784158=
e30
RCX: 0000000080800078
Nov 09 19:30:29 arch-tower kernel: RDX: 0000000000000001 RSI: ffff948784158=
e30
RDI: ffff94878b1e62f0
Nov 09 19:30:29 arch-tower kernel: RBP: ffff948784158d98 R08: 0000000000000=
000
R09: 0000000080800078
Nov 09 19:30:29 arch-tower kernel: R10: 0000000000000008 R11: 0000000010000=
000
R12: ffff94878b1e62f0
Nov 09 19:30:29 arch-tower kernel: R13: ffff94878b1e9628 R14: 00000000fffff=
ff4
R15: 0000000000000001
Nov 09 19:30:29 arch-tower kernel: FS:  00007f494b1ff6c0(0000)
GS:ffff9488969c0000(0000) knlGS:0000000000000000
Nov 09 19:30:29 arch-tower kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 09 19:30:29 arch-tower kernel: CR2: 0000000000000020 CR3: 0000000154e50=
000
CR4: 00000000003506e0
Nov 09 19:30:29 arch-tower kernel: Call Trace:
Nov 09 19:30:29 arch-tower kernel:  <TASK>
Nov 09 19:30:29 arch-tower kernel:  amdgpu_job_free+0x55/0xe0 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:29 arch-tower kernel:  amdgpu_cs_ioctl+0x506/0x1f30 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:29 arch-tower kernel:  ? amdgpu_cs_find_mapping+0x110/0x110
[amdgpu 3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:29 arch-tower kernel:  drm_ioctl_kernel+0xcd/0x170
Nov 09 19:30:29 arch-tower kernel:  drm_ioctl+0x231/0x410
Nov 09 19:30:29 arch-tower kernel:  ? amdgpu_cs_find_mapping+0x110/0x110
[amdgpu 3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:29 arch-tower kernel:  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:29 arch-tower kernel:  __x64_sys_ioctl+0x94/0xd0
Nov 09 19:30:29 arch-tower kernel:  do_syscall_64+0x5f/0x90
Nov 09 19:30:29 arch-tower kernel:  ? do_futex+0xde/0x1b0
Nov 09 19:30:29 arch-tower kernel:  ? __x64_sys_futex+0x92/0x1d0
Nov 09 19:30:29 arch-tower kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Nov 09 19:30:29 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:29 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:29 arch-tower kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Nov 09 19:30:29 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:29 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:29 arch-tower kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Nov 09 19:30:29 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:29 arch-tower kernel:  entry_SYSCALL_64_after_hwframe+0x63/0xcd
Nov 09 19:30:29 arch-tower kernel: RIP: 0033:0x7f494b515c0f
Nov 09 19:30:29 arch-tower kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 2=
4 60
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
Nov 09 19:30:29 arch-tower kernel: RSP: 002b:00007f494b1fe9c0 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Nov 09 19:30:29 arch-tower kernel: RAX: ffffffffffffffda RBX: 00007f494b1fe=
b38
RCX: 00007f494b515c0f
Nov 09 19:30:29 arch-tower kernel: RDX: 00007f494b1fea80 RSI: 00000000c0186=
444
RDI: 0000000000000018
Nov 09 19:30:29 arch-tower kernel: RBP: 00007f494b1fea80 R08: 00007f494b1fe=
b80
R09: 00007f494b1fea60
Nov 09 19:30:29 arch-tower kernel: R10: 00007f491f8cbd00 R11: 0000000000000=
246
R12: 00000000c0186444
Nov 09 19:30:29 arch-tower kernel: R13: 0000000000000018 R14: 00007f494b1fe=
b38
R15: 0000000000000002
Nov 09 19:30:29 arch-tower kernel:  </TASK>
Nov 09 19:30:29 arch-tower kernel: Modules linked in: iptable_nat xt_MASQUE=
RADE
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter =
uas
usb_storage ccm dm_crypt cbc encrypted_keys trusted asn1_encoder tee tpm
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common edac_mce_amd eeepc_=
wmi
snd_hda_codec_realtek asus_wmi kvm_amd snd_hda_codec_generic sparse_keymap
platform_profile ledtrig_audio snd_hda_codec_hdmi video wmi_bmof kvm
snd_hda_intel snd_intel_dspcfg irqbypass snd_intel_sdw_acpi mt7601u
crct10dif_pclmul snd_hda_codec crc32_pclmul polyval_clmulni snd_hda_core
polyval_generic mac80211 snd_hwdep gf128mul r8169 ghash_clmulni_intel snd_p=
cm
realtek aesni_intel mdio_devres snd_timer crypto_simd ccp cryptd mousedev
libarc4 sp5100_tco snd joydev rapl libphy pcspkr k10temp soundcore i2c_piix4
rng_core gpio_amdpt mac_hid cfg80211 gpio_generic wmi acpi_cpufreq rfkill
dm_multipath dm_mod crypto_user fuse bpf_preload ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 usbhid sr_mod
Nov 09 19:30:29 arch-tower kernel:  crc32c_intel xhci_pci cdrom
xhci_pci_renesas amdgpu drm_ttm_helper ttm gpu_sched drm_buddy
drm_display_helper cec
Nov 09 19:30:29 arch-tower kernel: CR2: 0000000000000020
Nov 09 19:30:29 arch-tower kernel: ---[ end trace 0000000000000000 ]---
Nov 09 19:30:29 arch-tower kernel: RIP: 0010:amdgpu_sa_bo_free+0x57/0x150
[amdgpu]
Nov 09 19:30:29 arch-tower kernel: Code: 00 00 4c 8b 60 20 48 89 d5 4c 89 e=
7 e8
22 fd 4b c3 48 85 ed 0f 84 a4 00 00 00 48 8b 45 30 a8 01 0f 85 98 00 00 00 =
48
8b 45 08 <48> 8b 40 20 48 85 c0 74 0c 48 89 ef e8 48 1e 6c c3 84 c0 75 77 4c
Nov 09 19:30:29 arch-tower kernel: RSP: 0018:ffffb2c98cedfa70 EFLAGS: 00010=
246
Nov 09 19:30:29 arch-tower kernel: RAX: 0000000000000000 RBX: ffff948784158=
e30
RCX: 0000000080800078
Nov 09 19:30:29 arch-tower kernel: RDX: 0000000000000001 RSI: ffff948784158=
e30
RDI: ffff94878b1e62f0
Nov 09 19:30:29 arch-tower kernel: RBP: ffff948784158d98 R08: 0000000000000=
000
R09: 0000000080800078
Nov 09 19:30:29 arch-tower kernel: R10: 0000000000000008 R11: 0000000010000=
000
R12: ffff94878b1e62f0
Nov 09 19:30:29 arch-tower kernel: R13: ffff94878b1e9628 R14: 00000000fffff=
ff4
R15: 0000000000000001
Nov 09 19:30:29 arch-tower kernel: FS:  00007f494b1ff6c0(0000)
GS:ffff9488969c0000(0000) knlGS:0000000000000000
Nov 09 19:30:29 arch-tower kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 09 19:30:29 arch-tower kernel: CR2: 0000000000000020 CR3: 0000000154e50=
000
CR4: 00000000003506e0
Nov 09 19:30:29 arch-tower kernel: note: firefox:cs0[220976] exited with
preempt_count 1
Nov 09 19:30:54 arch-tower kernel: watchdog: BUG: soft lockup - CPU#8 stuck=
 for
27s! [Renderer:202012]
Nov 09 19:30:54 arch-tower kernel: Modules linked in: iptable_nat xt_MASQUE=
RADE
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter =
uas
usb_storage ccm dm_crypt cbc encrypted_keys trusted asn1_encoder tee tpm
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common edac_mce_amd eeepc_=
wmi
snd_hda_codec_realtek asus_wmi kvm_amd snd_hda_codec_generic sparse_keymap
platform_profile ledtrig_audio snd_hda_codec_hdmi video wmi_bmof kvm
snd_hda_intel snd_intel_dspcfg irqbypass snd_intel_sdw_acpi mt7601u
crct10dif_pclmul snd_hda_codec crc32_pclmul polyval_clmulni snd_hda_core
polyval_generic mac80211 snd_hwdep gf128mul r8169 ghash_clmulni_intel snd_p=
cm
realtek aesni_intel mdio_devres snd_timer crypto_simd ccp cryptd mousedev
libarc4 sp5100_tco snd joydev rapl libphy pcspkr k10temp soundcore i2c_piix4
rng_core gpio_amdpt mac_hid cfg80211 gpio_generic wmi acpi_cpufreq rfkill
dm_multipath dm_mod crypto_user fuse bpf_preload ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 usbhid sr_mod
Nov 09 19:30:54 arch-tower kernel:  crc32c_intel xhci_pci cdrom
xhci_pci_renesas amdgpu drm_ttm_helper ttm gpu_sched drm_buddy
drm_display_helper cec
Nov 09 19:30:54 arch-tower kernel: CPU: 8 PID: 202012 Comm: Renderer Tainte=
d: G
     D            6.0.6-arch1-1 #1 a46cc4b882cfc11c3bbb09d6a0fab3dcad53b5c2
Nov 09 19:30:54 arch-tower kernel: Hardware name: System manufacturer System
Product Name/PRIME A320M-K, BIOS 5207 08/30/2019
Nov 09 19:30:54 arch-tower kernel: RIP:
0010:native_queued_spin_lock_slowpath+0x21f/0x2d0
Nov 09 19:30:54 arch-tower kernel: Code: 41 8d 4d 01 41 c1 e4 10 c1 e1 12 4=
4 09
e1 89 c8 c1 e8 10 66 87 43 02 89 c2 c1 e2 10 81 fa ff ff 00 00 77 3b 31 d2 =
eb
02 f3 90 <8b> 03 66 85 c0 75 f7 89 c6 66 31 f6 39 f1 0f 84 87 00 00 00 c6 03
Nov 09 19:30:54 arch-tower kernel: RSP: 0000:ffffb2c9a003f7e0 EFLAGS: 00000=
202
Nov 09 19:30:54 arch-tower kernel: RAX: 0000000000240101 RBX: ffff94878b1e6=
2f0
RCX: 0000000000240000
Nov 09 19:30:54 arch-tower kernel: RDX: 0000000000000000 RSI: 0000000000000=
101
RDI: ffff94878b1e62f0
Nov 09 19:30:54 arch-tower kernel: RBP: ffff948896a33b80 R08: ffffb2c9a003f=
7c8
R09: 0000000000000040
Nov 09 19:30:54 arch-tower kernel: R10: 0000000000200000 R11: ffffb2c9a003f=
b80
R12: 0000000000000000
Nov 09 19:30:54 arch-tower kernel: R13: 0000000000000008 R14: ffff94878b1e6=
518
R15: ffff94878b1e62f0
Nov 09 19:30:54 arch-tower kernel: FS:  00007efd265fc6c0(0000)
GS:ffff948896a00000(0000) knlGS:0000000000000000
Nov 09 19:30:54 arch-tower kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 09 19:30:54 arch-tower kernel: CR2: 00007efd04b68400 CR3: 0000000138d60=
000
CR4: 00000000003506e0
Nov 09 19:30:54 arch-tower kernel: Call Trace:
Nov 09 19:30:54 arch-tower kernel:  <TASK>
Nov 09 19:30:54 arch-tower kernel:  _raw_spin_lock+0x29/0x30
Nov 09 19:30:54 arch-tower kernel:  amdgpu_sa_bo_new+0xd5/0x560 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  ?
update_sd_lb_stats.constprop.0+0x10f/0x910
Nov 09 19:30:54 arch-tower kernel:  ? select_task_rq_fair+0x161/0x1a60
Nov 09 19:30:54 arch-tower kernel:  amdgpu_ib_get+0x43/0x90 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_job_alloc_with_ib+0x5b/0x80 [amd=
gpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_copy_buffer+0xc2/0x230 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_ttm_copy_mem_to_mem+0x396/0x770
[amdgpu 3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_bo_move+0x151/0x6d0 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  ttm_bo_handle_move_mem+0xa8/0x170 [ttm
3393e9853c224a250513194a7cd094617e0e2b51]
Nov 09 19:30:54 arch-tower kernel:  ttm_bo_validate+0x10c/0x160 [ttm
3393e9853c224a250513194a7cd094617e0e2b51]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_bo_fault_reserve_notify+0xbf/0x1=
50
[amdgpu 3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_gem_fault+0x89/0x100 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  __do_fault+0x36/0x110
Nov 09 19:30:54 arch-tower kernel:  do_fault+0x2a2/0x420
Nov 09 19:30:54 arch-tower kernel:  __handle_mm_fault+0x668/0xf70
Nov 09 19:30:54 arch-tower kernel:  handle_mm_fault+0xb2/0x290
Nov 09 19:30:54 arch-tower kernel:  do_user_addr_fault+0x1be/0x6a0
Nov 09 19:30:54 arch-tower kernel:  exc_page_fault+0x74/0x170
Nov 09 19:30:54 arch-tower kernel:  asm_exc_page_fault+0x26/0x30
Nov 09 19:30:54 arch-tower kernel: RIP: 0033:0x7efd4a16c7d5
Nov 09 19:30:54 arch-tower kernel: Code: fc ff 0f 1f 00 f3 0f 1e fa 48 89 f=
8 48
83 fa 20 0f 82 af 00 00 00 c5 fe 6f 06 48 83 fa 40 0f 87 3e 01 00 00 c5 fe =
6f
4c 16 e0 <c5> fe 7f 07 c5 fe 7f 4c 17 e0 c5 f8 77 c3 66 66 2e 0f 1f 84 00 00
Nov 09 19:30:54 arch-tower kernel: RSP: 002b:00007efd265f9698 EFLAGS: 00010=
246
Nov 09 19:30:54 arch-tower kernel: RAX: 00007efd04b68400 RBX: 00007efd21d36=
908
RCX: 00000000ffffffc0
Nov 09 19:30:54 arch-tower kernel: RDX: 0000000000000040 RSI: 00007efd3ab85=
c00
RDI: 00007efd04b68400
Nov 09 19:30:54 arch-tower kernel: RBP: 00007efd21d35000 R08: 0000000000040=
000
R09: 00007efd21d36918
Nov 09 19:30:54 arch-tower kernel: R10: 00007efd16c47c00 R11: 00007efd2396f=
000
R12: 0000000000000040
Nov 09 19:30:54 arch-tower kernel: R13: 0000000000000400 R14: 0000000000000=
000
R15: 00007efd21d35000
Nov 09 19:30:54 arch-tower kernel:  </TASK>
Nov 09 19:30:54 arch-tower kernel: watchdog: BUG: soft lockup - CPU#11 stuck
for 27s! [MediaPD~oder #1:283921]
Nov 09 19:30:54 arch-tower kernel: Modules linked in: iptable_nat xt_MASQUE=
RADE
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter =
uas
usb_storage ccm dm_crypt cbc encrypted_keys trusted asn1_encoder tee tpm
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common edac_mce_amd eeepc_=
wmi
snd_hda_codec_realtek asus_wmi kvm_amd snd_hda_codec_generic sparse_keymap
platform_profile ledtrig_audio snd_hda_codec_hdmi video wmi_bmof kvm
snd_hda_intel snd_intel_dspcfg irqbypass snd_intel_sdw_acpi mt7601u
crct10dif_pclmul snd_hda_codec crc32_pclmul polyval_clmulni snd_hda_core
polyval_generic mac80211 snd_hwdep gf128mul r8169 ghash_clmulni_intel snd_p=
cm
realtek aesni_intel mdio_devres snd_timer crypto_simd ccp cryptd mousedev
libarc4 sp5100_tco snd joydev rapl libphy pcspkr k10temp soundcore i2c_piix4
rng_core gpio_amdpt mac_hid cfg80211 gpio_generic wmi acpi_cpufreq rfkill
dm_multipath dm_mod crypto_user fuse bpf_preload ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 usbhid sr_mod
Nov 09 19:30:54 arch-tower kernel:  crc32c_intel xhci_pci cdrom
xhci_pci_renesas amdgpu drm_ttm_helper ttm gpu_sched drm_buddy
drm_display_helper cec
Nov 09 19:30:54 arch-tower kernel: CPU: 11 PID: 283921 Comm: MediaPD~oder #1
Tainted: G      D      L     6.0.6-arch1-1 #1
a46cc4b882cfc11c3bbb09d6a0fab3dcad53b5c2
Nov 09 19:30:54 arch-tower kernel: Hardware name: System manufacturer System
Product Name/PRIME A320M-K, BIOS 5207 08/30/2019
Nov 09 19:30:54 arch-tower kernel: RIP:
0010:native_queued_spin_lock_slowpath+0x6d/0x2d0
Nov 09 19:30:54 arch-tower kernel: Code: 00 77 7d f0 0f ba 2b 08 0f 92 c2 8=
b 03
0f b6 d2 c1 e2 08 30 e4 09 d0 3d ff 00 00 00 77 59 85 c0 74 0e 8b 03 84 c0 =
74
08 f3 90 <8b> 03 84 c0 75 f8 b8 01 00 00 00 66 89 03 65 48 ff 05 c5 24 11 7d
Nov 09 19:30:54 arch-tower kernel: RSP: 0018:ffffb2c9832c37c8 EFLAGS: 00000=
202
Nov 09 19:30:54 arch-tower kernel: RAX: 0000000000240101 RBX: ffff94878b1e6=
2f0
RCX: 0000000000000001
Nov 09 19:30:54 arch-tower kernel: RDX: 0000000000000000 RSI: 0000000000000=
001
RDI: ffff94878b1e62f0
Nov 09 19:30:54 arch-tower kernel: RBP: ffff94879ac18a30 R08: ffffb2c9832c3=
7b0
R09: 0000000000000040
Nov 09 19:30:54 arch-tower kernel: R10: 0000000000000000 R11: ffff9488238cb=
9d8
R12: ffffb2c9832c38d8
Nov 09 19:30:54 arch-tower kernel: R13: 0000000000000100 R14: ffff94878b1e6=
518
R15: ffff94878b1e62f0
Nov 09 19:30:54 arch-tower kernel: FS:  00007f49237fa6c0(0000)
GS:ffff948896ac0000(0000) knlGS:0000000000000000
Nov 09 19:30:54 arch-tower kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 09 19:30:54 arch-tower kernel: CR2: 00007efd142bbfe0 CR3: 0000000154e50=
000
CR4: 00000000003506e0
Nov 09 19:30:54 arch-tower kernel: Call Trace:
Nov 09 19:30:54 arch-tower kernel:  <TASK>
Nov 09 19:30:54 arch-tower kernel:  _raw_spin_lock+0x29/0x30
Nov 09 19:30:54 arch-tower kernel:  amdgpu_sa_bo_new+0xd5/0x560 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  ? __switch_to_asm+0x3e/0x60
Nov 09 19:30:54 arch-tower kernel:  ? finish_task_switch.isra.0+0x90/0x2d0
Nov 09 19:30:54 arch-tower kernel:  ? __schedule+0x34b/0x11c0
Nov 09 19:30:54 arch-tower kernel:  ?
update_sd_lb_stats.constprop.0+0x10f/0x910
Nov 09 19:30:54 arch-tower kernel:  amdgpu_ib_get+0x43/0x90 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_job_alloc_with_ib+0x5b/0x80 [amd=
gpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  ? kmem_cache_alloc_trace+0x15d/0x320
Nov 09 19:30:54 arch-tower kernel:  amdgpu_vm_sdma_prepare+0x2b/0x70 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_vm_update_range+0x1c0/0x770 [amd=
gpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_vm_bo_update+0x300/0x5a0 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_gem_va_ioctl+0x54f/0x590 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  ? amdgpu_gem_va_map_flags+0x80/0x80 [am=
dgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  drm_ioctl_kernel+0xcd/0x170
Nov 09 19:30:54 arch-tower kernel:  drm_ioctl+0x231/0x410
Nov 09 19:30:54 arch-tower kernel:  ? amdgpu_gem_va_map_flags+0x80/0x80 [am=
dgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu
3b0071ba2e7e576c543138f03ed9b8249042cca2]
Nov 09 19:30:54 arch-tower kernel:  __x64_sys_ioctl+0x94/0xd0
Nov 09 19:30:54 arch-tower kernel:  do_syscall_64+0x5f/0x90
Nov 09 19:30:54 arch-tower kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Nov 09 19:30:54 arch-tower kernel:  ? do_syscall_64+0x6b/0x90
Nov 09 19:30:54 arch-tower kernel:  ? exc_page_fault+0x74/0x170
Nov 09 19:30:54 arch-tower kernel:  entry_SYSCALL_64_after_hwframe+0x63/0xcd
Nov 09 19:30:54 arch-tower kernel: RIP: 0033:0x7f494b515c0f
Nov 09 19:30:54 arch-tower kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 2=
4 60
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
Nov 09 19:30:54 arch-tower kernel: RSP: 002b:00007f49237f7f70 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Nov 09 19:30:54 arch-tower kernel: RAX: ffffffffffffffda RBX: 00007f491e7f2=
3c0
RCX: 00007f494b515c0f
Nov 09 19:30:54 arch-tower kernel: RDX: 00007f49237f8010 RSI: 00000000c0286=
448
RDI: 0000000000000018
Nov 09 19:30:54 arch-tower kernel: RBP: 00007f49237f8010 R08: 000000010c400=
000
R09: 000000000000000e
Nov 09 19:30:54 arch-tower kernel: R10: 0000000000000000 R11: 0000000000000=
246
R12: 00000000c0286448
Nov 09 19:30:54 arch-tower kernel: R13: 0000000000000018 R14: 0000000000330=
000
R15: 0000000000000005
Nov 09 19:30:54 arch-tower kernel:  </TASK>
-- Boot c2c099679ad94b7190cf2380e047c12b --
Nov 09 19:31:40 arch-tower kernel: Linux version 6.0.6-arch1-1
(linux@archlinux) (gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39.0) #1 SMP
PREEMPT_DYNAMIC Sat, 29 Oct 2022 14:08:39 +0000
Nov 09 19:31:40 arch-tower kernel: Command line: initrd=3D\amd-ucode.img
initrd=3D\initramfs-linux.img root=3DPARTUUID=3D48a0f342-0f7d-7a4e-a0fd-7cc=
f9a7950fd
resume=3DPARTUUID=3Dfd3f4977-4b82-6945-8257-e60d5214141b rw acpi=3Don
radeon.si_support=3D0 radeon.cik_support=3D0 amdgpu.cik_support=3D1
amdgpu.si_support=3D1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
