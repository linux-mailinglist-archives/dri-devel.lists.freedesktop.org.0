Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD9320D1F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 20:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AA789BD5;
	Sun, 21 Feb 2021 19:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0478B89BD5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 19:17:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB93264EDE
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 19:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613935023;
 bh=KnCoOLT7kByqJglEPRZNXb9olZGjXAEQg0cCKIucKjE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KvSm+/Z7D7vk0H3uTEfopwsBIwJOkWeFm8hl2IWpcNs0nlywlylIiQKHD/ygGp8i8
 D0fQOrpmbK2QXWUsyE7SbHzbsXEnt3FbhQe5OPESajct+ZpQXfl5a9bluGjC3frAsO
 RHOAk5JNSnKvoAWlVwK2f7SB24SpCv5B/CRG1LxiyFhpufBApXqwceOInUvlyG4amL
 qOR8zf+XdhcK6jtfFiUfrfIKWcQOwgSiWaOBlERFoPUmoVKpJp9EuALlyV+K6bJF6B
 dmc7MXsalu+28ANdW6QVEwmYoC6UdPZiQAk5BBS67hv+ZKAEvDpc20PsneViwZrz6j
 pTq25Z94dRufQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E28AC653B9; Sun, 21 Feb 2021 19:17:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Sun, 21 Feb 2021 19:17:02 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211875-2300-xGEZW0y0P7@https.bugzilla.kernel.org/>
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

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
------------[ cut here ]------------
smu8_send_msg_to_smc_with_parameter(0x0011, 0x460) timed out after 3236309 us
WARNING: CPU: 1 PID: 403 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140
[amdgpu]
Modules linked in: dm_crypt nhpoly1305_avx2 nhpoly1305 chacha_generic
chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher dm_mod fuse
input_leds joydev hid_generic usbhid hid rfkill raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx ext4 crc16 mbcache jbd2 md_mod amdgpu
evdev crc32_generic crc32_pclmul f2fs aesni_intel libaes crypto_simd cryptd
glue_helper snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio led_class
drm_ttm_helper snd_hda_codec_hdmi k10temp ttm ehci_pci gpu_sched fam15h_power
ehci_hcd i2c_algo_bit r8169 i2c_piix4 snd_hda_intel snd_intel_dspcfg realtek
mdio_devres xhci_pci libphy snd_hda_codec drm_kms_helper snd_hwdep xhci_hcd
snd_hda_core cfbfillrect syscopyarea cfbimgblt sysfillrect usbcore sysimgblt
snd_pcm fb_sys_fops usb_common cfbcopyarea snd_timer fb snd font fbdev
soundcore video acpi_cpufreq button processor nfsd nct6775 hwmon_vid zram
auth_rpcgss zsmalloc lockd jc42 grace drm hwmon drm_panel_orientation_quirks
sunrpc
 backlight nfs_ssc
CPU: 1 PID: 403 Comm: X Not tainted 5.11.0-gentoo #2
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A320M-HDV R3.0,
BIOS P3.10 06/26/2019
RIP: 0010:smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]
Code: c0 48 c7 c7 a0 5b ac c0 48 89 c1 48 f7 ea 48 89 c8 44 89 f1 48 c1 f8 3f
48 c1 fa 07 48 29 c2 49 89 d0 44 89 ea e8 db 98 e0 cf <0f> 0b eb b3 41 bc ea ff
ff ff eb ab 48 8b 7d 60 be c0 01 00 00 48
RSP: 0018:ffff9fc60749b788 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 00000d3740b628cb RCX: ffff9d430f492d58
RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffff9d430f492d50
RBP: ffff9d400f23a800 R08: 0000000000000000 R09: ffff9fc60749b5c0
R10: 0000000000000003 R11: ffffffff90e57e48 R12: 00000000ffffffc2
R13: 0000000000000011 R14: 0000000000000460 R15: ffff9d405006988c
FS:  00007ff812a7b980(0000) GS:ffff9d430f480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff7e8fef000 CR3: 000000010f26e000 CR4: 00000000001506e0
Call Trace:
 smum_send_msg_to_smc_with_parameter+0xbe/0xf0 [amdgpu]
 smu8_set_power_state_tasks+0x1d6/0x360 [amdgpu]
 phm_set_power_state+0x44/0x68 [amdgpu]
 psm_adjust_power_state_dynamic+0xb6/0x1b8 [amdgpu]
 ? amdgpu_fence_wait_empty+0x80/0xd0 [amdgpu]
 pp_dpm_dispatch_tasks+0x35/0x58 [amdgpu]
 dm_pp_apply_display_requirements+0x197/0x1c0 [amdgpu]
 dce11_update_clocks+0x8f/0xe8 [amdgpu]
 dc_commit_state+0x1d2/0xa70 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0x3ee/0x2378 [amdgpu]
 ? free_one_page+0x4e/0xc0
 ? bw_calcs+0x656/0x1df0 [amdgpu]
 ? _cond_resched+0x11/0x38
 ? __ww_mutex_lock.constprop.0+0x2c/0x6f8
 ? kfree+0x9f/0x3a0
 ? ttm_bo_move_to_lru_tail+0x1c/0xc0 [ttm]
 ? ttm_eu_backoff_reservation+0x3e/0x58 [ttm]
 ? amdgpu_bo_gpu_offset+0x65/0xb0 [amdgpu]
 ? dm_plane_helper_prepare_fb+0x127/0x248 [amdgpu]
 ? _cond_resched+0x11/0x38
 ? wait_for_completion_timeout+0x31/0xe0
 ? wait_for_completion_interruptible+0x2e/0x128
 commit_tail+0x8d/0x120 [drm_kms_helper]
 drm_atomic_helper_commit+0x111/0x138 [drm_kms_helper]
 drm_atomic_connector_commit_dpms+0xd4/0xf0 [drm]
 drm_mode_obj_set_property_ioctl+0x183/0x3a0 [drm]
 ? drm_connector_set_obj_prop+0x80/0x80 [drm]
 drm_connector_property_set_ioctl+0x32/0x50 [drm]
 drm_ioctl_kernel+0xa5/0xf0 [drm]
 drm_ioctl+0x20a/0x398 [drm]
 ? drm_connector_set_obj_prop+0x80/0x80 [drm]
 amdgpu_drm_ioctl+0x44/0x78 [amdgpu]
 __x64_sys_ioctl+0x81/0xa0
 do_syscall_64+0x33/0x48
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7ff812686cc7
Code: 3c 1c 48 f7 d8 49 39 c4 72 b9 e8 24 ff ff ff 85 c0 78 be 5b 4c 89 e0 5d
41 5c c3 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01
c3 48 8b 0d 71 41 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffd6465ce88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd6465cec0 RCX: 00007ff812686cc7
RDX: 00007ffd6465cec0 RSI: 00000000c01064ab RDI: 000000000000000c
RBP: 00000000c01064ab R08: 00007ffd64740080 R09: 00007ff811fa7d10
R10: 00007ff811fa7d20 R11: 0000000000000246 R12: 0000555c25ecedd0
R13: 000000000000000c R14: 0000000000000000 R15: 0000555c24e06540
---[ end trace c56a82515c29af45 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
