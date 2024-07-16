Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037E93278A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FEE10E28C;
	Tue, 16 Jul 2024 13:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AvQOkbjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AB810E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:31:59 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-71871d5e087so4065812a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721136719; x=1721741519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bFRa+gyk0+Wb2cW/t0w5uYAjjmEn+HI1ogQknR97FUM=;
 b=AvQOkbjLfzqXTJgWvNfy4JYBQZ9+Wgd7ZGYzjm7tRZwHMbCzqmX1vsjsrPYwFAUm77
 vY9Nqc7+KmkrlqMLIet2SqC0C5f05lcZ+QSmQTQ9pCrddAcU40QpRXJw9lR6/8qgvwJ1
 kclKulo0kwclr2pai+/Tc0n5j147o04ucKWO+8TXwKvZCeu9zKw3BDBswJWLlxA3h/sg
 eHYsuCrfy0d7Hz5o15LyPKFu4zteTetkBlrHep3EwBSFm0lURek+PYV7QgYTUWI6XgGW
 PgWX7t1dzD9TZeLS8u7BlZQLqTuDN8fz09BWnrC2KYgoqLsVbkdcPCIXczpV4T/+nxtu
 3NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721136719; x=1721741519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFRa+gyk0+Wb2cW/t0w5uYAjjmEn+HI1ogQknR97FUM=;
 b=kWCIA6nYJpXQ0JqJjaCN0FJpM5GFTVyX2Ym2rFibTDfbgkbg6v1iQFrmrHMjD/DiMo
 LxFtzqm8q8lMItHs8ROMvUFjp1qcM42XOuFyEpzZabpfffM9+otIhBfumWBfZGS+IE5a
 AePEkSaj2k1icM7oa6EvM6ZcOk31K0Kvz1ieiAtMHe1y6dbjPTjvoTqEqiiSp1AUchRe
 jacId9GJFin03GMiLqc2OBCY54Cf/S8Wy5qkWYsZ5pbDHevv7WQuD3lgZNd53er4Omb5
 tjG4UBc7J1tGBUJypO11Vyy02R+Nv//TGDn+XjjIgeV9ZXR0uOWpCC+TUmEuMdxI7c3h
 LiiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzwjqLUWAk7/w3A2OTBXSK99m59FKUc9Vt5ECXgp7Xe5gfGlUcU8MHTetLtZv83VRrGqDgUcX/8vUP3E/F/Zjf05hhcZ0kuroY7MKCLDan
X-Gm-Message-State: AOJu0Yy+XFJ6P8OcLIK72EFx1kf1BoBhFuBbG/kra5Wck6M+M5TX7Wd0
 OYxq7QZCh5gzyhkE0Fcl9jP+cMgEcNsns0RwSJktd8jKN/Yd3G67
X-Google-Smtp-Source: AGHT+IHTj7zY/KPUAV9SBLb534DACqmlDWpXtSyY9C02UqQ8tbFXYPCD8B8+QKQ+UPlb9DfFGoj3Hw==
X-Received: by 2002:a05:6a21:398f:b0:1c2:9208:3421 with SMTP id
 adf61e73a8af0-1c3f122f5e1mr2401132637.28.1721136718804; 
 Tue, 16 Jul 2024 06:31:58 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6340:1ec9:d5f:aa00:a86b:ee8f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc2733asm58400015ad.162.2024.07.16.06.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 06:31:58 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
Date: Tue, 16 Jul 2024 19:01:17 +0530
Message-ID: <20240716133117.483514-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Introduce 2 new macros, DSI_CTX_NO_OP and MIPI_DSI_ADD_MULTI_VARIANT.

DSI_CTX_NO_OP calls a function only if the context passed to it hasn't
encountered any errors. It is a generic form of what mipi_dsi_msleep
does.

MIPI_DSI_ADD_MULTI_VARIANT defines a multi style function of any
mipi_dsi function that follows a certain style. This allows us to
greatly reduce the amount of redundant code written for each multi
function. It reduces the overhead for a developer introducing new
mipi_dsi_*_multi functions.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 286 ++++++++++-----------------------
 1 file changed, 83 insertions(+), 203 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..53880b486f22 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1430,214 +1430,94 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_large);
 
 /**
- * mipi_dsi_picture_parameter_set_multi() - transmit the DSC PPS to the peripheral
- * @ctx: Context for multiple DSI transactions
- * @pps: VESA DSC 1.1 Picture Parameter Set
- *
- * Like mipi_dsi_picture_parameter_set() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
-				   const struct drm_dsc_picture_parameter_set *pps)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_picture_parameter_set(dsi, pps);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending PPS failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_picture_parameter_set_multi);
-
-/**
- * mipi_dsi_compression_mode_ext_multi() - enable/disable DSC on the peripheral
- * @ctx: Context for multiple DSI transactions
- * @enable: Whether to enable or disable the DSC
- * @algo: Selected compression algorithm
- * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
- *
- * Like mipi_dsi_compression_mode_ext() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
-					 bool enable,
-					 enum mipi_dsi_compression_algo algo,
-					 unsigned int pps_selector)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_compression_mode_ext(dsi, enable, algo, pps_selector);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending COMPRESSION_MODE failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
-
-/**
- * mipi_dsi_dcs_nop_multi() - send DCS NOP packet
- * @ctx: Context for multiple DSI transactions
- *
- * Like mipi_dsi_dcs_nop() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
+ * DSI_CTX_NO_OP() - Calls a function only if no previous errors have
+ *	occurred.
+ * @func: The function call that needs to happen.
+ * @ctx: Context whose accum_err is checked to decide if the function
+ *	should run.
  */
