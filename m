Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B635BB27A0
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 06:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047D010E04C;
	Thu,  2 Oct 2025 04:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JCxDVUbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B2210E04C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 04:29:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3947C603A2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 04:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94992C4CEFB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 04:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759379341;
 bh=iB8FHYeP6GhaXDwl+soDrfPPdjHo8kwG1bKbDpVK3Tc=;
 h=From:To:Subject:Date:From;
 b=JCxDVUbbQeb4M7Kcp0rf3e84+M+qRqCuLEhh+M4+ULHtkw86TsIycIaj7c7bvHdjg
 wEZOfbk5G+qURx+uCx7MlAfgnrcBtSMT4E5gBqG7tSc7pbRwloZfsy+5MyMNMGnVwT
 i/9WsdgF7nijW5i6UPsYeDqfqMzSjdV3d/khxGs1ofA4st6DA4eN7eUv0KWMYtOxvY
 yAEpw2kpFnYeuyXzLT7qMRNajq7ExSMmjsKRCpeyaNOOQ7m+522uGMr/5M/635bN4X
 nP/wsWtrWh3KopgJJpzrvJspptsJ0U7WzyCNHVfS+ufUf7hVyHJsAfBoT//3rDWPrq
 7qMLurtYVYkRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 85F8AC433E1; Thu,  2 Oct 2025 04:29:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220621] New: Display freezes ASUS AMD ROG z13
Date: Thu, 02 Oct 2025 04:29:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: billgat48@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220621

            Bug ID: 220621
           Summary: Display freezes ASUS AMD ROG z13
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: billgat48@pm.me
        Regression: No

ROG Flow Z13 GZ302EA_GZ302EA (1.0)
Linux 6.16.8-arch3-1
KDE Plasma 6.4.5
KWin (Wayland)

amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:90:crtc-1] flip_done timed out

display freezes spontaneously about 1/day, requires holding the power button
down, no tty (ctrl+alt+f2/f... doesn't work). Audio keeps playing, I can he=
ar
it detect me removing devices. usually crashes during low usage, never happ=
ens
while gaming. I usually use Display (DP-1): 5120x1440 in 49", 165 Hz [Exter=
nal]
I think I've seen this crash while not on external display once ... usually
plugged in laptop usb-c 4.0 -> usb-c monitor.=20

things I tried:=20
reinstalling arch
amdgpu.runpm=3D0 amdgpu.dcdebugmask=3D0x12
laptop usb-c 4.0 -> DP monitor
swapping out various applications=20
turning off wallpaper slideshow=20
adaptive sync

