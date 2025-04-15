Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54EA8A535
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 19:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8810E825;
	Tue, 15 Apr 2025 17:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gumBi5mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932DF10E131
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 17:20:53 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-73720b253fcso4411733b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744737653; x=1745342453;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZZKTzytUJ5gvm1rD+Ux7dnbHm6H7yF/Qpc+vR+tifvc=;
 b=gumBi5mviyoINq6eYVCLLT/Hnnyg7J3a1ZEs6uII8//JV4/i40jM/VVLlZBCNvvQK9
 tojEscS+7RpUbxcl9PUnJFio8+wyrHelj8lYyI83u1IdsxIaRGl2tM39fW8yg8vNtGBa
 vuthW4qp6sVpiOiT9yUmURL5V6gGTiKgN/+P4bkPQ0OOB5Iv/C+2rrKHjjFTPjxIlzve
 i5wqLPKbePlgfU/ypaJmX6gmAXlHb365pHG4ERoGeppdtv87OHsWIQBHlOVx8HqOIL0C
 hmFUz/O9XXGhlxVRrhWyKiwLK2wwrUJdyKEV23+UNJz6MxrBXEgoQEPyWwXQjpa2lE4U
 P2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744737653; x=1745342453;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZZKTzytUJ5gvm1rD+Ux7dnbHm6H7yF/Qpc+vR+tifvc=;
 b=ZmxWTkT/X76GQ4fm3zqJRPCyIPQsaocR1zJ5TulJufw6fVfWOOc2T3ItUBJ6isjD3I
 aYyCrDe1mfH5nby6zI/94ZFPuU/ZvtxnlFbdFZhMSF+hPFsMbu6LL0RbQz4abBUN9aVn
 sQ/RtE87/X/7UZoVP8RXT4HjRdpV4S+OBMRSeEjZE6LOSDh7JiXNyjy0PnUNeRT634er
 v3W0hXYH9zYe3oQJ3GvnIcO/QlBGVnPZ0MrGCKXNvVVH9ae3umnSVvGmrRDKab/H9gsL
 7LQ5WfLI4SX69w9fkzdKS7uyka1kGJRrdnVqW/+qGWoh9njVMebol7k6qbDi+bwUW3Yz
 gslQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIQTO8Y0/nEgLYahg+bbH2O4fSaj+CE5ELDxCpaeyP9DMIKQJNQUNU0NZJh4lR1EVnXtku5Gdx19w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLNzoeqVTMNOHRuWx9bmAL0A/hgP2gBRqQHX2fx/uJf2v4ngEl
 VpBKK59QhX+sTfpMXUHXvVEueY1s6LvGUWtorQ86kleYyUWuchG8pDkcGULB/GCqTA9MH+BY4gN
 /8KB/Tw==
X-Google-Smtp-Source: AGHT+IEtqmOWyc2b0VefNP8+RxTxYVwyvsPccMVCWFhQFWDyZ1nHgtQ/5h+wSOOn5ob1foG8cOMdK2s8JDAm
X-Received: from pfbga15.prod.google.com
 ([2002:a05:6a00:620f:b0:732:2279:bc82])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:9308:0:b0:736:34ca:dee2
 with SMTP id d2e1a72fcca58-73c1f8c6b5emr422992b3a.4.1744737653056; Tue, 15
 Apr 2025 10:20:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:19:53 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415171954.3970818-1-jyescas@google.com>
Subject: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
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
---
 drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..54674c02dcb4 100644
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
-- 
2.49.0.604.gff1f9ca942-goog

