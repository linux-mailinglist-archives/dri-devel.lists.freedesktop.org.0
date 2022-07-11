Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D19570BB5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513559100F;
	Mon, 11 Jul 2022 20:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406A78D0C9;
 Mon, 11 Jul 2022 20:25:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A17D6160E;
 Mon, 11 Jul 2022 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D45CC341D3;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571126;
 bh=Jxu/uvV9oCS9KDXViK/ntiop714rJZi+igKdvjPNzXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pifoF61T+Bal8NF7YN6ZZ62nhfTqw0wB3uAET0boDllXPGcPMuiIblxGkcIt7MLvG
 emIIV+60PU7BW/eyajJ2KIyWyVq16IcCVWeMtWyqsTWB6LT8aArU2rCIoE+JyxQ5Zu
 6j1Mx6956nlxhc+iXqcmHSMLOAOZVvCgdcUDqijvRrLEDwGpi1oZAT1dGmWoonak82
 XtCRGS2UQQaN8zgHwIz4tdg3bH0GvrDWmptsALzu+wocgjdEnBTCYpmDLEr8Xy2K7K
 5uByZttKrHRt8rVDQp/CLJBXJOgh4NskzJcLqkQ369tLapu8deaQf+OHGXmy1jIkw1
 jnNb5wp5B2ZYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e7U-9a;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 01/32] drm/i915: fix kernel-doc trivial warnings on
 i915/*.[ch] files
Date: Mon, 11 Jul 2022 21:24:46 +0100
Message-Id: <2fa1d01382fea4f5b787b1f4f9389cf23ac9067c.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several trivial warnings there, due to trivial things:
	- lack of function name at the kerneldoc markup;
	- renamed functions;
	- wrong parameter syntax.

Fix such warnings:
	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'active' not described in '__i915_active_fence_init'
	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fence' not described in '__i915_active_fence_init'
	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fn' not described in '__i915_active_fence_init'
	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'active' not described in 'i915_active_fence_set'
	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'rq' not described in 'i915_active_fence_set'
	drivers/gpu/drm/i915/i915_active.h:102: warning: Function parameter or member 'active' not described in 'i915_active_fence_get'
	drivers/gpu/drm/i915/i915_active.h:122: warning: Function parameter or member 'active' not described in 'i915_active_fence_isset'
	drivers/gpu/drm/i915/i915_gem.c:443: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Reads data from the object referenced by handle.
	drivers/gpu/drm/i915/i915_gem.c:532: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * This is the fast pwrite path, where we copy the data directly from the
	drivers/gpu/drm/i915/i915_gem.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Writes data to the object referenced by handle.
	drivers/gpu/drm/i915/i915_gem.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Called when user space has done writes to this buffer
	drivers/gpu/drm/i915/i915_pmu.h:22: warning: cannot understand function prototype: 'enum i915_pmu_tracked_events '
	drivers/gpu/drm/i915/i915_pmu.h:33: warning: cannot understand function prototype: 'enum '
	drivers/gpu/drm/i915/i915_pmu.h:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * How many different events we track in the global PMU mask.
	drivers/gpu/drm/i915/i915_request.h:177: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Request queue structure.
	drivers/gpu/drm/i915/i915_request.h:473: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Returns true if seq1 is later than seq2.
	drivers/gpu/drm/i915/i915_scatterlist.c:63: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
	drivers/gpu/drm/i915/i915_scatterlist.h:153: warning: Incorrect use of kernel-doc format:          * release() - Free the memory of the struct i915_refct_sgt
	drivers/gpu/drm/i915/i915_scatterlist.h:157: warning: Function parameter or member 'release' not described in 'i915_refct_sgt_ops'
	drivers/gpu/drm/i915/i915_scatterlist.h:180: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_put'
	drivers/gpu/drm/i915/i915_scatterlist.h:191: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_get'
	drivers/gpu/drm/i915/i915_scatterlist.h:207: warning: Function parameter or member 'rsgt' not described in '__i915_refct_sgt_init'
	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'OP' not described in '__wait_for'
	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'COND' not described in '__wait_for'
	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'US' not described in '__wait_for'
	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmin' not described in '__wait_for'
	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmax' not described in '__wait_for'
	drivers/gpu/drm/i915/i915_vma_resource.h:88: warning: Incorrect use of kernel-doc format:          * struct i915_vma_bindinfo - Information needed for async bind
	drivers/gpu/drm/i915/i915_vma_resource.h:123: warning: Function parameter or member 'bi' not described in 'i915_vma_resource'

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_active.h       | 14 +++++++-------
 drivers/gpu/drm/i915/i915_gem.c          | 10 ++++++----
 drivers/gpu/drm/i915/i915_pmu.h          |  6 +++---
 drivers/gpu/drm/i915/i915_request.h      |  4 ++--
 drivers/gpu/drm/i915/i915_scatterlist.c  |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.h  | 10 +++++-----
 drivers/gpu/drm/i915/i915_utils.h        |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h |  2 +-
 8 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index 7eb44132183a..77c676ecc263 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -49,9 +49,9 @@ void i915_active_noop(struct dma_fence *fence, struct dma_fence_cb *cb);
 
 /**
  * __i915_active_fence_init - prepares the activity tracker for use
- * @active - the active tracker
- * @fence - initial fence to track, can be NULL
- * @func - a callback when then the tracker is retired (becomes idle),
+ * @active: the active tracker
+ * @fence: initial fence to track, can be NULL
+ * @fn: a callback when then the tracker is retired (becomes idle),
  *         can be NULL
  *
  * i915_active_fence_init() prepares the embedded @active struct for use as
@@ -77,8 +77,8 @@ __i915_active_fence_set(struct i915_active_fence *active,
 
 /**
  * i915_active_fence_set - updates the tracker to watch the current fence
- * @active - the active tracker
- * @rq - the request to watch
+ * @active: the active tracker
+ * @rq: the request to watch
  *
  * i915_active_fence_set() watches the given @rq for completion. While
  * that @rq is busy, the @active reports busy. When that @rq is signaled
@@ -89,7 +89,7 @@ i915_active_fence_set(struct i915_active_fence *active,
 		      struct i915_request *rq);
 /**
  * i915_active_fence_get - return a reference to the active fence
- * @active - the active tracker
+ * @active: the active tracker
  *
  * i915_active_fence_get() returns a reference to the active fence,
  * or NULL if the active tracker is idle. The reference is obtained under RCU,
@@ -111,7 +111,7 @@ i915_active_fence_get(struct i915_active_fence *active)
 
 /**
  * i915_active_fence_isset - report whether the active tracker is assigned
- * @active - the active tracker
+ * @active: the active tracker
  *
  * i915_active_fence_isset() returns true if the active tracker is currently
  * assigned to a fence. Due to the lazy retiring, that fence may be idle
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 702e5b89be22..f01f0896ff5c 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -439,7 +439,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Reads data from the object referenced by handle.
+ * i915_gem_pread_ioctl - Reads data from the object referenced by handle.
  * @dev: drm device pointer
  * @data: ioctl data blob
  * @file: drm file pointer
@@ -528,7 +528,8 @@ ggtt_write(struct io_mapping *mapping,
 }
 
 /**
- * This is the fast pwrite path, where we copy the data directly from the
+ * i915_gem_gtt_pwrite_fast - This is the fast pwrite path, where we copy
+ * 	the data directly from the
  * user into the GTT, uncached.
  * @obj: i915 GEM object
  * @args: pwrite arguments structure
@@ -713,7 +714,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Writes data to the object referenced by handle.
+ * i915_gem_pwrite_ioctl - Writes data to the object referenced by handle.
  * @dev: drm device
  * @data: ioctl data blob
  * @file: drm file
@@ -798,7 +799,8 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Called when user space has done writes to this buffer
+ * i915_gem_sw_finish_ioctl - Called when user space has done writes to
+ * 	this buffer
  * @dev: drm device
  * @data: ioctl data blob
  * @file: drm file
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 449057648f39..c30f43319a78 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -14,7 +14,7 @@
 
 struct drm_i915_private;
 
-/**
+/*
  * Non-engine events that we need to track enabled-disabled transition and
  * current state.
  */
