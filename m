Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68ECA03B05
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6135210E074;
	Tue,  7 Jan 2025 09:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjCvOXYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB15410E2FC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:27:03 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so230562535ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 01:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736241963; x=1736846763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKU4IMI5LG3FuHKGBpGsrhUwTClW9jCn/M8PA3TjvEQ=;
 b=cjCvOXYPUg/JL/nyiDgQNI43ZnQzA/L3+LeekqseB+itOlxz9PvNL9FN9bbBujMi8g
 jZNCtJj8yNm7hYOWMZn6f5fxYbsduxLo1tTjm/QgUvFKYs6gyv0CksIOuESJqAbUpPvP
 fSDaMRYwy2aEOAq0Sp4j9gIWYY2/BS/vHgJVHIONcIb5GiQq+rwH7UUfcLpR/uys2FuZ
 A82zQRwIwbKlwes6Yduu49Ltn/KeLXuW1+Y7QRZDcqfE2OljaaSqDOk7K+iwH0G+RA/u
 FlBgF9wqTBzre8LkGaZAhGDc0v218nFcBeFas6FIsfZo9+MkglDI13L4gzI7IO2g7j6e
 fAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736241963; x=1736846763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKU4IMI5LG3FuHKGBpGsrhUwTClW9jCn/M8PA3TjvEQ=;
 b=Y3+2vGLe3qwtGOJI8bZM3pUo+xWkKY2sZ2svDySOY44g9UX7+Guho7m72wvEmhmHox
 eVGxxB3+669gx1L+YYUUIrqXQyl6KjT8RUgLeWWPdEceMux0eyO55NxEjHXC4zy1Ridb
 cGT1vzlgOnYlucSoqn7KY/CDRBv5LNcDFk4jzBY994gh7bX/8NO0XpqEwJNX6DLjszk/
 1x6riuTJ8KKQAtoVQSHAZXiKDlZkZlQ6rNUSVGw1+fypq/D//BBROqpCI7+mZuB4aukP
 SC6fLt3abjO2Qe8XZy2FYp5cJvx8K12Xwva3Vo9FRPwQAjiwNxNVEnCHOW7GKSfHPnN4
 qiWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX54mNkLmz8bGTs7KA63ql7OP0Or6sP5HACJ3nmrc2Gx6o7uOC2xyBUlklxqmSbdFEqdehbQ4cyZv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjJKfFd2+Hsc75IuQJ6ZBTxUCQxx17J3tfpMY3jHJqjQjGQ3B4
 eCdMvZj6FoSRNouyBt2bEet0Icv+bZdoixmSWMNGYos3sC4VQ8c8
X-Gm-Gg: ASbGncv21q2pR8r0BMQSSPOg0Ys1EfOzqR6Ejij0lfpSt5D4okgv2WzsgWwZX0yfOJw
 zOyZ2bSbZiQDSk5vpnMdZb9Kq18NxRuvL8V0wC4NYUKRMcr8pQZ5LomY/oE43zbRqw/GTFto6Hg
 oDpvXnaBxv32rvkzHyOYFRxXOE5Fzu9TJbNrTIFbwPlchk/C2EZHi018q0DSong9EQfJC8x6uge
 yb5Jojz5ZNO6RPfipDZwCDLrxvY8NdbcJvRj1kGTMsk2LFi2FwYJqShCfuzc5tybOH9u9fnYngW
X-Google-Smtp-Source: AGHT+IERcs7oTQciylP5utKBFi74vr6wmSWO1n4Holt1ASKTl0NbllXZdVp74aS9RpMfrv0+QKkZsQ==
X-Received: by 2002:a05:6a00:4ac4:b0:725:41c4:dbc7 with SMTP id
 d2e1a72fcca58-72d103b392fmr3868673b3a.4.1736241963257; 
 Tue, 07 Jan 2025 01:26:03 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([14.139.187.71])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad831160sm32929896b3a.59.2025.01.07.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:26:02 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
Date: Tue,  7 Jan 2025 14:55:10 +0530
Message-ID: <20250107092510.174089-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Changes the xinpeng-xpp055c272 panel to use multi style functions for
improved error handling.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Changed print statement to conditionally run
    - Removed unnecessary error message
    - Reverted 2 mipi_dsi_msleep to msleep

Link to v1: https://lore.kernel.org/all/20241223052049.419831-1-tejasvipin76@gmail.com/
---
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 178 ++++++++----------
 1 file changed, 80 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 22a14006765e..2b91414c2829 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -59,91 +59,80 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
 	return container_of(panel, struct xpp055c272, panel);
 }
 
-static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
+static void xpp055c272_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	struct device *dev = ctx->dev;
-
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETMIPI,
-			       0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
-			       0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
-			       0x00, 0x00, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
-			       0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
-			       0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETSCR,
-			       0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
-			       0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEQ,
-			       0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
-			       0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER,
-			       0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
-			       0x67, 0x77, 0x33, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
-			       0xff, 0x01, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
-	msleep(20);
-
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP1,
-			       0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
-			       0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
-			       0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
-			       0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
-			       0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
-			       0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
-			       0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP2,
-			       0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
-			       0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
-			       0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
-			       0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
-			       0xa0, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
-			       0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
-			       0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
-			       0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
-			       0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
-			       0x11, 0x18);
-
-	msleep(60);
-
-	dev_dbg(dev, "Panel init sequence done\n");
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETMIPI,
+				     0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
+				     0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
+				     0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPOWER_EXT, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETRGBIF,
+				     0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETSCR,
+				     0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETEQ,
+				     0x07, 0x07, 0x0b, 0x0b, 0x03, 0x0b, 0x00, 0x00,
+				     0x00, 0x00, 0xff, 0x00, 0xC0, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPOWER,
+				     0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
+				     0x67, 0x77, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
+				     0xff, 0x01, 0xff);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETBGP, 0x09, 0x09);
+	mipi_dsi_msleep(dsi_ctx, 20);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGIP1,
+				     0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
+				     0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
+				     0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
+				     0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
+				     0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
+				     0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
+				     0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGIP2,
+				     0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
+				     0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
+				     0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
+				     0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
+				     0xa0, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGAMMA,
+				     0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
+				     0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
+				     0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
+				     0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
+				     0x11, 0x18);
+
+	mipi_dsi_msleep(dsi_ctx, 60);
 }
 
 static int xpp055c272_unprepare(struct drm_panel *panel)
 {
 	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
-
-	mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
@@ -155,17 +144,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 {
 	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vci);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
-		return ret;
+	dsi_ctx.accum_err = regulator_enable(ctx->vci);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "Failed to enable vci supply: %d\n",
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
 		goto disable_vci;
 	}
 
@@ -177,26 +168,17 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	/* T8: 20ms */
 	msleep(20);
 
-	ret = xpp055c272_init_sequence(ctx);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		goto disable_iovcc;
-	}
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		goto disable_iovcc;
-	}
+	xpp055c272_init_sequence(&dsi_ctx);
+	if (!dsi_ctx.accum_err)
+		dev_dbg(ctx->dev, "Panel init sequence done\n");
 
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* T9: 120ms */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+	if (dsi_ctx.accum_err)
 		goto disable_iovcc;
-	}
 
 	msleep(50);
 
@@ -206,7 +188,7 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 disable_vci:
 	regulator_disable(ctx->vci);
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode default_mode = {
-- 
2.47.1

