Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E507DF0B1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723310E849;
	Thu,  2 Nov 2023 10:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BE810E849
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922562; x=1730458562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NUzxew57wNd+hLL9HdPmB1juu7NDB/Z3GEr626pDUPE=;
 b=CcnpyLXGPCVIoxc9fEW7d4Rz+kuUvxcu8jDoHX0+0eeXAIoDy1Ms327L
 tuAKQ75hYdNfEeMZ+WtFGS/B2m2KIK0J1CnWK0/wHqk815RbKukkplTfB
 D+L1J52fNJJw6xdWD4X2AlaxCv/FxBWG2K6Dz/DArHJ3enCwPnxdOLNci
 +ZMuI3o41jKMlQ9fA8rPjneEgUGCQRWKtpm1/EotNREqgT8s5abssxjcq
 mIawhbTAGN+DN2qp6SfZDpUF3h3AdA2fmmLLlNHXpFP5p/hqEb4oQ5IB+
 BSfoVrI6k/nfUQFlfgPSIwMvBIU4KAWlbaZxTs2hdLJc+22QQ3rMRD9GA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988670"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875946"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875946"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:45 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/sched: Rename drm_sched_get_cleanup_job to be more
 descriptive
Date: Thu,  2 Nov 2023 10:55:34 +0000
Message-Id: <20231102105538.391648-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"Get cleanup job" makes it sound like helper is returning a job which will
execute some cleanup, or something, while the kerneldoc itself accurately
says "fetch the next _finished_ job". So lets rename the helper to be self
documenting.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 98b2ad54fc70..fb64b35451f5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -448,7 +448,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
-	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
@@ -500,9 +500,9 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
+	 * drm_sched_get_finished_job cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
+	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
 	 * now until the scheduler thread is unparked.
 	 */
 	if (bad && bad->sched == sched)
@@ -960,7 +960,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
+ * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
  *
@@ -968,7 +968,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1059,14 +1059,14 @@ static void drm_sched_free_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
-	struct drm_sched_job *cleanup_job;
+	struct drm_sched_job *job;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	cleanup_job = drm_sched_get_cleanup_job(sched);
-	if (cleanup_job) {
-		sched->ops->free_job(cleanup_job);
+	job = drm_sched_get_finished_job(sched);
+	if (job) {
+		sched->ops->free_job(job);
 
 		drm_sched_free_job_queue_if_done(sched);
 		drm_sched_run_job_queue_if_ready(sched);
-- 
2.39.2

