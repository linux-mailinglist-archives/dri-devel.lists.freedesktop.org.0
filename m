Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E191795DD05
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 10:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC4110E0F2;
	Sat, 24 Aug 2024 08:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bftsqQCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FF210E0F2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 08:44:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20230059241so23621365ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724489088; x=1725093888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ea59/NJ4sxZqForIi8n94Fy8ov9rbljCGadYX6EXWzY=;
 b=bftsqQCtkJP9EkJBEtJZUrd6GKRbsF1n7b6m9slWM8rVhTVWmk1zxagrsTjnWeL7TQ
 pqIXuP4ezpoD0+HCnFL/hPftL9kH2huk8MJSK4xGPFTRoJ8igGHC0w5tuuvvzJzMOAnL
 WcDVPAgZbuDHzGvwxrpxcRkvdXvXO5AewkZe9ja0QG5ZadZV9dRe6kQbISwRsQ52Khxj
 hFyT79Ad7ByHMycz0GJcoESvvuf0IZUx4zqLeEz5Vse6DK0IAv68N8Y6Bi2/c1BRxR3N
 jLzM4+4yaRiiam5nkG65c5hoNQJPDWlm8HFCv5lKBRO0Iz2nG+2/cOG20w5eYYjrRboF
 s3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724489088; x=1725093888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ea59/NJ4sxZqForIi8n94Fy8ov9rbljCGadYX6EXWzY=;
 b=NdlClLSu/yKOwHPtxnEhGOwj/zFKdeyN5LwSg95qimhMIWUaEvT2unMh7dELYcU/ee
 JK6BRw+8c1rXHrMokWXBSbel2tO8qgk7S+gYiGFSY1T5XirZxio1yZQjyolll/Mq56xi
 6FUgJ/PZPMis5ANUiuvTzhIqhexy0Lnqoci/K6kHCrbNxEfodImbuHSAeiOBqiinjQFA
 qCFhQxcXJMGamM7rNLgoBb8A1IzRhT6MmxbzdBETNB4iK0Bido4dVxJksmThPz4CUnVN
 5EekGeg7yX6WfVjcif7jOId4CCIhmdD8OAypz8MJ7InGG26fj0vBORgqnsvSVF8+b8TM
 zjDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZx7MmuN4tEtMO2XQQz/lxL9AvBTj8qk4lj5LMn1mz9aBTYwQeQu9CMbsswfbC34JMt3YQ2oQ4jxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxkb0e64NcJIYJCZQtMFVR/b20B9bnLQ9zuQ+Cx9UQ0ks7h8HNG
 3tM0GLMS8eexiC+0tHiMX0i5f+7+1+uTRSKWmSvoQW4AjgfG3DS3
X-Google-Smtp-Source: AGHT+IEgG8FfbWrTWA3i05sUaaBKDGlVXXP+zEPYnQ1unrBKdvziEseAvODDEz2EzipSa/0BZRD0oQ==
X-Received: by 2002:a17:902:d4cf:b0:202:23f1:ebfa with SMTP id
 d9443c01a7336-2039e4f3ae3mr53676945ad.52.1724489087801; 
 Sat, 24 Aug 2024 01:44:47 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([14.96.13.220])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2038560e3e8sm38611575ad.219.2024.08.24.01.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 01:44:47 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: novatek-nt35950: transition to mipi_dsi wrapped
 functions
Date: Sat, 24 Aug 2024 14:14:22 +0530
Message-ID: <20240824084422.202946-1-tejasvipin76@gmail.com>
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

Changes the novatek-nt35950 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 214 ++++++------------
 1 file changed, 70 insertions(+), 144 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 028fdac293f7..fa4db7a3bc25 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -100,106 +100,89 @@ static void nt35950_reset(struct nt35950 *nt)
 
 /*
  * nt35950_set_cmd2_page - Select manufacturer control (CMD2) page
+ * @dsi_ctx: context for mipi_dsi functions
  * @nt:   Main driver structure
  * @page: Page number (0-7)
- *
- * Return: Number of transferred bytes or negative number on error
  */
