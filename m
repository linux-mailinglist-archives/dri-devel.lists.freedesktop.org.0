Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC232979C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 10:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BA66E91A;
	Tue,  2 Mar 2021 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC46E91A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 09:11:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B0DEC64DE4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614676319;
 bh=FuqbWOuB1CejeS1OPZ6jClPfc/mnr/zEcFmG8zWVvtU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ePm3iBBBkqCSqDK0PlwTF9jKyQ/jhIese5vliLvsx3Jnls+olz1Z1jocsTOJvdaSZ
 LSgPiiiMyiz12P77lPBRMhNurUkVLeZWTmVhmwS3qxvcHY653FnnVpZk3dgDtm+JxG
 fo+ixE9OVW0N+1W5+tGvng01fdBR/retFUts+Ddx/SWQqAKxWdeXYUomHKyZGOwFkQ
 GDkNqIwdvgm7AD8o7frJmVazVey+INMLp30wi4cMxLxZ0PZWAwbPCElljPQeKkqWex
 FZrQfd2jSmFeIZvwSBBcVSXuYJvSYjeIpHcMWOQLi605PQyozVpSrTqFbnKuttbAQ0
 IxxumEcmzmrhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AA04F652F6; Tue,  2 Mar 2021 09:11:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 02 Mar 2021 09:11:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211875-2300-ACH5LJzFBG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 295573
  --> https://bugzilla.kernel.org/attachment.cgi?id=295573&action=edit
kernel .config (kernel 5.12-rc1, A10-9700E)

Same for kernel v5.12-rc1. Backtrace looks slightly different with KASAN.

