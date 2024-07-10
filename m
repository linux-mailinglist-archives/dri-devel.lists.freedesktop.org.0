Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A192D1D5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0327E10E787;
	Wed, 10 Jul 2024 12:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OsyrS5w3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38EF10E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso7635118a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615388; x=1721220188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=40acJs2fLXR0Yl1TXrRI/vXyr4P4RhGTEqeA9wFSz/w=;
 b=OsyrS5w3Xn6Ho2BJ62NE7Qbj61QoMl/7RpP9wYNPEqFhrltKJtKh8VVjszpf4/cg+Z
 cbTZhHHYFpUl+6HJHHDGOsh84+ohhbAH6CC2YNjsBJULGd2YT2rUMejFgBFutbeTSTst
 CRp0wLSTOIPkkHJclivxeYwp/YiP/+xBsw/XfHy68Z0VdjUwWgrvu/cv0oajVD/5h3U2
 aGplz74zZV4kLeCAQpdWayTfB1pE1n8UsaUD64v6+ye9eMa2hHX6LxLJaCvulUdxzPIg
 spaNilgWtMDpPwtgXOTahWLEUfy74wJ+8Z4Bmg1jMHlTIxJdFXe+HbreNDdm+h9Ox6Cb
 KZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615388; x=1721220188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40acJs2fLXR0Yl1TXrRI/vXyr4P4RhGTEqeA9wFSz/w=;
 b=A7bcF/MaZ06ZO4LLwGZVE2tpVOtRa12rXMeE3nN4CAI3r3pmLhw6hJJU4/EpbxuC9K
 gZ6eYjUMS7nPiLqrh61vg80FGuP8XDVtByZJHuZ/9rda1dBquAPFFaZR3822jtOzx5fO
 b5zVy11jPaMrO/wIog95Lw8YQ5lQvQg7I6pMluRwm3vflRUTlFd0ft2GtyOTIaZmXqLa
 1zy4P9pAF3VxHP8LBZjqRdco96/RBF9y1uthtCSYeVRR7SVgJTO7LrmUi3yIHTBA+X6P
 4nqKbl9eODRQPAV6dB350qLjjD+iFuTAQ4VOR7ze8haTKDCPzQApZbv1Oc7/0e0q2Hqx
 3jpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhuf/1qoS4M13LGQrY7u3W+d/XbInWByiwZzNhl4rXjUWtwHqLOYFPosB4/+q1ii9eAbSRcRlDo8HpPAgUrdOzq2sLXXoVTxUEDFkeuwkC
X-Gm-Message-State: AOJu0YwizhzLGK3JOBZ/RDrM7B1uJVAAreYXMsI3whOBaYvR5SzpiiBf
 KAsD7AAClzgB2Wxr/dfv4M2opoKRaPd0vSlrgp80B/6gf+mL/VIzfpOdznhx0eg=
X-Google-Smtp-Source: AGHT+IEtJgrCgEuJUf7vfL5SnFbsP/SYj65cd+WrgGDL1gePi6WLKUNEyXtCa2JOhVtRDeH0VZzivQ==
X-Received: by 2002:a05:6402:120f:b0:58b:9077:2bd4 with SMTP id
 4fb4d7f45d1cf-594bbe2ba76mr2558982a12.41.1720615387901; 
 Wed, 10 Jul 2024 05:43:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/ttm: move needs_unlock into the walk
Date: Wed, 10 Jul 2024 14:42:59 +0200
Message-Id: <20240710124301.1628-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

Not a walk parameter but important to have that status around.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 26 ++++++++++++--------------
 drivers/gpu/drm/ttm/ttm_bo_util.h |  2 ++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 03e28e3d0d03..7a4bc7e9950b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -772,15 +772,14 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 }
 
 static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
-				 struct ttm_buffer_object *bo,
-				 bool *needs_unlock)
+				 struct ttm_buffer_object *bo)
 {
 	struct ttm_operation_ctx *ctx = walk->ctx;
 
-	*needs_unlock = false;
+	walk->needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
-		*needs_unlock = true;
+		walk->needs_unlock = true;
 		return true;
 	}
 
@@ -793,8 +792,7 @@ static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
 }
 
 static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
-				   struct ttm_buffer_object *bo,
-				   bool *needs_unlock)
+				   struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = bo->base.resv;
 	int ret;
@@ -805,7 +803,7 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 		ret = dma_resv_lock(resv, walk->ticket);
 
 	if (!ret) {
-		*needs_unlock = true;
+		walk->needs_unlock = true;
 		/*
 		 * Only a single ticketlock per loop. Ticketlocks are prone
 		 * to return -EDEADLK causing the eviction to fail, so
@@ -821,9 +819,10 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 	return ret;
 }
 
-static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
+static void ttm_lru_walk_unlock(struct ttm_lru_walk *walk,
+				struct ttm_buffer_object *bo)
 {
-	if (locked)
+	if (walk->needs_unlock)
 		dma_resv_unlock(bo->base.resv);
 }
 
@@ -869,7 +868,6 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	spin_lock(&bdev->lru_lock);
 	ttm_resource_manager_for_each_res(man, &cursor, res) {
 		struct ttm_buffer_object *bo = res->bo;
-		bool bo_needs_unlock = false;
 		bool bo_locked = false;
 		int mem_type;
 
@@ -878,14 +876,14 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		 * since if we do it the other way around, and the trylock fails,
 		 * we need to drop the lru lock to put the bo.
 		 */
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+		if (ttm_lru_walk_trylock(walk, bo))
 			bo_locked = true;
 		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
 			 walk->trylock_only)
 			continue;
 
 		if (!ttm_bo_get_unless_zero(bo)) {
-			ttm_lru_walk_unlock(bo, bo_needs_unlock);
+			ttm_lru_walk_unlock(walk, bo);
 			continue;
 		}
 
@@ -894,7 +892,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		lret = 0;
 		if (!bo_locked)
-			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+			lret = ttm_lru_walk_ticketlock(walk, bo);
 
 		/*
 		 * Note that in between the release of the lru lock and the
@@ -906,7 +904,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		if (!lret && bo->resource && bo->resource->mem_type == mem_type)
 			lret = walk->ops->process_bo(walk, bo);
 
-		ttm_lru_walk_unlock(bo, bo_needs_unlock);
+		ttm_lru_walk_unlock(walk, bo);
 		ttm_bo_put(bo);
 		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
index c19b50809208..c653e16ccb76 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
@@ -59,6 +59,8 @@ struct ttm_lru_walk {
 	struct ww_acquire_ctx *ticket;
 	/** @tryock_only: Only use trylock for locking. */
 	bool trylock_only;
+	/** @needs_unlock: If the current BO needs unlocking */
+	bool needs_unlock;
 };
 
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
-- 
2.34.1