-static int nt35950_set_cmd2_page(struct nt35950 *nt, u8 page)
+static void nt35950_set_cmd2_page(struct mipi_dsi_multi_context *dsi_ctx,
+				  struct nt35950 *nt, u8 page)
 {
 	const u8 mauc_cmd2_page[] = { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52,
 				      0x08, page };
-	int ret;
 
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], mauc_cmd2_page,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, mauc_cmd2_page,
 					ARRAY_SIZE(mauc_cmd2_page));
-	if (ret < 0)
-		return ret;
+	if (dsi_ctx->accum_err)
+		return;
 
 	nt->last_page = page;
-	return 0;
 }
 
 /*
  * nt35950_set_data_compression - Set data compression mode
+ * @dsi_ctx: context for mipi_dsi functions
  * @nt:        Main driver structure
  * @comp_mode: Compression mode
- *
- * Return: Number of transferred bytes or negative number on error
  */
-static int nt35950_set_data_compression(struct nt35950 *nt, u8 comp_mode)
+static void nt35950_set_data_compression(struct mipi_dsi_multi_context *dsi_ctx,
+					 struct nt35950 *nt, u8 comp_mode)
 {
 	u8 cmd_data_compression[] = { MCS_PARAM_DATA_COMPRESSION, comp_mode };
 	u8 cmd_vesa_dsc_on[] = { MCS_PARAM_VESA_DSC_ON, !!comp_mode };
 	u8 cmd_vesa_dsc_setting[] = { MCS_PARAM_VESA_DSC_SETTING, 0x03 };
 	u8 last_page = nt->last_page;
-	int ret;
 
 	/* Set CMD2 Page 0 if we're not there yet */
-	if (last_page != 0) {
-		ret = nt35950_set_cmd2_page(nt, 0);
-		if (ret < 0)
-			return ret;
-	}
+	if (last_page != 0)
+		nt35950_set_cmd2_page(dsi_ctx, nt, 0);
 
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_data_compression,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_data_compression,
 					ARRAY_SIZE(cmd_data_compression));
-	if (ret < 0)
-		return ret;
-
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_vesa_dsc_on,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_vesa_dsc_on,
 					ARRAY_SIZE(cmd_vesa_dsc_on));
-	if (ret < 0)
-		return ret;
 
 	/* Set the vesa dsc setting on Page 4 */
-	ret = nt35950_set_cmd2_page(nt, 4);
-	if (ret < 0)
-		return ret;
+	nt35950_set_cmd2_page(dsi_ctx, nt, 4);
 
 	/* Display Stream Compression setting, always 0x03 */
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_vesa_dsc_setting,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_vesa_dsc_setting,
 					ARRAY_SIZE(cmd_vesa_dsc_setting));
-	if (ret < 0)
-		return ret;
 
 	/* Get back to the previously set page */
-	return nt35950_set_cmd2_page(nt, last_page);
+	nt35950_set_cmd2_page(dsi_ctx, nt, last_page);
 }
 
 /*
  * nt35950_set_scaler - Enable/disable resolution upscaling
- * @nt:        Main driver structure
+ * @dsi_ctx: context for mipi_dsi functions
  * @scale_up:  Scale up function control
- *
- * Return: Number of transferred bytes or negative number on error
  */
-static int nt35950_set_scaler(struct nt35950 *nt, u8 scale_up)
+static void nt35950_set_scaler(struct mipi_dsi_multi_context *dsi_ctx,
+			       u8 scale_up)
 {
 	u8 cmd_scaler[] = { MCS_PARAM_SCALER_FUNCTION, scale_up };
 
-	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_scaler,
-					 ARRAY_SIZE(cmd_scaler));
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_scaler,
+					ARRAY_SIZE(cmd_scaler));
 }
 
 /*
  * nt35950_set_scale_mode - Resolution upscaling mode
- * @nt:   Main driver structure
+ * @dsi_ctx: context for mipi_dsi functions
  * @mode: Scaler mode (MCS_DATA_COMPRESSION_*)
- *
- * Return: Number of transferred bytes or negative number on error
  */
