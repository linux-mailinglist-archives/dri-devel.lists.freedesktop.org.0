Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84E4E79CC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDDA10E8D5;
	Fri, 25 Mar 2022 17:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7AE10E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i67-20020a1c3b46000000b0038ce25c870dso1296564wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=q02Yc/wGGHipHe+rqcIDczhkFTYBkCXNRcjEaizSrgSJSQk0FcBIVTvhOBAQ+15RPF
 15EnZCNGxO/rh/t5Bptvfr1UKzXfH3o68t/uFyTZbvYxkGCMctksAnUHZdxSj6Ssx5sb
 ZsWpd8V9SvZbYNVChxVyeCUJ1TvEnvNTUnKALgOwqoqKibmVvTN23VqehQN+Rnws1taU
 e6bjFfjYSBVPOjRfsB/M7W8aQ1HW6ebobxCF4cGm+oqbJb7cgl9u0ZJRn9I4Hx3sQou+
 pxi5mHjGkSf3wzIrzRLNklRbUzIyhq4YyxCGLnejv93i9TXyu3b5oP/AMswNQWByss5V
 sCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=fkC6pmXE7jOjL4uZw2tFOUv1YapzVI+zaed3be9/GWNTdHRiD+Li2FEETCuf+gmczr
 Gc8de/SoZu0ghOYQhruVpC8waAvRbhNnPVwcmIY5aYC9kCaGIwdECm9lcc8nK2xbk2EF
 oeVNTOGVJhkdfLgDu7xugV/gIcpsG/DaznG51BnwIar+HcPy7dlmc3Au0hBHpfHczUqH
 /wQhGIcRaU6mWR2boCRrZFHqr1A+TTHZhJGaAcOEt5YbYR94OQwFtUuCIsVy7U5UxmlA
 LgL/rwr6CTH9cJo6Yt6L6S1Y9g7j7QAFm2r+i+hlQglUHnxZ9GBkr/ugVdL6dyhvnoCk
 URBA==
X-Gm-Message-State: AOAM531ZW5wTUNUwPewutiA66Gm1sjWBlc6boosOdF1j3MvDfrUQPHOD
 i0XiPcp8fkyWTfWKNyfjd7EYew==
X-Google-Smtp-Source: ABdhPJwePYYbDEL3jskId8G6Vh/wDKonckD8/zRMt2PuaJN41Er7Io1HePBcu1Tfj+Zb+ttXKPbZcw==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr10822009wms.75.1648228630495; 
 Fri, 25 Mar 2022 10:17:10 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:10 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 13/22] drm/mediatek: dpi: move the yuv422_en_bit to SoC config
Date: Fri, 25 Mar 2022 18:15:02 +0100
Message-Id: <20220325171511.23493-14-granquet@baylibre.com>
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

Add flexibility by moving the yuv422 en bit to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6d4d8c6ec47d..40254cd9d168 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_conf {
 	/* HSIZE and VSIZE mask (no shift) */
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
+	u32 yuv422_en_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit : 0,
+		     dpi->conf->yuv422_en_bit);
 }
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
@@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

