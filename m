Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DB54C4D4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 11:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3CD10ED6D;
	Wed, 15 Jun 2022 09:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D63F10E638
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:39:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A422961ACC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17745C341C0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655285958;
 bh=QlUvv0PSBtzneUBkz0jYWVJ7VEr1qbcPe9bkXyZkq5o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QDgTjSWNqLjnalayR95I+FCr+YRxewxlIB5B/HFFHrUuT1mLR9/BNx78e5n0wC8Xl
 u9WIHAMwwlpWjwhlMnhCsfi0hPVMO8wPaM8xjLx2aBK59qkb1GpNCo4uGZrbmeFFsj
 PVGq+9r3xnV5x9TTibVvF0Go6oguk4bGZDULE7rxkT1qhT9J7CbvVPa92YQSG3k5P6
 2d5Hfkoyd0qLUOKx5HM1tuUM6xnd6vMBlAe2JlsdADTACWZRSr3Lxo02OWRH3+cfhO
 W3UI08VtvyvgAMjlXP1DtU8GYywUloD1F/02YsNTq/x0jR8a8Ui8VyWGp8+7jybScI
 cWi2WUxS6dPZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0769FCC13B0; Wed, 15 Jun 2022 09:39:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Wed, 15 Jun 2022 09:39:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tr.ml@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216092-2300-H4zQjwPn82@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

