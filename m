Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEBE7938A0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3F10E5A1;
	Wed,  6 Sep 2023 09:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2510E183
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:43:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C27760FB3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF0AEC433CC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693993425;
 bh=bjUQDXEApITJebQd8PrufE7N1Ekd43HKzSpxz+BoMYo=;
 h=From:To:Subject:Date:From;
 b=oHNwqApT3QmI+yOlnAMqgjGHCGk+AY4KOGero1NU8goc/Ju6qbGr3FziFWQDzCDUt
 zQYrN/efg3VvrX9lJeRzfnQymRM1oq/g7ATEtsEsDf/Iu1+Nh0wn4aibHkUR6CPvWA
 So1KTcb0Gr2Gd8JWsmi+my1MG7k5Uxe/N8LiktGoxc07ljJOuvIEMYJTuicbLfWFFh
 MklXvLwWbPb5nW+h6XXoFKi5IMqoW+x4QEM7jWguPdItdrU3k6ZiCun6aglnTocTDk
 KidtveM4GVTCA63QLbvTlnt7Hl2dZw6rD3AGssDzMe7EyOFVLAlyFjL40stLnZsjJa
 D0f4JMgkOnF9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CA14DC53BCD; Wed,  6 Sep 2023 09:43:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217876] New: RIP: 0010:calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
Date: Wed, 06 Sep 2023 09:43:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rondo.sp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217876-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217876

            Bug ID: 217876
           Summary: RIP: 0010:calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rondo.sp@gmail.com
        Regression: No

Using the new kernel from the 6.5 branch (right now using 6.5.1), at one po=
int,
randomly, the screen freezes and stops responding. A few seconds later it g=
oes
black, then the screen returns again but still does not respond. A few seco=
nds
later it goes black again and then again the screen returns, still
unresponsive, and stays that way indefinitely, having to restart the comput=
er.

With the latest kernel from the 6.4 branch (6.4.14) this problem does not o=
ccur
and works perfectly.

My computer:

Operating System: Manjaro Linux=20
KDE Plasma Version: 5.27.7
KDE Frameworks Version: 5.109.0
Qt Version: 5.15.10
Kernel Version: 6.5.1-1-MANJARO (64-bit)=20
Graphics Platform: Wayland
Processors: 16 =C3=97 AMD Ryzen 7 5800H with Radeon Graphics
Memory: 62,2 GiB of RAM
Graphics Processor: AMD Radeon Graphics
Manufacturer: Micro Computer (HK) Tech Limited
Product Name: UM580


--------------------------------------

6/9/23 10:42    kernel  [drm] Initialized amdgpu 3.54.0 20150101 for
0000:04:00.0 on minor 1
6/9/23 10:42    kernel  ------------[ cut here ]------------
6/9/23 10:42    kernel  WARNING: CPU: 5 PID: 397 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2342
calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
6/9/23 10:42    kernel  Modules linked in: qrtr cmac algif_hash algif_skcip=
her
af_alg bnep mousedev joydev hid_sensor_gyro_3d hid_sensor_accel_3d
hid_sensor_magn_3d hid_sensor_trigger industrialio_triggered_buffer kfifo_b=
uf
hid_sensor_iio_common hid_sensor_hub amdgpu(+) vfat fat snd_sof_amd_rembran=
dt
snd_sof_amd_renoir snd_sof_amd_acp usbhid intel_rapl_msr snd_sof_pci
intel_rapl_common snd_sof_xtensa_dsp edac_mce_amd snd_sof kvm_amd snd_sof_u=
tils
snd_hda_codec_conexant amdxcp snd_soc_core mt7921e snd_hda_codec_generic
drm_buddy ledtrig_audio mt7921_common snd_compress kvm gpu_sched
snd_hda_codec_hdmi ac97_bus mt76_connac_lib i2c_algo_bit snd_pcm_dmaengine
irqbypass snd_hda_intel btusb crct10dif_pclmul snd_intel_dspcfg mt76 snd_pc=
i_ps
crc32_pclmul snd_intel_sdw_acpi btrtl polyval_clmulni btbcm snd_rpl_pci_acp=
6x
btintel polyval_generic drm_suballoc_helper snd_hda_codec drm_ttm_helper bt=
mtk
gf128mul mac80211 ttm snd_hda_core snd_acp_pci ghash_clmulni_intel sha512_s=
sse3
bluetooth aesni_intel snd_hwdep snd_pci_acp6x crypto_simd
6/9/23 10:42    kernel   drm_display_helper ecdh_generic snd_pcm cryptd lib=
arc4
sp5100_tco crc16 wmi_bmof cec rapl pcspkr snd_timer snd_pci_acp5x cfg80211
snd_rn_pci_acp3x snd_acp_config ccp snd video snd_soc_acpi k10temp igc
soundcore snd_pci_acp3x i2c_piix4 rfkill amd_sfh cm32181 wmi i2c_hid_acpi
industrialio i2c_hid mac_hid crypto_user fuse loop dm_mod bpf_preload ip_ta=
bles
x_tables btrfs blake2b_generic libcrc32c crc32c_generic xor raid6_pq nvme
nvme_core xhci_pci crc32c_intel xhci_pci_renesas nvme_common
6/9/23 10:42    kernel  CPU: 5 PID: 397 Comm: (udev-worker) Tainted: G     =
   W
         6.5.1-1-MANJARO #1 7346bd254052f3eff560d630d13644e007627eb3
