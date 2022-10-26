Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1260E4E7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD9410E51C;
	Wed, 26 Oct 2022 15:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BBC10E33F;
 Wed, 26 Oct 2022 15:36:00 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so21874517edc.9;
 Wed, 26 Oct 2022 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c3647PSQ+0vwPlvlNxC9ZlJ7mFZIN+KyoVoHuNp8XOg=;
 b=BGgrYVNA6coWr0IKlzXepSLnk18pQh0FdKE0cHQvEEVjd4O74y3rtNnZNx6DDzLJZa
 e7wSBQW9ZTCjnnkl0KLDlP9KwhIeneLVBAlrFg7RMhwnso/Xq/KIle2Gq6iXxUZgfEVV
 irZjsDDkGNWbMKOw/f/PT2NLmVoGFjxZjwgoecSL2B/K9V2NO6ohGk27mdmYws1oZaLJ
 WPkxeBSE+OQtdLZqwYCHtHfR+KdaWkNd49QJElORuFXE9ZrXxth0wOP/Fv+iBNldJlr+
 xLc4YL6XfLZPItmzAxXJiLPG/5DN56DhJ2rqo3sBgQtBtkJrQqdUzTxX31PtB8QMdbpA
 NN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3647PSQ+0vwPlvlNxC9ZlJ7mFZIN+KyoVoHuNp8XOg=;
 b=rXOBc5SvaXTwWdpvUzpv4gT8wMfYdvRoH9s7cXWN7DmAeoRQIguDon4//HDNMXE9QU
 6Lqt4kIEljYk5+CeTYOZf5BwwAbjGuCyLCdDkt9beRgfASnsIF1gFdXtubaiBEV0mPms
 Nb1QWg/xBv3RKvv397eTL6YOvF3y9S6tJOlJ9ydy9I4p7yNBG3IIsjM8OlDv9N146xfZ
 8fboD+fr0Lu729jRWR1hUBeexztwOKo9/SC4pZVXL4/ayxh/2mqY+rCQ2FxIF2dL3Jui
 Z82ssuzY7WIVYrgbB+4Dh0cp6FGvAclGMfJoYB6co18wmIUPDh/murD81J6P5HYAiLXI
 5Azw==
X-Gm-Message-State: ACrzQf0n970V9KRMRKLDVv5u/Y4fKeZjVzBMNJpHjiB/UT4kSVX6RWEu
 p/Hha7sOwoqIC1TbCOQE9kI=
X-Google-Smtp-Source: AMsMyM52wHXFChyQUVxiCpzsXZQduYcsYgpf42c08n61jwsEJOFl/2s2mAShLlXJTmC9/e3BXbqs/A==
X-Received: by 2002:a05:6402:4006:b0:461:f4e2:82e0 with SMTP id
 d6-20020a056402400600b00461f4e282e0mr12073319eda.68.1666798559293; 
 Wed, 26 Oct 2022 08:35:59 -0700 (PDT)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170907780300b007abafe43c3bsm3066715ejc.86.2022.10.26.08.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:35:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
Date: Wed, 26 Oct 2022 17:35:53 +0200
Message-Id: <20221026153557.63541-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e6c6338f393b74ac0b303d567bb918b44ae7ad75.

This feature basically re-submits one job after another to
figure out which one was the one causing a hang.

This is obviously incompatible with gang-submit which requires
that multiple jobs run at the same time. It's also absolutely
not helpful to crash the hardware multiple times if a clean
recovery is desired.

For testing and debugging environments we should rather disable
recovery alltogether to be able to inspect the state with a hw
debugger.

Additional to that the sw implementation is clearly buggy and causes
reference count issues for the hardware fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 103 ---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     |  58 ++----------
 include/drm/gpu_scheduler.h                |   3 -
 4 files changed, 10 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6f958603c8cc..d4584e577b51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5070,94 +5070,6 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
 	return 0;
 }
 
