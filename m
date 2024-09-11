Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E806974DBA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02C10E8F7;
	Wed, 11 Sep 2024 08:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nf8aLwVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5210E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so17195235e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045157; x=1726649957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+Vudm5+rNH6RmErlp/V5uBz7nZvM6nSnt6FCXuzaubY=;
 b=nf8aLwVataRzU258ADqUowhVaFvk9fXwtEe0OVBuWNEs9x7HyrVXGig/Kd57qwaNSd
 fXASg2yl8pJpqpWrWug+0HrUgBlRS9EhbLsbLBkA4afmhvCLKyhXA1b2BxL17pW1BTs0
 ZijekikR18d7ws347Hk1xhBnHBZkR8VhWZOUK3Hj5Zq/M1hR+GeL9IJbQqU+5S0pBgpC
 WIWosn4/03vhHrUm6EIrbTNK3x1OU2ifvivGeFYmscNfDidc6XFB5kHdZICsYpDuTslh
 ikx9gWQW3C5YO+ranHEQeL0wSnRI+XeUZ+tuTdO6NZahQ3QyG0GiKbEgRbxJZXaFsT+a
 nEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045157; x=1726649957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Vudm5+rNH6RmErlp/V5uBz7nZvM6nSnt6FCXuzaubY=;
 b=Aq7XG0AwC5fdUl5LcYbZMZgO92uUN4DjcvZSgaAJZ/M0F3Boix0e0vESpztmkv2WNf
 KaiotcwPg1mKlUWeKTue8QaqvMhBMel/UJrtKTJEokNQNPI/o0kyImgGHWdKxO/pK0tM
 ibaz+DVU7lcAxO0I4vr8cdHMhv/WpjgEXg/Q/yJZtVRL/NBHs4Ed26yi7pI5BcYlK9LC
 BIjx7U1LROjDPpLSM+cAZhoS9rcv2oP7oZxZvAYsDYC5IIuFORazWNjFuJ+Y42aJPqam
 WSJAgOYierD4VpQvmh2lTVP7nsaraCfDXkBaCx8pN1Erq2Zn4azlW3DcGTc+1WgJzPpO
 mVqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKUtOH4RA13HTgMg9LFobPebAPpzIOf+uMZQUlos8lcyCcS/MFPTyIrQA5WTEgkggvN+62YWY7iQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL1/jUeA3tL8AjmkgAYsrVdVSfj5jDB9V/gChKJd3n6Xuw7aO7
 UNLssc3FzfvbzHGU5wFdtyd7G9NW6lUTdgDB7ByrKjsksWIh48RWhvD/ogQhYa4=
X-Google-Smtp-Source: AGHT+IH3zEWtX8NhFCEXgP6I/ZwKbTfQRs/JpM1KSrmBZ4z3FHX1iusHix0EvyjZ4bXhtuD2q4hsyg==
X-Received: by 2002:a5d:47aa:0:b0:371:8cc1:2024 with SMTP id
 ffacd0b85a97d-378b071f186mr1842989f8f.0.1726045156642; 
 Wed, 11 Sep 2024 01:59:16 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] dma-buf: rework the enable_signaling handling
Date: Wed, 11 Sep 2024 10:59:03 +0200
Message-Id: <20240911085903.1496-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
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