-static int nt35950_set_scale_mode(struct nt35950 *nt, u8 mode)
+static void nt35950_set_scale_mode(struct mipi_dsi_multi_context *dsi_ctx,
+				   u8 mode)
 {
 	u8 cmd_scaler[] = { MCS_PARAM_SCALEUP_MODE, mode };
 
-	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_scaler,
-					 ARRAY_SIZE(cmd_scaler));
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_scaler,
+					ARRAY_SIZE(cmd_scaler));
 }
 
 /*
  * nt35950_inject_black_image - Display a completely black image
- * @nt:   Main driver structure
+ * @dsi_ctx: context for mipi_dsi functions
  *
  * After IC setup, the attached panel may show random data
  * due to driveric behavior changes (resolution, compression,
@@ -208,43 +191,34 @@ static int nt35950_set_scale_mode(struct nt35950 *nt, u8 mode)
  * the display.
  * It makes sense to push a black image before sending the sleep-out
  * and display-on commands.
- *
- * Return: Number of transferred bytes or negative number on error
  */
-static int nt35950_inject_black_image(struct nt35950 *nt)
+static void nt35950_inject_black_image(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	const u8 cmd0_black_img[] = { 0x6f, 0x01 };
 	const u8 cmd1_black_img[] = { 0xf3, 0x10 };
 	u8 cmd_test[] = { 0xff, 0xaa, 0x55, 0xa5, 0x80 };
-	int ret;
 
 	/* Enable test command */
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_test, ARRAY_SIZE(cmd_test));
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_test, ARRAY_SIZE(cmd_test));
 
 	/* Send a black image */
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd0_black_img,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd0_black_img,
 					ARRAY_SIZE(cmd0_black_img));
-	if (ret < 0)
-		return ret;
-	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd1_black_img,
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd1_black_img,
 					ARRAY_SIZE(cmd1_black_img));
-	if (ret < 0)
-		return ret;
 
 	/* Disable test command */
 	cmd_test[ARRAY_SIZE(cmd_test) - 1] = 0x00;
-	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_test, ARRAY_SIZE(cmd_test));
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_test, ARRAY_SIZE(cmd_test));
 }
 
 /*
  * nt35950_set_dispout - Set Display Output register parameters
  * @nt:    Main driver structure
- *
- * Return: Number of transferred bytes or negative number on error
+ * @dsi_ctx: context for mipi_dsi functions
  */
-static int nt35950_set_dispout(struct nt35950 *nt)
+static void nt35950_set_dispout(struct mipi_dsi_multi_context *dsi_ctx,
+				struct nt35950 *nt)
 {
 	u8 cmd_dispout[] = { MCS_PARAM_DISP_OUTPUT_CTRL, 0x00 };
 	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
@@ -254,8 +228,8 @@ static int nt35950_set_dispout(struct nt35950 *nt)
 	if (mode_data[nt->cur_mode].enable_sram)
 		cmd_dispout[1] |= MCS_DISP_OUT_SRAM_EN;
 
-	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_dispout,
-					 ARRAY_SIZE(cmd_dispout));
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd_dispout,
+					ARRAY_SIZE(cmd_dispout));
 }
 
 static int nt35950_get_current_mode(struct nt35950 *nt)
