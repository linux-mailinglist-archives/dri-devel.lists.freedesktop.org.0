Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F017E73E2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 22:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342510E92D;
	Thu,  9 Nov 2023 21:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD310E929
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 21:50:16 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5869914484fso732751eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 13:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566616; x=1700171416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZXYYoZ9YXR8OaFb0rqU8J6WjFq3wVUlkQ9dvWsztWg=;
 b=KrCGNvsk/rsf2luyI0C6dLeazd0qzDJ7Hr1u0jOiCVY176U+c3O50mem7LQOYPP4Rb
 CcbmVqzjZkWpwONKJu8zxfSDA4OB07A67Zp6S4pqpayyTq5rFnDhQTl2zcN1RuWEzN8K
 bT+KnFvCKvYPNVckRyb9mHx8/qpwYcSb+J9XwTcdn/4VW9vQ2L5I4F2guGqOKtO/eedp
 70RPUPKKUEJGGFVJOa/fvhMWo4mUxfGR1srTzM85WWcgdcdRNqRWlbcfMXzkDs+zH6YB
 YPyLcoC4Us7DuvZD4t4gIaznLIDXGtV8jzNkLxEOeXOmwSQSWYYuUPvtVYFAH8ss8lA9
 3z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566616; x=1700171416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZXYYoZ9YXR8OaFb0rqU8J6WjFq3wVUlkQ9dvWsztWg=;
 b=FR+cvYepTfjRTi8l/TkNW1hBX6QkXLLGW6OJYShzR+9KzVXJj2ZjzPczQvaT16iM0P
 4qzgF62Ol8YOKPA6fYLkiqaCzRcVzclGBRXLJX/I7tlqCwG5C5Z8hxtFxKFn7dVWWNq4
 GyjB/yeAsxRs7CqCZ73LgV7L6CeRMtwB34EbDkxXBZ5VndZzzNErs+y4TXd0oVhOBddU
 jFYFBEyURm6EtnSkCTsHfLP7LrYUErqkHr4rYauFwDVutiRp1eXu6/py8vtqZOpz3pmd
 pbipWBrt6kyw9+w2dB/mrQypEoQ5vsrC9yi7kSHuBzDVtYsiRdPCidRXht2mRg9dTu+7
 DHuw==
X-Gm-Message-State: AOJu0Ywd+8BL/LLlbB3aBWbGEvv4gjkNgi9XH7bX9Gj+jDi0qUH0x1TG
 cwKxvNTmE6loWc1+AS4PTJA=
X-Google-Smtp-Source: AGHT+IEtAOh2Ri8u8l/d3qukxgFDNHa7aYcFKcebfV58wRHC8Ih0NADj5oYrY2SJCPHCMy77yPkxmQ==
X-Received: by 2002:a05:6870:9193:b0:1ea:4338:209d with SMTP id
 b19-20020a056870919300b001ea4338209dmr6168405oaf.31.1699566616026; 
 Thu, 09 Nov 2023 13:50:16 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 tp22-20020a0568718b9600b001d4d8efa7f9sm864003oab.4.2023.11.09.13.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 13:50:15 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 2/4] nv3051d: Add Powkiddy RK2023 Panel Support
Date: Thu,  9 Nov 2023 15:50:05 -0600
Message-Id: <20231109215007.66826-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109215007.66826-1-macroalpha82@gmail.com>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Refactor the driver to add support for the powkiddy,rk2023-panel
panel. This panel is extremely similar to the rg353p-panel but
requires a smaller vertical back porch and isn't as tolerant of
higher speeds. Note that while all of these panels are identical in
size (70x57) it is possible future panels may not be.

Tested on my RG351V, RG353P, RG353V, and RK2023.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 57 +++++++++++++++----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 79de6c886292..94d89ffd596b 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -28,6 +28,7 @@ struct nv3051d_panel_info {
 	unsigned int num_modes;
 	u16 width_mm, height_mm;
 	u32 bus_flags;
+	u32 mode_flags;
 };
 
 struct panel_nv3051d {
@@ -261,6 +262,8 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
 
 	usleep_range(10000, 15000);
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	regulator_disable(ctx->vdd);
 
 	return 0;
@@ -385,15 +388,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
-
-	/*
-	 * The panel in the RG351V is identical to the 353P, except it
-	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
-	 */
-	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
-		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->mode_flags = ctx->panel_info->mode_flags;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -481,16 +476,56 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
 	},
 };
 
-static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
+static const struct drm_display_mode nv3051d_rk2023_modes[] = {
+	{
+		.hdisplay       = 640,
+		.hsync_start    = 640 + 40,
+		.hsync_end      = 640 + 40 + 2,
+		.htotal         = 640 + 40 + 2 + 80,
+		.vdisplay       = 480,
+		.vsync_start    = 480 + 18,
+		.vsync_end      = 480 + 18 + 2,
+		.vtotal         = 480 + 18 + 2 + 4,
+		.clock          = 24150,
+		.flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3051d_panel_info nv3051d_rg351v_info = {
 	.display_modes = nv3051d_rgxx3_modes,
 	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
 	.width_mm = 70,
 	.height_mm = 57,
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static const struct nv3051d_panel_info nv3051d_rg353p_info = {
+	.display_modes = nv3051d_rgxx3_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
+static const struct nv3051d_panel_info nv3051d_rk2023_info = {
+	.display_modes = nv3051d_rk2023_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rk2023_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
 static const struct of_device_id newvision_nv3051d_of_match[] = {
-	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
+	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
+	{ .compatible = "anbernic,rg353p-panel", .data = &nv3051d_rg353p_info },
+	{ .compatible = "powkiddy,rk2023-panel", .data = &nv3051d_rk2023_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
-- 
2.34.1

