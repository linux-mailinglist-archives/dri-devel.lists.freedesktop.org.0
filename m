Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EBC4E79C9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2610E8A8;
	Fri, 25 Mar 2022 17:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE110E757
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a1so11744488wrh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eEHSj6Z+4nINe2TDPCkNf9jm6eypipKQx8L5na/Yyk=;
 b=7UtYysHnvqeWIeZMuZiEC8IPVZDMSKlAbRO5E8BytTts4xLZ4UVAs9U89uPHLnkXDR
 CZ/+ax1ln/JmF6JZgHsnGO4JO0H5YV8MQ883D1jkSlu4H+heh0+z23oteIQioUnwTH45
 nnzH6k8Yc++ina40Z3HUalg2xzJYHImxhlKh4jPdHc50J4VSluchb0fpfZD1mTnXuQ0f
 JZH+0RErOPJbq0lI9y0KPqW0djaXnkwxt+TI/fn+Ry6HRtN1yp+BMIejkA8pOf4D+it5
 0cbds2cn1eOD6gIf9Kirm+ZODdIRx9/zoEJDsMlRX+NPASqJ9Coi4ClpVlt63Y1K4NUF
 Myfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eEHSj6Z+4nINe2TDPCkNf9jm6eypipKQx8L5na/Yyk=;
 b=QicVTBmi78Kyphb/xX37zJn+CchJlgkV3wmmGux+H02T7dIz9Mik5bq/zGyF7rQRsM
 +08rlg0R3vtxb2hwm+6FjFQRyEsr0Z4m/xe/g9aLNRAsY8Xzv6LCzClWwuXrcn+JlFtC
 oxVXDwmRrTctnB0ISVQqe0qnUWYGObTLeXD0Zf5NTtiInoKjJBPl3XhwMFr61fFBlaiF
 N5Oj3QzxZV4wEa3hbwY3ZhRcd0DTtAG6dZjZZWNjkcmtO5P0pWxbABlQfQrj9dXrnPjZ
 QZ0aCSzjLn1SuVpeP65QBFsfTemntpRjqDdtNy6WmAqeuMnnRwvLjZSZGguR+h3WyEnz
 Qt6g==
X-Gm-Message-State: AOAM5334Rp5X6XAWY7ptmqN0yknsoFI4nRaWudm6dTSHNMdqyms96SqX
 uucgnBNgMTcrDjgaSK6sNtiqog==
X-Google-Smtp-Source: ABdhPJyzuPxAQnBUd0DqX9rA/COSrSXDlL45D+hPdYrqXIjWtxya//AY+dPfwxGIaXGeO3bCs3LXiw==
X-Received: by 2002:a5d:6c67:0:b0:204:ff0:87a8 with SMTP id
 r7-20020a5d6c67000000b002040ff087a8mr10162708wrz.627.1648228622001; 
 Fri, 25 Mar 2022 10:17:02 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:01 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 09/22] drm/mediatek: dpi: implement a swap_input toggle in SoC
 config
Date: Fri, 25 Mar 2022 18:14:58 +0100
Message-Id: <20220325171511.23493-10-granquet@baylibre.com>
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

Adds a bit of flexibility to support SoCs without swap_input support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 545a1337cc89..454f8563efae 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -126,6 +126,7 @@ struct mtk_dpi_conf {
 	const u32 *output_fmts;
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
+	bool swap_input_support;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
 	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, true);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	} else {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	}
 }
@@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

