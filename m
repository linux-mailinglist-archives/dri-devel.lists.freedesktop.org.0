Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997957781D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 22:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEC94220;
	Sun, 17 Jul 2022 20:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004394220
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 20:08:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A90061341
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB1DC341D4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658088503;
 bh=iL344+tzsGsrazMMiqguo6u/MTWspqPiWllcJwd41ks=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h8h2gCi7bYNCKpY26gmbeWj1G1v5pgf3XvzevWBiqia7ybeo1M3XDfW66G32bZQsU
 NAqfoqEZIFngeQZ30TmBgMRDpj2TIes9/1ly1D13+YclrjIzWg7j51WL6x0YEfsG1f
 eKMmrDi5CpQOeeYiGJoA8sVPz6R7D2R0fLvB3lhRaOwoxf/aXSFO4JhMv8E4pkNNjd
 QwGwQhaVWHRzixeEHEB76U+P0pfGzlD6HiyWp5Z3sinu7UOAeVx64aNvV2MYROzRrE
 mZxlLEkqEjldZhI3kDmzVFVP+mDGi66EBQzm+P0KdXoOWbP1hJKcofc1hmVN+EZswL
 TCILuFRF98PWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BAC21CC13BA; Sun, 17 Jul 2022 20:08:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 17 Jul 2022 20:08:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-5ZcjTxfLRw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #83 from Danil (s48gs.w@gmail.com) ---
Log from what I described above - "fixed just by switching to
system-terminal(ctrl+alt+f1)", nothing crash even GPU apps keep working, ju=
st
huge mouse+UI freeze and switching to F1 terminal and back fix it (Wayland).
Logs:

