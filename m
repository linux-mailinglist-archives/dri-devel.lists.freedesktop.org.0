Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108022F1B78
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83489DD3;
	Mon, 11 Jan 2021 16:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFB489DD3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A08922ADF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:51:42 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 07D7D816A9; Mon, 11 Jan 2021 16:51:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Mon, 11 Jan 2021 16:51:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211033-2300-kAjZmDvInT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |icedragon.aw@web.de

--- Comment #11 from Andreas (icedragon.aw@web.de) ---
I'm sorry, but I can confirm the bug still also for 5.10.6! - it seems to be
more seldom, but existing.
(System: Kubuntu 20.10, Ryzon 7 PRO 4750G - using only integrated GPU)

Jan 10 15:22:02 localhost kernel: [    0.000000] Linux version 5.10.6-aw
(root@icehome) (gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0, GNU ld (GNU Binutils for
Ubuntu) 2.35.1) #1 SMP PREEMPT Sat Jan 9 19:50:09 CET 2021
Jan 10 15:22:02 localhost kernel: [    0.000000] Command line:
BOOT_IMAGE=/boot/vmlinuz-5.10.6-aw
root=UUID=6ff371aa-4315-475d-b8ec-b0a642c9eb5b ro nosplash video=1920x1080
...
Jan 11 12:47:22 localhost kernel: [76631.564613] [drm]
perform_link_training_with_retries: Link training attempt 1 of 4 failed
Jan 11 12:47:23 localhost kernel: [76632.038945] [drm]
perform_link_training_with_retries: Link training attempt 2 of 4 failed
Jan 11 12:47:23 localhost kernel: [76632.570188] [drm]
perform_link_training_with_retries: Link training attempt 3 of 4 failed
Jan 11 12:47:24 localhost kernel: [76633.145733] [drm] enabling link 1 failed:
15
Jan 11 12:47:48 localhost kernel: [76657.512604] [drm:atom_op_jump [amdgpu]]
*ERROR* atombios stuck in loop for more than 20secs aborting
Jan 11 12:47:48 localhost kernel: [76657.512767]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
Jan 11 12:47:48 localhost kernel: [76657.512933]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
Jan 11 12:47:48 localhost kernel: [76657.513150]
[drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
Jan 11 12:47:50 localhost kernel: [76658.934111] [drm]
amdgpu_dm_irq_schedule_work FAILED src 2
Jan 11 12:48:02 localhost kernel: [76671.080303] ------------[ cut here
]------------
Jan 11 12:48:02 localhost kernel: [76671.080468] WARNING: CPU: 11 PID: 34192 at
decide_link_settings+0x243/0x250 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.080470] Modules linked in:
snd_usb_audio uvcvideo snd_usbmidi_lib snd_seq_dummy snd_hrtimer vmnet(OE)
vmw_vsock_vmci_transport vsock vmw_vmci vmmon(OE) binfmt_misc si2157 si2168
m88rs6000t a8293 cx25840 nls_iso8859_1 wmi_bmof amdgpu snd_hda_codec_hdmi
snd_hda_intel snd_intel_dspcfg snd_hda_codec amd64_edac_mod snd_hwdep
edac_mce_amd snd_hda_core kvm_amd cx23885 snd_seq_midi kvm gpu_sched
snd_seq_midi_event tveeprom ttm snd_rawmidi altera_ci crct10dif_pclmul
i2c_algo_bit cx2341x ghash_clmulni_intel tda18271 drm_kms_helper snd_pcm joydev
snd_seq rapl snd_seq_device altera_stapl snd_timer syscopyarea videobuf2_dvb
sysfillrect videobuf2_dma_sg sysimgblt m88ds3103 fb_sys_fops efi_pstore snd
i2c_mux cec dvb_core ccp soundcore videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2 videobuf2_common k10temp videodev mc rc_core nf_log_ipv6 wmi
xt_hl ip6_tables ip6t_rt video nf_log_ipv4 nf_log_common xt_LOG nft_limit
xt_limit xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6
Jan 11 12:48:02 localhost kernel: [76671.080540]  nf_defrag_ipv4 nft_compat
sch_fq_codel nft_counter nct6775 hwmon_vid lm92 nf_tables nfnetlink lm83 drm
ip_tables x_tables autofs4 raid10 raid1 raid0 multipath linear hid_generic
usbhid hid crc32_pclmul i2c_piix4 e1000e r8169 ahci xhci_pci realtek libahci
xhci_pci_renesas gpio_amdpt gpio_generic
Jan 11 12:48:02 localhost kernel: [76671.080571] CPU: 11 PID: 34192 Comm: Xorg
Tainted: G           OE     5.10.6-aw #1
Jan 11 12:48:02 localhost kernel: [76671.080573] Hardware name: To Be Filled By
O.E.M. To Be Filled By O.E.M./B550M Pro4, BIOS P1.70 12/01/2020
Jan 11 12:48:02 localhost kernel: [76671.080724] RIP:
0010:decide_link_settings+0x243/0x250 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.080727] Code: 8b 54 24 18 49 89 06 49
89 56 08 e9 07 ff ff ff 48 8b 83 88 00 00 00 48 8b 93 90 00 00 00 49 89 06 49
89 56 08 e9 ed fe ff ff <0f> 0b e9 d7 fe ff ff e8 41 6d f6 f7 90 0f 1f 44 00 00
55 48 89 e5
Jan 11 12:48:02 localhost kernel: [76671.080729] RSP: 0018:ffffa3aac0bdf650
EFLAGS: 00010246
Jan 11 12:48:02 localhost kernel: [76671.080731] RAX: 0000000000000000 RBX:
ffff91ee84bc6c00 RCX: 00000000000009c5
Jan 11 12:48:02 localhost kernel: [76671.080733] RDX: ffffffffc0ed3bf0 RSI:
ffffffffc0f3f183 RDI: 0000000000000000
Jan 11 12:48:02 localhost kernel: [76671.080734] RBP: ffffa3aac0bdf698 R08:
ffff91ef997c2000 R09: ffffa3aac0bdf618
Jan 11 12:48:02 localhost kernel: [76671.080735] R10: 0000000000000001 R11:
0000000000000000 R12: 0000000000093828
Jan 11 12:48:02 localhost kernel: [76671.080736] R13: ffffa3aac0bdf660 R14:
ffffa3aac0bdf6a8 R15: ffffa3aac0bdf6a8
Jan 11 12:48:02 localhost kernel: [76671.080739] FS:  00007f212bf39a40(0000)
GS:ffff91fd2f4c0000(0000) knlGS:0000000000000000
Jan 11 12:48:02 localhost kernel: [76671.080740] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jan 11 12:48:02 localhost kernel: [76671.080742] CR2: 00005622049f7630 CR3:
000000010597a000 CR4: 0000000000350ee0
Jan 11 12:48:02 localhost kernel: [76671.080743] Call Trace:
Jan 11 12:48:02 localhost kernel: [76671.080892]  ?
amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081040]  enable_link_dp+0x15a/0x230
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081185] 
core_link_enable_stream+0x6a3/0x830 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081368] 
dce110_apply_ctx_to_hw+0x590/0x5d0 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081512]  ? dm_read_reg_func+0x3e/0xb0
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081663]  dc_commit_state+0x32a/0xa70
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081694]  ?
drm_calc_timestamping_constants+0x199/0x200 [drm]
Jan 11 12:48:02 localhost kernel: [76671.081929] 
amdgpu_dm_atomic_commit_tail+0x529/0x2420 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.081945]  ?
ttm_bo_move_accel_cleanup+0x1fa/0x3f0 [ttm]
Jan 11 12:48:02 localhost kernel: [76671.082058]  ? amdgpu_move_blit+0xce/0x210
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082182]  ?
amdgpu_vram_mgr_new+0x363/0x3c0 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082295]  ? amdgpu_bo_move+0xa4/0x2b0
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082303]  ?
ttm_bo_handle_move_mem+0xba/0x4a0 [ttm]
Jan 11 12:48:02 localhost kernel: [76671.082305]  ? ttm_bo_validate+0x137/0x150
[ttm]
Jan 11 12:48:02 localhost kernel: [76671.082353]  ?
dm_plane_helper_prepare_fb+0x198/0x250 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082357]  ?
wait_for_completion_timeout+0xc0/0xf0
Jan 11 12:48:02 localhost kernel: [76671.082365]  commit_tail+0x99/0x130
[drm_kms_helper]
Jan 11 12:48:02 localhost kernel: [76671.082369] 
drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
Jan 11 12:48:02 localhost kernel: [76671.082415] 
amdgpu_dm_atomic_commit+0x11/0x20 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082430]  drm_atomic_commit+0x4a/0x50
[drm]
Jan 11 12:48:02 localhost kernel: [76671.082438] 
drm_atomic_helper_set_config+0x7c/0xc0 [drm_kms_helper]
Jan 11 12:48:02 localhost kernel: [76671.082449]  drm_mode_setcrtc+0x20b/0x7e0
[drm]
Jan 11 12:48:02 localhost kernel: [76671.082487]  ?
amdgpu_cs_wait_ioctl+0xd8/0x160 [amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082514]  ?
drm_mode_getcrtc+0x190/0x190 [drm]
Jan 11 12:48:02 localhost kernel: [76671.082520]  drm_ioctl_kernel+0xae/0xf0
[drm]
Jan 11 12:48:02 localhost kernel: [76671.082526]  drm_ioctl+0x245/0x400 [drm]
Jan 11 12:48:02 localhost kernel: [76671.082532]  ?
drm_mode_getcrtc+0x190/0x190 [drm]
Jan 11 12:48:02 localhost kernel: [76671.082565]  amdgpu_drm_ioctl+0x4e/0x80
[amdgpu]
Jan 11 12:48:02 localhost kernel: [76671.082567]  __x64_sys_ioctl+0x91/0xc0
Jan 11 12:48:02 localhost kernel: [76671.082569]  do_syscall_64+0x38/0x90
Jan 11 12:48:02 localhost kernel: [76671.082570] 
entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jan 11 12:48:02 localhost kernel: [76671.082571] RIP: 0033:0x7f212c39e31b
Jan 11 12:48:02 localhost kernel: [76671.082573] Code: 89 d8 49 8d 3c 1c 48 f7
d8 49 39 c4 72 b5 e8 1c ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e
fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d 3b 0d 00 f7 d8
64 89 01 48
Jan 11 12:48:02 localhost kernel: [76671.082574] RSP: 002b:00007ffce35a8bd8
EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Jan 11 12:48:02 localhost kernel: [76671.082576] RAX: ffffffffffffffda RBX:
00007ffce35a8c10 RCX: 00007f212c39e31b
Jan 11 12:48:02 localhost kernel: [76671.082577] RDX: 00007ffce35a8c10 RSI:
00000000c06864a2 RDI: 000000000000000f
Jan 11 12:48:02 localhost kernel: [76671.082577] RBP: 00000000c06864a2 R08:
0000000000000000 R09: 00005622052b8df0
Jan 11 12:48:02 localhost kernel: [76671.082577] R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000000
Jan 11 12:48:02 localhost kernel: [76671.082578] R13: 000000000000000f R14:
00005622042462c0 R15: 0000000000000000
Jan 11 12:48:02 localhost kernel: [76671.082580] ---[ end trace
d8392f22819e77e9 ]---
Jan 11 13:23:24 localhost kernel: [78778.721432] [drm]
amdgpu_dm_irq_schedule_work FAILED src 2
Jan 11 13:23:25 localhost kernel: [78779.094587] [drm:atom_op_jump [amdgpu]]
*ERROR* atombios stuck in loop for more than 20secs aborting
Jan 11 13:23:25 localhost kernel: [78779.094762]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
Jan 11 13:23:25 localhost kernel: [78779.094941]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
Jan 11 13:23:25 localhost kernel: [78779.095175]
[drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
Jan 11 13:23:44 localhost kernel: [78798.812677] [drm]
amdgpu_dm_irq_schedule_work FAILED src 2
Jan 11 13:23:45 localhost kernel: [78799.637347] [drm]
amdgpu_dm_irq_schedule_work FAILED src 2
Jan 11 13:23:47 localhost kernel: [78800.947592] [drm:atom_op_jump [amdgpu]]
*ERROR* atombios stuck in loop for more than 20secs aborting
Jan 11 13:23:47 localhost kernel: [78800.947767]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB6EA
Jan 11 13:23:47 localhost kernel: [78800.947945]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
Jan 11 13:23:47 localhost kernel: [78800.948179]
[drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
Jan 11 13:23:55 localhost kernel: [78809.545424] [drm]
perform_link_training_with_retries: Link training attempt 1 of 4 failed
Jan 11 13:23:56 localhost kernel: [78810.658465] [drm]
perform_link_training_with_retries: Link training attempt 2 of 4 failed
Jan 11 13:24:17 localhost kernel: [78831.232553] [drm:atom_op_jump [amdgpu]]
*ERROR* atombios stuck in loop for more than 20secs aborting
Jan 11 13:24:17 localhost kernel: [78831.232591]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
Jan 11 13:24:17 localhost kernel: [78831.232627]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
Jan 11 13:24:17 localhost kernel: [78831.232679]
[drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
Jan 11 13:24:17 localhost kernel: [78831.243045] [drm]
perform_link_training_with_retries: Link training attempt 3 of 4 failed
Jan 11 13:24:18 localhost kernel: [78832.455340] [drm] enabling link 1 failed:
15
Jan 11 13:24:21 localhost kernel: [78835.109927] clocksource: timekeeping
watchdog on CPU1: Marking clocksource 'tsc' as unstable because the skew is too
large:
Jan 11 13:24:21 localhost kernel: [78835.109964] clocksource:                  
    'hpet' wd_now: 9fd5133d wd_last: 9ee2f985 mask: ffffffff
Jan 11 13:24:21 localhost kernel: [78835.109970] clocksource:                  
    'tsc' cs_now: 10385bde83018 cs_last: 103851817b114 mask: ffffffffffffffff
Jan 11 13:24:21 localhost kernel: [78835.109974] tsc: Marking TSC unstable due
to clocksource watchdog
Jan 11 13:24:21 localhost kernel: [78835.110724] TSC found unstable after boot,
most likely due to broken BIOS. Use 'tsc=unstable'.
Jan 11 13:24:21 localhost kernel: [78835.110730] sched_clock: Marking unstable
(79377631293089, -542502030791)<-(78835125546559, -15519055)
Jan 11 13:24:23 localhost kernel: [78836.812226] clocksource: Switched to
clocksource hpet
Jan 11 13:26:26 localhost kernel: [78959.736998] [drm]
amdgpu_dm_irq_schedule_work FAILED src 2
Jan 11 13:26:28 localhost kernel: [78961.849240] INFO: task kworker/7:0:43964
blocked for more than 122 seconds.
Jan 11 13:26:28 localhost kernel: [78961.849247]       Tainted: G        W  OE 
   5.10.6-aw #1
Jan 11 13:26:28 localhost kernel: [78961.849249] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 11 13:26:28 localhost kernel: [78961.849252] task:kworker/7:0     state:D
stack:    0 pid:43964 ppid:     2 flags:0x00004000
Jan 11 13:26:28 localhost kernel: [78961.849433] Workqueue: events
dm_irq_work_func [amdgpu]
Jan 11 13:26:28 localhost kernel: [78961.849435] Call Trace:
Jan 11 13:26:28 localhost kernel: [78961.849444]  __schedule+0x267/0x7c0
Jan 11 13:26:28 localhost kernel: [78961.849447]  schedule+0x68/0xe0
Jan 11 13:26:28 localhost kernel: [78961.849450] 
schedule_preempt_disabled+0x15/0x20
Jan 11 13:26:28 localhost kernel: [78961.849453] 
__ww_mutex_lock.constprop.0+0x316/0x7c0
Jan 11 13:26:28 localhost kernel: [78961.849457] 
__ww_mutex_lock_slowpath+0x16/0x20
Jan 11 13:26:28 localhost kernel: [78961.849459]  ww_mutex_lock+0x77/0x90
Jan 11 13:26:28 localhost kernel: [78961.849487]  drm_modeset_lock+0x35/0xb0
[drm]
Jan 11 13:26:28 localhost kernel: [78961.849507] 
drm_modeset_lock_all_ctx+0x28/0x300 [drm]
Jan 11 13:26:28 localhost kernel: [78961.849526] 
drm_modeset_lock_all+0x5e/0xb0 [drm]
Jan 11 13:26:28 localhost kernel: [78961.849689]  handle_hpd_irq+0xd2/0x120
[amdgpu]
Jan 11 13:26:28 localhost kernel: [78961.849843]  dm_irq_work_func+0x4e/0x60
[amdgpu]
Jan 11 13:26:28 localhost kernel: [78961.849847]  process_one_work+0x1e3/0x3b0
Jan 11 13:26:28 localhost kernel: [78961.849850]  worker_thread+0x50/0x3f0
Jan 11 13:26:28 localhost kernel: [78961.849853]  ? rescuer_thread+0x390/0x390
Jan 11 13:26:28 localhost kernel: [78961.849856]  kthread+0x145/0x170
Jan 11 13:26:28 localhost kernel: [78961.849859]  ?
__kthread_bind_mask+0x70/0x70
Jan 11 13:26:28 localhost kernel: [78961.849863]  ret_from_fork+0x22/0x30

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
