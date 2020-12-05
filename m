Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66C2CFB61
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 13:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8189709;
	Sat,  5 Dec 2020 12:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6989709
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 12:58:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210495] New: CPU: 12 PID: 3302 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1555
 dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
Date: Sat, 05 Dec 2020 12:58:19 +0000
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
Message-ID: <bug-210495-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210495

            Bug ID: 210495
           Summary: CPU: 12 PID: 3302 at
                    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_h
                    wseq.c:1555
                    dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.0-1035-oem
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kdebugs@staznosti.sk
        Regression: No

[42438.463884] WARNING: CPU: 12 PID: 3302 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1555
dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[42438.463884] Modules linked in: cdc_ether usbnet r8152 mii snd_usb_audio
snd_usbmidi_lib usbhid snd_seq_dummy snd_hrtimer ccm rfcomm cmac algif_hash
algif_skcipher af_alg bnep snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg soundwire_intel
soundwire_generic_allocation soundwire_cadence snd_hda_codec snd_hda_core
snd_hwdep soundwire_bus snd_soc_core binfmt_misc snd_compress ac97_bus
snd_pcm_dmaengine snd_pcm iwlmvm mac80211 uvcvideo snd_seq_midi
videobuf2_vmalloc videobuf2_memops snd_seq_midi_event joydev videobuf2_v4l2
btusb videobuf2_common nls_iso8859_1 btrtl libarc4 edac_mce_amd snd_rawmidi
btbcm btintel videodev kvm_amd bluetooth iwlwifi mc snd_seq kvm ecdh_generic
ecc snd_seq_device input_leds asus_wmi snd_timer sparse_keymap wmi_bmof
serio_raw hid_multitouch cfg80211 snd snd_rn_pci_acp3x ccp soundcore
snd_pci_acp3x mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables
x_tables autofs4 btrfs blake2b_generic xor
[42438.463884]  zstd_compress raid6_pq libcrc32c dm_mirror dm_region_hash
dm_log hid_generic amdgpu amd_iommu_v2 gpu_sched i2c_algo_bit ttm
crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel syscopyarea
aesni_intel sysfillrect sysimgblt fb_sys_fopscrypto_simd cec cryptd rc_core
glue_helper drm ahci nvme i2c_piix4 r8169 libahci nvme_core realtek wmi video
i2c_hid hid
[42438.463884] CPU: 12 PID: 3302 Comm: Xorg Tainted: G        W        
5.6.0-1035-oem #37-Ubuntu
[42438.463884] Hardware name: SLIMBOOK PROX14-AMD/PROX14-AMD, BIOS N.1.06GRP01
07/06/2020
[42438.463975] RIP: 0010:dcn20_program_front_end_for_ctx+0x574/0x580 [amdgpu]
[42438.463999] Code: c0 74 cb 4c 89 e2 48 89 df e8 78 97 d0 d7 eb be 49 8b 45
00 8b 90 e4 01 00 00 85 d2 75 d5 8b 86 4c 04 00 00 85c0 75 cb eb a4 <0f> 0b e9
14 fb ff ff 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41
[42438.463999] RSP: 0018:ffffab29437bf810 EFLAGS: 00010202
[42438.463999] RAX: ffff9236da0cf800 RBX: ffff9236d7fb0000 RCX:
0000000000000008
[42438.463999] RDX: 0000000000000001 RSI: ffff92334eac0000 RDI:
ffff9236d7fb0000
[42438.463999] RBP: ffffab29437bf848 R08: 0000000000000001 R09:
0000000000000000
[42438.463999] R10: 0000000000000001 R11: 0000000000000004 R12:
ffff92334eac0000
[42438.463999] R13: ffff92334eac01b8 R14: ffff92334eac01b8 R15:
0000000000000000
[42438.463999] FS:  00007fb6c9c86a80(0000) GS:ffff9236ef900000(0000)
knlGS:0000000000000000
[42438.463999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[42438.463999] CR2: 0000563c33d0a8c4 CR3: 00000007324da000 CR4:
0000000000340ee0
[42438.463999] Call Trace:
[42438.463999]  dc_commit_state_no_check+0x2cd/0x8a0 [amdgpu]
[42438.464081]  dc_commit_state+0x96/0xb0 [amdgpu]
[42438.464081]  amdgpu_dm_atomic_commit_tail+0x344/0x11d0 [amdgpu]
[42438.464081]  ? amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
[42438.464081]  ? dm_read_reg_func+0x40/0xc0 [amdgpu]
[42438.464081]  ? generic_reg_get+0x22/0x40 [amdgpu]
[42438.464081]  ? _cond_resched+0x19/0x30
[42438.464081]  ? amdgpu_bo_pin_restricted+0x64/0x2b0 [amdgpu]
[42438.464081]  ? ttm_bo_move_to_lru_tail+0x2d/0xc0 [ttm]
[42438.464081]  ? ww_mutex_unlock+0x26/0x30
[42438.464081]  ? ttm_eu_backoff_reservation+0x49/0x70 [ttm]
[42438.464081]  ? amdgpu_bo_gpu_offset+0x23/0xa0 [amdgpu]
[42438.464081]  ? dm_plane_helper_prepare_fb+0x143/0x270 [amdgpu]
[42438.464081]  ? _cond_resched+0x19/0x30
[42438.464081]  ? wait_for_completion_timeout+0x3a/0x120
[42438.464081]  ? _cond_resched+0x19/0x30
[42438.464081]  ? wait_for_completion_interruptible+0x37/0x160
[42438.464081]  commit_tail+0x99/0x130 [drm_kms_helper]
[42438.464081]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
[42438.464081]  amdgpu_dm_atomic_commit+0x95/0xa0 [amdgpu]
[42438.464081]  drm_atomic_commit+0x4a/0x50 [drm]
[42438.464081]  drm_atomic_connector_commit_dpms+0xdf/0x100 [drm]
[42438.464081]  drm_mode_obj_set_property_ioctl+0x156/0x2d0 [drm]
[42438.464081]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[42438.464081]  drm_connector_property_set_ioctl+0x3b/0x60 [drm]
[42438.464081]  drm_ioctl_kernel+0xae/0xf0 [drm]
[42438.464081]  drm_ioctl+0x234/0x3d0 [drm]
[42438.464081]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[42438.464081]  ? sock_poll+0x7c/0xc0
[42438.464081]  ? ep_item_poll.isra.0+0x43/0xc0
[42438.464081]  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu]
[42438.464081]  ksys_ioctl+0x9d/0xd0
[42438.464081]  __x64_sys_ioctl+0x1a/0x20
[42438.464081]  do_syscall_64+0x57/0x1b0
[42438.464081]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[42438.464081] RIP: 0033:0x7fb6c9fe850b
[42438.464081] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 1000 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[42438.464081] RSP: 002b:00007ffef46286c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[42438.464081] RAX: ffffffffffffffda RBX: 00007ffef4628700 RCX:
00007fb6c9fe850b
[42438.464081] RDX: 00007ffef4628700 RSI: 00000000c01064ab RDI:
000000000000000d
[42438.464081] RBP: 00000000c01064ab R08: 0000000000000000 R09:
0000563c330786a0
[42438.464081] R10: 0000000000000000 R11: 0000000000000246 R12:
0000563c32ed89d0
[42438.464081] R13: 000000000000000d R14: 0000563c33077230 R15:
0000000000000000
[42438.464081] ---[ end trace 2bc2c8a24b812ca7 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
