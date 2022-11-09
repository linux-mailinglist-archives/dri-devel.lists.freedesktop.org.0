Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3F62277E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C55810E12B;
	Wed,  9 Nov 2022 09:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E208910E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:50:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l11so26382181edb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDbzL71qJGKEEWxhHhjVdFL1vfQxk8fIaF9WfWTQzrc=;
 b=pGS3SYmk3psyYPHIkNGOOz0PyD8tZnh8P1rg9rKQB/Pl+1DPjjC9gQrT7znnxVYjAx
 3ELIzNt2mrWpxM3BA0gdPuGNKXhPXi+a2Df2R7E4/QAySlImveUEq3oRfBW6b2eueU2Q
 aCgFhXMG6XkV9JId0b0dcZnatQ66G9ai3W122cR6WAWnVwupYQtUXYKmwj398xiI1LAW
 bYFPdgnVWAfsUWWeeqBIZPQAji8emBrkKafPbdBpCyxVtWvTVmFuHWFSGPPKlwWPhm7x
 xkZY5CmI298LYxKL0i5Pw5QpHxR00kVIKwX5J4zZbufkUxYoqlOT/VYucb+/mF2H/Xc+
 OitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDbzL71qJGKEEWxhHhjVdFL1vfQxk8fIaF9WfWTQzrc=;
 b=QSgOLQYDd3L24ASFpw2cXk7BuDzzanUIhNu97f4IvyGH5XtZYLoT36WQ36qD5U/hQf
 7/kfYnlp6e+zXJwNTI8CIJkggQaOYMEtdi7VrJ/HzKIRwczACJU9A+PKa9hKvKFr7h52
 aSiCqygjUQYyHOUEipRbpS00gxIlhYOaWZUK7uI+KIRjuC8wFSXIEHsDohnr05vXebrz
 oeW8mwpGXMw00+mMVVjBiUFK1tJd4bkFUgAZiI5453nNhfz6uMrtoaQmOeZk+Xr+M+47
 IDHIXpCoROcp165dAf2zddb6kzfeWPFCMt7tZT7gH9Wbb9zfI5biX8EQxevPfIW0IsMt
 4VtA==
X-Gm-Message-State: ACrzQf0rH7lOgJwcAr0jT9RQHLzViLwK91XvycVt29E7ZA3v+hbr7SL+
 hDNRaBvw2ZYC1Kl4E3ZbTIgwwPTm7zY=
X-Google-Smtp-Source: AMsMyM4OmcnJ8Fa9WX2WRakTnwvferlD8GphTEUaaWfbcbrxjzgERyDG2XH9lkyWDWFm5lW7+nmR5w==
X-Received: by 2002:a05:6402:1767:b0:461:f1c6:1f22 with SMTP id
 da7-20020a056402176700b00461f1c61f22mr1126435edb.95.1667987412901; 
 Wed, 09 Nov 2022 01:50:12 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709062ecc00b00780f24b797dsm5604543eji.108.2022.11.09.01.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:50:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Subject: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
Date: Wed,  9 Nov 2022 10:50:06 +0100
Message-Id: <20221109095010.141189-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
index 5b9f992e4607..0da55fd97df8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5077,94 +5077,6 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
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
@@ -5185,7 +5097,6 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
 
 }
 
-
 /**
  * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  *
@@ -5208,7 +5119,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	int i, r = 0;
 	bool need_emergency_restart = false;
 	bool audio_suspended = false;
-	int tmp_vram_lost_counter;
 	bool gpu_reset_for_dev_remove = false;
 
 	gpu_reset_for_dev_remove =
@@ -5354,7 +5264,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		amdgpu_device_stop_pending_resets(tmp_adev);
 	}
 
-	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
 	/* Actual ASIC resets if needed.*/
 	/* Host driver will handle XGMI hive reset for SRIOV */
 	if (amdgpu_sriov_vf(adev)) {
@@ -5379,18 +5288,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
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
index 8e97e95aca8c..a6820603214f 100644
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
index 68317d3a7a27..e77e1fd16732 100644
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
@@ -1082,13 +1043,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
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
@@ -1100,10 +1063,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
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
@@ -1114,7 +1074,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
 				if (bad->s_fence->scheduled.context ==
 				    entity->fence_context) {
 					if (entity->guilty)
-						atomic_set(entity->guilty, type);
+						atomic_set(entity->guilty, 1);
 					break;
 				}
 			}
@@ -1124,4 +1084,4 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
 		}
 	}
 }
-EXPORT_SYMBOL(drm_sched_increase_karma_ext);
+EXPORT_SYMBOL(drm_sched_increase_karma);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 289a33e80639..156601fd7053 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -497,10 +497,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
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
2.34.1

