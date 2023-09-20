Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D27A822D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B138910E185;
	Wed, 20 Sep 2023 12:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9C710E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:58:14 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C2D4B75;
 Wed, 20 Sep 2023 14:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695214596;
 bh=IW7T3Hmhw5PD2Ji9iO/gJ84F73CLdNZ+VKCKWdPttok=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SpmwnSn7r04dCymj8vXOLL/zcn1pT/hmUcV4QnAh2+AGRxDfASWhHZ+QayzP06YYs
 NTT5agQ8AAiAfjnyVWwG55ahNDIXT3DJyIykE5NV9EvPuXY0vVSkTS7wKPeMcOtsCo
 VHnbfhQFzX0ICYwB54UkFjhorZGR0Sg75DV6jMVY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 20 Sep 2023 15:57:16 +0300
Subject: [PATCH 1/2] Revert "drm/tidss: Annotate dma-fence critical section
 in commit path"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-dma-fence-annotation-revert-v1-1-7ebf6f7f5bf6@ideasonboard.com>
References: <20230920-dma-fence-annotation-revert-v1-0-7ebf6f7f5bf6@ideasonboard.com>
In-Reply-To: <20230920-dma-fence-annotation-revert-v1-0-7ebf6f7f5bf6@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6043;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IW7T3Hmhw5PD2Ji9iO/gJ84F73CLdNZ+VKCKWdPttok=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlCuxirH8Wtxss+l4PKmHRWB9GMdTUTcFF93ADN
 +jTgdQUYzqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZQrsYgAKCRD6PaqMvJYe
 9edXD/9Ubku3IOaE5I0e0VSUEefvkGeX6Q2UBaZokvlsfZYhYJV/Hsehb00zES/Im/GIhWZEwWl
 FdrFAI2YAkL9dMvumEuWyK186knJB/haCGtn21OuammLxLodkkcgx/Ajh6+jri5kmsyQ7It8IDd
 RDBpHoJJbZW4jvVnJCAKH+IHuC4eiMZz1e/tfLdEyxfxVbnwrQFF5tPuBOXrke5qGxhHvZz1mVE
 nR/kwhgJ8sAy10BFbDtvyn5p60JVv9BbvVlx8ri2HhCCnU8kvdUWLHfNO0l2qxfvYuPYy6H4q07
 wuW6NOqSOdBO/Mrgh3KX69xYrLFFE72FAlXpCVHMFPn7sFIH2LKTfQQKtiDJkEIugx/8FKupC8v
 HQBS6jY76l5BOSusp5x7ELvRMICsHgJu8dzzhygwmWcVWYGps7viAK8Rwd41WNmhtw38LLTwv5k
 Uvrbtw5Oix1lh9EkJroT8+Tdp8oIwf1zpgWn/Tagy7ISggKtT2+8wq7AAUfICBjyrOHoA9mayss
 Sas+RkL9tj4NpYG1LVZOt9RgQII7po1c7qTj3LwpehSC3rW8D0DedGL24fvczRLrZJA1oP+/4+7
 GAn0cuJD0wtynfFDZNc1D4CYFiVmJvN6QRIlLrBaszt+7cF6ZQqQ/w+Ulzr1tM/qXSrhG6prooA
 y8lZ8vTvePa4Y1w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Francesco Dolcini <francesco@dolcini.it>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 4d56a4f08391857ba93465de489707b66adad114.

The DMA-fence annotations cause a lockdep warning (see below). As per
https://patchwork.freedesktop.org/patch/462170/ it sounds like the
annotations don't work correctly.

======================================================
WARNING: possible circular locking dependency detected
6.6.0-rc2+ #1 Not tainted
------------------------------------------------------
kmstest/733 is trying to acquire lock:
ffff8000819377f0 (fs_reclaim){+.+.}-{0:0}, at: __kmem_cache_alloc_node+0x58/0x2d4

but task is already holding lock:
ffff800081a06aa0 (dma_fence_map){++++}-{0:0}, at: tidss_atomic_commit_tail+0x20/0xc0 [tidss]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (dma_fence_map){++++}-{0:0}:
       __dma_fence_might_wait+0x5c/0xd0
       dma_resv_lockdep+0x1a4/0x32c
       do_one_initcall+0x84/0x2fc
       kernel_init_freeable+0x28c/0x4c4
       kernel_init+0x24/0x1dc
       ret_from_fork+0x10/0x20

-> #1 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
       fs_reclaim_acquire+0x70/0xe4
       __kmem_cache_alloc_node+0x58/0x2d4
       kmalloc_trace+0x38/0x78
       __kthread_create_worker+0x3c/0x150
       kthread_create_worker+0x64/0x8c
       workqueue_init+0x1e8/0x2f0
       kernel_init_freeable+0x11c/0x4c4
       kernel_init+0x24/0x1dc
       ret_from_fork+0x10/0x20

