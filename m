Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53341CD1713
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9652910F096;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Ea7Wr07/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4F10F08F;
 Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dlPi72EHnCWfWKew9IQlC5HjX31ENmJ0jq0ZUE2Sbho=; b=Ea7Wr07/JtIXE/ar1d79rATZE2
 DUB8p3PxDTI59RsCPCTi+qguZhtIPdPevi25EiwnLgsfkIe1UobyL4IQHiTMpLLEzXdU1HZrK4VmQ
 IqhWFtqQ3s/znljBMxJq3dYE7rs12sdK26J75ld8Yol/3EQeLvJ11aDdyCK0gP2D0ZNLbZyi6Ll4/
 7ZzfgJIepbFu056UDrRmo0YSac2MUOgJyCyxhHT4fgJiFZnfDRnxSZ7P4cdCwzSBsPaYDaMh2cKTc
 FDggCoHaY2lp2va3/9KLnbDuSb+oDZ5m9BUAFSiVAiGJ5gv+AOe9F7FgoqbhDx8iLDe8B5WkN8Ha0
 7LkYNUfw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUz-0000000AqkV-2IH5; Fri, 19 Dec 2025 18:46:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:35 -0800
Message-ID: <20251219184638.1813181-17-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/msm_fence.h:27 Incorrect use of kernel-doc
 format: * last_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:36 Incorrect use of kernel-doc
 format: * completed_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:44 Incorrect use of kernel-doc
 format: * fenceptr:
Warning: drivers/gpu/drm/msm/msm_fence.h:65 Incorrect use of kernel-doc
 format: * next_deadline_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'dev' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'name' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'context' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'index' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'fence' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'there is no
 remaining pending work */ uint32_t last_fence' not described in
 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'updated from the CPU after interrupt * from GPU */ uint32_t completed_fence' not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'fenceptr' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'spinlock' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'next_deadline'
 not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member
 'next_deadline_fence' not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'deadline_timer'
 not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'deadline_work'
 not described in 'msm_fence_context'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fence.h |   36 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 17 deletions(-)

--- linux-next-20251217.orig/drivers/gpu/drm/msm/msm_fence.h
+++ linux-next-20251217/drivers/gpu/drm/msm/msm_fence.h
@@ -16,34 +16,29 @@
  * incrementing fence seqno at the end of each submit
  */
 struct msm_fence_context {
+	/** @dev: the drm device */
 	struct drm_device *dev;
-	/** name: human readable name for fence timeline */
+	/** @name: human readable name for fence timeline */
 	char name[32];
-	/** context: see dma_fence_context_alloc() */
+	/** @context: see dma_fence_context_alloc() */
 	unsigned context;
-	/** index: similar to context, but local to msm_fence_context's */
+	/** @index: similar to context, but local to msm_fence_context's */
 	unsigned index;
-
 	/**
-	 * last_fence:
-	 *
+	 * @last_fence:
 	 * Last assigned fence, incremented each time a fence is created
 	 * on this fence context.  If last_fence == completed_fence,
 	 * there is no remaining pending work
 	 */
 	uint32_t last_fence;
-
 	/**
-	 * completed_fence:
-	 *
+	 * @completed_fence:
 	 * The last completed fence, updated from the CPU after interrupt
 	 * from GPU
 	 */
 	uint32_t completed_fence;
-
 	/**
-	 * fenceptr:
-	 *
+	 * @fenceptr:
 	 * The address that the GPU directly writes with completed fence
 	 * seqno.  This can be ahead of completed_fence.  We can peek at
 	 * this to see if a fence has already signaled but the CPU hasn't
@@ -51,6 +46,9 @@ struct msm_fence_context {
 	 */
 	volatile uint32_t *fenceptr;
 
+	/**
+	 * @spinlock: fence context spinlock
+	 */
 	spinlock_t spinlock;
 
 	/*
@@ -59,18 +57,22 @@ struct msm_fence_context {
 	 * don't queue, so maybe that is ok
 	 */
 
-	/** next_deadline: Time of next deadline */
+	/** @next_deadline: Time of next deadline */
 	ktime_t next_deadline;
-
 	/**
-	 * next_deadline_fence:
-	 *
+	 * @next_deadline_fence:
 	 * Fence value for next pending deadline.  The deadline timer is
 	 * canceled when this fence is signaled.
 	 */
 	uint32_t next_deadline_fence;
-
+	/**
+	 * @deadline_timer: tracks nearest deadline of a fence timeline and
+	 * expires just before it.
+	 */
 	struct hrtimer deadline_timer;
+	/**
+	 * @deadline_work: work to do after deadline_timer expires
+	 */
 	struct kthread_work deadline_work;
 };
 
