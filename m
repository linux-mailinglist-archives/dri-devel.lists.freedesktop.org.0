Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07791530E6F
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23510EF6A;
	Mon, 23 May 2022 10:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2210EF57
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:51:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e28so20146368wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4zP6HMIa2YPzZ4Ud3UnVV9v/2WWghDZEujrnaWZbPns=;
 b=CVxXAcJ7h3wlqtwZU9H9KpppU+0u/RTKAuP4gBIGTnyBTrBe1J9DA3/oPGdgksz0xy
 GLUAXoK2K5PD5Qa5uoLYqngMrUqTrBQJ22WiVornX3mY7lg3WgNkr4opKRljcDGJ+/bZ
 bW3RuhkiUKraQUELKEkJxDdqc9nVn+Cdrp9idbZpPPJXCWSoi+iPXeHO6GRdDakV8A0+
 KEZmDMyXYpfBriNae5MHHjylHFP8Q/FOiVWpPyPtKhse51L0ASaj2EH1H/nCY3QgBzmZ
 PDdfqUyUduPQmp+OuR3gzYBUFeiFmKAZZCk6UmkCYrXc5uFd1B9NK+3wO+q7fCqOFV0R
 g8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4zP6HMIa2YPzZ4Ud3UnVV9v/2WWghDZEujrnaWZbPns=;
 b=fHz/64BeZq8YpYdd0d3gsYm0d+jHp52l/fO1/MV5oqYFNgRRrzBOTbs6jwBLwOjadQ
 uYa2dwxzg7cB5B1ak2P8rY5fizJLLKobQnhYENu6KZJhzHze9ulYUzdy30jvlmIgZydY
 XW0emnyUlMBi2vtGAWsYVBq0TL54sIl6yyuKeKCwQ5a/kg/qe8fDCySFrfCaBU51RGT2
 oClEGTHvEk5FXtNZSefWtwYGUd0HpkMuSZ6xqPpn26idCfeafdAaou4piOEvyJOuf4uF
 IN2ayIm5pgJLLPX4uE47r3rt8Rd6fjY6c+QedTdoDvwPHBGxv4dHATSe94k9GeohFA5f
 tT4g==
X-Gm-Message-State: AOAM5318h2kntqhh8kexefsRDzxKdR2BLu6qntGAmjdc7/wgoyQSpXU3
 q3uOVbZVUirC3OSZHsNnSid9zg==
X-Google-Smtp-Source: ABdhPJyQ9VeNqhjj7qlI7JhdS3acBdep+9UKDmpO3Y91brQHC2cBHqOMlHX3SGs3/FwHb18YDgbYJA==
X-Received: by 2002:a5d:6484:0:b0:20f:cc0b:e3f1 with SMTP id
 o4-20020a5d6484000000b0020fcc0be3f1mr8011615wri.237.1653303109362; 
 Mon, 23 May 2022 03:51:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:48 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 16/21] drm/meditek: dpi: Add matrix_sel helper
Date: Mon, 23 May 2022 12:47:49 +0200
Message-Id: <20220523104758.29531-17-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a mtk_dpi_matrix_sel() helper to update the DPI_MATRIX_SET
register depending on the color format.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a6b6d62a17e7..5b88a7ed5845 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -386,6 +386,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
+{
+	u32 matrix_sel = 0;
+
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
+	case MTK_DPI_COLOR_FORMAT_XV_YCC:
+		if (dpi->mode.hdisplay <= 720)
+			matrix_sel = 0x2;
+		break;
+	default:
+		break;
+	}
+	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -393,6 +412,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
@@ -400,6 +420,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index dd47dd3f2e4f..91b32dfffced 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -231,6 +231,9 @@
 #define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
 
+#define DPI_MATRIX_SET	0xB4
+#define INT_MATRIX_SEL			BIT(0)
+#define INT_MATRIX_SEL_MASK		(0x1F << 0)
 #define RGB_TO_JPEG			0x00
 #define RGB_TO_FULL709			0x01
 #define RGB_TO_BT601			0x02
-- 
2.35.1