things im currently trying:
disable secure boot (i know direct rendering manager not digital rights, but
it's something I started doing the same time this started happening)=20


Oct 01 23:49:24 kernel: ------------[ cut here ]------------
Oct 01 23:49:24 kernel: WARNING: CPU: 17 PID: 1498 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8915
amdgpu_dm_atomic_commit_tail+0x37d8/0x3840 [amdgpu]
Oct 01 23:49:24 kernel: Modules linked in: udp_diag tcp_diag inet_diag
wireguard curve25519_x86_64 libcurve25519_generic ip6_udp_tunnel udp_tunnel
nft_masq nft_ct uinput ccm rfcomm snd_seq_dummy snd_seq_midi snd_hrtimer
snd_seq_midi_event snd_seq cmac algif_hash algif_skcipher af_alg bnep vfat =
fat
r8153_ecm cdc_ether usbnet snd_acp70 snd_acp_i2s snd_acp_pdm snd_acp_pcm
snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembran=
dt
amd_atl intel_rapl_msr snd_sof_amd_renoir intel_rapl_common snd_sof_amd_acp
snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_scodec_cs35l41=
_spi
snd_pci_ps snd_soc_acpi_amd_match snd_amd_sdw_acpi soundwire_amd
soundwire_generic_allocation snd_hda_codec_realtek soundwire_bus
snd_hda_codec_generic snd_soc_sdca snd_hda_scodec_component snd_soc_core
snd_compress snd_hda_codec_hdmi mt7925e ac97_bus snd_pcm_dmaengine
snd_hda_intel mt7925_common snd_usb_audio snd_rpl_pci_acp6x snd_intel_dspcfg
kvm_amd mt792x_lib snd_intel_sdw_acpi mt76_connac_lib snd_usbmidi_lib uvcvi=
deo
snd_acp_pci
Oct 01 23:49:24 kernel:  snd_hda_codec mt76 hid_sensor_accel_3d
snd_amd_acpi_mach snd_ump videobuf2_vmalloc kvm snd_rawmidi snd_hda_core
snd_acp_legacy_common hid_sensor_trigger uvc snd_hda_scodec_cs35l41_i2c
irqbypass snd_seq_device snd_pci_acp6x snd_hwdep industrialio_triggered_buf=
fer
snd_hda_scodec_cs35l41 videobuf2_memops polyval_clmulni mac80211 ucsi_acpi
btusb kfifo_buf snd_soc_cs_amp_lib videobuf2_v4l2 snd_pci_acp5x snd_pcm
ghash_clmulni_intel hid_sensor_iio_common r8152 snd_soc_cs35l41_lib sp5100_=
tco
typec_ucsi btrtl sha512_ssse3 snd_rn_pci_acp3x videobuf2_common industrialio
hid_sensor_custom mii cs_dsp btintel snd_timer snd_acp_config typec sha1_ss=
se3
amd_pmf btbcm videodev libphy snd snd_soc_acpi aesni_intel libarc4 i2c_piix4
amdtee btmtk roles hid_sensor_hub hid_multitouch mdio_bus bluetooth mousede=
v mc
joydev gpio_keys rapl asus_nb_wmi wmi_bmof cfg80211 pcspkr amdxdna ccp
thunderbolt i2c_smbus soundcore snd_pci_acp3x i2c_hid_acpi amd_sfh i2c_hid
serial_multi_instantiate tee amd_pmc soc_button_array mac_hid xt_hl
Oct 01 23:49:24 kernel:  ip6t_rt nft_reject_inet xt_LOG nf_reject_ipv4
nf_log_syslog nf_reject_ipv6 nft_reject xt_multiport xt_limit xt_addrtype
xt_tcpudp xt_conntrack nft_chain_nat ip6table_filter nf_nat ip6_tables
nf_conntrack nf_defrag_ipv6 iptable_filter nf_defrag_ipv4 nf_tables i2c_dev=
 sg
crypto_user loop dm_mod nfnetlink ip_tables x_tables hid_logitech_hidpp
hid_logitech_dj hid_asus asus_wmi sparse_keymap platform_profile rfkill amd=
gpu
amdxcp i2c_algo_bit drm_ttm_helper ttm drm_exec gpu_sched sdhci_pci
drm_suballoc_helper nvme sdhci_uhs2 drm_panel_backlight_quirks sdhci drm_bu=
ddy
nvme_core cqhci drm_display_helper video nvme_keyring mmc_core cec serio_raw
nvme_auth wmi
Oct 01 23:49:24 kernel: CPU: 17 UID: 0 PID: 1498 Comm: Xorg Not tainted
6.16.8-arch3-1 #1 PREEMPT(full)  c3805c1210d56bc7a68d560dd9e968bb1cc9c38e
Oct 01 23:49:24 kernel: Hardware name: ASUSTeK COMPUTER INC. ROG Flow Z13
GZ302EA_GZ302EA/GZ302EA, BIOS GZ302EA.308 03/24/2025
Oct 01 23:49:24 kernel: RIP: 0010:amdgpu_dm_atomic_commit_tail+0x37d8/0x3840
[amdgpu]
Oct 01 23:49:24 kernel: Code: 0b e9 f6 f8 ff ff 0f 0b 49 8d 84 24 a8 4f 04 =
00
c6 85 28 fe ff ff 00 48 89 85 30 fe ff ff e9 83 ce ff ff 0f 0b e9 ce ce ff =
ff
<0f> 0b e9 ea f8 ff ff 48 c7 85 20 fe ff ff 00 00 00 00 48 c7 85 f8
Oct 01 23:49:24 kernel: RSP: 0018:ffffcd1c02f6b690 EFLAGS: 00010086
Oct 01 23:49:24 kernel: RAX: 0000000000000001 RBX: 0000000000000282 RCX:
ffff8c451cac8118
Oct 01 23:49:24 kernel: RDX: 0000000000000001 RSI: 0000000000000286 RDI:
ffff8c4519400180
Oct 01 23:49:24 kernel: RBP: ffffcd1c02f6b8e8 R08: ffffcd1c02f6b584 R09:
0000000000000000
Oct 01 23:49:24 kernel: R10: ffff8c4ae9e60c00 R11: ffffcd1c02f6b5f4 R12:
ffff8c451cac8118
Oct 01 23:49:24 kernel: R13: ffff8c4519400010 R14: ffff8c451cac8000 R15:
ffff8c4fef4a5800
Oct 01 23:49:24 kernel: FS:  00007fce45adeec0(0000) GS:ffff8c54b1d5a000(000=
0)
knlGS:0000000000000000
Oct 01 23:49:24 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 01 23:49:24 kernel: CR2: 00007fb57abf5990 CR3: 000000010ce77000 CR4:
0000000000f50ef0
Oct 01 23:49:24 kernel: PKRU: 55555554
Oct 01 23:49:24 kernel: Call Trace:
Oct 01 23:49:24 kernel:  <TASK>
Oct 01 23:49:24 kernel:  commit_tail+0x9e/0x130
Oct 01 23:49:24 kernel:  drm_atomic_helper_commit+0x13c/0x180
Oct 01 23:49:24 kernel:  drm_atomic_commit+0xae/0xe0
Oct 01 23:49:24 kernel:  ? __pfx___drm_printfn_info+0x10/0x10
Oct 01 23:49:24 kernel:  drm_atomic_helper_set_config+0x7a/0xd0
Oct 01 23:49:24 kernel:  drm_mode_setcrtc+0x377/0x900
Oct 01 23:49:24 kernel:  ? __pfx_drm_mode_setcrtc+0x10/0x10
Oct 01 23:49:24 kernel:  drm_ioctl_kernel+0xab/0x100
Oct 01 23:49:24 kernel:  drm_ioctl+0x29b/0x530
Oct 01 23:49:24 kernel:  ? __pfx_drm_mode_setcrtc+0x10/0x10
Oct 01 23:49:24 kernel:  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu
92b91698f5fdc75bb5edcf1fccc3b23ea333fc47]
Oct 01 23:49:24 kernel:  __x64_sys_ioctl+0x94/0xe0
Oct 01 23:49:24 kernel:  do_syscall_64+0x81/0x970
Oct 01 23:49:24 kernel:  ? ksys_write+0xcd/0xf0
Oct 01 23:49:24 kernel:  ? __pfx_drm_mode_setcrtc+0x10/0x10
Oct 01 23:49:24 kernel:  ? drm_ioctl_kernel+0xab/0x100
Oct 01 23:49:24 kernel:  ? __check_object_size+0x44/0x1f0
Oct 01 23:49:24 kernel:  ? drm_ioctl+0x2d0/0x530
Oct 01 23:49:24 kernel:  ? __pfx_drm_mode_setcrtc+0x10/0x10
Oct 01 23:49:24 kernel:  ? amdgpu_drm_ioctl+0x6c/0x80 [amdgpu
92b91698f5fdc75bb5edcf1fccc3b23ea333fc47]
Oct 01 23:49:24 kernel:  ? __x64_sys_ioctl+0xb1/0xe0
Oct 01 23:49:24 kernel:  ? do_syscall_64+0x81/0x970
Oct 01 23:49:24 kernel:  ? __irq_exit_rcu+0x4c/0xf0
Oct 01 23:49:24 kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Oct 01 23:49:24 kernel: RIP: 0033:0x7fce45f1674d
Oct 01 23:49:24 kernel: Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 =
10
c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f =
05
<89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
Oct 01 23:49:24 kernel: RSP: 002b:00007ffe339e25d0 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
Oct 01 23:49:24 kernel: RAX: ffffffffffffffda RBX: 0000557648568860 RCX:
00007fce45f1674d
Oct 01 23:49:24 kernel: RDX: 00007ffe339e2660 RSI: 00000000c06864a2 RDI:
0000000000000011
Oct 01 23:49:24 kernel: RBP: 00007ffe339e2620 R08: 0000000000000000 R09:
00005576496ec3f0
Oct 01 23:49:24 kernel: R10: 00005576496ec1a0 R11: 0000000000000246 R12:
00007ffe339e2660
Oct 01 23:49:24 kernel: R13: 00000000c06864a2 R14: 0000000000000011 R15:
00005576488e9920
Oct 01 23:49:24 kernel:  </TASK>
Oct 01 23:49:24 kernel: ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