-static void amdgpu_device_recheck_guilty_jobs(
-	struct amdgpu_device *adev, struct list_head *device_list_handle,
-	struct amdgpu_reset_context *reset_context)
-{
-	int i, r = 0;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-		int ret = 0;
-		struct drm_sched_job *s_job;
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		s_job = list_first_entry_or_null(&ring->sched.pending_list,
-				struct drm_sched_job, list);
-		if (s_job == NULL)
-			continue;
-
-		/* clear job's guilty and depend the folowing step to decide the real one */
-		drm_sched_reset_karma(s_job);
-		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
-
-		if (!s_job->s_fence->parent) {
-			DRM_WARN("Failed to get a HW fence for job!");
-			continue;
-		}
-
-		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
-		if (ret == 0) { /* timeout */
-			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
-						ring->sched.name, s_job->id);
-
-
-			amdgpu_fence_driver_isr_toggle(adev, true);
-
-			/* Clear this failed job from fence array */
-			amdgpu_fence_driver_clear_job_fences(ring);
-
-			amdgpu_fence_driver_isr_toggle(adev, false);
-
-			/* Since the job won't signal and we go for
-			 * another resubmit drop this parent pointer
-			 */
-			dma_fence_put(s_job->s_fence->parent);
-			s_job->s_fence->parent = NULL;
-
-			/* set guilty */
-			drm_sched_increase_karma(s_job);
-			amdgpu_reset_prepare_hwcontext(adev, reset_context);
-retry:
-			/* do hw reset */
-			if (amdgpu_sriov_vf(adev)) {
-				amdgpu_virt_fini_data_exchange(adev);
-				r = amdgpu_device_reset_sriov(adev, false);
-				if (r)
-					adev->asic_reset_res = r;
-			} else {
-				clear_bit(AMDGPU_SKIP_HW_RESET,
-					  &reset_context->flags);
-				r = amdgpu_do_asic_reset(device_list_handle,
-							 reset_context);
-				if (r && r == -EAGAIN)
-					goto retry;
-			}
-
-			/*
-			 * add reset counter so that the following
-			 * resubmitted job could flush vmid
-			 */
-			atomic_inc(&adev->gpu_reset_counter);
-			continue;
-		}
-
-		/* got the hw fence, signal finished fence */
-		atomic_dec(ring->sched.score);
-		dma_fence_get(&s_job->s_fence->finished);
-		dma_fence_signal(&s_job->s_fence->finished);
-		dma_fence_put(&s_job->s_fence->finished);
-
-		/* remove node from list and free the job */
-		spin_lock(&ring->sched.job_list_lock);
-		list_del_init(&s_job->list);
-		spin_unlock(&ring->sched.job_list_lock);
-		ring->sched.ops->free_job(s_job);
-	}
-}
-
 static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
@@ -5178,7 +5090,6 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
 
 }
 
