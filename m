Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF56F6A83
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEDD10E384;
	Thu,  4 May 2023 11:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E910E370;
 Thu,  4 May 2023 11:52:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso707169a12.2; 
 Thu, 04 May 2023 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201139; x=1685793139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KkmUe0CqpwmdzexlbgKMQgf7BUdCFWwkTbwJ+ohSZec=;
 b=Bcl64TUSAQrZOZqG0KKypSonTOZT8ZPexUkHO978fG0Iq53YLEhJ8qdezb/cUkug77
 PNQDsHiGzSVo62UUyj8GS3CqFca+Reyz3wWyRhl6fNAa250qQlDrfyVZ8LUnxUzSNYzy
 40nWDdcTGfXJDi6heO/LeirIg0QyHDri5eBLsQBPydwOZgt5kaClxzpJomvbUCpybnFE
 oyImuP2cHzI5Kel6dxRaCr03qjDqAxqBcPIguqjApqhhMKJ3Bhn8lRFF7o6MMZliFtTt
 h6FeOQgDAjs6UdvbgOAI/rKwQ68r88A+03i/qOr53M+4C1ENxpQ9+WbnrJXLUXOH0uDb
 N9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201139; x=1685793139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkmUe0CqpwmdzexlbgKMQgf7BUdCFWwkTbwJ+ohSZec=;
 b=XvSdkwym0ih1AusoNepzuD0iP+9p4vQOGY6D3q0qkdEOqFlzwg11942HgFoWs7E+nk
 oaGyN8iV7vqCGW1XWNphf2gqavve1gfqdCjUYJGOTwvLzPzhEL//liSsJrjjK7ceqtEq
 nNXxN99wXuKmQ3GTpuo3bMhjzBHbA3v5Ia4BXrfXaKueqx9fWttpnL1xHpOkNYeXNwy2
 qVwHxZBoChbI+KSO8PPix7V38TMqdA80AKLaQ467G+cpr1yInyg38xvycM76ZggxHj9x
 t4QWKkXUGiMu+V7WQ4NDyPtM63bcoVZzF0GumY5iJRzUjanhGbfh/rgqYNx3XRAL/HEy
 ITew==
X-Gm-Message-State: AC+VfDwPJXMzatFfKIGyx1bJ8aRw+IXYC+zpenUt9Mug+WwxhFivaMku
 hHhazs6zo5cIvLNAXTz/G492HkJ60dY=
X-Google-Smtp-Source: ACHHUZ53quiCxXIx1Jp+j4LKNtR9rwTCB8fResGiRJybdMbBKlu2FgGxsD21q8PbV+KN3BWr0Sbr7g==
X-Received: by 2002:a17:907:8a22:b0:94f:2efa:a3eb with SMTP id
 sc34-20020a1709078a2200b0094f2efaa3ebmr6554407ejc.33.1683201138578; 
 Thu, 04 May 2023 04:52:18 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 13/13] drm: remove drm_gem_(un)lock_reservations
Date: Thu,  4 May 2023 13:51:59 +0200
Message-Id: <20230504115159.2245-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c              | 78 --------------------------
 drivers/gpu/drm/scheduler/sched_main.c |  5 +-
 include/drm/drm_gem.h                  |  4 --
 3 files changed, 2 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1a5a2cd0d4ec..6666cd411002 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1214,84 +1214,6 @@ void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
 
-/**
- * drm_gem_lock_reservations - Sets up the ww context and acquires
- * the lock on an array of GEM objects.
- *
- * Once you've locked your reservations, you'll want to set up space
- * for your shared fences (if applicable), submit your job, then
- * drm_gem_unlock_reservations().
- *
- * @objs: drm_gem_objects to lock
- * @count: Number of objects in @objs
- * @acquire_ctx: struct ww_acquire_ctx that will be initialized as
- * part of tracking this set of locked reservations.
- */
-int
-drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			  struct ww_acquire_ctx *acquire_ctx)
-{
-	int contended = -1;
-	int i, ret;
-
-	ww_acquire_init(acquire_ctx, &reservation_ww_class);
-
-retry:
-	if (contended != -1) {
-		struct drm_gem_object *obj = objs[contended];
-
-		ret = dma_resv_lock_slow_interruptible(obj->resv,
-								 acquire_ctx);
-		if (ret) {
-			ww_acquire_fini(acquire_ctx);
-			return ret;
-		}
-	}
-
-	for (i = 0; i < count; i++) {
-		if (i == contended)
-			continue;
-
-		ret = dma_resv_lock_interruptible(objs[i]->resv,
-							    acquire_ctx);
-		if (ret) {
-			int j;
-
-			for (j = 0; j < i; j++)
-				dma_resv_unlock(objs[j]->resv);
-
-			if (contended != -1 && contended >= i)
-				dma_resv_unlock(objs[contended]->resv);
-
-			if (ret == -EDEADLK) {
-				contended = i;
-				goto retry;
-			}
-
-			ww_acquire_fini(acquire_ctx);
-			return ret;
-		}
-	}
-
-	ww_acquire_done(acquire_ctx);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_gem_lock_reservations);
-
-void
-drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-			    struct ww_acquire_ctx *acquire_ctx)
-{
-	int i;
-
-	for (i = 0; i < count; i++)
-		dma_resv_unlock(objs[i]->resv);
-
-	ww_acquire_fini(acquire_ctx);
-}
-EXPORT_SYMBOL(drm_gem_unlock_reservations);
-
 /**
  * drm_gem_lru_init - initialize a LRU
  *
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b09cdacfd062..2d8249148926 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -794,9 +794,8 @@ EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
  * @write: whether the job might write the object (so we need to depend on
  * shared fences in the reservation object).
  *
- * This should be called after drm_gem_lock_reservations() on your array of
- * GEM objects used in the job but before updating the reservations with your
- * own fences.
+ * This should be called after locking your GEM objects used in the job but
+ * before updating the reservations with your own fences.
  *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index b8efd836edef..7e027688a83d 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -476,10 +476,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout);
-int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			      struct ww_acquire_ctx *acquire_ctx);
-void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-				 struct ww_acquire_ctx *acquire_ctx);
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-- 
2.34.1

