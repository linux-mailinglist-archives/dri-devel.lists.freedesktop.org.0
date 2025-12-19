Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD0CD171C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BFB10F086;
	Fri, 19 Dec 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="T95j2VSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292510F07E;
 Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=STIo9H2/VjPqz6jqALPYI8whpqDYcsvYugZnqQ9trXY=; b=T95j2VSJFRDWLpUM/CcjN0BiTU
 fU969KoN/l7A8x080o+dOfd7bc2X++Xp2q00IUq7g2Lzh8chyiAoL91WaYQpyX32/BWBSn11U0Mx1
 g14A+4uHeJgX6d3IH8DpEfY8HeKBrvHudNn+VzETT8dysv7g7Xrm/GHKcpYbRyN/r96WdZBo3aWbz
 clj8ZRwX/NfB8YiPL10eVvsRiuY9hy4LbRDmONsQJa91J7XbrM3JNTnU5e9VVJM6QwJwiNEpXPkal
 u/sRpn1jdVGAhmJJz+3fZtOABkRKX9mDaOiMjEcauYsq3lGjwlC96baINHGxnEP+mE0R0BuC9sx1w
 BHeK1Pqw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfV0-0000000AqkV-0dst; Fri, 19 Dec 2025 18:46:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:37 -0800
Message-ID: <20251219184638.1813181-19-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/msm_gpu.h:119 Incorrect use of kernel-doc
 format: * devfreq: devfreq instance
Warning: drivers/gpu/drm/msm/msm_gpu.h:125 Incorrect use of kernel-doc
 format: * idle_freq:
Warning: drivers/gpu/drm/msm/msm_gpu.h:136 Incorrect use of kernel-doc
 format: * boost_constraint:
Warning: drivers/gpu/drm/msm/msm_gpu.h:144 Incorrect use of kernel-doc
 format: * busy_cycles: Last busy counter value, for calculating elapsed
 busy
Warning: drivers/gpu/drm/msm/msm_gpu.h:156 Incorrect use of kernel-doc
 format: * idle_work:
Warning: drivers/gpu/drm/msm/msm_gpu.h:163 Incorrect use of kernel-doc
 format: * boost_work:
Warning: drivers/gpu/drm/msm/msm_gpu.h:170 struct member 'devfreq' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:170 struct member 'boost_freq' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'devfreq' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'lock' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'governor' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'we are
 continuing to sample busyness and * adjust frequency while the GPU is
 idle' not described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'boost_freq' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'busy_cycles'
 not described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'time' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'idle_time' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'idle_work' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'boost_work' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:172 struct member 'suspended' not
 described in 'msm_gpu_devfreq'
Warning: drivers/gpu/drm/msm/msm_gpu.h:472 No description found for
 return value of 'msm_context_is_vmbind'
Warning: drivers/gpu/drm/msm/msm_gpu.h:476 struct member 'ref' not
 described in 'msm_context'
Warning: drivers/gpu/drm/msm/msm_gpu.h:476 struct member 'elapsed_ns' not
 described in 'msm_context'
Warning: drivers/gpu/drm/msm/msm_gpu.h:492 expecting prototype for
 msm_context_is_vm_bind(). Prototype was for msm_context_is_vmbind()
 instead
Warning: drivers/gpu/drm/msm/msm_gpu.h:523 No description found for
 return value of 'msm_gpu_convert_priority'
Warning: drivers/gpu/drm/msm/msm_gpu.h:583 expecting prototype for
 struct msm_gpu_submitqueues. Prototype was for struct msm_gpu_submitqueue
 instead

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
 drivers/gpu/drm/msm/msm_gpu.h |   68 ++++++++------------------------
 1 file changed, 18 insertions(+), 50 deletions(-)

