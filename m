Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAA80C137
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 07:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0E310E07A;
	Mon, 11 Dec 2023 06:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A7910E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 06:18:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BF3CEB80B50
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 06:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24F76C433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702275496;
 bh=NuFcqU8afB+TIINCzP9c1TYuriTbLghf9o+XiIqDqKY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HfDR0dxyYecKO2m/rIvfz/3O+dxwiHdXbDJmDDzXtBSyGnj7YaWNaXVlQNflR1q6e
 /ImNM/AJN8B3GPVE079yy0iPmHm+Rw09ryJPfaErJ55b6juMK9//prmIX9Q2BgscvW
 skuguvAbcBDbir71bG6ve7aYwnC6eNEllbi9/lLl3Ci3Tv9tOwLYQHtgFFL/Qs7doW
 rPlQrvWJC/Gv9oMKKeivq2ycQnqXHIsViyYfB/iRJvMVpmUhisVzBeMCH1Iaom0nGb
 BTn1jIie0Z2SScDxSiK+sn9hpZ3kJWxqC7LpwskblsyOazUU+6kXf1dURZtNybmfre
 voVRwk08YU6Dw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0F159C53BD1; Mon, 11 Dec 2023 06:18:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218250] Regression nouveau driver
Date: Mon, 11 Dec 2023 06:18:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 19.jaime.91@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218250-2300-sBUMsxDAq5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218250-2300@https.bugzilla.kernel.org/>
References: <bug-218250-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218250

