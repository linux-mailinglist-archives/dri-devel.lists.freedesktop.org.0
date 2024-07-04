Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA1927095
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8902E10E959;
	Thu,  4 Jul 2024 07:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1N5TTazo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4A310E973
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:30:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-710437d0affso197155a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720078217; x=1720683017; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xg0hLlO8+PF9aQb4nRdBoCDmNrfex1VFsOmkO3c71VM=;
 b=1N5TTazoV3xpGTVPUkZEtq685ZYUG9pQ2L6AgOtZ6zs+G+T6DopPZ4/ytPeu+O4dO0
 XEieZnFQkwiysGrdPZuJ61BZT5ueAjjF2WG5Zncyl4/wZzTfn8piCHPW+dxZNfo91htn
 QXL8KuZzeXd/Lwxm9uDFRytkckN8s195SftYQUYIpVWnNKyMU5G+Bo7fIIagSeBbn7Oy
 3sTxoLVLOJOGM2cKZcGGmJiTrYV78fo3VstPDGbuV5HS0oACmunv2nY9DSV8U200atpS
 js/0L/+IqF9e9Xv7fspGiiQW544vPRniI//iQtHylxxb3TZedXu70W18++lyS78tVrfT
 ukDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078217; x=1720683017;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xg0hLlO8+PF9aQb4nRdBoCDmNrfex1VFsOmkO3c71VM=;
 b=YkvLJCnhkai5yeEZ37dk6qPPl1D0UaSRCQaNqOt+5PqYxgSGNSE0KsZxiWqGCrdBOf
 lV1mURDV9xyctmQGBezJ1g7E9KOw8hg3r8yBgxutZjSMNL7Ku9k3oMzp3lyCWZkvGX0H
 W0Rx8WxHafvvJ5yfltRLDDBQxjdfXxAGvq2o//vu+w7pA+veTirrybMcTm6NZuiEQU4J
 H6ELN9y+nL268qG7+tkqGvTiO7ZfQqDRWvm3Sb8n4PXZe3PWYGLoi5juXyAiIPZGmfhB
 NldhOvV212gJcDvi/KIp6W4GD4+c6lpfiY/KMa5WwSXWIPJvAa5BDqSZ5SlBYCgMx8Z1
 vBRg==
X-Gm-Message-State: AOJu0YwsWyF1hzvkn8VXVsKwznnaVCAa+VoYvw0v3wo3sGih3HPx9bRZ
 R5GHl+LD/ekL8zyU1g/dmzlrOtMaJfQWA+KnGPpvRq3rZLlVZs03mpNbm7USyA8=
X-Google-Smtp-Source: AGHT+IETpniVgYzkLnFj0BogOQwz/7wCD/Kjlbtg/LVXdXjJlvArmj0gpZgytp1RjHa5oC0z9AuOWg==
X-Received: by 2002:a05:6a20:9187:b0:1bd:8581:2f61 with SMTP id
 adf61e73a8af0-1c0cc8d4d5bmr809458637.39.1720078216785; 
 Thu, 04 Jul 2024 00:30:16 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a8dbb2fsm7735699a12.31.2024.07.04.00.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 00:30:16 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/5] drm/panel: boe-th101mb31ig002 : Make it compatible
 with other panel.
Date: Thu,  4 Jul 2024 15:29:54 +0800
Message-Id: <20240704072958.27876-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This driver currently only applies to one panel. Modify it to be
compatible with other panels.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 763e9f8342d3..159e401ad0e6 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -17,11 +17,21 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	const struct panel_init_cmd *init_cmds;
+	unsigned int lanes;
+};
+
 struct boe_th101mb31ig002 {
 	struct drm_panel panel;
 
 	struct mipi_dsi_device *dsi;
 
+	const struct panel_desc *desc;
+
 	struct regulator *power;
 	struct gpio_desc *enable;
 	struct gpio_desc *reset;
@@ -161,7 +171,10 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->enable, 1);
 	msleep(50);
 	boe_th101mb31ig002_reset(ctx);
-	boe_th101mb31ig002_enable(panel);
+
+	ret = ctx->desc->init(ctx);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -181,6 +194,16 @@ static const struct drm_display_mode boe_th101mb31ig002_default_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static const struct panel_desc boe_th101mb31ig002_desc = {
+	.modes = &boe_th101mb31ig002_default_mode,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_th101mb31ig002_enable,
+};
+
 static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 					struct drm_connector *connector)
 {
@@ -237,6 +260,7 @@ static const struct drm_panel_funcs boe_th101mb31ig002_funcs = {
 static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct boe_th101mb31ig002 *ctx;
+	const struct panel_desc *desc;
 	int ret;
 
 	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
@@ -246,11 +270,11 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
-	dsi->lanes = 4;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_NO_EOT_PACKET |
-			  MIPI_DSI_MODE_LPM;
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	ctx->desc = desc;
 
 	ctx->power = devm_regulator_get(&dsi->dev, "power");
 	if (IS_ERR(ctx->power))
@@ -302,7 +326,9 @@ static void boe_th101mb31ig002_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id boe_th101mb31ig002_of_match[] = {
-	{ .compatible = "boe,th101mb31ig002-28a", },
+	{ .compatible = "boe,th101mb31ig002-28a",
+	  .data = &boe_th101mb31ig002_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_th101mb31ig002_of_match);
-- 
2.17.1