@@ -25,7 +25,7 @@ enum i915_pmu_tracked_events {
 	__I915_PMU_TRACKED_EVENT_COUNT, /* count marker */
 };
 
-/**
+/*
  * Slots used from the sampling timer (non-engine events) with some extras for
  * convenience.
  */
@@ -37,7 +37,7 @@ enum {
 	__I915_NUM_PMU_SAMPLERS
 };
 
-/**
+/*
  * How many different events we track in the global PMU mask.
  *
  * It is also used to know to needed number of event reference counters.
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 47041ec68df8..66d6dee98525 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -172,7 +172,7 @@ enum {
 	I915_FENCE_FLAG_COMPOSITE,
 };
 
-/**
+/*
  * Request queue structure.
  *
  * The request queue allows us to note sequence numbers that have been emitted
@@ -468,7 +468,7 @@ i915_request_has_initial_breadcrumb(const struct i915_request *rq)
 	return test_bit(I915_FENCE_FLAG_INITIAL_BREADCRUMB, &rq->fence.flags);
 }
 
-/**
+/*
  * Returns true if seq1 is later than seq2.
  */
 static inline bool i915_seqno_passed(u32 seq1, u32 seq2)
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 159571b9bd24..1354957bc337 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -56,7 +56,7 @@ static const struct i915_refct_sgt_ops rsgt_ops = {
 /**
  * i915_refct_sgt_init - Initialize a struct i915_refct_sgt with default ops
  * @rsgt: The struct i915_refct_sgt to initialize.
- * size: The size of the underlying memory buffer.
+ * @size: The size of the underlying memory buffer.
  */
 void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
 {
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 12c6a1684081..2e112362e4f1 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -149,7 +149,7 @@ bool i915_sg_trim(struct sg_table *orig_st);
  */
 struct i915_refct_sgt_ops {
 	/**
-	 * release() - Free the memory of the struct i915_refct_sgt
+	 * @release: Free the memory of the struct i915_refct_sgt
 	 * @ref: struct kref that is embedded in the struct i915_refct_sgt
 	 */
 	void (*release)(struct kref *ref);
@@ -159,7 +159,7 @@ struct i915_refct_sgt_ops {
  * struct i915_refct_sgt - A refcounted scatter-gather table
  * @kref: struct kref for refcounting
  * @table: struct sg_table holding the scatter-gather table itself. Note that
- * @table->sgl = NULL can be used to determine whether a scatter-gather table
+ * @table->sgl == NULL can be used to determine whether a scatter-gather table
  * is present or not.
  * @size: The size in bytes of the underlying memory buffer
  * @ops: The operations structure.
@@ -173,7 +173,7 @@ struct i915_refct_sgt {
 
 /**
  * i915_refct_sgt_put - Put a refcounted sg-table
- * @rsgt the struct i915_refct_sgt to put.
+ * @rsgt: the struct i915_refct_sgt to put.
  */
 static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
 {
@@ -183,7 +183,7 @@ static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
 
 /**
  * i915_refct_sgt_get - Get a refcounted sg-table
- * @rsgt the struct i915_refct_sgt to get.
+ * @rsgt: the struct i915_refct_sgt to get.
  */
 static inline struct i915_refct_sgt *
 i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
@@ -195,7 +195,7 @@ i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
 /**
  * __i915_refct_sgt_init - Initialize a refcounted sg-list with a custom
  * operations structure
- * @rsgt The struct i915_refct_sgt to initialize.
+ * @rsgt: The struct i915_refct_sgt to initialize.
  * @size: Size in bytes of the underlying memory buffer.
  * @ops: A customized operations structure in case the refcounted sg-list
  * is embedded into another structure.
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c10d68cdc3ca..cae684c40d4f 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -256,7 +256,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
 	}
 }
 
-/**
+/*
  * __wait_for - magic wait macro
  *
  * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index 5d8427caa2ba..14a0327b2080 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -84,7 +84,7 @@ struct i915_vma_resource {
 	intel_wakeref_t wakeref;
 
 	/**
-	 * struct i915_vma_bindinfo - Information needed for async bind
+	 * @bi: Information needed for async bind
 	 * only but that can be dropped after the bind has taken place.
 	 * Consider making this a separate argument to the bind_vma
 	 * op, coalescing with other arguments like vm, stash, cache_level
-- 
2.36.1

