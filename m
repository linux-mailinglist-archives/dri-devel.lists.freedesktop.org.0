Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8092BBBC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CCF10E55C;
	Tue,  9 Jul 2024 13:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="zgw6c9Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA79D10E55C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1faad2f1967so42252045ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532911; x=1721137711; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uMEcoi4kfATq1PQH6tKRvYV7e4/pW6GOXmmHjAZqR4A=;
 b=zgw6c9TuESMNuzAibHzKpY498XYZVm6nloZPTyE2LTbYGbAj9IqP5obEkVfs8vaasa
 o/NUK7H+/Nw9aZmtcVur8FATKk+G8+q2cux0GfrvtQIaJK0sRaoV7rDQrl7Q/1ARq/Ph
 dkXbquJ5GNwtyrUaqIEi71Il7b5yBkLVUsWhrYhxoHd2LKQm6A2tzE/ugOsQPVbXMeHE
 nydKpb7LvZ/wgnYuGPtddboLDYiproqMQvAuz9jVJN4svlRaVKSaoop6dRk6zBzQSEv0
 7UCGNlj0gDSQcBqllfwgOSeX7qA3dBDtzYeZz0wSM7kpMdMocNBZJX//i855sm53Wfwp
 iCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532911; x=1721137711;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uMEcoi4kfATq1PQH6tKRvYV7e4/pW6GOXmmHjAZqR4A=;
 b=kejZuwwR0naxW4woL+qstSC2CDFclTDj7jTBaXAZ2tLygekVLIqVJ1sFwFI2HeI8NS
 IINwJnVHb7Wg78xIqi44i0kHsQxf6l+4vzfKcB/zk4l89mD6xlBWpNG7nBr9Zqa+U0LH
 5e1jOtvPODyRgJoo4iWVmpaKYR4tvs7h9NXburC9/cGRxRMxtOmO0XhyNlu6w6EHULEj
 2g5vWMQkqy3qgXX4edrJn1i11Kh81+Y43aNRgMEbcKoA9acMRAjLq7yQFNGF3jNwV9+j
 XriH0VbBYlMoS5epWhCl2BWO4iqXIDkAXUzg7hDX2fb5zJcwl5Sw3Pl2b6XqnqnLhrlB
 cPQQ==
X-Gm-Message-State: AOJu0YwZOrxnIF3XzeEOdTELbMr+l7rBpDHdFSjPlOhoNAuN2ZfVpWjK
 WJnX4dWQGhezrOILLcfelqsRPZ1q0uj0utjyazbRp8rDxTEUxuX7CBLBNLOIWrY=
X-Google-Smtp-Source: AGHT+IErsldRGCVjJQNp++bdJGJi0KJOcV/dPRZo0OLh77MLEfFqBsbmHn5CVGSnCvabvweP9duUog==
X-Received: by 2002:a17:902:f687:b0:1f9:f3aa:fa86 with SMTP id
 d9443c01a7336-1fbb80b31d9mr35884485ad.33.1720532911116; 
 Tue, 09 Jul 2024 06:48:31 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:30 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 3/5] drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS
 functions
Date: Tue,  9 Jul 2024 21:47:52 +0800
Message-Id: <20240709134754.28013-4-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/enable/exit code.

Convert the hex in init_code from UPPERCASE to lowercase.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes between V6 and V5:
-  1. No changes.
v5: https://lore.kernel.org/all/20240704072958.27876-4-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 143 ++++++++----------
 1 file changed, 63 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index b92082bfc932..5993e6c0cc4a 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -17,11 +17,13 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct boe_th101mb31ig002;
+
 struct panel_desc {
 	const struct drm_display_mode *modes;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
-	int (*init)(struct drm_panel *panel);
+	int (*init)(struct boe_th101mb31ig002 *ctx);
 	unsigned int lanes;
 };
 
@@ -49,74 +51,61 @@ static void boe_th101mb31ig002_reset(struct boe_th101mb31ig002 *ctx)
 	usleep_range(5000, 6000);
 }
 
