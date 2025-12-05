Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE0CA7AE4
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F25110EB20;
	Fri,  5 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aSNEkpkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8E10EB20
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 13:06:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42e29739ff1so922672f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764939966; x=1765544766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DVfNsN7bh3iXgq3RxSUScjij5i+aMl+hRz9FbAuxQEw=;
 b=aSNEkpkdvBBHDkL+7aRsbc9V2A4ERk6ApYwBkBxWrbza+bsnAObWmdkLNNgOY8zKSZ
 3xIJ+w3MCMori8klypJtjXSxv/CkND6NOzuq3vdto7EPM9Y7ciXunQ8Z5GEh9j+gXWSE
 UZlPFds3ppAV+LhQsgc+Er3p4sY56uSUbp5zIbPkGTRkmBmO4yfSa+DNyB1ilKUEm4hp
 maWpamNb9Xw7Qcx6SnmZXqglqSicLLB941EF1nnvq8NnFwLilxa25Iw4EmZBIz0LP0Cf
 GCqQu4O7hPHFZynqOpfdIHyWSDOS+hTuCN3dHE2AsXvrkZqxegBC16S8FZx/ghtaF3sk
 8Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764939966; x=1765544766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVfNsN7bh3iXgq3RxSUScjij5i+aMl+hRz9FbAuxQEw=;
 b=QxeONaEi8MfztWFOzTODSSC2FA9e4BzLbfFNIxEu9O2WQYzllSwJK0IJ2+jTK57oWM
 s3DPU+NGABm0jyNv7vmwvQEqVHyr9CcCSfptiWGMHUPr/KB0CsOdABxeriQpWiUqh/cQ
 XbBSyoZI2cPKxUiDkJVsJN/MpNqZe8HJu1puI/PrE+oWnjrUZYtw2fKAj91oauLnA3tW
 1VcdXE9i6sRNmHjbdBw3v7hi4DM86jwUOUpDybQ9szBoMcfssSk8y0bNzTmWEI0zODyN
 NR1YCEuxrY8sg3PV3MiaRJe0EP+QeOsNxYlqwpTUB9h+r2wOAB71WAIwhI3nrBhx6chF
 x8aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8D10eUisqnZx8i0idZYp5vIbBp4MBsdx8JDb2BXHRuL1TFIjTTAkWUtJ6huv0VqWVvcCtTDBqs9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDx34eBzJyGpUPsxotncmYY8WI9DFulgBStfhX6d8VmeehL9Jp
 AbVZRmHVgIbIE65wRxUBtiZYm1t4M7HR9/Bflepi5btilpit5yhjOUf6
X-Gm-Gg: ASbGncvXiQuP/N9SXpdocK1Tuuv4ZvhBid8unoXiHv+99/RPmg6fty/ef8ZvIRDqZg+
 UiIlcKb2FqGcFYk8b54YzV8wHlLMB48xwfVJW8OehvLN/HOmuC/4YGVQyKitBXUHjmZ0tRW6GZZ
 UC6QBnJX0Dcqr00U8bGm1Q1EP5czF5oEegTKOavwLyUAubwPaHg/c8yp2ILjw89iR+vc3/qljJr
 ZQcWQEDkeWzY/OF8eNyo3UHtvghuvYpC2Dk6PaeAQDvQNMZBrqMBI3gbxF2BerJ7xyA3J0buAjC
 Fr5M1xnhBSBS616/9VNMCbp7s3XXHg9b6RN1nEhcS8pe9CycOVeeL+LuyMH6iDTpWZ2+pZPHMWu
 qQOpRhl7kl/5UVgQ70/vXX5noNp7uhyZeKmhjmUj2TWpmOxToECnXqGYj4mv4fIf39E+7ZDUPtM
 6YqJlQhkQsbh4Xwoyef7I99LSa
X-Google-Smtp-Source: AGHT+IFtBVw4148B28ROMfiQyJ3if3zDxlmObifagEb/T3wEwB3hhJuIh0e0cx/amEPTzjkSpqoyJg==
X-Received: by 2002:a05:6000:2283:b0:42b:3455:e4a1 with SMTP id
 ffacd0b85a97d-42f78875c06mr8126338f8f.15.1764939965931; 
 Fri, 05 Dec 2025 05:06:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15a5:6d00:a241:8e44:3926:5306])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm8914491f8f.43.2025.12.05.05.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 05:06:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch, michael.j.ruhl@intel.com
Subject: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Date: Fri,  5 Dec 2025 14:06:03 +0100
Message-ID: <20251205130604.1582-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

This debugging hack is important to enforce the rule that importers
should *never* touch the underlying struct page of the exporter.

Instead of just mangling the page link create a copy of the sg_table
but only copy over the DMA addresses and not the pages.

This will cause a NULL pointer de-reference if the importer tries to
touch the struct page. Still quite a hack but this at least allows the
exporter to properly keeps it's sg_table intact while allowing the
DMA-buf maintainer to find and fix misbehaving importers and finally
switch over to using a different data structure in the future.

v2: improve the hack further by using a wrapper structure and explaining
the background a bit more in the commit message.
v3: fix some whitespace issues, use sg_assign_page().

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
---
 drivers/dma-buf/dma-buf.c | 74 +++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..944f4103b5cc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,12 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+/* Wrapper to hide the sg_table page link from the importer */
+struct dma_buf_sg_table_wrapper {
+	struct sg_table *original;
+	struct sg_table wrapper;
+};
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -828,21 +834,59 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-static void mangle_sg_table(struct sg_table *sg_table)
+static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
 {
-#ifdef CONFIG_DMABUF_DEBUG
-	int i;
-	struct scatterlist *sg;
-
-	/* To catch abuse of the underlying struct page by importers mix
-	 * up the bits, but take care to preserve the low SG_ bits to
-	 * not corrupt the sgt. The mixing is undone on unmap
-	 * before passing the sgt back to the exporter.
+	struct scatterlist *to_sg, *from_sg;
+	struct sg_table *from = *sg_table;
+	struct dma_buf_sg_table_wrapper *to;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return 0;
+
+	/*
+	 * To catch abuse of the underlying struct page by importers copy the
+	 * sg_table without copying the page_link and give only the copy back to
+	 * the importer.
 	 */
-	for_each_sgtable_sg(sg_table, sg, i)
-		sg->page_link ^= ~0xffUL;
-#endif
+	to = kzalloc(sizeof(*to), GFP_KERNEL);
+	if (!to)
+		return -ENOMEM;
+
+	ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
+	if (ret)
+		goto free_to;
+
+	to_sg = to->wrapper.sgl;
+	for_each_sgtable_dma_sg(from, from_sg, i) {
+		to_sg->offset = 0;
+		to_sg->length = 0;
+		sg_assign_page(to_sg, NULL);
+		sg_dma_address(to_sg) = sg_dma_address(from_sg);
+		sg_dma_len(to_sg) = sg_dma_len(from_sg);
+		to_sg = sg_next(to_sg);
+	}
 
+	to->original = from;
+	*sg_table = &to->wrapper;
+	return 0;
+
+free_to:
+	kfree(to);
+	return ret;
+}
+
+static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
+{
+	struct dma_buf_sg_table_wrapper *copy;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return;
+
+	copy = container_of(*sg_table, typeof(*copy), wrapper);
+	*sg_table = copy->original;
+	sg_free_table(&copy->wrapper);
+	kfree(copy);
 }
 
 static inline bool
@@ -1139,7 +1183,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1266,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0

