Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66274A9260C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 20:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030710E39F;
	Thu, 17 Apr 2025 18:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rphx+qg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689410E39F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 18:09:51 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-736c7d0d35aso1414677b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744913391; x=1745518191;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VieRPDeOIrrtofiVIhvIFRGmHPPN8m75t7mreV4JIzU=;
 b=rphx+qg3g1WYOB2A+IeEzFn6LzwTFBVi8KQFs3bTVE8eP5klWAN4NgBNwXeh0yV55M
 0pWnx9PNqQC4DCvSZiFnqhFQqBdSVD3jG2Tivih1xoMxGqSCfvkDteZXDnpykbcRpDkT
 DytDtyUq4Lu4FTqYEdx3OhYZfvrx3dLEcVhk9/1665hq+h7lxwQSRO3dwwDAuvRjvFi6
 YyuMJEQ9UUCY8bVPDLcmxRM+NCjFE/1847v3T9nh77J4Eq7iISU0xZCiznX43P7gjgq2
 5SnoTDih5GMq026wGK7aC4qOGnZWYsC0nn1jFWLCjgv/edw7cUGU+9mabiPtTyf0VZcO
 vgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744913391; x=1745518191;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VieRPDeOIrrtofiVIhvIFRGmHPPN8m75t7mreV4JIzU=;
 b=dwLADN6haW85pBUhm4G8LWsT9hZeXx+sj0COWSFpQzH8F6y9jTuVNvnPzrQMTCFSLe
 eUUxsG3s9JENjEMadGw5+mVKLOc2QUC1GFcapZzgoEyQm2X7AF2hwEooEd3gldmRcRpx
 /0jAQGHk3IK5TEE6Z7kZq4GAjMVGHlgGuzgaKrsg+Wx3+H3+FL/natcE1Cx5QGxxtxId
 cz8l2i4eeWSs6vYfYL+cAww1ZSbBWvKW6usq/dwUew7vxWbZKV/FUxZag2/LjLz/vdEQ
 c5qzYHV+XSMCy+jwHcGA1ekkUeVdyWjRu5nLATwhwACkQpwOWB80vxlkUiZm8Lw6sKdK
 /7rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuhmI+ozQBSlIdF0ryflWjdLG0Wra+MO60trpmomTh8itImoINujMmG+g8kdXoL591Bag41vuxEkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYpKrIC/GqVeIPYaIOpLHYo71wMl1R+0hWXMt72v0wUYPtdMUH
 j6E0WdEWfh/oU7I5zPZ1cqW/eP7CZnqNx0ELroq0wBmkDURorWYDJyJlH1qZJeqZd/8qqduAeua
 Wttm0G7J+c56Y1w==
X-Google-Smtp-Source: AGHT+IFiEqpxdk1THB5nHvZfHtFFffV9Gz5mbaspUCw4yzGR9KYpdaO0xsj+RVnwm9NlrjGZ6uNoUIW5ZLKdM/Y=
X-Received: from pfvb12.prod.google.com ([2002:a05:6a00:ccc:b0:736:7120:dd05])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:180f:b0:736:6d4d:ffa6 with SMTP id
 d2e1a72fcca58-73c267e1deamr8747874b3a.15.1744913391461; 
 Thu, 17 Apr 2025 11:09:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:09:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417180943.1559755-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: system_heap: No separate allocation for attachment
 sg_tables
From: "T.J. Mercier" <tjmercier@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

struct dma_heap_attachment is a separate allocation from the struct
sg_table it contains, but there is no reason for this. Let's use the
slab allocator just once instead of twice for dma_heap_attachment.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++-----------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..bee10c400cf0 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -35,7 +35,7 @@ struct system_heap_buffer {
 
 struct dma_heap_attachment {
 	struct device *dev;
-	struct sg_table *table;
+	struct sg_table table;
 	struct list_head list;
 	bool mapped;
 };
@@ -54,29 +54,22 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
-static struct sg_table *dup_sg_table(struct sg_table *table)
+static int dup_sg_table(struct sg_table *from, struct sg_table *to)
 {
-	struct sg_table *new_table;
-	int ret, i;
 	struct scatterlist *sg, *new_sg;
+	int ret, i;
 
-	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
-	if (!new_table)
-		return ERR_PTR(-ENOMEM);
-
-	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
-	if (ret) {
-		kfree(new_table);
-		return ERR_PTR(-ENOMEM);
-	}
+	ret = sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
+	if (ret)
+		return ret;
 
-	new_sg = new_table->sgl;
-	for_each_sgtable_sg(table, sg, i) {
+	new_sg = to->sgl;
+	for_each_sgtable_sg(from, sg, i) {
 		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
 		new_sg = sg_next(new_sg);
 	}
 
-	return new_table;
+	return 0;
 }
 
 static int system_heap_attach(struct dma_buf *dmabuf,
@@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
-	struct sg_table *table;
+	int ret;
 
 	a = kzalloc(sizeof(*a), GFP_KERNEL);
 	if (!a)
 		return -ENOMEM;
 
-	table = dup_sg_table(&buffer->sg_table);
-	if (IS_ERR(table)) {
+	ret = dup_sg_table(&buffer->sg_table, &a->table);
+	if (ret) {
 		kfree(a);
-		return -ENOMEM;
+		return ret;
 	}
 
-	a->table = table;
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
@@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dmabuf,
 	list_del(&a->list);
 	mutex_unlock(&buffer->lock);
 
-	sg_free_table(a->table);
-	kfree(a->table);
+	sg_free_table(&a->table);
 	kfree(a);
 }
 
@@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 						enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
-	struct sg_table *table = a->table;
+	struct sg_table *table = &a->table;
 	int ret;
 
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
@@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.49.0.805.g082f7c87e0-goog

