Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE463A3D096
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 05:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D925910E130;
	Thu, 20 Feb 2025 04:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRsrv0DN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B8110E130
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 04:58:18 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2f9b91dff71so776292a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740027497; x=1740632297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x79i0bhLqpiDBJcBajlZ43nChj/icM/N7Ue738YpG3s=;
 b=jRsrv0DNFfPHnlh+Cbx5WQkY54LU4hxwdxzFFglDWr0f/cVYWVYgxBGubimzT7KyWE
 2YlWQKhYSnDoGl/JXhrHqL8q8VL5Iqump7Zt2tfVPjukegemG7mEhQ/mFvfQbGC5bvGU
 daL5iODk2AgR3oPkl/T7LKq2trSk+G6ujtzlwe9bL9ZWQwLMwgWfub4GAWffEYudBrz/
 +QBLTcoegFdrqB1MLQeqqYSfA5EopQOVuhqlxS1eAaqOUjVo97vN4IA5b+yAwbcwxN5w
 QUeVUCn5lJyYj2ZkrIjLDaPcUk8ITD++kuWEtjWc6XmafYXIYSuHFaUjJBqjISco7p/I
 /1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740027497; x=1740632297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x79i0bhLqpiDBJcBajlZ43nChj/icM/N7Ue738YpG3s=;
 b=Drwl0Z1EsX/aV+oVCFspVhBiFtXWHCpyJnaMzZQt9tVIcgZvPfpZO6L68ZjWFUHPDt
 iOp7hc7vnqc5x8JkuNB7Bs+bukbnslU4WamAr7qljO75IStt1870v+lLEMxoSRrBFxV+
 qcTsmGikUyN995dtqeY4/aPgmS2el78Za8KlTEgBhmH2acz9kdRG+8LvQ9SCPhBISovB
 G3/1cMP4QDuZmAQ/9p7zUfe0d3USkJy1S5osuLJG6JajcLHd73yj6/YFcWZ1J9hwgTHZ
 BcyZhrlRiZPICGBAH30+Sqtsepk4GaScL/OJnLkCgZR8Ed9eobPh6W8yqUp5jkgmdz5M
 q7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMrS78c4siYUx0TrNXgjEsSef9Js0V6xkJupLL/d/RUYz6PPi2ZDJvAxJIQVrAV6XFAdksKNkrTxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUN6zhQDRmmAIjgzaHwr/V3fKgdxGrao6ovLarnoJaeErStG8B
 a1IEEYQfjaR7/DcpYeQb9JI4MrRIjqhKQazR4cW/bXtY0wF/fFrIc9/nKlJ3
X-Gm-Gg: ASbGncsFB8FaKiTQKTNBfzLyKr8lfWfZgi2fT5N2yUNNr07CFWkUJPTHrxDRFD+0vUC
 OQhvFOhLFpNjBoq/QAUSGlvC5was9Wt2XuSBos3b7FP4FwSyg0tKLara6EbKOBeUY3w1/gli/Yt
 +tsw0FG2KCYI3fXLH3lYHZCQB+sIv4VOzGYl4Swaa0XFCTjHuwocLaONwL02xfO57qaJwIbJbnT
 9LSR8i/ezAV31Ge1OU44kMsXKnxfiR2AiIOf3IZBtV50JfsnXA1AnockD4MffwGUwgw7FiL+OVt
 Y2/VKqKz2o5sloki//cpqc3AF1HhK+nJmkeq1w==
X-Google-Smtp-Source: AGHT+IHrngJ9wsLKpkmfVQR0Zl8QKv2Ahs8dagIFjlgk1+gYTfOhpaMk96T6lHuygPJ2/XQ7+lJnNA==
X-Received: by 2002:a17:90b:47:b0:2ee:d7d3:3019 with SMTP id
 98e67ed59e1d1-2fcb5a1aa37mr11785103a91.12.1740027497539; 
 Wed, 19 Feb 2025 20:58:17 -0800 (PST)
