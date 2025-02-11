Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D573FA3116B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4213010E703;
	Tue, 11 Feb 2025 16:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L6dr3ptC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9FD10E719
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:31:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5de6e26d4e4so5641348a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739291477; x=1739896277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Iap7JYgTMRHbjhfQG7wI8MFuWjBZrMJp1uv8Se86XIw=;
 b=L6dr3ptCqRIEMjDAVLtzhLEue276ZhdHOR9PzVzge/Gl3X4XDE1+73xJwvvDmTpY7E
 RPX3q0KQJhTQ4tBwjSeAUhWsz8yru76UfQcG3KiFrRmof1yh8fYkul8/1m5dXkDRfL7j
 hfeF37vMFWkRxO/3rJ52fLFY8auFfrX5eaq8mp1l98RA7BS3P4ThUiOj4cVthirsfm2e
 3UW2ecSTit2hcwd00ELd45UCeZMeu9KnaTzaPyvycdxDgTcWSLF7thASvXOaNmeqVG24
 Uus/AePg2qTncTod38lq/qd334w2yQgYQ4sTAbcK1yluXBDpYpiR6eiQlBLcqxzpq05R
 Eg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291477; x=1739896277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iap7JYgTMRHbjhfQG7wI8MFuWjBZrMJp1uv8Se86XIw=;
 b=WyBi2yJNlNaLSjObTg2fpdElOGIPwye4oydJDb5qAMumV/fgQBn8Ks2j0Obpsb5ZWJ
 tySWJZJIkrPG5sv5w9SGTjhufVtOA3IKdL151XAR4MtvLygIyIbyb5g5mAxSXzLe00Fm
 lDx9ML2BtY6tNy1a/CkoRtl7VFxoQsG4Z4XDlAtt7dTXy4S6V7yVrXMPwMVce0h3I5r3
 d+jSRTTwygfOgHl+Y6gL4tsIW/Fskzhpp7zCzoZfdIObW2/DRYknjNuVILmVuzov98XV
 DFUACov75cZ4ck226EN+YDtK0s5eV9k55MLkzLr0yKRTjkLenjovGXgV7W3P1aopsIdC
 1k6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsUG+MMkB1bIFhEotERYjlsCRz4gRiKRq/iXBv5aemNPgh8iXCVxSNUb7ajy1cqCdpSBUrtnXYJgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGQgQTY/dwbC2FSwgCxnWGvtac1vL3cCvsVnkO0KM/MGoP2c/G
 tb81Y/WqWo7xB7NZ8WeBpYga8VPMfI+70wWzcpR/25wFfdVOe/xa
X-Gm-Gg: ASbGncshbLSMDmr9572vSNWGEEj7Il4cldR+UpwiQXw54JB9H9R+ZOAtcGTmFh7H8mG
 xpTetxQI9EKPADg/bfLHyNSVcOmjuuke87gcb3Nr8igLiuwu/B/iSbb6EA1RCoeXXlKmxn20LIX
 r+AyBMdFPsa84q7sKOpyIuaa4gnopUjnPCWoZBCw2lUk3gbsZGhpzDGQp10AN+9PptdoVe4TMZG
 6ZKWQtUDtd3UOjJhggflO9c0ZqIAqimohAfcGIfZmqxvorYHz/HHiUYDRsOzKZjHdTN8S7Elqa2
 6Vj8k290ZX52ZotmDqOtm0ZLRI0P
X-Google-Smtp-Source: AGHT+IGF9R9HgdOEGRm7oeMq6tll9Vr6d7qgWBF/JPebGyFBvvrkKcnRNN07e+0gFg7U8jOVOVfd1g==
X-Received: by 2002:a05:6402:321d:b0:5dc:cf9b:b048 with SMTP id
 4fb4d7f45d1cf-5de45040066mr19096031a12.1.1739291476410; 
 Tue, 11 Feb 2025 08:31:16 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:31:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/4] dma-buf: dma-buf: stop mapping sg_tables on attach
