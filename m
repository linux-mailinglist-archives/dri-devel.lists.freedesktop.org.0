Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E914FA69810
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 19:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F9310E571;
	Wed, 19 Mar 2025 18:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JgJZm24E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EAB10E571
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 18:31:23 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso6032782a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742409083; x=1743013883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8k6E0SBMJu3+sqsRyfC0ebK6LVVCZ5JuEe2gAlutts0=;
 b=JgJZm24EPGtkB4Dzbw9WkDgb05l5V0vFNxfPUspjSRh4bvXKTfotdsVjKX6I8yrQyO
 fTKJrabtmFvV7VysJND8SBotujUYhXzMh55enz54lhYcKWEa4i33vHbRKf7Ij8y4X+al
 jM2H+20Z+qPYAzmyZFKUKn3E4QOZbAuzd4LPRy6wVZEIO5Y5A1t1enh2qPcTCQxKdGOC
 nWPDOcK48WMoICUFKd8hdMb5pZhYNVkxnA1k1FwcTxzE3AvXVeNTAQp5X/93CV2ylws+
 N2V3R9/Lzzd7gAJGFFy/nwBJATm0itDuousQPgWm7p51t0j3ZeEx9DTlwoaGdk3NxMIY
 3tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742409083; x=1743013883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8k6E0SBMJu3+sqsRyfC0ebK6LVVCZ5JuEe2gAlutts0=;
 b=R/fEyfeGw3e3TnbZbaj3R8LOGq+gVQuRdcvYrJLGo+s+FDh5beH8RnqIjbbJ5FAMEe
 VuLQO+d+kpAuX65qUjzwOw8amhyfgefyCTRQ3pknkOnGH8B5hy4okCeK3DzdcQpHZxo4
 JKR+xsuzH0APL9ZtokTmslfioEobrXFxO2VkeQIrRzSaDVd0vnEdPhIIZ4cDyWjyBHBY
 9dkmFiDlFAfpwbuHCrf5daqNrzV7VV4I+ppBpssc9Z/DUYV3PhJOMlxALOF09MCxGBk6
 0R2vZRk5L8EkIyJUkd0ZPYz2fqQa+Dl836YE/ScDgBT3pH9UXwj8JLAmKZW0BvHhXV+e
 NcxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIxYdjQtsYy9tRN7Qb4LhtXd+82xsmitgFPlaFKVeCddaYKAVMn62NoZK3GSQVrYtbGHCNAwgr+Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjwvLqI+Uf/XyZbp8fD0OLeaEDoDzYCHRLLg0dMeNQRJWbqJrj
 +4i0dtRgj+IYtzfDBuJJ1ogGCEkPDts1YUBXt3pKAS0W77k3jngwZOVoYo6pUWE=
X-Gm-Gg: ASbGncvdYqoS14AoP+KEaxmmnDF2EjIl7wO8EI8YtTKyF5I9NbJvMQWNbS9UCl+t75m
 rqftzZPgR+enoST4qIVQ4SoFoQMpeufh06rJyibevta3lcAEUMObLe3I99qZYfPtfMmR0eh2nKP
 prVTYwp+/31F+w8hS6nXcK/rahdztVyatD1pxHfQZXJZz36bI29e7AqVU6UgODDb+pbkC2zCDBd
 3fmMgmGgrQ9tYiF/BhSaumdqNSxb/qDVXWuzQJPQHYY0leID2oGLkhgg+AZlindbf9qyooJb9ki
 zPSCrIEE0EeonU1BBdmVVbd2nBGlsUkhBOahuLt78PMLbgxou/dVmiczksvZz8Mj
X-Google-Smtp-Source: AGHT+IHYfTCmFqbs+qDm3BvqWkp57qcljfbUjjyj12xeCA0T3RI3cSHuRg+q+GC5f7TR/rYpyh5MoA==
X-Received: by 2002:a17:90b:3d07:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-301bde7397cmr7592138a91.12.1742409082762; 
 Wed, 19 Mar 2025 11:31:22 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf61b525sm1978422a91.35.2025.03.19.11.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 11:31:22 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, aweber.kernel@gmail.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: samsung-s6d7aa0: transition to mipi_dsi wrapped
 functions
Date: Thu, 20 Mar 2025 00:01:06 +0530
Message-ID: <20250319183106.12613-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Changes the samsung-s6d7aa0 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Remove unnecessary early return in s6d7aa0_lock
    - Remove redundant GPIO reset setting in s6d7aa0_on.

Link to v1: https://lore.kernel.org/all/20250316045024.672167-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 222 +++++-------------
 1 file changed, 65 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index f23d8832a1ad..9d219809ce38 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -34,8 +34,8 @@ struct s6d7aa0 {
 
 struct s6d7aa0_panel_desc {
 	unsigned int panel_type;
-	int (*init_func)(struct s6d7aa0 *ctx);
-	int (*off_func)(struct s6d7aa0 *ctx);
+	void (*init_func)(struct s6d7aa0 *ctx, struct mipi_dsi_multi_context *dsi_ctx);
+	void (*off_func)(struct mipi_dsi_multi_context *dsi_ctx);
 	const struct drm_display_mode *drm_mode;
 	unsigned long mode_flags;
 	u32 bus_flags;
@@ -62,93 +62,61 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 	msleep(50);
 }
 
-static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
+static void s6d7aa0_lock(struct s6d7aa0 *ctx, struct mipi_dsi_multi_context *dsi_ctx, bool lock)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-
 	if (lock) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD1, 0xa5, 0xa5);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD2, 0xa5, 0xa5);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
