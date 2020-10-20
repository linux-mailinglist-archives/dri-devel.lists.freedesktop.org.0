Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC92948AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4AC6E97C;
	Wed, 21 Oct 2020 07:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3ED6ED90
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b127so2929547wmb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJDT7M7U/DertPjHbQd+Y+qplapGoAL1OhIVqnBxURE=;
 b=m61n/shu260RiFLmYCOqn3vOgiflYZZAgoGSbOU1Gj7R0KO30b1TFe9gEsoSLUR3/V
 mIvnJJ8cvHNP4vT1ykTljPUZqS5hWNfBRbtkw/BkDXR6U8sAx+e77RFs1huAF1INPkWU
 OszFMX+4wJr1VMdaQWYHYrrtkUMV2tnU1a+6CO+AJVTCol0l9IwUrpRyUoK7T10ioyqW
 7X3L8c6oCQZfEy/Crye6MxZ4Fw17AlwxG72CdHiqGOmJvjnaWW2IpexTquL98PVkgVv1
 5SQ3GZzKZ04XwkZISIO3bkpHJqqojqoAwN4Hf4xxpn7g3+9njPeirmkpG75HHzpHZPys
 f9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJDT7M7U/DertPjHbQd+Y+qplapGoAL1OhIVqnBxURE=;
 b=gaSQxK6XwHlhf/a/7YvuMWnUeGElJnFtanuN7Y91iwl8QM4R9Q1sa7YGVKBMKT83XI
 yZgTS57cC0enHFQ46rjvJB0HHnj3D6B3YtT+SffQlA2jSLXhhabW+l03KKMfqMeIiFCQ
 i6YajAg/rzguo1a+bKfpIFnMWJmLK2crB5f1eRLW/dcsmTN8pu9rQ5hGkCe9cWNPeNKe
 eNpFrCQRu5ub638YvEISTX+Nz/4S38k/3sMqeToX6r1sxzFpBDWhflTANpFuzl4iG475
 Ct2HkcpSqZeciGFmbAczyU2w9vxVSuiW2eHeFMHo7O2ZI+nlc0dBcbNY1yBTSHoLL/bs
 TEgA==
X-Gm-Message-State: AOAM532UJdPcEA0FhV/6KohOVfKS47VFd35yBXSDqNXBdK8vtsj/h4mS
 0bxxIqiq2BTnKV36gJopT3W/hA==
X-Google-Smtp-Source: ABdhPJyiJ1X/RENQ6UMwjnjaZvMP64TrGUC2bLTjtsjWwKG9+Q1UUxrR5oo9Xj19HjmItbczgvkGyw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
 x19mr4078470wmj.170.1603215782078; 
 Tue, 20 Oct 2020 10:43:02 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/mediatek: add disp-color MT8167 support
Date: Tue, 20 Oct 2020 19:42:48 +0200
Message-Id: <20201020174253.3757771-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
---
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
