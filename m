Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD40CA420A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C910E1F9;
	Thu,  4 Dec 2025 14:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dBhdM0bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37210E1F9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:59:56 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso506183f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764860395; x=1765465195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=SQkEoJ9MFKVqqKXaYJBrPLqj/enkBTJ1LhHId5TSfKc=;
 b=dBhdM0bszScwvfIQ1e6vx+tsZfrOZPitx4pTfTnOq33fXdfLY59xLUjziQJ0moqLxN
 YxUowGSussy8fVN2plTQK4Fk/JcONYoV96NnxLbsTTeTfWa5YYYSdoq1wGZQizDgNjfv
 FMHu+t1woqDuDZk+43dcyenyxvgILfpuT9kQ2zMviUFPp2QEY5d+Z8zu1PoWE/GO4i2q
 FVYYAuacHKpesMMhYCks/KjhHm8FOOZ56BlS7+bFrLkiVJ7z0WM8GSOTLuetUZyhHlnC
 9qAyYrnVFUrntpvfAuE7y2bf+o6VJhqhrq9oB16cCg+ffIOt8zxMTE1JedJAe+gSACDF
 6zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764860395; x=1765465195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQkEoJ9MFKVqqKXaYJBrPLqj/enkBTJ1LhHId5TSfKc=;
 b=FbNrqZDCR7FNOnFLi/giEe83MoRh0TOMdDYPqlYfzT29jcRsARm5kG69XaBbL77psS
 g/0t5kjHsDMKJWsGyKygmNCesr4y1yRDTrrNvyF+fxyk5gZK+jwjj35VYm2lk7G95lDe
 Enq5ADlD9yCNsDzdcBAUJSZQLa8mpvSqCOwPtopjzQ51r+VTynsXfrS/F/OF81MOJyC8
 FYreBhoZmfeWtdM1Ixdc12FWLZWWTAU5dCNiG6WLExioaredg15qZAHJybrx9U2y2jLO
 ex0w8hMP277GGNEduSFP1VvbLGftCtxqdai26a5W8sotPpZ/DgeXckZTPv0B1zKcXWw4
 VfXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL/I+QJBaVVXFLJX+AfV1mq5woupXC609c26kaVqbleagV8P3k7J0/Z5s4nUTlOaiUdSGeGYSGYag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKeeG0UeWHFSp7Lwjr9ZijaPEFKBKRWGcqcdhEueJww7ANGCI5
 Nv/RenfpCqaSdQ8qzAtngi1Y+vqX0mGefls8XmpsxFUQSXsS3Tl1KBVb
X-Gm-Gg: ASbGncu6Ov+kKosz1HXB4dx6pc/xlDdfUUn25w0P1DyVik2JLcPI8TTeNK2xK2p2Ilq
 vKMmAhFU1sPM2B9hph5jEA7heOoqTRduKhDpLq/wLFQLQW+NB4tW3ylttGtAdA+sELPm3DXp2Tj
 bMT5xfByY+1ObfgMX27CwEZpSi/wXvLIGbprgJtjGl3vAvOKfpFA+qdpm6Ls1fO3+L3ycTIc9x7
 EWT29lcKOf31QDn5SlXgcliPL9isVAXHHLzBxG3osN4CKaaMjGqFbHk7Oze7JvZDIyzoUZMpjms
 3DCGQRv568ud8+7DvW/XcAdiR6+ULSI5Fzw89Y6DzB0KBSaHLjHlbr6WmcKeko6/r2tAnhd3KPB
 rwscwUzyA2Da1H3rMaUeiIeaj+J57YNsbGQPvJIRsNWDEAX0RsuwwUja27os6hTmi3WJnDMSNY3
 ZEUTv9P24WJYLsLes9AhLa+UQ=
X-Google-Smtp-Source: AGHT+IFwu7JW/Xgfu086XVAKU85p92ZgvuSF9cmbHbDPgEySuByIW32VzQBsGlUWUivmDHHBV2Jk7A==
X-Received: by 2002:a05:6000:220b:b0:429:cbba:b246 with SMTP id
 ffacd0b85a97d-42f794b35a0mr3950582f8f.0.1764860394438; 
 Thu, 04 Dec 2025 06:59:54 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1591:1600:c95:ff70:a9ae:a00c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm3473291f8f.31.2025.12.04.06.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 06:59:53 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
Subject: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
Date: Thu,  4 Dec 2025 15:59:51 +0100
Message-ID: <20251204145952.7052-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
---
 drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..8c4afd360b72 100644
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
@@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
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
+		sg_set_page(to_sg, NULL, 0, 0);
+                sg_dma_address(to_sg) = sg_dma_address(from_sg);
+                sg_dma_len(to_sg) = sg_dma_len(from_sg);
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
@@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0

