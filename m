Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7236A71104
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 08:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9110E04A;
	Wed, 26 Mar 2025 07:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WRhRI+y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4DF10E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 07:05:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22792ef6215so11564275ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742972714; x=1743577514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y5M1dmQ51OWKbmNdrtMEljTJB1EZHsX1ujWaE7KOrUU=;
 b=WRhRI+y09rYc4vCX/SNUYmF8tmdR/0tjzMbvqJqUgvYb+paSfR+UlmpZcRjjnDp33r
 kZcfeqSKCwv60mCB9epCdLOizLQ2tOqbj4MK1bZ+Gakn4OuhueGFcH9AMLziUT4BxJmH
 GGt5vRjciKj+kxEj+SYDDbZ5PZZ2dngFdzI2bdLKAVFl6xXycnUxspGPnJlApl6t+tS6
 Y6nl5DaqFrbYWnZHCsu8hPjShpNURDs63lzi7RcLnfs9QQKTyxewvRbVzxm2OLf+d1eu
 ubh6cpT+Vjg9X34jcBTrj+pj8lT+o/9Obr/2g/YTy/7fAd8hXheAEUvVDk697BKkzgqn
 1XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972714; x=1743577514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5M1dmQ51OWKbmNdrtMEljTJB1EZHsX1ujWaE7KOrUU=;
 b=ZvdeXeIUshFlqU9PKOuNWyUZ0QyI5nXCunc63q08GmS1fFL/3882kA6PjWYaa8F7vk
 8oufHQiA4ts/KwXqEiGzmAWD6WtCfvdiHarD+qsiXI3inMfeOGL81Oe8e1y+3KRcVp1R
 FyuuVW9oOjNEdAjFXXeEZkEoirMgdWwCiYGfllIpHoWvuSBlbQfaHnMvWhrsJUIUUSjU
 4byENKksOIKsPBPHkuMdc/O98MAIDA6HovwNgs+TVPmZ5zd2NNmwFITRPJ9/GgSesKRj
 zuTsesWbgbe41v0THmtVd9NUpSsAhUzNDZW+9XgGseqD5qIboDGqIlXHj1kySOKUy+dy
 GViA==
X-Gm-Message-State: AOJu0YwTYgGzytSjlxRWS1EiYCpDsDRXrb+NIzyPtZ8Rul+0eHe60amG
 +mefcA9Ru+7HCPdXNUfY/2CuHpXnUl5iWZPfXFqvPb8bBvqwawHt
X-Gm-Gg: ASbGncvMgh7E48R23B3HWH2idSt8vm8UwNtlhKdSNqgFMjHKTsy3edUIFpmudKmNqIC
 H5QT4ab8wfYarNWmS98+Vr+9ncr20p0UN/ZsLN127Ply35jmP6JsG8/y43SUQd6OOiyJA3/BMib
 8dhVTwdBAAUaAEFSDapR7IGSHZ7TghoHA2UuhstHHoSRsAN6AEVyiK5LgPd+S2FLmEbHwnNm7dI
 c7DX0yz+E2viy59H6MT7PMIB/9iZkF0aVFRKNnP57+fJNzl0FJnvqr9xNULPpwXRpYCz7SB6k//
 3lDk8IeF3pTuhpgzRtOJl8ezt2SMheMGMLg3FalxmIyColHESSMlGp9OTHfyjzY1+j5m47lv5Mi
 xdyMTZfYaFRP3nu3fNCDB0A==
X-Google-Smtp-Source: AGHT+IGpzx6/Khs0/BUqQJij9lRr0pXhV1cXF3zLYPm7lfJcElBkqaLch5KGQ0T2Kt93pE8sp5FCrw==
X-Received: by 2002:a05:6a20:2d26:b0:1ee:cab3:4287 with SMTP id
 adf61e73a8af0-1fe4300f32bmr11293700637.7.1742972714237; 
 Wed, 26 Mar 2025 00:05:14 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-171.hinet-ip.hinet.net.
 [210.61.187.171]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf576c65sm15709455a91.10.2025.03.26.00.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 00:05:13 -0700 (PDT)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org, airlied@gmail.com, ckoenig.leichtzumerken@gmail.com,
 dakr@kernel.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 matthew.brost@intel.com, mripard@kernel.org, phasta@kernel.org,
 tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com
Subject: [PATCH] drm/sched: Add return value for drm_sched_entity_push_job
Date: Wed, 26 Mar 2025 15:04:41 +0800
Message-Id: <20250326070441.1515428-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Currently drm_sched_entity_push_job() has no return value to indicate
operation status. This makes it difficult for callers to handle error
conditions properly.

Add a int return value to drm_sched_entity_push_job() that returns 0 on
success or a negative error code (e.g., -EINVAL) on failure. This allows
callers to:

1. Detect when job submission fails
2. Perform proper cleanup (e.g., release job and fence allocations)
3. Avoid potential memory leaks in error paths

Signed-off-by: Qianyi Liu <liuqianyi125@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 8 ++++++--
 include/drm/gpu_scheduler.h              | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bd39db7bb240..f31964e76062 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -579,8 +579,10 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * fence sequence number this function should be called with drm_sched_job_arm()
  * under common lock for the struct drm_sched_entity that was set up for
  * @sched_job in drm_sched_job_init().
+ *
+ * Returns 0 on success or a negative error code on failure.
  */
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
@@ -609,7 +611,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
+			return -EINVAL;
 		}
 
 		rq = entity->rq;
@@ -626,5 +628,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		drm_sched_wakeup(sched);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..48a263571bab 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -589,7 +589,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.25.1

