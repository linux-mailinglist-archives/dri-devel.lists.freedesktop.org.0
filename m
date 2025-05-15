Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD67AB8A1F
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1501710E8E6;
	Thu, 15 May 2025 15:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARIXNIyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2D410E8E5;
 Thu, 15 May 2025 15:00:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-441d1ed82dbso10457285e9.0; 
 Thu, 15 May 2025 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747321241; x=1747926041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iqqmgJA8WgQ28xBhyBO+giB0rAYLvAfiThdMBFOCLiA=;
 b=ARIXNIyBERB2FydgrxGI571qv7VrpA0XEbWocBTmLYB1yCmenetpzkqwjRhtX4uVyJ
 EaC1TsnOYDtIAI3CUoA4yYimkFAolz8x6Xafyzvy72BEKh1jkLhqUDECWsCYGcuwNw+/
 GwmozPydRNoq2dlaNqiVDtjgyseYAyFbRSyUtCMHZC/PcLLT+eGhWx0HeiQsPwPZEKiy
 37A+nnUlkpOCR6o/fFplhpszwPrZUjn0yjFpFcmp/NKGfrJ9LknPVORyFuevjpKnMRkz
 yYqEoa10bejnmK93qIvwa5Nt3mwFr34DPp92g1gbgiLYZ3VTkbUrxFBDIviiQ+3xiNge
 Frrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321241; x=1747926041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqqmgJA8WgQ28xBhyBO+giB0rAYLvAfiThdMBFOCLiA=;
 b=PQ82n0bZnOK+ihZ5YIgaR+MjtPT2leq0+v4GGG1VAAO6KR0IzkktCmiox4LGoDQlzd
 PxhmW6UfhUAG3xQzWvA9+sjbfee+qrIPRTuHe37cQwafn4XrH6Wd0ZegZHqCplIpMP0K
 Ow0cRj7KTwSjWk1U7vCjlmCpe9SGm5IoIz+57iL1iLHt+4r/qon3Tegf5gMfJGTE1cs3
 C+EhqLQ87d1ec7gRLmqjhSJQ7/nSD5TQuMD962Icsfcs2IbLTS0x+qPko5wB1GWFaX/v
 ijjFL8cWVAKlHNdblIQ2JLpy/9ynEgx+yP5NLvYUrgT2Fu2ZdIUxZLTqFsrVZWMDTJvP
 SPxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCyjjzkJUK73l/6Mtsk3CHqvZaAB354tKNLSfL4OISnZkfS4aOQFcI5Cs3ckva7pJhLYqYTZQx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzCRU8fbL2bJIl6CkSh90+PJojykcWWTfmfbzrs5kFRASC0g6i
 YeoZ0Rp6Ep8Nz1VN29tMlOH9IIb+pmvJMcHFvdVBw/evpMCnV/F1IVfGg27J+g==
X-Gm-Gg: ASbGncsU/FVFjtiq+Iw6gSPGOZ4TS5xqZL/ZTF7r9QAN/SNyvyYzfkwoWVHtMmHqwEY
 bwkcs344R9dzWZa9El55NuApDvp5p21Bfbpz4r6jfpp275wS8EJWvrP1+gnknwCZsxm8ZX4+LRb
 BxKOaU5QDPzSIDIzWFMrNh43dxAsbUOL9y7NrDU3lzlItNJSu5zCkjqbmLA3H5iUUI1bBGh+W6A
 gfCg6NO7KZ9n1IBTm8gooHU/N2lc4PMJx5csPYBUSO2I6i6Hf7SWNTrXpza5hV2/+OH1os83F0G
 rO4rqo83HZHqYL5SOIAAAIIfXtH+tyZUu75kCgHRmTTfImtdW0ce7d4AByWrR2W+
X-Google-Smtp-Source: AGHT+IGB7hLHeKcjwhuLPMoO1WQJA6nqoH4LyQQ7rWKR3GHFhJM8Zxve5G+HTzx/WguZhlGb6a4qiA==
X-Received: by 2002:a05:6000:2505:b0:3a0:6c62:8169 with SMTP id
 ffacd0b85a97d-3a35c825afcmr92833f8f.25.1747321241028; 
 Thu, 15 May 2025 08:00:41 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15b1:d600:9d43:bc40:55da:2532])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm75808185e9.29.2025.05.15.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 08:00:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
Date: Thu, 15 May 2025 17:00:36 +0200
Message-Id: <20250515150038.4615-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515150038.4615-1-christian.koenig@amd.com>
References: <20250515150038.4615-1-christian.koenig@amd.com>
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

Sometimes drivers need to be able to submit multiple jobs which depend on
each other to different schedulers at the same time, but using
drm_sched_job_add_dependency() can't fail any more after the first job is
initialized.

This function preallocate memory for dependency slots so that no ENOMEM
can come later while adding dependencies.

v2: rework implementation an documentation
v3: rework from scratch, use separate function to add preallocated deps

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 45 ++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h            |  4 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f7118497e47a..b95e7089aa70 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding dependencies
+ * @job: scheduler job where dependencies will be added
+ * @id: id for the allocated slot
+  *
+ * Sometimes drivers need to be able to submit multiple jobs which depend on
+ * each other to different schedulers at the same time, but using
+ * drm_sched_job_add_dependency() can't fail any more after the first job is
+ * initialized.
+ *
+ * This function preallocate memory for a dependency slot so that no ENOMEM can
+ * come later while adding dependencies. The index of the preallocated slot is
+ * returned in @id.
+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
+					   u32 *id)
+{
+	return xa_alloc(&job->dependencies, id, NULL, xa_limit_32b, GFP_KERNEL);
+}
+EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
+
+/**
+ * drm_sched_job_add_prealloc_dep - add dependency to preallocated slot
+ * @job: scheduler job where dependencies will be added
+ * @id: the preallocated slot index
+ * @fence: the dependency to add
+ *
+ * Consumes @fence and adds it to the preallocated slot dependency.
+ */
+void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
+				    struct dma_fence *fence)
+{
+	fence = xa_store(&job->dependencies, id, fence, GFP_ATOMIC);
+	/*
+	 * Be defensive just in case driver messed it up and used preallocated
+	 * slot twice.
+	 */
+	if (WARN_ON(fence))
+		dma_fence_put(fence);
+}
+EXPORT_SYMBOL(drm_sched_job_add_prealloc_dep);
+
 /**
  * drm_sched_job_add_dependency - adds the fence as a job dependency
  * @job: scheduler job to add the dependencies to
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d860db087ea5..0286e0934317 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,6 +632,10 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
+					   u32 *id);
+void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
+				    struct dma_fence *fence);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.34.1