-> #0 (fs_reclaim){+.+.}-{0:0}:
       __lock_acquire+0x1370/0x20d8
       lock_acquire+0x1e8/0x308
       fs_reclaim_acquire+0xd0/0xe4
       __kmem_cache_alloc_node+0x58/0x2d4
       __kmalloc_node_track_caller+0x58/0xf0
       kmemdup+0x34/0x60
       regmap_bulk_write+0x64/0x2c0
       tc358768_bridge_pre_enable+0x8c/0x12d0 [tc358768]
       drm_atomic_bridge_call_pre_enable+0x68/0x80 [drm]
       drm_atomic_bridge_chain_pre_enable+0x50/0x158 [drm]
       drm_atomic_helper_commit_modeset_enables+0x164/0x264 [drm_kms_helper]
       tidss_atomic_commit_tail+0x58/0xc0 [tidss]
       commit_tail+0xa0/0x188 [drm_kms_helper]
       drm_atomic_helper_commit+0x1a8/0x1c0 [drm_kms_helper]
       drm_atomic_commit+0xa8/0xe0 [drm]
       drm_mode_atomic_ioctl+0x9ec/0xc80 [drm]
       drm_ioctl_kernel+0xc4/0x170 [drm]
       drm_ioctl+0x234/0x4b0 [drm]
       drm_compat_ioctl+0x110/0x12c [drm]
       __arm64_compat_sys_ioctl+0x128/0x150
       invoke_syscall+0x48/0x110
       el0_svc_common.constprop.0+0x40/0xe0
       do_el0_svc_compat+0x1c/0x38
       el0_svc_compat+0x48/0xb4
       el0t_32_sync_handler+0xb0/0x138
       el0t_32_sync+0x194/0x198

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> mmu_notifier_invalidate_range_start --> dma_fence_map

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(dma_fence_map);
                               lock(mmu_notifier_invalidate_range_start);
                               lock(dma_fence_map);
  lock(fs_reclaim);

 *** DEADLOCK ***

3 locks held by kmstest/733:
 #0: ffff800082e5bba0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x118/0xc80 [drm]
 #1: ffff000004224c88 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0xdc/0x1a0 [drm]
 #2: ffff800081a06aa0 (dma_fence_map){++++}-{0:0}, at: tidss_atomic_commit_tail+0x20/0xc0 [tidss]

stack backtrace:
CPU: 0 PID: 733 Comm: kmstest Not tainted 6.6.0-rc2+ #1
Hardware name: Toradex Verdin AM62 on Verdin Development Board (DT)
Call trace:
 dump_backtrace+0x98/0x118
 show_stack+0x18/0x24
 dump_stack_lvl+0x60/0xac
 dump_stack+0x18/0x24
 print_circular_bug+0x288/0x368
 check_noncircular+0x168/0x17c
 __lock_acquire+0x1370/0x20d8
 lock_acquire+0x1e8/0x308
 fs_reclaim_acquire+0xd0/0xe4
 __kmem_cache_alloc_node+0x58/0x2d4
 __kmalloc_node_track_caller+0x58/0xf0
 kmemdup+0x34/0x60
 regmap_bulk_write+0x64/0x2c0
 tc358768_bridge_pre_enable+0x8c/0x12d0 [tc358768]
 drm_atomic_bridge_call_pre_enable+0x68/0x80 [drm]
 drm_atomic_bridge_chain_pre_enable+0x50/0x158 [drm]
 drm_atomic_helper_commit_modeset_enables+0x164/0x264 [drm_kms_helper]
 tidss_atomic_commit_tail+0x58/0xc0 [tidss]
 commit_tail+0xa0/0x188 [drm_kms_helper]
 drm_atomic_helper_commit+0x1a8/0x1c0 [drm_kms_helper]
 drm_atomic_commit+0xa8/0xe0 [drm]
 drm_mode_atomic_ioctl+0x9ec/0xc80 [drm]
 drm_ioctl_kernel+0xc4/0x170 [drm]
 drm_ioctl+0x234/0x4b0 [drm]
 drm_compat_ioctl+0x110/0x12c [drm]
 __arm64_compat_sys_ioctl+0x128/0x150
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc_compat+0x1c/0x38
 el0_svc_compat+0x48/0xb4
 el0t_32_sync_handler+0xb0/0x138
 el0t_32_sync+0x194/0x198

Fixes: 4d56a4f08391 ("drm/tidss: Annotate dma-fence critical section in commit path")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index c979ad1af236..d096d8d2bc8f 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -4,8 +4,6 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/dma-fence.h>
-
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -25,7 +23,6 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *ddev = old_state->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
-	bool fence_cookie = dma_fence_begin_signalling();
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
@@ -36,7 +33,6 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
-	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(ddev, old_state);
 
 	drm_atomic_helper_cleanup_planes(ddev, old_state);

-- 
2.34.1

