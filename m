Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62949538C13
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9BB10F450;
	Tue, 31 May 2022 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1028112177
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x17so6951101wrg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCqq60cIFpi0W5rW/stTGkbaV47iCHB38Vu44v/Je2Q=;
 b=r9ZERXT93z+iXWs30IEZqxm8a2ISlpmrexl1aU/BnE/7kGjjGr4YcPWE9vj9KVytZ7
 EXMDYWAv+Kzl5tX1Aefpo97MFGU4puqLGykM6pMvQiY+UBANlF5C/hjRyUXDjZJPi35S
 pw6uKMSt97KH4ttpx561Glm9iCRqlqrtr5Ja8WNAQgDyGwrsZUvKkQla5T9nmkLTFrlO
 5BxSh/2BNI9W+uwzbAxP9YA6YaA3Zm+uQ0cR4s7lFmZ83zmQ4DNvR1UaqcgvfJnva4Ad
 22PeNE2w+HQ7GT1F5dustciKNtdPrgQ9Y3aZm1eFQRrcwVyPCH1QEoOZkS/BH5qibec0
 IROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCqq60cIFpi0W5rW/stTGkbaV47iCHB38Vu44v/Je2Q=;
 b=DhcpegvoneFUD4apM1I+DEfbprf8hLAXWYXAq9PcNqca0UPfaPFDbaA8HBR+IyPFbn
 ibGDoFeXM0xgJYNsAvr7n5/mRdMv+2/RSbasS4eciTTfIhW6KAk3KVMw07GJlo65MCV/
 c1V6QkTzIkqBREuysKsv5KLHjGi62pBLXP6WmNOencUFxd1o/mV3BOYccuO+Dj/+1eHP
 JmOqnmGHOBIA6sMVI5xks+4lK0jLCB/ZVcs89/RpH2YubORjnxPFX/mHgdiDrQHOQpGj
 C7NQkagKIcjYeRDAs7ACD6LQr9QuXK2cnhkufBjG1u4nmxT2Cel6uguk822spDKad+fH
 9mpg==
X-Gm-Message-State: AOAM532E0UwsgkNssRNPXUMFgE5MYjddL8+ZGFjijkV1FYKeeLqW3TF4
 /SGgrbwU9Ekf3E7AhyFcCyBCUA==
X-Google-Smtp-Source: ABdhPJzjkNI9SKbyu+IPKMI7hdxzFtaOw5Wr2qt8pXhyFiGleK1poevdfJ72z/Y8dOnIezY6TauObw==
X-Received: by 2002:a05:6000:1611:b0:210:28cc:65dd with SMTP id
 u17-20020a056000161100b0021028cc65ddmr10243171wrb.700.1653941708426; 
 Mon, 30 May 2022 13:15:08 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:07 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 7/7] drm/mediatek: add MT8365 SoC support
Date: Mon, 30 May 2022 22:14:36 +0200
Message-Id: <20220530201436.902505-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 07:41:20 +0000
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6abe6bcacbdc..0a30ec75b1e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -195,6 +195,22 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -253,6 +269,13 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -490,6 +513,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -564,6 +589,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-- 
2.36.1

