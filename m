Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA71938B5B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DD410E436;
	Mon, 22 Jul 2024 08:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uv5+Vef3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3149910E434;
 Mon, 22 Jul 2024 08:38:22 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so33725265e9.2; 
 Mon, 22 Jul 2024 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721637500; x=1722242300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AyBTSemb5IYkzvLcK9KdCyhWY72hYiLvZer+OzCstPA=;
 b=Uv5+Vef3y1RtqFvG/0z/E9j8KUmOFnY0KvBmTAjjYkeG9IZmBDKO6CWv6j/Falqik/
 iNoIMhNFzdLPGt0CraiJYRAYHLJRkV0P3a2PEFXTookkyRUzeRukVHXSSOCIWYmy+yR9
 NDX0AZMzX94SMoT6IvJV+03NnOMyy0qQD7ax/K9oAhDiitAS0xm9RZNcUvbXGHx+0Dyz
 VGTE/bpCmzvUdvUt9pP/xvZ+zKySBHUxnZUII04FffA+/lXUVX5tZxiHZm8MEW6uRbXy
 c9Q3HE2grQpF+FI/EE38EL1fnGk9eUbFp/gLUyzmfqGxX15jifPaWv1y6/1NHZbMUYMh
 tmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637500; x=1722242300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AyBTSemb5IYkzvLcK9KdCyhWY72hYiLvZer+OzCstPA=;
 b=pSV22CVUc2hcHmn3LcefX079QiG6ZOlYSRUhaHI/xqg6L8Cna0GiSxHPfomYEvicNt
 33ObvwvgKX0grpxkvGRJ+046DQe72/F1xAXChpqhGLg0DSDThY/6JzRDT+ivaqYJmI4D
 6klgYKbXw8tpWeSx+nDBgUu+9qLX7kcr29Mn5+PDPBd2gAuvFWwVjHMgLzwN0JzdASbf
 PGbutSInFdnFQ1K1qYC8stO6hm5Wr87YzYjUHw62yJA85MdL03F1seabEY9APSO2kzOH
 wAdl4XUonXMNHNYFczvBoon1CbmLfOQ5hHHrRnqj+pBDlzy7041uxXL/3brTwmGOPhh5
 c5LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOJLz3avqxupMQJIBNYPIIwBygLannUbZ4qyLXMQ4XIseyXumdnY++LxNsf48ihDiJ/KhXnb0uZ6TA9040K1fw7PY3i1t1TJwOWfm4tGWa9KGMEdvyFYPLk4Vk3JbkcNP+oonoAEvagpaoaTcRuA==
X-Gm-Message-State: AOJu0Yy4NTD87HTtB2Ls6fd9mwx1ii59K4yeJt/LlMFP/RoARvP3Sk8n
 bLtCS8bWM7Cgy3aLUZEULrnvDGdDNzWZSmrfxjXnyrvGqpl5v+Re
X-Google-Smtp-Source: AGHT+IEcKiLdVlbyDswPhj6O9TLjt6DHQrRpAjrygNdU9aIkL/LKb9cXJUKUpLzHkBsG/w0xV554Uw==
X-Received: by 2002:a05:6000:2aa:b0:367:4d9d:56a1 with SMTP id
 ffacd0b85a97d-369bb2b3e3fmr5969426f8f.45.1721637499734; 
 Mon, 22 Jul 2024 01:38:19 -0700 (PDT)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368788117d5sm7839933f8f.115.2024.07.22.01.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:38:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	ltuikov89@gmail.com
Cc: Felix.Kuehling@amd.com, tursulin@igalia.com, matthew.brost@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/scheduler: remove full_recover from drm_sched_start
Date: Mon, 22 Jul 2024 10:38:16 +0200
Message-Id: <20240722083816.99685-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was basically just another one of amdgpus hacks. The parameter
allowed to restart the scheduler without turning fence signaling on
again.

That this is absolutely not a good idea should be obvious by now since
the fences will then just sit there and never signal.

While at it cleanup the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 +--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  4 +--
 drivers/gpu/drm/imagination/pvr_queue.c       |  4 +--
 drivers/gpu/drm/lima/lima_sched.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 25 ++++++-------------
 drivers/gpu/drm/v3d/v3d_sched.c               |  2 +-
 include/drm/gpu_scheduler.h                   |  2 +-
 12 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 3a3f3ce09f00..2320df51c914 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 			if (r)
 				goto out;
 		} else {
-			drm_sched_start(&ring->sched, false);
+			drm_sched_start(&ring->sched);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 861ccff78af9..c186fdb198ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			if (!amdgpu_ring_sched_ready(ring))
 				continue;
 
-			drm_sched_start(&ring->sched, true);
+			drm_sched_start(&ring->sched);
 		}
 
 		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
