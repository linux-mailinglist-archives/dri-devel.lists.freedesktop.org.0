Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347A1947E4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 20:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862726E91C;
	Thu, 26 Mar 2020 19:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831416E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 19:51:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] New: [drm] [amdgpu] Whole system crashes when the
 driver is in mode_support_and_system_configuration
Date: Thu, 26 Mar 2020 19:51:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: evvke@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206987-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206987

            Bug ID: 206987
           Summary: [drm] [amdgpu] Whole system crashes when the driver is
                    in mode_support_and_system_configuration
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: evvke@hotmail.com
        Regression: No

Whole system crashes with this error message : simd exception: 0000 [#1]
PREEMPT SMP NOPTI

Only giving a REISUB treatment works.

And cause is amdgpu driver.

---

Mar 26 20:47:13 shodan kernel: simd exception: 0000 [#1] PREEMPT SMP NOPTI
Mar 26 20:47:13 shodan kernel: CPU: 7 PID: 1344 Comm: Xorg Tainted: G        W 
OE     5.5.11-arch1-1 #1
Mar 26 20:47:13 shodan kernel: Hardware name: Micro-Star International Co.,
Ltd. MS-7B78/X470 GAMING PRO CARBON (MS-7B78), BIOS 2.80 03/06/2019
Mar 26 20:47:13 shodan kernel: RIP:
0010:mode_support_and_system_configuration+0x30a3/0x4d90 [amdgpu]
Mar 26 20:47:13 shodan kernel: Code: 00 0f 28 c3 e8 7e c9 ff ff f3 41 0f 11 87
40 19 00 00 e9 12 fd ff ff 41 83 be a8 00 00 00 06 75 93 f3 41 0f 10 86 40 1b
00 00 <f3> 41 0f 5e 86 f8 17 00 00 e8 4f c9 ff ff 41 8b 87 80 04 00 00 f3
Mar 26 20:47:13 shodan kernel: RSP: 0018:ffffb216c1f3b978 EFLAGS: 00010246
Mar 26 20:47:13 shodan kernel: RAX: 0000000000000006 RBX: ffff9c120bbfadc4 RCX:
0000000000000004
Mar 26 20:47:13 shodan kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI:
ffff9c120bbfb008
Mar 26 20:47:13 shodan kernel: RBP: ffff9c120bbfadc4 R08: ffff9c120bbfc164 R09:
0000000000000120
Mar 26 20:47:13 shodan kernel: R10: ffff9c120bbfaee4 R11: ffff9c120bbf0248 R12:
ffff9c120bbfc63c
Mar 26 20:47:13 shodan kernel: R13: 0000000000000000 R14: ffff9c120bbfaf5c R15:
ffff9c120bbfadc4
Mar 26 20:47:13 shodan kernel: FS:  00007f1c9f336dc0(0000)
GS:ffff9c19009c0000(0000) knlGS:0000000000000000
Mar 26 20:47:13 shodan kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Mar 26 20:47:13 shodan kernel: CR2: 00001f82bfec7fe0 CR3: 00000007cbe4a000 CR4:
00000000003406e0
Mar 26 20:47:13 shodan kernel: Call Trace:
Mar 26 20:47:13 shodan kernel:  dcn_validate_bandwidth+0xfe5/0x1f20 [amdgpu]
Mar 26 20:47:13 shodan kernel:  dc_validate_global_state+0x28a/0x310 [amdgpu]
Mar 26 20:47:13 shodan kernel:  amdgpu_dm_atomic_check+0x5d8/0x870 [amdgpu]
Mar 26 20:47:13 shodan kernel:  drm_atomic_check_only+0x578/0x800 [drm]
Mar 26 20:47:13 shodan kernel:  ? dm_crtc_duplicate_state+0x6b/0x1f0 [amdgpu]
Mar 26 20:47:13 shodan kernel:  drm_atomic_commit+0x13/0x50 [drm]
Mar 26 20:47:13 shodan kernel:  drm_atomic_helper_legacy_gamma_set+0x123/0x180
[drm_kms_helper]
Mar 26 20:47:13 shodan kernel:  drm_mode_gamma_set_ioctl+0x171/0x220 [drm]
Mar 26 20:47:13 shodan kernel:  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
Mar 26 20:47:13 shodan kernel:  drm_ioctl_kernel+0xb2/0x100 [drm]
Mar 26 20:47:13 shodan kernel:  drm_ioctl+0x209/0x360 [drm]
Mar 26 20:47:13 shodan kernel:  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
Mar 26 20:47:13 shodan kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Mar 26 20:47:13 shodan kernel:  do_vfs_ioctl+0x4b7/0x730
Mar 26 20:47:13 shodan kernel:  ksys_ioctl+0x5e/0x90
Mar 26 20:47:13 shodan kernel:  __x64_sys_ioctl+0x16/0x20
Mar 26 20:47:13 shodan kernel:  do_syscall_64+0x4e/0x150
Mar 26 20:47:13 shodan kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Mar 26 20:47:13 shodan kernel: RIP: 0033:0x7f1ca01892eb
Mar 26 20:47:13 shodan kernel: Code: 0f 1e fa 48 8b 05 a5 8b 0c 00 64 c7 00 26
00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 8b 0c 00 f7 d8 64 89 01 48
Mar 26 20:47:13 shodan kernel: RSP: 002b:00007ffc60ff5648 EFLAGS: 00000206
ORIG_RAX: 0000000000000010
Mar 26 20:47:13 shodan kernel: RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007f1ca01892eb
Mar 26 20:47:13 shodan kernel: RDX: 00007ffc60ff5700 RSI: 00000000c02064a5 RDI:
000000000000000a
Mar 26 20:47:13 shodan kernel: RBP: 00007ffc60ff5680 R08: 0000562bb635c080 R09:
0000562bb635c280
Mar 26 20:47:13 shodan kernel: R10: 0000562bb635be80 R11: 0000000000000206 R12:
0000000000000100
Mar 26 20:47:13 shodan kernel: R13: 0000562bb6ab4f70 R14: 0000562bb635b9c0 R15:
0000000000000100
Mar 26 20:47:13 shodan kernel: Modules linked in: snd_seq_dummy snd_seq
bluetooth ecdh_generic rfkill ecc veth fuse iscsi_tcp libiscsi_tcp libiscsi
scsi_transport_iscsi tun ip6table_mangle xt_MASQUERADE iptable_nat nf_nat
xt_connmark iptable_mangle xt_helper xt_NFLOG xt_limit xt_conntrack xt_tcpudp
nf_conntrack_ftp nf_conntrack_sip nf_conntrack_pptp nf_conntrack_irc
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 vboxnetadp(OE) vboxnetflt(OE)
vboxdrv(OE) pktcdvd nfnetlink_log nfnetlink ip6table_filter nct6775 ip6_tables
hwmon_vid iptable_filter edac_mce_amd kvm_amd ccp ext4 rng_core kvm
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
crc16 mbcache irqbypass mxm_wmi jbd2 snd_hda_intel wmi_bmof snd_intel_dspcfg
snd_hda_codec snd_usb_audio crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
snd_hda_core uvcvideo snd_usbmidi_lib snd_rawmidi videobuf2_vmalloc
videobuf2_memops snd_seq_device videobuf2_v4l2 aesni_intel snd_hwdep
videobuf2_common crypto_simd snd_pcm mousedev cryptd glue_helper
Mar 26 20:47:13 shodan kernel:  input_leds sp5100_tco snd_timer igb k10temp
pcspkr i2c_piix4 snd soundcore dca wmi evdev mac_hid gpio_amdpt pinctrl_amd
acpi_cpufreq xt_mark v4l2loopback(OE) videodev mc usbmon nbd msr vhba(OE)
sr_mod cdrom sg br_netfilter bridge stp llc ip_tables x_tables dm_mod btrfs
blake2b_generic libcrc32c crc32c_generic xor raid6_pq sd_mod hid_generic usbhid
hid crc32c_intel ahci libahci libata xhci_pci xhci_hcd scsi_mod amdgpu
gpu_sched i2c_algo_bit ttm drm_kms_helper serio_raw syscopyarea sysfillrect
sysimgblt fb_sys_fops drm agpgart i8042 atkbd libps2 serio
Mar 26 20:47:13 shodan kernel: ---[ end trace e34593e526e29a3d ]---
Mar 26 20:47:13 shodan kernel: RIP:
0010:mode_support_and_system_configuration+0x30a3/0x4d90 [amdgpu]
Mar 26 20:47:13 shodan kernel: Code: 00 0f 28 c3 e8 7e c9 ff ff f3 41 0f 11 87
40 19 00 00 e9 12 fd ff ff 41 83 be a8 00 00 00 06 75 93 f3 41 0f 10 86 40 1b
00 00 <f3> 41 0f 5e 86 f8 17 00 00 e8 4f c9 ff ff 41 8b 87 80 04 00 00 f3
Mar 26 20:47:13 shodan kernel: RSP: 0018:ffffb216c1f3b978 EFLAGS: 00010246
Mar 26 20:47:13 shodan kernel: RAX: 0000000000000006 RBX: ffff9c120bbfadc4 RCX:
0000000000000004
Mar 26 20:47:13 shodan kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI:
ffff9c120bbfb008
Mar 26 20:47:13 shodan kernel: RBP: ffff9c120bbfadc4 R08: ffff9c120bbfc164 R09:
0000000000000120
Mar 26 20:47:13 shodan kernel: R10: ffff9c120bbfaee4 R11: ffff9c120bbf0248 R12:
ffff9c120bbfc63c
Mar 26 20:47:13 shodan kernel: R13: 0000000000000000 R14: ffff9c120bbfaf5c R15:
ffff9c120bbfadc4
Mar 26 20:47:13 shodan kernel: FS:  00007f1c9f336dc0(0000)
GS:ffff9c19009c0000(0000) knlGS:0000000000000000
Mar 26 20:47:13 shodan kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Mar 26 20:47:13 shodan kernel: CR2: 00001f82bfec7fe0 CR3: 00000007cbe4a000 CR4:
00000000003406e0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