-void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS NOP failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_nop_multi);
+#define DSI_CTX_NO_OP(func, ctx)	\
+	do {				\
+		if (!(ctx)->accum_err)	\
+			func;		\
+	} while (0)
 
 /**
- * mipi_dsi_dcs_enter_sleep_mode_multi() - send DCS ENTER_SLEEP_MODE  packet
- * @ctx: Context for multiple DSI transactions
+ * MIPI_DSI_ADD_MULTI_VARIANT() - Define the multi variant of
+ *	an existing MIPI DSI function.
+ * @proto: The prototype of the desired multi variant
+ * @err: The error string used by dev_err on an error occurring.
+ * @inner_func: Identifier of the function being wrapped
+ * @...: Any arguments that need to be passed to inner_func
  *
- * Like mipi_dsi_dcs_enter_sleep_mode() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
  */
-void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS ENTER_SLEEP_MODE failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode_multi);
-
-/**
- * mipi_dsi_dcs_exit_sleep_mode_multi() - send DCS EXIT_SLEEP_MODE packet
- * @ctx: Context for multiple DSI transactions
- *
- * Like mipi_dsi_dcs_exit_sleep_mode() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS EXIT_SLEEP_MODE failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode_multi);
-
-/**
- * mipi_dsi_dcs_set_display_off_multi() - send DCS SET_DISPLAY_OFF packet
- * @ctx: Context for multiple DSI transactions
- *
- * Like mipi_dsi_dcs_set_display_off() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS SET_DISPLAY_OFF failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off_multi);
-
-/**
- * mipi_dsi_dcs_set_display_on_multi() - send DCS SET_DISPLAY_ON packet
- * @ctx: Context for multiple DSI transactions
- *
- * Like mipi_dsi_dcs_set_display_on() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS SET_DISPLAY_ON failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on_multi);
-
-/**
- * mipi_dsi_dcs_set_tear_on_multi() - send DCS SET_TEAR_ON packet
- * @ctx: Context for multiple DSI transactions
- * @mode: the Tearing Effect Output Line mode
- *
- * Like mipi_dsi_dcs_set_tear_on() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
-void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
-				    enum mipi_dsi_dcs_tear_mode mode)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	if (ctx->accum_err)
-		return;
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
-	if (ret < 0) {
-		ctx->accum_err = ret;
-		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
-			ctx->accum_err);
-	}
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
+#define MIPI_DSI_ADD_MULTI_VARIANT(proto, err, inner_func, ...)	\
+proto {								\
+	struct mipi_dsi_device *dsi = ctx->dsi;			\
+	struct device *dev = &dsi->dev;				\
+	int ret;						\
+	\
+	if (ctx->accum_err)					\
+		return;						\
+	\
+	ret = inner_func(dsi, ##__VA_ARGS__);			\
+	if (ret < 0) {						\
+		ctx->accum_err = ret;				\
+		dev_err(dev, err, ctx->accum_err);		\
+	}							\
+}								\
+EXPORT_SYMBOL(inner_func##_multi);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_picture_parameter_set_multi(
+	struct mipi_dsi_multi_context *ctx,
+	const struct drm_dsc_picture_parameter_set *pps),
+	"sending PPS failed: %d\n",
+	mipi_dsi_picture_parameter_set, pps);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_compression_mode_ext_multi(
+	struct mipi_dsi_multi_context *ctx, bool enable,
+	enum mipi_dsi_compression_algo algo, unsigned int pps_selector),
+	"sending COMPRESSION_MODE failed: %d\n",
+	mipi_dsi_compression_mode_ext, enable, algo, pps_selector);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_nop_multi(
+	struct mipi_dsi_multi_context *ctx),
+	"sending DCS NOP failed: %d\n",
+	mipi_dsi_dcs_nop);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_enter_sleep_mode_multi(
+	struct mipi_dsi_multi_context *ctx),
+	"sending DCS ENTER_SLEEP_MODE failed: %d\n",
+	mipi_dsi_dcs_enter_sleep_mode);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_exit_sleep_mode_multi(
+	struct mipi_dsi_multi_context *ctx),
+	"sending DCS EXIT_SLEEP_MODE failed: %d\n",
+	mipi_dsi_dcs_exit_sleep_mode);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_set_display_off_multi(
+	struct mipi_dsi_multi_context *ctx),
+	"sending DCS SET_DISPLAY_OFF failed: %d\n",
+	mipi_dsi_dcs_set_display_off);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_set_display_on_multi(
+	struct mipi_dsi_multi_context *ctx),
+	"sending DCS SET_DISPLAY_ON failed: %d\n",
+	mipi_dsi_dcs_set_display_on);
+
+MIPI_DSI_ADD_MULTI_VARIANT(
+	void mipi_dsi_dcs_set_tear_on_multi(
+	struct mipi_dsi_multi_context *ctx,
+	enum mipi_dsi_dcs_tear_mode mode),
+	"sending DCS SET_TEAR_ON failed: %d\n",
+	mipi_dsi_dcs_set_tear_on, mode);
 
 static int mipi_dsi_drv_probe(struct device *dev)
 {
-- 
2.45.2

