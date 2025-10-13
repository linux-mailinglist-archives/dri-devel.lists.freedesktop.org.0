Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F397BD38F1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884FD10E470;
	Mon, 13 Oct 2025 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UT/btOhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562610E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so8760833a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366107; x=1760970907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cKN9AU7Y/YB0yoyxMzRxoxdlCRywZ5g5HyMWHOjzjA=;
 b=UT/btOhCWirvU/G30SwgUOkicyRfPE6ttwEa3+9wBoqu05xD0i7WY6kujXo28zw1k4
 UjHujtz060AbTts+HNvfSpjISj4ci5P6RIyu7alFDHgsmHqJo4EE4W0+CHmEk50K1OHn
 7BfDc4wN49zcsXiRbTY9qgSaOdJstt1JN+iZ2d1eAAEyeae9OZeTG+sIUNJvamxWH6Cd
 dSRASdDC8XySjdGQ77j3ntvgoq/pyiRSZziWHvEmo55elID1MrSBLgDBhzuUAS550tYy
 xiNRaJ8uN+qc4S6kOPrQ1+ED3DsJ91CkDOrbo3AcotzosC90gXjRegMy1dyo2H2okL6T
 adCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366107; x=1760970907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cKN9AU7Y/YB0yoyxMzRxoxdlCRywZ5g5HyMWHOjzjA=;
 b=biQVShEkuA9AVHl+Bj2OPUN/hTu4xCkWkHXQiyqj6e0ppws9gHAwULBzBMuZYOqXBh
 3eNJavZrqvDOkeM5+m9XIX9QeWTH8xNiImHEYU6RAesn7I7v+6Id2iR/XPcQRPmrkq6R
 1KDLHlrisl45o+JmYw11mPo3UxYK6FzmwxoJTtlolRkQJ3LoDsEb0XIUKakGzFyLGn9K
 84gQGvC5+93yoRF0PQ7fQcei0ejQzJfw1Zr6COiTZR/lBJN0u9TIwRMC9IRGbW3ltbGl
 RI8x4IcdXe3YtgG9stiyrtm8W65+9pBb24HIrYgVrMA2XVlz8869kZ2OBk8UrSNOQf/s
 dGSg==
X-Gm-Message-State: AOJu0Yx+J1ybrWglJJu+2acKQoTaHJwd4mTouyIq411aofHRKk0UhFY+
 PgAQuYs/80vC53VgmWqSJd7D3SPuwy67ZAgi8TPNqAEan2zpkozj0U8Z
X-Gm-Gg: ASbGncu5erEqdIwtDgtCS6Oldr13opDQ3TX28fCkJf4uWdqqNDIMslNuUWFi8Ipuh5e
 aAgIqfQgwOlM0idM37Z+xuFgdk5wDripAhHDB+ow34e0FDXv0RCepw0N9BOqwIdb78zVfHI60WU
 VckBM5yUpagjyvO81raANeWFASXfYlr17ku/FE59R7HnkEZOoSvG9zSLOGxyy6emJbMdHKsyKG3
 aMDz+7pVfN7fyTAe2ZayArbmoGEhi+Y6pEnCCeNsgwc5LDOogpBRPXMtSFL668DcOjAWX98wl3Y
 AKUnxsAVnU6DxX+gwtzvwFI2hxZgZSkmd5MMtWPA8d/XJqjZN5scB6+YLL3eT2yIzS76w+zAEmM
 zg56siB2Pewvr+R6h7xdmz0inItSdv6XzQdGXakD1bKRg0x9iJoGOUM8=
X-Google-Smtp-Source: AGHT+IG/CUtUVBR6Y/ki5zW2kFGYrqJzrdCzbUoiHkTmwekq0RRF8b6p2opfvyqBaZviM0jrWrJzpA==
X-Received: by 2002:a05:6402:3550:b0:639:fd12:65a2 with SMTP id
 4fb4d7f45d1cf-639fd1267d4mr13643389a12.15.1760366107187; 
 Mon, 13 Oct 2025 07:35:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/15] dma-buf: protected fence ops by RCU
Date: Mon, 13 Oct 2025 15:48:30 +0200
Message-ID: <20251013143502.1655-4-christian.koenig@amd.com>
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

