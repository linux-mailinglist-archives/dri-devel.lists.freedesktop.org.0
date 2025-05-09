Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC6AB1F11
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A4810EAFA;
	Fri,  9 May 2025 21:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iBAV0bf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CA610EAF9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:29:43 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-af51596da56so2230649a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746826182; x=1747430982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=meqvWLOgNDkKrnW/6AikmkhA6lmFYYhW4IJ5f3/mKsw=;
 b=iBAV0bf0+GgEDvPaaZJGZbK6/K7+WyD+zWTFbB4kpXR6oR1SPK1B8r6nrJJk4MpABl
 MRAMkVWTwRQjlJaXxFW8bxSMHhk877VoxT6tF8c5OvCEoBsxr08L3qGqH1O4kADox1lL
 PixMSaHDeW/BARuUCznUsAl53AjoUoPPLjDMKRU2yOzS6wj4gmQ5rDCtirDnpICgqRaI
 gAgsfVVfuZdzlDXHmoHrmD5xhNu9pOA+OS0IVvQLfjg7GgAUz7v4XW0K5qC3C7mqSKiC
 NId1nXk/xnAcnepStQpQs6SfSQTCy1NiFmjG0dVIr5JaMV6eadQPRpogqM8gxvbqzhPT
 UC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746826182; x=1747430982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=meqvWLOgNDkKrnW/6AikmkhA6lmFYYhW4IJ5f3/mKsw=;
 b=ektPAC9Vz4vEvfeMDtMtUsj+7N1Af5c/YYAPNTDM6QeJwKyK8N0xkEXvuWFibrgW0f
 zuUqepy5XaQs2sik/y7Rcq7FC7FMp2ueKp+sQNpaliEiLMWbDdoCvCTsO+GczlqOcIt7
 h52QGKsvyF8ftj76A2N3ptFwGtsdr5JKoyiMFjCoSuG8+/AMoSN0vuESK1aUuN7x6L99
 6dsMOy1b/KRH0bdAvyh7sdooludp/7r30JDhTI07mA/SIMjhZey0WP9g8OdhSGNQ2OAK
 SvNt8C8un3lDljjnGyqR/aGhUQkzcS3GOE/u8N2FK9bPoWxGJC6JwCYCON8iPAxyFTtr
 P2JQ==
X-Gm-Message-State: AOJu0YzRX10hy833k1vprl3ZzGF7xhLLlVz9buEWIelvlrhFPPlWc+ib
 Nu6hwYyyQfQIyeNEshgEnn3ZodE2/znKXEb65DFdM7phZZgNX1xYi3InOQ==
X-Gm-Gg: ASbGnctFjyb0WW8J2y7FCEaqVk/byqC1hpuc88qIQBTLP5DFt3u8GyVewUrQlDSGhPH
 4KXQZPIGPg9PtKYiKlbIk/+gMFff7snbQXDJ+ZyLVgsDVBOFShVeg9cQrR6ZTSG/Jlm4M63MIps
 jXMvEdyJt8w4MLaLC4fM7JbnGNUdo2bPKbbrFygJy/+4xMuLOEg+fazTWXm5owPrlOYq2/R93YK
 IKH95RKQytnP04f6qIxFnTjtKdZJiFfadUFLJZEhSIkO8Cr1QuXeih4DhkfP/PBz/rYa8SL0gwk
 KEYAIyPd5ceRfHiFPd4zvjrBTaGTpk54Kz2b+uFMPIQX+VdaOzbB3QFn7XUOVqD61LGMGaRLUrk
 n7lTdvPUN9igh3Y7O3Ol778xEWr0rFKSXiSaX
X-Google-Smtp-Source: AGHT+IF+ITeKptIhdcgHoefjVGiD98M1Z4dXIaMfBsSQt0Vu2agyrzMpqT1JrwblQq1fRY7cXkIygw==
X-Received: by 2002:a17:903:186:b0:224:c46:d162 with SMTP id
 d9443c01a7336-22fc8b3d8b2mr58540265ad.20.1746826181925; 
 Fri, 09 May 2025 14:29:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc764a541sm22276735ad.65.2025.05.09.14.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 14:29:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
Date: Fri,  9 May 2025 14:29:36 -0700
Message-ID: <20250509212936.490048-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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

The fence can outlive the sched, so it is not safe to dereference the
sched in drm_sched_fence_get_timeline_name()

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
 include/drm/gpu_scheduler.h             | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..4e529c3ba6d4 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence->sched->name;
+	return fence->name;
 }
 
 static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	unsigned seq;
 
 	fence->sched = entity->rq->sched;
+	fence->name  = fence->sched->name;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0ae108f6fcaf..d830ffe083f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -295,6 +295,9 @@ struct drm_sched_fence {
         /**
          * @sched: the scheduler instance to which the job having this struct
          * belongs to.
+         *
+         * Some care must be taken as to where the sched is derefed, as the
+         * fence can outlive the sched.
          */
 	struct drm_gpu_scheduler	*sched;
         /**
@@ -305,6 +308,14 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+
+	/**
+	 * @name: the timeline name
+	 *
+	 * This comes from the @sched, but since the fence can outlive the
+	 * sched, we need to keep our own copy.
+	 */
+	const char			*name;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
-- 
2.49.0

