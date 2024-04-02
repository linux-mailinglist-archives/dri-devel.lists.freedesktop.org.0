Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E3895EF7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 23:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684AD112090;
	Tue,  2 Apr 2024 21:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85ACA112090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 21:54:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73ECA1042;
 Tue,  2 Apr 2024 14:55:06 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37C083F7B4;
 Tue,  2 Apr 2024 14:54:34 -0700 (PDT)
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>
Subject: [PATCH 2/2] drm/panthor: Fix some kerneldoc warnings
Date: Tue,  2 Apr 2024 22:54:23 +0100
Message-ID: <20240402215423.360341-2-liviu.dudau@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402215423.360341-1-liviu.dudau@arm.com>
References: <20240402215423.360341-1-liviu.dudau@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When compiling with W=1 the build process will flag empty comments,
misnamed documented variables and incorrect tagging of functions.
Fix them in one go.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e5a710f190d2a8..a787f2fea33e98 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -517,7 +517,7 @@ struct panthor_group {
 	/** @max_compute_cores: Maximum number of shader cores used for compute jobs. */
 	u8 max_compute_cores;
 
-	/** @max_compute_cores: Maximum number of shader cores used for fragment jobs. */
+	/** @max_fragment_cores: Maximum number of shader cores used for fragment jobs. */
 	u8 max_fragment_cores;
 
 	/** @max_tiler_cores: Maximum number of tiler cores used for tiler jobs. */
@@ -993,7 +993,7 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 }
 
 /**
- * @cs_slot_reset_locked() - Reset a queue slot
+ * cs_slot_reset_locked() - Reset a queue slot
  * @ptdev: Device.
  * @csg_id: Group slot.
  * @cs_id: Queue slot.
@@ -1591,7 +1591,7 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
 }
 
 /**
- * panthor_sched_process_global_irq() - Process the scheduling part of a global IRQ
+ * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
  * @ptdev: Device.
  */
 static void sched_process_global_irq_locked(struct panthor_device *ptdev)
@@ -1660,8 +1660,6 @@ static const struct dma_fence_ops panthor_queue_fence_ops = {
 	.get_timeline_name = queue_fence_get_timeline_name,
 };
 
-/**
- */
 struct panthor_csg_slots_upd_ctx {
 	u32 update_mask;
 	u32 timedout_mask;
-- 
2.44.0

