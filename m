Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780108A7052
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168C1112D2B;
	Tue, 16 Apr 2024 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rGR9RYSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54BE10F19B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:44 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a526d0b2349so289336066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282823; x=1713887623;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
 b=rGR9RYSR45I13Wp8H9pGyMHkIGaODCI9Jx9DcRM9g4o85dvIjx7wsNpyH9pud+Hx4M
 KBdcTI4vEDgSE0T3MCHTdsjQ7sDUQRE05Xv3Ubv4BWM9X1d4GotDAkIkI1SVopRPc8HX
 QahcnraKnempLRNdSNwSCtMPKM9o4Ay10/8hLAC+33ZruZKEZJtUt8XtyvhEFIymK6rQ
 SfdHAHlCFp80JXQwS6lhH+INVBqKGqrCEChkOH+MvtiGF7nqsY4WcPFx6GZPbTYIEi7I
 IgKPSRb6gGcW2XNsFWt/ID+zv4Rvlu4pqyNm+DfDD88aFcyOZFRWfXjLOZIxt3F2K1rF
 hqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282823; x=1713887623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
 b=fEyhwo5AmawlgntOeKy7TFU4/4IHFj/T0k1+Y171dnxXYPoAesVJoWfpcWfLQnt+ND
 91/JRKcJTet2qioaHANnIU19KCDwumr+St/c3aRZM5fKoqU3BEuKxmVQ/27fXYeiQyKC
 Hcoe7itKSILSEy9Kbb5reX54koLl7xVZ8y40o4PVm4HhN0JESJKXeHGLXD1I3amzYaIE
 3KHVsfaSIbXl1kbrbMny0/Xm0wsUvLfX5bqk3d4+3ug2YXFwbTaBkIeG5za1Ep5uWn4M
 vAU6M2dX8R5xzf1S2JinHq/aK41Tv6N3dlN4HVJf14eX22tY2J2hZ0BfIUIgYugODdzz
 KrdA==
X-Gm-Message-State: AOJu0Yy93Wjuq3iGVEvhLwG30fsdqoZr/aIdSycdmLugwe/eunEybMBA
 LjkyGYJ8O59FBjBvbHbjYxQxQWp35kkjcYdBJ4tseaEEp+uGqgtqG+HD8JkLr5M=
X-Google-Smtp-Source: AGHT+IHE3IMPQIqSmq6KIJpD1JErkwc/ZC6yokArJ+CPVqxWkiFzKoESqoTqA+wQ8DzRyw7HJwxPgA==
X-Received: by 2002:a17:906:815:b0:a51:ff7e:7a7 with SMTP id
 e21-20020a170906081500b00a51ff7e07a7mr7894409ejd.31.1713282823327; 
 Tue, 16 Apr 2024 08:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 16 Apr 2024 17:53:16 +0200
Subject: [PATCH v2 15/18] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-15-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=r/rf6DH3u4/RIc/AgVSnOwA+TJLknIEXoBhT9allVNg=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qMFH+7sfSqeWLXOz/HUS4LGcd89tLTKMjKVO/
 0NzGpSWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYmZD/
 92TsXLF05lBYvoV/0KqLPJzeJU4k+zDii6If4+OxnLLmQj/rTZQICYhBS+7EDJmQzZfqau6EvpxklL
 iWd4cz9FNDLn97xOw8qS6XS7a+gZdP0YKxg2ifs0+suc6UKmw//n26Hq5MhL7y1pwebRsv9RV2OqxG
 jeuC5azqD53hm3WT5KLxS3LHpH+6f63na1tFgZnY34Sevc7Q5/E9gUVCjV9K79Nh4Rj3Ai5YLtUKFE
 fUp8KD44okwab+ALRkWRrQocbXZITXD7q7+eAvwDJ+ZchHPpv9mi45qbuPIdm3CMQ0yqzy3ohLfg+I
 NbmgIpXCC9E4dry6GEbCiEGi+C4S0YSx/0skFgKVYWdMXekpAYkZXhoxPVQhXc56tiuWYxUCRo/UE1
 ARFQbEja65OF7bPPtE5ga46JcEX7AGNIC+ycAKk9TMzA5+rEyzIjAeMFydRrRwBRENYVg4/83Ji3eS
 E+uMdRQQAjxOxN6hCvuyBo8U/q+mfMAZjMz5I9J6u0nqkqeUGMBJwJMSeaKPYiljCQMnPmpjb0mdTJ
 +gOUCPWxYPVbdeNBZHFiosO1ZMDPdz3vkybZ6OnMqX3YBuuVgvBKaznDvvayRiqD0T9seflYAXLcuS
 IkqmHyuBsh9Cx/edcgOveyIcGywpSXm94jO2vKGVQpPm/LEJlbJVw/xhIAcQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..427b601309c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -230,6 +230,22 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSI0,
+};
+
+static const unsigned int mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -317,6 +333,14 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -344,6 +368,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -729,6 +755,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -793,6 +821,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8365-dpi",
+	  .data = (void *)MTK_DPI },
 	{ }
 };
 

-- 
2.25.1

