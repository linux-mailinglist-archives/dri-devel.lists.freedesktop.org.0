Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B7CA2E7A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90D110E8EE;
	Thu,  4 Dec 2025 09:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I6te8ew8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B214310E8EE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:07:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47755de027eso4839235e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 01:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764839226; x=1765444026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=I6te8ew8J+qRQWo+FgMwbynoqQkUmj/upSg6jFQrsblL4mtra9i0lh8qQrVZBm7Sp2
 qZv0lbCToE6TPpTD4ACitPqf6q/uJgH86ItLGY9VG/a6oGNFf6Q2GsdwfUORJeMTe3z6
 YBkZwKpuIZHSMoQ3j31ckEm6NJ3FDRYewxty7j3/NynenZ8ZBbUoSpnsisyPTMGP5VPu
 nH1M9H13LIF+fWDnhZHDj9PDfKTznVz9r4F2+gxwUJf95NfGq5qw1VJXCRv+f/Eqq3gu
 bMWFPzhi9Ptdu7nVLy1MTMyTH1OOs6Xgv90J+J3PcRVhsQ6I9M7f2Naj7wP0EoGftXaQ
 5bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764839226; x=1765444026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8ChXUaXX/3Eb7EnyDqnAZz0gJR5wknVDuL7fNH9uhE=;
 b=bQagA7Z/hh77fGFubMtKO+7exZ4CkgllnAZ5iJo8ZjUc/uwnsrmbcEp9IY/bBjQjFs
 VZ4ezR86OUaX37sJYqzC7OMHhBmxGh6Rxny41WwtCRmhj0a7wZxjdOasTo5Zzw6Fgurb
 8/as+27ju291RqJGzqSln7YYE1zG9B1QhJqKExrcbA2PIYm6r3PTHxGnFsezbuzqVJxK
 dYWzCU2d5I7A6T2sBfwiJLIkKYBkpNA6eKz3ppBsVteBnxqBijM7RJIUMiGMzagbm9wI
 Kj8e+VSK+wDxBp3h3nv/8xXwKgoVGOCfFxIphuNpb1dsP+y3SuMMtEngnCJsjNjfu+s6
 HTig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRqEy4mQ/JEL2Tu72IDw4tFCSQ7bePTl4rgJxZVxeb3nX02jLfaxzEP9uQukAbQURAmTo2U6xioS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVdIB+BA/YdCKVT1GtdsD7LuuGtqSHKc2tK8YlwJJFkKBE51zq
 wrCcd6/JD8rQvIXONARikrTY2nO63nDVWYS2bX9ztmHYY/7GoBB2FMge
X-Gm-Gg: ASbGncvytsHr3KnTRP0p9VIct0RmyXqXNC+GOG3kIZ+mURW9pDTziN65D84+mcCQYG0
 MctUd+IgjAxdmxXTCaekw1MXCsAdk7nT+JugGHJmQIKSQT3GPk2jB2aQI5wZzsqnzzNdOQi6qeN
 XrBSMFsFmNSw2BLKXRXeHhy8cZ+Tk0hsGCDM2dkSTh3copNf7ts8w5H4xPymzxNCdTJzVo+KB31
 II43LggQW1l9z1cp3PMw9rhlMlKwByA0QybH+4NqidlfzSfybzDAP8+Er2LOcWNC9EWBAI/v4mL
 3XDYD+ozl4GrhTzwyomuiYbGcvEK9mnrIdMT+W+JW3aQ7VdDJ7VDRQ4vkiqg8abPmztelHRiVIE
 +XdIWI3WM7PEh+niG7P4YtjpDZLe4CuhOpBtjJK3ZdSZV488tv50Y5+b4AyTR62/Yk0oJlE1KWx
 bsVFDe8wYhPUig0rT5UpFwEb4p/USFLdzse/oTr35khLhh+4OF8Ue3vUbREQ1/XULtjKXkupSDl
 ylx5hTLp64=
X-Google-Smtp-Source: AGHT+IE+fjNmLywhUx1OF/Ef/Nev26Vbuf6nO8uNTH6Y7/HAGijxD1TsAJ2OslWR3two3806pxXzyA==
X-Received: by 2002:a05:600c:3541:b0:46e:761b:e7ff with SMTP id
 5b1f17b1804b1-4792f38d6d8mr15427565e9.28.1764839225852; 
 Thu, 04 Dec 2025 01:07:05 -0800 (PST)
Received: from gattout.local
 (2a01cb0012bffa008e9c25a4ae82f3b7.ipv6.abo.wanadoo.fr.
 [2a01:cb00:12bf:fa00:8e9c:25a4:ae82:f3b7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d352a52sm2067423f8f.38.2025.12.04.01.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:07:05 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
To: neil.armstrong@linaro.org
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Amin GATTOUT <amin.gattout@gmail.com>
Subject: [PATCH] drm/panel: otm8009a: Switch to mipi_dsi_multi_context helpers
Date: Thu,  4 Dec 2025 10:07:04 +0100
Message-ID: <20251204090704.87588-1-amin.gattout@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Update the driver to use the non-deprecated mipi_dsi_*_multi()
helpers, as recommended in Documentation/gpu/todo.rst. The multi
variants provide proper error accumulation and handle the required
DCS NOP insertions, which suits the OTM8009A command sequences.

The init and disable paths now return dsi_ctx.accum_err, ensuring
errors are propagated to callers.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 56 ++++++-------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index a0f58c3b73f6..fe31f508efd6 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -113,9 +113,9 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 				   size_t len)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
-		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
+	mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, data, len);
 }
 
 #define dcs_write_seq(ctx, seq...)			\
@@ -133,7 +133,7 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 static int otm8009a_init_sequence(struct otm8009a *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* Enter CMD2 */
 	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
@@ -213,44 +213,28 @@ static int otm8009a_init_sequence(struct otm8009a *ctx)
 	/* Exit CMD2 */
 	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		return ret;
-
-	/* Wait for sleep out exit */
-	mdelay(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Default portrait 480x800 rgb24 */
 	dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, OTM8009A_HDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, OTM8009A_HDISPLAY - 1);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, OTM8009A_VDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, OTM8009A_VDISPLAY - 1);
 
 	/* See otm8009a driver documentation for pixel format descriptions */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT |
 					    MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret)
-		return ret;
 
 	/* Disable CABC feature */
 	dcs_write_seq(ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
 	/* Send Command GRAM memory write (no parameters) */
 	dcs_write_seq(ctx, MIPI_DCS_WRITE_MEMORY_START);
@@ -258,28 +242,22 @@ static int otm8009a_init_sequence(struct otm8009a *ctx)
 	/* Wait a short while to let the panel be ready before the 1st frame */
 	mdelay(10);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_disable(struct drm_panel *panel)
 {
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	backlight_disable(ctx->bl_dev);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret)
-		return ret;
-
-	msleep(120);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_unprepare(struct drm_panel *panel)
-- 
2.43.0

