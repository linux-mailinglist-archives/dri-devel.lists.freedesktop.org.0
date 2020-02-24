Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13E16A79C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 14:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7C26E4DE;
	Mon, 24 Feb 2020 13:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190816E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 13:50:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Mon, 24 Feb 2020 13:50:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206475-2300-KBjoj0GgyM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206475-2300@https.bugzilla.kernel.org/>
References: <bug-206475-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206475

Marco (rodomar705@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|OBSOLETE                    |---

--- Comment #8 from Marco (rodomar705@protonmail.com) ---
Aaand it's back. Extremely less often, but it still there. However, this time
I've got a warning from the kernel in the backtrace:

feb 24 14:31:13 *** kernel: ------------[ cut here ]------------
feb 24 14:31:13 *** kernel: WARNING: CPU: 3 PID: 24149 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:1099
dce110_link_encoder_disable_output+0x12a/0x140 [amdgpu]
feb 24 14:31:13 *** kernel: Modules linked in: rfcomm fuse xt_CHECKSUM
xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle
ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter tun bridge stp llc cmac algif_hash algif_skcipher af_alg sr_mod
cdrom bnep hwmon_vid xfs nls_iso8859_1 nls_cp437 vfat fat btrfs edac_mce_amd
kvm_amd kvm blake2b_generic xor btusb btrtl btbcm btintel bluetooth
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel igb joydev ecdh_generic
aesni_intel eeepc_wmi asus_wmi crypto_simd battery cryptd sparse_keymap
mousedev input_leds ecc glue_helper raid6_pq ccp rfkill wmi_bmof pcspkr k10temp
dca libcrc32c i2c_piix4 rng_core evdev pinctrl_amd mac_hid gpio_amdpt
acpi_cpufreq vboxnetflt(OE) vboxnetadp(OE) vboxdrv(OE) virtio_mmio virtio_input
virtio_pci virtio_balloon usbip_host snd_hda_codec_realtek usbip_core
snd_hda_codec_generic uinput i2c_dev ledtrig_audio sg
feb 24 14:31:13 *** kernel:  snd_hda_codec_hdmi vhba(OE) crypto_user
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm
snd_timer snd soundcore ip_tables x_tables ext4 crc32c_generic crc16 mbcache
jbd2 sd_mod hid_generic usbhid hid ahci libahci libata crc32c_intel xhci_pci
xhci_hcd scsi_mod nouveau mxm_wmi wmi amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio
feb 24 14:31:13 *** kernel: CPU: 3 PID: 24149 Comm: kworker/3:2 Tainted: G     
     OE     5.5.5-arch1-1 #1
feb 24 14:31:13 *** kernel: Hardware name: System manufacturer System Product
Name/ROG STRIX B450-F GAMING, BIOS 3003 12/09/2019
feb 24 14:31:13 *** kernel: Workqueue: events drm_sched_job_timedout
[gpu_sched]
feb 24 14:31:13 *** kernel: RIP:
0010:dce110_link_encoder_disable_output+0x12a/0x140 [amdgpu]
feb 24 14:31:13 *** kernel: Code: 44 24 38 65 48 33 04 25 28 00 00 00 75 20 48
83 c4 40 5b 5d 41 5c c3 48 c7 c6 40 05 76 c0 48 c7 c7 f0 b1 7d c0 e8 76 c3 d1
ff <0f> 0b eb d0 e8 7d 12 e7 df 66 66 2e 0f 1f 84 00 00 00 00 00 66 90
feb 24 14:31:13 *** kernel: RSP: 0018:ffffb06641417630 EFLAGS: 00010246
feb 24 14:31:13 *** kernel: RAX: 0000000000000000 RBX: ffff9790645be420 RCX:
0000000000000000
feb 24 14:31:13 *** kernel: RDX: 0000000000000000 RSI: 0000000000000082 RDI:
00000000ffffffff
feb 24 14:31:13 *** kernel: RBP: 0000000000000002 R08: 00000000000005ba R09:
0000000000000093
feb 24 14:31:13 *** kernel: R10: ffffb06641417480 R11: ffffb06641417485 R12:
ffffb06641417634
feb 24 14:31:13 *** kernel: R13: ffff979064fe6800 R14: ffff978f4f9201b8 R15:
ffff97906ba1ee00
feb 24 14:31:13 *** kernel: FS:  0000000000000000(0000)
GS:ffff97906e8c0000(0000) knlGS:0000000000000000
feb 24 14:31:13 *** kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
feb 24 14:31:13 *** kernel: CR2: 00007effa1509000 CR3: 0000000350d7a000 CR4:
00000000003406e0
feb 24 14:31:13 *** kernel: Call Trace:
feb 24 14:31:13 *** kernel:  core_link_disable_stream+0x10e/0x3d0 [amdgpu]
feb 24 14:31:13 *** kernel:  ? smu7_send_msg_to_smc.cold+0x20/0x25 [amdgpu]
feb 24 14:31:13 *** kernel:  dce110_reset_hw_ctx_wrap+0xc3/0x260 [amdgpu]
feb 24 14:31:13 *** kernel:  dce110_apply_ctx_to_hw+0x51/0x5d0 [amdgpu]
feb 24 14:31:13 *** kernel:  ? pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
feb 24 14:31:13 *** kernel:  ? amdgpu_pm_compute_clocks+0xcd/0x600 [amdgpu]
feb 24 14:31:13 *** kernel:  ? dm_pp_apply_display_requirements+0x1a8/0x1c0
[amdgpu]
feb 24 14:31:13 *** kernel:  dc_commit_state+0x2b9/0x5e0 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_dm_atomic_commit_tail+0x398/0x20f0 [amdgpu]
feb 24 14:31:13 *** kernel:  ? number+0x337/0x380
feb 24 14:31:13 *** kernel:  ? vsnprintf+0x3aa/0x4f0
feb 24 14:31:13 *** kernel:  ? sprintf+0x5e/0x80
feb 24 14:31:13 *** kernel:  ? irq_work_queue+0x35/0x50
feb 24 14:31:13 *** kernel:  ? wake_up_klogd+0x4f/0x70
feb 24 14:31:13 *** kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
feb 24 14:31:13 *** kernel:  drm_atomic_helper_commit+0x113/0x140
[drm_kms_helper]
feb 24 14:31:13 *** kernel:  drm_atomic_helper_disable_all+0x175/0x190
[drm_kms_helper]
feb 24 14:31:13 *** kernel:  drm_atomic_helper_suspend+0x73/0x120
[drm_kms_helper]
feb 24 14:31:13 *** kernel:  dm_suspend+0x1c/0x60 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_device_ip_suspend_phase1+0x81/0xe0 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_device_gpu_recover+0x2ee/0xa13 [amdgpu]
feb 24 14:31:13 *** kernel:  amdgpu_job_timedout+0x103/0x130 [amdgpu]
feb 24 14:31:13 *** kernel:  drm_sched_job_timedout+0x3e/0x90 [gpu_sched]
feb 24 14:31:13 *** kernel:  process_one_work+0x1e1/0x3d0
feb 24 14:31:13 *** kernel:  worker_thread+0x4a/0x3d0
feb 24 14:31:13 *** kernel:  kthread+0xfb/0x130
feb 24 14:31:13 *** kernel:  ? process_one_work+0x3d0/0x3d0
feb 24 14:31:13 *** kernel:  ? kthread_park+0x90/0x90
feb 24 14:31:13 *** kernel:  ret_from_fork+0x22/0x40
feb 24 14:31:13 *** kernel: ---[ end trace 3e7589981fe74b17 ]---

Complete log attached below.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