--- Comment #2 from Jaime P=C3=A9rez (19.jaime.91@gmail.com) ---
No graphical env
[  439.049257] ------------[ cut here ]------------
[  439.049262] WARNING: CPU: 5 PID: 67651 at include/drm/ttm/ttm_resource.h=
:313
nouveau_ttm_fini+0x216/0x2c0 [nouveau]
[  439.049609] Modules linked in: nouveau(E+) rfcomm snd_seq_dummy snd_hrti=
mer
xt_nat xt_tcpudp veth xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat
nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user
xfrm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netfilter bridge stp
llc ccm overlay cmac algif_hash algif_skcipher af_alg bnep binfmt_misc
nls_iso8859_1 snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_realtek
snd_hda_codec_generic snd_soc_avs ledtrig_audio snd_soc_hda_codec
snd_hda_ext_core snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine
snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core
snd_hwdep snd_pcm intel_rapl_msr intel_rapl_common intel_tcc_cooling
x86_pkg_temp_thermal snd_seq_midi intel_powerclamp snd_seq_midi_event
ath10k_pci snd_rawmidi coretemp uvcvideo btusb videobuf2_vmalloc btrtl
ath10k_core btintel snd_seq uvc ath rtsx_usb_ms videobuf2_memops kvm_intel
btbcm btmtk mei_pxp mei_hdcp memstick snd_seq_device videobuf2_v4l2 kvm
mac80211 bluetooth snd_timer
[  439.049740]  videodev snd acer_wmi videobuf2_common ecdh_generic rapl
intel_cstate intel_wmi_thunderbolt mc wmi_bmof joydev sparse_keymap ecc
soundcore ee1004 mei_me cfg80211 libarc4 mei intel_pch_thermal acpi_pad
hid_multitouch input_leds mac_hid serio_raw msr parport_pc ppdev lp parport
efi_pstore dmi_sysfs ip_tables x_tables autofs4 btrfs blake2b_generic xor
raid6_pq libcrc32c dm_mirror dm_region_hash dm_log rtsx_usb_sdmmc rtsx_usb
usbhid i915 drm_gpuvm mxm_wmi drm_exec gpu_sched drm_buddy i2c_algo_bit
drm_ttm_helper ttm drm_display_helper hid_generic cec rc_core i2c_hid_acpi
i2c_hid crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel hid
sha512_ssse3 i2c_i801 r8169 sha256_ssse3 intel_lpss_pci nvme sha1_ssse3 rea=
ltek
ahci intel_lpss i2c_smbus video drm nvme_core xhci_pci libahci idma64
xhci_pci_renesas wmi pinctrl_sunrisepoint aesni_intel crypto_simd cryptd [l=
ast
unloaded: nouveau]
[  439.049875] CPU: 5 PID: 67651 Comm: insmod Tainted: G        W   E=20=20=
=20=20=20
6.7.0-rc1+ #170
[  439.049881] Hardware name: Acer Aspire VX5-591G/Wish_KLS, BIOS V1.06
07/07/2017
[  439.049884] RIP: 0010:nouveau_ttm_fini+0x216/0x2c0 [nouveau]
[  439.050230] Code: 41 5c 41 5d 41 5e 41 5f 5d 31 c0 31 d2 31 c9 31 f6 31 =
ff
c3 cc cc cc cc be 02 00 00 00 4c 89 ef e8 1f 9d e7 ff e9 bb fe ff ff <0f> 0=
b e9
0c ff ff ff 0f 0b e9 46 fe ff ff be 03 00 00 00 48 89 55
[  439.050235] RSP: 0018:ffffc900092c37e0 EFLAGS: 00010206
[  439.050240] RAX: ffff888123879ab0 RBX: ffff888123879ab0 RCX:
ffff8881920f9838
[  439.050244] RDX: ffff888123879a80 RSI: 0000000000000000 RDI:
0000000000000000
[  439.050247] RBP: ffffc900092c3818 R08: 0000000000000000 R09:
0000000000000000
[  439.050250] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff888123603800
[  439.050253] R13: ffff88811d1ccc50 R14: ffff88811d1cc000 R15:
0000000000000000
[  439.050256] FS:  00007fbb9318b040(0000) GS:ffff88885ed40000(0000)
knlGS:0000000000000000
[  439.050260] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  439.050264] CR2: 00007fc0c587dec4 CR3: 000000011e104002 CR4:
00000000003706f0
[  439.050268] Call Trace:
[  439.050271]  <TASK>
[  439.050275]  ? show_regs+0x6d/0x80
[  439.050284]  ? __warn+0x89/0x160
[  439.050292]  ? nouveau_ttm_fini+0x216/0x2c0 [nouveau]
[  439.050626]  ? report_bug+0x17e/0x1b0
[  439.050634]  ? handle_bug+0x46/0x90
[  439.050641]  ? exc_invalid_op+0x18/0x80
[  439.050646]  ? asm_exc_invalid_op+0x1b/0x20
[  439.050655]  ? nouveau_ttm_fini+0x216/0x2c0 [nouveau]
[  439.050966]  ? kfree+0x78/0x120
[  439.050975]  nouveau_drm_device_init+0x1a2/0x9b0 [nouveau]
[  439.051347]  ? pci_enable_device_flags+0x27/0x180
[  439.051356]  ? drmm_add_final_kfree+0x26/0x70 [drm]
[  439.051494]  nouveau_drm_probe+0x137/0x280 [nouveau]
[  439.051867]  local_pci_probe+0x44/0xb0
[  439.051876]  pci_device_probe+0xc5/0x280
[  439.051885]  really_probe+0x1c9/0x430
[  439.051893]  __driver_probe_device+0x8c/0x190
[  439.051900]  driver_probe_device+0x24/0xd0
[  439.051906]  __driver_attach+0x10b/0x210
[  439.051912]  ? __pfx___driver_attach+0x10/0x10
[  439.051918]  bus_for_each_dev+0x8a/0xf0
[  439.051925]  driver_attach+0x1e/0x30
[  439.051930]  bus_add_driver+0x127/0x240
[  439.051937]  driver_register+0x5e/0x130
[  439.051945]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
[  439.052209]  __pci_register_driver+0x62/0x70
[  439.052217]  nouveau_drm_init+0x177/0xff0 [nouveau]
[  439.052452]  do_one_initcall+0x5b/0x340
[  439.052463]  do_init_module+0x68/0x260
[  439.052469]  load_module+0x21a9/0x2510
[  439.052485]  init_module_from_file+0x97/0xe0
[  439.052489]  ? init_module_from_file+0x97/0xe0
[  439.052498]  idempotent_init_module+0x11c/0x2b0
[  439.052507]  __x64_sys_finit_module+0x64/0xd0
[  439.052513]  do_syscall_64+0x5c/0xf0
[  439.052520]  ? do_syscall_64+0x6b/0xf0
[  439.052526]  ? syscall_exit_to_user_mode+0x37/0x60
[  439.052532]  ? do_syscall_64+0x6b/0xf0
[  439.052538]  ? do_syscall_64+0x6b/0xf0
[  439.052545]  ? syscall_exit_to_user_mode+0x37/0x60
[  439.052550]  ? do_syscall_64+0x6b/0xf0
[  439.052555]  ? irqentry_exit_to_user_mode+0x17/0x20
[  439.052560]  ? irqentry_exit+0x43/0x50
[  439.052564]  ? exc_page_fault+0x94/0x1b0
[  439.052569]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  439.052574] RIP: 0033:0x7fbb92915ded
[  439.052580] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d fb ff 0d 00 f7 d8 64 89 01 48
[  439.052584] RSP: 002b:00007fff0904ab08 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[  439.052590] RAX: ffffffffffffffda RBX: 0000564d9e13f700 RCX:
00007fbb92915ded
[  439.052594] RDX: 0000000000000000 RSI: 0000564d9d6dcc3a RDI:
0000000000000003
[  439.052597] RBP: 0000564d9d6dcc3a R08: 0000000000000000 R09:
0000564d9e1420e0
[  439.052600] R10: 0000000000000003 R11: 0000000000000246 R12:
0000000000000000
[  439.052603] R13: 0000564d9e143110 R14: 00007fff0904ad48 R15:
0000564d9e13f810
[  439.052611]  </TASK>
[  439.052613] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
