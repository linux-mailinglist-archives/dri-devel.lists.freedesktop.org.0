Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3484E8ABA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E66910E9D2;
	Sun, 27 Mar 2022 22:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75410E597
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d7so17901880wrb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=a00oZ0zFt/UkLWjLbBa3/jFbCTFYwg2m9Y3FViz0Wi20dUXxoCDB9YnYyPfCd0MwNp
 gakNUrmY9+qo8B/AYoDZ3Ws+4zQFGZDCDugqpUOF9d80iibYqXPpuptpER2gMjOneA2s
 tGOM5g+3gOheKiGXA1hKtVT1fywSDX0ke7puAkmSD4/kVLbnAMh9m8hYtXG3PT3zHNhQ
 bs9vAKnqDF9CevtIhWXCNwiMCsNlFgbUCey6aCehtCNR1EhzicmE38C8VmVuIxa0vmjV
 G0ms8mP59Tq0tLaNQq7YU/7ICYwtTYczJ7leCPw22dzLxXNfLh/Ugo8NCn4wIwCSJUfV
 OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=AcmLuUD5b5t6h34Tz4igXcbS5kgdGqa8IKnugbt2CxJJKyhF76tNlr1QLy7dr8fT8Y
 rl6Bc2zVxxFiaYVN4DarIwrwoADLagssXOeDlDNsQ7ufcX3iuhTv0M/7PZRe4EOyP59B
 CoUtAsoAYIiKJpscH7ucBtdrbhVMLlNXrEGqcbf++v/2QHo9/6Aa7MhkeUr2gnpeOsBQ
 f8chH9KD0rSZn2zfJbpSyralZ484Aia0ceimddAvWhgYJeasxrCqOg5VSqoNn93v9dpC
 /f8IPX2gp4ek13KQPw5T6nP7gl46p6wF72BjaqRPfy/Gbf2jz5pA5xq5XYRzeKE+UarL
 K87Q==
X-Gm-Message-State: AOAM5302m1HRkoR/qnvBQQUr2cLt9sr1eVm5GddHpIz/4BxkH9T251Eq
 3LTmBcXaOOCEvBADyAiKOrXtzQ==
X-Google-Smtp-Source: ABdhPJx0D/6eRjbTNpgctrBZBOznJL+XQ5R4taW1lDFAJyQP4uqZk0fMKVrOQi3TA5P25fvp/LidkA==
X-Received: by 2002:a05:6000:2ab:b0:204:f77:c1a with SMTP id
 l11-20020a05600002ab00b002040f770c1amr19889863wry.173.1648420878388; 
 Sun, 27 Mar 2022 15:41:18 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 12/22] drm/mediatek: dpi: move swap_shift to SoC config
Date: Mon, 28 Mar 2022 00:39:17 +0200
Message-Id: <20220327223927.20848-13-granquet@baylibre.com>
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

Add flexibility by moving the swap shift value to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6eeda222a973..6d4d8c6ec47d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -131,6 +131,7 @@ struct mtk_dpi_conf {
 	u32 dimension_mask;
 	/* HSIZE and VSIZE mask (no shift) */
 	u32 hvsize_mask;
+	u32 channel_swap_shift;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 		break;
 	}
 
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf->channel_swap_shift,
+		     CH_SWAP_MASK);
 }
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
@@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

