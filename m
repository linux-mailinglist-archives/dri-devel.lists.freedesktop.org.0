Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C5A6BEEB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 16:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB6310E167;
	Fri, 21 Mar 2025 15:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFmhmSEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6950010E167;
 Fri, 21 Mar 2025 15:58:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so13508695e9.1; 
 Fri, 21 Mar 2025 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742572734; x=1743177534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=u11Nqjsn2+rdNFvCc22MKoHEm36i/SbLFxyOUOlYMrg=;
 b=fFmhmSEyj5+QlAOmW6FIex5tRq/XV1vIehJb93dBawO/4NLzfqFRPBZwK5dd+nNBxi
 OUuZsDEWPZ+UaXNhaO8Bq7620NYWQrS2RMuMmanL1LbDtkwIY/KvlAwinDyHyceXOo+6
 e5S1vDU3T2oGAf1bAEjbGKQlVE00PlvG+s/ubfIMH8REzHWMBYtqmF3v0lvzITUBe6Rc
 RqLwRdRspN6gB4tzFbva8eKMM5jAKKXqmDDZCbKCNdXlGBt1OJaKhxaO5x/466yfSoPk
 J6QZ2uxRGFnaATdou024L2ay1Ff09ZqhNtO4Cx1Is8PAHz1vnz3H3iOjHsyFDPejBAIU
 TYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742572734; x=1743177534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u11Nqjsn2+rdNFvCc22MKoHEm36i/SbLFxyOUOlYMrg=;
 b=XhSCdSHlUSQxcWKgIkFX5tFSAlaZjuyf7byRVvz8bF/UDphc/tRHyYEcdeVaan78DV
 GXrIY3TxTez1C5w0V1olAZAMYzTs1THzA2ePdwuQ4b2lBV+WTCkFGeo7rNujthg+6NJ/
 pHptvAQxNHocRBfV5z8OV+JuEX0jN9xVrfXXff6wpiHe+ko+IICuIzoNVqRXxSuIYLp3
 0BxO1umqtCIcQl1Iz/7wHqKe6cLX3hCI0FI+HfJneZP6XIOdwihOCI+ynmiNp4JY4eb8
 ET7PiGUiZJqL9P2ADLUhQ8qWS3NtnPNQjIxJkPuzyFokGENK0N57c+iNCnKu0/a48QV+
 A60A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4yjiWwUQnQjTFUenl52lB1sl3lfPq6Hc7X5ny7GgGmhZgpVSzmATQ7ci4klCPEI7AGFc4Zpb8E0zL@lists.freedesktop.org,
 AJvYcCUVd2FCAE2RrwE+fQ9pyNjmgnUKJjHpVtLnuSdJSkweiDYsWPdgRaJmn0WfR8r2kTvhYAGfIP4Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvh9ldSw4ZQijqOm2ZmlM0Qz+S+ZnDwrBqGnC8+Jsr+3v41xdo
 c3sl+jdliKiOgfqiZhrEUwaCf3dBgbf8SBi4/p5qgfqxTkXjVTSG
X-Gm-Gg: ASbGncvlXzzya7iDWwgt60iAw5eAJvfaa1L4jmxz7V43Js4v2jyfdAmm+EEQ1ToL7Qo
 41lfNzys4PDYJ84TYjY+6fmWuSh/vUJA2c6tKcjoPeUvWTJAoaMvUvw2PUwPhC5Ce1rvot/ugVQ
 hZv1gqcuNKvxoapKsnatsuMzyKxNIGryFDf66XgH/N/ITsPIDhzTBu/lT7RnZNCNeKoNExsohJw
 g8mnXi2wwRujTzMCmiVHnRVHJj4nZDs21jeD0yZZlcr1062l1J5bOf1fFUUiPlKC9n/BjXJbsVY
 4tw9iYAakMcXqHwbvzad7NX35GXDdhv8PGbPqvH3KNmvZ2aKqoyoDmJuUQ==
X-Google-Smtp-Source: AGHT+IFRPLpCenf/Oa2DJq/+LGuaBoGnmGuldn1oE8GjcOos6Iw90qimKzuFRx5qQPt/Dctq3GpYnw==
X-Received: by 2002:a05:600c:41c6:b0:43b:baf7:76e4 with SMTP id
 5b1f17b1804b1-43d4915e733mr55396165e9.1.1742572733502; 
 Fri, 21 Mar 2025 08:58:53 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1568:fb00:3bfa:434a:5c33:8520])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3bb2b2ffsm84053855e9.1.2025.03.21.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 08:58:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
Date: Fri, 21 Mar 2025 16:58:51 +0100
Message-Id: <20250321155852.15162-1-christian.koenig@amd.com>
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

Sometimes drivers need to be able to submit multiple jobs which depend on
each other to different schedulers at the same time, but using
drm_sched_job_add_dependency() can't fail any more after the first job is
initialized.

This function preallocate memory for dependency slots so that no ENOMEM
can come later while adding dependencies.

v2: rework implementation an documentation

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 44 ++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4d4219fbe49d..ee3701f346b2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
+ * @job: scheduler job where dependencies will be added
+ * @num_deps: number of dependencies to preallocate slots for
+  *
+ * Sometimes drivers need to be able to submit multiple jobs which depend on
+ * each other to different schedulers at the same time, but using
+ * drm_sched_job_add_dependency() can't fail any more after the first job is
+ * initialized.
+ *
+ * This function preallocate memory for dependency slots so that no ENOMEM can
+ * come later while adding dependencies.
+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_deps)
+{
+	u32 id = 0;
+	int ret;
+
+	while (num_deps--) {
+		ret = xa_alloc(&job->dependencies, &id, XA_ZERO_ENTRY,
+			       xa_limit_32b, GFP_KERNEL);
+		if (ret != 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
+
 /**
  * drm_sched_job_add_dependency - adds the fence as a job dependency
  * @job: scheduler job to add the dependencies to
@@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	 * engines involved, rather than the number of BOs.
 	 */
 	xa_for_each(&job->dependencies, index, entry) {
-		if (entry->context != fence->context)
+		if (xa_is_zero(entry)) {
+			/*
+			 * Reserved entries must not alloc memory, but let's
+			 * use GFP_ATOMIC just to be on the defensive side.
+			*/
+			xa_store(&job->dependencies, index, fence, GFP_ATOMIC);
+		} else if (entry->context != fence->context) {
 			continue;
-
-		if (dma_fence_is_later(fence, entry)) {
+		} else if (dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
 			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
 		} else {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1a7e377d4cbb..916e820b27ff 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_deps);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.34.1

