Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF291A8AF11
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 06:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532A510E14A;
	Wed, 16 Apr 2025 04:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UE5DNcey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2010E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 04:35:11 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-3055f2e1486so9223355a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 21:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744778110; x=1745382910;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
 b=UE5DNceydHiq7THbfoxPMK21Q1a7S45tMfred+14zz17hljS375Ttzn5V9JpZS4wqY
 6pYizPfsKHuKr9U+LrlywrHjoW5DwNyibueYJLNvy2VfjLvVIrZ5ZCBRMLUDay4D0ezX
 wm0YOALQ0CwWY0SMH9WYMUo6JmXKdq7w4N1E5cq1vUJ2bkhctkq42xF2w1pJO94XtoEB
 SnGQ06/50j5xedrVJHce1MNVJgQwJ5nISqpkpSZrVNDjGsyTFmDhtjSQDZcmM7JL+iHU
 5UovnOyKg4M0Al8rmoov1nObACedQ5wDI3CjYyOlW/g3PZ1PxvXsIxAgnjoAKJ0oCfAH
 hjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744778110; x=1745382910;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
 b=jmK6rpMgQkYu+8oeNWcgIgyalDZLxkLrT3lTj66xbgsMb5TLh8DrstQdthMTZMnjLp
 19Ch7v15NHahJ5S1eL31IRde9I5lCJJyLH7bUDXIcJd47UemQXnaTjt4bvOjdNO26Q1O
 /wv79Ejh8m48ICWTlZfXhrdrkedpSF5SghRe7e4mkLZralZL15EdWnPnvsFfi2HnYMaf
 HYRiEsZ3uAclwMbClOP2BoZRgP+/Op7X0ZzFgWTopDfAihhiJ3LdqvhpCi1bxSpDjl1P
 CcYhI/QNM23zzwGWcIS7R5k01CYl8mt/7/yBCal9ph7l5IgI58MFjkYwz386yktnxHlI
 ylCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvrq6T1u9SVz/egZOMeRQYUND3GPcLOOe4dWOmjxrITZAHhk6Xc3A1Y3hcgli7ezT6jDZT+EMLEik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWHdd3+t2FureHTLW5FiN73iXysodFWFT625OFIWteq+WNQZEg
 nkBuaZWaC3PZQr4eBbUMWB9UrpezTYRlcPiG92i+VnLHH/lHmCp01KlqFBo4QxmUKievtuMN/p1
 2YwfqGA==
X-Google-Smtp-Source: AGHT+IG2G4ywQjj332C/QbLj2/w1uiBgiH97/ajraV5DPfnUNzqGgNveWJxxAqmA9rtK2oDi4bz8OSxgEbBN
X-Received: from pjci2.prod.google.com ([2002:a17:90a:3d82:b0:308:64af:7bb9])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17c2:b0:2ff:6af3:b5fa
 with SMTP id 98e67ed59e1d1-3086415dde8mr408227a91.22.1744778110480; Tue, 15
 Apr 2025 21:35:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 21:34:10 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416043412.956-1-jyescas@google.com>
Subject: [PATCH v2] dma-buf: system_heap: Set allocation orders for larger
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
 jaewon31.kim@samsung.com, Guangming.Cao@mediatek.com, surenb@google.com, 
 kaleshsingh@google.com
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


 drivers/dma-buf/heaps/system_heap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..ffc8f488eca6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
  */
-static const unsigned int orders[] = {8, 4, 0};
+#define ORDER_1M (20 - PAGE_SHIFT)
+#define ORDER_64K (16 - PAGE_SHIFT)
+#define ORDER_FOR_PAGE_SIZE (0)
+static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
+
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -318,7 +325,7 @@ static struct page *alloc_largest_available(unsigned long size,
 	int i;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
-		if (size <  (PAGE_SIZE << orders[i]))
+		if (size < (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-- 
2.49.0.604.gff1f9ca942-goog

