Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C231604A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 08:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70176E1FB;
	Wed, 10 Feb 2021 07:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9D6E19A;
 Wed, 10 Feb 2021 07:23:31 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id l27so782271qki.9;
 Tue, 09 Feb 2021 23:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bH3CLqRvXgD6BHuxlu5Bhk4vl9wgjCKKNXoHMPR2Lcc=;
 b=Yzt5Hpj9i7PfYZhFApfZABl/PTdrcxUVYhOrJW1bgBxqcRtMdg5tsGs1k3/NwmDNay
 xMvGyGvqQuqOkKYCyVtX/rsmUsFP7A1T/eOw+fmo+2QkfZdyDA7w359qI+IX1hpAXxw3
 BUEh3a8nypugaZFPI5Oc60VT6H7DIRZqjpgbYUZ7YeVtNZXVLlj8XhFegm1aC4LzXOui
 bRjDHpwoBA/t0SXJESNeonSGBJK/UVKH++Iz6pIeAA+VvtY3Jb8IvdjeU1GipmbiDTp4
 hU9PdI1p0Nih54uRp98T5FYOw4mM2ugggHEkZ9sIW/1s5IbjmxwvOiscSw0SC5uNss6v
 8iEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bH3CLqRvXgD6BHuxlu5Bhk4vl9wgjCKKNXoHMPR2Lcc=;
 b=uD7ksrfwt7d8GKvvaqHukkeH+qnE4/NeoPt4goGznX64WU4HRdIc37/8Y7Dw8sp6J6
 P4G77xBp7o0NjLRXqZYYJASmTrxwHf/QVAkegA4xbzeOIygUNAlzZfmOneRhGSKl/kkv
 VVW+o1Hc6Gy3kY+Uwgzj60rNYoVfDfzzin/kI5ZuF34s+dAVhDqOrbEE6O72lGMR5Dyx
 Sll9pReHz5LMwnADR4oA7YQrwSwxtX6l+i72/KUFyQtPZ7lL8+2Y00gQk4PEzUdLjWEg
 FJHftmfQawl6IfS/RAIRfViqNGlkfdmyEmkJXT/NTlJn46BP8sxv4vPrznOxaJ6HXn4w
 c9Gw==
X-Gm-Message-State: AOAM530Vqmmo4r4RUSF0mDd8gfhopudtevxKigMI8zAIvbvHtkfdMxXF
 lPtKyLMmMiUbkm+0mW6d5JeWsQKJBuaC2j9EPQA=
X-Google-Smtp-Source: ABdhPJzPIkI/irmo4GENEMD8ZncH2Gf9+Gkzoe4LA/sBa7nG+9/Ob63hbDyWlyDi/aWXu1ddZO8B6hVC2WsENXa8n1M=
X-Received: by 2002:a37:d01:: with SMTP id 1mr2142832qkn.247.1612941810860;
 Tue, 09 Feb 2021 23:23:30 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Wed, 10 Feb 2021 09:22:54 +0200
Message-ID: <CAJ1xhMX6O__JbVi7izHvEcGVoBT_6h95fhsZPqQuSzVkhPugBA@mail.gmail.com>
Subject: [nouveau] WARNING: possible circular locking dependency detected in
 linux-next
To: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Wed, 10 Feb 2021 07:48:28 +0000
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Linux-Next <linux-next@vger.kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been seeing these warnings for a couple of weeks now. Any
pointers on how to address this would be much appreciated.

[   57.207457] ======================================================
[   57.207470] WARNING: possible circular locking dependency detected
[   57.207483] 5.11.0-rc7-next-20210209 #142 Tainted: G        W
[   57.207497] ------------------------------------------------------
[   57.207508] Xorg/459 is trying to acquire lock:
[   57.207521] ffff888016edc518 (&cli->mutex){+.+.}-{3:3}, at:
nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
--------------------------------------------------------
[faddr2line]
nouveau_bo_move+0x4bf/0x2ec0:
nouveau_bo_move_m2mf at
/home/sasha/linux-next/drivers/gpu/drm/nouveau/nouveau_bo.c:804
(inlined by) nouveau_bo_move at
/home/sasha/linux-next/drivers/gpu/drm/nouveau/nouveau_bo.c:1024