The enable_signaling callback is the only function the dma_fence
objects calls with the fence lock held (the signaled callback might be
called with the fence lock held as well, but that isn't guaranted).

The background of that decision was to avoid races with other
CPUs trying to signal the fence at the same time and potentially
enforce an ordering of fence signaling.

The only problem is that this never worked correctly.

First of all the enabling_signaling call can still race with
signaling a fence, it's just that informing the installed callbacks
is blocking for the enable signaling to finish. If that is required
(radeon is an example of that) then drivers can still grab the fence
themselves, everybody else doesn't need that.

Then regarding fence ordering it is perfectly possible that fences
emitted in the order A,B,C call their installed callbacks in the
order B, C, A. The background is that the optimization to signal
fences from dma_fence_is_signaled() decouples the fence signaling
from the interrupt handlers. The result is that fence C can signal
because somebody queried it's state while A and B still wait for their
interrupt to arrive.

While those two reasons are just unnecessary churn the documentation
is simply erroneous and suggests an illegal operation to
implementations: "This function can be called from atomic context,
but not from irq context, so normal spinlocks can be used.". Since
the enable_signaling callback was called with interrupts disabled that
practice could deadlock.

Furtunately nobody actually ran into problems with that, but
considering that we should probably re-work the locking to allow
dma_fence objects to exists after their drivers were unloaded this
patch re-works all this to not call the callback with the dma_fence
spinlock held and rather move the handling into the drivers which
actually need it.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c             |  7 +-
 drivers/dma-buf/dma-fence-chain.c             | 13 ++--
 drivers/dma-buf/dma-fence.c                   | 68 +++++++------------
 drivers/dma-buf/st-dma-fence-chain.c          |  4 +-
 drivers/dma-buf/st-dma-fence-unwrap.c         | 22 +++---
 drivers/dma-buf/st-dma-fence.c                | 16 ++---
 drivers/dma-buf/st-dma-resv.c                 | 10 +--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 12 ++--
 drivers/gpu/drm/i915/i915_active.c            |  2 +-
 drivers/gpu/drm/i915/i915_request.c           | 12 +++-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  9 ++-
 drivers/gpu/drm/radeon/radeon_fence.c         | 17 +++--
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  4 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |  3 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  6 +-
 drivers/gpu/host1x/fence.c                    | 14 ++--
 include/linux/dma-fence.h                     | 35 +++-------
 21 files changed, 123 insertions(+), 139 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index c74ac197d5fe..1022b08c9b42 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -67,7 +67,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 		dma_fence_put(&array->base);
 }
 
-static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
+static void dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
 	struct dma_fence_array_cb *cb = array->callbacks;
@@ -92,12 +92,11 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 			dma_fence_put(&array->base);
 			if (atomic_dec_and_test(&array->num_pending)) {
 				dma_fence_array_clear_pending_error(array);
-				return false;
+				dma_fence_signal(&array->base);
+				return;
 			}
 		}
 	}
-
-	return true;
 }
 
 static bool dma_fence_array_signaled(struct dma_fence *fence)
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 9663ba1bb6ac..f56baa214a6c 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -9,7 +9,7 @@
 
 #include <linux/dma-fence-chain.h>
 
-static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
+static void dma_fence_chain_enable_signaling(struct dma_fence *fence);
 
 /**
  * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
@@ -125,10 +125,7 @@ static void dma_fence_chain_irq_work(struct irq_work *work)
 
 	chain = container_of(work, typeof(*chain), work);
 
-	/* Try to rearm the callback */
-	if (!dma_fence_chain_enable_signaling(&chain->base))
-		/* Ok, we are done. No more unsignaled fences left */
-		dma_fence_signal(&chain->base);
+	dma_fence_chain_enable_signaling(&chain->base);
 	dma_fence_put(&chain->base);
 }
 
@@ -142,7 +139,7 @@ static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	dma_fence_put(f);
 }
 
-static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
+static void dma_fence_chain_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_chain *head = to_dma_fence_chain(fence);
 
@@ -153,12 +150,12 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 		dma_fence_get(f);
 		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
 			dma_fence_put(fence);
-			return true;
+			return;
 		}
 		dma_fence_put(f);
 	}
 	dma_fence_put(&head->base);
-	return false;
+	dma_fence_signal(fence);
 }
 
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 325a263ac798..f0084a7aeebe 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -509,7 +509,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	__dma_fence_might_wait();
 
-	dma_fence_enable_sw_signaling(fence);
+	dma_fence_enable_signaling(fence);
 
 	trace_dma_fence_wait_start(fence);
 	if (fence->ops->wait)
@@ -576,47 +576,30 @@ void dma_fence_free(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_free);
 