-
 /**
  * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  *
@@ -5201,7 +5112,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	int i, r = 0;
 	bool need_emergency_restart = false;
 	bool audio_suspended = false;
-	int tmp_vram_lost_counter;
 	bool gpu_reset_for_dev_remove = false;
 
 	gpu_reset_for_dev_remove =
@@ -5347,7 +5257,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		amdgpu_device_stop_pending_resets(tmp_adev);
 	}
 
-	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
 	/* Actual ASIC resets if needed.*/
 	/* Host driver will handle XGMI hive reset for SRIOV */
 	if (amdgpu_sriov_vf(adev)) {
@@ -5372,18 +5281,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	/* Post ASIC reset for all devs .*/
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
 
-		/*
-		 * Sometimes a later bad compute job can block a good gfx job as gfx
-		 * and compute ring share internal GC HW mutually. We add an additional
-		 * guilty jobs recheck step to find the real guilty job, it synchronously
-		 * submits and pends for the first job being signaled. If it gets timeout,
-		 * we identify it as a real guilty job.
-		 */
-		if (amdgpu_gpu_recovery == 2 &&
-			!(tmp_vram_lost_counter < atomic_read(&adev->vram_lost_counter)))
-			amdgpu_device_recheck_guilty_jobs(
-				tmp_adev, device_list_handle, reset_context);
-
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 16f6a313335e..f177d8e5b665 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -519,7 +519,7 @@ module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
  * DOC: gpu_recovery (int)
  * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
  */
-MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (2 = advanced tdr mode, 1 = enable, 0 = disable, -1 = auto)");
+MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
 module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
 
 /**
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e0ab14e0fb6b..bb28f31bff6f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -355,27 +355,6 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	}
 }
 
- /**
-  * drm_sched_increase_karma - Update sched_entity guilty flag
-  *
-  * @bad: The job guilty of time out
-  *
-  * Increment on every hang caused by the 'bad' job. If this exceeds the hang
-  * limit of the scheduler then the respective sched entity is marked guilty and
-  * jobs from it will not be scheduled further
-  */
-void drm_sched_increase_karma(struct drm_sched_job *bad)
-{
-	drm_sched_increase_karma_ext(bad, 1);
-}
-EXPORT_SYMBOL(drm_sched_increase_karma);
-
-void drm_sched_reset_karma(struct drm_sched_job *bad)
-{
-	drm_sched_increase_karma_ext(bad, 0);
-}
-EXPORT_SYMBOL(drm_sched_reset_karma);
-
 /**
  * drm_sched_stop - stop the scheduler
  *
@@ -516,32 +495,15 @@ EXPORT_SYMBOL(drm_sched_start);
  *
  */
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
-{
-	drm_sched_resubmit_jobs_ext(sched, INT_MAX);
-}
-EXPORT_SYMBOL(drm_sched_resubmit_jobs);
-
-/**
- * drm_sched_resubmit_jobs_ext - helper to relunch certain number of jobs from mirror ring list
- *
- * @sched: scheduler instance
- * @max: job numbers to relaunch
- *
- */
-void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 {
 	struct drm_sched_job *s_job, *tmp;
 	uint64_t guilty_context;
 	bool found_guilty = false;
 	struct dma_fence *fence;
-	int i = 0;
 
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 
-		if (i >= max)
-			break;
-
 		if (!found_guilty && atomic_read(&s_job->karma) > sched->hang_limit) {
 			found_guilty = true;
 			guilty_context = s_job->s_fence->scheduled.context;
@@ -551,7 +513,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 			dma_fence_set_error(&s_fence->finished, -ECANCELED);
 
 		fence = sched->ops->run_job(s_job);
-		i++;
 
 		if (IS_ERR_OR_NULL(fence)) {
 			if (IS_ERR(fence))
@@ -567,7 +528,7 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 		}
 	}
 }
-EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
+EXPORT_SYMBOL(drm_sched_resubmit_jobs);
 
 /**
  * drm_sched_job_init - init a scheduler job
@@ -1081,13 +1042,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_fini);
 
 /**
- * drm_sched_increase_karma_ext - Update sched_entity guilty flag
+ * drm_sched_increase_karma - Update sched_entity guilty flag
  *
  * @bad: The job guilty of time out
- * @type: type for increase/reset karma
  *
+ * Increment on every hang caused by the 'bad' job. If this exceeds the hang
+ * limit of the scheduler then the respective sched entity is marked guilty and
+ * jobs from it will not be scheduled further
  */
-void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
+void drm_sched_increase_karma(struct drm_sched_job *bad)
 {
 	int i;
 	struct drm_sched_entity *tmp;
@@ -1099,10 +1062,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
 	 * corrupt but keep in mind that kernel jobs always considered good.
 	 */
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
-		if (type == 0)
-			atomic_set(&bad->karma, 0);
-		else if (type == 1)
-			atomic_inc(&bad->karma);
+		atomic_inc(&bad->karma);
 
 		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
 		     i++) {
@@ -1113,7 +1073,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
 				if (bad->s_fence->scheduled.context ==
 				    entity->fence_context) {
 					if (entity->guilty)
-						atomic_set(entity->guilty, type);
+						atomic_set(entity->guilty, 1);
 					break;
 				}
 			}
@@ -1123,4 +1083,4 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
 		}
 	}
 }
-EXPORT_SYMBOL(drm_sched_increase_karma_ext);
+EXPORT_SYMBOL(drm_sched_increase_karma);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0fca8f38bee4..c564be29c5ae 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -488,10 +488,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
-void drm_sched_reset_karma(struct drm_sched_job *bad);
-void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
 bool drm_sched_dependency_optimized(struct dma_fence* fence,
 				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
-- 
2.25.1

