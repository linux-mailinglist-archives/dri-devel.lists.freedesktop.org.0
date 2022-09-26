Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604D5EB112
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 21:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664DA10E77E;
	Mon, 26 Sep 2022 19:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72D10E779
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 19:14:38 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id g130so9402361oia.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ueu8YR0DxU73ANRFR1q4A6ko0ZBx9GNf6xMF4KLXD4I=;
 b=Xy+ouuJC/OQIZA+szHghv428P5oFfoOjAKpyY+bY4cOzwMweUQMBuh0wfKWwcLM4Wm
 6szGJSSNhI6/ncHp6F3CxxHwhGHOFesxPcxv1vQVLfO/YxgkgH1cuH3l3hgrxBSAfoR7
 9lLopySFqwzCbSuj9B5BuYg2CepCQVspL3rDcPsJS4tzEK7K6hyRr0pknupzYkeiIEPq
 nq7GrwIgOl7XpW9KvH1dL46anoVV5hIwo7hnemr9+qA807bJ6lTSeWzrrpU6bxs7xsRO
 U8kvISDQ1UGhW/L6iPgOAOv29TAvkkSsQIAQ6elmM6RRQ4k8/s48Zqm3kEGU3nQyVncz
 e0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ueu8YR0DxU73ANRFR1q4A6ko0ZBx9GNf6xMF4KLXD4I=;
 b=5MQpQzpa/Q+4Eqxtw+C98s3XnFbIj1DQV3W9qqct/LxqBDSjB9TnqT3W2qT/4tFNMo
 Ti5Nm1Qi6RMsc2QsCmv0MCB9d8XseQpMwhWRXsiaaPujKuL+2wEhlr2gCqOo9jCWxtfv
 3gMTz7wP8K5MzlCehxifRwp8FRsMEypGBFjvnNXh3S/QRixFAwKu1axIUPbxrGOm37aO
 g8gSMDeW9LTWXiXC2P0uzlZGJKasXz29A8uC5QNfDfwxPNzudCG36HVZS8vAJ7gHHgLC
 mHTT7j6D9kyHIJKG/smBtUIKCR61+Oq2epAE6FREy1CRiTZzeTu1eokJNpxri2o/U7/r
 QtIQ==
X-Gm-Message-State: ACrzQf38PuE0pktT3qx6Obcftzpw8prUKx2zaHfxofvLxYb1ho5mjy+5
 jiMmXpIb6pFglBWeQvNt64TLCO8Wdbk=
X-Google-Smtp-Source: AMsMyM5b5xAWAyDSaxcZTFyTY1HoRMlBD4IwzCguTD6gbP9SnWMT/0tZy5wTaF5ZTJFQ3UeAncnOyA==
X-Received: by 2002:a05:6808:d4e:b0:350:9eed:4156 with SMTP id
 w14-20020a0568080d4e00b003509eed4156mr114251oik.77.1664219677108; 
 Mon, 26 Sep 2022 12:14:37 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 p130-20020aca4288000000b00350c5d946casm7278131oia.4.2022.09.26.12.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 12:14:36 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 3/3] drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel
Date: Mon, 26 Sep 2022 14:14:28 -0500
Message-Id: <20220926191428.4801-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926191428.4801-1-macroalpha82@gmail.com>
References: <20220926191428.4801-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Support NewVision NV3051D panels as found on the Anbernic RG353P and
RG353V. The underlying LCD part number for the RG353x devices is
unknown, so the device name and a fallback for the driver IC is
used instead.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 525 ++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a9043eacce97..7258d28dda2f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -296,6 +296,15 @@ config DRM_PANEL_NEC_NL8048HL11
 	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
 	  as a module, choose M here.
 
+config DRM_PANEL_NEWVISION_NV3051D
+	tristate "NewVision NV3051D DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  This driver supports the NV3051D based panel found on the Anbernic
+	  RG353P and RG353V.
+
 config DRM_PANEL_NEWVISION_NV3052C
 	tristate "NewVision NV3052C RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..cb03b3a82738 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
+obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
new file mode 100644
index 000000000000..a15b6e4cb668
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NV3051D MIPI-DSI panel driver for Anbernic RG353x
+ * Copyright (C) 2022 Chris Morgan
+ *
+ * based on
+ *
+ * Elida kd35t133 3.5" MIPI-DSI panel driver
+ * Copyright (C) Theobroma Systems 2020
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct nv3051d_panel_info {
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
+	u16 width_mm, height_mm;
+	u32 bus_flags;
+};
+
+struct panel_nv3051d {
+	struct device *dev;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	const struct nv3051d_panel_info *panel_info;
+	struct regulator *vdd;
+	bool prepared;
+};
+
+static inline struct panel_nv3051d *panel_to_panelnv3051d(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_nv3051d, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
+		static const u8 b[] = { cmd, seq };			\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static int panel_nv3051d_init_sequence(struct panel_nv3051d *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/*
+	 * Init sequence was supplied by device vendor with no
+	 * documentation.
+	 */
+
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x01);
+	dsi_dcs_write_seq(dsi, 0xE3, 0x00);
+	dsi_dcs_write_seq(dsi, 0x03, 0x40);
+	dsi_dcs_write_seq(dsi, 0x04, 0x00);
+	dsi_dcs_write_seq(dsi, 0x05, 0x03);
+	dsi_dcs_write_seq(dsi, 0x24, 0x12);
+	dsi_dcs_write_seq(dsi, 0x25, 0x1E);
+	dsi_dcs_write_seq(dsi, 0x26, 0x28);
+	dsi_dcs_write_seq(dsi, 0x27, 0x52);
+	dsi_dcs_write_seq(dsi, 0x28, 0x57);
+	dsi_dcs_write_seq(dsi, 0x29, 0x01);
+	dsi_dcs_write_seq(dsi, 0x2A, 0xDF);
+	dsi_dcs_write_seq(dsi, 0x38, 0x9C);
+	dsi_dcs_write_seq(dsi, 0x39, 0xA7);
+	dsi_dcs_write_seq(dsi, 0x3A, 0x53);
+	dsi_dcs_write_seq(dsi, 0x44, 0x00);
+	dsi_dcs_write_seq(dsi, 0x49, 0x3C);
+	dsi_dcs_write_seq(dsi, 0x59, 0xFE);
+	dsi_dcs_write_seq(dsi, 0x5C, 0x00);
+	dsi_dcs_write_seq(dsi, 0x91, 0x77);
+	dsi_dcs_write_seq(dsi, 0x92, 0x77);
+	dsi_dcs_write_seq(dsi, 0xA0, 0x55);
+	dsi_dcs_write_seq(dsi, 0xA1, 0x50);
+	dsi_dcs_write_seq(dsi, 0xA4, 0x9C);
+	dsi_dcs_write_seq(dsi, 0xA7, 0x02);
+	dsi_dcs_write_seq(dsi, 0xA8, 0x01);
+	dsi_dcs_write_seq(dsi, 0xA9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xAA, 0xFC);
+	dsi_dcs_write_seq(dsi, 0xAB, 0x28);
+	dsi_dcs_write_seq(dsi, 0xAC, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAD, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAE, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAF, 0x03);
+	dsi_dcs_write_seq(dsi, 0xB0, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x26);
+	dsi_dcs_write_seq(dsi, 0xB2, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x33);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x26);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x26);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x02);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xD1, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x29);
+	dsi_dcs_write_seq(dsi, 0xD4, 0x2B);
+	dsi_dcs_write_seq(dsi, 0xB2, 0x0C);
+	dsi_dcs_write_seq(dsi, 0xD2, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xB3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xD3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x11);
+	dsi_dcs_write_seq(dsi, 0xD6, 0x0D);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x32);
+	dsi_dcs_write_seq(dsi, 0xD7, 0x30);
+	dsi_dcs_write_seq(dsi, 0xC1, 0x04);
+	dsi_dcs_write_seq(dsi, 0xE1, 0x06);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xD8, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xB9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xD9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xBD, 0x13);
+	dsi_dcs_write_seq(dsi, 0xDD, 0x13);
+	dsi_dcs_write_seq(dsi, 0xBC, 0x11);
+	dsi_dcs_write_seq(dsi, 0xDC, 0x11);
+	dsi_dcs_write_seq(dsi, 0xBB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xBE, 0x18);
+	dsi_dcs_write_seq(dsi, 0xDE, 0x18);
+	dsi_dcs_write_seq(dsi, 0xBF, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDF, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xC0, 0x17);
+	dsi_dcs_write_seq(dsi, 0xE0, 0x17);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
+	dsi_dcs_write_seq(dsi, 0xD5, 0x3C);
+	dsi_dcs_write_seq(dsi, 0xB0, 0x0B);
+	dsi_dcs_write_seq(dsi, 0xD0, 0x0C);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x03);
+	dsi_dcs_write_seq(dsi, 0x00, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x01, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x02, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x03, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x04, 0x61);
+	dsi_dcs_write_seq(dsi, 0x05, 0x80);
+	dsi_dcs_write_seq(dsi, 0x06, 0xC7);
+	dsi_dcs_write_seq(dsi, 0x07, 0x01);
+	dsi_dcs_write_seq(dsi, 0x08, 0x82);
+	dsi_dcs_write_seq(dsi, 0x09, 0x83);
+	dsi_dcs_write_seq(dsi, 0x30, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x31, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x32, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x33, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x34, 0x61);
+	dsi_dcs_write_seq(dsi, 0x35, 0xC5);
+	dsi_dcs_write_seq(dsi, 0x36, 0x80);
+	dsi_dcs_write_seq(dsi, 0x37, 0x23);
+	dsi_dcs_write_seq(dsi, 0x40, 0x82);
+	dsi_dcs_write_seq(dsi, 0x41, 0x83);
+	dsi_dcs_write_seq(dsi, 0x42, 0x80);
+	dsi_dcs_write_seq(dsi, 0x43, 0x81);
+	dsi_dcs_write_seq(dsi, 0x44, 0x11);
+	dsi_dcs_write_seq(dsi, 0x45, 0xF2);
+	dsi_dcs_write_seq(dsi, 0x46, 0xF1);
+	dsi_dcs_write_seq(dsi, 0x47, 0x11);
+	dsi_dcs_write_seq(dsi, 0x48, 0xF4);
+	dsi_dcs_write_seq(dsi, 0x49, 0xF3);
+	dsi_dcs_write_seq(dsi, 0x50, 0x02);
+	dsi_dcs_write_seq(dsi, 0x51, 0x01);
+	dsi_dcs_write_seq(dsi, 0x52, 0x04);
+	dsi_dcs_write_seq(dsi, 0x53, 0x03);
+	dsi_dcs_write_seq(dsi, 0x54, 0x11);
+	dsi_dcs_write_seq(dsi, 0x55, 0xF6);
+	dsi_dcs_write_seq(dsi, 0x56, 0xF5);
+	dsi_dcs_write_seq(dsi, 0x57, 0x11);
+	dsi_dcs_write_seq(dsi, 0x58, 0xF8);
+	dsi_dcs_write_seq(dsi, 0x59, 0xF7);
+	dsi_dcs_write_seq(dsi, 0x7E, 0x02);
+	dsi_dcs_write_seq(dsi, 0x7F, 0x80);
+	dsi_dcs_write_seq(dsi, 0xE0, 0x5A);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x00);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x04);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x07);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x06);
+	dsi_dcs_write_seq(dsi, 0xB9, 0x05);
+	dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xC7, 0x00);
+	dsi_dcs_write_seq(dsi, 0xCA, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xCB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xCC, 0x04);
+	dsi_dcs_write_seq(dsi, 0xCD, 0x07);
+	dsi_dcs_write_seq(dsi, 0xCE, 0x06);
+	dsi_dcs_write_seq(dsi, 0xCF, 0x05);
+	dsi_dcs_write_seq(dsi, 0xD0, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x81, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x84, 0x0E);
+	dsi_dcs_write_seq(dsi, 0x85, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x86, 0x07);
+	dsi_dcs_write_seq(dsi, 0x87, 0x04);
+	dsi_dcs_write_seq(dsi, 0x88, 0x05);
+	dsi_dcs_write_seq(dsi, 0x89, 0x06);
+	dsi_dcs_write_seq(dsi, 0x8A, 0x00);
+	dsi_dcs_write_seq(dsi, 0x97, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x9A, 0x0E);
+	dsi_dcs_write_seq(dsi, 0x9B, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x9C, 0x07);
+	dsi_dcs_write_seq(dsi, 0x9D, 0x04);
+	dsi_dcs_write_seq(dsi, 0x9E, 0x05);
+	dsi_dcs_write_seq(dsi, 0x9F, 0x06);
+	dsi_dcs_write_seq(dsi, 0xA0, 0x00);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x02);
+	dsi_dcs_write_seq(dsi, 0x01, 0x01);
+	dsi_dcs_write_seq(dsi, 0x02, 0xDA);
+	dsi_dcs_write_seq(dsi, 0x03, 0xBA);
+	dsi_dcs_write_seq(dsi, 0x04, 0xA8);
+	dsi_dcs_write_seq(dsi, 0x05, 0x9A);
+	dsi_dcs_write_seq(dsi, 0x06, 0x70);
+	dsi_dcs_write_seq(dsi, 0x07, 0xFF);
+	dsi_dcs_write_seq(dsi, 0x08, 0x91);
+	dsi_dcs_write_seq(dsi, 0x09, 0x90);
+	dsi_dcs_write_seq(dsi, 0x0A, 0xFF);
+	dsi_dcs_write_seq(dsi, 0x0B, 0x8F);
+	dsi_dcs_write_seq(dsi, 0x0C, 0x60);
+	dsi_dcs_write_seq(dsi, 0x0D, 0x58);
+	dsi_dcs_write_seq(dsi, 0x0E, 0x48);
+	dsi_dcs_write_seq(dsi, 0x0F, 0x38);
+	dsi_dcs_write_seq(dsi, 0x10, 0x2B);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x00);
+	dsi_dcs_write_seq(dsi, 0x36, 0x02);
+	dsi_dcs_write_seq(dsi, 0x3A, 0x70);
+
+	dev_dbg(ctx->dev, "Panel init sequence done\n");
+
+	return 0;
+}
+
+static int panel_nv3051d_unprepare(struct drm_panel *panel)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
+
+	msleep(20);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 15000);
+
+	regulator_disable(ctx->vdd);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int panel_nv3051d_prepare(struct drm_panel *panel)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	dev_dbg(ctx->dev, "Resetting the panel\n");
+	ret = regulator_enable(ctx->vdd);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(150);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(20);
+
+	ret = panel_nv3051d_init_sequence(ctx);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	msleep(200);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	usleep_range(10000, 15000);
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_vdd:
+	regulator_disable(ctx->vdd);
+	return ret;
+}
+
+static int panel_nv3051d_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	const struct nv3051d_panel_info *panel_info = ctx->panel_info;
+	struct drm_display_mode *mode;
+	unsigned int i;
+
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return panel_info->num_modes;
+}
+
+static const struct drm_panel_funcs panel_nv3051d_funcs = {
+	.unprepare	= panel_nv3051d_unprepare,
+	.prepare	= panel_nv3051d_prepare,
+	.get_modes	= panel_nv3051d_get_modes,
+};
+
+static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct panel_nv3051d *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+
+	ctx->panel_info = of_device_get_match_data(dev);
+	if (!ctx->panel_info)
+		return -EINVAL;
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(dev, "cannot get reset gpio\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(ctx->vdd)) {
+		ret = PTR_ERR(ctx->vdd);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vdd regulator: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panel_nv3051d_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = drm_panel_unprepare(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+
+	ret = drm_panel_disable(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+}
+
+static int panel_nv3051d_remove(struct mipi_dsi_device *dsi)
+{
+	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	panel_nv3051d_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
+	{ /* 120hz */
+		.hdisplay	= 640,
+		.hsync_start	= 640 + 40,
+		.hsync_end	= 640 + 40 + 2,
+		.htotal		= 640 + 40 + 2 + 80,
+		.vdisplay	= 480,
+		.vsync_start	= 480 + 18,
+		.vsync_end	= 480 + 18 + 2,
+		.vtotal		= 480 + 18 + 2 + 28,
+		.clock		= 48300,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{ /* 100hz */
+		.hdisplay       = 640,
+		.hsync_start    = 640 + 40,
+		.hsync_end      = 640 + 40 + 2,
+		.htotal         = 640 + 40 + 2 + 80,
+		.vdisplay       = 480,
+		.vsync_start    = 480 + 18,
+		.vsync_end      = 480 + 18 + 2,
+		.vtotal         = 480 + 18 + 2 + 28,
+		.clock          = 40250,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{ /* 60hz */
+		.hdisplay	= 640,
+		.hsync_start	= 640 + 40,
+		.hsync_end	= 640 + 40 + 2,
+		.htotal		= 640 + 40 + 2 + 80,
+		.vdisplay	= 480,
+		.vsync_start	= 480 + 18,
+		.vsync_end	= 480 + 18 + 2,
+		.vtotal		= 480 + 18 + 2 + 28,
+		.clock		= 24150,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
+	.display_modes = nv3051d_rgxx3_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+};
+
+static const struct of_device_id newvision_nv3051d_of_match[] = {
+	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
+
+static struct mipi_dsi_driver newvision_nv3051d_driver = {
+	.driver = {
+		.name = "panel-newvision-nv3051d",
+		.of_match_table = newvision_nv3051d_of_match,
+	},
+	.probe	= panel_nv3051d_probe,
+	.remove = panel_nv3051d_remove,
+	.shutdown = panel_nv3051d_shutdown,
+};
+module_mipi_dsi_driver(newvision_nv3051d_driver);
+
+MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
+MODULE_DESCRIPTION("DRM driver for Newvision NV3051D based MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.25.1