At first glance it is counter intuitive to protect a constant function
pointer table by RCU, but this allows modules providing the function
table to unload by waiting for an RCU grace period.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 65 +++++++++++++++++++++++++++----------
 include/linux/dma-fence.h   | 18 ++++++++--
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 51ee13d005bc..982f2b2a62c0 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
 signed long
 dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 {
+	const struct dma_fence_ops *ops;
 	signed long ret;
 
 	if (WARN_ON(timeout < 0))
@@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	dma_fence_enable_sw_signaling(fence);
 
-	if (trace_dma_fence_wait_start_enabled()) {
-		rcu_read_lock();
-		trace_dma_fence_wait_start(fence);
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	trace_dma_fence_wait_start(fence);
+	if (ops->wait) {
+		/*
+		 * Implementing the wait ops is deprecated and not supported for
+		 * issuer independent fences, so it is ok to use the ops outside
+		 * the RCU protected section.
+		 */
+		rcu_read_unlock();
+		ret = ops->wait(fence, intr, timeout);
+	} else {
 		rcu_read_unlock();
-	}
-	if (fence->ops->wait)
-		ret = fence->ops->wait(fence, intr, timeout);
-	else
 		ret = dma_fence_default_wait(fence, intr, timeout);
+	}
 	if (trace_dma_fence_wait_end_enabled()) {
 		rcu_read_lock();
 		trace_dma_fence_wait_end(fence);
@@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
 {
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
+	const struct dma_fence_ops *ops;
 
 	rcu_read_lock();
 	trace_dma_fence_destroy(fence);
@@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
 		spin_unlock_irqrestore(fence->lock, flags);
 	}
 
-	rcu_read_unlock();
-
-	if (fence->ops->release)
-		fence->ops->release(fence);
+	ops = rcu_dereference(fence->ops);
+	if (ops->release)
+		ops->release(fence);
 	else
 		dma_fence_free(fence);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(dma_fence_release);
 
@@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
 
 static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
 	bool was_set;
 
 	lockdep_assert_held(fence->lock);
@@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return false;
 
-	if (!was_set && fence->ops->enable_signaling) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (!was_set && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
-		if (!fence->ops->enable_signaling(fence)) {
+		if (!ops->enable_signaling(fence)) {
+			rcu_read_unlock();
 			dma_fence_signal_locked(fence);
 			return false;
 		}
 	}
+	rcu_read_unlock();
 
 	return true;
 }
@@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  */
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
-	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
-		fence->ops->set_deadline(fence, deadline);
+	const struct dma_fence_ops *ops;
+
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+		ops->set_deadline(fence, deadline);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(dma_fence_set_deadline);
 
@@ -1024,7 +1042,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
 
 	kref_init(&fence->refcount);
-	fence->ops = ops;
+	/*
+	 * At first glance it is counter intuitive to protect a constant
+	 * function pointer table by RCU, but this allows modules providing the
+	 * function table to unload by waiting for an RCU grace period.
+	 */
+	RCU_INIT_POINTER(fence->ops, ops);
 	INIT_LIST_HEAD(&fence->cb_list);
 	fence->lock = lock;
 	fence->context = context;
@@ -1104,11 +1127,14 @@ EXPORT_SYMBOL(dma_fence_init64);
  */
 const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "RCU protection is required for safe access to returned string");
 
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return ops->get_driver_name(fence);
 	else
 		return "detached-driver";
 }
@@ -1136,11 +1162,14 @@ EXPORT_SYMBOL(dma_fence_driver_name);
  */
 const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "RCU protection is required for safe access to returned string");
 
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return ops->get_driver_name(fence);
 	else
 		return "signaled-timeline";
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..38421a0c7c5b 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -66,7 +66,7 @@ struct seq_file;
  */
 struct dma_fence {
 	spinlock_t *lock;
-	const struct dma_fence_ops *ops;
+	const struct dma_fence_ops __rcu *ops;
 	/*
 	 * We clear the callback list on kref_put so that by the time we
 	 * release the fence it is unused. No one should be adding to the
@@ -418,13 +418,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->signaled && ops->signaled(fence)) {
+		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
 	}
+	rcu_read_unlock();
 
 	return false;
 }
@@ -448,13 +454,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->signaled && ops->signaled(fence)) {
+		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
 	}
+	rcu_read_unlock();
 
 	return false;
 }
-- 
2.43.0