[...]
------------[ cut here ]------------
smu8_send_msg_to_smc_with_parameter(0x0011, 0x460) timed out after 3350731 us
WARNING: CPU: 3 PID: 598651 at smu8_send_msg_to_smc_with_parameter+0x180/0x1e0
[amdgpu]
Modules linked in: rfkill dm_crypt nhpoly1305_avx2 nhpoly1305 chacha_generic
chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher input_leds
led_class joydev hid_generic dm_mod usbhid hid raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx md_mod amdgpu f2fs crc32_pclmul evdev
ext4 crc16 mbcache jbd2 aesni_intel libaes crypto_simd cryptd gpu_sched
i2c_algo_bit drm_ttm_helper ttm snd_hda_codec_generic snd_hda_codec_hdmi
drm_kms_helper cfbfillrect snd_hda_intel syscopyarea cfbimgblt snd_intel_dspcfg
sysfillrect sysimgblt xhci_pci fb_sys_fops snd_hda_codec ehci_pci cfbcopyarea
snd_hwdep xhci_hcd snd_hda_core snd_pcm ehci_hcd fb i2c_piix4 snd_timer usbcore
k10temp fam15h_power font fbdev snd soundcore usb_common 8250 8250_base
serial_core video acpi_cpufreq button processor nfsd zram auth_rpcgss zsmalloc
nct6775 hwmon_vid lockd jc42 hwmon grace drm drm_panel_orientation_quirks fuse
backlight configfs sunrpc nfs_ssc efivarfs
CPU: 3 PID: 598651 Comm: kworker/3:0 Not tainted 5.12.0-rc1-Excavator #2
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A320M-HDV R3.0,
BIOS P3.10 06/26/2019
Workqueue: events dm_irq_work_func [amdgpu]
RIP: 0010:smu8_send_msg_to_smc_with_parameter+0x180/0x1e0 [amdgpu]
Code: 20 48 c7 c7 a0 c5 16 c1 48 89 c1 48 f7 ea 48 89 c8 44 89 f1 48 c1 f8 3f
48 c1 fa 07 48 29 c2 49 89 d0 44 89 ea e8 22 db e9 d2 <0f> 0b eb ac 41 bc ea ff
ff ff eb a4 4c 89 ef e8 dc 54 5d d2 48 8b
RSP: 0018:ffffc900090174d0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000011 RCX: 0000000000000000
RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff52001202e8c
RBP: ffff88810abc6800 R08: ffffffff931ecfbe R09: ffff8883d39ab09b
R10: ffffed107a735613 R11: 0000000000000001 R12: 00000000ffffffc2
R13: 0000000000000011 R14: 0000000000000460 R15: ffffffffc114fce0
FS:  0000000000000000(0000) GS:ffff8883d3980000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6d79d34000 CR3: 00000001163d6000 CR4: 00000000001506e0
Call Trace:
 smum_send_msg_to_smc_with_parameter+0x13c/0x170 [amdgpu]
 smu8_set_power_state_tasks+0x34c/0x560 [amdgpu]
 phm_set_power_state+0xb2/0xf0 [amdgpu]
 ? phm_power_down_asic+0x60/0x60 [amdgpu]
 ? smu8_apply_state_adjust_rules+0x1bf/0x290 [amdgpu]
 psm_adjust_power_state_dynamic+0x12c/0x300 [amdgpu]
 ? psm_set_user_performance_state+0xd0/0xd0 [amdgpu]
 ? amdgpu_fence_wait_empty+0x24f/0x380 [amdgpu]
 ? mutex_lock_io_nested+0xac0/0xac0
 ? memcpy+0x39/0x60
 hwmgr_handle_task+0xf1/0x180 [amdgpu]
 ? hwmgr_resume+0x70/0x70 [amdgpu]
 ? amdgpu_fence_fallback+0x20/0x20 [amdgpu]
 ? program_stutter_watermark+0x1b4/0x1d0 [amdgpu]
 pp_dpm_dispatch_tasks+0x40/0x60 [amdgpu]
 ? pp_get_power_limit+0xe0/0xe0 [amdgpu]
 amdgpu_pm_compute_clocks.part.0+0x18a/0xa00 [amdgpu]
 ? wait_for_completion_killable_timeout+0x200/0x200
 ? amdgpu_dpm_get_vrefresh+0xd0/0xd0 [amdgpu]
 ? phm_store_dal_configuration_data+0x165/0x190 [amdgpu]
 ? pp_get_current_clocks+0x2d0/0x2d0 [amdgpu]
 ? pp_get_current_clocks+0x2d0/0x2d0 [amdgpu]
 dm_pp_apply_display_requirements+0x3ae/0x3f0 [amdgpu]
 dce11_update_clocks+0x149/0x1e0 [amdgpu]
 ? dce11_pplib_apply_display_requirements+0x470/0x470 [amdgpu]
 dc_commit_updates_for_stream+0x243b/0x3c20 [amdgpu]
 ? __mutex_lock+0x2e9/0xb80
 ? dm_set_dpms_off+0xc0/0x190 [amdgpu]
 ? dc_check_update_surfaces_for_stream+0x1130/0x1130 [amdgpu]
 ? dmub_reg_value_burst_set_pack+0x240/0x240 [amdgpu]
 ? dal_gpio_create_irq+0x20/0x20 [amdgpu]
 ? kasan_quarantine_put+0xd1/0x1f0
 ? trace_hardirqs_on+0x1c/0x100
 dm_set_dpms_off+0x120/0x190 [amdgpu]
 ? dm_handle_hpd_rx_irq+0x270/0x270 [amdgpu]
 ? clk_mgr_optimize_pwr_state+0x8e/0xd0 [amdgpu]
 handle_hpd_irq+0x1ed/0x250 [amdgpu]
 ? handle_hpd_rx_irq+0x2f0/0x2f0 [amdgpu]
 ? lock_release+0xb2/0x430
 ? __schedule+0x5f8/0x10e0
 ? lockdep_hardirqs_on_prepare+0xe/0x200
 ? _raw_spin_unlock_irq+0x1f/0x30
 ? handle_hpd_rx_irq+0x2f0/0x2f0 [amdgpu]
 dm_irq_work_func+0x77/0x90 [amdgpu]
 process_one_work+0x4f3/0x9b0
 ? pwq_dec_nr_in_flight+0x110/0x110
 ? rwlock_bug.part.0+0x50/0x50
 worker_thread+0x2ce/0x6c0
 ? process_one_work+0x9b0/0x9b0
 kthread+0x1d9/0x200
 ? __kthread_bind_mask+0x60/0x60
 ret_from_fork+0x22/0x30
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<ffffffff930690fa>] copy_process+0x8fa/0x31e0
softirqs last  enabled at (0): [<ffffffff930690fa>] copy_process+0x8fa/0x31e0
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 6e48f7e48c11b7c0 ]---
amdgpu: smu8_send_msg_to_smc_with_parameter(0x026e) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x002f) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0012) aborted; SMU still
servicing msg (0x0011)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
