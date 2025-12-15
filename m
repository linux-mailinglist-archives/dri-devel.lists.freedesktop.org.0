Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60FCBD40F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7716110E3C5;
	Mon, 15 Dec 2025 09:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WDD1z13v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442210E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5958232f806so3780053e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792068; x=1766396868; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iHh21ATHzk36Wyf37xfOj1ULk6gBmqRm9g0siGaoNDM=;
 b=WDD1z13vUJhbR1xjxjPh5vIPdwCfmbjDRiWAN9J1YDrHxupcCWhFFQL/8mzaiDV3ng
 pzirPzM6aAqQTQis0qOJtEHnDVk17pkFqOUlm7ifjpv5T5aCSArXK7/tcoQjEVda78hC
 juDqk+l18qJlODdPAQEaXiEo7WxmDtxSBNSURjNxMf7RHypQrIlJa/OvK/RVkyJBvrXe
 vlTq5XqPYL42IdwmZpmMFfRciVgsOrg75dx7YZEiqexi71ZCg5mSP8gdfW43FNtKUw7A
 v+8q45NK0IJTRHc7qhJ4hKYmc1pECTnYAxrjw0FgYnTySq7gFBkF78alfBTNrFqm8IQI
 Q6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792068; x=1766396868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iHh21ATHzk36Wyf37xfOj1ULk6gBmqRm9g0siGaoNDM=;
 b=SZ7b6MMGDYlJYpIsGgtYfT3VWRajSvayIb+wIM0cTlbpPBW5AQxiYbNxNFd7/Li+GW
 fIEMZYEmf8stj5Lw2FdxF/Qu727RLFswUKeK7hcfZlOdspEcHu3Ud9BpnL6Mbw+7+o8d
 wNNyV6oIQdsIVros0Q7B6rMIVsryAt2q8xWBCderMXKo+U5W7dZBoUDzGGRa/Bs4fMHy
 Xd/tOnoznf8FgbYfIMEEdaAb6IJzHpubigB57QalrpIuk7o6WDhiqeHU0wgKvGD1YhMg
 Ro2a/dh/rEVIY8oHVSbLeL4P0MqLfWhZsYo0AFgaaRq9GqpoZzcOp5NH9avtH77ahErP
 rD6g==
X-Gm-Message-State: AOJu0YxUuBtkFrINZBYlzUc5eDPJ1ExWYDzSDMrWXewOmDFcVHq+EEIA
 2if/yAqxDdXQZHx5E1rsFqS53KWOPduNYelDxULLTC/DkAxf6d7CD8v/nclVz0YI
X-Gm-Gg: AY/fxX5ELHqVFLdjAHLZBFQBrkHZ3lSwiGQAIPO0Kjj+jLgntedKwUddGk95eMm0M5Y
 wjA5NgqIXygD0v80rRwb4bImjrirbAJPSdGiww4wHMFNCvuLxO9cMiCB757RKjMMmGBjMVJpGkS
 bXHlj/9EIxtdqNxiIP0VNpTO2FbtHtc0i7p8jQBG5jJmMR6+kldoqyoYDGYmVFaKBCrnGwe2dH6
 YFSkQ2rJLRFMPzpDgWABm7k0wYCT3zjVHiGEqrofvOhPTiBKKdgUcuo6FrzZKp4Jtdsh28s83hv
 xJGHPxHNSFjsLoU9phtCAsb+tODzrZgA8KGY/qwqNuPnn405n8oZtWcUUF57OAk56RvVQtVh/EJ
 KhPmuEM9+RhOM5cJLNzAso6UTEayJQdl28JfKgpGFmH93vhLpd9bFmoIz3EhTK13Zrwx/Hatn2l
 ME15RCiO1VYplg58JvPADxLlfrmoEwbnOEPF5S1ZLpj7jrxs9pOGu5JCWq
X-Google-Smtp-Source: AGHT+IFPRH7innrMJDrIBL4kUCc67yQcJ0xezI294PNWWxsE6ABkREGAsZxyrbhIxSCXQYYuz+Mw7w==
X-Received: by 2002:a05:6512:3d03:b0:594:5000:4554 with SMTP id
 2adb3069b0e04-598faa3bac4mr3067488e87.28.1765792067276; 
 Mon, 15 Dec 2025 01:47:47 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:45 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 10:46:45 +0100
Subject: [PATCH v3 3/7] drm/sitronix/st7571-i2c: move common structures to
 st7571.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251215-st7571-split-v3-3-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7782;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=fzBEes00MA8LplTokptIrEwWvt/TkrtTz8Xr/mXVBf0=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9km3U49gakwF/cCdgbYFAuN3Z1+w8fidRrzZ
 ZRX7slrryGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZJgAKCRCIgE5vWV1S
 MoRWEAClYp/jOJbpjy1iAIya7dVS0NnxRM41MMyeA2E93KC5T2NEkuTvm1iNvrrcIfEMsumhXE7
 6RpFCVKxMO8qQn3IDJWOGL1axYfsNOwRx0u5VONxS3+hZZ1dOSBpEkdDgq56X8BDiFOHtVxU5EV
 72DmNmAC/lsIYrQHMxnUms4HiLWlTtUVN6gSYMRsIZrUD3i0N4ut+WqAKCFoepTEyEZhzf5q/63
 b2G614AKz/i7AbtPcKL19iiPrK7V8IE3uenD5xrauwBWTsS6gkWN0pX0j3TGRHsV8zYebo2fwo6
 UBlDBbEZ2o13W8MolP0IOhouQzOAojDmCVnZybLoK74D5x4ZgzVTBNJDiEBdaM0MD8GiE+FUCRv
 neMYrG6uXqRSZZqm1+T5De0BiilSgB+egPSKIjjqYuPrx2tX5GK4vDcPBDRLCZar2oQvfGAhY3q
 ikGWgbtm0+XaxVsJ8ddX6hOt4k8rr9LzT6rG7kt61jqZ6/lOhOc6eZ95h/LTaXubpo2lIYeW9Fb
 8dW6iOhtO1qceYRYtI51GLtr3nlGuj/4Z2QCYjf6U5lnu0a+5fjAfi6qwDh+wyDfsvmlxGWgoz4
 8IlJQGBViwZwmCq1EDAByP68jvWBycPFhXALZNNvHmQ74nl7S9moUSIVbdKc3y3g+hYks1H7XFg
 MJkpB3fFgJx7dag==
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c |  91 +---------------------------
 drivers/gpu/drm/sitronix/st7571.h     | 108 ++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 89 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c830fd648572..ac4293d5089c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8106,6 +8106,7 @@ S:	Maintained
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