RockT (tr.ml@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tr.ml@gmx.de

--- Comment #1 from RockT (tr.ml@gmx.de) ---
I see exactly the same with Manjaro testing kernel 5.19.0-rc1.


[    7.843798] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[    7.852927] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[    7.852928] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[    7.853513] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successfully!
[    7.853691] ------------[ cut here ]------------
[    7.853692] WARNING: CPU: 0 PID: 432 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.c:98
rn_vbios_smu_send_msg_with_param+0xf1/0x100 [amdgpu]
[    7.853897] Modules linked in: amd64_edac(-) pcc_cpufreq(-) fjes(+)
snd_usb_audio(+) mhi_wwan_ctrl mhi_wwan_mbim snd_usbmidi_lib snd_rawmidi
snd_seq_device bnep squashfs loop btusb btrtl qrtr btbcm uvcvideo btintel b=
tmtk
videobuf2_vmalloc videobuf2_memops intel_rapl_msr snd_acp3x_rn snd_soc_dmic
bluetooth videobuf2_v4l2 videobuf2_common videodev snd_acp3x_pdm_dma vfat
ecdh_generic hid_multitouch iwlmvm snd_sof_amd_renoir think_lmi(+) crc16 mc=
 fat
snd_ctl_led snd_hda_codec_realtek firmware_attributes_class snd_sof_amd_acp
wmi_bmof intel_rapl_common amdgpu(+) snd_sof_pci mac80211 snd_hda_codec_gen=
eric
snd_hda_codec_hdmi snd_sof snd_hda_intel snd_intel_dspcfg snd_sof_utils
snd_intel_sdw_acpi snd_soc_core libarc4 edac_mce_amd snd_hda_codec snd_comp=
ress
iwlwifi ac97_bus gpu_sched kvm_amd snd_hda_core snd_pcm_dmaengine drm_buddy
snd_acp_pci drm_ttm_helper iwlmei snd_pci_acp6x thinkpad_acpi ttm snd_pci_a=
cp5x
snd_hwdep ledtrig_audio r8169 cfg80211 kvm snd_pcm snd_rn_pci_acp3x ucsi_ac=
pi
[    7.853926]  platform_profile snd_timer snd_acp_config realtek
drm_display_helper snd typec_ucsi irqbypass rfkill mhi_pci_generic mdio_dev=
res
sp5100_tco snd_soc_acpi tpm_crb snd_pci_acp3x cec soundcore rapl psmouse mei
libphy typec mhi i2c_piix4 k10temp roles i2c_hid_acpi tpm_tis i2c_hid video=
 wmi
tpm_tis_core amd_pmc acpi_cpufreq pinctrl_amd joydev mousedev mac_hid uinput
ipmi_devintf ipmi_msghandler fuse crypto_user bpf_preload ip_tables x_tables
hid_logitech_hidpp xfs libcrc32c crc32c_generic hid_logitech_dj hid_jabra
usbhid dm_crypt cbc encrypted_keys trusted asn1_encoder tee tpm dm_mod
serio_raw atkbd libps2 crct10dif_pclmul crc32_pclmul vivaldi_fmap crc32c_in=
tel
ghash_clmulni_intel aesni_intel nvme crypto_simd ccp xhci_pci cryptd i8042
nvme_core rng_core xhci_pci_renesas serio
[    7.853954] CPU: 0 PID: 432 Comm: systemd-udevd Not tainted 5.19.0-1-MAN=
JARO
#1 12b6001e0e27e2c5de0e86e6e0c9807155e77ed6
[    7.853957] Hardware name: LENOVO 20XF006GGE/20XF006GGE, BIOS R1NET50W
(1.20) 04/14/2022
[    7.853958] RIP: 0010:rn_vbios_smu_send_msg_with_param+0xf1/0x100 [amdgp=
u]
[    7.854144] Code: f8 01 75 1b 48 8b 7d 00 5b be 93 62 01 00 48 c7 c2 a0 =
9f
6c c1 5d 41 5c 41 5d e9 3a ed f4 ff 3d fe 00 00 00 74 de 0f 0b eb da <0f> 0=
b e9
58 ff ff ff 0f 1f 84 00 00 00 00 00 66 0f 1f 00 0f 1f 44
[    7.854146] RSP: 0018:ffff9ae4030076f0 EFLAGS: 00010202
[    7.854148] RAX: 00000000000000fe RBX: 0000000000030d41 RCX:
ffffffffc1938118
[    7.854149] RDX: 0000000000000000 RSI: 000000000001629b RDI:
ffff8be184400000
[    7.854150] RBP: ffff8be186cdf800 R08: ffff8be1a1086800 R09:
0000000000000cb1
[    7.854151] R10: 000000000000001e R11: 0036ee8000000000 R12:
000000000000000d
[    7.854152] R13: 0000000000000001 R14: 000000000000018f R15:
ffff8be186cdf800
[    7.854153] FS:  00007f8967b45080(0000) GS:ffff8be84ee00000(0000)
knlGS:0000000000000000
[    7.854154] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.854154] CR2: 00005636d87b17c8 CR3: 0000000105fde000 CR4:
0000000000750ef0
[    7.854155] PKRU: 55555554
[    7.854156] Call Trace:
[    7.854158]  <TASK>
[    7.854160]  rn_clk_mgr_construct+0x151/0x620 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.854316]  dc_clk_mgr_create+0x42c/0x5d0 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.854464]  dc_create+0x23c/0x5b0 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.854620]  amdgpu_dm_init.isra.0+0x22d/0x350 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.854775]  ? dev_vprintk_emit+0x177/0x19c
[    7.854781]  dm_hw_init+0x12/0x20 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.854927]  amdgpu_device_init.cold+0x17b4/0x1d57 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.855089]  amdgpu_driver_load_kms+0x19/0x130 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.855214]  amdgpu_pci_probe+0x148/0x360 [amdgpu
a6a2d017171775457fc880c1e7e3ceb4f3d662e5]
[    7.855335]  local_pci_probe+0x42/0x80
[    7.855339]  pci_device_probe+0xc1/0x220
[    7.855341]  ? sysfs_do_create_link_sd+0x6a/0xd0
[    7.855344]  really_probe+0x1bc/0x390
[    7.855348]  __driver_probe_device+0xfc/0x170
[    7.855349]  driver_probe_device+0x1f/0x90
[    7.855351]  __driver_attach+0xbf/0x1b0
[    7.855352]  ? __device_attach_driver+0xe0/0xe0
[    7.855353]  bus_for_each_dev+0x84/0xd0
[    7.855355]  bus_add_driver+0x15d/0x200
[    7.855357]  driver_register+0x8d/0xe0
[    7.855358]  ? 0xffffffffc1acb000
[    7.855359]  do_one_initcall+0x5a/0x220
[    7.855363]  do_init_module+0x4a/0x1e0
[    7.855365]  __do_sys_init_module+0x138/0x1b0
[    7.855367]  do_syscall_64+0x5c/0x90
[    7.855370]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[    7.855372] RIP: 0033:0x7f896831299e
[    7.855374] Code: 48 8b 0d fd a3 0e 00 f7 d8 64 89 01 48 83 c8 ff c3 66 =
2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d ca a3 0e 00 f7 d8 64 89 01 48
[    7.855375] RSP: 002b:00007ffdbabccaf8 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[    7.855376] RAX: ffffffffffffffda RBX: 00005564361c9ba0 RCX:
00007f896831299e
[    7.855376] RDX: 00007f896899a32c RSI: 00000000011c22e7 RDI:
00007f8964af6010
[    7.855377] RBP: 00007f8964af6010 R08: 00005564361c2ae0 R09:
0000000000000000
[    7.855377] R10: 0000000000000005 R11: 0000000000000246 R12:
00007f896899a32c
[    7.855378] R13: 00005564361c4e80 R14: 00005564361c9ba0 R15:
000055643611f560
[    7.855379]  </TASK>
[    7.855380] ---[ end trace 0000000000000000 ]---
[    7.855519] [drm] Display Core initialized with v3.2.186!

System:
Lenovo T14s
CPU AMD Ryzen 7 PRO 5850U with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