-static bool __dma_fence_enable_signaling(struct dma_fence *fence)
+/**
+ * dma_fence_enable_signaling - tell implementation that fence must signal
+ * @fence: the fence to enable
+ *
+ * This will request for signaling to be enabled, to make the fence complete
+ * as soon as possible. This calls &dma_fence_ops.enable_signaling internally.
+ */
+void dma_fence_enable_signaling(struct dma_fence *fence)
 {
 	bool was_set;
 
-	lockdep_assert_held(fence->lock);
-
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
 
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return false;
+		return;
 
 	if (!was_set && fence->ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
-		if (!fence->ops->enable_signaling(fence)) {
-			dma_fence_signal_locked(fence);
-			return false;
-		}
+		fence->ops->enable_signaling(fence);
 	}
-
-	return true;
-}
-
-/**
- * dma_fence_enable_sw_signaling - enable signaling on fence
- * @fence: the fence to enable
- *
- * This will request for sw signaling to be enabled, to make the fence
- * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
- * internally.
- */
-void dma_fence_enable_sw_signaling(struct dma_fence *fence)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(fence->lock, flags);
-	__dma_fence_enable_signaling(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
 }
-EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
+EXPORT_SYMBOL(dma_fence_enable_signaling);
 
 /**
  * dma_fence_add_callback - add a callback to be called when the fence
@@ -644,29 +627,30 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 			   dma_fence_func_t func)
 {
 	unsigned long flags;
-	int ret = 0;
 
 	if (WARN_ON(!fence || !func))
 		return -EINVAL;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		INIT_LIST_HEAD(&cb->node);
-		return -ENOENT;
-	}
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		goto out_signaled;
+
+	dma_fence_enable_signaling(fence);
 
 	spin_lock_irqsave(fence->lock, flags);
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		goto out_unlock;
 
-	if (__dma_fence_enable_signaling(fence)) {
-		cb->func = func;
-		list_add_tail(&cb->node, &fence->cb_list);
-	} else {
-		INIT_LIST_HEAD(&cb->node);
-		ret = -ENOENT;
-	}
+	cb->func = func;
+	list_add_tail(&cb->node, &fence->cb_list);
+	spin_unlock_irqrestore(fence->lock, flags);
+	return 0;
 
+out_unlock:
 	spin_unlock_irqrestore(fence->lock, flags);
 
-	return ret;
+out_signaled:
+	INIT_LIST_HEAD(&cb->node);
+	return -ENOENT;
 }
 EXPORT_SYMBOL(dma_fence_add_callback);
 
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e4..455f6f6c3b90 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -85,7 +85,7 @@ static int sanitycheck(void *arg)
 
 	chain = mock_chain(NULL, f, 1);
 	if (chain)
-		dma_fence_enable_sw_signaling(chain);
+		dma_fence_enable_signaling(chain);
 	else
 		err = -ENOMEM;
 
@@ -146,7 +146,7 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 
 		fc->tail = fc->chains[i];
 
-		dma_fence_enable_sw_signaling(fc->chains[i]);
+		dma_fence_enable_signaling(fc->chains[i]);
 	}
 
 	fc->chain_length = i;
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index f0cee984b6c7..1a6cef01fda9 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -102,7 +102,7 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	array = mock_array(1, f);
 	if (!array)
@@ -126,7 +126,7 @@ static int unwrap_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -134,7 +134,7 @@ static int unwrap_array(void *arg)
 		return -ENOMEM;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	array = mock_array(2, f1, f2);
 	if (!array)
@@ -170,7 +170,7 @@ static int unwrap_chain(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -178,7 +178,7 @@ static int unwrap_chain(void *arg)
 		return -ENOMEM;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	chain = mock_chain(f1, f2);
 	if (!chain)
@@ -214,7 +214,7 @@ static int unwrap_chain_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -222,7 +222,7 @@ static int unwrap_chain_array(void *arg)
 		return -ENOMEM;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	array = mock_array(2, f1, f2);
 	if (!array)
@@ -262,7 +262,7 @@ static int unwrap_merge(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -270,7 +270,7 @@ static int unwrap_merge(void *arg)
 		goto error_put_f1;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
@@ -314,13 +314,13 @@ static int unwrap_merge_complex(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2)
 		goto error_put_f1;
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3)
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 6a1bfcd0cc21..eb740b4fe4fe 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -102,7 +102,7 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
@@ -119,7 +119,7 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_is_signaled(f)) {
 		pr_err("Fence unexpectedly signaled on creation\n");
@@ -194,7 +194,7 @@ static int test_late_add_callback(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 
@@ -288,7 +288,7 @@ static int test_status(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_get_status(f)) {
 		pr_err("Fence unexpectedly has signaled status on creation\n");
@@ -316,7 +316,7 @@ static int test_error(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_set_error(f, -EIO);
 
@@ -347,7 +347,7 @@ static int test_wait(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
@@ -391,7 +391,7 @@ static int test_wait_timeout(void *arg)
 	if (!wt.f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(wt.f);
+	dma_fence_enable_signaling(wt.f);
 
 	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
@@ -472,7 +472,7 @@ static int thread_signal_callback(void *arg)
 			break;
 		}
 
-		dma_fence_enable_sw_signaling(f1);
+		dma_fence_enable_signaling(f1);
 
 		rcu_assign_pointer(t->fences[t->id], f1);
 		smp_wmb();
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 15dbea1462ed..f030b43ee4da 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -45,7 +45,7 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
@@ -71,7 +71,7 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -118,7 +118,7 @@ static int test_for_each(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -179,7 +179,7 @@ static int test_for_each_unlocked(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -252,7 +252,7 @@ static int test_get_fences(void *arg)
 	if (!f)
 		return -ENOMEM;
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 1ef758ac5076..9ec4daa23665 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -116,24 +116,24 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
  *
  *  @f: dma_fence
  */
