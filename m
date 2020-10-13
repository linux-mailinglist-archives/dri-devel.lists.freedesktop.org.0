Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BEC28DA2D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30A46EA05;
	Wed, 14 Oct 2020 07:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4066E903
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 17:28:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p15so409815wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOUfisstoXGjLG7B1xLKFejULL7TZhQ40jOISFOxPnU=;
 b=F6Ukqv+8YI+sJda97ZCJUyO9hIVT8bLkuxZmx1fKqz/YgLrDO+H9aG9zIA5jBCUsST
 kZ2Ybdk/YtWdYxxD+zrP7wR7LLCUokfeRQ9bKGPeqkLbJ1adEKXZGF1aPhwwtIAWE5/y
 dehHYAl4t4o6PkqQTIqxSHzQs0JE1gT7aBAUbnSvvokWVTNQzdXRxm+WKysvNfPvuhGh
 dXOziZSHKBSFVk2uNwp+dF2U/Dcg0OHWMNCwN13Dcl2ytpY9l2I/HVpRlhyCvgFqqaYT
 baCEn9vhLBP0tXKqoKxjgxaPOabfFN6hXeMUS7m2gnPZqbScz/qwc/DcD0A9NMVui6aL
 9KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOUfisstoXGjLG7B1xLKFejULL7TZhQ40jOISFOxPnU=;
 b=si9VhGw2FPHQT2alXLEZf/78ad683cdC2l3YGbo/wRUDPKSKIxvxHrJc6zfJqYYeDF
 4nc3Oi/G/aLABWYHU5GJcwa1f8JB9nDsyk6kC2gQ+Qw3GbW4kvUhB7vrpG71aL7dTi6t
 LbzW67F2O1y9TINiNF0zfh8IN+1XmPKa9Zhtja9/ynZkJGKFKbo8b7g4gUvOrxkZyakf
 twjBTueyp3sqzHRYHIRmZoywoUxqB8fK5fXvqCz9vUGlSQpyaor3J+eaVMqTIoZkJ4+h
 F83duMiIaRQti2wKtcI6Pk+33OlVxePdmqoS1X6/CVfKvsnfMGYgeu8Di8wWxTtZJtRy
 OIcQ==
X-Gm-Message-State: AOAM533/VDUlLdUF+snEvBooboQTR3k43zpOnfzMoRbo5+LDP5QtRmCa
 S4Y68e23jqmpBqqXo7sz5MvLBw==
X-Google-Smtp-Source: ABdhPJyII7msKF/kt2LYUO+vOQnrtcFfBpDhNh+hbPbyCS1UAIQk+s29Sdhn/oxOJTnZrGXrPidf3A==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr906810wmh.78.1602610119013;
 Tue, 13 Oct 2020 10:28:39 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id c14sm315131wrv.12.2020.10.13.10.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:28:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mediatek: mtk_hdmi: move 2 registers address into
 of_data
Date: Tue, 13 Oct 2020 19:28:31 +0200
Message-Id: <20201013172832.4055545-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:58 +0000
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
 Fabien Parent <fparent@baylibre.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MT8167, the two registers SYS_CFG1C and SYS_CFG20 don't have the
same address as on MT8173. Add OF data in order to store the address
of these two registers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 45 ++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a97725680d4e..c70f195c21be 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -36,6 +36,11 @@
 
 #define NCTS_BYTES	7
 
+struct mtk_hdmi_data {
+	uint32_t sys_cfg1c;
+	uint32_t sys_cfg20;
+};
+
 enum mtk_hdmi_clk_id {
 	MTK_HDMI_CLK_HDMI_PIXEL,
 	MTK_HDMI_CLK_HDMI_PLL,
@@ -146,6 +151,7 @@ struct hdmi_audio_param {
 };
 
 struct mtk_hdmi {
+	const struct mtk_hdmi_data *data;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector conn;
@@ -244,21 +250,24 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	 */
 	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
-				   hdmi->sys_offset + HDMI_SYS_CFG20,
+				   hdmi->sys_offset + hdmi->data->sys_cfg20,
 				   0x80008005, enable ? 0x80000005 : 0x8000);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
 
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_PCLK_FREE_RUN, enable ? HDMI_PCLK_FREE_RUN : 0);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_ON | ANLG_ON, enable ? (HDMI_ON | ANLG_ON) : 0);
 }
 
 static void mtk_hdmi_hw_1p4_version_enable(struct mtk_hdmi *hdmi, bool enable)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI2P0_EN, enable ? 0 : HDMI2P0_EN);
 }
 
@@ -274,12 +283,15 @@ static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
 
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_RST, HDMI_RST);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_RST, 0);
 	mtk_hdmi_clear_bits(hdmi, GRL_CFG3, CFG3_CONTROL_PACKET_DELAY);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   ANLG_ON, ANLG_ON);
 }
 
@@ -362,16 +374,19 @@ static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
 
 static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_OUT_FIFO_EN | MHL_MODE_ON, 0);
 	usleep_range(2000, 4000);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_OUT_FIFO_EN | MHL_MODE_ON, HDMI_OUT_FIFO_EN);
 }
 
 static void mtk_hdmi_hw_set_deep_color_mode(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   DEEP_COLOR_MODE_MASK | DEEP_COLOR_EN,
 			   COLOR_8BIT_MODE);
 }
@@ -1733,6 +1748,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
 
 	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
 	if (ret)
@@ -1813,8 +1829,15 @@ static int mtk_hdmi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
 			 mtk_hdmi_suspend, mtk_hdmi_resume);
 
+
+static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
+	.sys_cfg1c = HDMI_SYS_CFG1C,
+	.sys_cfg20 = HDMI_SYS_CFG20,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt8173-hdmi", },
+	{ .compatible = "mediatek,mt8173-hdmi",
+	  .data = &mt8173_hdmi_driver_data },
 	{}
 };
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
