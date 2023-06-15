Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86E7317F4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96C10E4CE;
	Thu, 15 Jun 2023 11:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE610E4CE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:56:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so247134266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686830193; x=1689422193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iIPY7wl6oNYohDxN9FBqrKzJlpU7bErGkLreW4C3o6o=;
 b=qsWUw0eRzAQyBm5ljMzdvOVNEP7VxZ9kCTFffMYA40vYTikW5nXlKf8Jtk7iGRxitY
 VfcyrDT+3bc19FzVV9+tjdlAWXt6RYGtddQq2dxfhycj4VoffGu+vBhpLqDqossoppnV
 gSVQlTqDIS+XqK4atyOlPzXMkqJMSj0KYsH/LntN5aK2QV5BCdzCjcmiaPB/frJ39pgM
 1DeoJaptpSw7wcFUbfdYS5Hg6GcLGx/h2qZ8snKL0XlZqSE9A4I5sXEZgE2gatMpRc2G
 4SJIOwgA0hAcWkYZZjoj0F7oKnXo0iN/cBo5o55rj4NmI1326ObcmYXkp7Y2zHinaxTI
 1zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686830193; x=1689422193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIPY7wl6oNYohDxN9FBqrKzJlpU7bErGkLreW4C3o6o=;
 b=beA0GYRJMLA7Vis9nPnHeyMOzlpjPG1T5OzlC6218dNoYvOsqMaq5vJChDcVGWvrAS
 HtVdvqGOPfOpvl0lfu+HTLfZd3I/8rlnv4gTTKaHic56lHY3qRxSMuYp1oQlT1IzVAMf
 hhMwHTuNJ51gv51wcgscZMGO24YDrnBNinR6ZF5wk83L0U5KvMCC640DA9d7B97H6K4C
 uQpAAsyevftsma564LvNVlo8EAIbsdOPqGou7cjPn8nsk7QLrvTPXmqMXIKK5qS7PDl0
 WueMJr6+2qW9nyD0xidSRwIkuOEgI7hClZSPvKp1v+XWIVdTvquaCgcZz39sBXI4uQtT
 b3fw==
X-Gm-Message-State: AC+VfDyUdJ9Ez7S5waGQrPns5kxOzHWp5tO4MTO43oAnQy4nZHNZUE37
 xQvf9L8thJh1el4BauaNjqCJmZdvW0s=
X-Google-Smtp-Source: ACHHUZ7kuNilJqgUyaZnFPd8OEx267m87OJsbGg1noOgxZW7McKBxKJHY9ZXpXh45tnQU56VSc1k5w==
X-Received: by 2002:a17:907:985:b0:94e:e5fe:b54f with SMTP id
 bf5-20020a170907098500b0094ee5feb54fmr17887218ejc.23.1686830193524; 
 Thu, 15 Jun 2023 04:56:33 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1502:3e00:829a:ba2f:339a:9ad7])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a17090634c700b00965d4b2bd4csm9431961ejb.141.2023.06.15.04.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:56:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Luben.Tuikov@amd.com, l.stach@pengutronix.de,
 tvrtko.ursulin@linux.intel.com, robdclark@chromium.org
Subject: [PATCH 3/3] drm/amdgpu: use new scheduler accounting
Date: Thu, 15 Jun 2023 13:56:30 +0200
Message-Id: <20230615115630.164098-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615115630.164098-1-christian.koenig@amd.com>
References: <20230615115630.164098-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of implementing this ourself.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 52 ++++---------------------
 1 file changed, 8 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 1445e030d788..f787a9b06d62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -163,41 +163,6 @@ static unsigned int amdgpu_ctx_get_hw_prio(struct amdgpu_ctx *ctx, u32 hw_ip)
 	return hw_prio;
 }
 
-/* Calculate the time spend on the hw */
-static ktime_t amdgpu_ctx_fence_time(struct dma_fence *fence)
-{
-	struct drm_sched_fence *s_fence;
-
-	if (!fence)
-		return ns_to_ktime(0);
-
-	/* When the fence is not even scheduled it can't have spend time */
-	s_fence = to_drm_sched_fence(fence);
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->scheduled.flags))
-		return ns_to_ktime(0);
-
-	/* When it is still running account how much already spend */
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->finished.flags))
-		return ktime_sub(ktime_get(), s_fence->scheduled.timestamp);
-
-	return ktime_sub(s_fence->finished.timestamp,
-			 s_fence->scheduled.timestamp);
-}
-
-static ktime_t amdgpu_ctx_entity_time(struct amdgpu_ctx *ctx,
-				      struct amdgpu_ctx_entity *centity)
-{
-	ktime_t res = ns_to_ktime(0);
-	uint32_t i;
-
-	spin_lock(&ctx->ring_lock);
-	for (i = 0; i < amdgpu_sched_jobs; i++) {
-		res = ktime_add(res, amdgpu_ctx_fence_time(centity->fences[i]));
-	}
-	spin_unlock(&ctx->ring_lock);
-	return res;
-}
-
 static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 				  const u32 ring)
 {
@@ -257,16 +222,15 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 
 static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
 {
-	ktime_t res = ns_to_ktime(0);
+	ktime_t res;
 	int i;
 
 	if (!entity)
-		return res;
+		return ns_to_ktime(0);
 
-	for (i = 0; i < amdgpu_sched_jobs; ++i) {
-		res = ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
+	for (i = 0; i < amdgpu_sched_jobs; ++i)
 		dma_fence_put(entity->fences[i]);
-	}
+	res = drm_sched_entity_time_spend(&entity->entity);
 	drm_sched_entity_destroy(&entity->entity);
 	kfree(entity);
 	return res;
@@ -718,9 +682,6 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 	centity->sequence++;
 	spin_unlock(&ctx->ring_lock);
 
-	atomic64_add(ktime_to_ns(amdgpu_ctx_fence_time(other)),
-		     &ctx->mgr->time_spend[centity->hw_ip]);
-
 	dma_fence_put(other);
 	return seq;
 }
@@ -900,12 +861,15 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
 		for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
 			for (i = 0; i < amdgpu_ctx_num_entities[hw_ip]; ++i) {
 				struct amdgpu_ctx_entity *centity;
+				struct drm_sched_entity *entity;
 				ktime_t spend;
 
 				centity = ctx->entities[hw_ip][i];
 				if (!centity)
 					continue;
-				spend = amdgpu_ctx_entity_time(ctx, centity);
+
+				entity = &centity->entity;
+				spend = drm_sched_entity_time_spend(entity);
 				usage[hw_ip] = ktime_add(usage[hw_ip], spend);
 			}
 		}
-- 
2.34.1

