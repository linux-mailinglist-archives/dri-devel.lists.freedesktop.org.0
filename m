Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A255C9AABA
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D84B10E5C1;
	Tue,  2 Dec 2025 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QB3MCk2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C7B10E5AC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:15 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so5810611e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663974; x=1765268774; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Medmr2NpoJOVqoNvO0X+FtHTdqh1wez08B1RhOyS7Dg=;
 b=QB3MCk2IidN+OmE9OsLYFSyLKLYw++O0A/cKsCyYtM6lOZrIqN+swsD0FFnTD4idjU
 rWNmlGwIKY+OCo6a86i+uUwozgaW/qdwLTnRw7D803pMtbVFe1/Xqbm4sWXnmq6crXvh
 spShn++2blQIvYWEFG8w5SBlouTSnbTNMprdXj4tUUXHSa6heM3jitENtHxAt0jkuKw0
 UNAT+0ctz66imp9BAsBup7H6/Z7w3M3fNLX5m6sMtuQ2Nqsyxp1W61kn84mfIm0eB915
 oyrOTHSPsyVLt7NHKenKfc2USJwy3/mpNAP0Pe10h+Y4wDCX5/hafK+0qcTRTgS/kRsN
 JP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663974; x=1765268774;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Medmr2NpoJOVqoNvO0X+FtHTdqh1wez08B1RhOyS7Dg=;
 b=Tv6f4ahw+DJNoKv0eCRasNdtznl2t4PP2LjFQLSbiWczTGgrNXC6+joe9XZ8isdfL1
 05gkvjO0si/jccuFqtQgOo+tANeBv0G7adsNKU5rmuOjlxBQ3XEtzENf+l7op+5IWoml
 2eS9C4h9hr7r5QXeHhyOEKNPLK75b/JaHedHNj/1gbdXjJOZ92N8v297npmskSLlmViA
 2ziqbMPSpZCG4zG3XmN1p5Q21L23Qx7tBKWEOsq+5H42JD2I3AVpSNNjGJruGB/KL7Or
 +rsRtKNkFNvdP9/jh+XXs+Qbz9zHY6Z0xUq1qghmzLRcJEJOuWHWCG9ChyfTmjKJEGS7
 JoWw==
X-Gm-Message-State: AOJu0YwMvdr8QmeZnlArNbAaHRrdlMVZwWNnBaapym4RCyUVBaJ/pTJx
 4xivIgnv2WMw/ytBfxPGYCFYLlvBimtzu1CF21FixSnR2fESJBW8zc9X
X-Gm-Gg: ASbGnctKKFQVVJntMTvTREO9dWKVR0pIrQERyoWSB4jj814XO1Od/gM3R5ujXLn02mw
 KmaxokEsl5MTJ7wY+WUNN/e7ch2HBIfwHES//w8uEf07N39CuJI6TmDxyaA2Uy8hVFMi9TIwV8E
 82l1Ya7BwgiE9hskY7runDm8eavWEwwYH/SpqVGtW0dN00DGQYa+uzqdsSqnUAsMBRkGrevRmF0
 uPgMMA7u4dgO6mPng2ZGw24Wurdi3OSYBk0fuPejw2IvmJfC9lLNRa9TqNq1GhJGnPdoEILO2/J
 00PK1UOwyb/2BaGg+62sKVYYVSGsIjYq4oPyb8GEzPMEaA0hEnqdyVq8fI4fYNtRs4Z9eNC8pjJ
 MUW3yM3012eYacfXwS5e5YyOUUBKUWT59TBSDGQdFVpG7J9GX6NwAK5Ctyn0uyFVLozXgD210Ir
 Bizx/m3XSQgXGAH3g1MvoKOet/dDkLr779KJ1MiWg6/koRRJhLbf03A2vC1ZXJvVtUvKc=
X-Google-Smtp-Source: AGHT+IEi/X7SkYw2sV37R91eTxD+V3ulDUhw5M0kk7nn9rrLW2pYEEtBRDEsXGR3H8lVP9H/8kfKgg==
X-Received: by 2002:a05:6512:ad3:b0:595:90ce:df8e with SMTP id
 2adb3069b0e04-597cfae46a6mr545750e87.5.1764663973701; 
 Tue, 02 Dec 2025 00:26:13 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:12 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:25:19 +0100
Subject: [PATCH RESEND v2 3/6] drm/sitronix/st7571-i2c: move common
 structures to st7571.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-st7571-split-v2-3-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
In-Reply-To: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7722;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zhGfd310V5DKHoDZa0//qQ74zGXU+hIHrqN5ed22Y4c=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqKMAlAS1HTW3encz0nybzK3Dg802TBb4a1iq
 4FKV+X5+WKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6ijAAKCRCIgE5vWV1S
 MvYED/91jCv+xXUaMpkhxn1X4eVPJ6cSB0MZgcnGkKAxiFZOnz7vG8WcXZ6Wv2vt/WM/4YGJfRp
 nkIg8v61d9WnKCc8Ik10fEHh1KGPw144I7SRggBm2/jMjJfLQVl6dnhQ7rYc4VrLymJjVEmXBxN
 CubM37GG8hkeJsV+jnEABljLCOku+zJci6b5y9pI7/Fgm1Cjejs2kUrnNsdr9n7ulRl/m3nKIs3
 lxVsNBDzvMqW7ujScUt97o1ES5Ks0K7jUq1fAY/WDq+pjxQDIHhsv5EjUuFvsasM2b9EpsATr+d
 IC3WcJvb+0cDvqyFGxcs6AWbjZUdaKeiJJwkpjt6hRxwIoj+0qDO7jOLZSC2gVIlyynenWhE1n5
 aU9Lh27EEOU1yrUQylGx9xrePlQPEXKuIk3TROeSqlwrzZ9DCP0decGKoCMsz4akWBT/btuMBfD
 TVvBjNF2ckPq5J+ebjruLSdpbaBGoZMQdkS5hF57rRC1sLbM9QMe/2R9ujGupx7lOos39cphEb7
 L5fidbrfQMPMSWSw2F6DwsWu5xyJH/5FieXccXopnV8pWeA0/nJVTgVnMZYd1/RQ9mabf7SWlYj
 2Z6bk+6sMVTc80thq4Rh1CxAvHPMw2zisLsuum2JGThyDuOFIrfnmhpRjbr3awWqi9haQeTW5F+
 eb19NjYK8CXjfCQ==
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

