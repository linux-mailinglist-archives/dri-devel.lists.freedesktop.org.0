Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F04E79EC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8BC10E992;
	Fri, 25 Mar 2022 17:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0C10E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h23so11745176wrb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=p/bzvqcoe7xmjeGx0bzZZKr3QkGpvN1OffJqFUZIQSXRwAILqcf+RcRhigcNIVuytf
 gdMEjPWkXeWQUCajFWsp/Aue26OZT25LAtjITkO/AbC7JId1qwsj5MMxiZobBbJXcGBA
 XxelquKvDUapJkpBpWzf6hj7DWbR/IkirEcEat0Tcvi6e7sL8jfWN/dm9iVMQlYhEj1t
 dJTdtiFJv/lWnkTJ9S++ymuxEz5s8t4NoGCrjK3oSoDoFNwFQSnpE+l6ExBubJ1I/2OA
 jbh+S2ZhgOPMjLJ9Bbx4HrkzcNbX3QXmv795tI/LYBkxXIzIvObYQGo/LdNRhdXcgzE9
 xEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=g0ajLoruftYJT7XQn81+QgI/+abCJYWRneeo5OqBBygH+Z5akuI4qZZ6JY0ScV4Uhf
 YFsVh7/FsiZ+658iUryrTqlO96qpQJvQ4Jjcy/rdur53OPBNigG4SvVWe7r+EmLT0GjP
 d/wEmaBywWHtQ2tR2pZzBSg31JrJUAv+ebp2gDSJZ9YjjrJaLpfs7ucuSvlj1z3YyPcl
 1oObV7MkrntgnKpx+zoxQrNtAl+AokKQLE6BjCuiyVQtxaTtAEC76Nqww3KIliqJyRKY
 jmsUCbHCbTIZ9/pG2jykeF5WI7fZlwwrQ4mAse0Uq/6ZBOaUt23qU2psKWiedhOhCBcw
 yikg==
X-Gm-Message-State: AOAM5303qQj25CMkYclBB/OeP2JHjd+5H6JsvIF0XAvVMvarORCGClp9
 lEIPXwDvGQmaXFXiwsKBa0Y3iQ==
X-Google-Smtp-Source: ABdhPJx6jyzSTLucPsEMVBbYsGniaNIpeoyfEh/lkHKnA/tWkx4gSFEuQudHfuWGo39hyWySDlHC0A==
X-Received: by 2002:a5d:4d43:0:b0:205:9376:5d8 with SMTP id
 a3-20020a5d4d43000000b00205937605d8mr8887728wru.193.1648228632808; 
 Fri, 25 Mar 2022 10:17:12 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:12 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 14/22] drm/mediatek: dpi: move the csc_enable bit to SoC config
Date: Fri, 25 Mar 2022 18:15:03 +0100
Message-Id: <20220325171511.23493-15-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
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