Date: Tue, 11 Feb 2025 17:31:08 +0100
Message-Id: <20250211163109.12200-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
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

As a workaround to smoothly transit from static to dynamic DMA-buf
handling we cached the sg_table on attach if dynamic handling mismatched
between exporter and importer.

Since Dmitry and Thomas cleaned that up and also documented the lock
handling we can drop this workaround now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 149 ++++++++++++++------------------------
 include/linux/dma-buf.h   |  14 ----
 2 files changed, 56 insertions(+), 107 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..357b94a3dbaa 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -782,7 +782,7 @@ static void mangle_sg_table(struct sg_table *sg_table)
 
 	/* To catch abuse of the underlying struct page by importers mix
 	 * up the bits, but take care to preserve the low SG_ bits to
-	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
+	 * not corrupt the sgt. The mixing is undone on unmap
 	 * before passing the sgt back to the exporter.
 	 */
 	for_each_sgtable_sg(sg_table, sg, i)
@@ -790,29 +790,20 @@ static void mangle_sg_table(struct sg_table *sg_table)
 #endif
 
 }
-static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
-				       enum dma_data_direction direction)
-{
-	struct sg_table *sg_table;
-	signed long ret;
-
-	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
-	if (IS_ERR_OR_NULL(sg_table))
-		return sg_table;
-
-	if (!dma_buf_attachment_is_dynamic(attach)) {
-		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
-					    DMA_RESV_USAGE_KERNEL, true,
-					    MAX_SCHEDULE_TIMEOUT);
-		if (ret < 0) {
-			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
-							   direction);
-			return ERR_PTR(ret);
-		}
-	}
 
-	mangle_sg_table(sg_table);
-	return sg_table;
+/**
+ * dma_buf_pin_on_map - check if a DMA-buf should be pinned when mapped
+ * @attach: the DMA-buf attachment to check
+ *
+ * Returns: True if a DMA-buf export provided pin/unpin callbacks and we can't
+ * use the importers move notify for some reason.
+ */
+static bool
+dma_buf_pin_on_map(struct dma_buf_attachment *attach)
+{
+	return attach->dmabuf->ops->pin &&
+		(!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) ||
+		 !attach->importer_ops);
 }
 
 /**
@@ -935,48 +926,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
-	/* When either the importer or the exporter can't handle dynamic
-	 * mappings we cache the mapping here to avoid issues with the
-	 * reservation object lock.
-	 */
-	if (dma_buf_attachment_is_dynamic(attach) !=
-	    dma_buf_is_dynamic(dmabuf)) {
-		struct sg_table *sgt;
-
-		dma_resv_lock(attach->dmabuf->resv, NULL);
-		if (dma_buf_is_dynamic(attach->dmabuf)) {
-			ret = dmabuf->ops->pin(attach);
-			if (ret)
-				goto err_unlock;
-		}
-
-		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
-		if (!sgt)
-			sgt = ERR_PTR(-ENOMEM);
-		if (IS_ERR(sgt)) {
-			ret = PTR_ERR(sgt);
-			goto err_unpin;
-		}
-		dma_resv_unlock(attach->dmabuf->resv);
-		attach->sgt = sgt;
-		attach->dir = DMA_BIDIRECTIONAL;
-	}
-
 	return attach;
 
 err_attach:
 	kfree(attach);
 	return ERR_PTR(ret);
-
-err_unpin:
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dmabuf->ops->unpin(attach);
-
-err_unlock:
-	dma_resv_unlock(attach->dmabuf->resv);
-
-	dma_buf_detach(dmabuf, attach);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 
@@ -995,16 +949,6 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
 
