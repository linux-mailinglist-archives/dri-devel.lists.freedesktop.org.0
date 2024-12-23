Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A89FA9F8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 06:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5710E0BA;
	Mon, 23 Dec 2024 05:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lZmGSM75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15EA10E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 05:21:09 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21631789fcdso31527525ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 21:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734931269; x=1735536069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z1P8ZimmFDSm+kATc1SlgQhe/tkqQ/6MQe726fNc0XU=;
 b=lZmGSM751tYtNkvsYg7S29j15DS/93n8d2c/QfZlJdvHvpzzZ97EcLWL7zQYI9NI+3
 vxfCqszwQlwZI2PfIeZHLJeCpkMx6H2kAVoUWcz7Oe5TKYuaqijx00EwoY455mdui+gz
 mKW8czCuoL22p0USxZ04KC+UmAueSKNgaa5AxUiy7ha1EjK90g9ofMQ7FMPSYXlOjJXm
 N/srIJYk24beNs90k2Y3Z/AEMDszHiOLSfv8XMgyiGLyzFIeA3dyppl3jYQW6erSrjxA
 PrO6uUUozVwNEGjhxuZXKS93rx3OB6PeywjhahNdilyuwyFWfwXzW0lWDPGEqLEAHH5x
 6D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734931269; x=1735536069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z1P8ZimmFDSm+kATc1SlgQhe/tkqQ/6MQe726fNc0XU=;
 b=vxYe5j/nxSBlZbHHbQBEK6fy0T9fO0qysXJxsVzxcxg9d5mi6L1u1QDumQUXtOaXgk
 akN0H2ygDQRF8N/5F4UPjgZiwlTLUJqSwN8WAqSigGgtOZFWJ0bpAusoapj3ldCawspR
 ILWUfmLo675c0BuST1D7+24YgyqCJMaviSFrNJsxBYZzxJccqIdGL6F3OeSR9M0tN6ea
 Bn/Rmq+ImshjgpLhZQgEo4mz5RcCL6//xF4p7/WtoxY8g6Q6gAhSliM7RM3s7zcITU7O
 e3cL0y9EWyxVNquFoxBFnY0vfVWZtJiIMoWyBC64Jhef4SeUsfgZsYF04wvfquxP/KU3
 CAzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5eCRy1dFUmvQl4vWW4DGpt0E2vMQLHorxzNoK0CGxko0AQOUJ8/fQAp3M1BV6AUjNXtJcEoNtKO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaOEtMwDj5v/UF3kUA/MAFzO61sXf1TAhNw2eYqDmhXqQkTs4c
 vHWbssNzsFh3ez4JEEPIKapihQEVm3FW+j4zOjJjQUGKqZ180HWq
X-Gm-Gg: ASbGncsS6fpJ714oHRvFRoyYnUIJMvQFHrRYUm6UjRDzRXc9tcpOF+0z8O46iLfGw5q
 LpV36Bjhs/x+3+ZZs3EKiBKs/kbOItMP95CAucrUD08mlyNv2FqeTl789QCwWlBG2GEdQu/WDxQ
 THA1lB+xwEo3JeGafFKRV6qF+0vGgq1izF4kuD8d2//f37XnMomH0/ltfxwPvdlD102Y7H2HEa7
 NnjMxmICaFkUjSA8Dp/Dr5OS3yAXlhNCW4kevmBr1RcCVR+W+lGOq3DXbM9WY/HKdqQ6IK1+jk=
X-Google-Smtp-Source: AGHT+IHxyWwQxSbAUSZSP6d//wIU2z9g3P9SpOoLPXJki9gDcc5HwfnJojtvzNsfY7zekmcWD0iAeA==
X-Received: by 2002:a17:903:41c8:b0:215:8847:4377 with SMTP id
 d9443c01a7336-219e6cf8584mr179839465ad.15.1734931269184; 
 Sun, 22 Dec 2024 21:21:09 -0800 (PST)
Received: from distilledx.localdomain ([122.172.86.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d945csm64755955ad.117.2024.12.22.21.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 21:21:08 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped
 functions
Date: Mon, 23 Dec 2024 10:50:49 +0530
Message-ID: <20241223052049.419831-1-tejasvipin76@gmail.com>
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

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 185 ++++++++----------
 1 file changed, 84 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 22a14006765e..45a405669593 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -59,90 +59,82 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
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
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
-
-	mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "failed to enter sleep mode: %d\n",
+			dsi_ctx.accum_err);
+		return dsi_ctx.accum_err;
 	}
 
 	regulator_disable(ctx->iovcc);
@@ -155,17 +147,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
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
 
@@ -175,30 +169,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 
 	/* T8: 20ms */
-	msleep(20);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
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
+	dev_dbg(ctx->dev, "Panel init sequence done\n");
 
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* T9: 120ms */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
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
 
@@ -206,7 +189,7 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 disable_vci:
 	regulator_disable(ctx->vci);
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode default_mode = {
-- 
2.47.1

