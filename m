Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5FABC61C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E37710E475;
	Mon, 19 May 2025 17:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N/upGyl6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E0010E4FF;
 Mon, 19 May 2025 17:54:23 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b1fde81de05so3034577a12.1; 
 Mon, 19 May 2025 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677263; x=1748282063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MECHGtnXB65b4MXNo29O0yS4gkyeIySNFhpqKFVb7PA=;
 b=N/upGyl6sRHYSe8hZGCd+6m/KoFCq6o1PPrejFxHRKVavP2PY+43JrYBdcDHVyE6EK
 3NsGgBHMAVVN9z4SD2QG4Cj3FOhHZ5cIALzIympW4a8Y5flOI2uu6h0OyvYCpw2cH2QE
 SbeLahdJCi8IUkc+RPpWh2bA/qmXPYkvUzz5D2xb9eIecAa5BHHA5rKKM0w9bMnc8K8U
 Q4om7MI7EDqAbSFwwzDhYqSpEL214Hq+uvaImeb0hDwuGOFTNDHoeyEz5+uL/E6OXS56
 c40UaP5+farDg4/APKxrYh9mOJCL7FTJmrlIlDZMDT3spNBf6dl+FknA4zgkqnKJcfGc
 xA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677263; x=1748282063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MECHGtnXB65b4MXNo29O0yS4gkyeIySNFhpqKFVb7PA=;
 b=wadpNehIf7hWkwUHWRAI525+wH93p4VLIovQu2mAjB7CRTLTqQHToBzVGW3NFI831Q
 n2fI5F7tlILTmE49yEkK9DMcPMsZjnR/J+Al7g6tXBsNJsqBrfb3pLkW7/VR6BGDgJgG
 EqhZ2YM6xqbZcJJ46YOe0onTKkJBs2oTsDekypHV8pd4XR4miQkEi6szYIVFywYKZlIp
 9Hx4Cz1CkBh0ulzEWYM9B/RKJEzlShoj0b+vvpZkpjxEWdTdm1zqOJJ/f3uKPoNHwCYT
 qZX9+Z62dh3AFVmb4lJRW1GQwFN53kXTCzC6Bj5Ak8J5fVCZHwkOwdQGCTbI5sXoBLOS
 qUDw==
X-Gm-Message-State: AOJu0Yz5CxQDZYIucFb4zSgepiccYMoNYDaCDvnGXcDi7zmgYnCMsD3+
 RYN4AkSVqd9eGdipTfKlYeAVnxN8lDj4w07Jr0ZzKyM55P8qz/wFw7Wxas5j0A==
X-Gm-Gg: ASbGncsOIY5ioQPxP2o++/ot9IXFWvKdSfuCZqoHWPA3NKKM4xg5KIIon9mKfU5zLIh
 +/igNBBYqex622lnr9BQyGVUsv+UT82xNmenVep+2t9TOr+EWV0+jt/5GNQLsCIhEZlR/7cu+Je
 L6hnFBwtNhErRhdRDorMrOurVNxaHbpqBguCI8aWHkIiU2azn6yZC24fsM95jSqG1Ht8CBnrAvP
 qwQ5RL2dEp4PXqyqH9XkNPJfYT2PxEmW/hAxZex98Alfmf/2X2pLOrsnQWrLI9boxGKiqybpfP2
 ePDgJTJhWNvTAlBAyJkzi16jaEePi8Y/YOpbMGribL89y6UjyIMTw1nIYAUlg13iAnOhl79upEB
 ingBGGGLcpkYiIjp1NfV6xEwUEg==
X-Google-Smtp-Source: AGHT+IETEAy4l4Rs9OrAnwlLbsxGPdmd9hMmk8n/Oel19Ttvhga9l+j0mfP1uF4WLnTD1Aj7/dl/7g==
X-Received: by 2002:a17:902:ce87:b0:223:653e:eb09 with SMTP id
 d9443c01a7336-231d438a294mr182291145ad.7.1747677262603; 
 Mon, 19 May 2025 10:54:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebad26sm62936415ad.198.2025.05.19.10.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Philipp Stanner <phasta@mailbox.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 04/40] drm/sched: Add enqueue credit limit
