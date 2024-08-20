Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78589581D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1069010E56C;
	Tue, 20 Aug 2024 09:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VL4nwIYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D022B10E585
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:16:07 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7094468d392so2923891a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724145367; x=1724750167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCBslt5gB3nUXvXHwuQOQFRpSOaNMZ/Utr1g4nHpxtg=;
 b=VL4nwIYau63g3o8kjgr6FOB1PrLJVnbEH5CvcY/yG+nOnbS1MyeQL+C5ogxyzZLbL2
 Oj+/5HA2/o0qBxCnpl8P9LDM+Zo3jtM2vsuK4hJ/lYXzhN15Z1FSAQhRZOiJH4z33xER
 KB08WAIdoR6qXrFNdDgFLL7x3f47gY47LyeCA2EYBw9X+TEnXxG1uUSjXKy1zppGxr/D
 vcXEZ9Kdxgl6wgsFC7pw7oqFxAKiP4H/aaD5cjqgnbgxdvDsZC9wbvmEjlHecxY5LC1+
 DrBiKvh6hyLbqiDA3RyOUsqp5jOtH2ecCmoLqarX9WjcMv513/tgZVwss+JlL7rCcZa9
 Z+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724145367; x=1724750167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCBslt5gB3nUXvXHwuQOQFRpSOaNMZ/Utr1g4nHpxtg=;
 b=SJiKX5GyLvWXZJJtST1uBv6B1+z0aQ8LFGzM/7Q6zYoJeJ7IIkkLvakttq6/dV7DDL
 tQFp0EI1uXDB/18XJw62jaCMUJrycu4r+4xxbz6cw4leW0ZEijln6U+yeE6qQse8++RQ
 PrGYthvhiwNMlnH1Cb9psinh0gxCrzBsdjz6l6swrm+RkAnpjNUhMC7q1KRtHG9Y2u13
 lMIiKGoFtZikY/dvJFZiO50fglHJMmS8Nj5cvM2k8DI9wj3PwVQBn9wWI/PfHoYibDQi
 xmdt+lrd7GJOQgr0i8KsKsjA3bUKYII5O2EqKZ6KlHDFScMT2i8xgPr5RbyPaxf9bkIj
 KZ6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqS6i2apdsrB2hkMUeV217e9vnK0rb7taGePlA4g2yeP+KForSFesa70sjIz3g0PSjllgNm0umXCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyxJqmoIUa2UGmEllI0n5GjGzE/3xO8MjXAHUD12QTmRnJDPjl
 tbh+5qG3XwYalKIe7eqAKQdFloLbdcbsCAbns3GynoBDAE2d7TFp
X-Google-Smtp-Source: AGHT+IFTHbQP2i+11NODPc5ivc3dGCL2Qv/b7ATn9hndWNG81Yc7BxFDpJm/MjT/LMk7E9O51oBAJA==
X-Received: by 2002:a05:6830:6388:b0:704:4abf:c0d6 with SMTP id
 46e09a7af769-70cac86e087mr16684504a34.20.1724145366764; 
 Tue, 20 Aug 2024 02:16:06 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61c6f12sm8998575a12.35.2024.08.20.02.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:16:06 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: agx@sigxcpu.org,
	kernel@puri.sm,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 1/2] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
Date: Tue, 20 Aug 2024 14:45:53 +0530
Message-ID: <20240820091556.1032726-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820091556.1032726-1-tejasvipin76@gmail.com>
References: <20240820091556.1032726-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes the mantix-mlaf057we51 panel to use multi style functions for
improved error handling.

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 77 +++++++------------
 1 file changed, 26 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index ea4a6bf6d35b..2a365eaa4ad4 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -45,82 +45,57 @@ static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
 	return container_of(panel, struct mantix, panel);
 }
 
-static int mantix_init_sequence(struct mantix *ctx)
+static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	struct device *dev = ctx->dev;
-
 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
-
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
 
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
-	msleep(20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xA9, 0x00);
 
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
-	msleep(20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
+	mipi_dsi_msleep(dsi_ctx, 20);
 
-	dev_dbg(dev, "Panel init sequence done\n");
-	return 0;
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
+	mipi_dsi_msleep(dsi_ctx, 20);
 }
 
 static int mantix_enable(struct drm_panel *panel)
 {
 	struct mantix *ctx = panel_to_mantix(panel);
-	struct device *dev = ctx->dev;
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
-	int ret;
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mantix_init_sequence(ctx);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		return ret;
-	}
+	mantix_init_sequence(&dsi_ctx);
+	if (!dsi_ctx.accum_err)
+		dev_dbg(ctx->dev, "Panel init sequence done\n");
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode\n");
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
-	usleep_range(10000, 12000);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
 
-	ret = mipi_dsi_turn_on_peripheral(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to turn on peripheral\n");
-		return ret;
-	}
+	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int mantix_disable(struct drm_panel *panel)
 {
 	struct mantix *ctx = panel_to_mantix(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "Failed to turn off the display: %d\n", ret);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int mantix_unprepare(struct drm_panel *panel)
-- 
2.46.0

