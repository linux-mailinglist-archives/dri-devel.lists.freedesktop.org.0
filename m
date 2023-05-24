Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF370F42F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33810E637;
	Wed, 24 May 2023 10:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 24 May 2023 10:28:50 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D377610E5DD;
 Wed, 24 May 2023 10:28:50 +0000 (UTC)
X-UUID: 668ddbdc9f3441199eba022cbb031cdd-20230524
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:a266c3e7-407b-45c6-953e-30cc8f6499fb, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-INFO: VERSION:1.1.22, REQID:a266c3e7-407b-45c6-953e-30cc8f6499fb, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:c183e3c1-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:230524182338C2CV12RN,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 668ddbdc9f3441199eba022cbb031cdd-20230524
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 357049139; Wed, 24 May 2023 18:23:36 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/i915:fix kernel-doc trivial warnings
Date: Wed, 24 May 2023 18:23:32 +0800
Message-Id: <20230524102332.1483249-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, k2ci <kernel-bot@kylinos.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test robot reports some make warnings.

Fix those warnings:
    drivers/gpu/drm/i915/i915_gpu_error.c:2174: warning: Function parameter or member 'dump_flags' not described in 'i915_capture_error_state'
    drivers/gpu/drm/i915/i915_perf.c:5307: warning: Function parameter or member 'i915' not described in 'i915_perf_ioctl_version'
    drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'active' not described in '__i915_active_fence_init'
    drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fence' not described in '__i915_active_fence_init'
    drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fn' not described in '__i915_active_fence_init'
    drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'active' not described in 'i915_active_fence_set'
    drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'rq' not described in 'i915_active_fence_set'
    drivers/gpu/drm/i915/i915_active.h:102: warning: Function parameter or member 'active' not described in 'i915_active_fence_get'
    drivers/gpu/drm/i915/i915_active.h:122: warning: Function parameter or member 'active' not described in 'i915_active_fence_isset'
    drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'OP' not described in '__wait_for'
    drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'COND' not described in '__wait_for'
    drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'US' not described in '__wait_for'
    drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'Wmin' not described in '__wait_for'
    drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'Wmax' not described in '__wait_for'
    drivers/gpu/drm/i915/i915_scatterlist.h:164: warning: Function parameter or member 'release' not described in 'i915_refct_sgt_ops'
    drivers/gpu/drm/i915/i915_scatterlist.h:187: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_put'
    drivers/gpu/drm/i915/i915_scatterlist.h:198: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_get'
    drivers/gpu/drm/i915/i915_scatterlist.h:214: warning: Function parameter or member 'rsgt' not described in '__i915_refct_sgt_init'
    drivers/gpu/drm/i915/i915_vma_resource.h:129: warning: Function parameter or member 'wakeref' not described in 'i915_vma_resource'

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/i915/i915_active.h       | 14 +++++++-------
 drivers/gpu/drm/i915/i915_gpu_error.c    |  1 +
 drivers/gpu/drm/i915/i915_perf.c         |  1 +
 drivers/gpu/drm/i915/i915_scatterlist.h  |  9 +++++----
 drivers/gpu/drm/i915/i915_utils.h        |  6 ++++++
 drivers/gpu/drm/i915/i915_vma_resource.h |  1 +
 6 files changed, 21 insertions(+), 11 deletions(-)

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
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f020c0086fbc..dae8b7ff9725 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2162,6 +2162,7 @@ void i915_error_state_store(struct i915_gpu_coredump *error)
  * i915_capture_error_state - capture an error record for later analysis
  * @gt: intel_gt which originated the hang
  * @engine_mask: hung engines
+ * @dump_flags: flags specifying additional options for capturing the error state
  *
  *
  * Should be called when an error is detected (either a hang or an error
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 050b8ae7b8e7..2bbf359c18b3 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -5300,6 +5300,7 @@ void i915_perf_fini(struct drm_i915_private *i915)
 
 /**
  * i915_perf_ioctl_version - Version of the i915-perf subsystem
+ * @i915: i915 device instance
  *
  * This version number is used by userspace to detect available features.
  */
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index b0a1db44f895..50b379bac6fd 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -154,6 +154,7 @@ bool i915_sg_trim(struct sg_table *orig_st);
 
 /**
  * struct i915_refct_sgt_ops - Operations structure for struct i915_refct_sgt
+ * @release: Free the memory of the struct i915_refct_sgt
  */
 struct i915_refct_sgt_ops {
 	/**
@@ -167,7 +168,7 @@ struct i915_refct_sgt_ops {
  * struct i915_refct_sgt - A refcounted scatter-gather table
  * @kref: struct kref for refcounting
  * @table: struct sg_table holding the scatter-gather table itself. Note that
- * @table->sgl = NULL can be used to determine whether a scatter-gather table
+ * table->sgl = NULL can be used to determine whether a scatter-gather table
  * is present or not.
  * @size: The size in bytes of the underlying memory buffer
  * @ops: The operations structure.
@@ -181,7 +182,7 @@ struct i915_refct_sgt {
 
 /**
  * i915_refct_sgt_put - Put a refcounted sg-table
- * @rsgt the struct i915_refct_sgt to put.
+ * @rsgt: the struct i915_refct_sgt to put.
  */
 static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
 {
@@ -191,7 +192,7 @@ static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
 
 /**
  * i915_refct_sgt_get - Get a refcounted sg-table
- * @rsgt the struct i915_refct_sgt to get.
+ * @rsgt: the struct i915_refct_sgt to get.
  */
 static inline struct i915_refct_sgt *
 i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
@@ -203,7 +204,7 @@ i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
 /**
  * __i915_refct_sgt_init - Initialize a refcounted sg-list with a custom
  * operations structure
- * @rsgt The struct i915_refct_sgt to initialize.
+ * @rsgt: The struct i915_refct_sgt to initialize.
  * @size: Size in bytes of the underlying memory buffer.
  * @ops: A customized operations structure in case the refcounted sg-list
  * is embedded into another structure.
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 2c430c0c3bad..8e8d1f937e60 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -257,6 +257,12 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
  * important that we check the condition again after having timed out, since the
  * timeout could be due to preemption or similar and we've never had a chance to
  * check the condition before the timeout.
+ *
+ * @OP: operation to perform on each iteration.
+ * @COND: condition to check for.
+ * @US: timeout duration in microseconds.
+ * @Wmin: recommended minimum for usleep (in microseconds).
+ * @Wmax: maximum wait duration (in microseconds).
  */
 #define __wait_for(OP, COND, US, Wmin, Wmax) ({ \
 	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index c1864e3d0b43..6bb7d6d19216 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -49,6 +49,7 @@ struct i915_page_sizes {
  * @__subtree_last: Interval tree private member.
  * @vm: non-refcounted pointer to the vm. This is for internal use only and
  * this member is cleared after vm_resource unbind.
+ * @wakeref: wake reference for the resource.
  * @mr: The memory region of the object pointed to by the vma.
  * @ops: Pointer to the backend i915_vma_ops.
  * @private: Bind backend private info.
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
