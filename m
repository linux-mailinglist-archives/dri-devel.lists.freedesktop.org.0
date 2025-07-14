Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE2B03BBD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E14310E44C;
	Mon, 14 Jul 2025 10:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="TtfRADpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F54410E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 To:From; bh=TE6QMsEcwpNIKrHHuMeesikhceb+WXn5kwv70hZ6Xrg=; b=TtfR
 ADpTuUutsbnJLlIrPZyptcoEdDozn94xk+Lek5ozZ4/T4fqT9Ud+bp4439VHlylT
 mDLSeG591pzB953WC1lE1dFgVIYJGG3hVBi5EwuVpdNBZMeJxDMFsskASa29pbxk
 e+/NrTymgHgXjgIhOL5peGpAmxEwFzHRNaH3OVQ=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDHstUZ2XRoXfC2Ew--.7538S2; 
 Mon, 14 Jul 2025 18:16:58 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------pJl2dx57YgSjTqPQkpxr6RPU"
Message-ID: <7d974eaa-d8a4-4430-a999-7b06c4e17a81@163.com>
Date: Mon, 14 Jul 2025 18:16:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/3] drm/shmem-helper: Import dmabuf without
 mapping its sg_table
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250522070714.439824-1-oushixiong1025@163.com>
 <ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de>
X-CM-TRANSID: _____wDHstUZ2XRoXfC2Ew--.7538S2
X-Coremail-Antispam: 1Uf129KBjvAXoWftFWDXw4Dtw43Kr1UCr1xZrb_yoW8Kry5Go
 WfX3WrJw48Gw15t348ArnFyFZrZa9ayFnrWr10k34kZa9rJw4UAryUJr15JFWYqr4UJ3W3
 Zw1DKa4Yqw4UJan7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RAYFCUUUUU
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBeHD2hxK-YlIwACsD
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

This is a multi-part message in MIME format.
--------------pJl2dx57YgSjTqPQkpxr6RPU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/7/11 22:16, Thomas Zimmermann 写道:
> Hi
>
> this patch regresses buffer sharing between udl and amdgpu. The latter 
> uses TTM. When udl imports a dma_buf from amdgpu, vmap returns a 
> kernel address, but pagefaults on the buffer cannot be handled. A full 
> error message is attached. It fails right at [1], where udl read the 
> first pixel from the buffer. That pixel address is the vmap'ed buffer.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.15.5/source/drivers/gpu/drm/udl/udl_transfer.c#L109
>
> Buffer sharing works with SHMEM-based drivers, which have their 
> buffers in system memory though. I assume that amdgpu's buffer is 
> located in I/O memory or scanout.
>
> Best regards
> Thomas
>

Hi,
I haven't been able to reproduce this issue yet.
Did the driver not pin the buffer into GTT?

Best regards,
Shixiong


