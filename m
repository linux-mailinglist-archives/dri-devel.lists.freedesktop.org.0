Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCCC4E8A94
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17CE10E57B;
	Sun, 27 Mar 2022 22:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4C10E573
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so11969926wmb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrGtzUb1A9DfB89A9VTRS7pXkzrbTky760VebZOoHK0=;
 b=nmObJHIKlGNBTMMwvlFwYW7TiSTxQ6yafLkle52jgYc6NUnIqSVQrtyNmAIyWf6eBo
 TBxnhKqC/5FQeKIpYHm8akJJ8ogEQO2ynv43shcSM0ctbHP/PkfJWckcBy5EJoMvH4RT
 3lsgpUre+n8+OqJ3bJa0P5++89KraMF3bINUla2wIAbBs0I0unitIZo4VRNNPYeKIa+X
 Fr3kZWPQQTZKKjI+yJIfQS5epanI2IC5dws3OiQMwI+MSiJu59lgVAqeHz7rxOQCUPR2
 jd7pUy61rV17D8oqwOPt16YGF40QtKVze338L7Ad0tS8SVftujv/86cIDR7Btxt5FvC6
 V4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrGtzUb1A9DfB89A9VTRS7pXkzrbTky760VebZOoHK0=;
 b=KAPfYf32IvJHucR8oEFMpoNzuD8kJF/pTxzd9d6znejJNKp/vc/lz6gSL+Io8H3/g1
 2w3hQCEMgY0fTfSLt0y7JlmwkvhvoBA8ZGgFYMuN8dC3RVuHeT856x1E+AoBj3VFNHGi
 rQ8sJ0Q1Bi6/c6X+lIIOlU8hg6DHXOYqf9hTRZ0ueKBnm/6tNUFPAfF1BSOKzV9zTiSd
 KXC6DrMzLZasKyMTKwaof/TftvySV/OMAkpd3C6rFpLBS4viyFNxysULD+K1BRmK0TO1
 /CDr7kEnjYdy7w8aCB70r54lF2+5CLCDjjwH7Hj+3rzZsnHvPKxSgeXWJnShUk4iZI+1
 aRdg==
X-Gm-Message-State: AOAM530ZsVyDzR1hF7LFruiiSf7xnveTQpAYHEj9hQEZ4opDXeAGgAs1
 vQTSZ79BAwHPn0K2nscXO+WFWA==
X-Google-Smtp-Source: ABdhPJztkpH7scsImy127M0tUVR1En1g0GcbPja0lbTYX/ysAYwydD6If5XS+yVpB/dUzbzhuWfZTw==
X-Received: by 2002:a05:600c:590:b0:38c:804e:4197 with SMTP id
 o16-20020a05600c059000b0038c804e4197mr22144503wmd.22.1648420869579; 
 Sun, 27 Mar 2022 15:41:09 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:09 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 07/22] drm/mediatek: dpi: move dpi limits to SoC config
Date: Mon, 28 Mar 2022 00:39:12 +0200
Message-Id: <20220327223927.20848-8-granquet@baylibre.com>
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

Add flexibility by moving the dpi limits to the SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4554e2de1430..4746eb342567 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,6 +125,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	const struct mtk_dpi_yc_limit *limit;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -235,9 +236,10 @@ static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
 }
 
-static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
-					 struct mtk_dpi_yc_limit *limit)
+static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
 {
+	const struct mtk_dpi_yc_limit *limit = dpi->conf->limit;
+
 	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
 		     Y_LIMINT_BOT_MASK);
 	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
@@ -449,7 +451,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 				    struct drm_display_mode *mode)
 {
-	struct mtk_dpi_yc_limit limit;
 	struct mtk_dpi_polarities dpi_pol;
 	struct mtk_dpi_sync_param hsync;
 	struct mtk_dpi_sync_param vsync_lodd = { 0 };
@@ -484,11 +485,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
 		pll_rate, vm.pixelclock);
 
-	limit.c_bottom = 0x0010;
-	limit.c_top = 0x0FE0;
-	limit.y_bottom = 0x0010;
-	limit.y_top = 0x0FE0;
-
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
 	dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
@@ -536,7 +532,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	else
 		mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
 
-	mtk_dpi_config_channel_limit(dpi, &limit);
+	mtk_dpi_config_channel_limit(dpi);
 	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
 	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
 	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
@@ -790,12 +786,20 @@ static const u32 mt8183_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 };
 
+static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
+	.c_bottom = 0x0010,
+	.c_top = 0x0FE0,
+	.y_bottom = 0x0010,
+	.y_top = 0x0FE0,
+};
+
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -805,6 +809,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -813,6 +818,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -821,6 +827,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.34.1