--- linux-next-20251217.orig/drivers/gpu/drm/msm/msm_gpu.h
+++ linux-next-20251217/drivers/gpu/drm/msm/msm_gpu.h
@@ -116,15 +116,12 @@ struct msm_gpu_fault_info {
  * struct msm_gpu_devfreq - devfreq related state
  */
 struct msm_gpu_devfreq {
-	/** devfreq: devfreq instance */
+	/** @devfreq: devfreq instance */
 	struct devfreq *devfreq;
-
-	/** lock: lock for "suspended", "busy_cycles", and "time" */
+	/** @lock: lock for "suspended", "busy_cycles", and "time" */
 	struct mutex lock;
-
 	/**
-	 * idle_freq:
-	 *
+	 * @idle_freq:
 	 * Shadow frequency used while the GPU is idle.  From the PoV of
 	 * the devfreq governor, we are continuing to sample busyness and
 	 * adjust frequency while the GPU is idle, but we use this shadow
@@ -132,43 +129,34 @@ struct msm_gpu_devfreq {
 	 * it is inactive.
 	 */
 	unsigned long idle_freq;
-
 	/**
-	 * boost_constraint:
-	 *
+	 * @boost_freq:
 	 * A PM QoS constraint to boost min freq for a period of time
 	 * until the boost expires.
 	 */
 	struct dev_pm_qos_request boost_freq;
-
 	/**
-	 * busy_cycles: Last busy counter value, for calculating elapsed busy
+	 * @busy_cycles: Last busy counter value, for calculating elapsed busy
 	 * cycles since last sampling period.
 	 */
 	u64 busy_cycles;
-
-	/** time: Time of last sampling period. */
+	/** @time: Time of last sampling period.  */
 	ktime_t time;
-
-	/** idle_time: Time of last transition to idle: */
+	/** @idle_time: Time of last transition to idle.  */
 	ktime_t idle_time;
-
 	/**
-	 * idle_work:
-	 *
+	 * @idle_work:
 	 * Used to delay clamping to idle freq on active->idle transition.
 	 */
 	struct msm_hrtimer_work idle_work;
-
 	/**
-	 * boost_work:
-	 *
+	 * @boost_work:
 	 * Used to reset the boost_constraint after the boost period has
 	 * elapsed
 	 */
 	struct msm_hrtimer_work boost_work;
 
-	/** suspended: tracks if we're suspended */
+	/** @suspended: tracks if we're suspended */
 	bool suspended;
 };
 
@@ -358,57 +346,43 @@ struct msm_gpu_perfcntr {
 struct msm_context {
 	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
-
 	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
-
 	/**
 	 * @queueid:
-	 *
 	 * Counter incremented each time a submitqueue is created, used to
 	 * assign &msm_gpu_submitqueue.id
 	 */
 	int queueid;
-
 	/**
 	 * @closed: The device file associated with this context has been closed.
-	 *
 	 * Once the device is closed, any submits that have not been written
 	 * to the ring buffer are no-op'd.
 	 */
 	bool closed;
-
 	/**
 	 * @userspace_managed_vm:
-	 *
 	 * Has userspace opted-in to userspace managed VM (ie. VM_BIND) via
 	 * MSM_PARAM_EN_VM_BIND?
 	 */
 	bool userspace_managed_vm;
-
 	/**
 	 * @vm:
-	 *
 	 * The per-process GPU address-space.  Do not access directly, use
 	 * msm_context_vm().
 	 */
 	struct drm_gpuvm *vm;
-
-	/** @kref: the reference count */
+	/** @ref: the reference count */
 	struct kref ref;
-
 	/**
 	 * @seqno:
-	 *
 	 * A unique per-process sequence number.  Used to detect context
 	 * switches, without relying on keeping a, potentially dangling,
 	 * pointer to the previous context.
 	 */
 	int seqno;
-
 	/**
 	 * @sysprof:
-	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
 	 * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
@@ -423,40 +397,32 @@ struct msm_context {
 	 * file is closed.
 	 */
 	int sysprof;
-
 	/**
 	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
-
 	/**
 	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
-
 	/**
-	 * @elapsed:
-	 *
+	 * @elapsed_ns:
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
 	 */
 	uint64_t elapsed_ns;
-
 	/**
 	 * @cycles:
-	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
 	 */
 	uint64_t cycles;
-
 	/**
 	 * @entities:
-	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
 	 * make assumptions about rendering from multiple gl contexts
@@ -466,10 +432,8 @@ struct msm_context {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
-
 	/**
 	 * @ctx_mem:
-	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
 	 */
@@ -479,7 +443,7 @@ struct msm_context {
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
 
 /**
- * msm_context_is_vm_bind() - has userspace opted in to VM_BIND?
+ * msm_context_is_vmbind() - has userspace opted in to VM_BIND?
  *
  * @ctx: the drm_file context
  *
@@ -487,6 +451,8 @@ struct drm_gpuvm *msm_context_vm(struct
  * do sparse binding including having multiple, potentially partial,
  * mappings in the VM.  Therefore certain legacy uabi (ie. GET_IOVA,
  * SET_IOVA) are rejected because they don't have a sensible meaning.
+ *
+ * Returns: %true if userspace is managing the VM, %false otherwise.
  */
 static inline bool
 msm_context_is_vmbind(struct msm_context *ctx)
@@ -518,6 +484,8 @@ msm_context_is_vmbind(struct msm_context
  * This allows generations without preemption (nr_rings==1) to have some
  * amount of prioritization, and provides more priority levels for gens
  * that do have preemption.
+ *
+ * Returns: %0 on success, %-errno on error.
  */
 static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
 		unsigned *ring_nr, enum drm_sched_priority *sched_prio)
@@ -541,7 +509,7 @@ static inline int msm_gpu_convert_priori
 }
 
 /**
- * struct msm_gpu_submitqueues - Userspace created context.
+ * struct msm_gpu_submitqueue - Userspace created context.
  *
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
