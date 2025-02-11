Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB8A3116C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D386A10E710;
	Tue, 11 Feb 2025 16:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMTog9yQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240710E703
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:31:19 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5de6e26d4e4so5641391a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739291478; x=1739896278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MxattA3QjQC0bUvmIjtYp3+w3vcxByTR3qghr1+qO3E=;
 b=KMTog9yQ7lT31mNbb8l/cuN/KR9LE63K6mpKI45MiVU2VF55yK4meGLcJdz+tTfW7W
 y66BoG4IKayO3hMVX0P8/djBhUomRJm8G5i8kW2S7/i9chLQMHJ9nDbzED8DXB531JEH
 EjiJyDB80RCpX20zYMECsYi/Lc6ds4pYimAVNNR78HGZD5gBMkJDBZiG3OC5tqUkohOF
 +DFYfdB9kLPT7JHXGKAfQQt0SVHebkNLvzQXUQlG2mK/y/s7IHswI/BK5Y48G3Y20MGb
 o053ImnATtTvzHqwFmaIRgrbhLRbOCPcqzJfrmPptoBg3WMRiFaPNOZsgI1T22vlVMfq
 va4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291478; x=1739896278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxattA3QjQC0bUvmIjtYp3+w3vcxByTR3qghr1+qO3E=;
 b=VpoJ3jAcMSboxJm/HlJ8YewJynF/AVWEtNHKBv0UY9N3di6doou/eDCmGY0pigbpE0
 5CZ3tDC4aSBvgwteBw7bA/cSfLGTj3HwYt0t0fRZPAwVdRQb3wTkJz8t4ZgV18OGISng
 wFuBJYPJ/JzdXVItXXluv4A3MEcGVCJUzbOZksPLoAXtO0RQnooizoEyZe1ETlrT/1A2
 F7Jps5vH+4NcSh6ax+9BOTvSlzjJBrpiy7f4IaHQ7K8Av7egTnPYXMgjNiHVgFW6T12Q
 NOte8xg46qWqJnYNqrmwFGT9FUobKkYfb/zIte4sXiCpaR/S1GJ0u2Z92FPrGYXHuyRa
 hqiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZvnpR5pwakxiPU/nkMcPj629blO379SBDfHhQ4RuzVbf7VWJSxyKW1lGetdNRAmnThsvF7GaFwx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza4cbY2dbj9ihJj8L5ngPVbyaSokumYVwu8+b5XNWnDaKOCHff
 zGbkv7i78nATg/osP4d9Vppk9sMShjuRWO2NMqifVGwf6RxME6Ay
X-Gm-Gg: ASbGnctEr5SiVKOrwa6fc2l3EIQ/GBOORnesO7dTjZaC+QppnMOsTohcCEJQTvfprZc
 2Q3YBBxVB/2gSSOY6OoPEWxxcpzJa8FwynMHJlHwGTK+VnQjTEQjxWOs5Vt9lUhZ5mSF+A/t6q3
 dumFJA4qe5Fnfw9OdLBXcYpZxBIIGc/+A3uN9suZqhyvYUhrSG+jM6w2FdypF5/psyucrwOuoUk
 JNOefkFowfAougcVf4QzOju9mcaxyCXx8tlRcS5XC/uZkZsBh3he5h/riGMpPBcECQ0xLA31F9l
 nyGV1q65cP6nOvyXu5oAYmlyjiNZ
X-Google-Smtp-Source: AGHT+IE7lLBJbOd+ug9udhKeOc+JeGKaTO/5yCW136COcWGhRp26YaAZtFv890iY2cxKgMfZCaakVA==
X-Received: by 2002:a05:6402:42c8:b0:5dc:1289:7f1c with SMTP id
 4fb4d7f45d1cf-5de450d6951mr20693170a12.29.1739291477157; 
 Tue, 11 Feb 2025 08:31:17 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:31:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/4] dma-buf: drop caching of sg_tables
Date: Tue, 11 Feb 2025 17:31:09 +0100
Message-Id: <20250211163109.12200-5-christian.koenig@amd.com>
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

That was purely for the transition from static to dynamic dma-buf
handling and can be removed again now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c              | 34 --------------------------
 drivers/dma-buf/udmabuf.c              |  1 -
 drivers/gpu/drm/drm_prime.c            |  1 -
 drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
 include/linux/dma-buf.h                | 13 ----------
 5 files changed, 50 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 357b94a3dbaa..35221c4ddbf5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
-		    (exp_info->ops->pin || exp_info->ops->unpin)))
-		return ERR_PTR(-EINVAL);
-
 	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
 		return ERR_PTR(-EINVAL);
 
@@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		return;
 
 	dma_resv_lock(dmabuf->resv, NULL);
-
-	if (attach->sgt) {
-		mangle_sg_table(attach->sgt);
-		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
-						   attach->dir);
-
-		if (dma_buf_pin_on_map(attach))
-			dma_buf_unpin(attach);
-	}
 	list_del(&attach->node);
-
 	dma_resv_unlock(dmabuf->resv);
 
 	if (dmabuf->ops->detach)
@@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	if (attach->sgt) {
-		/*
-		 * Two mappings with different directions for the same
-		 * attachment are not allowed.
-		 */
-		if (attach->dir != direction &&
-		    attach->dir != DMA_BIDIRECTIONAL)
-			return ERR_PTR(-EBUSY);
-
-		return attach->sgt;
-	}
-
 	if (dma_buf_pin_on_map(attach)) {
 		ret = attach->dmabuf->ops->pin(attach);
 		if (ret)
@@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 	mangle_sg_table(sg_table);
 
-	if (attach->dmabuf->ops->cache_sgt_mapping) {
-		attach->sgt = sg_table;
-		attach->dir = direction;
-	}
-
 #ifdef CONFIG_DMA_API_DEBUG
 	{
 		struct scatterlist *sg;
@@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	if (attach->sgt == sg_table)
-		return;
-
 	mangle_sg_table(sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index cc7398cc17d6..2fa2c9135eac 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 }
 
 static const struct dma_buf_ops udmabuf_ops = {
-	.cache_sgt_mapping = true,
 	.map_dma_buf	   = map_udmabuf,
 	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..c284f306d597 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
-	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
 	.map_dma_buf = drm_gem_map_dma_buf,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index fe6a0b018571..c6f3be3cb914 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
-		.cache_sgt_mapping = true,
 		.attach = virtio_dma_buf_attach,
 		.detach = drm_gem_map_detach,
 		.map_dma_buf = virtgpu_gem_map_dma_buf,
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index c54ff2dda8cb..544f8f8c3f44 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -34,15 +34,6 @@ struct dma_buf_attachment;
  * @vunmap: [optional] unmaps a vmap from the buffer
  */
 struct dma_buf_ops {
-	/**
-	  * @cache_sgt_mapping:
-	  *
-	  * If true the framework will cache the first mapping made for each
-	  * attachment. This avoids creating mappings for attachments multiple
-	  * times.
-	  */
-	bool cache_sgt_mapping;
-
 	/**
 	 * @attach:
 	 *
@@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
  * @dmabuf: buffer for this attachment.
  * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
- * @sgt: cached mapping.
- * @dir: direction of cached mapping.
  * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
@@ -514,8 +503,6 @@ struct dma_buf_attachment {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	struct list_head node;
-	struct sg_table *sgt;
-	enum dma_data_direction dir;
 	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
-- 
2.34.1

