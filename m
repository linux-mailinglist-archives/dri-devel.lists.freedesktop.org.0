Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FC2EAA38
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E166E0E8;
	Tue,  5 Jan 2021 11:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4166E0E8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:53:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A13B922287
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:53:18 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 9D41981F02; Tue,  5 Jan 2021 11:53:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211043] New: amdgpu: Mouse cursor freeze of external mouse
 after a while (after kernel crash?) (KDE Plasma)
Date: Tue, 05 Jan 2021 11:53:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kdebugs@staznosti.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211043-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211043

            Bug ID: 211043
           Summary: amdgpu: Mouse cursor freeze of external mouse after a
                    while (after kernel crash?) (KDE Plasma)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.0-1036-oem
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kdebugs@staznosti.sk
        Regression: No

[91295.652772] WARNING: CPU: 0 PID: 88314 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1555
dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[91295.652773] Modules linked in: uhid usbhid uas usb_storage snd_seq_dummy
snd_hrtimer ccm rfcomm snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel cmac snd_intel_dspcfg
soundwire_intel algif_hash soundwire_generic_allocation soundwire_cadence
algif_skcipher snd_hda_codec af_alg bnep snd_hda_core snd_hwdep soundwire_bus
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_seq_midi
snd_seq_midi_event iwlmvm snd_rawmidi joydev binfmt_misc mac80211 nls_iso8859_1
libarc4 snd_seq btusb edac_mce_amd snd_seq_device iwlwifi snd_timer uvcvideo
btrtl btbcm videobuf2_vmalloc btintel videobuf2_memops snd input_leds
videobuf2_v4l2 bluetooth videobuf2_common videodev kvm_amd ecdh_generic
asus_wmi mc hid_multitouch ecc serio_raw sparse_keymap snd_rn_pci_acp3x
wmi_bmof soundcore cfg80211 snd_pci_acp3x kvm ccp mac_hid sch_fq_codel msr
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs blake2b_generic
xor zstd_compress raid6_pq libcrc32c dm_mirror
[91295.652807]  dm_region_hash dm_log hid_generic amdgpu amd_iommu_v2 gpu_sched
crct10dif_pclmul i2c_algo_bit crc32_pclmul ttm ghash_clmulni_intel
drm_kms_helper aesni_intel syscopyarea sysfillrect sysimgblt fb_sys_fops
crypto_simd cec cryptd glue_helper rc_coredrm ahci nvme libahci i2c_piix4 r8169
nvme_core realtek wmi video i2c_hid hid
[91295.652828] CPU: 0 PID: 88314 Comm: Xorg Tainted: G        W        
5.6.0-1036-oem #39-Ubuntu
[91295.652829] Hardware name: SLIMBOOK PROX14-AMD/PROX14-AMD, BIOS N.1.06GRP01
07/06/2020
[91295.652940] RIP: 0010:dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[91295.652944] Code: c0 74 cb 4c 89 e2 48 89 df e8 78 97 d9 c5 eb be 49 8b 45
00 8b 90 e4 01 00 00 85 d2 75 d5 8b 86 4c 04 00 00 85c0 75 cb eb a4 <0f> 0b e9
14 fb ff ff 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41
[91295.652945] RSP: 0018:ffffade74478f810 EFLAGS: 00010202
[91295.652947] RAX: ffff890a8af1f400 RBX: ffff890a76f40000 RCX:
0000000000000008
[91295.652948] RDX: 0000000000000001 RSI: ffff8906868e0000 RDI:
ffff890a76f40000
[91295.652949] RBP: ffffade74478f848 R08: 0000000000000001 R09:
0000000000000000
[91295.652949] R10: 0000000000000001 R11: 0000000000000004 R12:
ffff8906868e0000
[91295.652950] R13: ffff8906868e01b8 R14: ffff8906868e01b8 R15:
0000000000000000
[91295.652952] FS:  00007f4c921a7a80(0000) GS:ffff890a8ee00000(0000)
knlGS:0000000000000000
[91295.652953] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[91295.652954] CR2: 000055d14c7c5734 CR3: 000000075a518000 CR4:
0000000000340ef0
[91295.652955] Call Trace:
[91295.653063]  dc_commit_state_no_check+0x4bc/0x8a0 [amdgpu]
[91295.653162]  dc_commit_state+0x96/0xb0 [amdgpu]
[91295.653266]  amdgpu_dm_atomic_commit_tail+0x344/0x11d0 [amdgpu]
[91295.653359]  ? amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
[91295.653450]  ? dm_read_reg_func+0x40/0xc0 [amdgpu]
[91295.653536]  ? generic_reg_get+0x22/0x40 [amdgpu]
[91295.653541]  ? _cond_resched+0x19/0x30
[91295.653612]  ? amdgpu_bo_pin_restricted+0x64/0x2b0 [amdgpu]
[91295.653620]  ? ttm_bo_move_to_lru_tail+0x2d/0xc0 [ttm]
[91295.653622]  ? ww_mutex_unlock+0x26/0x30
[91295.653627]  ? ttm_eu_backoff_reservation+0x49/0x70 [ttm]
[91295.653697]  ? amdgpu_bo_gpu_offset+0x23/0xa0 [amdgpu]
[91295.653794]  ? dm_plane_helper_prepare_fb+0x143/0x270 [amdgpu]
[91295.653797]  ? _cond_resched+0x19/0x30
[91295.653799]  ? wait_for_completion_timeout+0x3a/0x120
[91295.653801]  ? _cond_resched+0x19/0x30
[91295.653803]  ? wait_for_completion_interruptible+0x37/0x160
[91295.653816]  commit_tail+0x99/0x130 [drm_kms_helper]
[91295.653825]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
[91295.653920]  amdgpu_dm_atomic_commit+0x95/0xa0 [amdgpu]
[91295.653942]  drm_atomic_commit+0x4a/0x50 [drm]
[91295.653959]  drm_atomic_connector_commit_dpms+0xdf/0x100 [drm]
[91295.653978]  drm_mode_obj_set_property_ioctl+0x156/0x2d0 [drm]
[91295.653996]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[91295.654011]  drm_connector_property_set_ioctl+0x3b/0x60 [drm]
[91295.654026]  drm_ioctl_kernel+0xae/0xf0 [drm]
[91295.654042]  drm_ioctl+0x234/0x3d0 [drm]
[91295.654056]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[91295.654060]  ? sock_poll+0x7c/0xc0
[91295.654063]  ? ep_item_poll.isra.0+0x43/0xc0
[91295.654132]  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu]
[91295.654136]  ksys_ioctl+0x9d/0xd0
[91295.654138]  __x64_sys_ioctl+0x1a/0x20
[91295.654141]  do_syscall_64+0x57/0x1b0
[91295.654144]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[91295.654147] RIP: 0033:0x7f4c9250950b
[91295.654149] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 1000 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[91295.654150] RSP: 002b:00007ffd33b9e0a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[91295.654152] RAX: ffffffffffffffda RBX: 00007ffd33b9e0e0 RCX:
00007f4c9250950b
[91295.654153] RDX: 00007ffd33b9e0e0 RSI: 00000000c01064ab RDI:
000000000000000d
[91295.654154] RBP: 00000000c01064ab R08: 0000000000000000 R09:
000055d14bb22660
[91295.654155] R10: 0000000000000000 R11: 0000000000000246 R12:
000055d14b9829d0
[91295.654155] R13: 000000000000000d R14: 000055d14bb20f30 R15:
0000000000000000
[91295.654159] ---[ end trace ef998694dbf9c828 ]---
[91295.784946] ------------[ cut here ]------------
[91295.785096] WARNING: CPU: 7 PID: 88314 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1555
dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[91295.785096] Modules linked in: uhid usbhid uas usb_storage snd_seq_dummy
snd_hrtimer ccm rfcomm snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel cmac snd_intel_dspcfg
soundwire_intel algif_hash soundwire_generic_allocation soundwire_cadence
algif_skcipher snd_hda_codec af_alg bnep snd_hda_core snd_hwdep soundwire_bus
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_seq_midi
snd_seq_midi_event iwlmvm snd_rawmidi joydev binfmt_misc mac80211 nls_iso8859_1
libarc4 snd_seq btusb edac_mce_amd snd_seq_device iwlwifi snd_timer uvcvideo
btrtl btbcm videobuf2_vmalloc btintel videobuf2_memops snd input_leds
videobuf2_v4l2 bluetooth videobuf2_common videodev kvm_amd ecdh_generic
asus_wmi mc hid_multitouch ecc serio_raw sparse_keymap snd_rn_pci_acp3x
wmi_bmof soundcore cfg80211 snd_pci_acp3x kvm ccp mac_hid sch_fq_codel msr
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs blake2b_generic
xor zstd_compress raid6_pq libcrc32c dm_mirror
[91295.785143]  dm_region_hash dm_log hid_generic amdgpu amd_iommu_v2 gpu_sched
crct10dif_pclmul i2c_algo_bit crc32_pclmul ttm ghash_clmulni_intel
drm_kms_helper aesni_intel syscopyarea sysfillrect sysimgblt fb_sys_fops
crypto_simd cec cryptd glue_helper rc_coredrm ahci nvme libahci i2c_piix4 r8169
nvme_core realtek wmi video i2c_hid hid
[91295.785168] CPU: 7 PID: 88314 Comm: Xorg Tainted: G        W        
5.6.0-1036-oem #39-Ubuntu
[91295.785169] Hardware name: SLIMBOOK PROX14-AMD/PROX14-AMD, BIOS N.1.06GRP01
07/06/2020
[91295.785326] RIP: 0010:dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[91295.785330] Code: c0 74 cb 4c 89 e2 48 89 df e8 78 97 d9 c5 eb be 49 8b 45
00 8b 90 e4 01 00 00 85 d2 75 d5 8b 86 4c 04 00 00 85c0 75 cb eb a4 <0f> 0b e9
14 fb ff ff 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41
[91295.785331] RSP: 0018:ffffade74478f810 EFLAGS: 00010202
[91295.785334] RAX: ffff890a8af1f400 RBX: ffff890a76f40000 RCX:
0000000000000008
[91295.785335] RDX: 0000000000000001 RSI: ffff890a1fa20000 RDI:
ffff890a76f40000
[91295.785337] RBP: ffffade74478f848 R08: 0000000000000001 R09:
0000000000000000
[91295.785338] R10: 0000000000000001 R11: 0000000000000004 R12:
ffff890a1fa20000
[91295.785340] R13: ffff890a1fa201b8 R14: ffff890a1fa201b8 R15:
0000000000000000
[91295.785343] FS:  00007f4c921a7a80(0000) GS:ffff890a8efc0000(0000)
knlGS:0000000000000000
[91295.785344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[91295.785346] CR2: 00007fdd4c9fc000 CR3: 000000075a518000 CR4:
0000000000340ee0
[91295.785348] Call Trace:
[91295.785509]  dc_commit_state_no_check+0x2cd/0x8a0 [amdgpu]
[91295.785654]  dc_commit_state+0x96/0xb0 [amdgpu]
[91295.785806]  amdgpu_dm_atomic_commit_tail+0x344/0x11d0 [amdgpu]
[91295.785940]  ? amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
[91295.786068]  ? dm_read_reg_func+0x40/0xc0 [amdgpu]
[91295.786199]  ? generic_reg_get+0x22/0x40 [amdgpu]
[91295.786205]  ? _cond_resched+0x19/0x30
[91295.786298]  ? amdgpu_bo_pin_restricted+0x64/0x2b0 [amdgpu]
[91295.786308]  ? ttm_bo_move_to_lru_tail+0x2d/0xc0 [ttm]
[91295.786311]  ? ww_mutex_unlock+0x26/0x30
[91295.786317]  ? ttm_eu_backoff_reservation+0x49/0x70 [ttm]
[91295.786405]  ? amdgpu_bo_gpu_offset+0x23/0xa0 [amdgpu]
[91295.786525]  ? dm_plane_helper_prepare_fb+0x143/0x270 [amdgpu]
[91295.786525]  ? _cond_resched+0x19/0x30
[91295.786525]  ? wait_for_completion_timeout+0x3a/0x120
[91295.786525]  ? _cond_resched+0x19/0x30
[91295.786525]  ? wait_for_completion_interruptible+0x37/0x160
[91295.786525]  commit_tail+0x99/0x130 [drm_kms_helper]
[91295.786525]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
[91295.786525]  amdgpu_dm_atomic_commit+0x95/0xa0 [amdgpu]
[91295.786525]  drm_atomic_commit+0x4a/0x50 [drm]
[91295.786525]  drm_atomic_connector_commit_dpms+0xdf/0x100 [drm]
[91295.786525]  drm_mode_obj_set_property_ioctl+0x156/0x2d0 [drm]
[91295.786525]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[91295.786525]  drm_connector_property_set_ioctl+0x3b/0x60 [drm]
[91295.786525]  drm_ioctl_kernel+0xae/0xf0 [drm]
[91295.786525]  drm_ioctl+0x234/0x3d0 [drm]
[91295.786525]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[91295.786525]  ? sock_poll+0x7c/0xc0
[91295.786525]  ? ep_item_poll.isra.0+0x43/0xc0
[91295.786950]  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu]
[91295.786950]  ksys_ioctl+0x9d/0xd0
[91295.786950]  __x64_sys_ioctl+0x1a/0x20
[91295.786950]  do_syscall_64+0x57/0x1b0
[91295.786950]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[91295.786950] RIP: 0033:0x7f4c9250950b
[91295.786950] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 1000 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[91295.786950] RSP: 002b:00007ffd33b9e0a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[91295.786950] RAX: ffffffffffffffda RBX: 00007ffd33b9e0e0 RCX:
00007f4c9250950b
[91295.786950] RDX: 00007ffd33b9e0e0 RSI: 00000000c01064ab RDI:
000000000000000d
[91295.786950] RBP: 00000000c01064ab R08: 0000000000000000 R09:
000055d14bb22660
[91295.786950] R10: 0000000000000000 R11: 0000000000000246 R12:
000055d14b9829d0
[91295.786950] R13: 000000000000000d R14: 000055d14bb20f30 R15:
0000000000000000
[91295.786950] ---[ end trace ef998694dbf9c829 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
