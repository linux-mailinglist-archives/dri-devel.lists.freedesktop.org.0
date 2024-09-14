Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC10978D2B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 05:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4B610E13E;
	Sat, 14 Sep 2024 03:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bo8dzK1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2176510E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 03:44:28 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7c6b4222fe3so1825456a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 20:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726285467; x=1726890267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UxhVso1KKLgRKM8XbkVpntKvRcoYBAw5zJqYDcpu1Gw=;
 b=Bo8dzK1zBhCa9vfZfZAT78cMdOn+Ojp8EDKV6xi4C8pQXnBMPtprTkwZSx5y8csHdn
 gdLetW7jGkYahxf1qXgSXGIR6ONK7lZpRrCVYkAZ7qNWP9g5DvjhDI1GTu9/5kL9tYOV
 cZCAMA7GNFz6Pe5JxCYGvdy1JGA4s9y7me/ZLxA+PqCdfIgKTUD4dKEQnvKY7YbZFK2+
 2MVFb/9uECpVWOqIP+6tBofgqi5UZhL/XinC/PWZiNHwF0BPhGe7AcDKNG2vKNoCSNhF
 v9OBom09QgwQStJFvUmNFIvRJoFOh4DLc1rPlOAbmyDt/jlp9LzXsA39p/7iefuW/Dj4
 7M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726285467; x=1726890267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxhVso1KKLgRKM8XbkVpntKvRcoYBAw5zJqYDcpu1Gw=;
 b=qJq+ligONWLwY6ETZIAyMrPC9ua4HheaIOUmFJJ1WwiBFQthiLpSlT3JMXnws7Nf82
 qz2BoRaWgOmBEBa1C634UJ/RjRdXD6V28r++UY77EH5rXdZrprwTb0fr32h+L7nWz6mn
 Z0uuvSVOoXdOGa9PuRouk1a9OJIiYJhpwLNhnOMxBdwdePRu2VDbeaK+IHZj6c1BfABT
 XxNkBRCJK5brTOKpwgCXT0kWZiW5HMviOz8LTWfB6jo99iSAXM+PRzfiC21r7i6t45u5
 vwm6eLJcUYnLTGc4sWDgHU4wnuL+kPpHFW/uRtgpjqt+GCn2kBmZ1NVAGPdvrDEdeRyz
 A03A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVowiOyitcPdhMjhwVAf/hw8FE88ij2RP4a7DogwFiC6oX15vZINtjXu6nY0XYNnEsKGSoDsFLS50I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1vX9pPwrIWxiOgkC6SbRXRpUGGPoKQNaPYFLBPQzrMh/kmtlY
 MEla8NgGOsZXkME+o/LzK2y6uyiBwX4qWEXffMjQIDn+6ogzE+v6
X-Google-Smtp-Source: AGHT+IEpUHmvc5Z7CiBw9pqO5r/tUIpQvtIHlhC/3FFuuZ59EP3DoZi5f7oP8fTxjGaS8P5CnSITkw==
X-Received: by 2002:a05:6a21:4d81:b0:1cf:6625:f05 with SMTP id
 adf61e73a8af0-1cf76239c8dmr10833766637.50.1726285467196; 
 Fri, 13 Sep 2024 20:44:27 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.220.252])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db498d970fsm387383a12.5.2024.09.13.20.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 20:44:26 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: raydium-rm69380: transition to mipi_dsi wrapped
 functions
Date: Sat, 14 Sep 2024 09:13:41 +0530
Message-ID: <20240914034341.897197-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes the raydium-rm69380 panel to use multi style functions for
improved error handling.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Fix whitespace issues

Link to v1: https://lore.kernel.org/all/20240907140130.410349-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-raydium-rm69380.c | 93 ++++++-------------
 1 file changed, 29 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69380.c b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
index 4dca6802faef..d3071c01aaea 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm69380.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
@@ -46,108 +46,73 @@ static void rm69380_reset(struct rm69380_panel *ctx)
 static int rm69380_on(struct rm69380_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 	if (ctx->dsi[1])
 		ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd4);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0x3f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x08);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(36);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 36);
+
+	return dsi_ctx.accum_err;
 }
 
-static int rm69380_off(struct rm69380_panel *ctx)
+static void rm69380_off(struct rm69380_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	if (ctx->dsi[1])
 		ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(35);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	return 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 35);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 }
 
 static int rm69380_prepare(struct drm_panel *panel)
 {
 	struct rm69380_panel *ctx = to_rm69380_panel(panel);
-	struct device *dev = &ctx->dsi[0]->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	rm69380_reset(ctx);
 
 	ret = rm69380_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rm69380_unprepare(struct drm_panel *panel)
 {
 	struct rm69380_panel *ctx = to_rm69380_panel(panel);
-	struct device *dev = &ctx->dsi[0]->dev;
-	int ret;
 
-	ret = rm69380_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	rm69380_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-- 
2.46.0

