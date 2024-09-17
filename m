Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F697ABEC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6172910E1F6;
	Tue, 17 Sep 2024 07:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a42ddLZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D4810E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 07:17:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-718e6299191so2945971b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726557476; x=1727162276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eR3y36WD4tVlkVWOhI0lCliV58lEc5qOyZSZyDjtgq0=;
 b=a42ddLZiuJD3X7nNKsr3qfOe0m45V7BWojZ7Eh6RD4CVa6A2Yith8Yl9kxSbv9Xx/8
 2+yRrmXKUY89YRs5lZNYdTyuAu2qf8gs2e70/9FGZ4ODbqXxLPL+wqibLT7D2N1FIIfF
 2IV+WzfpRZ8Bdjyirsq5rCTU5N34MCGUFdCc5+W0D0weVf67L7YVTRgmNA1nMPBMGIR3
 0krgoIT88EZ2k6/vTj1WkfkyrVFQrPVpvu2EscUaHi9cwqQC9NiiXoGWjSNW818J/juR
 d6cLQshgpMJ6fN4U5aehUjAzcvLhPP0WiHE6JnONnHBWARzyRFNZgjK8Lwwv+Lw/R+k8
 pU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726557476; x=1727162276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eR3y36WD4tVlkVWOhI0lCliV58lEc5qOyZSZyDjtgq0=;
 b=Y08pRjJ8rku0YEDJSdXAmcyAxNIPt9pdvjeM/LAU2vEEKPyA26f2VYJd3j3VsJ57g0
 kMm2KUEEbb4sbT0yrnP9xxbpsL/zgSP2G+XdOrVJMaQkmPVxoersPuVBcn/bcok0S5G5
 ztRWVwbNrgq51dzzhqXNqTfVXc/9hEVvepNwiSjq7rAzkJnA5XcauKnnDjSqBa7rpISm
 bB4oPn6GhEs59MLje/t3yQAismfd2fjsUBeQcSZUnpUSc1ENHN2NxG5U19T4pVpR/2ps
 FQGFRNnvmCxgt2bcjjZnJ6DQapV7NuiKNC7gM7HsMFP5wqYL6uQYlj+mBjKmjKj9WaHc
 CHng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOAY8QsFXB/v7TaLvVlWltvSkdN5AR1ZoWbrm9GJXvHW8oegD6ysQZ/K3n4muVkOJMLk1xZBwfcD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoWqrSM4LpCCwuDzaiEskyQAgzpSRd+/14HG9S4v6/p+AMeGpF
 6muQ4vdTg1iC4FWijPW6Z9VijyqJfvbe4gs8cARl/A2GeUuiroVl
X-Google-Smtp-Source: AGHT+IGaBul7iKoYU2pjQ6zunExY6Y/eI2Dn+fgyD558TLkqm9GaNv+wFopgw4ia4meegOtO8eKN+Q==
X-Received: by 2002:a05:6a00:2d05:b0:714:1bcf:3d93 with SMTP id
 d2e1a72fcca58-719260562d7mr25693441b3a.5.1726557476257; 
 Tue, 17 Sep 2024 00:17:56 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944a97e6fsm4691502b3a.26.2024.09.17.00.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 00:17:55 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: elida-kd35t133: transition to mipi_dsi wrapped
 functions
Date: Tue, 17 Sep 2024 12:47:10 +0530
Message-ID: <20240917071710.1254520-1-tejasvipin76@gmail.com>
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

Changes the elida-kd35t133 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 107 ++++++++-----------
 1 file changed, 45 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 00791ea81e90..62abda9559e7 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -50,55 +50,45 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
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
+				     0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
+				     0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2, 0x41);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
+				     0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3,
+				     0x51, 0x2c, 0x82);
+	if (!dsi_ctx->accum_err)
+		mipi_dsi_dcs_write(dsi_ctx->dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
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
 
@@ -112,18 +102,20 @@ static int kd35t133_prepare(struct drm_panel *panel)
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
 
@@ -135,25 +127,16 @@ static int kd35t133_prepare(struct drm_panel *panel)
 
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
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto disable_iovcc;
-	}
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
-		goto disable_iovcc;
-	}
 
 	msleep(50);
 
@@ -163,7 +146,7 @@ static int kd35t133_prepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 disable_vdd:
 	regulator_disable(ctx->vdd);
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode default_mode = {
-- 
2.46.0