Received: from distilledx.localdomain
 ([2401:4900:6273:d0ef:80a7:d92e:7b3e:31e8])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98cfd19sm14993179a91.14.2025.02.19.20.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 20:58:17 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/mipi-dsi: extend "multi" functions and use them in
 sony-td4353-jdi
Date: Thu, 20 Feb 2025 10:27:21 +0530
Message-ID: <20250220045721.145905-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Removes mipi_dsi_dcs_set_tear_off and replaces it with a
multi version as after replacing it in sony-td4353-jdi, it doesn't
appear anywhere else. sony-td4353-jdi is converted to use multi style
functions, including mipi_dsi_dcs_set_tear_off_multi.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Squashed panel changes and mipi_dsi changes into 1 patch

Link to v1: https://lore.kernel.org/all/20250214172958.81258-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/drm_mipi_dsi.c                |  42 +++----
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
 include/drm/drm_mipi_dsi.h                    |   2 +-
 3 files changed, 47 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5e5c5f84daac..2e148753ea97 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1265,25 +1265,6 @@ int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address);
 
-/**
- * mipi_dsi_dcs_set_tear_off() - turn off the display module's Tearing Effect
- *    output signal on the TE signal line
- * @dsi: DSI peripheral device
- *
- * Return: 0 on success or a negative error code on failure
- */
-int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi)
-{
-	ssize_t err;
-
-	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_OFF, NULL, 0);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off);
-
 /**
  * mipi_dsi_dcs_set_tear_on() - turn on the display module's Tearing Effect
  *    output signal on the TE signal line.
@@ -1713,6 +1694,29 @@ void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx)
 }
 EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral_multi);
 
+/**
+ * mipi_dsi_dcs_set_tear_off_multi() - turn off the display module's Tearing Effect
+ *    output signal on the TE signal line
+ * @ctx: Context for multiple DSI transactions
+ */
+void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t err;
+
+	if (ctx->accum_err)
+		return;
+
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_OFF, NULL, 0);
+	if (err < 0) {
+		ctx->accum_err = err;
+		dev_err(dev, "Failed to set tear off: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off_multi);
+
 /**
  * mipi_dsi_dcs_soft_reset_multi() - perform a software reset of the display module
  * @ctx: Context for multiple DSI transactions
diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
index 472195d4bbbe..97f4bb4e1029 100644
--- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
+++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
@@ -47,93 +47,40 @@ static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel
 static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set column address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2160 - 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set page address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 2160 - 1);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
-			  0x00, 0x00, 0x08, 0x6f);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(70);
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x00, 0x00, 0x08, 0x6f);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to turn display on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
+static void sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(22);
-
-	ret = mipi_dsi_dcs_set_tear_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear off: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(80);
-
-	return 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 22);
+	mipi_dsi_dcs_set_tear_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
 }
 
 static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode)
@@ -146,14 +93,11 @@ static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode
 static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 {
 	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	msleep(100);
 
@@ -161,7 +105,6 @@ static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 
 	ret = sony_td4353_jdi_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to power on panel: %d\n", ret);
 		sony_td4353_assert_reset_gpios(ctx, 0);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 		return ret;
@@ -173,12 +116,8 @@ static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 static int sony_td4353_jdi_unprepare(struct drm_panel *panel)
 {
 	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = sony_td4353_jdi_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to power off panel: %d\n", ret);
+	sony_td4353_jdi_off(ctx);
 
 	sony_td4353_assert_reset_gpios(ctx, 0);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 94400a78031f..bd40a443385c 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -346,7 +346,6 @@ int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
 				    u16 end);
 int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
 				  u16 end);
-int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
 			     enum mipi_dsi_dcs_tear_mode mode);
 int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
@@ -379,6 +378,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 					 u16 start, u16 end);
 void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
+void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.48.1

