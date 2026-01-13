Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC093D19D47
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2496E10E4FE;
	Tue, 13 Jan 2026 15:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G9vNgLZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F97D10E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso82864115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317693; x=1768922493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kh4R4NoxTN6O8ZSVOnnoGZ4WFA/y/AkSF1Pah5nfBcw=;
 b=G9vNgLZvZxpW/lI28afX+eoM9T7WEElepMtKNGGC0Vd990nWhVEVAgTkxDROntPXhV
 8zsZPnM5trU1t6ZtrMRStMkgZBc9WNzwRruG2hEyaBe2Fp1Fin4Up7sFV5OoGhjzotxY
 Nxfz91Vjeate6nAo0HZ/HNK/RsViXHZCG6OIVS/roxj11cVySbm8sTXZ6VahDS0X06ud
 wRVK9Od0oTwmF8alqpCiMxZQVT9lPoN38XAgpqhcEUjI8bvUDwuMdiIf/nQoaNND9j7a
 lwOVZBBo2PVKQUztL4msXsyAUgBfQXCQRJJp/koWYbVyJjTOwAK26wTWuFb4ozF7suAO
 V4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317693; x=1768922493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kh4R4NoxTN6O8ZSVOnnoGZ4WFA/y/AkSF1Pah5nfBcw=;
 b=j/RJAxccXmdX4nDKXM1WjalagsbowIgd9zQTt1rAbiE6FImn7REfRL7l0Ojxysd1zQ
 Gr+31RGcbBNKnGroWGGr3sc9LMwE7U+GERb0bxcR1tGRO0SfP6O1El5vhI5wMc5b5vWg
 pJFjrhFFYy5dY6xWO5Slc1QJZWocvftBC0eyUY7+sMQjhFoVmdAa9WWeWmafjONu3zSn
 zWmLMQW3KOy9+JdOVrYXcUdMCa+TQGtBjxhQ+6t0l9nfIlpiU02cbjmM9xwNXzbccBjI
 HWf/7cuook1OxQcPHgcoy6Nwl1t0UYflKGMzDN8FsuRoZaClo6NYj6rZAYYROgr51LHn
 gSWg==
X-Gm-Message-State: AOJu0YwncDiLSeAm6wGywYo7D5X5O0oopOJwdhkI3Bs93tWlyydAbDlv
 RjaVdH/9y25aMA8AvF9rqLfyE8ke6tcsvBXD3r6KHNfS+C1dscxETj2d
X-Gm-Gg: AY/fxX6j0YhIyaRzRVcpuvhn/TB7GmrXeZr/3HnDNvQ+j6bN4G8uKfa8maQwYBv+8pG
 Pi+xeuuKUTHaZg2fPnYpuJSSN8Dn3Tm1205Q9rY6ls/gd3nZTZJZlkUAlfajRgIe1Fubzt1wn04
 P1fXD06IFkhf/NX1c/vcWeXpdmA24d2vtB9J2VrJpfet07NJGI+3MDE7BVxZMdggLW1QAWJ7NZx
 566rNHmdHdPyVuSksfBA05e9mQ67yem/mFD/bYnPIIYWtWflSRLPlFV71JyzkUhtMWZexDIG86g
 6pnhG+BNPTm409+72P9H/PAdK8va6dPap3hLDPCRVQwdyl+82CcijDHqTWFw7TZPZDTkIBzj+uX
 fFonM80nHbOesxErYlkWrrwSL3k3KkBoCkpva7aTqDBpdTuq8cQXsntVQUk+27H+mZ5rpd3mAi/
 EkBIdlHkzQHL9VPFFUdHLmkGI=
X-Google-Smtp-Source: AGHT+IG26RRKK9tLOnfr1P5UGjcJasahHwhydtAyRSG76VM1hC4wKiopoeuRNUmlAj7q228fzPB29g==
X-Received: by 2002:a05:600c:4ed3:b0:47d:6140:3284 with SMTP id
 5b1f17b1804b1-47d88fc1df4mr232085885e9.37.1768317693073; 
 Tue, 13 Jan 2026 07:21:33 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/10] dma-buf/selftests: test RCU ops and inline lock v2
Date: Tue, 13 Jan 2026 16:16:13 +0100
Message-ID: <20260113152125.47380-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

Drop the mock_fence and the kmem_cache, instead use the inline lock and
test if the ops are properly dropped after signaling.

v2: move the RCU check to the end of the test

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence.c | 44 ++++++++--------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 5d0d9abc6e21..0d9d524d79b6 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -14,43 +14,26 @@
 
 #include "selftest.h"
 
-static struct kmem_cache *slab_fences;
-
-static struct mock_fence {
-	struct dma_fence base;
-	struct spinlock lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
-
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
 
-static void mock_fence_release(struct dma_fence *f)
-{
-	kmem_cache_free(slab_fences, to_mock_fence(f));
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.release = mock_fence_release,
 };
 
 static struct dma_fence *mock_fence(void)
 {
-	struct mock_fence *f;
+	struct dma_fence *f;
 
-	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
 	if (!f)
 		return NULL;
 
-	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
-
-	return &f->base;
+	dma_fence_init(f, &mock_ops, NULL, 0, 0);
+	return f;
 }
 
 static int sanitycheck(void *arg)
@@ -100,6 +83,11 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
+	if (rcu_dereference_protected(f->ops, true)) {
+		pr_err("Fence ops not cleared on signal\n");
+		goto err_free;
+	}
+
 	err = 0;
 err_free:
 	dma_fence_put(f);
@@ -540,19 +528,7 @@ int dma_fence(void)
 		SUBTEST(test_stub),
 		SUBTEST(race_signal_callback),
 	};
-	int ret;
 
 	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
-
-	slab_fences = KMEM_CACHE(mock_fence,
-				 SLAB_TYPESAFE_BY_RCU |
-				 SLAB_HWCACHE_ALIGN);
-	if (!slab_fences)
-		return -ENOMEM;
-
-	ret = subtests(tests, NULL);
-
-	kmem_cache_destroy(slab_fences);
-
-	return ret;
+	return subtests(tests, NULL);
 }
-- 
2.43.0

