Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993AAB7224
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407710E6AF;
	Wed, 14 May 2025 17:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pp5l+4ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BA210E6A6;
 Wed, 14 May 2025 17:03:24 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22fbbf9c01bso464425ad.3; 
 Wed, 14 May 2025 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242203; x=1747847003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0BW6GR7shhqIiAyRWPQuh4IbH82fM2o3KorXlQUa88=;
 b=Pp5l+4gaAK2wMXtsIi7bO3qEX3uyuE3yf6c4C+xCU/jtcRyEfm182LGdcPmXBrkKZ1
 yPUo74dxBFLOMDoe0eNEjeE2arLmL8qGO/Ls/XzCtQEiMfJMq8UbospjMLe9hcg8IfL5
 S/aNaJN8OPi6EGwP6nc1X2AfAYdLZ5Zl1VwdHNbV1vBWRawfkT4ALC0JDqG2QNUXfdID
 DCvwR50834+RTJz9sbVRiFv6z8LWmJE8IfJHCv/lRz1lQQgRWcdxvzSkh/l+nQeUT3nX
 EhqlhqS3iORC5AicSU3uJT8l2BEYIrgSsc/iZE5TmRoBza8Lj7+Pe7L8kRqfttHP0I7c
 QymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242203; x=1747847003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0BW6GR7shhqIiAyRWPQuh4IbH82fM2o3KorXlQUa88=;
 b=YVs12SPVKML6rROppBJNVb5Ea+ZmIP66KG8xgHs7fDUgscIfnZy6bgc8HAG2WZrGpL
 V2q/eHSs+atUZAr9YyGsgiwArmnC2nw4fZZRGEwKtwxfS1mmr3hwCT0lVBMV4gjWZEZk
 WY4q3yt5k9FL8G24ShiTyDy2W5bFqOFgbIhttxzKF+4dPC9gxf7BUzO8F9KzccZsEYmU
 /TFAYDIYl+vFZCjAYSa2GfESfpL/tTRMPJ75gb7zVGl2kUhgFqu1sLsShRZUzY5HduGe
 FXBHecJsRmYmiOjUWiA4yNDvuz6iD/BMAITgs9B8kOjFEhzkinC3jRYjYuDHgAXw8BeJ
 gy3w==
X-Gm-Message-State: AOJu0YyhPL+j57QOSKJBlLynBuPDk/KHBow/MGIa+lRMmgNKTbLjhocU
 Lq04mYOj12c36QCAaR1nK9XsVCUThmLh6P6almG8eZaCD5Tb3QVWuw5JpA==
X-Gm-Gg: ASbGnct/Q1rgSMpVc7JzT8bNswijVNHdmSRUwrrDw1z8f7yQeKcyN8i+LHF9hyTg0Lf
 yDMAiET1FxnTDICbHZX8Hp0yzHD/Cxsf/J386iVpOIqPT2i52DnEgMowU29Rt08oQo8YBZTc/Bt
 FF3uFc7e6t5ywJzutaTuWpAfTkSeB+JtJE21RzdLDPxTanweKYsNVeJ5DXPZmTQOYxLi8HHqfcU
 H0fRyJr279D/MhzRx7KHAAvWQ/soMg34EZAp/z6oOVYnS4zcm1cJkKoRu+4tXPsWd8OtpNeRcYw
 VrNXP+KbrRsOoxR/Q9PW95v4A3LN+VdG1t6XEocWGfTsIugNEw6vW24PCiR9nw/tiDNFlEQs6+w
 5NisV/VtC6YL3nnJpCb9a3FDM0A==
X-Google-Smtp-Source: AGHT+IEMlbNWPVZi5ATIDqWBoglqdNPa2F0D1yjNsjCQ8Er4dzqDApT57MV6sxUKMpswBaLnlX+hog==
X-Received: by 2002:a17:903:230d:b0:22f:a48f:7a99 with SMTP id
 d9443c01a7336-23198108efamr58781485ad.26.1747242202984; 
 Wed, 14 May 2025 10:03:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc829ea8esm100710345ad.205.2025.05.14.10.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Date: Wed, 14 May 2025 09:59:03 -0700
Message-ID: <20250514170118.40555-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
 include/drm/gpu_scheduler.h              | 13 ++++++++++++-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index dc0e60d2c14b..c5f688362a34 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * under common lock for the struct drm_sched_entity that was set up for
  * @sched_job in drm_sched_job_init().
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
@@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
+			return -EINVAL;
 		}
 
 		rq = entity->rq;
@@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		drm_sched_wakeup(sched);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9412bffa8c74..1102cca69cb4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	trace_drm_run_job(sched_job, entity);
 	fence = sched->ops->run_job(sched_job);
+	atomic_sub(sched_job->enqueue_credits, &sched->enqueue_credit_count);
 	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
 
@@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
+	sched->enqueue_credit_limit = args->enqueue_credit_limit;
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
@@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->credit_count, 0);
+	atomic_set(&sched->enqueue_credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index da64232c989d..d830ffe083f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
  * @credits: the number of credits this job contributes to the scheduler
+ * @enqueue_credits: the number of enqueue credits this job contributes
  * @work: Helper to reschedule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
@@ -366,6 +367,7 @@ struct drm_sched_job {
 
 	enum drm_sched_priority		s_priority;
 	u32				credits;
+	u32				enqueue_credits;
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned int			last_dependency;
 	atomic_t			karma;
@@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
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
@@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
 	u32				credit_limit;
 	atomic_t			credit_count;
+	u32				enqueue_credit_limit;
+	atomic_t			enqueue_credit_count;
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
@@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
+ * @enqueue_credit_limit: the number of credits that can be enqueued before
+ *                        drm_sched_entity_push_job() blocks
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
@@ -564,6 +574,7 @@ struct drm_sched_init_args {
 	struct workqueue_struct *timeout_wq;
 	u32 num_rqs;
 	u32 credit_limit;
+	u32 enqueue_credit_limit;
 	unsigned int hang_limit;
 	long timeout;
 	atomic_t *score;
@@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
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

