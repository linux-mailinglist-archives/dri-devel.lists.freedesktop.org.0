Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14887530E66
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A573210EFB2;
	Mon, 23 May 2022 10:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6A110EE9F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:50:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h5so19621120wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJFzCnziuzO8gtG7cVYt2h81Bi7LdQGE5xz4NqwQAZE=;
 b=EsuvaRpaBPjPspnZmyIitQ4illZAHjDrYUY/jr4vxohXj4mPgY3qtmv9bS9Oo0qG5T
 hTJpkQvVCGLVdr1OcwzZhoIfF+HSnNP6SUWuqf+HesSrcXkNxGfzZ6p3EmGmMKygMI5s
 aaZtv2av4kcC3zTncyiioTxeMZoxtYEeMTiNTAdrnKO/2gkPtCZs1ZaBzAteiUKx+z+d
 CeYX6k/SwCuMf4e5i7JjgAYx3VejfDYpYa7k/cBJHyVWUSXpt+rN223HFIgPxEQN4Tyf
 Vq1h4FdTef/lIcUdUs3FUVOWCle7fD5L9LVHFEfD6INqpKXdFzK5KfHtoPFQ/cFN9baa
 r8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJFzCnziuzO8gtG7cVYt2h81Bi7LdQGE5xz4NqwQAZE=;
 b=aP+2QHeNkiyWPhryAe3KtbiHtabx4Ur8OUYps9gB8AZoqtxigusO067lA+c8wP3ZoN
 FThfVL7c3J4Sk7VMJLLl/EVmWKwQtMn0QLpH589XXZ0pMYBcSm4lthZMe3xAQL8X4suW
 FY9+nB9AHUMKd09soWVfuXHPaaBBF2SlQkfmrGKTb9Vg4R5olWDaLIkM7bu/h+3k4Aak
 UrO4HyiZ0HBJKsdXua8GjyFe6TReHGKzIO3uRK4tnfBBX/xUIWvraeKKchhFDZitF1ri
 MuGSLBLsTnNkxDje+4ifTLJtMsSKZ3Abs9lJQa/2k7yYxcppBOVfIVxm+4D7NgUt2jov
 ldjw==
X-Gm-Message-State: AOAM531hS7HKQRSf0J9wjra6hxYZG7ZKyZW+Q8MMTQpXsMdGP9nqGGpy
 r7KpRdyKan/3+l0gyJX1fImgpw==
X-Google-Smtp-Source: ABdhPJywDF5lfl2vLEx1Py2Iar0foyNQXqONIrWsCZKNHCX7kA/yZcJf7V5i1heCUswQIbZwujRe6w==
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr1598325wrc.315.1653303050201; 
 Mon, 23 May 2022 03:50:50 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:49 -0700 (PDT)
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
Subject: [PATCH v10 07/21] drm/mediatek: dpi: implement a CK/DE pol toggle in
 SoC config
Date: Mon, 23 May 2022 12:47:40 +0200
Message-Id: <20220523104758.29531-8-granquet@baylibre.com>
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
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a bit of flexibility to support SoCs without CK/DE pol support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4746eb342567..545a1337cc89 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,6 +125,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	bool is_ck_de_pol;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi *dpi,
 			       struct mtk_dpi_polarities *dpi_pol)
 {
 	unsigned int pol;
+	unsigned int mask;
 
-	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL) |
-	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL) |
-	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
+	mask = HSYNC_POL | VSYNC_POL;
+	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
 	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 : VSYNC_POL);
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
-		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
+	if (dpi->conf->is_ck_de_pol) {
+		mask |= CK_POL | DE_POL;
+		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
+			0 : CK_POL) |
+		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
+			0 : DE_POL);
+	}
+
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
 }
 
 static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
@@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.35.1

