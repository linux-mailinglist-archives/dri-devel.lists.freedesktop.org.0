Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034909854D9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD1D10E1B9;
	Wed, 25 Sep 2024 08:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ep219aSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889F10E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:00:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-718e6299191so3341146b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727251225; x=1727856025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c94W55G2sQFF6CCRWT/dissfgBaV7L1sJwXD+u0SvQE=;
 b=Ep219aSUKy1uOiGN8qQwGcmPgRncrG5S6RYCkqd/mWD1B0q+D8zmoVpIbcIrYgxZ/Z
 g9fz71LLNNt3sVi1/fF9r+uCrhggKSBhYAQI31L1jMzNrNG7koWsSa4ckQ3uAIEFiWF0
 Wqb/qAhvtxMG9g9IdgWVMYUv9BFOgUrR9ovV4XOhEPiwC/La1eCu7Fodk3r3dF8qDF9y
 mahEkfsasOsRAbp6s0YVygFZiqKB8GzWFq8EsmJDNwCewKiIfgd7d7ZlcljPyWr7npaP
 bGqTfGlzzIy3vE6tJ3fALzbNYyv4/V6lQ1BimUxMxF88VuDUXTW3p56tctz3sSuS5bV0
 cFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727251225; x=1727856025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c94W55G2sQFF6CCRWT/dissfgBaV7L1sJwXD+u0SvQE=;
 b=hnv6/9yYYX4AtVu3RfK36J1fuw77XNdexwFKGxHZq2gfS6XkkIZr1IwLFUI/5tU0ls
 a5BA0k3cWWwWmhzLjtA7c27u1rR9P2vhg5qlCF1/AUj8CRyFK4HLtjnJJu+Y+sJ/vtVb
 8IZADgU+riGQ/fm1gjSyjLLFXsRGH5T0Gz0uFda7ES8cptJWaEEAAnrc8K3U/bu9ajgG
 wlPTaJA/6Th1p2TvPZX0318pnxumcSFvfwwKJkgqTQPAvZ8JI8OXMpsiKg7zMxqBHzlj
 xdfJfwIIy6ZqjeO8BaRrvB+s6pe1txEMdHNOCv1yeh1HTR6jBHr+duuWVMBumshiskc6
 addA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6WELC3vY2iJzw1FgAtgyGKdHKZi17oiDCnxgEt1I+GsRh0jsH0TZaOXwzUR4LrsDHBlAO7fW8vmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7aLJKUooWN/4ikvDHaW4rLVnLugwpIyYrOyh9A/fXi7k3XHIa
 IgN7NKYQLWVxyK4odOHjefjhXxicCFpOE0TNsnenihfNK3OkzqaqVas+fg==
X-Google-Smtp-Source: AGHT+IHXaWV/iWg3XF+1sqooblCyO8XVDbXjaEKy2VvjL+7xYQcC+o9FSilUMB+xXhHrJPgasI5AJQ==
X-Received: by 2002:a05:6a20:2d28:b0:1d3:294e:6c8d with SMTP id
 adf61e73a8af0-1d4d4ac2fd8mr2713114637.21.1727251224870; 
 Wed, 25 Sep 2024 01:00:24 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e06e1bae46sm893808a91.22.2024.09.25.01.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:00:24 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3] drm/panel: elida-kd35t133: transition to mipi_dsi wrapped
 functions
Date: Wed, 25 Sep 2024 13:30:03 +0530
Message-ID: <20240925080003.1250448-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.1
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

Changes the elida-kd35t133 panel to use multi style functions for
improved error handling.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v3:
    - Added back bytes that were removed
    - Replaced mipi_dsi_dcs_write_buffer_multi with mipi_dsi_dcs_write_seq_multi

Changes in v2:
    - Changed mipi_dsi_dcs_write to mipi_dsi_dcs_write_buffer_multi
    - Cleaned up error handling

Link to v2: https://lore.kernel.org/all/20240923122558.728516-1-tejasvipin76@gmail.com/
Link to v1: https://lore.kernel.org/all/20240917071710.1254520-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 108 ++++++++-----------
 1 file changed, 45 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 00791ea81e90..b904d5437444 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -50,55 +50,44 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
 	return container_of(panel, struct kd35t133, panel);
 }
 
-static int kd35t133_init_sequence(struct kd35t133 *ctx)
+static void kd35t133_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	struct device *dev = ctx->dev;
-
 	/*
 	 * Init sequence was supplied by the panel vendor with minimal
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
-			       0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
-			       0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
-			       0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
-			       0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
-			       0x20, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
-			       0xa9, 0x51, 0x2c, 0x82);
-	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
-
-	dev_dbg(dev, "Panel init sequence done\n");
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POSITIVEGAMMA,
+				     0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
+				     0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_NEGATIVEGAMMA,
+				     0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
+				     0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2, 0x41);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
+				     0x20, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3,
+				     0xa9, 0x51, 0x2c, 0x82);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_ENTER_INVERT_MODE);
 }
 
 static int kd35t133_unprepare(struct drm_panel *panel)
 {
 	struct kd35t133 *ctx = panel_to_kd35t133(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
@@ -112,18 +101,20 @@ static int kd35t133_prepare(struct drm_panel *panel)
 {
 	struct kd35t133 *ctx = panel_to_kd35t133(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vdd);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n", ret);
-		return ret;
+	dsi_ctx.accum_err = regulator_enable(ctx->vdd);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n",
+			dsi_ctx.accum_err);
+		return dsi_ctx.accum_err;
 	}
 
-	ret = regulator_enable(ctx->iovcc);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
+	dsi_ctx.accum_err = regulator_enable(ctx->iovcc);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n",
+			dsi_ctx.accum_err);
 		goto disable_vdd;
 	}
 
@@ -135,27 +126,18 @@ static int kd35t133_prepare(struct drm_panel *panel)
 
 	msleep(20);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		goto disable_iovcc;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 250);
 
-	msleep(250);
+	kd35t133_init_sequence(&dsi_ctx);
+	if (!dsi_ctx.accum_err)
+		dev_dbg(ctx->dev, "Panel init sequence done\n");
 
-	ret = kd35t133_init_sequence(ctx);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		goto disable_iovcc;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+	if (dsi_ctx.accum_err)
 		goto disable_iovcc;
-	}
-
-	msleep(50);
 
 	return 0;
 
@@ -163,7 +145,7 @@ static int kd35t133_prepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 disable_vdd:
 	regulator_disable(ctx->vdd);
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode default_mode = {
-- 
2.46.1