+			mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD3, 0x5a, 0x5a);
 	} else {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD1, 0x5a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD2, 0x5a, 0x5a);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
+			mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_PASSWD3, 0xa5, 0xa5);
 	}
-
-	return 0;
 }
 
 static int s6d7aa0_on(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = ctx->desc->init_func(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		return ret;
-	}
+	ctx->desc->init_func(ctx, &dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int s6d7aa0_off(struct s6d7aa0 *ctx)
+static void s6d7aa0_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = ctx->desc->off_func(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Panel-specific off function failed: %d\n", ret);
-		return ret;
-	}
+	ctx->desc->off_func(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(64);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 64);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	mipi_dsi_msleep(&dsi_ctx, 120);
 }
 
 static int s6d7aa0_prepare(struct drm_panel *panel)
 {
 	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	s6d7aa0_reset(ctx);
 
 	ret = s6d7aa0_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		return ret;
 	}
@@ -159,12 +127,8 @@ static int s6d7aa0_prepare(struct drm_panel *panel)
 static int s6d7aa0_disable(struct drm_panel *panel)
 {
 	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = s6d7aa0_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	s6d7aa0_off(ctx);
 
 	return 0;
 }
@@ -185,13 +149,11 @@ static int s6d7aa0_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int s6d7aa0_bl_get_brightness(struct backlight_device *bl)
@@ -228,65 +190,39 @@ s6d7aa0_create_backlight(struct mipi_dsi_device *dsi)
 
 /* Initialization code and structures for LSL080AL02 panel */
 
-static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
+static void s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx, struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	mipi_dsi_usleep_range(dsi_ctx, 20000, 25000);
 
-	usleep_range(20000, 25000);
+	s6d7aa0_lock(ctx, dsi_ctx, false);
 
-	ret = s6d7aa0_lock(ctx, false);
-	if (ret < 0) {
-		dev_err(dev, "Failed to unlock registers: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
-	usleep_range(1000, 1500);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_OTP_RELOAD, 0x00, 0x10);
+	mipi_dsi_usleep_range(dsi_ctx, 1000, 1500);
 
 	/* SEQ_B6_PARAM_8_R01 */
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6, 0x10);
 
 	/* BL_CTL_ON */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x28);
-
-	usleep_range(5000, 6000);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x28);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
+	mipi_dsi_usleep_range(dsi_ctx, 5000, 6000);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
 
-	msleep(120);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
 
-	ret = s6d7aa0_lock(ctx, true);
-	if (ret < 0) {
-		dev_err(dev, "Failed to lock registers: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_msleep(dsi_ctx, 120);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, dsi_ctx, true);
 
-	return 0;
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
 }
 
-static int s6d7aa0_lsl080al02_off(struct s6d7aa0 *ctx)
+static void s6d7aa0_lsl080al02_off(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-
 	/* BL_CTL_OFF */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x20);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x20);
 }
 
 static const struct drm_display_mode s6d7aa0_lsl080al02_mode = {
@@ -317,79 +253,51 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 
 /* Initialization code and structures for LSL080AL03 panel */
 
-static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
+static void s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx, struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	usleep_range(20000, 25000);
+	mipi_dsi_usleep_range(dsi_ctx, 20000, 25000);
 
-	ret = s6d7aa0_lock(ctx, false);
-	if (ret < 0) {
-		dev_err(dev, "Failed to unlock registers: %d\n", ret);
-		return ret;
-	}
+	s6d7aa0_lock(ctx, dsi_ctx, false);
 
 	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0xa0);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BL_CTL, 0xc7, 0x00, 0x29);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbc, 0x01, 0x4e, 0xa0);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfd, 0x16, 0x10, 0x11, 0x23,
 				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfe, 0x00, 0x02, 0x03, 0x21,
 				       0x80, 0x78);
 	} else if (ctx->desc->panel_type == S6D7AA0_PANEL_LTL101AT01) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x08);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0x0b);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x08);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbc, 0x01, 0x4e, 0x0b);
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfd, 0x16, 0x10, 0x11, 0x23,
 				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfe, 0x00, 0x02, 0x03, 0x21,
 				       0x80, 0x68);
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x02, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x51);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf2, 0x02, 0x08, 0x08);
 
-	usleep_range(10000, 11000);
+	mipi_dsi_usleep_range(dsi_ctx, 10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x80, 0x80, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xcd,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc0, 0x80, 0x80, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcd,
 			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
 			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0xce,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xce,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x03);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-
-	ret = s6d7aa0_lock(ctx, true);
-	if (ret < 0) {
-		dev_err(dev, "Failed to lock registers: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc1, 0x03);
 
-	return 0;
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	s6d7aa0_lock(ctx, dsi_ctx, true);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
 }
 
-static int s6d7aa0_lsl080al03_off(struct s6d7aa0 *ctx)
+static void s6d7aa0_lsl080al03_off(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x22, 0x00);
 }
 
 static const struct drm_display_mode s6d7aa0_lsl080al03_mode = {
-- 
2.48.1

