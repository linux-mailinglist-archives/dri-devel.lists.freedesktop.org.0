Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6D4E8AAA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC8C10E597;
	Sun, 27 Mar 2022 22:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F2010E597
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so11970204wms.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=Vw1X4Y5lVyD515NEiLFa95V22KLRWSgdoITSR0BCjkY5StkoBpSinhOQfwnxA0wleD
 aHkviACkx2lXQf8Nu4082lNMVO729F9b924rICzamKBrUbBWhqbOCJt50We8bvy+sCNa
 u45slmKu49mbiiFUcL4hjlXUwNTMddzcSbd1bgu8VDFdLnpy7Te2BWHjLvNfJdbFnzLi
 hh1GZRZDDID3Ho6e7tPNHpJFoWHGHnMVJ/m3tyWpSVadNxtS/SphHBr3o95nK2qnYniR
 8rm30oqWbcNBC9jeAmOMkIFgJl9RrVBVrdF1n8qsHkXeEQS3je6Nx1VGhXhPNecFQYVH
 YPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=F7ACzDkNumUgtJa9ZmOv9PKhwppjTP5Pi0vxa7gzi5Ui3hQrS+wRu+jbgZz6CbsML4
 zHFy70Daqd2Qq9GfJlD70uFG35vwAA/fOQ84JeRiogWYMA01c8p3rNY/KvJZG42++NfB
 rZHkpVymKgbZT091VdoDmG/Pp5nI8BQPMM5SeXUEAuv4Ni/tyCnDl34tZHwPy+tfAhy0
 cxUvpiqesC1lp/lpS4Gz+X5zJuTEq7qZxBQhQHV0pNGSZeBnl4oxMGZSyCZKiaU98me9
 xjRs3eTFhoH9R9qKo7HCGG7dT6NZjrSikNbIgEh4ZEd7kb6kzoFyw4s0z810coLr2Ylf
 q1MA==
X-Gm-Message-State: AOAM530KoBlgjxwVcEayjKXl1vk/b3r8BN6uHTZx62QLeNDT8JC0Hjfr
 mN+oY85a0R+VgUeb7wKiJG2sOg==
X-Google-Smtp-Source: ABdhPJyr9nCr1C5pKgpwF1xz6b96JegOEEG0alyMX5WbHq+R8Ld7G7nR3JeuDRCJBV3mixw3fJxVKA==
X-Received: by 2002:a05:600c:1ca3:b0:38c:ccd1:bb1c with SMTP id
 k35-20020a05600c1ca300b0038cccd1bb1cmr21546319wms.199.1648420881794; 
 Sun, 27 Mar 2022 15:41:21 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:21 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 14/22] drm/mediatek: dpi: move the csc_enable bit to SoC
 config
Date: Mon, 28 Mar 2022 00:39:19 +0200
Message-Id: <20220327223927.20848-15-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add flexibility by moving the csc_enable bit to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 40254cd9d168..eb969c5c5c2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -133,6 +133,7 @@ struct mtk_dpi_conf {
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
+	u32 csc_enable_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0,
+		     dpi->conf->csc_enable_bit);
 }
 
 static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
@@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