>
> [  168.785445] BUG: unable to handle page fault for address: 
> ffffc9012b800000
> [  168.792311] #PF: supervisor read access in kernel mode
> [  168.797452] #PF: error_code(0x0000) - not-present page
> [  168.802586] PGD 100000067 P4D 100000067 PUD 0
> [  168.807042] Oops: Oops: 0000 [#1] SMP KASAN PTI
> [  168.811573] CPU: 2 UID: 1000 PID: 2380 Comm: KMS thread Tainted: 
> G            E       6.16.0-rc5-1-default+ #4080 PREEMPT(voluntary)
> [  168.823537] Tainted: [E]=UNSIGNED_MODULE
> [  168.827458] Hardware name: System manufacturer System Product 
> Name/Z170-A, BIOS 3802 03/15/2018
> [  168.836125] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> [  168.841779] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01 dd 
> 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 82 
> 05 00 00 <41> 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89 c6 41 89 c4 c1 e8 08
> c1
> [  168.860476] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
> [  168.865697] RAX: 0000000000000003 RBX: 0000000000000000 RCX: 
> 0000000000000002
> [  168.872815] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000100
> [  168.879934] RBP: dffffc0000000000 R08: ffff8881082efe00 R09: 
> ffff8881082e0000
> [  168.887046] R10: 0000000000000002 R11: ffffc9012b800000 R12: 
> ffff88811c7e76f8
> [  168.894155] R13: ffffc9012b800400 R14: ffff8881082e0007 R15: 
> 0000000000000000
> [  168.901266] FS:  00007f4685f3b6c0(0000) GS:ffff88846c690000(0000) 
> knlGS:0000000000000000
> [  168.909330] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  168.915058] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4: 
> 00000000003706f0
> [  168.922170] Call Trace:
> [  168.924616]  <TASK>
> [  168.926714]  ? validate_chain+0x24e/0x5e0
> [  168.930718]  ? __lock_acquire+0x568/0xae0
> [  168.934725]  udl_render_hline+0x165/0x33b [udl]
> [  168.939256]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> [  168.944297]  ? local_clock_noinstr+0xb/0x100
> [  168.948557]  ? __lock_release.isra.0+0x16c/0x2e0
> [  168.953162]  ? mark_held_locks+0x40/0x70
> [  168.957077]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [  168.962721]  udl_primary_plane_helper_atomic_update+0x432/0x670 [udl]
> [  168.969145]  ? 
> __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
> [  168.976089]  ? __pfx___drm_dev_dbg+0x10/0x10
> [  168.980357]  ? 
> drm_atomic_helper_calc_timestamping_constants+0x141/0x200
> [  168.987044]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  168.992599]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  168.997987]  drm_atomic_helper_commit_tail+0x41/0xb0
> [  169.002943]  commit_tail+0x204/0x330
> [  169.006513]  drm_atomic_helper_commit+0x242/0x2e0
> [  169.011203]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> [  169.016413]  drm_atomic_commit+0x1e1/0x290
> [  169.020500]  ? prepare_signaling+0x355/0xda0
> [  169.024769]  ? __pfx_drm_atomic_commit+0x10/0x10
> [  169.029372]  ? __pfx___drm_printfn_info+0x10/0x10
> [  169.034069]  drm_mode_atomic_ioctl+0x8ff/0xe40
> [  169.038510]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  169.043466]  ? find_held_lock+0x2b/0x80
> [  169.047295]  ? __lock_acquire+0x568/0xae0
> [  169.051293]  ? mark_usage+0x65/0x180
> [  169.054870]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  169.059823]  ? do_raw_spin_unlock+0x55/0x230
> [  169.064081]  ? drm_is_current_master+0x26/0x30
> [  169.068517]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  169.073465]  drm_ioctl_kernel+0x141/0x2b0
> [  169.077468]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  169.081987]  ? lock_release.part.0+0x47/0x90
> [  169.086249]  drm_ioctl+0x481/0xb50
> [  169.089653]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  169.094610]  ? __pfx_drm_ioctl+0x10/0x10
> [  169.098525]  ? find_held_lock+0x2b/0x80
> [  169.102356]  ? lock_release.part.0+0x47/0x90
> [  169.106621]  ? __fget_files+0x1aa/0x2f0
> [  169.110450]  ? __fget_files+0x1b4/0x2f0
> [  169.114281]  __x64_sys_ioctl+0x135/0x1c0
> [  169.118201]  do_syscall_64+0x68/0x2a0
> [  169.121856]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  169.126892] RIP: 0033:0x7f469391a53f
> [  169.130460] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 
> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
> 00
> [  169.149151] RSP: 002b:00007f4685f39a80 EFLAGS: 00000246 ORIG_RAX: 
> 0000000000000010
> [  169.156703] RAX: ffffffffffffffda RBX: 00007f465c002da0 RCX: 
> 00007f469391a53f
> [  169.163868] RDX: 00007f4685f39b20 RSI: 00000000c03864bc RDI: 
> 0000000000000010
> [  169.171029] RBP: 00007f4685f39b20 R08: 0000000000001310 R09: 
> 00007f465c044cf0
> [  169.178194] R10: 0000000000000002 R11: 0000000000000246 R12: 
> 00000000c03864bc
> [  169.185358] R13: 0000000000000010 R14: 00007f465c0284b0 R15: 
> 00007f45d402b110
> [  169.192525]  </TASK>
> [  169.194732] Modules linked in: udl(E) snd_seq_dummy(E) 
> snd_hrtimer(E) snd_seq(E) snd_seq_device(E) af_packet(E) nf_tables(E) 
> iptable_filter(E) binfmt_misc(E) intel_rapl_msr(E) nls_iso8859_1(E) 
> eeepc_wmi(E) nls
> _cp437(E) intel_rapl_common(E) snd_hda_codec_realtek(E) asus_wmi(E) 
> iTCO_wdt(E) vfat(E) ee1004(E) snd_hda_codec_generic(E) 
> sparse_keymap(E) x86_pkg_temp_thermal(E) iTCO_vendor_support(E) 
> snd_hda_scodec_component(
> E) intel_powerclamp(E) snd_hda_codec_hdmi(E) platform_profile(E) 
> fat(E) e1000e(E) i2c_i801(E) ptp(E) battery(E) snd_hda_intel(E) 
> i2c_smbus(E) snd_intel_dspcfg(E) mxm_wmi(E) rfkill(E) wmi_bmof(E) 
> intel_wmi_thunder
> bolt(E) coretemp(E) pps_core(E) i2c_mux(E) pcspkr(E) snd_hda_codec(E) 
> xfs(E) snd_hda_core(E) snd_hwdep(E) snd_pcm(E) snd_timer(E) snd(E) 
> soundcore(E) mei_me(E) acpi_pad(E) button(E) mei(E) joydev(E) 
> nvme_fabrics(
> E) loop(E) fuse(E) efi_pstore(E) dm_mod(E) configfs(E) nfnetlink(E) 
> ip_tables(E) x_tables(E) amdgpu(E) amdxcp(E) i2c_algo_bit(E) 
> drm_ttm_helper(E) ttm(E) drm_exec(E) hid_generic(E)
> [  169.194874]  gpu_sched(E) drm_suballoc_helper(E) 
> ghash_clmulni_intel(E) sha512_ssse3(E) video(E) sha1_ssse3(E) 
> aesni_intel(E) usbhid(E) drm_panel_backlight_quirks(E) drm_buddy(E) 
> drm_display_helper(E) cec(E) w
> mi(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) msr(E) i2c_dev(E) 
> efivarfs(E) dmi_sysfs(E)
> [  169.311501] CR2: ffffc9012b800000
> [  169.314835] ---[ end trace 0000000000000000 ]---
> [  169.434549] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> [  169.440237] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01 dd 
> 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 82 
> 05 00 00 <41> 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89 c6 41 89 c4 c1 e8 08
> c1
> [  169.459062] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
> [  169.464309] RAX: 0000000000000003 RBX: 0000000000000000 RCX: 
> 0000000000000002
> [  169.471474] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000100
> [  169.478635] RBP: dffffc0000000000 R08: ffff8881082efe00 R09: 
> ffff8881082e0000
> [  169.485800] R10: 0000000000000002 R11: ffffc9012b800000 R12: 
> ffff88811c7e76f8
> [  169.492962] R13: ffffc9012b800400 R14: ffff8881082e0007 R15: 
> 0000000000000000
> [  169.500126] FS:  00007f4685f3b6c0(0000) GS:ffff88846c690000(0000) 
> knlGS:0000000000000000
> [  169.508246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  169.514014] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4: 
> 00000000003706f0
> [  169.521180] note: KMS thread[2380] exited with irqs disabled
> [  175.343111] 
> ==================================================================
> [  175.350342] BUG: KASAN: slab-use-after-free in 
> mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.357886] Read of size 4 at addr ffff8881172daff4 by task 
> kworker/5:0/49
> [  175.364738]
> [  175.366235] CPU: 5 UID: 0 PID: 49 Comm: kworker/5:0 Tainted: G      
> D     E       6.16.0-rc5-1-default+ #4080 PREEMPT(voluntary)
> [  175.366240] Tainted: [D]=DIE, [E]=UNSIGNED_MODULE
> [  175.366242] Hardware name: System manufacturer System Product 
> Name/Z170-A, BIOS 3802 03/15/2018
> [  175.366244] Workqueue: events output_poll_execute
> [  175.366249] Call Trace:
> [  175.366251]  <TASK>
> [  175.366254]  dump_stack_lvl+0x68/0x90
> [  175.366259]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.366261]  print_address_description.constprop.0+0x88/0x380
> [  175.366266]  ? lock_acquire+0xf2/0x140
> [  175.366269]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.366272]  print_report+0xf8/0x1e2
> [  175.366275]  ? __virt_addr_valid+0x22e/0x500
> [  175.366279]  ? kasan_addr_to_slab+0x9/0x90
> [  175.366282]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.366284]  kasan_report+0xd8/0x190
> [  175.366288]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.366294]  mutex_can_spin_on_owner+0x1a6/0x1c0
> [  175.366297]  __ww_mutex_lock.constprop.0+0x2f8/0x34d0
> [  175.366301]  ? do_raw_spin_trylock+0xa2/0x160
> [  175.366304]  ? __pfx_do_raw_spin_trylock+0x10/0x10
> [  175.366308]  ? get_nohz_timer_target+0x28/0x3d0
> [  175.366311]  ? modeset_lock+0x3c6/0x640
> [  175.366316]  ? __pfx___ww_mutex_lock.constprop.0+0x10/0x10
> [  175.366320]  ? rcu_is_watching+0x11/0xb0
> [  175.366323]  ? timerqueue_add+0x154/0x3c0
> [  175.366328]  ? __hrtimer_start_range_ns+0x2e1/0x750
> [  175.366331]  ? rcu_is_watching+0x11/0xb0
> [  175.366334]  ? lock_acquired+0xb6/0xf0
> [  175.366337]  ? rcu_is_watching+0x11/0xb0
> [  175.366340]  ? rcu_is_watching+0x11/0xb0
> [  175.366342]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
> [  175.366345]  ? lock_acquire+0xf2/0x140
> [  175.366349]  ? ww_mutex_lock+0x27/0x150
> [  175.366352]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
> [  175.366355]  ww_mutex_lock+0x27/0x150
> [  175.366358]  modeset_lock+0x3c6/0x640
> [  175.366362]  drm_helper_probe_detect_ctx+0xa6/0x1a0
> [  175.366366]  ? __pfx_drm_helper_probe_detect_ctx+0x10/0x10
> [  175.366375]  ? __pfx_drm_connector_list_iter_next+0x10/0x10
> [  175.366381]  output_poll_execute+0x29b/0x760
> [  175.366387]  ? trace_hardirqs_on+0x14/0x150
> [  175.366391]  ? __pfx_output_poll_execute+0x10/0x10
> [  175.366396]  process_one_work+0x7b5/0x1390
> [  175.366404]  ? __pfx_process_one_work+0x10/0x10
> [  175.366409]  ? assign_work+0x156/0x390
> [  175.366413]  worker_thread+0x58d/0xf60
> [  175.366420]  ? __pfx_worker_thread+0x10/0x10
> [  175.366422]  kthread+0x370/0x720
> [  175.366425]  ? __pfx_kthread+0x10/0x10
> [  175.366428]  ? local_clock_noinstr+0x56/0x100
> [  175.366431]  ? local_clock+0x11/0x30
> [  175.366433]  ? __lock_release.isra.0+0x16c/0x2e0
> [  175.366437]  ? rcu_is_watching+0x11/0xb0
> [  175.366439]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [  175.366442]  ? __pfx_kthread+0x10/0x10
> [  175.366445]  ret_from_fork+0x1f4/0x2f0
> [  175.366448]  ? __pfx_kthread+0x10/0x10
> [  175.366450]  ret_from_fork_asm+0x1a/0x30
> [  175.366459]  </TASK>
> [  175.366460]
> [  175.632772] Allocated by task 2342:
> [  175.636282]  kasan_save_stack+0x1c/0x40
> [  175.640137]  kasan_save_track+0x10/0x30
> [  175.643992]  __kasan_slab_alloc+0x5f/0x70
> [  175.648023]  kmem_cache_alloc_node_noprof+0x13a/0x380
> [  175.653097]  dup_task_struct+0x32/0x730
> [  175.656952]  copy_process+0x2d8/0x5380
> [  175.660720]  kernel_clone+0x9f/0x5e0
> [  175.664318]  __do_sys_clone3+0x135/0x180
> [  175.668258]  do_syscall_64+0x68/0x2a0
> [  175.671940]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  175.677014]
> [  175.678520] Freed by task 0:
> [  175.681418]  kasan_save_stack+0x1c/0x40
> [  175.685273]  kasan_save_track+0x10/0x30
> [  175.689130]  kasan_save_free_info+0x37/0x70
> [  175.693333]  __kasan_slab_free+0x33/0x40
> [  175.697278]  kmem_cache_free+0x10b/0x4d0
> [  175.701221]  delayed_put_task_struct+0x15e/0x1e0
> [  175.705858]  rcu_do_batch+0x2e3/0xb30
> [  175.709542]  rcu_core+0x51d/0xb60
> [  175.712873]  handle_softirqs+0x1a2/0x6b0
> [  175.716817]  __irq_exit_rcu+0xf7/0x160
> [  175.720585]  irq_exit_rcu+0xa/0x30
> [  175.724006]  sysvec_apic_timer_interrupt+0x9d/0xc0
> [  175.728820]  asm_sysvec_apic_timer_interrupt+0x16/0x20
> [  175.733980]
> [  175.735486] Last potentially related work creation:
> [  175.740385]  kasan_save_stack+0x1c/0x40
> [  175.744243]  kasan_record_aux_stack+0x88/0xa0
> [  175.748618]  __call_rcu_common.constprop.0+0x77/0x850
> [  175.753693]  __schedule+0x887/0x1d00
> [  175.757287]  schedule+0xd0/0x260
> [  175.760533]  smpboot_thread_fn+0x583/0x7a0
> [  175.764650]  kthread+0x370/0x720
> [  175.767896]  ret_from_fork+0x1f4/0x2f0
> [  175.771665]  ret_from_fork_asm+0x1a/0x30
> [  175.775608]
> [  175.777113] Second to last potentially related work creation:
> [  175.782886]  kasan_save_stack+0x1c/0x40
> [  175.786739]  kasan_record_aux_stack+0x88/0xa0
> [  175.791118]  task_work_add+0x1b1/0x270
> [  175.794886]  sched_tick+0x226/0x6f0
> [  175.798394]  update_process_times+0xe9/0x1f0
> [  175.802685]  tick_nohz_handler+0x1a6/0x4b0
> [  175.806801]  __hrtimer_run_queues+0x161/0x960
> [  175.811181]  hrtimer_interrupt+0x33e/0x880
> [  175.815295]  __sysvec_apic_timer_interrupt+0xf6/0x390
> [  175.820370]  sysvec_apic_timer_interrupt+0x98/0xc0
> [  175.825183]  asm_sysvec_apic_timer_interrupt+0x16/0x20
> [  175.830343]
> [  175.831849] The buggy address belongs to the object at 
> ffff8881172dafc0
> [  175.831849]  which belongs to the cache task_struct of size 11968
> [  175.844582] The buggy address is located 52 bytes inside of
> [  175.844582]  freed 11968-byte region [ffff8881172dafc0, 
> ffff8881172dde80)
> [  175.856969]
> [  175.858474] The buggy address belongs to the physical page:
> [  175.864070] page: refcount:0 mapcount:0 mapping:0000000000000000 
> index:0x0 pfn:0x1172d8
> [  175.872104] head: order:3 mapcount:0 entire_mapcount:0 
> nr_pages_mapped:0 pincount:0
> [  175.879788] memcg:ffff88811068a301
> [  175.883209] anon flags: 
> 0x2ffff800000040(head|node=0|zone=2|lastcpupid=0x1ffff)
> [  175.890547] page_type: f5(slab)
> [  175.893706] raw: 002ffff800000040 ffff888100930500 0000000000000000 
> 0000000000000001
> [  175.901479] raw: 0000000000000000 0000000000020002 00000000f5000000 
> ffff88811068a301
> [  175.909249] head: 002ffff800000040 ffff888100930500 
> 0000000000000000 0000000000000001
> [  175.917109] head: 0000000000000000 0000000000020002 
> 00000000f5000000 ffff88811068a301
> [  175.924968] head: 002ffff800000003 ffffea00045cb601 
> 00000000ffffffff 00000000ffffffff
> [  175.932827] head: ffffffffffffffff 0000000000000000 
> 00000000ffffffff 0000000000000008
> [  175.940685] page dumped because: kasan: bad access detected
> [  175.946283]
> [  175.947787] Memory state around the buggy address:
> [  175.952603]  ffff8881172dae80: fb fb fb fb fb fb fb fb fc fc fc fc 
> fc fc fc fc
> [  175.959854]  ffff8881172daf00: fc fc fc fc fc fc fc fc fc fc fc fc 
> fc fc fc fc
> [  175.967101] >ffff8881172daf80: fc fc fc fc fc fc fc fc fa fb fb fb 
> fb fb fb fb
> [ 175.974353] ^
> [  175.981256]  ffff8881172db000: fb fb fb fb fb fb fb fb fb fb fb fb 
> fb fb fb fb
> [  175.988504]  ffff8881172db080: fb fb fb fb fb fb fb fb fb fb fb fb 
> fb fb fb fb
> [  175.995755] 
> ==================================================================
>
>
>
>
>
>
>
> Am 22.05.25 um 09:07 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> [WHY]
>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>     DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>     sg_table import.
>>     They only need dma_buf_vmap() to access the shared buffer's
>>     kernel virtual address.
>>
>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>     trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>     restricts the maximum DMA streaming mapping memory, resulting in
>>     errors like:
>>
>>     ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), 
>> total 32768 (slots), used 0 (slots)
>>
>> [HOW]
>> Provide a gem_prime_import implementation without sg_table mapping
>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>> require sg_table can adopt this.
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>> v1->v2:
>>     Patch rebase.
>> v2->v3:
>>     Rename the import callback function.
>>     Remove drm_gem_shmem_prime_export() and separate some codes
>>     to drm_gem_prime_import_self().
>> v3->v4:
>>     Separate the test from the policy.
>>     Rename the macro.
>> v4->v5:
>>     Rename some functions.
>>
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 57 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
>>   include/drm/drm_gem_shmem_helper.h     | 15 +++++++
>>   include/drm/drm_prime.h                |  3 ++
>>   4 files changed, 102 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index aa43265f4f4f..126aa79042ad 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct 
>> drm_device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>   +/**
>> + * drm_gem_shmem_prime_import_no_map - Import dmabuf without mapping 
>> its sg_table
>> + * @dev: Device to import into
>> + * @dma_buf: dma-buf object to import
>> + *
>> + * Drivers that use the shmem helpers but also wants to import 
>> dmabuf without
>> + * mapping its sg_table can use this as their 
>> &drm_driver.gem_prime_import
>> + * implementation.
>> + */
>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct 
>> drm_device *dev,
>> +                             struct dma_buf *dma_buf)
>> +{
>> +    struct dma_buf_attachment *attach;
>> +    struct drm_gem_shmem_object *shmem;
>> +    struct drm_gem_object *obj;
>> +    size_t size;
>> +    int ret;
>> +
>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>> +        /*
>> +         * Importing dmabuf exported from our own gem increases
>> +         * refcount on gem itself instead of f_count of dmabuf.
>> +         */
>> +        obj = dma_buf->priv;
>> +        drm_gem_object_get(obj);
>> +        return obj;
>> +    }
>> +
>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>> +    if (IS_ERR(attach))
>> +        return ERR_CAST(attach);
>> +
>> +    get_dma_buf(dma_buf);
>> +
>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>> +
>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>> +    if (IS_ERR(shmem)) {
>> +        ret = PTR_ERR(shmem);
>> +        goto fail_detach;
>> +    }
>> +
>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>> +
>> +    shmem->base.import_attach = attach;
>> +    shmem->base.resv = dma_buf->resv;
>> +
>> +    return &shmem->base;
>> +
>> +fail_detach:
>> +    dma_buf_detach(dma_buf, attach);
>> +    dma_buf_put(dma_buf);
>> +
>> +    return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>> +
>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index d828502268b8..b825b71038d6 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct 
>> drm_gem_object *obj,
>>   }
>>   EXPORT_SYMBOL(drm_gem_prime_export);
>>   +
>> +/**
>> + * drm_gem_is_prime_exported_dma_buf -
>> + * checks if the DMA-BUF was exported from a GEM object belonging to 
>> @dev.
>> + * @dev: drm_device to check against
>> + * @dma_buf: dma-buf object to import
>> + *
>> + * Return: true if the DMA-BUF was exported from a GEM object belonging
>> + * to @dev, false otherwise.
>> + */
>> +
>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>> +                       struct dma_buf *dma_buf)
>> +{
>> +    struct drm_gem_object *obj = dma_buf->priv;
>> +
>> +    return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev 
>> == dev);
>> +}
>> +EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>> +
>>   /**
>>    * drm_gem_prime_import_dev - core implementation of the import 
>> callback
>>    * @dev: drm_device to import into
>> @@ -933,16 +953,14 @@ struct drm_gem_object 
>> *drm_gem_prime_import_dev(struct drm_device *dev,
>>       struct drm_gem_object *obj;
>>       int ret;
>>   -    if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>> +        /*
>> +         * Importing dmabuf exported from our own gem increases
>> +         * refcount on gem itself instead of f_count of dmabuf.
>> +         */
>>           obj = dma_buf->priv;
>> -        if (obj->dev == dev) {
>> -            /*
>> -             * Importing dmabuf exported from our own gem increases
>> -             * refcount on gem itself instead of f_count of dmabuf.
>> -             */
>> -            drm_gem_object_get(obj);
>> -            return obj;
>> -        }
>> +        drm_gem_object_get(obj);
>> +        return obj;
>>       }
>>         if (!dev->driver->gem_prime_import_sg_table)
>> diff --git a/include/drm/drm_gem_shmem_helper.h 
>> b/include/drm/drm_gem_shmem_helper.h
>> index b4f993da3cae..35f7466dca84 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct 
>> drm_device *dev,
>>                       struct sg_table *sgt);
>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct 
>> drm_device *dev,
>>                     struct drm_mode_create_dumb *args);
>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct 
>> drm_device *dev,
>> +                             struct dma_buf *buf);
>>     /**
>>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file 
>> *file, struct drm_device *dev,
>>       .gem_prime_import_sg_table = 
>> drm_gem_shmem_prime_import_sg_table, \
>>       .dumb_create           = drm_gem_shmem_dumb_create
>>   +/**
>> + * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
>> + *                                       without mapping sg_table on
>> + *                                       imported buffer.
>> + *
>> + * This macro provides a shortcut for setting the shmem GEM 
>> operations in
>> + * the &drm_driver structure for drivers that do not require a 
>> sg_table on
>> + * imported buffers.
>> + */
>> +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
>> +    .gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
>> +    .dumb_create            = drm_gem_shmem_dumb_create
>> +
>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index fa085c44d4ca..f50f862f0d8b 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct 
>> drm_gem_object *obj,
>>   unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>>     /* helper functions for importing */
>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>> +                       struct dma_buf *dma_buf);
>> +
>>   struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device 
>> *dev,
>>                           struct dma_buf *dma_buf,
>>                           struct device *attach_dev);
>
--------------pJl2dx57YgSjTqPQkpxr6RPU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/7/11 22:16, Thomas Zimmermann
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de">Hi
      <br>
      <br>
      this patch regresses buffer sharing between udl and amdgpu. The
      latter uses TTM. When udl imports a dma_buf from amdgpu, vmap
      returns a kernel address, but pagefaults on the buffer cannot be
      handled. A full error message is attached. It fails right at [1],
      where udl read the first pixel from the buffer. That pixel address
      is the vmap'ed buffer.
      <br>
      <br>
      [1]
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.15.5/source/drivers/gpu/drm/udl/udl_transfer.c#L109">https://elixir.bootlin.com/linux/v6.15.5/source/drivers/gpu/drm/udl/udl_transfer.c#L109</a><br>
      <br>
      Buffer sharing works with SHMEM-based drivers, which have their
      buffers in system memory though. I assume that amdgpu's buffer is
      located in I/O memory or scanout.
      <br>
      <br>
      Best regards
      <br>
      Thomas <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <article