-static void __unmap_dma_buf(struct dma_buf_attachment *attach,
-			    struct sg_table *sg_table,
-			    enum dma_data_direction direction)
-{
-	/* uses XOR, hence this unmangles */
-	mangle_sg_table(sg_table);
-
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
-}
-
 /**
  * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
  * @dmabuf:	[in]	buffer to detach from.
@@ -1022,11 +966,12 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	dma_resv_lock(dmabuf->resv, NULL);
 
 	if (attach->sgt) {
+		mangle_sg_table(attach->sgt);
+		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
+						   attach->dir);
 
-		__unmap_dma_buf(attach, attach->sgt, attach->dir);
-
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dmabuf->ops->unpin(attach);
+		if (dma_buf_pin_on_map(attach))
+			dma_buf_unpin(attach);
 	}
 	list_del(&attach->node);
 
@@ -1058,7 +1003,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
 	struct dma_buf *dmabuf = attach->dmabuf;
 	int ret = 0;
 
-	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
+	WARN_ON(!attach->importer_ops);
 
 	dma_resv_assert_held(dmabuf->resv);
 
@@ -1081,7 +1026,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
 {
 	struct dma_buf *dmabuf = attach->dmabuf;
 
-	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
+	WARN_ON(!attach->importer_ops);
 
 	dma_resv_assert_held(dmabuf->resv);
 
@@ -1115,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 					enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
-	int r;
+	signed long ret;
 
 	might_sleep();
 
@@ -1136,29 +1081,37 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		return attach->sgt;
 	}
 
-	if (dma_buf_is_dynamic(attach->dmabuf)) {
-		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
-			r = attach->dmabuf->ops->pin(attach);
-			if (r)
-				return ERR_PTR(r);
-		}
+	if (dma_buf_pin_on_map(attach)) {
+		ret = attach->dmabuf->ops->pin(attach);
+		if (ret)
+			return ERR_PTR(ret);
 	}
 
-	sg_table = __map_dma_buf(attach, direction);
+	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
+	if (IS_ERR(sg_table))
+		goto error_unpin;
 
-	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
-	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
-		attach->dmabuf->ops->unpin(attach);
+	/*
+	 * When not providing ops the importer doesn't wait for fences either.
+	 */
+	if (!attach->importer_ops) {
+		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
+					    DMA_RESV_USAGE_KERNEL, true,
+					    MAX_SCHEDULE_TIMEOUT);
+		if (ret < 0)
+			goto error_unmap;
+	}
+	mangle_sg_table(sg_table);
 
-	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
+	if (attach->dmabuf->ops->cache_sgt_mapping) {
 		attach->sgt = sg_table;
 		attach->dir = direction;
 	}
 
 #ifdef CONFIG_DMA_API_DEBUG
-	if (!IS_ERR(sg_table)) {
+	{
 		struct scatterlist *sg;
 		u64 addr;
 		int len;
@@ -1175,6 +1128,16 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
+
+error_unmap:
+	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	sg_table = ERR_PTR(ret);
+
+error_unpin:
+	if (dma_buf_pin_on_map(attach))
+		attach->dmabuf->ops->unpin(attach);
+
+	return sg_table;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, "DMA_BUF");
 
@@ -1230,11 +1193,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (attach->sgt == sg_table)
 		return;
 
-	__unmap_dma_buf(attach, sg_table, direction);
+	mangle_sg_table(sg_table);
+	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
-	if (dma_buf_is_dynamic(attach->dmabuf) &&
-	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
-		dma_buf_unpin(attach);
+	if (dma_buf_pin_on_map(attach))
+		attach->dmabuf->ops->unpin(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, "DMA_BUF");
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..c54ff2dda8cb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -583,20 +583,6 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
-/**
- * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
- * mappings
- * @attach: the DMA-buf attachment to check
- *
- * Returns true if a DMA-buf importer wants to call the map/unmap functions with
- * the dma_resv lock held.
- */
-static inline bool
-dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
-{
-	return !!attach->importer_ops;
-}
-
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
-- 
2.34.1

