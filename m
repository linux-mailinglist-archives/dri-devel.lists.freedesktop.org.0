Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88354BBB4A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296F10EE0F;
	Fri, 18 Feb 2022 14:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423310EC4B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x5so10181022wrg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
 b=AYIJhoYSI/uBVyX7bKr0EN1LMOI9DxVA+XSltqNaOrt2mARRYDaY5J64JbYiCTP7IZ
 VKDnRnXSySg9ti8q2Gdd3ZT0Wyy7ynM+UAAvTdKD8U0Tlw/rdFU0Ax+Bl31KHyQvR6J+
 ApEGo756/YXVILQcaJjKh6mpjgrnE6hH2BcxMa0PSZfAbZ1ii4qMye2ff32XGm+aMqWW
 I4JiP+ajubHk33IS1IZ3S8JjYTWhjCMn2KKcc8E9C8JUJwyz2G0tABN5GfQXUKJTkUEx
 lSLU6qH/VrjTJXGL8HJZcnUdu8gPP2xdjRyeQv76DPON8zKmYDxfu3kR4iYgimxYtDmD
 9uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
 b=gBERcL72hmDivvOdXjf/8Q+q0cSk2l+4ZjgKRUWqM88fS9cGG8SwV/rq4qHakXlyza
 D/X54QXbwXZ2lGhAYmQsr9+vnr52E/CYJj3TUCJ44Bo1KTZE0s+g/MwjnExI3dLmGfhj
 plmVeMkhTmWjacGd9WKl47oy6gzwpxaJs2JwNOSr4ETzSSG8/TKVRShadT6W6eYN2Tp5
 qrDH6wSkJNXHLcBcmQ3yVChTbb7fg1RQF0DARByhzoCWshBmVxL6Qk8Sm2VezdYIqI9N
 +fNryMPHbmhIp1uCYt9KtM+XlFKQp+FUGaoJ6ZQN5SbdEJT5SnCfz8jl+SRQn5cHyYTo
 YYlA==
X-Gm-Message-State: AOAM533NxVduQOmHBDufHFKrhOXRh2DJeMY9vwa21vhKemwN+aKPvPJB
 AqFdUzpYc3wT7pvIn6X2/88nlw==
X-Google-Smtp-Source: ABdhPJxA3E5twbEB2QJP6JHl07PRCaBz7TlkWHIbHPK96lIV8OG5te3hJNfKAZY7HiAKl5ltEPTi9Q==
X-Received: by 2002:a05:6000:1a8c:b0:1e8:88ae:f908 with SMTP id
 f12-20020a0560001a8c00b001e888aef908mr6354423wry.532.1645196183454; 
 Fri, 18 Feb 2022 06:56:23 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:23 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to board
 config
Date: Fri, 18 Feb 2022 15:54:30 +0100
Message-Id: <20220218145437.18563-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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

Add flexibility by moving the csc_enable bit to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fcf88dcd8b89d..be99399faf1bb 100644
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

