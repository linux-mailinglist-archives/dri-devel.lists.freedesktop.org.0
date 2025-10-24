Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FBCC05B6C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AB310EA67;
	Fri, 24 Oct 2025 10:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jS6et6w9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376C10EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:57:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-58b025fce96so1670147e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303455; x=1761908255; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mG4iS2woxPf+3BthpgnKFGsPtU8cg+2wLUJdaVgtpEs=;
 b=jS6et6w9YFSP8sYZ0BcyZ+9u4mgMhtiEj0tOy29Hs3yXS2Udu8Hf9gGzGdF1s6MbYv
 B68UdNOrWVj/BiwGioMejKbeipRxP7Sx5jyAaX6JQ+TQw8VjAmWzS8oe+ugsiiQY/R7z
 6JSLSWsp2dmThA/8wA0X2n+Fqub233MjoTbq4hE6BfCfpo8jdnSSYpfsBgXI9/IzUeqb
 5KriXRJw05NSTzcyfxRafRESBgGygcJCFDRyOY309bTl+ICUVwAFWtj1NFqxJzhwSiNi
 TBZHywD7aCV2snwuiv6QaKfolyAl4qkQCPlOY/SPV7DnInopFasyCBvfh19tpNaO+1sy
 wW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303455; x=1761908255;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mG4iS2woxPf+3BthpgnKFGsPtU8cg+2wLUJdaVgtpEs=;
 b=OhFxMCH51l83pPdM76cdBMYcMFLfzqLBlvAAavP7hrlxFtg1gzgq/sn9NAGMfVOopM
 Fsq1w+VQUWzk9jlhTgaO4UR5cBn/PFzFJM0mmDjj7QuGEYXmy6aHCdDcA4vRuUgNXL5G
 MY0jF6nY4/pOCtgyseIYDzrB8B6oBIsKIhO/iHiUdDhWaQu2RQ5KpmaoSdWeqJhQ1VTB
 djWYZtVghR5fYg/2Jqycf0oHjXmBqeLvJbyPz0WGHb88NCWWTC64OMHAGyROUe3x/4CU
 AgpKAJgyPOb2F41k35NsEZ+A0vuLt9J0pRllf1ge4usFVWEvci/1z1zKwaEbpwa0oZ+J
 G3hg==
X-Gm-Message-State: AOJu0YzNi+JASNsaTj6tvx93JxmXbjObaS99klSrEF1z1rLEl0NyCpsH
 Vt6zyB05FnWerCrFrExQwBzkdLairn22jVSmTpZa3HKrWMBsFGtA9bxR
X-Gm-Gg: ASbGncumabhKsjl6PuiAX5+XurzeCll80I1TvIbxnWcokpsmjQh7lV70ZDTbBEWrmcX
 MMzuJEteO5HI0SYM16XQaMLbDy6Ts/26lGEvaljxPVnBKDl3FpBhxfSOKXLz7p8ULq1A9O/AkGa
 WZKiFEha/7TWbZe5EbQqesHVNefrjBH0pGHuzc/ELaZaZsD7JSzI2qkf8hfE0lkz+ut2IsUFwJM
 dOBCxeS7NIoFiWpeAAYFXJIAoE66DHsMa7CI6Vv2nibkXfEGY4DnUH2li2MmLP0o3kiYv/HEzDq
 KjVFT2p8Ng85tht/krTYsdjHsbwEKsYb5DxTRNBmPL1ACZ283TDxr7kQ5II5qte+Sd1RKBDNp/c
 tc3Hclu2FfLtgrhk4egi+BKzafirDIFkWJ6MK/arStRnHAJenrd+Gc1539OTBvzNJT11b8VEWUd
 i+ovglwiU29yhrhzHXfgZn/sjiCEC1mKF1DShJ/BD8R62c
X-Google-Smtp-Source: AGHT+IFn/VYhset1Mavk5aaHD6oOqpyWmfVWIE+Q9SiIpmiHtPdRpiClOYLBhrBpbW1/acQWx81nsg==
X-Received: by 2002:a05:651c:1989:b0:372:628b:5cb4 with SMTP id
 38308e7fff4ca-37797a8d5dbmr84012631fa.45.1761303455238; 
 Fri, 24 Oct 2025 03:57:35 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db8fesm10375671fa.38.2025.10.24.03.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 03:57:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 24 Oct 2025 12:56:54 +0200
Subject: [PATCH 3/6] drm/sitronix/st7571-i2c: move common structures to
 st7571.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251024-st7571-split-v1-3-d3092b98130f@gmail.com>
References: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
In-Reply-To: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7890;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=oj5JSSIwffzeqzrjLvw57GX1wzHco1M6GQyX3QdaS3o=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo+1uGURp4KPR63s5xUVGroPgKmnyWXRI8G+tCN
 ZhCcl/XKC+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPtbhgAKCRCIgE5vWV1S
 Mt0cD/9ITP8vmZZ1IqUZsE68ywbqBSy3CJz3JG1YVBk68nNziH0SlZZJB15OJK9zjOk5euJtoVd
 SL8lF7hxg5ZSzeIrcSkBK+m9Bjcit5pArVHfGHPIeJ2guNMjs8jrN28xUwybE68DyjoyAC0il1x
 ckZ0p4EowHjnojIIJSbdbiWYENT2BLOc7JTht89l8678y+iOSvtB0ZI2k8XJ0snTZFGAhr1gVot
 nr6Na2abpVpUUbe0mCh0Ds/BRjvXfBzqp8IJyrkMaYk8ej/Ndhc+cDaKteOyaK5v5FwXbGJupO3
 +Ma2wwItXYvAqWMSUoUa1ypcly2minuGLNFKWkB8yqN+xVCJOu9X8cBtqrzGj+NhqAljwchcrPP
 MR2Jms4REJ5G35H8ArtIPTUdbJ1q/b0md3cM2SiO1UfeOPS59iRkObERlI9nvlfj1hlbXniYnat
 p6gOYKR5ReWHZxpeP2NWtTToKxI/yikPBYQUeCKJfdd0AouYnGvX2TJBTNoq8V8tbCtsIGdHwyW
 QVgkQjUfguXNALoTySFeTyS+fjcqVSlEaPe8KWcH+Xunmo6fjo6MbZqDmA6Y5ocR7f9TxLN30t4
 3dgUYBjwhydjOv/NVidfNW1SLNicQDUccfbCzW9bxUxKpMxmO2KibzRK7ZMNsjGyXTv09fzNR6H
 GFLCSX6nEshAugA==
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
index cc8a7f3f1dabaf402b21f767ecb093a31ade248f..2814faae61eceecae1bccaaf92010e22dca81376 100644
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
index 2b52919d7dd434bb16aa66274eae8730649f62f1..af27658a5e152534d445bc623893eee6b3ca00d5 100644
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
index 0000000000000000000000000000000000000000..c6fd6f1d3aa33d6b43330ce8f2cb2d3f2321b29b
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
2.50.1

