Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F493CF1D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029C110E281;
	Fri, 26 Jul 2024 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mth9uDQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09A310E281;
 Fri, 26 Jul 2024 07:55:54 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52f008aa351so1427993e87.0; 
 Fri, 26 Jul 2024 00:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721980552; x=1722585352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o+t62m77acSl+UhLiMaVAO82NL7VYdVyAQkALQ1jSHI=;
 b=mth9uDQV24lLbEz5KhveJciY8DxT2cVqmWXCtGis0VbccBJ3OnADfga0aZpzfNp5jg
 AHJP7uHUK9/S1CAaCCKt3WggLaRcINwxiLFUSWFe4RTndomaNExtr8a2amY++AwI+uTh
 la7IE2TDO8/EpZccFm9La8Dw/p2E+4uLgwh6bBBccVCkVCVGdpj82m7ovunSXi+OLa2+
 6OCc3Vrd0OTS2Qa4XVmV/+yvtE0H4R65bYGMKC/ljn7XPNj0kBhrxZMaoWl5hLpvhbWa
 xEUq9RPgs/jWsW/UqsERYZFIR8UKCW7wOLmigsESKMtHFurEzb531IdNIgOkY5jT3EoN
 G5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721980552; x=1722585352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+t62m77acSl+UhLiMaVAO82NL7VYdVyAQkALQ1jSHI=;
 b=VRlHG55T8IfdaswlRw/sWoG9SpB9y8SWRIboCP4JvKcXWdEH3kXYtSo5adN/h16+Gd
 EOBck7+JDQfLOjODRQL6M9oxrUOwmd/btiCt+sDlMm5Jm1WY/G0wFgJ8ihMY1eeeP/9X
 8yNxp+G5byvIaTlNtsqvjMeIZKo8YA/f3iAcJPNglhvBoOFXlm53NnNnv5BJFxXGJefG
 7zrXuiMWPXm0V6wXu1nCfdxlmKjnzTUFjoetVHpDvntoetD0gYEbO+6/hyEG1kbJ0BYI
 4o8fePkD1vA9qideZPusCke2H50dCvDtDJ5ZLFlv2oLJK89zLOeHor+FxdlcAs8yr2VA
 cmzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFznOq7egG68beh5jD3uFPVNh6IjyxEam+oYsLnPe+ARe1ViLqN8BWTqeyJmzbN5nREv8hDBkhxy6nmBjJi5ibir9yOi1njWlNxVCjFquO
X-Gm-Message-State: AOJu0Yy5jtMKSQ98S5aTH/z1FPw95MGKjdnHDsKBEbd3TJZXoSwPX6r5
 JMdOKUtdP5q48v3HnPgS61ikz2Md5L8F19EVU5FlpQPcnPoTnXyv8mQwzk2N
X-Google-Smtp-Source: AGHT+IHKBV2sFyf4alzvsTD3SLbTg/OaM/jkBbe+sNdBwsrKLis+gzfkOJrkHnxnTDuRgAtY10FwRA==
X-Received: by 2002:a2e:9150:0:b0:2ee:8555:4742 with SMTP id
 38308e7fff4ca-2f03dba5db7mr27666411fa.27.1721980551637; 
 Fri, 26 Jul 2024 00:55:51 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1587:6200:14d5:ce65:314d:96e4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280573fd83sm65989485e9.19.2024.07.26.00.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 00:55:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: alexander.deucher@amd.com,
	jesse.zhang@amd.com,
	vitaly.prosyak@amd.com
Subject: [PATCH] drm/sched: add optional errno to drm_sched_start()
Date: Fri, 26 Jul 2024 09:55:50 +0200
Message-Id: <20240726075550.1511-1-christian.koenig@amd.com>
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

The current implementation of drm_sched_start uses a hardcoded
-ECANCELED to dispose of a job when the parent/hw fence is NULL.
This results in drm_sched_job_done being called with -ECANCELED for
each job with a NULL parent in the pending list, making it difficult
to distinguish between recovery methods, whether a queue reset or a
full GPU reset was used.

To improve this, we first try a soft recovery for timeout jobs and
use the error code -ENODATA. If soft recovery fails, we proceed with
a queue reset, where the error code remains -ENODATA for the job.
Finally, for a full GPU reset, we use error codes -ECANCELED or
-ETIME. This patch adds an error code parameter to drm_sched_start,
allowing us to differentiate between queue reset and GPU reset
failures. This enables user mode and test applications to validate
the expected correctness of the requested operation. After a
successful queue reset, the only way to continue normal operation is
to call drm_sched_job_done with the specific error code -ENODATA.

v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain
    and amdgpu_device_unlock_reset_domain to allow user mode to track
    the queue reset status and distinguish between queue reset and
    GPU reset.