-static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
+static void amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
 
 	if (!fence)
-		return false;
+		return;
 
 	if (dma_fence_is_signaled(f))
-		return true;
+		return;
 
 	if (!fence->svm_bo) {
 		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
-			return true;
+			return;
 	} else {
 		if (!svm_range_schedule_evict_svm_bo(fence))
-			return true;
+			return;
 	}
-	return false;
+	dma_fence_signal(f);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 5ec293011d99..3f2425966263 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -562,7 +562,7 @@ static void enable_signaling(struct i915_active_fence *active)
 	if (!fence)
 		return;
 
-	dma_fence_enable_sw_signaling(fence);
+	dma_fence_enable_signaling(fence);
 	dma_fence_put(fence);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 519e096c607c..db4891c7cc7b 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -90,9 +90,17 @@ static bool i915_fence_signaled(struct dma_fence *fence)
 	return i915_request_completed(to_request(fence));
 }
 
-static bool i915_fence_enable_signaling(struct dma_fence *fence)
+static void i915_fence_enable_signaling(struct dma_fence *fence)
 {
-	return i915_request_enable_breadcrumb(to_request(fence));
+	struct i915_request *rq = to_request(fence);
+	unsigned long flags;
+	bool ret;
+
+	spin_lock_irqsave(&rq->lock, flags);
+	ret = i915_request_enable_breadcrumb(to_request(fence));
+	spin_unlock_irqrestore(&rq->lock, flags);
+	if (!ret)
+		dma_fence_signal(fence);
 }
 
 static signed long i915_fence_wait(struct dma_fence *fence,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 61d193e41f8c..1ad692a033c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -503,10 +503,11 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 	.release = nouveau_fence_release
 };
 
-static bool nouveau_fence_enable_signaling(struct dma_fence *f)
+static void nouveau_fence_enable_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	unsigned long flags;
 
 	/*
 	 * caller should have a reference on the fence,
@@ -514,6 +515,7 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 	 */
 	WARN_ON(kref_read(&fence->base.refcount) <= 1);
 
+	spin_lock_irqsave(&fctx->lock, flags);
 	if (!fctx->notify_ref++)
 		nvif_event_allow(&fctx->event);
 
@@ -523,10 +525,11 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 		dma_fence_put(&fence->base);
 		if (!--fctx->notify_ref)
 			nvif_event_block(&fctx->event);
