Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D439E7488
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103CB10F128;
	Fri,  6 Dec 2024 15:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OD/E1eax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4E010F128
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=twD6RcUCJma2TvSZdzqTPk71bypmu/rYRbzFCRgZUwM=; b=OD/E1eaxqHCMS7e8Bifry3XBX3
 7hLJ4AV8RGQOX4iAW8vtdspy8XElCgCZ9VBRvCDnDja8ZhzxG1WSuU/mWaThaah6OfXqA8ty47Pkl
 471Bc5hEiYjzAXDGrEPtkGLiJd/OCCz4Y1srIPSZzF2jMB2D4jA9WiOI8eBviytVI+Yu5cX+S0rDI
 kDdtp0fVTUvqmGfuK1XdhUfeqfwslF0OGn+Y97yAnPTDcfb2lGb7/bVagedfoTzh5DiHgMPJfkGbR
 emJImI+hrNjdOJYed5kn7pWXgnkd0BuNA38haLCgpL6MNQKrysQaqUsgTLeeuFehzAqwNtNs/hj7W
 E4fDOpRg==;
Received: from [187.36.213.55] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1tJaQP-00HSmD-KC; Fri, 06 Dec 2024 16:39:26 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
	Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/v3d: Fix miscellaneous documentation errors
Date: Fri,  6 Dec 2024 12:39:09 -0300
Message-Id: <20241206153908.62429-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This commit fixes several miscellaneous documentation errors. Mostly,
delete/update comments that are outdated or are leftovers from past code
changes. Apart from that, remove double-spaces in several comments.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c                   |  4 ----
 drivers/gpu/drm/v3d/v3d_mmu.c                  |  8 ++++----
 drivers/gpu/drm/v3d/v3d_performance_counters.h | 12 +++++-------
 drivers/gpu/drm/v3d/v3d_sched.c                | 12 ++++++------
 drivers/gpu/drm/v3d/v3d_submit.c               |  9 +++++----
 5 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 73ab7dd31b17..bb7815599435 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -13,10 +13,6 @@
  * Display engines requiring physically contiguous allocations should
  * look into Mesa's "renderonly" support (as used by the Mesa pl111
  * driver) for an example of how to integrate with V3D.
- *
- * Long term, we should support evicting pages from the MMU when under
- * memory pressure (thus the v3d_bo_get_pages() refcounting), but
- * that's not a high priority since our systems tend to not have swap.
  */
 
 #include <linux/dma-buf.h>
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 0f564fd7160c..a25d25a8ae61 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -4,7 +4,7 @@
 /**
  * DOC: Broadcom V3D MMU
  *
- * The V3D 3.x hardware (compared to VC4) now includes an MMU.  It has
+ * The V3D 3.x hardware (compared to VC4) now includes an MMU. It has
  * a single level of page tables for the V3D's 4GB address space to
  * map to AXI bus addresses, thus it could need up to 4MB of
  * physically contiguous memory to store the PTEs.
@@ -15,14 +15,14 @@
  *
  * To protect clients from each other, we should use the GMP to
  * quickly mask out (at 128kb granularity) what pages are available to
- * each client.  This is not yet implemented.
+ * each client. This is not yet implemented.
  */
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 
-/* Note: All PTEs for the 1MB superpage must be filled with the
- * superpage bit set.
+/* Note: All PTEs for the 64KB bigpage or 1MB superpage must be filled
+ * with the bigpage/superpage bit set.
  */
 #define V3D_PTE_SUPERPAGE BIT(31)
 #define V3D_PTE_BIGPAGE BIT(30)
diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h b/drivers/gpu/drm/v3d/v3d_performance_counters.h
index d919a2fc9449..2bc4cce0744a 100644
--- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
+++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
@@ -2,11 +2,12 @@
 /*
  * Copyright (C) 2024 Raspberry Pi
  */
+
 #ifndef V3D_PERFORMANCE_COUNTERS_H
 #define V3D_PERFORMANCE_COUNTERS_H
 
-/* Holds a description of a given performance counter. The index of performance
- * counter is given by the array on v3d_performance_counter.h
+/* Holds a description of a given performance counter. The index of
+ * performance counter is given by the array on `v3d_performance_counter.c`.
  */
 struct v3d_perf_counter_desc {
 	/* Category of the counter */
@@ -20,15 +21,12 @@ struct v3d_perf_counter_desc {
 };
 
 struct v3d_perfmon_info {
-	/*
-	 * Different revisions of V3D have different total number of
+	/* Different revisions of V3D have different total number of
 	 * performance counters.
 	 */
 	unsigned int max_counters;
 
-	/*
-	 * Array of counters valid for the platform.
-	 */
+	/* Array of counters valid for the platform. */
 	const struct v3d_perf_counter_desc *counters;
 };
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index a6c3760da6ed..da08ddb01d21 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -5,16 +5,16 @@
  * DOC: Broadcom V3D scheduling
  *
  * The shared DRM GPU scheduler is used to coordinate submitting jobs
- * to the hardware.  Each DRM fd (roughly a client process) gets its
- * own scheduler entity, which will process jobs in order.  The GPU
- * scheduler will round-robin between clients to submit the next job.
+ * to the hardware. Each DRM fd (roughly a client process) gets its
+ * own scheduler entity, which will process jobs in order. The GPU
+ * scheduler will schedule the clients with a FIFO scheduling algorithm.
  *
  * For simplicity, and in order to keep latency low for interactive
  * jobs when bulk background jobs are queued up, we submit a new job
  * to the HW only when it has completed the last one, instead of
- * filling up the CT[01]Q FIFOs with jobs.  Similarly, we use
- * drm_sched_job_add_dependency() to manage the dependency between bin and
- * render, instead of having the clients submit jobs using the HW's
+ * filling up the CT[01]Q FIFOs with jobs. Similarly, we use
+ * `drm_sched_job_add_dependency()` to manage the dependency between bin
+ * and render, instead of having the clients submit jobs using the HW's
  * semaphores to interlock between them.
  */
 
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 9e439c9f0a93..4ff5de46fb22 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -11,10 +11,11 @@
 #include "v3d_trace.h"
 
 /* Takes the reservation lock on all the BOs being referenced, so that
- * at queue submit time we can update the reservations.
+ * we can attach fences and update the reservations after pushing the job
+ * to the queue.
  *
  * We don't lock the RCL the tile alloc/state BOs, or overflow memory
- * (all of which are on exec->unref_list).  They're entirely private
+ * (all of which are on render->unref_list). They're entirely private
  * to v3d, so we don't attach dma-buf fences to them.
  */
 static int
@@ -55,11 +56,11 @@ v3d_lock_bo_reservations(struct v3d_job *job,
  * @bo_count: Number of GEM handles passed in
  *
  * The command validator needs to reference BOs by their index within
- * the submitted job's BO list.  This does the validation of the job's
+ * the submitted job's BO list. This does the validation of the job's
  * BO list and reference counting for the lifetime of the job.
  *
  * Note that this function doesn't need to unreference the BOs on
- * failure, because that will happen at v3d_exec_cleanup() time.
+ * failure, because that will happen at `v3d_job_free()`.
  */
 static int
 v3d_lookup_bos(struct drm_device *dev,
-- 
2.39.5 (Apple Git-154)