/home/sasha/linux-next/drivers/gpu/drm/nouveau/nouveau_bo.c:800,804
if (drm_drv_uses_atomic_modeset(drm->dev))
        mutex_lock(&cli->mutex);
else
        mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
--------------------------------------------------------
[   57.207923]
               but task is already holding lock:
[   57.207934] ffff88801f49e9a0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
nouveau_bo_pin+0xc1/0xb60 [nouveau]
--------------------------------------------------------
[faddr2line]
nouveau_bo_pin+0xc1/0xb60:
ttm_bo_reserve at /home/sasha/linux-next/./include/drm/ttm/ttm_bo_driver.h:152
(inlined by) nouveau_bo_pin at
/home/sasha/linux-next/drivers/gpu/drm/nouveau/nouveau_bo.c:424

/home/sasha/linux-next/include/drm/ttm/ttm_bo_driver.h:148,154
if (interruptible)
        ret = dma_resv_lock_interruptible(bo->base.resv, ticket);
else
        ret = dma_resv_lock(bo->base.resv, ticket);
if (ret == -EINTR)
        return -ERESTARTSYS;
return ret;
--------------------------------------------------------
[   57.208317]
               which lock already depends on the new lock.

[   57.208329]
               the existing dependency chain (in reverse order) is:
[   57.208340]
               -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   57.208373]        __ww_mutex_lock.constprop.0+0x18a/0x2d40
[   57.208395]        nouveau_bo_pin+0xc1/0xb60 [nouveau]
[   57.208753]        nouveau_channel_prep+0x2c6/0xba0 [nouveau]
[   57.209105]        nouveau_channel_new+0x127/0x2020 [nouveau]
[   57.209457]        nouveau_abi16_ioctl_channel_alloc+0x33b/0xdf0 [nouveau]
[   57.209809]        drm_ioctl_kernel+0x1cb/0x260
[   57.209826]        drm_ioctl+0x420/0x850
[   57.209841]        nouveau_drm_ioctl+0xdf/0x210 [nouveau]
[   57.210198]        __x64_sys_ioctl+0x122/0x190
[   57.210214]        do_syscall_64+0x33/0x40
[   57.210230]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   57.210247]
               -> #0 (&cli->mutex){+.+.}-{3:3}:
[   57.210280]        __lock_acquire+0x2a01/0x5ab0
[   57.210298]        lock_acquire+0x1a9/0x690
[   57.210314]        __mutex_lock+0x125/0x1140
[   57.210329]        nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
[   57.210686]        ttm_bo_handle_move_mem+0x1b6/0x570 [ttm]
[   57.210719]        ttm_bo_validate+0x316/0x420 [ttm]
[   57.210750]        nouveau_bo_pin+0x3c4/0xb60 [nouveau]
[   57.211107]        nv50_wndw_prepare_fb+0x117/0xcb0 [nouveau]
[   57.211460]        drm_atomic_helper_prepare_planes+0x1ec/0x600
[   57.211477]        nv50_disp_atomic_commit+0x189/0x530 [nouveau]
[   57.211833]        drm_atomic_helper_update_plane+0x2ac/0x380
[   57.211849]        drm_mode_cursor_universal+0x3f3/0xb40
[   57.211865]        drm_mode_cursor_common+0x27b/0x930
[   57.211880]        drm_mode_cursor_ioctl+0x95/0xd0
[   57.211895]        drm_ioctl_kernel+0x1cb/0x260
[   57.211910]        drm_ioctl+0x420/0x850
[   57.211925]        nouveau_drm_ioctl+0xdf/0x210 [nouveau]
[   57.212281]        __x64_sys_ioctl+0x122/0x190
[   57.212297]        do_syscall_64+0x33/0x40
[   57.212312]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   57.212328]
               other info that might help us debug this:

[   57.212339]  Possible unsafe locking scenario:

[   57.212350]        CPU0                    CPU1
[   57.212360]        ----                    ----
[   57.212370]   lock(reservation_ww_class_mutex);
[   57.212390]                                lock(&cli->mutex);
[   57.212410]                                lock(reservation_ww_class_mutex);
[   57.212430]   lock(&cli->mutex);
[   57.212449]
                *** DEADLOCK ***