-static int boe_th101mb31ig002_enable(struct drm_panel *panel)
+static int boe_th101mb31ig002_enable(struct boe_th101mb31ig002 *ctx)
 {
-	struct boe_th101mb31ig002 *ctx = container_of(panel,
-						      struct boe_th101mb31ig002,
-						      panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0xAB, 0xBA);
-	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0xBA, 0xAB);
-	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x10, 0x01, 0x47, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x0C, 0x14, 0x04, 0x50, 0x50, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x56, 0x53, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x33, 0x30, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0xB0, 0x00, 0x00, 0x10, 0x00, 0x10,
-				    0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
-				    0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x7C, 0x65, 0x55, 0x49, 0x46, 0x36,
-				    0x3B, 0x24, 0x3D, 0x3C, 0x3D, 0x5C, 0x4C,
-				    0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7C,
-				    0x65, 0x55, 0x49, 0x46, 0x36, 0x3B, 0x24,
-				    0x3D, 0x3C, 0x3D, 0x5C, 0x4C, 0x55, 0x47,
-				    0x46, 0x39, 0x26, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xFF, 0x87, 0x12, 0x34, 0x44, 0x44,
-				    0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0F,
-				    0x00, 0x00, 0xC1);
-	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x54, 0x94, 0x02, 0x85, 0x9F, 0x00,
-				    0x7F, 0x00, 0x54, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
-				    0x22, 0x20, 0x44, 0xFF, 0x18, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x86, 0x46, 0x05, 0x05, 0x1C, 0x1C,
-				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
-				    0x0F, 0x0F, 0x0D, 0x0D, 0x13, 0x13, 0x11,
-				    0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x07, 0x07, 0x04, 0x04, 0x1C, 0x1C,
-				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
-				    0x0E, 0x0E, 0x0C, 0x0C, 0x12, 0x12, 0x10,
-				    0x10, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC6, 0x2A, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0xCB, 0x43);
-	mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x0E, 0x4B, 0x4B, 0x20, 0x19, 0x6B,
-				    0x06, 0xB3);
-	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0xE3, 0x2B, 0x38, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x00, 0x01, 0x00, 0x0E, 0x04, 0x44,
-				    0x08, 0x10, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x80, 0x01, 0xFF, 0xFF, 0xFF, 0xFF,
-				    0xFF, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xF0, 0x12, 0x03, 0x20, 0x00, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xF3, 0x00);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-
-	msleep(120);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set panel on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10,
+					       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
+					       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x65, 0x55, 0x49, 0x46, 0x36,
+					       0x3b, 0x24, 0x3d, 0x3c, 0x3d, 0x5c, 0x4c,
+					       0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7c,
+					       0x65, 0x55, 0x49, 0x46, 0x36, 0x3b, 0x24,
+					       0x3d, 0x3c, 0x3d, 0x5c, 0x4c, 0x55, 0x47,
+					       0x46, 0x39, 0x26, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xff, 0x87, 0x12, 0x34, 0x44, 0x44,
+					       0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0f,
+					       0x00, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00,
+					       0x7f, 0x00, 0x54, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
+					       0x22, 0x20, 0x44, 0xff, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x86, 0x46, 0x05, 0x05, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
+					       0x0f, 0x0f, 0x0d, 0x0d, 0x13, 0x13, 0x11,
+					       0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x07, 0x07, 0x04, 0x04, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
+					       0x0e, 0x0e, 0x0c, 0x0c, 0x12, 0x12, 0x10,
+					       0x10, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc6, 0x2a, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b,
+					       0x06, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44,
+					       0x08, 0x10, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x01, 0xff, 0xff, 0xff, 0xff,
+					       0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
 }
 
 static int boe_th101mb31ig002_disable(struct drm_panel *panel)
@@ -124,21 +113,15 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
 	struct boe_th101mb31ig002 *ctx = container_of(panel,
 						      struct boe_th101mb31ig002,
 						      panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "Failed to set panel off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int boe_th101mb31ig002_unprepare(struct drm_panel *panel)
@@ -172,7 +155,7 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
 	msleep(50);
 	boe_th101mb31ig002_reset(ctx);
 
-	ret = ctx->desc->init(panel);
+	ret = ctx->desc->init(ctx);
 	if (ret)
 		return ret;
 
-- 
2.17.1