Jul 17 22:54:04 home-danil kernel: amdgpu 0000:07:00.0: amdgpu: Failed to s=
end
Message 7.
Jul 17 22:54:09 home-danil kernel: amdgpu 0000:07:00.0: amdgpu: Failed to s=
end
Message 7.
Jul 17 22:54:12 home-danil kernel: ------------[ cut here ]------------
Jul 17 22:54:12 home-danil kernel: WARNING: CPU: 1 PID: 1100 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_sm=
u.c:120
rv1_vbios_smu_send_msg_with_param+0xa3/0xb0 [amdgpu]
Jul 17 22:54:12 home-danil kernel: Modules linked in: dm_crypt essiv authenc
trusted asn1_encoder tee nvidia_uvm(POE) nvidia_modeset(POE) nvidia(POE)
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device af_packet nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_=
ipv6
nft_reject nft_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security ip_set iscsi_ibft iscsi_boot_sysfs nfnetlink rfkill
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter =
qrtr
vboxnetadp(O) vboxnetflt(O) vboxdrv(O) dmi_sysfs joydev intel_rapl_msr
intel_rapl_common snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio edac_mce_amd snd_hda_intel snd_intel_ds=
pcfg
kvm_amd snd_intel_sdw_acpi snd_hda_codec r8169 pcspkr snd_hda_core kvm real=
tek
snd_hwdep snd_pcm wmi_bmof mdio_devres snd_timer
Jul 17 22:54:12 home-danil kernel:  libphy irqbypass snd soundcore efi_psto=
re
i2c_piix4 gpio_amdpt gpio_generic acpi_cpufreq k10temp tiny_power_button
nls_iso8859_1 squashfs nls_cp437 loop ext4 mbcache vfat jbd2 fat fuse confi=
gfs
ip_tables x_tables hid_generic usbhid uas usb_storage amdgpu crct10dif_pclm=
ul
crc32_pclmul ghash_clmulni_intel drm_ttm_helper ttm iommu_v2 gpu_sched
i2c_algo_bit drm_dp_helper drm_kms_helper aesni_intel crypto_simd syscopyar=
ea
sysfillrect sysimgblt fb_sys_fops cryptd drm cec xhci_pci xhci_pci_renesas
sp5100_tco ccp rc_core xhci_hcd usbcore wmi video button btrfs blake2b_gene=
ric
libcrc32c crc32c_intel xor raid6_pq sg dm_multipath dm_mod scsi_dh_rdac
scsi_dh_emc scsi_dh_alua msr efivarfs
Jul 17 22:54:12 home-danil kernel: CPU: 1 PID: 1100 Comm: systemd-logind
Tainted: P           OE     5.18.4-1-default #1 openSUSE Tumbleweed
59778fa2462c9ee971468464596d3fbe14e51d2e
Jul 17 22:54:12 home-danil kernel: Hardware name: To Be Filled By O.E.M.
A320M-DVS R4.0/A320M-DVS R4.0, BIOS P7.10 12/23/2021
Jul 17 22:54:12 home-danil kernel: RIP:
0010:rv1_vbios_smu_send_msg_with_param+0xa3/0xb0 [amdgpu]
Jul 17 22:54:12 home-danil kernel: Code: 62 01 00 e8 8f 4e f5 ff 85 c0 74 d=
8 83
f8 01 75 19 48 8b 7d 00 5b be 93 62 01 00 48 c7 c2 00 99 cd c0 5d 41 5c e9 =
6d
4e f5 ff <0f> 0b eb e3 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 81 c6 e7 03
Jul 17 22:54:12 home-danil kernel: RSP: 0018:ffff9f0a00b1f580 EFLAGS: 00010=
246
Jul 17 22:54:12 home-danil kernel: RAX: 00007570227d95d8 RBX: 0000000000000=
000
RCX: 0000000000000001
Jul 17 22:54:12 home-danil kernel: RDX: 0000000000009288 RSI: 0000000000008=
b82
RDI: 00007570227d0350
Jul 17 22:54:12 home-danil kernel: RBP: ffff8b0388bf3c00 R08: 0000000000002=
700
R09: 0000000000002700
Jul 17 22:54:12 home-danil kernel: R10: ffff9f0a00b1f630 R11: 0000000000000=
003
R12: 0000000000000097
Jul 17 22:54:12 home-danil kernel: R13: ffff8b0386ec98a0 R14: ffff8b0388bf3=
c00
R15: ffff8b03c04a0000
Jul 17 22:54:12 home-danil kernel: FS:  00007fb68308cb40(0000)
GS:ffff8b06c0a40000(0000) knlGS:0000000000000000
Jul 17 22:54:12 home-danil kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul 17 22:54:12 home-danil kernel: CR2: 00003e74003afe38 CR3: 000000018ef3c=
000
CR4: 00000000003506e0
Jul 17 22:54:12 home-danil kernel: Call Trace:
Jul 17 22:54:12 home-danil kernel:  <TASK>
Jul 17 22:54:12 home-danil kernel:  rv1_vbios_smu_set_dispclk+0x46/0xb0 [am=
dgpu
e7857b98c028928796f1e71af6f4284e57f7c0e3]
Jul 17 22:54:12 home-danil kernel:  rv1_update_clocks+0x254/0x500 [amdgpu
e7857b98c028928796f1e71af6f4284e57f7c0e3]
Jul 17 22:54:12 home-danil kernel:  dcn10_prepare_bandwidth+0x6b/0x130 [amd=
gpu
e7857b98c028928796f1e71af6f4284e57f7c0e3]
Jul 17 22:54:12 home-danil kernel:  dc_commit_updates_for_stream+0x1b69/0x1=
f90
[amdgpu e7857b98c028928796f1e71af6f4284e57f7c0e3]
Jul 17 22:54:12 home-danil kernel:  ? mutex_lock+0xe/0x30
Jul 17 22:54:12 home-danil kernel:  ? flush_workqueue+0x177/0x3a0
Jul 17 22:54:12 home-danil kernel:  amdgpu_dm_atomic_commit_tail+0x1627/0x2=
720
[amdgpu e7857b98c028928796f1e71af6f4284e57f7c0e3]
Jul 17 22:54:12 home-danil kernel:  ? ttm_resource_compat+0x23/0x50 [ttm
63072f655d2dc7ed260c9d980e7b7104612ede60]
Jul 17 22:54:12 home-danil kernel:  commit_tail+0x94/0x120 [drm_kms_helper
9e4d316863dffca879cbc8a3a12d452ad7e0a149]
Jul 17 22:54:12 home-danil kernel:  drm_atomic_helper_commit+0x10f/0x140
[drm_kms_helper 9e4d316863dffca879cbc8a3a12d452ad7e0a149]
Jul 17 22:54:12 home-danil kernel:=20
drm_client_modeset_commit_atomic+0x1e4/0x220 [drm
93e548a999b532667e8d1d66f85cd72b61d212a3]
Jul 17 22:54:12 home-danil kernel:  drm_client_modeset_commit_locked+0x56/0=
x150
[drm 93e548a999b532667e8d1d66f85cd72b61d212a3]
Jul 17 22:54:12 home-danil kernel:  drm_fb_helper_set_par+0x78/0xd0
[drm_kms_helper 9e4d316863dffca879cbc8a3a12d452ad7e0a149]
Jul 17 22:54:12 home-danil kernel:  fb_set_var+0x19d/0x380
Jul 17 22:54:12 home-danil kernel:  ? update_load_avg+0x7e/0x730
Jul 17 22:54:12 home-danil kernel:  ? update_load_avg+0x7e/0x730
Jul 17 22:54:12 home-danil kernel:  fbcon_blank+0x206/0x2c0
Jul 17 22:54:12 home-danil kernel:  do_unblank_screen+0xa7/0x150
Jul 17 22:54:12 home-danil kernel:  complete_change_console+0x54/0x120
Jul 17 22:54:12 home-danil kernel:  vt_ioctl+0x12c8/0x13b0
Jul 17 22:54:12 home-danil kernel:  ? __x64_sys_ioctl+0x8d/0xc0
Jul 17 22:54:12 home-danil kernel:  tty_ioctl+0x283/0x860
Jul 17 22:54:12 home-danil kernel:  ? __sys_sendmsg+0x57/0xa0
Jul 17 22:54:12 home-danil kernel:  ? __seccomp_filter+0x314/0x4d0
Jul 17 22:54:12 home-danil kernel:  __x64_sys_ioctl+0x8d/0xc0
Jul 17 22:54:12 home-danil kernel:  do_syscall_64+0x5b/0x80
Jul 17 22:54:12 home-danil kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Jul 17 22:54:12 home-danil kernel: RIP: 0033:0x7fb683be145f
Jul 17 22:54:12 home-danil kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 2=
4 60
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
Jul 17 22:54:12 home-danil kernel: RSP: 002b:00007ffd5c30c340 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Jul 17 22:54:12 home-danil kernel: RAX: ffffffffffffffda RBX: 0000000000000=
017
RCX: 00007fb683be145f
Jul 17 22:54:12 home-danil kernel: RDX: 0000000000000001 RSI: 0000000000005=
605
RDI: 0000000000000017
Jul 17 22:54:12 home-danil kernel: RBP: 0000000000000000 R08: 00007ffd5c30c=
340
R09: 000055c0f8a6f55e
Jul 17 22:54:12 home-danil kernel: R10: 00007ffd5c30c380 R11: 0000000000000=
246
R12: 000055c0f8a45430
Jul 17 22:54:12 home-danil kernel: R13: 00007ffd5c30c420 R14: 00007ffd5c30c=
418
R15: 0000000000000006
Jul 17 22:54:12 home-danil kernel:  </TASK>
Jul 17 22:54:12 home-danil kernel: ---[ end trace 0000000000000000 ]---
Jul 17 22:54:15 home-danil kernel: amdgpu 0000:07:00.0: amdgpu: Failed to s=
end
Message 7.
Jul 17 22:54:15 home-danil kernel: rfkill: input handler enabled
Jul 17 22:54:20 home-danil systemd[1]: Started Getty on tty2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