[   57.212460] 3 locks held by Xorg/459:
[   57.212473]  #0: ffffc9000044fb38
(crtc_ww_class_acquire){+.+.}-{0:0}, at:
drm_mode_cursor_common+0x1fd/0x930
[   57.212520]  #1: ffff88800d9f2098
(crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0xdb/0x4c0
[   57.212564]  #2: ffff88801f49e9a0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
nouveau_bo_pin+0xc1/0xb60 [nouveau]
[   57.212949]
               stack backtrace:
[   57.212961] CPU: 0 PID: 459 Comm: Xorg Tainted: G        W
5.11.0-rc7-next-20210209 #142
[   57.212979] Hardware name: Gigabyte Technology Co., Ltd.
P35-S3G/P35-S3G, BIOS F4 07/10/2008
[   57.212992] Call Trace:
[   57.213007]  dump_stack+0x9a/0xcc
[   57.213029]  check_noncircular+0x25f/0x2e0
[   57.213049]  ? print_circular_bug+0x460/0x460
[   57.213075]  ? alloc_chain_hlocks+0x1e4/0x530
[   57.213095]  __lock_acquire+0x2a01/0x5ab0
[   57.213119]  ? nvkm_ioctl+0x34a/0x6d0 [nouveau]
[   57.213400]  ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
[   57.213421]  ? memcpy+0x39/0x60
[   57.213440]  ? nvif_object_mthd+0x20e/0x250 [nouveau]
[   57.213717]  lock_acquire+0x1a9/0x690
[   57.213736]  ? nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
[   57.214097]  ? lock_release+0x610/0x610
[   57.214115]  ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
[   57.214134]  ? memcpy+0x39/0x60
[   57.214152]  ? nvif_object_mthd+0x20e/0x250 [nouveau]
[   57.214431]  __mutex_lock+0x125/0x1140
[   57.214448]  ? nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
[   57.214808]  ? nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
[   57.215167]  ? ttm_bo_wait+0x88/0xc0 [ttm]
[   57.215201]  ? mutex_lock_io_nested+0xfe0/0xfe0
[   57.215220]  ? nouveau_mem_map+0x1d3/0x3b0 [nouveau]
[   57.215579]  ? nvif_vmm_put+0x140/0x140 [nouveau]
[   57.215856]  ? nouveau_gem_ioctl_info+0xb0/0xb0 [nouveau]
[   57.216220]  nouveau_bo_move+0x4bf/0x2ec0 [nouveau]
[   57.216586]  ? unmap_mapping_pages+0xca/0x240
[   57.216605]  ? spin_bug+0x100/0x100
[   57.216621]  ? do_wp_page+0xf20/0xf20
[   57.216640]  ? nouveau_bo_move_ntfy.constprop.0+0x620/0x620 [nouveau]
[   57.217000]  ? _raw_spin_unlock+0x1a/0x30
[   57.217017]  ? ttm_bo_add_move_fence.constprop.0+0x1a0/0x2a0 [ttm]
[   57.217055]  ttm_bo_handle_move_mem+0x1b6/0x570 [ttm]
[   57.217092]  ttm_bo_validate+0x316/0x420 [ttm]
[   57.217127]  ? ttm_bo_bounce_temp_buffer+0x1e0/0x1e0 [ttm]
[   57.217162]  ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
[   57.217181]  ? __mutex_unlock_slowpath+0xe2/0x610
[   57.217203]  ? nouveau_bo_placement_set+0xa6/0x420 [nouveau]
[   57.217564]  nouveau_bo_pin+0x3c4/0xb60 [nouveau]
[   57.217927]  ? nouveau_bo_sync_for_device+0x3c0/0x3c0 [nouveau]
[   57.218289]  ? find_held_lock+0x2d/0x110
[   57.218309]  nv50_wndw_prepare_fb+0x117/0xcb0 [nouveau]
[   57.218669]  ? nv50_wndw_destroy+0x200/0x200 [nouveau]
[   57.219028]  ? rcu_read_lock_sched_held+0x3a/0x70
[   57.219047]  ? module_assert_mutex_or_preempt+0x39/0x70
[   57.219065]  ? __module_address+0x30/0x310
[   57.219086]  drm_atomic_helper_prepare_planes+0x1ec/0x600
[   57.219105]  ? lockdep_init_map_type+0x2c3/0x770
[   57.219126]  nv50_disp_atomic_commit+0x189/0x530 [nouveau]
[   57.219488]  drm_atomic_helper_update_plane+0x2ac/0x380
[   57.219510]  drm_mode_cursor_universal+0x3f3/0xb40
[   57.219533]  ? setplane_internal+0x5f0/0x5f0
[   57.219557]  ? ww_mutex_lock_interruptible+0x2f/0x160
[   57.219577]  drm_mode_cursor_common+0x27b/0x930
[   57.219598]  ? lockdep_hardirqs_on_prepare+0x3e0/0x3e0
[   57.219617]  ? drm_mode_cursor_universal+0xb40/0xb40
[   57.219642]  ? find_held_lock+0x2d/0x110
[   57.219661]  ? drm_mode_setplane+0x850/0x850
[   57.219677]  drm_mode_cursor_ioctl+0x95/0xd0
[   57.219694]  ? drm_mode_setplane+0x850/0x850
[   57.219711]  ? lock_acquire+0x1a9/0x690
[   57.219732]  ? drm_is_current_master+0x65/0x120
[   57.219750]  drm_ioctl_kernel+0x1cb/0x260
[   57.219767]  ? drm_setversion+0x800/0x800
[   57.219789]  drm_ioctl+0x420/0x850
[   57.219807]  ? drm_mode_setplane+0x850/0x850
[   57.219824]  ? drm_version+0x390/0x390
[   57.219841]  ? __pm_runtime_resume+0x7a/0x100
[   57.219862]  ? do_user_addr_fault+0x25f/0xaf0
[   57.219882]  ? lockdep_hardirqs_on_prepare+0x273/0x3e0
[   57.219900]  ? _raw_spin_unlock_irqrestore+0x34/0x40
[   57.219917]  ? trace_hardirqs_on+0x32/0x120
[   57.219940]  nouveau_drm_ioctl+0xdf/0x210 [nouveau]
[   57.220301]  __x64_sys_ioctl+0x122/0x190
[   57.220321]  do_syscall_64+0x33/0x40
[   57.220338]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   57.220356] RIP: 0033:0x7f4e52905f6b
[   57.220374] Code: ff ff ff 85 c0 79 8b 49 c7 c4 ff ff ff ff 5b 5d
4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d5 ae 0c 00 f7 d8 64 89
01 48
[   57.220392] RSP: 002b:00007fff974a0258 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   57.220413] RAX: ffffffffffffffda RBX: 00007fff974a0290 RCX: 00007f4e52905f6b
[   57.220428] RDX: 00007fff974a0290 RSI: 00000000c01c64a3 RDI: 000000000000000a
[   57.220442] RBP: 00000000c01c64a3 R08: 0000000000000040 R09: 0000000000000001
[   57.220455] R10: 00007f4e52d761c0 R11: 0000000000000246 R12: 0000565035263610
[   57.220469] R13: 000000000000000a R14: 0000000000000000 R15: 0000000000000209
[  158.611112] perf: interrupt took too long (2503 > 2500), lowering
kernel.perf_event_max_sample_rate to 79000
[  319.835187] perf: interrupt took too long (3138 > 3128), lowering
kernel.perf_event_max_sample_rate to 63000
[  358.920047] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv84_xuc00f failed with error -2
[  358.920095] nouveau 0000:01:00.0: vp: unable to load firmware
nouveau/nv84_xuc00f
[  358.920107] nouveau 0000:01:00.0: vp: init failed, -2
[  358.920523] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv84_xuc103 failed with error -2
[  358.920556] nouveau 0000:01:00.0: bsp: unable to load firmware
nouveau/nv84_xuc103
[  358.920565] nouveau 0000:01:00.0: bsp: init failed, -2

Thanks.
Alexander Kapshuk
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
