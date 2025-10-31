Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138ADC254EA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D010EB62;
	Fri, 31 Oct 2025 13:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Re17sK0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF1710EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:44:54 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-421851bca51so2023932f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918293; x=1762523093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WX4eUr4adDYPkQxaxM753EQKKqq3KJlvPOhp9WzdP4=;
 b=Re17sK0YZNqyi1t3f21C66SA833mmj38+ogCyZQKWLswpXOpNA3YdBpmlkMc6sVpdN
 FlZQXSKrRMknNUZ/VWhSTK3uYRZXF6quhoUch8hgReReex90FlH0nhDAKZQSvTKHhybc
 0Ydc+HYezTd2DhQHckpALoS6c0jcWvyyU/kOOsTdEs4opzl5zWSQVY7Iof/VS1qv76gj
 Fn7XHiW6byXVzB5O/wY2DKirmD4ZcklWvOA31zNoE6QG5LbohBBL8ryqtn2TY73DY3pX
 Lwl9rGp+sQjMfUJgKPYfMFv0aNfAkDWLtWR/HzwFtYPOtZZzmA8zEdHqEfU1slsgTyad
 ckxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918293; x=1762523093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WX4eUr4adDYPkQxaxM753EQKKqq3KJlvPOhp9WzdP4=;
 b=Q8wztCgOZMw2X2TZDf0csYERqsWlV7OZmgS8YZE1fZ1OOZaZLZOLGNd3DK27SVje6O
 p3mi5dzFP2gegfasXZKPJe4pBu2SqH0apW76goARmFDVqL1la3EL9vVHdSdePOXuouxe
 Z51gMs/VlZZEBr0285ymEpneBnOJj28w2qrjRgsm+DKynzgbfbPARBH3+KyowHRTq5Qk
 bJNiGANMhgdFHBJnWBdJmWXhJm/eI1qjKKnv1HTfTowGR0ZMXqBdpjnUZpIglScwxR/P
 sDP89ZNGmvlt2hMq/GlP/UzEsuglfrQLErSJOsXtOKOL0SegOERYA8aM6Ot90o2FuHgl
 pfXQ==
X-Gm-Message-State: AOJu0Yy3z6Cv+p+j610i3y9ijZG6ORN6Ffhw7G1Q2i2gDeZAniXaUVwx
 21gFiDcuGVnoJD8VPO7/Zk6tCaNLuDjRVNBgG7TQjaV2rby66e/8LxJd3zCM9IHGYx4=
X-Gm-Gg: ASbGnctp4pfxKh2tRtD9Il7gq8+IbqQgsQ6VbErJaP5Yyra/8psEoNeCdNC84LyRfOy
 h0qILG6nQODkKeVfcYNGQ+9EAn5vDaqJcVcYi5HGixKOWZd5uej1Q680E0cKGUuFn/HHWHrFxO4
 FoJV4XJTUi9swjTvnVBZp7CSLRz5cbO1kENWKnSD62LeSO7TAC20gkduvOh2XmHQDUknQQRugqp
 e+/3bA4xYlleC/pt/REiUFa75cQEuLfauQ7mi01h5+YFZ8WGFP55mY4tIdTZk749IFrTwV9cjU3
 sRd9ppUdIpVyb88tLhvNqM+nXN/2CWRCDmAvr1/qRoupeLbXC/V6uvFq1btFgbYJVodx1wO/nBE
 a1aBQmNQHdaAO6GerWQJ3r9S701SuDNaGMluoefkz15YdLNVFu0ZFEy5DqCKj90rZnnsCcDbjlB
 9pyzM3w2RQzRIpNS6F9k4PijrGbFvx29jqpjc=
X-Google-Smtp-Source: AGHT+IEwY839wjEem0IijYAmFp0uzdAfBepYFGN2V5Bu0rDd0WkRZ9vyTw/3AVjw5Jzf9ozJX0BSpg==
X-Received: by 2002:a05:6000:4024:b0:428:5659:8209 with SMTP id
 ffacd0b85a97d-429bd69f689mr3058008f8f.33.1761918292848; 
 Fri, 31 Oct 2025 06:44:52 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/20] dma-buf: protected fence ops by RCU v2
Date: Fri, 31 Oct 2025 14:16:37 +0100
Message-ID: <20251031134442.113648-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

v2: make one the now duplicated lockdep warnings a comment instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
 include/linux/dma-fence.h   | 18 ++++++++--
 2 files changed, 62 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index b229d96f551c..ed82e8361096 100644
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
@@ -1104,11 +1127,12 @@ EXPORT_SYMBOL(dma_fence_init64);
  */
 const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return ops->get_driver_name(fence);
 	else
 		return "detached-driver";
 }
@@ -1136,11 +1160,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
  */
 const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_timeline_name(fence);
+		return ops->get_timeline_name(fence);
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