6/9/23 10:42    kernel  Hardware name: Micro Computer (HK) Tech Limited
UM580/F6BFC, BIOS 5.07 02/10/2023
6/9/23 10:42    kernel  RIP: 0010:calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
6/9/23 10:42    kernel  Code: ab aa aa aa c1 e1 04 48 0f af ca 48 c1 e9 24 =
eb
a3 8d 14 f6 8d 0c 95 00 00 00 00 ba ab aa aa aa 48 0f af ca 48 c1 e9 24 eb =
8a
<0f> 0b eb 86 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
6/9/23 10:42    kernel  RSP: 0018:ffffb5a98795f708 EFLAGS: 00010297
6/9/23 10:42    kernel  RAX: ffff8abdc44f0800 RBX: ffff8abdc44f0800 RCX:
000000000016a8c8
6/9/23 10:42    kernel  RDX: 0000000000000005 RSI: 000000000016a8c8 RDI:
ffff8abdc44f0800
6/9/23 10:42    kernel  RBP: ffff8abde18e0000 R08: 0000000000000000 R09:
ffff8abdc44f0a90
6/9/23 10:42    kernel  R10: 0000000000000006 R11: 0000000000000000 R12:
ffff8abde647dc00
6/9/23 10:42    kernel  R13: ffff8abdc44f0858 R14: ffff8abdca2df800 R15:
ffff8abdc44f0800
6/9/23 10:42    kernel  FS:  00007ff1c9f04480(0000) GS:ffff8acc8e740000(000=
0)
knlGS:0000000000000000
6/9/23 10:42    kernel  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
6/9/23 10:42    kernel  CR2: 000055e942cc18e0 CR3: 0000000104e0e000 CR4:
0000000000750ee0
6/9/23 10:42    kernel  PKRU: 55555554
6/9/23 10:42    kernel  Call Trace:
6/9/23 10:42    kernel   <TASK>
6/9/23 10:42    kernel   ? calculate_phy_pix_clks+0xd1/0xe0 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   ? __warn+0x81/0x130
6/9/23 10:42    kernel   ? calculate_phy_pix_clks+0xd1/0xe0 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   ? report_bug+0x171/0x1a0
6/9/23 10:42    kernel   ? handle_bug+0x3c/0x80
6/9/23 10:42    kernel   ? exc_invalid_op+0x17/0x70
6/9/23 10:42    kernel   ? asm_exc_invalid_op+0x1a/0x20
6/9/23 10:42    kernel   ? calculate_phy_pix_clks+0xd1/0xe0 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   dc_validate_stream+0x35/0xc0 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   create_validate_stream_for_sink+0x1fe/0x390 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   amdgpu_dm_connector_mode_valid+0x57/0x1b0 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   drm_connector_mode_valid+0x3b/0x60
6/9/23 10:42    kernel   __drm_helper_update_and_validate+0xfe/0x3c0
6/9/23 10:42    kernel   ? amdgpu_dm_connector_get_modes+0x28c/0x520 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   ? srso_alias_return_thunk+0x5/0x7f
6/9/23 10:42    kernel   drm_helper_probe_single_connector_modes+0x2ab/0x540
6/9/23 10:42    kernel   drm_client_modeset_probe+0x24b/0x1530
6/9/23 10:42    kernel   __drm_fb_helper_initial_config_and_unlock+0x3d/0x5=
40
6/9/23 10:42    kernel   ? amdgpu_driver_open_kms+0xe2/0x270 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   ? srso_alias_return_thunk+0x5/0x7f
6/9/23 10:42    kernel   drm_fbdev_generic_client_hotplug+0x6a/0xb0
6/9/23 10:42    kernel   drm_client_register+0x79/0xc0
6/9/23 10:42    kernel   amdgpu_pci_probe+0x3b0/0x440 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   local_pci_probe+0x45/0xa0
6/9/23 10:42    kernel   pci_device_probe+0xc1/0x260
6/9/23 10:42    kernel   ? sysfs_do_create_link_sd+0x6e/0xe0
6/9/23 10:42    kernel   really_probe+0x19e/0x3e0
6/9/23 10:42    kernel   ? __pfx___driver_attach+0x10/0x10
6/9/23 10:42    kernel   __driver_probe_device+0x78/0x160
6/9/23 10:42    kernel   driver_probe_device+0x1f/0x90
6/9/23 10:42    kernel   __driver_attach+0xd2/0x1c0
6/9/23 10:42    kernel   bus_for_each_dev+0x88/0xd0
6/9/23 10:42    kernel   bus_add_driver+0x116/0x220
6/9/23 10:42    kernel   driver_register+0x59/0x100
6/9/23 10:42    kernel   ? __pfx_amdgpu_init+0x10/0x10 [amdgpu
fa58ae024af9f7e54af3774a5faf04403d37fbec]
6/9/23 10:42    kernel   do_one_initcall+0x5d/0x320
6/9/23 10:42    kernel   do_init_module+0x60/0x240
6/9/23 10:42    kernel   __do_sys_init_module+0x17f/0x1b0
6/9/23 10:42    kernel   do_syscall_64+0x60/0x90
6/9/23 10:42    kernel   ? vfs_read+0x201/0x350
6/9/23 10:42    kernel   ? srso_alias_return_thunk+0x5/0x7f
6/9/23 10:42    kernel   ? ksys_read+0x6f/0xf0
6/9/23 10:42    kernel   ? srso_alias_return_thunk+0x5/0x7f
6/9/23 10:42    kernel   ? syscall_exit_to_user_mode+0x2b/0x40
6/9/23 10:42    kernel   ? srso_alias_return_thunk+0x5/0x7f
6/9/23 10:42    kernel   ? do_syscall_64+0x6c/0x90
6/9/23 10:42    kernel   entry_SYSCALL_64_after_hwframe+0x6e/0xd8
6/9/23 10:42    kernel  RIP: 0033:0x7ff1ca111f5e
6/9/23 10:42    kernel  Code: 48 8b 0d d5 bd 12 00 f7 d8 64 89 01 48 83 c8 =
ff
c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a2 bd 12 00 f7 d8 64 89 01 48
6/9/23 10:42    kernel  RSP: 002b:00007ffc841e3a68 EFLAGS: 00000246 ORIG_RA=
X:
00000000000000af
6/9/23 10:42    kernel  RAX: ffffffffffffffda RBX: 000055e942cc1830 RCX:
00007ff1ca111f5e
6/9/23 10:42    kernel  RDX: 00007ff1ca7f4343 RSI: 00000000017ce92e RDI:
00007ff1c5526010
6/9/23 10:42    kernel  RBP: 00007ff1ca7f4343 R08: 0000000000004480 R09:
0000000000000000
6/9/23 10:42    kernel  R10: 00007ff1ca23eb20 R11: 0000000000000246 R12:
0000000000020000
6/9/23 10:42    kernel  R13: 000055e942db9a30 R14: 000055e942cc1830 R15:
000055e942dbc1e0
6/9/23 10:42    kernel   </TASK>
6/9/23 10:42    kernel  ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