-		return false;
+		spin_unlock_irqrestore(&fctx->lock, flags);
+		dma_fence_signal(f);
 	} else {
 		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
-		return true;
+		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index daff61586be5..fd1d617c3331 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -378,14 +378,19 @@ static bool radeon_fence_is_signaled(struct dma_fence *f)
  * to fence_queue that checks if this fence is signaled, and if so it
  * signals the fence and removes itself.
  */
-static bool radeon_fence_enable_signaling(struct dma_fence *f)
+static void radeon_fence_enable_signaling(struct dma_fence *f)
 {
 	struct radeon_fence *fence = to_radeon_fence(f);
 	struct radeon_device *rdev = fence->rdev;
+	unsigned long flags;
 
-	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq)
-		return false;
+	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq)
+	    >= fence->seq) {
+		dma_fence_signal(f);
+		return;
+	}
 
+	spin_lock_irqsave(&rdev->fence_queue.lock, flags);
 	if (down_read_trylock(&rdev->exclusive_lock)) {
 		radeon_irq_kms_sw_irq_get(rdev, fence->ring);
 
@@ -396,7 +401,9 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 		if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq) {
 			radeon_irq_kms_sw_irq_put(rdev, fence->ring);
 			up_read(&rdev->exclusive_lock);
-			return false;
+			spin_unlock_irqrestore(&rdev->fence_queue.lock, flags);
+			dma_fence_signal(f);
+			return;
 		}
 
 		up_read(&rdev->exclusive_lock);
@@ -412,7 +419,7 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 	fence->fence_wake.func = radeon_fence_check_signaled;
 	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
 	dma_fence_get(f);
-	return true;
+	spin_unlock_irqrestore(&rdev->fence_queue.lock, flags);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..9b060a82c6df 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -219,7 +219,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
-			dma_fence_enable_sw_signaling(fence);
+			dma_fence_enable_signaling(fence);
 	}
 	dma_resv_iter_end(&cursor);
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25d0c939ba31..3a1840560ef9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -495,7 +495,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
 				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence)
-			dma_fence_enable_sw_signaling(fence);
+			dma_fence_enable_signaling(fence);
 		dma_resv_iter_end(&cursor);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..77c5b16f835d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -168,7 +168,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
 }
 
-static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
+static void xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_hw_fence_irq *irq = xe_hw_fence_irq(fence);
@@ -179,8 +179,6 @@ static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 	/* SW completed (no HW IRQ) so kick handler to signal fence */
 	if (xe_hw_fence_signaled(dma_fence))
 		xe_hw_fence_irq_run(irq);
-
-	return true;
 }
 
 static void xe_hw_fence_release(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 83fbeea5aa20..963af6825875 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -56,7 +56,7 @@ preempt_fence_get_timeline_name(struct dma_fence *fence)
 	return "preempt";
 }
 
-static bool preempt_fence_enable_signaling(struct dma_fence *fence)
+static void preempt_fence_enable_signaling(struct dma_fence *fence)
 {
 	struct xe_preempt_fence *pfence =
 		container_of(fence, typeof(*pfence), base);
@@ -64,7 +64,6 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
 
 	pfence->error = q->ops->suspend(q);
 	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
-	return true;
 }
 
 static const struct dma_fence_ops preempt_fence_ops = {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 579ed31b46db..7556bc45e592 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1236,7 +1236,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 					    DMA_RESV_USAGE_BOOKKEEP);
 			dma_resv_for_each_fence_unlocked(&cursor, fence)
-				dma_fence_enable_sw_signaling(fence);
+				dma_fence_enable_signaling(fence);
 			dma_resv_iter_end(&cursor);
 
 			err = dma_resv_wait_timeout(xe_vm_resv(vm),
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 55d47450b2c6..fe2d5edac92d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -210,7 +210,7 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
 
 	trace_xe_sched_job_set_error(job);
 
-	dma_fence_enable_sw_signaling(job->fence);
+	dma_fence_enable_signaling(job->fence);
 	xe_hw_fence_irq_run(job->q->fence_irq);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3eb76d874eb2..b33636976669 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -259,7 +259,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	 */
 	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm);
 	if (wait)
