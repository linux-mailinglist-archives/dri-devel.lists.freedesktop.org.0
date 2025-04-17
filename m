Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BDA92C26
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016C310E3B3;
	Thu, 17 Apr 2025 20:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oeCSIS3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF0010E3B3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:19:20 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-3087a704c6bso257279a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744921160; x=1745525960;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=szmwZh/snPTv0r4g4X3cMAtrvCVPEjXRIc5jf6i3HMI=;
 b=oeCSIS3P/9cXYoUFjUTEF0hKUV1UxqpsCE9EXl6eIA31UeI30dcs+tnvWH/xZGb/Oa
 OuxLJasI3tffiqo4qpMGkQiTxkC/U18q4zo8IO9WyJkfNY9Ig+xTpblxVSmF5sPoO34e
 HI74arRNZnNXGOnwVps/Kf3gnYEXe3eFzrAyfxuNZA1poazCS5vklMvQtFsdhUTJoQSG
 HGAsLpXnSU3H290x9WVtYsB4oVAefRvJfwBaXssEWvpfJW6oEIfMqSlv5ZniTzg+cSC7
 UGeE3qQqzvWpZgFrafJVhzF2Kvf87dUuVqTEKMhASsUqFkccYwfrgTlyAM3la7sGkB6v
 MkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744921160; x=1745525960;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=szmwZh/snPTv0r4g4X3cMAtrvCVPEjXRIc5jf6i3HMI=;
 b=FjRVWNU8nkNeMCX+IRgZ3ixg5RYrMNd12HITFTlkVNyeffp2FjTFgaAYqwB1mH1bj6
 Tuwv4Ea5Ea/dQQ45rfafnCDMYdnXw38kS4lV40HQg0fOCSKcufEt6aQ7t+7DNT0H6Toc
 2ZWkIppQSCRo1H73HUWK4ZaD5vvIdBFZsaTKHWKgr+Ou3f/1Y6Y17s1J/qC7+bbUFcvI
 ClkVILwXwZrx+gtmDIN8zs9SSaEjhiaEw42wpwRuaobPUQo1wbftwczCYFDDJDOw9N4P
 VG2L0URg0LVE8bpjHOws880b45cePxKw7HPcCAI0yYHiKQsCbN9cN4TOyAMw6QI6tnH+
 fwJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1fFx4lqxexWVnWISe8jrjyk1VOJ/uWbl3fBlCfG0bi4Y4sofxyz7DXWuLsBiww+d5kT+ZgZ5KkMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU0lYBXBpktYWZoNwR3WFWr30od9Tw6aXfeMfPJ6zvMxWmgfbo
 pEIrFbB8WgiQ5eCNY+aPt1USj3/FF99nYV/Vvj8DLse2msJ41LLbtjsnkt59wgXF7fnoqsKvbNR
 Guc+lHQ==
X-Google-Smtp-Source: AGHT+IHqVo64+FhTZ9ieKVGFwpqJFtKlYfDnSlq2xKJP48CFVf++acfJ/rmzTtjop5b8jMgM80+OJ2bsTKlP
X-Received: from pjbsv3.prod.google.com ([2002:a17:90b:5383:b0:308:65f7:9f24])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2809:b0:301:1c29:a1d9
 with SMTP id 98e67ed59e1d1-3087bb66b26mr432491a91.21.1744921160042; Thu, 17
 Apr 2025 13:19:20 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:19:12 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417201913.2393655-1-jyescas@google.com>
Subject: [PATCH v3] dma-buf: system_heap: Set allocation orders for larger
 page sizes
From: Juan Yescas <jyescas@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
Cc: jyescas@google.com, baohua@kernel.org, dmitry.osipenko@collabora.com, 
 jaewon31.kim@samsung.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
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

This change sets the allocation orders for the different page sizes
(4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
for large page sizes were calculated incorrectly, this caused system
heap to allocate from 2% to 4% more memory on 16KiB page size kernels.

This change was tested on 4k/16k page size kernels.

Signed-off-by: Juan Yescas <jyescas@google.com>
Acked-by: John Stultz <jstultz@google.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
---

Changes in v2:
  - Add John's Acked-by tag.
  - Add TJ's Reviewed-by tag
  - Use dma-buf: system_heap: in the subject since this is specific to the
    system heap, as per TJ.
  - Remove extra space in if statement.

Changes in v3:
  - Remove defines for the orders as per Christian.
  - Update the order array for 64k page sizes as per TJ

 drivers/dma-buf/heaps/system_heap.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..8c10c0f2b473 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -44,14 +45,28 @@ struct dma_heap_attachment {
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
 				| __GFP_COMP)
-static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
+ */
+#if (PAGE_SIZE == SZ_64K)
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP};
+/* 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB */
+static const unsigned int orders[] = {20 - PAGE_SHIFT, 0};
+#else
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
+/*
+ * 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB
+ * 64KiB allocs are calculated with (2 ^ (16 - PAGE_SHIFT)) * PAGE_SIZE = 64KiB
  */
-static const unsigned int orders[] = {8, 4, 0};
+static const unsigned int orders[] = {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};
+#endif
+
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -318,7 +333,7 @@ static struct page *alloc_largest_available(unsigned long size,
 	int i;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
-		if (size <  (PAGE_SIZE << orders[i]))
+		if (size < (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-- 
2.49.0.805.g082f7c87e0-goog