@@ -284,109 +258,68 @@ static int nt35950_on(struct nt35950 *nt)
 {
 	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
 	struct mipi_dsi_device *dsi = nt->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	nt->cur_mode = nt35950_get_current_mode(nt);
 	nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
 	nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = nt35950_set_cmd2_page(nt, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = nt35950_set_data_compression(nt, mode_data[nt->cur_mode].compression);
-	if (ret < 0)
-		return ret;
-
-	ret = nt35950_set_scale_mode(nt, mode_data[nt->cur_mode].scaler_mode);
-	if (ret < 0)
-		return ret;
-
-	ret = nt35950_set_scaler(nt, mode_data[nt->cur_mode].scaler_on);
-	if (ret < 0)
-		return ret;
+	nt35950_set_cmd2_page(&dsi_ctx, nt, 0);
+	nt35950_set_data_compression(&dsi_ctx, nt, mode_data[nt->cur_mode].compression);
+	nt35950_set_scale_mode(&dsi_ctx, mode_data[nt->cur_mode].scaler_mode);
+	nt35950_set_scaler(&dsi_ctx, mode_data[nt->cur_mode].scaler_on);
+	nt35950_set_dispout(&dsi_ctx, nt);
 
-	ret = nt35950_set_dispout(nt);
-	if (ret < 0)
-		return ret;
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0);
 
 	/* CMD2 Page 1 */
-	ret = nt35950_set_cmd2_page(nt, 1);
-	if (ret < 0)
-		return ret;
+	nt35950_set_cmd2_page(&dsi_ctx, nt, 1);
 
 	/* Unknown command */
-	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x88, 0x88);
 
 	/* CMD2 Page 7 */
-	ret = nt35950_set_cmd2_page(nt, 7);
-	if (ret < 0)
-		return ret;
+	nt35950_set_cmd2_page(&dsi_ctx, nt, 7);
 
 	/* Enable SubPixel Rendering */
-	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PARAM_SPR_EN, 0x01);
 
 	/* SPR Mode: YYG Rainbow-RGB */
-	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PARAM_SPR_MODE,
+				     MCS_SPR_MODE_YYG_RAINBOW_RGB);
 
 	/* CMD3 */
-	ret = nt35950_inject_black_image(nt);
-	if (ret < 0)
-		return ret;
+	nt35950_inject_black_image(&dsi_ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
-	msleep(120);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		return ret;
-	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	nt->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	nt->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int nt35950_off(struct nt35950 *nt)
 {
-	struct device *dev = &nt->dsi[0]->dev;
-	int ret;
+	struct mipi_dsi_device *dsi = nt->dsi[0];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(nt->dsi[0]);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		goto set_lpm;
-	}
-	usleep_range(10000, 11000);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(nt->dsi[0]);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		goto set_lpm;
-	}
-	msleep(150);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
 
-set_lpm:
-	nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
-	nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+	if (dsi_ctx.accum_err) {
+		nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
+		nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+	}
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int nt35950_sharp_init_vregs(struct nt35950 *nt, struct device *dev)
@@ -427,7 +360,6 @@ static int nt35950_sharp_init_vregs(struct nt35950 *nt, struct device *dev)
 static int nt35950_prepare(struct drm_panel *panel)
 {
 	struct nt35950 *nt = to_nt35950(panel);
-	struct device *dev = &nt->dsi[0]->dev;
 	int ret;
 
 	ret = regulator_enable(nt->vregs[0].consumer);
@@ -452,10 +384,8 @@ static int nt35950_prepare(struct drm_panel *panel)
 	nt35950_reset(nt);
 
 	ret = nt35950_on(nt);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	if (ret < 0)
 		goto end;
-	}
 
 end:
 	if (ret < 0) {
@@ -469,12 +399,8 @@ static int nt35950_prepare(struct drm_panel *panel)
 static int nt35950_unprepare(struct drm_panel *panel)
 {
 	struct nt35950 *nt = to_nt35950(panel);
-	struct device *dev = &nt->dsi[0]->dev;
-	int ret;
 
-	ret = nt35950_off(nt);
-	if (ret < 0)
-		dev_err(dev, "Failed to deinitialize panel: %d\n", ret);
+	nt35950_off(nt);
 
 	gpiod_set_value_cansleep(nt->reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(nt->vregs), nt->vregs);
-- 
2.46.0

