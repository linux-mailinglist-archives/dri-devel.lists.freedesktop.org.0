Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B3C63089
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4210E30A;
	Mon, 17 Nov 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFOXouar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF5510E327
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:25 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-376466f1280so44512301fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370264; x=1763975064; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Medmr2NpoJOVqoNvO0X+FtHTdqh1wez08B1RhOyS7Dg=;
 b=aFOXouarAWWHCTRArPusVUXUtUIoP2hZp0KixVL47XJLDxwuEEJsVFSNdFsrf9c46x
 ApPKPx6ssHQlfR3cFtI1IiScQwM850axZGE5u5ictAasGFNLg/FTPMeVXWQemjRTtd6l
 xxdgD7XSzFABmD+/FX7J49x7hh+OvnyC3U8QQSuJyKHm+ZEwVGSIjGWkv2x1Sj3yaeEL
 NsaZkQFf5fod8iqZL3B86Io3+wqm4/IZWMsMEfOhcgFI0vWvKsma6dVHamHfmVVSuxye
 Gyt4pJqGeCnGH8Eg6p/qAVzwdCEEvxMCQ7p7JNpHi1GqYwybTl7vmt8gmZuIu+O8HOCm
 MgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370264; x=1763975064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Medmr2NpoJOVqoNvO0X+FtHTdqh1wez08B1RhOyS7Dg=;
 b=OpraLxuhW85cwklq7HYvYlOnt3BjYnDxUqK17EcE49wXZlZyIEKP5ZZ7f9jBEz/M0B
 F7ODnQWHQbavmp+Nkx1RjKbvYQhRuAROLbp5qLj8AjoSHS0WFbDPMccgPMR7+YSbuF4k
 TzCI5IIoxWLrS8rNKAzpW0X2CwSElGMOIeLAVgLuMFXlx8MXYKCDBqpr3YnWIZysxURo
 bjHe5HuN6+AjP9jzZXWWg7mb4//Wb4RpjLuyj8RQOm2vASVczWpal2P8ldE/Wtgd8wfw
 C+jdF6cjwaGCU5SMm80oz2fk5/wRIP6UHnbtF+EmBwsPwiC96rnxQkNVb6PKnCu7Tfru
 GDow==
X-Gm-Message-State: AOJu0Yz4W+J+gEYM2L1UHDpYUmt71VBrmI+dFklMYtvbDXYMkXxkyjYT
 XB20lRtMXmTYWka40y7z8WyPDmIl/7yFBWCMaHNM9T0tZuiAdxSoIBQS
X-Gm-Gg: ASbGncsNYS5fi8Cryfk94o/N+g9re60rP1m0RhJ6nXfIAaGoGhrxuSS45bDzCZr/w4v
 LrUmGdLiWfh2kvZQW1twUzIMbnYyzkkHrGDUzqNfvQA8hw58ucRd0PGNueCQfccWfmpFx9t7bxZ
 jML7fLShu1lDsrp+uWb3lyVt1j8p1ooGaWxuh+qDOThTI6x2oR+epVk/hrnhJbjwqYMNzN5K0nX
 /KqO5z0docAhlVZ+324OAkhVeZwRphR8jJY5NPX45d9M0Egye3zsmy77MLkAb3npxX5g32zJX/u
 Ykhw92hUKW+P7wZOuWM6wKYDVLcyR3/VTHIkX6ZCefqaleeBU+HQusnJ+/WcESXh0d5/7sdh/H6
 Kg/UWz26G7oMZ0lbNNaj1TY5lRZo86DhbwRdfmgLaLadaz5UGNCbPQZq5sdk42as9Rj13fxhYwg
 oXCVhXc/kCs7E0VBpU4fF+V65qQbU0ALa1PgXJwUZ5tCB+6Q==
X-Google-Smtp-Source: AGHT+IHfUAXz6QD6/Zy95WEXKjEmC+vnADNovnfZb7E4//JyqiX73gNeKYwHRIV4UlMWXyDXmfiMYg==
X-Received: by 2002:a05:6512:3e04:b0:57b:7c83:d33b with SMTP id
 2adb3069b0e04-59584224b88mr3805201e87.47.1763370263428; 
 Mon, 17 Nov 2025 01:04:23 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:22 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:03:45 +0100
