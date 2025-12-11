Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D9CB5CD6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F2010E7EA;
	Thu, 11 Dec 2025 12:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SVkzVJud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A744E10E7EA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so279305e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455852; x=1766060652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dFvDzbD2b3JXCwApYjpV3Gcs9i8eX2HudtkcBLIiCA=;
 b=SVkzVJud0sucqeEKBGGwlTbmdZ/BxdRGNWk/6uiwBS31QSW/oryPWTQV8h1Aq3BxNQ
 c3jU/Vj2uBqpaA0ee5MTAvZprIrva1pehicSUH2H5zDekgywES9Z7A5Oh6etpEOWVV4I
 BwkytgUmcyTpRQDYPZrJJprKiqmmlVaKTxP65PaDoN6Vh2msbH2rSWk/4C+q/Lbr5m+Y
 r/P0ZIYMURl/83EVBsimPRYojfOLa1qspkmr+DN89D8O1eqDEgxLYr7J20htIONqK/66
 sxnJQutwA+VsL1uCIlsCN/zDzZ8Yc0gDdCszr90iD+BMnkpFpzcSXX6n6YdT2ycjM4cY
 jXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455852; x=1766060652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/dFvDzbD2b3JXCwApYjpV3Gcs9i8eX2HudtkcBLIiCA=;
 b=ZCsV0C1Zr7hlQaCSPnf0vVOUNCES5aTXiMp1yykyE/nJXQiKQD61/fDc7JRxON+ZeL
 MwPJiYQP5MyZwvcaAnIA04mSTK5IqVROBj9RHSfWMh6ayMoPbCGO9SRUUwk627ZaBnxt
 xFF5u1jPD/OlbawPMciOQn+fPiUHlvqRC0++hEsJ2wj5enwwbG7neZ24qvkaxfkeqD2t
 yZD0mcNo294dpzs7FeDwNoYRNAFS9vqSPuOpaDzTu+iu2VZPVI0eCrDLadKaZKY+o36l
 Rk7fcn32xwtaMrHNVRS0+LSxbHOtp8Ck4+/sEPWiEq4vTfbaNHQwXvb4o/669AOXSoKt
 2i8A==
X-Gm-Message-State: AOJu0YxksMt1YxFs60y0kcjBtWxZqK2s0m7+IJl5Kep7KKO4ubvmJ8sP
 hZkjyFHin+lcCQ8kvOYb8yMz3Uodhvaaah9U5jp25CRcgTL3aDMZimtC
X-Gm-Gg: AY/fxX6aA48vGQIc3HRVxVm13I14YUy9Qjc6BqvAHMfQuBEQHzQyIgbdcrmnUNlIxGF
 n7RhZaGBxl3WO7pfuB/6gVt6X8aT+UfWoHIHJXtDclE31sOLwgY5NoccFxxlc4/dBxKmomhpSbQ
 UEFxImacIMpclOQK70iZ538UDVB6Rrg3UWJ1ul7oL//uToM/KGd3TKMIWKcNPnpEKXorJfGnHhK
 2PFlABm7SZPYZKbX1o0VMCchZT+tP+Ouoz7wRxD2JPfF6BNjfT4bKYbDZSh0Dlic10+/pmvtf6j
 3eruNeOzDvMYJyap7ZNsRLS9AbKwPHPssCuRabmtgSYJIPUgkKxZlxFxE2uhe2BKT61PwGQWTrp
 uUpNY7H7WrL8xvOzoaQbZu/r8my6T/rlFgqnMpWX4VsbZC+V5OBTziWmeaHcj1xL0du/rI+itJJ
 tsAFy4MURLJQGCghApcEalI0I2
X-Google-Smtp-Source: AGHT+IF3+f1wDfOdohMsFI8IZoy2rrOpo99dRv8CaHHMuZ2ElOsDSQx3UHP0PvEfpvMrfEoOmjcekw==
X-Received: by 2002:a05:600c:1910:b0:477:b734:8c22 with SMTP id
 5b1f17b1804b1-47a8376e3d9mr59483755e9.8.1765455852128; 
 Thu, 11 Dec 2025 04:24:12 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/19] dma-buf: detach fence ops on signal v2
Date: Thu, 11 Dec 2025 13:16:33 +0100
Message-ID: <20251211122407.1709-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

When neither a release nor a wait backend ops is specified it is possible
to let the dma_fence live on independently of the module who issued it.

This makes it possible to unload drivers and only wait for all their
fences to signal.

v2: fix typo in comment

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
 include/linux/dma-fence.h   |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index e3e74f98f58d..481f1cd9aae2 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -371,6 +371,14 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	/*
+	 * When neither a release nor a wait operation is specified set the ops
+	 * pointer to NULL to allow the fence structure to become independent
+	 * from who originally issued it.
+	 */
+	if (!fence->ops->release && !fence->ops->wait)
+		RCU_INIT_POINTER(fence->ops, NULL);
+
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
@@ -537,7 +545,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	trace_dma_fence_wait_start(fence);
-	if (ops->wait) {
+	if (ops && ops->wait) {
 		/*
 		 * Implementing the wait ops is deprecated and not supported for
 		 * issuer independent fences, so it is ok to use the ops outside
@@ -602,7 +610,7 @@ void dma_fence_release(struct kref *kref)
 	}
 
 	ops = rcu_dereference(fence->ops);
-	if (ops->release)
+	if (ops && ops->release)
 		ops->release(fence);
 	else
 		dma_fence_free(fence);
@@ -638,7 +646,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (!was_set && ops->enable_signaling) {
+	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
 		if (!ops->enable_signaling(fence)) {
@@ -1024,7 +1032,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index eea674acdfa6..e6d753107143 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -457,7 +457,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -493,7 +493,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.43.0