@@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		if (!amdgpu_ring_sched_ready(ring))
 			continue;
 
-		drm_sched_start(&ring->sched, true);
+		drm_sched_start(&ring->sched);
 	}
 
 	amdgpu_device_unset_mp1_state(adev);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index c4b04b0dee16..c53641aa146f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	drm_sched_resubmit_jobs(&gpu->sched);
 
-	drm_sched_start(&gpu->sched, true);
+	drm_sched_start(&gpu->sched);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 
 out_no_timeout:
 	/* restart scheduler after GPU is usable again */
-	drm_sched_start(&gpu->sched, true);
+	drm_sched_start(&gpu->sched);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 5ed9c98fb599..20cb46012082 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
 		}
 	}
 
-	drm_sched_start(&queue->scheduler, true);
+	drm_sched_start(&queue->scheduler);
 }
 
 /**
@@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
 	}
 	mutex_unlock(&pvr_dev->queues.lock);
 
-	drm_sched_start(sched, true);
+	drm_sched_start(sched);
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index bbf3f8feab94..1a944edb6ddc 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	lima_pm_idle(ldev);
 
 	drm_sched_resubmit_jobs(&pipe->base);
-	drm_sched_start(&pipe->base, true);
+	drm_sched_start(&pipe->base);
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index ba4139288a6d..eb6c3f9a01f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
 	else
 		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
 
-	drm_sched_start(sched, true);
+	drm_sched_start(sched);
 
 	return stat;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a61ef0af9a4e..df49d37d0e7e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 
 	/* Restart the schedulers */
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
-		drm_sched_start(&pfdev->js->queue[i].sched, true);
+		drm_sched_start(&pfdev->js->queue[i].sched);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
 	job_write(pfdev, JOB_INT_MASK,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fa0a002b1016..d47972806d50 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
 
 static void panthor_vm_start(struct panthor_vm *vm)
 {
-	drm_sched_start(&vm->sched, true);
+	drm_sched_start(&vm->sched);
 }
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 42929e147107..2e1becd87e3a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2525,7 +2525,7 @@ static void queue_start(struct panthor_queue *queue)
 	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
 		job->base.s_fence->parent = dma_fence_get(job->done_fence);
 
-	drm_sched_start(&queue->scheduler, true);
+	drm_sched_start(&queue->scheduler);
 }
 
 static void panthor_group_stop(struct panthor_group *group)
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..ab53ab486fe6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -674,13 +674,11 @@ EXPORT_SYMBOL(drm_sched_stop);
  * drm_sched_start - recover jobs after a reset
  *
  * @sched: scheduler instance
- * @full_recovery: proceed with complete sched restart
  *
  */
-void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
+void drm_sched_start(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job, *tmp;
-	int r;
 
 	/*
 	 * Locking the list is not required here as the sched thread is parked
@@ -692,24 +690,17 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 
 		atomic_add(s_job->credits, &sched->credit_count);
 
-		if (!full_recovery)
+		if (!fence) {
+			drm_sched_job_done(s_job, -ECANCELED);
 			continue;
+		}
 
-		if (fence) {
-			r = dma_fence_add_callback(fence, &s_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(s_job, fence->error);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
-		} else
-			drm_sched_job_done(s_job, -ECANCELED);
+		if (dma_fence_add_callback(fence, &s_job->cb,
+					   drm_sched_job_done_cb))
+			drm_sched_job_done(s_job, fence->error);
 	}
 
-	if (full_recovery)
-		drm_sched_start_timeout_unlocked(sched);
-
+	drm_sched_start_timeout_unlocked(sched);
 	drm_sched_wqueue_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index d193072703f3..42d4f4a2dba2 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 
 	/* Unblock schedulers and restart their jobs. */
 	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		drm_sched_start(&v3d->queue[q].sched, true);
+		drm_sched_start(&v3d->queue[q].sched);
 	}
 
 	mutex_unlock(&v3d->reset_lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..fe8edb917360 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
+void drm_sched_start(struct drm_gpu_scheduler *sched);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
-- 
2.34.1

