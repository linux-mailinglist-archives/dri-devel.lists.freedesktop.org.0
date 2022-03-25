Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10A4E79CB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8F710E76F;
	Fri, 25 Mar 2022 17:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BF210E73F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b19so11722532wrh.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
 b=6mQIlmOLDdfFl06bVDNJL4jkgT5Pifeg06GKXYSLJt9XTyK0oDRagi0sdMmJm5lP3y
 LHc7x5xyRqMHpAyxdqoXmCgBjjRYMNPig0UhqItbZWDv0hpbIYCUpJtvd/emNaq0DO0V
 d4nHKxRk7bVa6/z5sLNasuIhvwVGBYXv0K1cQcNBawazJw2yWOyv5zIdpyB1nXHZwBpK
 j+oKk89Wz8D53+r75WLm09Sp2wartFw5T9aapcs40u8OAUpYHfcxGURdwXh2K7TrJ56v
 +OiJPv+/nGARuuofLocJEn2P8K9YqOhrMeyHzl4+gugC22hbMQlP/+ZP8PjzF9NMqCMT
 DbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
 b=hh5XAP8IFYxquVwHX4fwXVaUTICw0x+X/wXxzd4SkkZt98bkZsYTU4+dNflKnHeWD4
 owYrU873cWoX+PhjueZX638mUwwsU/MQYSKSAOTDpZIjdk4MfSwTIzXC9TaAJmMgaD/p
 Jo2KoKIqRmnp0sX/KLXsw+yfHtOmb/0XQKMiY40P3A0u7LOsnGFLBbKWICP3LTryP5fh
 5GmXdZ0JMzO3nDvvpkhFMPCvnEX9iytQM8msramGSvtF440nS4xVUIJaicEIUkba1qNT
 zvfV7TpHvXPVXfJ5fOIv7GSscSZr7ZuKX2zcxcKDMZI8rbt2f2R7rnX5luZvzPA88+MM
 3gbw==
X-Gm-Message-State: AOAM531Wg3C2YSG4Ajlgtb92DOGIUxBm3eiGsbkSge+Gi5fk27k5L4Ul
 fyn8txnxs+6x6IVYKva3GmffOw==
X-Google-Smtp-Source: ABdhPJyVRn/4huKKw6y+EuOivtvJN55w2DTGfCsIXhFN27KhyJ9q5fpwb1MbnhcIyxinFhO8DC2wVQ==
X-Received: by 2002:a05:6000:1a85:b0:205:a234:d0a5 with SMTP id
 f5-20020a0560001a8500b00205a234d0a5mr4759856wry.126.1648228626249; 
 Fri, 25 Mar 2022 10:17:06 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:05 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 11/22] drm/mediatek: dpi: move hvsize_mask to SoC config
Date: Fri, 25 Mar 2022 18:15:00 +0100
Message-Id: <20220325171511.23493-12-granquet@baylibre.com>
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

Add flexibility by moving the hvsize mask to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bf098f36a466..6eeda222a973 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -129,6 +129,8 @@ struct mtk_dpi_conf {
 	bool swap_input_support;
 	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift) */
 	u32 dimension_mask;
+	/* HSIZE and VSIZE mask (no shift) */
+	u32 hvsize_mask;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
+	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+		     dpi->conf->hvsize_mask << HSIZE);
+	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+		     dpi->conf->hvsize_mask << VSIZE);
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

