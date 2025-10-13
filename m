Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4CBD391B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B2E10E481;
	Mon, 13 Oct 2025 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHVkt8mK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EA410E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:13 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so712543866b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366111; x=1760970911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGHkg4CzQO0ckbxvGrx3lYkCFuMHAvq3/CVgfYTONxg=;
 b=DHVkt8mKXyfQQbtmtjkXPZ+A4RhoHXfsDpFqhmggCMv4WupFav9BYxh4D03Z1nTxoQ
 2FPtm5p9calJCq0UiZCBLpZ00eXvUChFmr3sUKFrV2o8cje2dY9BHcCU3briXk6YTr4y
 wjGOfl32ptLelenSck1/r1khh8B1iBCOUnbOcrGQJvDGWHFJgHXTFPjMEIECQZZuYeFy
 rBzK0EwLg5lXNUJ867ycXW+lHRM3QfTX9U2ILUyrp3v+nWndGsOjpTNnY0+7E1B1Q1Te
 h2Y+3Um00SjtkZqsv9jVF9+mswvJ7hrPLYNiu4ZnY5b3KB6eRsQdDaM5apJYli9fRgix
 JbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366111; x=1760970911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGHkg4CzQO0ckbxvGrx3lYkCFuMHAvq3/CVgfYTONxg=;
 b=G6af+0aAZCZKcY05m/hkTBILp5a4hpdd7XBQaxZTJhko+6c8O7sEmhO6mpfggcq8pU
 kZugFdi6dh6o4/NgLg4qWGGAmFmWC5NwwhFqxXWtktHfpTIVsu1Vuw/S820K6Ziq+Asj
 sg0S95gtTGAySSlieTvcYYtA1wJoI0TNX9a6Tj/eviDdHfTNiMaPmv9DsiCi6iu7OPX1
 5ifhStzwv8hHHk5xeXYfcGfj7DbBE2c76rFDF5eQvjxE1KFgJ0lxIXVL5VTUvBPB+foy
 BHN0viRgw6UuIrYWEJF0ZH8fgm63ZIfP0G/9Q+XeZiCFk3IuMoQULPh0OcDNblr3CTIB
 zMDQ==
X-Gm-Message-State: AOJu0YzV9gacBmH3b4FugIwiVTH/G3TQr025hTUu77rtu3MUBijIjHzF
 Pxvp8hvowmdUGDOaNxnp4QfdWTaZhbPzplW3sqacPXu8wQHTvBWQoabx
X-Gm-Gg: ASbGncvJjdovl5MOLm4SKXYMFChHuRCYr0LdYd2F8vFA/5rN7i+LfGJcu+h4MgrFqhZ
 l/CFcM3h8/bHtmWn2xlz4jzsSFgml2mXDvtSMM6plLVmlVyHF8Jns/9a1TdK41we08aeFmZrjzq
 tY+4aCDmGu+wRRZjeUTgchaA9/woT6d37CEyVZRiDz5WWltG6kK9xR/iRrpfAxA/10Xrqu4nOCM
 PMBUHh0QNFXpQKZjDm0TFRYqcT3AFBwqqwa7kyCbr19y8ePFpDynejRGmbx6YbWdoyIK6V4VmzQ
 g/BWDUC6LcKHcL7R23DNAXUnRxV1gwNzvbgzz3n7YSVigYN/PvMF1EdMlXiger/H/7vfFaxfLnv
 WbyiRsLILPtLk61v2p8O+1zB93PgunSI7Zs5VDg/h8XWZ+ppDxRuFlrw=
X-Google-Smtp-Source: AGHT+IFrNoq8xL3ZHlvsw6ON2Yc9FPU5zGsMHl3vFaEK54U+eSoLlYiwIMQrMyFsTHfTQU+mlJpg+Q==
X-Received: by 2002:a17:907:2d8c:b0:b45:592f:74ac with SMTP id
 a640c23a62f3a-b50ac1c644bmr2203947966b.38.1760366111282; 
 Mon, 13 Oct 2025 07:35:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/15] drm/sched: use inline locks for the drm-sched-fence
Date: Mon, 13 Oct 2025 15:48:36 +0200
Message-ID: <20251013143502.1655-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
 include/drm/gpu_scheduler.h             |  4 ----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 9391d6f0dc01..7a94e03341cb 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 	struct dma_fence *parent;
 	unsigned long flags;
 
-	spin_lock_irqsave(&fence->lock, flags);
+	dma_fence_lock(f, flags);
 
 	/* If we already have an earlier deadline, keep it: */
 	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
 	    ktime_before(fence->deadline, deadline)) {
-		spin_unlock_irqrestore(&fence->lock, flags);
+		dma_fence_unlock(f, flags);
 		return;
 	}
 
 	fence->deadline = deadline;
 	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
 
-	spin_unlock_irqrestore(&fence->lock, flags);
+	dma_fence_unlock(f, flags);
 
 	/*
 	 * smp_load_aquire() to ensure that if we are racing another
@@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 
 	fence->owner = owner;
 	fence->drm_client_id = drm_client_id;
-	spin_lock_init(&fence->lock);
 
 	return fence;
 }
@@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
-		       &fence->lock, entity->fence_context, seq);
+		       NULL, entity->fence_context, seq);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
-		       &fence->lock, entity->fence_context + 1, seq);
+		       NULL, entity->fence_context + 1, seq);
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e62a7214e052..4478164ea174 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,10 +297,6 @@ struct drm_sched_fence {
          * belongs to.
          */
 	struct drm_gpu_scheduler	*sched;
-        /**
-         * @lock: the lock used by the scheduled and the finished fences.
-         */
-	spinlock_t			lock;
         /**
          * @owner: job owner for debugging
          */
-- 
2.43.0