-		dma_fence_enable_sw_signaling(pfence);
+		dma_fence_enable_signaling(pfence);
 
 	up_read(&vm->userptr.notifier_lock);
 
@@ -289,7 +289,7 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		--vm->preempt.num_exec_queues;
 	}
 	if (q->lr.pfence) {
-		dma_fence_enable_sw_signaling(q->lr.pfence);
+		dma_fence_enable_signaling(q->lr.pfence);
 		dma_fence_put(q->lr.pfence);
 		q->lr.pfence = NULL;
 	}
@@ -634,7 +634,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
-		dma_fence_enable_sw_signaling(fence);
+		dma_fence_enable_signaling(fence);
 	dma_resv_iter_end(&cursor);
 
 	err = dma_resv_wait_timeout(xe_vm_resv(vm),
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 139ad1afd935..0581aa23cd41 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -30,12 +30,17 @@ static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
 	return container_of(f, struct host1x_syncpt_fence, base);
 }
 
-static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
+static void host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+	unsigned long flags;
 
-	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
-		return false;
+	spin_lock_irqsave(f->lock, flags);
+	if (host1x_syncpt_is_expired(sf->sp, sf->threshold)) {
+		spin_unlock_irqrestore(f->lock, flags);
+		dma_fence_signal(f);
+		return;
+	}
 
 	/* Reference for interrupt path. */
 	dma_fence_get(f);
@@ -62,8 +67,7 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	 * so we need to initialize all state used by signalling
 	 * before it.
 	 */
-
-	return true;
+	spin_unlock_irqrestore(f->lock, flags);
 }
 
 static const struct dma_fence_ops host1x_syncpt_fence_ops = {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..93b6176bbf48 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -158,39 +158,24 @@ struct dma_fence_ops {
 	/**
 	 * @enable_signaling:
 	 *
-	 * Enable software signaling of fence.
+	 * Guarantee that installed callbacks are called at some point.
 	 *
-	 * For fence implementations that have the capability for hw->hw
-	 * signaling, they can implement this op to enable the necessary
-	 * interrupts, or insert commands into cmdstream, etc, to avoid these
-	 * costly operations for the common case where only hw->hw
-	 * synchronization is required.  This is called in the first
-	 * dma_fence_wait() or dma_fence_add_callback() path to let the fence
-	 * implementation know that there is another driver waiting on the
-	 * signal (ie. hw->sw case).
+	 * Drivers can implement this op to enable the necessary interrupts or
+	 * tell the hardware through other means that somebody is requesting
+	 * this fence to signal. This is called in the first dma_fence_wait()
+	 * or dma_fence_add_callback() path.
 	 *
 	 * This function can be called from atomic context, but not
 	 * from irq context, so normal spinlocks can be used.
 	 *
-	 * A return value of false indicates the fence already passed,
-	 * or some failure occurred that made it impossible to enable
-	 * signaling. True indicates successful enabling.
-	 *
-	 * &dma_fence.error may be set in enable_signaling, but only when false
-	 * is returned.
-	 *
-	 * Since many implementations can call dma_fence_signal() even when before
-	 * @enable_signaling has been called there's a race window, where the
-	 * dma_fence_signal() might result in the final fence reference being
-	 * released and its memory freed. To avoid this, implementations of this
-	 * callback should grab their own reference using dma_fence_get(), to be
-	 * released when the fence is signalled (through e.g. the interrupt
-	 * handler).
+	 * dma_fence_set_error() as well as dma_fence_signal() may be used in
+	 * enable_signaling if the implementation detects an error or that the
+	 * fence already completed succesfully.
 	 *
 	 * This callback is optional. If this callback is not present, then the
 	 * driver must always have signaling enabled.
 	 */
-	bool (*enable_signaling)(struct dma_fence *fence);
+	void (*enable_signaling)(struct dma_fence *fence);
 
 	/**
 	 * @signaled:
@@ -400,7 +385,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
 			   dma_fence_func_t func);
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
-void dma_fence_enable_sw_signaling(struct dma_fence *fence);
+void dma_fence_enable_signaling(struct dma_fence *fence);
 
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
-- 
2.34.1

