Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3E297D97
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19FE6E8F9;
	Sat, 24 Oct 2020 17:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2470F6F627
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 13:31:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q5so1579349wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+2yN9MeRTEf/pnT8y/kZe4gz63gE6nshqU+Yqjv0/I=;
 b=dPB4J4uq4UmIx/feUZt/6vYh5sK0pnO9jZRfvO+jfbOL6OULIEcCQo/zLlWVo0Re9T
 PBQfcFLylfMH9c5MILSk/ytseU3R6p4wywTIPUZyVJgQ5MHgJoPVLFu8CtaTvU0rpXAc
 D7dh1HC3zpOl3Elt/GbcDesudaLQ6/lmnOL7RNILjDR9Wgz6yHarIqBGxds8PD/2J8xq
 sV5IjcrI6TZlHIzo+IVQ59ohoRQDy0+YSGpB5FRAkBlBzZmITIecDJGZ++eeDV58inNr
 ofy48vywVaElIXHD/S37euH4PaLPyQ0pQEKrQRuZVsGM45I1Q9XvtFQF+Fc6t9C5AjfZ
 J+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+2yN9MeRTEf/pnT8y/kZe4gz63gE6nshqU+Yqjv0/I=;
 b=iD/i/OlAk4oAHMpQN5r29yp+XIalZ4Xsc8f36EdxXEx3/YaR7I6oYh6RdLp2JiMHC+
 iD+r+zwMIW1pxOGlSZdozPMCyiyLqqnukGEk8FlC0R9WGv5DQ3HayLNQ6YVjrj9V/V5f
 e1OsehrxwahJPZrc06Z3efAgm9aXkbS+I68XKL62TzASw1t5KTLrehx1R8n7j9II0de5
 FLMsvBo9fDcgt9nSlm1CDofyaqfchgiHQDg6YNrzuO7aftJOriqsqhZU03OuZtTbbNfr
 n9pnQ4zg6wAkPr+N0vSpe0gRqN/2nFn2iJipxfRMZmOjcV6z3/TqZJq1mGFPB0ycCyJ5
 iksw==
X-Gm-Message-State: AOAM531q3rTF95SzehoKaAq71BlgG+hdfHRCdncp9xpXmF9lwYNjylEV
 0Je3KmYApOh8xVX16/wOG9KiVg==
X-Google-Smtp-Source: ABdhPJx3cxGQumgk9TFoam7BXXLYtxG3Pzw2YD4YI6h/rEfg8EwN7KF842rzjfywLCEt05riGq4EBQ==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr2295428wmc.27.1603459899863; 
 Fri, 23 Oct 2020 06:31:39 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:39 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/mediatek: add disp-color MT8167 support
Date: Fri, 23 Oct 2020 15:31:28 +0200
Message-Id: <20201023133130.194140-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for disp-color on MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changelog:

V2: No change

 drivers/gpu/drm/mediatek/mtk_disp_color.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845b..a1227cefbf31 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -16,6 +16,7 @@
 
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
+#define DISP_COLOR_START_MT8167			0x0400
 #define DISP_COLOR_START_MT8173			0x0c00
 #define DISP_COLOR_START(comp)			((comp)->data->color_offset)
 #define DISP_COLOR_WIDTH(comp)			(DISP_COLOR_START(comp) + 0x50)
@@ -148,6 +149,10 @@ static const struct mtk_disp_color_data mt2701_color_driver_data = {
 	.color_offset = DISP_COLOR_START_MT2701,
 };
 
+static const struct mtk_disp_color_data mt8167_color_driver_data = {
+	.color_offset = DISP_COLOR_START_MT8167,
+};
+
 static const struct mtk_disp_color_data mt8173_color_driver_data = {
 	.color_offset = DISP_COLOR_START_MT8173,
 };
@@ -155,6 +160,8 @@ static const struct mtk_disp_color_data mt8173_color_driver_data = {
 static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = &mt2701_color_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-color",
+	  .data = &mt8167_color_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = &mt8173_color_driver_data},
 	{},
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