Date: Mon, 19 May 2025 10:51:27 -0700
Message-ID: <20250519175348.11924-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Similar to the existing credit limit mechanism, but applying to jobs
enqueued to the scheduler but not yet run.

The use case is to put an upper bound on preallocated, and potentially
unneeded, pgtable pages.  When this limit is exceeded, pushing new jobs
will block until the count drops below the limit.

Cc: Philipp Stanner <phasta@mailbox.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
 include/drm/gpu_scheduler.h              | 24 +++++++++++++++++++++++-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bd39db7bb240..8e6b12563348 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -579,12 +579,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * fence sequence number this function should be called with drm_sched_job_arm()
  * under common lock for the struct drm_sched_entity that was set up for
  * @sched_job in drm_sched_job_init().
+ *
+ * If enqueue_credit_limit is used, this can return -ERESTARTSYS if the system
+ * call is interrupted.
  */
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
+	struct drm_gpu_scheduler *sched = sched_job->sched;
 	bool first;
 	ktime_t submit_ts;
+	int ret;
+
+	ret = wait_event_interruptible(
+			sched->job_scheduled,
+			atomic_read(&sched->enqueue_credit_count) <=
+			sched->enqueue_credit_limit);
+	if (ret)
+		return ret;
+	atomic_add(sched_job->enqueue_credits, &sched->enqueue_credit_count);
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
@@ -609,7 +622,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
+			return -EINVAL;
 		}
 
 		rq = entity->rq;
@@ -626,5 +639,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		drm_sched_wakeup(sched);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cda1216adfa4..5f812253656a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1221,6 +1221,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	trace_drm_run_job(sched_job, entity);
 	fence = sched->ops->run_job(sched_job);
+	atomic_sub(sched_job->enqueue_credits, &sched->enqueue_credit_count);
 	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
 
@@ -1257,6 +1258,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
+	sched->enqueue_credit_limit = args->enqueue_credit_limit;
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
@@ -1312,6 +1314,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->credit_count, 0);
+	atomic_set(&sched->enqueue_credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index da64232c989d..8ec5000f81e1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -366,6 +366,19 @@ struct drm_sched_job {
 
 	enum drm_sched_priority		s_priority;
 	u32				credits;
+	/**
+	 * @enqueue_credits: the number of enqueue credits this job
+	 * contributes to the drm_gpu_scheduler.enqueue_credit_count.
+	 *
+	 * The (optional) @enqueue_credits should be set before calling
+	 * drm_sched_entity_push_job().  When sum of all the jobs pushed
+	 * to the entity, but not yet having their run_job() callback
+	 * called exceeds @drm_gpu_scheduler.enqueue_credit_limit, the
+	 * drm_sched_entity_push_job() will block until the count drops
+	 * back below the limit, providing a way to throttle the number
+	 * of queued, but not yet run, jobs.
+	 */
+	u32				enqueue_credits;
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned int			last_dependency;
 	atomic_t			karma;
@@ -485,6 +498,10 @@ struct drm_sched_backend_ops {
  * @ops: backend operations provided by the driver.
  * @credit_limit: the credit limit of this scheduler
  * @credit_count: the current credit count of this scheduler
+ * @enqueue_credit_limit: the credit limit of jobs pushed to scheduler and not
+ *                        yet run
+ * @enqueue_credit_count: the current crdit count of jobs pushed to scheduler
+ *                        but not yet run
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
@@ -518,6 +535,8 @@ struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
 	u32				credit_limit;
 	atomic_t			credit_count;
+	u32				enqueue_credit_limit;
+	atomic_t			enqueue_credit_count;
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
@@ -550,6 +569,8 @@ struct drm_gpu_scheduler {
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
+ * @enqueue_credit_limit: the number of credits that can be enqueued before
+ *                        drm_sched_entity_push_job() blocks
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
@@ -564,6 +585,7 @@ struct drm_sched_init_args {
 	struct workqueue_struct *timeout_wq;
 	u32 num_rqs;
 	u32 credit_limit;
+	u32 enqueue_credit_limit;
 	unsigned int hang_limit;
 	long timeout;
 	atomic_t *score;
@@ -600,7 +622,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.49.0

