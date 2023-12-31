Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E588209D7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 06:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155A10E02B;
	Sun, 31 Dec 2023 05:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A710E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 05:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=sbB7maGQ0Pjc+3G4bBvIiBwsq0OWbX3og3kP0LcQmcI=; b=FbMBJWTrPqZ6TYlnXhNUY0iffg
 1JTkmY8htlvL1T1oRw2cAd3VWwTX55srLRdoHdu4jRByDa6nlXIstmpxGbjSp2gXhKR9kdX9PTF0f
 CHdKjqFcsWQdekYafPCINPaJTZRpS3opF+PTwD2i3gegeyWQY0XbG3w2/oO/zNXPOhZ98M6Yk2Lk6
 gelxjJ55FPmAHRwXnKxdUgjNmYTNfCLTsw684Sap69QPrDyueHp7UVa2kvszpf9AHqMdFkMNQJjDY
 YOH2EzkwxzM1qKgSETH8ZI8yGPoHGO8/gS0oucBWTIdYaXjk8wPjUCsDB6IPe7L0m/emIk4VScubq
 23MrwtMg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rJohD-0041cE-1I; Sun, 31 Dec 2023 05:49:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imagination: pvr_device.h: fix all kernel-doc warnings
Date: Sat, 30 Dec 2023 21:49:10 -0800
Message-ID: <20231231054910.31805-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct all kernel-doc notation on pvr_device.h so that there are no
kernel-doc warnings remaining.

pvr_device.h:292: warning: Excess struct member 'active' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'idle' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'work' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'old_kccb_cmds_executed' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'kccb_stall_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'ccb' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn_q' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn_obj' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'slot_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'reserved_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'waiters' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'fence_ctx' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'id' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'seqno' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'active' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'idle' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'work' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'old_kccb_cmds_executed' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'kccb_stall_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'ccb' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn_q' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn_obj' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'rtn' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'slot_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'reserved_count' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'waiters' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'fence_ctx' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'id' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'seqno' description in 'pvr_device'
pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>
---
 drivers/gpu/drm/imagination/pvr_device.h |   46 +++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff -- a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -193,13 +193,14 @@ struct pvr_device {
 	 * @queues: Queue-related fields.
 	 */
 	struct {
-		/** @active: Active queue list. */
+		/** @queues.active: Active queue list. */
 		struct list_head active;
 
-		/** @idle: Idle queue list. */
+		/** @queues.idle: Idle queue list. */
 		struct list_head idle;
 
-		/** @lock: Lock protecting access to the active/idle lists. */
+		/** @queues.lock: Lock protecting access to the active/idle
+		 *  lists. */
 		struct mutex lock;
 	} queues;
 
@@ -207,18 +208,18 @@ struct pvr_device {
 	 * @watchdog: Watchdog for communications with firmware.
 	 */
 	struct {
-		/** @work: Work item for watchdog callback. */
+		/** @watchdog.work: Work item for watchdog callback. */
 		struct delayed_work work;
 
 		/**
-		 * @old_kccb_cmds_executed: KCCB command execution count at last
-		 * watchdog poll.
+		 * @watchdog.old_kccb_cmds_executed: KCCB command execution
+		 * count at last watchdog poll.
 		 */
 		u32 old_kccb_cmds_executed;
 
 		/**
-		 * @kccb_stall_count: Number of watchdog polls KCCB has been
-		 * stalled for.
+		 * @watchdog.kccb_stall_count: Number of watchdog polls
+		 * KCCB has been stalled for.
 		 */
 		u32 kccb_stall_count;
 	} watchdog;
@@ -227,43 +228,46 @@ struct pvr_device {
 	 * @kccb: Circular buffer for communications with firmware.
 	 */
 	struct {
-		/** @ccb: Kernel CCB. */
+		/** @kccb.ccb: Kernel CCB. */
 		struct pvr_ccb ccb;
 
-		/** @rtn_q: Waitqueue for KCCB command return waiters. */
+		/** @kccb.rtn_q: Waitqueue for KCCB command return waiters. */
 		wait_queue_head_t rtn_q;
 
-		/** @rtn_obj: Object representing KCCB return slots. */
+		/** @kccb.rtn_obj: Object representing KCCB return slots. */
 		struct pvr_fw_object *rtn_obj;
 
 		/**
-		 * @rtn: Pointer to CPU mapping of KCCB return slots. Must be
-		 * accessed by READ_ONCE()/WRITE_ONCE().
+		 * @kccb.rtn: Pointer to CPU mapping of KCCB return slots.
+		 * Must be accessed by READ_ONCE()/WRITE_ONCE().
 		 */
 		u32 *rtn;
 
-		/** @slot_count: Total number of KCCB slots available. */
+		/** @kccb.slot_count: Total number of KCCB slots available. */
 		u32 slot_count;
 
-		/** @reserved_count: Number of KCCB slots reserved for future use. */
+		/** @kccb.reserved_count: Number of KCCB slots reserved for
+		 *  future use. */
 		u32 reserved_count;
 
 		/**
-		 * @waiters: List of KCCB slot waiters.
+		 * @kccb.waiters: List of KCCB slot waiters.
 		 */
 		struct list_head waiters;
 
-		/** @fence_ctx: KCCB fence context. */
+		/** @kccb.fence_ctx: KCCB fence context. */
 		struct {
-			/** @id: KCCB fence context ID allocated with dma_fence_context_alloc(). */
+			/** @kccb.fence_ctx.id: KCCB fence context ID
+			 *  allocated with dma_fence_context_alloc(). */
 			u64 id;
 
-			/** @seqno: Sequence number incremented each time a fence is created. */
+			/** @kccb.fence_ctx.seqno: Sequence number incremented
+			 *  each time a fence is created. */
 			atomic_t seqno;
 
 			/**
-			 * @lock: Lock used to synchronize access to fences allocated by this
-			 * context.
+			 * @kccb.fence_ctx.lock: Lock used to synchronize
+			 * access to fences allocated by this context.
 			 */
 			spinlock_t lock;
 		} fence_ctx;