Subject: [PATCH RESEND v2 3/6] drm/sitronix/st7571-i2c: move common
 structures to st7571.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-st7571-split-v2-3-13189da95265@gmail.com>
References: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
In-Reply-To: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7722;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zhGfd310V5DKHoDZa0//qQ74zGXU+hIHrqN5ed22Y4c=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuT/az8drxCbOwt0fGdPwv3Bd52t2BlOI2fdB
 A3oMlGuk6yJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrk/wAKCRCIgE5vWV1S
 MmngEACfDwCbQ9Btkn+J9mK+N3d4rndsVKwVSPrV/2QljeDNFlhM3NLqlV+CWp1ybAfE150sIqx
 xBFnsSrdwhV2BK6L7ENnhMivrrz8gaHGVn0K9vGMxn7zq4QdpJD/rvuCaNhhpoPQRtj8MKBDKib
 jBlWafAABJlE0q6t6kNltpSO+BdaIDmla5g8Q9ocqZR2xOEIjFyXiB3GFldKBkye7ALkoqxW7p6
 qFMuXV9SmoilNYvcb6UyYKc+CaPsor56RuU9x4a4vWn3UZ0AEe2eAUgjrLlmZg5TA8Pee0YvNVj
 PA28G8f3motPf4qsiLJRtKrNm3JNPTGNCsisgBB+96odZ/dqrO4RMtKQxgEnW0Uuc0o+gqLABfP
 t4Xiero5+4Ibqii0i1OXVPu+auSWUUktBN6pNp5TK0/TfHn74Q35Gw6OKu2WKBXn8n6zj5BKO91
 pzmThgaww+0UTIwfujd3kk4Zc3r3t0m4OVkSn+eZQXFbbg5GWL4Kh0zPh1OzhzS1WtzHkPvgRQB
 7u881uV5rDXwtZyGnob3368VpyYdz0rs8d0JjFkd3ce5oFIEkWMZoVUGF1KZ7YdizyCbdPvJN9G
 Tg3dAxNcNrTW5byrQwUhvyocsTpYmgKnTjBSvFzBsxYNQTIbH94PoclDjpoy8k1ybZ5EMgZd4sB
 xy31vQlITrGnoNg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Move all structures that will be common for all interfaces (SPI/I2C) to
a separate header file.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c |  91 +---------------------------
 drivers/gpu/drm/sitronix/st7571.h     | 108 ++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 89 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc8a7f3f1dab..2814faae61ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8083,6 +8083,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571.h
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 2b52919d7dd4..af27658a5e15 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -35,6 +35,8 @@
 #include <video/display_timing.h>
 #include <video/of_display_timing.h>
 
+#include "st7571.h"
+
 #define ST7571_COMMAND_MODE			(0x00)
 #define ST7571_DATA_MODE			(0x40)
 
@@ -78,95 +80,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-enum st7571_color_mode {
-	ST7571_COLOR_MODE_GRAY = 0,
-	ST7571_COLOR_MODE_BLACKWHITE = 1,
-};
-
-struct st7571_device;
-
-struct st7571_panel_constraints {
-	u32 min_nlines;
-	u32 max_nlines;
-	u32 min_ncols;
-	u32 max_ncols;
-	bool support_grayscale;
-};
-
-struct st7571_panel_data {
-	int (*init)(struct st7571_device *st7571);
-	int (*parse_dt)(struct st7571_device *st7571);
-	struct st7571_panel_constraints constraints;
-};
-
-struct st7571_panel_format {
-	void (*prepare_buffer)(struct st7571_device *st7571,
-			       const struct iosys_map *vmap,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *rect,
-			       struct drm_format_conv_state *fmtcnv_state);
-	int (*update_rect)(struct drm_framebuffer *fb, struct drm_rect *rect);
-	enum st7571_color_mode mode;
-	const u8 nformats;
-	const u32 formats[];
-};
-
-struct st7571_device {
-	struct drm_device drm;
-	struct device *dev;
-
-	struct drm_plane primary_plane;
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-
-	struct drm_display_mode mode;
-
-	const struct st7571_panel_format *pformat;
-	const struct st7571_panel_data *pdata;
-	struct i2c_client *client;
-	struct gpio_desc *reset;
-	struct regmap *regmap;
-
-	/*
-	 * Depending on the hardware design, the acknowledge signal may be hard to
-	 * recognize as a valid logic "0" level.
-	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
-	 * and off-the-shelf panels out there.
-	 *
-	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
-	 *
-	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
-	 * I2C interface compatible.
-	 * Separating acknowledge-output from serial data
-	 * input is advantageous for chip-on-glass (COG) applications. In COG
-	 * applications, the ITO resistance and the pull-up resistor will form a
-	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
-	 * resistance will raise the acknowledged-signal level and system cannot
-	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
-	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
-	 * For applications which check acknowledge-bit, it is necessary to minimize
-	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
-	 *
-	 */
-	bool ignore_nak;
-
-	bool grayscale;
-	bool inverted;
-	u32 height_mm;
-	u32 width_mm;
-	u32 startline;
-	u32 nlines;
-	u32 ncols;
-	u32 bpp;
-
-	/* Intermediate buffer in LCD friendly format */
-	u8 *hwbuf;
-
-	/* Row of (transformed) pixels ready to be written to the display */
-	u8 *row;
-};
-
 static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
 	return container_of(drm, struct st7571_device, drm);