data-content="[{&quot;type&quot;:&quot;block&quot;,&quot;id&quot;:&quot;b4F2-1752487779327&quot;,&quot;name&quot;:&quot;paragraph&quot;,&quot;data&quot;:{},&quot;nodes&quot;:[{&quot;type&quot;:&quot;text&quot;,&quot;id&quot;:&quot;VI7k-1752487779325&quot;,&quot;leaves&quot;:[{&quot;text&quot;:&quot;pin buffer into GTT&quot;,&quot;marks&quot;:[]}]}],&quot;state&quot;:{}}]">
      <div
style="white-space:pre-wrap;line-height:1.75;font-size:14px;text-align:left;">Hi,</div>
      I haven't been able to reproduce this issue yet. <br>
      Did the driver not pin the buffer into GTT?<br>
       <br>
      Best regards,<br>
      Shixiong
      <div
style="white-space:pre-wrap;line-height:1.75;font-size:14px;text-align:left;">
</div>
    </article>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de"><br>
      [  168.785445] BUG: unable to handle page fault for address:
      ffffc9012b800000
      <br>
      [  168.792311] #PF: supervisor read access in kernel mode
      <br>
      [  168.797452] #PF: error_code(0x0000) - not-present page
      <br>
      [  168.802586] PGD 100000067 P4D 100000067 PUD 0
      <br>
      [  168.807042] Oops: Oops: 0000 [#1] SMP KASAN PTI
      <br>
      [  168.811573] CPU: 2 UID: 1000 PID: 2380 Comm: KMS thread
      Tainted: G            E       6.16.0-rc5-1-default+ #4080
      PREEMPT(voluntary)
      <br>
      [  168.823537] Tainted: [E]=UNSIGNED_MODULE
      <br>
      [  168.827458] Hardware name: System manufacturer System Product
      Name/Z170-A, BIOS 3802 03/15/2018
      <br>
      [  168.836125] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
      <br>
      [  168.841779] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01
      dd 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f
      85 82 05 00 00 &lt;41&gt; 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89
      c6 41 89 c4 c1 e8 08
      <br>
      c1
      <br>
      [  168.860476] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
      <br>
      [  168.865697] RAX: 0000000000000003 RBX: 0000000000000000 RCX:
      0000000000000002
      <br>
      [  168.872815] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
      0000000000000100
      <br>
      [  168.879934] RBP: dffffc0000000000 R08: ffff8881082efe00 R09:
      ffff8881082e0000
      <br>
      [  168.887046] R10: 0000000000000002 R11: ffffc9012b800000 R12:
      ffff88811c7e76f8
      <br>
      [  168.894155] R13: ffffc9012b800400 R14: ffff8881082e0007 R15:
      0000000000000000
      <br>
      [  168.901266] FS:  00007f4685f3b6c0(0000)
      GS:ffff88846c690000(0000) knlGS:0000000000000000
      <br>
      [  168.909330] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
      <br>
      [  168.915058] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4:
      00000000003706f0
      <br>
      [  168.922170] Call Trace:
      <br>
      [  168.924616]  &lt;TASK&gt;
      <br>
      [  168.926714]  ? validate_chain+0x24e/0x5e0
      <br>
      [  168.930718]  ? __lock_acquire+0x568/0xae0
      <br>
      [  168.934725]  udl_render_hline+0x165/0x33b [udl]
      <br>
      [  168.939256]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
      <br>
      [  168.944297]  ? local_clock_noinstr+0xb/0x100
      <br>
      [  168.948557]  ? __lock_release.isra.0+0x16c/0x2e0
      <br>
      [  168.953162]  ? mark_held_locks+0x40/0x70
      <br>
      [  168.957077]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
      <br>
      [  168.962721]  udl_primary_plane_helper_atomic_update+0x432/0x670
      [udl]
      <br>
      [  168.969145]  ?
      __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
      <br>
      [  168.976089]  ? __pfx___drm_dev_dbg+0x10/0x10
      <br>
      [  168.980357]  ?
      drm_atomic_helper_calc_timestamping_constants+0x141/0x200
      <br>
      [  168.987044]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
      <br>
      [  168.992599]  drm_atomic_helper_commit_planes+0x3b6/0x1030
      <br>
      [  168.997987]  drm_atomic_helper_commit_tail+0x41/0xb0
      <br>
      [  169.002943]  commit_tail+0x204/0x330
      <br>
      [  169.006513]  drm_atomic_helper_commit+0x242/0x2e0
      <br>
      [  169.011203]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
      <br>
      [  169.016413]  drm_atomic_commit+0x1e1/0x290
      <br>
      [  169.020500]  ? prepare_signaling+0x355/0xda0
      <br>
      [  169.024769]  ? __pfx_drm_atomic_commit+0x10/0x10
      <br>
      [  169.029372]  ? __pfx___drm_printfn_info+0x10/0x10
      <br>
      [  169.034069]  drm_mode_atomic_ioctl+0x8ff/0xe40
      <br>
      [  169.038510]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
      <br>
      [  169.043466]  ? find_held_lock+0x2b/0x80
      <br>
      [  169.047295]  ? __lock_acquire+0x568/0xae0
      <br>
      [  169.051293]  ? mark_usage+0x65/0x180
      <br>
      [  169.054870]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
      <br>
      [  169.059823]  ? do_raw_spin_unlock+0x55/0x230
      <br>
      [  169.064081]  ? drm_is_current_master+0x26/0x30
      <br>
      [  169.068517]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
      <br>
      [  169.073465]  drm_ioctl_kernel+0x141/0x2b0
      <br>
      [  169.077468]  ? __pfx_drm_ioctl_kernel+0x10/0x10
      <br>
      [  169.081987]  ? lock_release.part.0+0x47/0x90
      <br>
      [  169.086249]  drm_ioctl+0x481/0xb50
      <br>
      [  169.089653]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
      <br>
      [  169.094610]  ? __pfx_drm_ioctl+0x10/0x10
      <br>
      [  169.098525]  ? find_held_lock+0x2b/0x80
      <br>
      [  169.102356]  ? lock_release.part.0+0x47/0x90
      <br>
      [  169.106621]  ? __fget_files+0x1aa/0x2f0
      <br>
      [  169.110450]  ? __fget_files+0x1b4/0x2f0
      <br>
      [  169.114281]  __x64_sys_ioctl+0x135/0x1c0
      <br>
      [  169.118201]  do_syscall_64+0x68/0x2a0
      <br>
      [  169.121856]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
      <br>
      [  169.126892] RIP: 0033:0x7f469391a53f
      <br>
      [  169.130460] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04
      24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10
      00 00 00 0f 05 &lt;89&gt; c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18
      64 48 2b 04 25 28 00
      <br>
      00
      <br>
      [  169.149151] RSP: 002b:00007f4685f39a80 EFLAGS: 00000246
      ORIG_RAX: 0000000000000010
      <br>
      [  169.156703] RAX: ffffffffffffffda RBX: 00007f465c002da0 RCX:
      00007f469391a53f
      <br>
      [  169.163868] RDX: 00007f4685f39b20 RSI: 00000000c03864bc RDI:
      0000000000000010
      <br>
      [  169.171029] RBP: 00007f4685f39b20 R08: 0000000000001310 R09:
      00007f465c044cf0
      <br>
      [  169.178194] R10: 0000000000000002 R11: 0000000000000246 R12:
      00000000c03864bc
      <br>
      [  169.185358] R13: 0000000000000010 R14: 00007f465c0284b0 R15:
      00007f45d402b110
      <br>
      [  169.192525]  &lt;/TASK&gt;
      <br>
      [  169.194732] Modules linked in: udl(E) snd_seq_dummy(E)
      snd_hrtimer(E) snd_seq(E) snd_seq_device(E) af_packet(E)
      nf_tables(E) iptable_filter(E) binfmt_misc(E) intel_rapl_msr(E)
      nls_iso8859_1(E) eeepc_wmi(E) nls
      <br>
      _cp437(E) intel_rapl_common(E) snd_hda_codec_realtek(E)
      asus_wmi(E) iTCO_wdt(E) vfat(E) ee1004(E) snd_hda_codec_generic(E)
      sparse_keymap(E) x86_pkg_temp_thermal(E) iTCO_vendor_support(E)
      snd_hda_scodec_component(
      <br>
      E) intel_powerclamp(E) snd_hda_codec_hdmi(E) platform_profile(E)
      fat(E) e1000e(E) i2c_i801(E) ptp(E) battery(E) snd_hda_intel(E)
      i2c_smbus(E) snd_intel_dspcfg(E) mxm_wmi(E) rfkill(E) wmi_bmof(E)
      intel_wmi_thunder
      <br>
      bolt(E) coretemp(E) pps_core(E) i2c_mux(E) pcspkr(E)
      snd_hda_codec(E) xfs(E) snd_hda_core(E) snd_hwdep(E) snd_pcm(E)
      snd_timer(E) snd(E) soundcore(E) mei_me(E) acpi_pad(E) button(E)
      mei(E) joydev(E) nvme_fabrics(
      <br>
      E) loop(E) fuse(E) efi_pstore(E) dm_mod(E) configfs(E)
      nfnetlink(E) ip_tables(E) x_tables(E) amdgpu(E) amdxcp(E)
      i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm_exec(E)
      hid_generic(E)
      <br>
      [  169.194874]  gpu_sched(E) drm_suballoc_helper(E)
      ghash_clmulni_intel(E) sha512_ssse3(E) video(E) sha1_ssse3(E)
      aesni_intel(E) usbhid(E) drm_panel_backlight_quirks(E)
      drm_buddy(E) drm_display_helper(E) cec(E) w
      <br>
      mi(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) msr(E)
      i2c_dev(E) efivarfs(E) dmi_sysfs(E)
      <br>
      [  169.311501] CR2: ffffc9012b800000
      <br>
      [  169.314835] ---[ end trace 0000000000000000 ]---
      <br>
      [  169.434549] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
      <br>
      [  169.440237] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01
      dd 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f
      85 82 05 00 00 &lt;41&gt; 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89
      c6 41 89 c4 c1 e8 08
      <br>
      c1
      <br>
      [  169.459062] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
      <br>
      [  169.464309] RAX: 0000000000000003 RBX: 0000000000000000 RCX:
      0000000000000002
      <br>
      [  169.471474] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
      0000000000000100
      <br>
      [  169.478635] RBP: dffffc0000000000 R08: ffff8881082efe00 R09:
      ffff8881082e0000
      <br>
      [  169.485800] R10: 0000000000000002 R11: ffffc9012b800000 R12:
      ffff88811c7e76f8
      <br>
      [  169.492962] R13: ffffc9012b800400 R14: ffff8881082e0007 R15:
      0000000000000000
      <br>
      [  169.500126] FS:  00007f4685f3b6c0(0000)
      GS:ffff88846c690000(0000) knlGS:0000000000000000
      <br>
      [  169.508246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
      <br>
      [  169.514014] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4:
      00000000003706f0
      <br>
      [  169.521180] note: KMS thread[2380] exited with irqs disabled
      <br>
      [  175.343111]
      ==================================================================
      <br>
      [  175.350342] BUG: KASAN: slab-use-after-free in
      mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.357886] Read of size 4 at addr ffff8881172daff4 by task
      kworker/5:0/49
      <br>
      [  175.364738]
      <br>
      [  175.366235] CPU: 5 UID: 0 PID: 49 Comm: kworker/5:0 Tainted:
      G      D     E       6.16.0-rc5-1-default+ #4080
      PREEMPT(voluntary)
      <br>
      [  175.366240] Tainted: [D]=DIE, [E]=UNSIGNED_MODULE
      <br>
      [  175.366242] Hardware name: System manufacturer System Product
      Name/Z170-A, BIOS 3802 03/15/2018
      <br>
      [  175.366244] Workqueue: events output_poll_execute
      <br>
      [  175.366249] Call Trace:
      <br>
      [  175.366251]  &lt;TASK&gt;
      <br>
      [  175.366254]  dump_stack_lvl+0x68/0x90
      <br>
      [  175.366259]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.366261]  print_address_description.constprop.0+0x88/0x380
      <br>
      [  175.366266]  ? lock_acquire+0xf2/0x140
      <br>
      [  175.366269]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.366272]  print_report+0xf8/0x1e2
      <br>
      [  175.366275]  ? __virt_addr_valid+0x22e/0x500
      <br>
      [  175.366279]  ? kasan_addr_to_slab+0x9/0x90
      <br>
      [  175.366282]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.366284]  kasan_report+0xd8/0x190
      <br>
      [  175.366288]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.366294]  mutex_can_spin_on_owner+0x1a6/0x1c0
      <br>
      [  175.366297]  __ww_mutex_lock.constprop.0+0x2f8/0x34d0
      <br>
      [  175.366301]  ? do_raw_spin_trylock+0xa2/0x160
      <br>
      [  175.366304]  ? __pfx_do_raw_spin_trylock+0x10/0x10
      <br>
      [  175.366308]  ? get_nohz_timer_target+0x28/0x3d0
      <br>
      [  175.366311]  ? modeset_lock+0x3c6/0x640
      <br>
      [  175.366316]  ? __pfx___ww_mutex_lock.constprop.0+0x10/0x10
      <br>
      [  175.366320]  ? rcu_is_watching+0x11/0xb0
      <br>
      [  175.366323]  ? timerqueue_add+0x154/0x3c0
      <br>
      [  175.366328]  ? __hrtimer_start_range_ns+0x2e1/0x750
      <br>
      [  175.366331]  ? rcu_is_watching+0x11/0xb0
      <br>
      [  175.366334]  ? lock_acquired+0xb6/0xf0
      <br>
      [  175.366337]  ? rcu_is_watching+0x11/0xb0
      <br>
      [  175.366340]  ? rcu_is_watching+0x11/0xb0
      <br>
      [  175.366342]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
      <br>
      [  175.366345]  ? lock_acquire+0xf2/0x140
      <br>
      [  175.366349]  ? ww_mutex_lock+0x27/0x150
      <br>
      [  175.366352]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
      <br>
      [  175.366355]  ww_mutex_lock+0x27/0x150
      <br>
      [  175.366358]  modeset_lock+0x3c6/0x640
      <br>
      [  175.366362]  drm_helper_probe_detect_ctx+0xa6/0x1a0
      <br>
      [  175.366366]  ? __pfx_drm_helper_probe_detect_ctx+0x10/0x10
      <br>
      [  175.366375]  ? __pfx_drm_connector_list_iter_next+0x10/0x10
      <br>
      [  175.366381]  output_poll_execute+0x29b/0x760
      <br>
      [  175.366387]  ? trace_hardirqs_on+0x14/0x150
      <br>
      [  175.366391]  ? __pfx_output_poll_execute+0x10/0x10
      <br>
      [  175.366396]  process_one_work+0x7b5/0x1390
      <br>
      [  175.366404]  ? __pfx_process_one_work+0x10/0x10
      <br>
      [  175.366409]  ? assign_work+0x156/0x390
      <br>
      [  175.366413]  worker_thread+0x58d/0xf60
      <br>
      [  175.366420]  ? __pfx_worker_thread+0x10/0x10
      <br>
      [  175.366422]  kthread+0x370/0x720
      <br>
      [  175.366425]  ? __pfx_kthread+0x10/0x10
      <br>
      [  175.366428]  ? local_clock_noinstr+0x56/0x100
      <br>
      [  175.366431]  ? local_clock+0x11/0x30
      <br>
      [  175.366433]  ? __lock_release.isra.0+0x16c/0x2e0
      <br>
      [  175.366437]  ? rcu_is_watching+0x11/0xb0
      <br>
      [  175.366439]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
      <br>
      [  175.366442]  ? __pfx_kthread+0x10/0x10
      <br>
      [  175.366445]  ret_from_fork+0x1f4/0x2f0
      <br>
      [  175.366448]  ? __pfx_kthread+0x10/0x10
      <br>
      [  175.366450]  ret_from_fork_asm+0x1a/0x30
      <br>
      [  175.366459]  &lt;/TASK&gt;
      <br>
      [  175.366460]
      <br>
      [  175.632772] Allocated by task 2342:
      <br>
      [  175.636282]  kasan_save_stack+0x1c/0x40
      <br>
      [  175.640137]  kasan_save_track+0x10/0x30
      <br>
      [  175.643992]  __kasan_slab_alloc+0x5f/0x70
      <br>
      [  175.648023]  kmem_cache_alloc_node_noprof+0x13a/0x380
      <br>
      [  175.653097]  dup_task_struct+0x32/0x730
      <br>
      [  175.656952]  copy_process+0x2d8/0x5380
      <br>
      [  175.660720]  kernel_clone+0x9f/0x5e0
      <br>
      [  175.664318]  __do_sys_clone3+0x135/0x180
      <br>
      [  175.668258]  do_syscall_64+0x68/0x2a0
      <br>
      [  175.671940]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
      <br>
      [  175.677014]
      <br>
      [  175.678520] Freed by task 0:
      <br>
      [  175.681418]  kasan_save_stack+0x1c/0x40
      <br>
      [  175.685273]  kasan_save_track+0x10/0x30
      <br>
      [  175.689130]  kasan_save_free_info+0x37/0x70
      <br>
      [  175.693333]  __kasan_slab_free+0x33/0x40
      <br>
      [  175.697278]  kmem_cache_free+0x10b/0x4d0
      <br>
      [  175.701221]  delayed_put_task_struct+0x15e/0x1e0
      <br>
      [  175.705858]  rcu_do_batch+0x2e3/0xb30
      <br>
      [  175.709542]  rcu_core+0x51d/0xb60
      <br>
      [  175.712873]  handle_softirqs+0x1a2/0x6b0
      <br>
      [  175.716817]  __irq_exit_rcu+0xf7/0x160
      <br>
      [  175.720585]  irq_exit_rcu+0xa/0x30
      <br>
      [  175.724006]  sysvec_apic_timer_interrupt+0x9d/0xc0
      <br>
      [  175.728820]  asm_sysvec_apic_timer_interrupt+0x16/0x20
      <br>
      [  175.733980]
      <br>
      [  175.735486] Last potentially related work creation:
      <br>
      [  175.740385]  kasan_save_stack+0x1c/0x40
      <br>
      [  175.744243]  kasan_record_aux_stack+0x88/0xa0
      <br>
      [  175.748618]  __call_rcu_common.constprop.0+0x77/0x850
      <br>
      [  175.753693]  __schedule+0x887/0x1d00
      <br>
      [  175.757287]  schedule+0xd0/0x260
      <br>
      [  175.760533]  smpboot_thread_fn+0x583/0x7a0
      <br>
      [  175.764650]  kthread+0x370/0x720
      <br>
      [  175.767896]  ret_from_fork+0x1f4/0x2f0
      <br>
      [  175.771665]  ret_from_fork_asm+0x1a/0x30
      <br>
      [  175.775608]
      <br>
      [  175.777113] Second to last potentially related work creation:
      <br>
      [  175.782886]  kasan_save_stack+0x1c/0x40
      <br>
      [  175.786739]  kasan_record_aux_stack+0x88/0xa0
      <br>
      [  175.791118]  task_work_add+0x1b1/0x270
      <br>
      [  175.794886]  sched_tick+0x226/0x6f0
      <br>
      [  175.798394]  update_process_times+0xe9/0x1f0
      <br>
      [  175.802685]  tick_nohz_handler+0x1a6/0x4b0
      <br>
      [  175.806801]  __hrtimer_run_queues+0x161/0x960
      <br>
      [  175.811181]  hrtimer_interrupt+0x33e/0x880
      <br>
      [  175.815295]  __sysvec_apic_timer_interrupt+0xf6/0x390
      <br>
      [  175.820370]  sysvec_apic_timer_interrupt+0x98/0xc0
      <br>
      [  175.825183]  asm_sysvec_apic_timer_interrupt+0x16/0x20
      <br>
      [  175.830343]
      <br>
      [  175.831849] The buggy address belongs to the object at
      ffff8881172dafc0
      <br>
      [  175.831849]  which belongs to the cache task_struct of size
      11968
      <br>
      [  175.844582] The buggy address is located 52 bytes inside of
      <br>
      [  175.844582]  freed 11968-byte region [ffff8881172dafc0,
      ffff8881172dde80)
      <br>
      [  175.856969]
      <br>
      [  175.858474] The buggy address belongs to the physical page:
      <br>
      [  175.864070] page: refcount:0 mapcount:0
      mapping:0000000000000000 index:0x0 pfn:0x1172d8
      <br>
      [  175.872104] head: order:3 mapcount:0 entire_mapcount:0
      nr_pages_mapped:0 pincount:0
      <br>
      [  175.879788] memcg:ffff88811068a301
      <br>
      [  175.883209] anon flags:
      0x2ffff800000040(head|node=0|zone=2|lastcpupid=0x1ffff)
      <br>
      [  175.890547] page_type: f5(slab)
      <br>
      [  175.893706] raw: 002ffff800000040 ffff888100930500
      0000000000000000 0000000000000001
      <br>
      [  175.901479] raw: 0000000000000000 0000000000020002
      00000000f5000000 ffff88811068a301
      <br>
      [  175.909249] head: 002ffff800000040 ffff888100930500
      0000000000000000 0000000000000001
      <br>
      [  175.917109] head: 0000000000000000 0000000000020002
      00000000f5000000 ffff88811068a301
      <br>
      [  175.924968] head: 002ffff800000003 ffffea00045cb601
      00000000ffffffff 00000000ffffffff
      <br>
      [  175.932827] head: ffffffffffffffff 0000000000000000
      00000000ffffffff 0000000000000008
      <br>
      [  175.940685] page dumped because: kasan: bad access detected
      <br>
      [  175.946283]
      <br>
      [  175.947787] Memory state around the buggy address:
      <br>
      [  175.952603]  ffff8881172dae80: fb fb fb fb fb fb fb fb fc fc fc
      fc fc fc fc fc
      <br>
      [  175.959854]  ffff8881172daf00: fc fc fc fc fc fc fc fc fc fc fc
      fc fc fc fc fc
      <br>
      [  175.967101] &gt;ffff8881172daf80: fc fc fc fc fc fc fc fc fa fb
      fb fb fb fb fb fb
      <br>
      [ 175.974353] ^
      <br>
      [  175.981256]  ffff8881172db000: fb fb fb fb fb fb fb fb fb fb fb
      fb fb fb fb fb
      <br>
      [  175.988504]  ffff8881172db080: fb fb fb fb fb fb fb fb fb fb fb
      fb fb fb fb fb
      <br>
      [  175.995755]
      ==================================================================
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      Am 22.05.25 um 09:07 schrieb <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a>:
      <br>
      <blockquote type="cite">From: Shixiong Ou
        <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
        <br>
        <br>
        [WHY]
        <br>
        1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
        <br>
            DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
        <br>
            sg_table import.
        <br>
            They only need dma_buf_vmap() to access the shared buffer's
        <br>
            kernel virtual address.
        <br>
        <br>
        2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
        <br>
            trigger SWIOTLB during dmabuf import. However,
        IO_TLB_SEGSIZE
        <br>
            restricts the maximum DMA streaming mapping memory,
        resulting in
        <br>
            errors like:
        <br>
        <br>
            ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728
        bytes), total 32768 (slots), used 0 (slots)
        <br>
        <br>
        [HOW]
        <br>
        Provide a gem_prime_import implementation without sg_table
        mapping
        <br>
        to avoid issues (e.g., "swiotlb buffer is full"). Drivers that
        do not
        <br>
        require sg_table can adopt this.
        <br>
        <br>
        Signed-off-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
        <br>
        ---
        <br>
        v1-&gt;v2:
        <br>
            Patch rebase.
        <br>
        v2-&gt;v3:
        <br>
            Rename the import callback function.
        <br>
            Remove drm_gem_shmem_prime_export() and separate some codes
        <br>
            to drm_gem_prime_import_self().
        <br>
        v3-&gt;v4:
        <br>
            Separate the test from the policy.
        <br>
            Rename the macro.
        <br>
        v4-&gt;v5:
        <br>
            Rename some functions.
        <br>
        <br>
          drivers/gpu/drm/drm_gem_shmem_helper.c | 57
        ++++++++++++++++++++++++++
        <br>
          drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
        <br>
          include/drm/drm_gem_shmem_helper.h     | 15 +++++++
        <br>
          include/drm/drm_prime.h                |  3 ++
        <br>
          4 files changed, 102 insertions(+), 9 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
        b/drivers/gpu/drm/drm_gem_shmem_helper.c
        <br>
        index aa43265f4f4f..126aa79042ad 100644
        <br>
        --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
        <br>
        +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
        <br>
        @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct
        drm_device *dev,
        <br>
          }
        <br>
          EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
        <br>
          +/**
        <br>
        + * drm_gem_shmem_prime_import_no_map - Import dmabuf without
        mapping its sg_table
        <br>
        + * @dev: Device to import into
        <br>
        + * @dma_buf: dma-buf object to import
        <br>
        + *
        <br>
        + * Drivers that use the shmem helpers but also wants to import
        dmabuf without
        <br>
        + * mapping its sg_table can use this as their
        &amp;drm_driver.gem_prime_import
        <br>
        + * implementation.
        <br>
        + */
        <br>
        +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct
        drm_device *dev,
        <br>
        +                             struct dma_buf *dma_buf)
        <br>
        +{
        <br>
        +    struct dma_buf_attachment *attach;
        <br>
        +    struct drm_gem_shmem_object *shmem;
        <br>
        +    struct drm_gem_object *obj;
        <br>
        +    size_t size;
        <br>
        +    int ret;
        <br>
        +
        <br>
        +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
        <br>
        +        /*
        <br>
        +         * Importing dmabuf exported from our own gem increases
        <br>
        +         * refcount on gem itself instead of f_count of dmabuf.
        <br>
        +         */
        <br>
        +        obj = dma_buf-&gt;priv;
        <br>
        +        drm_gem_object_get(obj);
        <br>
        +        return obj;
        <br>
        +    }
        <br>
        +
        <br>
        +    attach = dma_buf_attach(dma_buf, dev-&gt;dev);
        <br>
        +    if (IS_ERR(attach))
        <br>
        +        return ERR_CAST(attach);
        <br>
        +
        <br>
        +    get_dma_buf(dma_buf);
        <br>
        +
        <br>
        +    size = PAGE_ALIGN(attach-&gt;dmabuf-&gt;size);
        <br>
        +
        <br>
        +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
        <br>
        +    if (IS_ERR(shmem)) {
        <br>
        +        ret = PTR_ERR(shmem);
        <br>
        +        goto fail_detach;
        <br>
        +    }
        <br>
        +
        <br>
        +    drm_dbg_prime(dev, "size = %zu\n", size);
        <br>
        +
        <br>
        +    shmem-&gt;base.import_attach = attach;
        <br>
        +    shmem-&gt;base.resv = dma_buf-&gt;resv;
        <br>
        +
        <br>
        +    return &amp;shmem-&gt;base;
        <br>
        +
        <br>
        +fail_detach:
        <br>
        +    dma_buf_detach(dma_buf, attach);
        <br>
        +    dma_buf_put(dma_buf);
        <br>
        +
        <br>
        +    return ERR_PTR(ret);
        <br>
        +}
        <br>
        +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
        <br>
        +
        <br>
          MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
        <br>
          MODULE_IMPORT_NS("DMA_BUF");
        <br>
          MODULE_LICENSE("GPL v2");
        <br>
        diff --git a/drivers/gpu/drm/drm_prime.c
        b/drivers/gpu/drm/drm_prime.c
        <br>
        index d828502268b8..b825b71038d6 100644
        <br>
        --- a/drivers/gpu/drm/drm_prime.c
        <br>
        +++ b/drivers/gpu/drm/drm_prime.c
        <br>
        @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct
        drm_gem_object *obj,
        <br>
          }
        <br>
          EXPORT_SYMBOL(drm_gem_prime_export);
        <br>
          +
        <br>
        +/**
        <br>
        + * drm_gem_is_prime_exported_dma_buf -
        <br>
        + * checks if the DMA-BUF was exported from a GEM object
        belonging to @dev.
        <br>
        + * @dev: drm_device to check against
        <br>
        + * @dma_buf: dma-buf object to import
        <br>
        + *
        <br>
        + * Return: true if the DMA-BUF was exported from a GEM object
        belonging
        <br>
        + * to @dev, false otherwise.
        <br>
        + */
        <br>
        +
        <br>
        +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
        <br>
        +                       struct dma_buf *dma_buf)
        <br>
        +{
        <br>
        +    struct drm_gem_object *obj = dma_buf-&gt;priv;
        <br>
        +
        <br>
        +    return (dma_buf-&gt;ops == &amp;drm_gem_prime_dmabuf_ops)
        &amp;&amp; (obj-&gt;dev == dev);
        <br>
        +}
        <br>
        +EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
        <br>
        +
        <br>
          /**
        <br>
           * drm_gem_prime_import_dev - core implementation of the
        import callback
        <br>
           * @dev: drm_device to import into
        <br>
        @@ -933,16 +953,14 @@ struct drm_gem_object
        *drm_gem_prime_import_dev(struct drm_device *dev,
        <br>
              struct drm_gem_object *obj;
        <br>
              int ret;
        <br>
          -    if (dma_buf-&gt;ops == &amp;drm_gem_prime_dmabuf_ops) {
        <br>
        +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
        <br>
        +        /*
        <br>
        +         * Importing dmabuf exported from our own gem increases
        <br>
        +         * refcount on gem itself instead of f_count of dmabuf.
        <br>
        +         */
        <br>
                  obj = dma_buf-&gt;priv;
        <br>
        -        if (obj-&gt;dev == dev) {
        <br>
        -            /*
        <br>
        -             * Importing dmabuf exported from our own gem
        increases
        <br>
        -             * refcount on gem itself instead of f_count of
        dmabuf.
        <br>
        -             */
        <br>
        -            drm_gem_object_get(obj);
        <br>
        -            return obj;
        <br>
        -        }
        <br>
        +        drm_gem_object_get(obj);
        <br>
        +        return obj;
        <br>
              }
        <br>
                if (!dev-&gt;driver-&gt;gem_prime_import_sg_table)
        <br>
        diff --git a/include/drm/drm_gem_shmem_helper.h
        b/include/drm/drm_gem_shmem_helper.h
        <br>
        index b4f993da3cae..35f7466dca84 100644
        <br>
        --- a/include/drm/drm_gem_shmem_helper.h
        <br>
        +++ b/include/drm/drm_gem_shmem_helper.h
        <br>
        @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct
        drm_device *dev,
        <br>
                              struct sg_table *sgt);
        <br>
          int drm_gem_shmem_dumb_create(struct drm_file *file, struct
        drm_device *dev,
        <br>
                            struct drm_mode_create_dumb *args);
        <br>
        +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct
        drm_device *dev,
        <br>
        +                             struct dma_buf *buf);
        <br>
            /**
        <br>
           * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
        <br>
        @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct
        drm_file *file, struct drm_device *dev,
        <br>
              .gem_prime_import_sg_table =
        drm_gem_shmem_prime_import_sg_table, \
        <br>
              .dumb_create           = drm_gem_shmem_dumb_create
        <br>
          +/**
        <br>
        + * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
        <br>
        + *                                       without mapping
        sg_table on
        <br>
        + *                                       imported buffer.
        <br>
        + *
        <br>
        + * This macro provides a shortcut for setting the shmem GEM
        operations in
        <br>
        + * the &amp;drm_driver structure for drivers that do not
        require a sg_table on
        <br>
        + * imported buffers.
        <br>
        + */
        <br>
        +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
        <br>
        +    .gem_prime_import       =
        drm_gem_shmem_prime_import_no_map, \
        <br>
        +    .dumb_create            = drm_gem_shmem_dumb_create
        <br>
        +
        <br>
          #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
        <br>
        diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
        <br>
        index fa085c44d4ca..f50f862f0d8b 100644
        <br>
        --- a/include/drm/drm_prime.h
        <br>
        +++ b/include/drm/drm_prime.h
        <br>
        @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct
        drm_gem_object *obj,
        <br>
          unsigned long drm_prime_get_contiguous_size(struct sg_table
        *sgt);
        <br>
            /* helper functions for importing */
        <br>
        +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
        <br>
        +                       struct dma_buf *dma_buf);
        <br>
        +
        <br>
          struct drm_gem_object *drm_gem_prime_import_dev(struct
        drm_device *dev,
        <br>
                                  struct dma_buf *dma_buf,
        <br>
                                  struct device *attach_dev);
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------pJl2dx57YgSjTqPQkpxr6RPU--

