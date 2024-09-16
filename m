Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82AF97A8D9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 23:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82DB10E3EC;
	Mon, 16 Sep 2024 21:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0IBC7vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338D910E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 21:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726522565; x=1758058565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KmgWdqwdpHBMruOUJ10ZuQMQYQvrfT0L9fTf+1OItyM=;
 b=H0IBC7vsc38VNUmZqAbIW/TzB1u4Dgc99aI/3JesGeBbUTTTPBVQbdjh
 d0+RShm9EJCH+Sxm8VkXFcbUEfHrN1A9fP5+NLrO3YgOBnlnMfhHaRS/u
 NBpjGkPptbnl9Xk0AlYy32jFyDVRHimk14TMf0oBD7CFYqYVwDkkB6PLz
 HOMZdp03UEP75Ae0N37PgBpOd2gZVX6IK5JkyFCzbn2M3hsSqsWLeCjGM
 +tpbmdskDxr4k6gKG7nk27LyiJp9cmY64Fr09LpZYCoGYhRE0B8FEaAYT
 OVkMiIOLUcpErITnt3dRUXZla4+YL/RuzJpLGri78zXIfwULM95QN1NmY Q==;
X-CSE-ConnectionGUID: aX23v3o+SNyYcvmBhm9wSA==
X-CSE-MsgGUID: nNb4MHD3Se61+2erGCxBJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25564159"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25564159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 14:36:05 -0700
X-CSE-ConnectionGUID: W/SBM0k/QZyINp7J67lJtw==
X-CSE-MsgGUID: jtuqVKfnR42KJtJt/o+nrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68659021"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 14:36:03 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2] drm/scheduler: Improve documentation
Date: Mon, 16 Sep 2024 21:05:10 +0000
Message-Id: <20240916210510.2731639-1-shuicheng.lin@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function drm_sched_entity_push_job() doesn't have return value,
remove the return value description for it.
Correct several other typo errors.

v2 (Philipp):
- more correction with related comments.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++------
 drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
 include/drm/gpu_scheduler.h              | 12 ++++++------
 include/linux/dma-resv.h                 |  6 +++---
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..ffa3e765f5db 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -51,7 +51,7 @@
  * drm_sched_entity_set_priority(). For changing the set of schedulers
  * @sched_list at runtime see drm_sched_entity_modify_sched().
  *
- * An entity is cleaned up by callind drm_sched_entity_fini(). See also
+ * An entity is cleaned up by calling drm_sched_entity_fini(). See also
  * drm_sched_entity_destroy().
  *
  * Returns 0 on success or a negative error code on failure.
@@ -370,8 +370,8 @@ static void drm_sched_entity_clear_dep(struct dma_fence *f,
 }
 
 /*
- * drm_sched_entity_clear_dep - callback to clear the entities dependency and
- * wake up scheduler
+ * drm_sched_entity_wakeup - callback to clear the entity's dependency and
+ * wake up the scheduler
  */
 static void drm_sched_entity_wakeup(struct dma_fence *f,
 				    struct dma_fence_cb *cb)
@@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
  * @entity: scheduler entity
  * @priority: scheduler priority
  *
- * Update the priority of runqueus used for the entity.
+ * Update the priority of runqueues used for the entity.
  */
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
@@ -574,8 +574,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * fence sequence number this function should be called with drm_sched_job_arm()
  * under common lock for the struct drm_sched_entity that was set up for
  * @sched_job in drm_sched_job_init().
- *
- * Returns 0 for success, negative error code otherwise.
  */
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..cadf1662bc01 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -41,7 +41,7 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
- * The jobs in a entity are always scheduled in the order that they were pushed.
+ * The jobs in an entity are always scheduled in the order in which they were pushed.
  *
  * Note that once a job was taken from the entities queue and pushed to the
  * hardware, i.e. the pending queue, the entity must not be referenced anymore
@@ -1339,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 		list_for_each_entry(s_entity, &rq->entities, list)
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
-			 * it will removed from rq in drm_sched_entity_fini
+			 * it will be removed from the rq in drm_sched_entity_fini()
 			 * eventually
 			 */
 			s_entity->stopped = true;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fe8edb917360..ef23113451e4 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -33,11 +33,11 @@
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
 /**
- * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
+ * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
  *
  * Setting this flag on a scheduler fence prevents pipelining of jobs depending
  * on this fence. In other words we always insert a full CPU round trip before
- * dependen jobs are pushed to the hw queue.
+ * dependent jobs are pushed to the hw queue.
  */
 #define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
 
@@ -71,7 +71,7 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_COUNT
 };
 
-/* Used to chose between FIFO and RR jobs scheduling */
+/* Used to choose between FIFO and RR job-scheduling */
 extern int drm_sched_policy;
 
 #define DRM_SCHED_POLICY_RR    0
@@ -198,7 +198,7 @@ struct drm_sched_entity {
 	 *
 	 * Points to the finished fence of the last scheduled job. Only written
 	 * by the scheduler thread, can be accessed locklessly from
-	 * drm_sched_job_arm() iff the queue is empty.
+	 * drm_sched_job_arm() if the queue is empty.
 	 */
 	struct dma_fence __rcu		*last_scheduled;
 
@@ -247,7 +247,7 @@ struct drm_sched_entity {
  * @sched: the scheduler to which this rq belongs to.
  * @entities: list of the entities to be scheduled.
  * @current_entity: the entity which is to be scheduled.
- * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
+ * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -321,7 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
  * @credits: the number of credits this job contributes to the scheduler
- * @work: Helper to reschdeule job kill to different context.
+ * @work: Helper to reschedule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..c5ab6fd9ebe8 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -105,10 +105,10 @@ enum dma_resv_usage {
 	 * This should be used by submissions which don't want to participate in
 	 * any implicit synchronization.
 	 *
-	 * The most common case are preemption fences, page table updates, TLB
-	 * flushes as well as explicit synced user submissions.
+	 * The most common cases are preemption fences, page table updates, TLB
+	 * flushes as well as explicitly synced user submissions.
 	 *
-	 * Explicit synced user user submissions can be promoted to
+	 * Explicitly synced user submissions can be promoted to
 	 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
 	 * dma_buf_import_sync_file() when implicit synchronization should
 	 * become necessary after initial adding of the fence.
-- 
2.25.1