v2: Christian suggested using the error codes -ENODATA for queue reset
    and -ECANCELED or -ETIME for GPU reset, returned to
    amdgpu_cs_wait_ioctl.
v3: To meet the requirements, we introduce a new function
    drm_sched_start_ex with an additional parameter to set
    dma_fence_set_error, allowing us to handle the specific error
    codes appropriately and dispose of bad jobs with the selected
    error code depending on whether it was a queue reset or GPU reset.
v4: Alex suggested using a new name, drm_sched_start_with_recovery_error,
    which more accurately describes the function's purpose.
    Additionally, it was recommended to add documentation details
    about the new method.
v5: Fixed declaration of new function drm_sched_start_with_recovery_error.(Alex)
v6 (chk): rebase on upstream changes, cleanup the commit message,
          drop the new function again and update all callers,
          apply the errno also to scheduler fences with hw fences

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
 drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
 drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
 drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
 include/drm/gpu_scheduler.h                         | 2 +-
 11 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 2320df51c914..18135d8235f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 			if (r)
 				goto out;
 		} else {
-			drm_sched_start(&ring->sched);
+			drm_sched_start(&ring->sched, 0);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c186fdb198ad..861827deb03f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			if (!amdgpu_ring_sched_ready(ring))
 				continue;
 
-			drm_sched_start(&ring->sched);
+			drm_sched_start(&ring->sched, 0);
 		}
 
 		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
@@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		if (!amdgpu_ring_sched_ready(ring))
 			continue;
 
-		drm_sched_start(&ring->sched);
+		drm_sched_start(&ring->sched, 0);
 	}
 
 	amdgpu_device_unset_mp1_state(adev);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index c53641aa146f..2c8666f8ec4a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	drm_sched_resubmit_jobs(&gpu->sched);
 
-	drm_sched_start(&gpu->sched);
+	drm_sched_start(&gpu->sched, 0);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 
 out_no_timeout:
 	/* restart scheduler after GPU is usable again */
-	drm_sched_start(&gpu->sched);
+	drm_sched_start(&gpu->sched, 0);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 20cb46012082..c4f08432882b 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
 		}
 	}
 
-	drm_sched_start(&queue->scheduler);
+	drm_sched_start(&queue->scheduler, 0);
 }
 
 /**
@@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
 	}
 	mutex_unlock(&pvr_dev->queues.lock);
 
-	drm_sched_start(sched);
+	drm_sched_start(sched, 0);
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 1a944edb6ddc..b40c90e97d7e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	lima_pm_idle(ldev);
 
 	drm_sched_resubmit_jobs(&pipe->base);
-	drm_sched_start(&pipe->base);
+	drm_sched_start(&pipe->base, 0);
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index eb6c3f9a01f5..4412f2711fb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
 	else
 		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
 
-	drm_sched_start(sched);
+	drm_sched_start(sched, 0);
 
 	return stat;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index df49d37d0e7e..d140800606bf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 
 	/* Restart the schedulers */
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
-		drm_sched_start(&pfdev->js->queue[i].sched);
+		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
 	job_write(pfdev, JOB_INT_MASK,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d47972806d50..e630cdf47f99 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
 
 static void panthor_vm_start(struct panthor_vm *vm)
 {
-	drm_sched_start(&vm->sched);
+	drm_sched_start(&vm->sched, 0);
 }
 
 /**
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..f093616fe53c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
  * drm_sched_start - recover jobs after a reset
  *
  * @sched: scheduler instance
+ * @errno: error to set on the pending fences
  *
  */
-void drm_sched_start(struct drm_gpu_scheduler *sched)
+void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 {
 	struct drm_sched_job *s_job, *tmp;
 
@@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
 		atomic_add(s_job->credits, &sched->credit_count);
 
 		if (!fence) {
-			drm_sched_job_done(s_job, -ECANCELED);
+			drm_sched_job_done(s_job, errno ?: -ECANCELED);
 			continue;
 		}
 
 		if (dma_fence_add_callback(fence, &s_job->cb,
 					   drm_sched_job_done_cb))
-			drm_sched_job_done(s_job, fence->error);
+			drm_sched_job_done(s_job, fence->error ?: errno);
 	}
 
 	drm_sched_start_timeout_unlocked(sched);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 42d4f4a2dba2..cac02284cd19 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 
 	/* Unblock schedulers and restart their jobs. */
 	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		drm_sched_start(&v3d->queue[q].sched);
+		drm_sched_start(&v3d->queue[q].sched, 0);
 	}
 
 	mutex_unlock(&v3d->reset_lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fe8edb917360..a8d19b10f9b8 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-void drm_sched_start(struct drm_gpu_scheduler *sched);
+void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
-- 
2.34.1

