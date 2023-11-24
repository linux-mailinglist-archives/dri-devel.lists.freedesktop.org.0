Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E17F6BB4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 06:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755A310E336;
	Fri, 24 Nov 2023 05:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548610E134;
 Fri, 24 Nov 2023 05:28:11 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-77d631aab99so78955485a.2; 
 Thu, 23 Nov 2023 21:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700803690; x=1701408490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+4Ki3riE/rE7G9n0o0zrp6Bwye9GWswsnNjlijDG6qM=;
 b=MxxzYICze8rq+m/ASYHK4OkzQs0F0fbNB6iDDFd74qVnt0RBNmUnZ6kpVx+b+fvJg1
 V92t/oz0iUKurliO9tBvyRUbcrgjBZxJ/Y1K3+SdCl5CKI9qyEqA6tEeTExlfUvH6x2Q
 zbj6zxHMzMpEAT5nLO4oztn7ZclptPaF2mu2uXY2zEBKx3pN0PacIESALHoZgWnjMttx
 sreLD1AC05bsVv8hsrR0M5wal86PDnP59mkfi1nqYA77WQofDE70CFIq6zWn6Idq2iNb
 hjh8ALgahs4Ep3FVP9GtRaw0AFQIEK+/Pc0zZWLDCmZKgjK+qaxl1tMZlhT6AdCtK6JW
 MhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700803690; x=1701408490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4Ki3riE/rE7G9n0o0zrp6Bwye9GWswsnNjlijDG6qM=;
 b=E03+PHz6mh8EkdsKinBKakukduFtyfSx6ljJt93SYhiZiXqHUqJ0aZ/ST4s0H31+Ad
 izQEmmpoWoUwhC0V77X+9dYEZmn7CpwYX257NIY++4Ud5hkJXPLFlf417syR18cX/ImI
 zbPuguOJUminoPoZDABdCvclD5ROA0sHlGrtD7hsouuDWQ+Lj+btxMXhNstwVQvrgl7U
 W1UCggQ8sfuSM1IkF2qGAPfIrO9urqtVPRtfStTA2Wjc3qSJ6MvpTeqC7WRh/HJXK907
 gTxa9gWbPo2oUnep9mAJrf08htXE0ZSuXujyBqGbSgfcUVMiiNr2XdKacWZEqa4vIKbh
 3uNQ==
X-Gm-Message-State: AOJu0YxAHDlA+sLFbRopi5q26z2DPnfaNbERx8UMyL9m8AKc5EokjoMI
 zwARLu9tY/P9pTo5Ly37oyTUjCeBcPDp7g==
X-Google-Smtp-Source: AGHT+IFQEK4mCtEzdEfJbzXCzXjO0b6BN80CJRrzoFp4E+TBrv2cr3NueySWxzt+6ExXy0KfCo87iQ==
X-Received: by 2002:a05:622a:1808:b0:423:7172:4754 with SMTP id
 t8-20020a05622a180800b0042371724754mr2226584qtc.15.1700803690146; 
 Thu, 23 Nov 2023 21:28:10 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 g11-20020ac842cb000000b004181c32dcc3sm1017819qtm.16.2023.11.23.21.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 21:28:09 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Date: Fri, 24 Nov 2023 00:27:54 -0500
Message-ID: <20231124052752.6915-5-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124052752.6915-4-ltuikov89@gmail.com>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.

This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities
in ascending order,
  DRM_SCHED_PRIORITY_LOW,
  DRM_SCHED_PRIORITY_NORMAL,
  DRM_SCHED_PRIORITY_HIGH,
  DRM_SCHED_PRIORITY_KERNEL.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
 include/drm/gpu_scheduler.h              |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index e2ae9ba147ba97..5cb33ac99f7089 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -73,10 +73,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_NORMAL:
 		return DRM_SCHED_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 62bb7fc7448ad9..1a25931607c514 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4252e3839fbc83..eb0c97433e5f8a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 20c9c561843ce1..cb7445be3cbb4e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_MIN);
+						 (s32) DRM_SCHED_PRIORITY_LOW);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba64..b6d7bc49ff6ef4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN;
+		for (i = DRM_SCHED_PRIORITY_LOW;
 		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9a50348bd5c04e..d8e2d84d9223e3 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,7 +63,7 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_MIN,
+	DRM_SCHED_PRIORITY_LOW,
 	DRM_SCHED_PRIORITY_NORMAL,
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
-- 
2.43.0

