Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCED1FB633
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 17:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FA96E848;
	Tue, 16 Jun 2020 15:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ACC6E848
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 15:31:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208209] New: [amdgpu] driver crash -- enable_link_dp -- RX 570
Date: Tue, 16 Jun 2020 15:31:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: max.bruce12@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208209-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208209

            Bug ID: 208209
           Summary: [amdgpu] driver crash -- enable_link_dp -- RX 570
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.0-55-generic
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: max.bruce12@gmail.com
        Regression: No

This crash was nonfatal to the system, but seems to break video playback.
Happens randomly. Let me know if more information needed.

Dmesg log:
[901929.410695] WARNING: CPU: 11 PID: 123042 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1720
decide_link_settings+0x107/0x270 [amdgpu]
[901929.410696] Modules linked in: ufs qnx4 hfsplus hfs minix ntfs msdos jfs
xfs cpuid rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ebtable_filter
ebtables ip6table_filter ip6_tables bridge stp llc rpcsec_gss_krb5 auth_rpcgss
edac_mce_amd kvm_amd ashmem_linux(CE) binder_linux iptable_filter bpfilter cmac
bnep binfmt_misc input_leds snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg btusb btrtl
snd_hda_codec btbcm snd_hda_core btintel snd_hwdep snd_pcm bluetooth
snd_seq_midi snd_seq_midi_event ecdh_generic ecc kvm snd_rawmidi irqbypass
snd_seq iwlmvm snd_seq_device mac80211 snd_timer libarc4 iwlwifi wmi_bmof snd
cfg80211 soundcore k10temp ccp mac_hid sch_fq_codel parport_pc ppdev lp parport
ip_tables x_tables autofs4 btrfs zstd_compress hid_logitech_hidpp
hid_logitech_dj dm_crypt raid10 raid456
[901929.410732]  async_raid6_recov async_memcpy async_pq async_xor async_tx xor
hid_generic usbhid hid raid6_pq libcrc32c raid1 raid0 multipath linear nfsv4
nfsv3 nfs_acl nfs lockd grace sunrpc fscache bonding amdgpu crct10dif_pclmul
amd_iommu_v2 crc32_pclmul gpu_sched ghash_clmulni_intel ttm aesni_intel
drm_kms_helper aes_x86_64 syscopyarea sysfillrect crypto_simd igb sysimgblt
nvme cryptd fb_sys_fops dca i2c_algo_bit mxm_wmi drm glue_helper nvme_core ahci
i2c_piix4 libahci gpio_amdpt wmi gpio_generic
[901929.410759] CPU: 11 PID: 123042 Comm: kworker/11:0 Kdump: loaded Tainted: G
       WC  E     5.3.0-55-generic #49-Ubuntu
[901929.410760] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X399 Taichi, BIOS P3.50 12/24/2018
[901929.410865] Workqueue: events dm_irq_work_func [amdgpu]
[901929.410965] RIP: 0010:decide_link_settings+0x107/0x270 [amdgpu]
[901929.410968] Code: c0 83 fa 0e 77 07 8b 04 95 80 c6 73 c0 89 44 24 14 c7 44
24 10 01 00 00 00 39 43 5c 73 bd 48 c7 c7 e8 d3 77 c0 e8 cc 9c a7 c0 <0f> 0b 83
7b 58 00 0f 85 7d 50 02 00 e9 6a 50 02 00 80 bb e4 00 00
[901929.410969] RSP: 0018:ffffc900165777d0 EFLAGS: 00010246
[901929.410971] RAX: 0000000000000024 RBX: ffff888849ecc400 RCX:
0000000000000000
[901929.410972] RDX: 0000000000000000 RSI: ffff88905ead7448 RDI:
ffff88905ead7448
[901929.410973] RBP: ffffc90016577818 R08: ffff88905ead7448 R09:
0000000000000004
[901929.410974] R10: 0000000000000000 R11: 0000000000000001 R12:
ffffc900165777e0
[901929.410975] R13: 0000000000c34830 R14: ffffc90016577838 R15:
0000000000000000
[901929.410977] FS:  0000000000000000(0000) GS:ffff88905eac0000(0000)
knlGS:0000000000000000
[901929.410978] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[901929.410979] CR2: 00005564ed8d0730 CR3: 0000001016bb0000 CR4:
00000000003406e0
[901929.410980] Call Trace:
[901929.411082]  enable_link_dp+0x51/0x260 [amdgpu]
[901929.411180]  core_link_enable_stream+0x63c/0x8f0 [amdgpu]
[901929.411284]  ? set_pixel_encoding.isra.0+0x6d/0x160 [amdgpu]
[901929.411381]  dce110_apply_ctx_to_hw+0x501/0x580 [amdgpu]
[901929.411479]  ? dce110_apply_ctx_to_hw+0x501/0x580 [amdgpu]
[901929.411552]  dc_commit_state_no_check+0x228/0x580 [amdgpu]
[901929.411624]  dc_commit_state+0x96/0xb0 [amdgpu]
[901929.411699]  amdgpu_dm_atomic_commit_tail+0x3bf/0xfb0 [amdgpu]
[901929.411768]  ? amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
[901929.411838]  ? dm_read_reg_func+0x25/0x90 [amdgpu]
[901929.411844]  ? _cond_resched+0x19/0x30
[901929.411894]  ? amdgpu_bo_pin_restricted+0x61/0x2a0 [amdgpu]
[901929.411969]  ? dm_plane_helper_prepare_fb+0x1b3/0x290 [amdgpu]
[901929.411972]  ? _cond_resched+0x19/0x30
[901929.411973]  ? wait_for_completion_timeout+0x3a/0x120
[901929.411975]  ? wait_for_completion_interruptible+0x37/0x160
[901929.411983]  commit_tail+0x41/0x70 [drm_kms_helper]
[901929.411990]  ? commit_tail+0x41/0x70 [drm_kms_helper]
[901929.411997]  drm_atomic_helper_commit+0x118/0x120 [drm_kms_helper]
[901929.412070]  amdgpu_dm_atomic_commit+0xb1/0xf0 [amdgpu]
[901929.412085]  drm_atomic_commit+0x4a/0x50 [drm]
[901929.412158]  dm_restore_drm_connector_state+0xe9/0x140 [amdgpu]
[901929.412231]  handle_hpd_irq+0xc1/0x100 [amdgpu]
[901929.412304]  dm_irq_work_func+0x4e/0x60 [amdgpu]
[901929.412308]  process_one_work+0x1db/0x380
[901929.412310]  worker_thread+0x4d/0x400
[901929.412313]  kthread+0x104/0x140
[901929.412314]  ? process_one_work+0x380/0x380
[901929.412316]  ? kthread_park+0x80/0x80
[901929.412317]  ret_from_fork+0x22/0x40
[901929.412320] ---[ end trace ec78da1ed7d7751b ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