diff --git a/drivers/gpu/drm/sitronix/st7571.h b/drivers/gpu/drm/sitronix/st7571.h
new file mode 100644
index 000000000000..c6fd6f1d3aa3
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Header file for:
+ * Driver for Sitronix ST7571, a 4 level gray scale dot matrix LCD controller
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#ifndef __ST7571_H__
+#define __ST7571_H__
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+
+#include <linux/regmap.h>
+
+enum st7571_color_mode {
+	ST7571_COLOR_MODE_GRAY = 0,
+	ST7571_COLOR_MODE_BLACKWHITE = 1,
+};
+
+struct st7571_device;
+
+struct st7571_panel_constraints {
+	u32 min_nlines;
+	u32 max_nlines;
+	u32 min_ncols;
+	u32 max_ncols;
+	bool support_grayscale;
+};
+
+struct st7571_panel_data {
+	int (*init)(struct st7571_device *st7571);
+	int (*parse_dt)(struct st7571_device *st7571);
+	struct st7571_panel_constraints constraints;
+};
+
+struct st7571_panel_format {
+	void (*prepare_buffer)(struct st7571_device *st7571,
+			       const struct iosys_map *vmap,
+			       struct drm_framebuffer *fb,
+			       struct drm_rect *rect,
+			       struct drm_format_conv_state *fmtcnv_state);
+	int (*update_rect)(struct drm_framebuffer *fb, struct drm_rect *rect);
+	enum st7571_color_mode mode;
+	const u8 nformats;
+	const u32 formats[];
+};
+
+struct st7571_device {
+	struct drm_device drm;
+	struct device *dev;
+
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+
+	struct drm_display_mode mode;
+
+	const struct st7571_panel_format *pformat;
+	const struct st7571_panel_data *pdata;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct regmap *regmap;
+
+	/*
+	 * Depending on the hardware design, the acknowledge signal may be hard to
+	 * recognize as a valid logic "0" level.
+	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
+	 * and off-the-shelf panels out there.
+	 *
+	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
+	 *
+	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
+	 * I2C interface compatible.
+	 * Separating acknowledge-output from serial data
+	 * input is advantageous for chip-on-glass (COG) applications. In COG
+	 * applications, the ITO resistance and the pull-up resistor will form a
+	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
+	 * resistance will raise the acknowledged-signal level and system cannot
+	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
+	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
+	 * For applications which check acknowledge-bit, it is necessary to minimize
+	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
+	 *
+	 */
+	bool ignore_nak;
+
+	bool grayscale;
+	bool inverted;
+	u32 height_mm;
+	u32 width_mm;
+	u32 startline;
+	u32 nlines;
+	u32 ncols;
+	u32 bpp;
+
+	/* Intermediate buffer in LCD friendly format */
+	u8 *hwbuf;
+
+	/* Row of (transformed) pixels ready to be written to the display */
+	u8 *row;
+};
+
+#endif /* __ST7571_H__ */

-- 
2.51.2

