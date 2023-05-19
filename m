Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66F709E78
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F4510E5B8;
	Fri, 19 May 2023 17:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83010E473
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:25:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so22999015e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684506337; x=1687098337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGSXtFQO6NZPOk9/bp/O9fgH0shFEyfhGNdkgmYVGuk=;
 b=gP5cE1b/0ZXeEFiOfsjll6LI92Gh55XL+puh5lPSfpz3Su+bnwT3deO34gYAhpmhep
 gAXMO/uYVE+b0SGBbkGePVDjPE4exPyTsvUJbPVVhAj+O1rTbzEge3HS+2aBCwE6/WnC
 UvTXFXS2N4Nc3uOapotB2ZI1WuoFlMBWCNwCBux7X3K90lEqlM5wkLzCv1rLiINHL5r/
 zmxgu3SQ4O6MA0UVWHsol0kLNTkV0teGGj8hG2e0IhsJULEo9mNp0l430gPPugOdorrc
 QX0mBmZ70hCRxObi9HAzYys1pbLWEWEI80yvyzMshWHVvAS4DHTYUqXjNE6LeBUQ011D
 w/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684506337; x=1687098337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGSXtFQO6NZPOk9/bp/O9fgH0shFEyfhGNdkgmYVGuk=;
 b=BwKd5ErV5y94IIQk3jFh3+37Nc7jj5VuqDejHwhRl5s6puKjF0fZh6Y33+w/H18IjX
 Rr81i2v2q8hHXKd83lXBkt9096Lsw1V8pMPZ7385QouX9gsGgSW1PY/9iNDdB2usXo/o
 iD2UMO66cBlVECeh+LH4+V++p0mbPtw9BVAmIGNTIrH0sLaPmGKgK5CuYEpHAKU7/i1i
 OQKzUTf9De/c4UAgJ0hIZ0kJa+onPtYmNGvO6MloWkKsS4exurp0pRCEYVpyMAp7BvhN
 vFEb+b0BEBthkritD8FmmqlEgOzrv8MdfAZ8wLazoQOu6NPJ0xycNFvuVI0pQrT7ihyD
 OsMA==
X-Gm-Message-State: AC+VfDwDANXdn40Yy3M0+4vucPyx7ae2jp5a+sMABrMogeMMQzyaAoW5
 53T/mzruOmtrpYci5SD2jm2Pe1R0TAe3WWBo
X-Google-Smtp-Source: ACHHUZ6wshDE6e3HR9d8ljozNWEaOp6pCmm4m/YKPzlDN3j0tNsRZ1ZnvOHky38UeK85ImR3pz5y5A==
X-Received: by 2002:a1c:4c10:0:b0:3f4:5058:a033 with SMTP id
 z16-20020a1c4c10000000b003f45058a033mr1524806wmf.24.1684506336808; 
 Fri, 19 May 2023 07:25:36 -0700 (PDT)
Received: from fedora.. ([95.168.116.22]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d4fcc000000b003062b2c5255sm5451748wrw.40.2023.05.19.07.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 07:25:36 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH 2/2] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
Date: Fri, 19 May 2023 16:24:56 +0200
Message-Id: <20230519142456.2588145-3-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519142456.2588145-1-pavacic.p@gmail.com>
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 May 2023 17:44:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Fannal C3004 is a 480x800 display made by fannal that requires
DCS initialization sequences.

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
v2 changelog:
 - renamed from panel-mipi-dsi-bringup
 - only one MAINTAINER e-mail
---
 MAINTAINERS                                |   1 +
 drivers/gpu/drm/panel/Kconfig              |  11 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c | 405 +++++++++++++++++++++
 4 files changed, 418 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62374c8424b9..93fc1ae6832f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6432,6 +6432,7 @@ M:	Paulo Pavacic <pavacic.p@gmail.com>
 S:	Maintained
 C:	matrix:r/mipi-dsi-bringup:matrix.org
 F:	Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
+F:	drivers/gpu/drm/panel/panel-fannal-c3004.c
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2b9d6db7860b..a1041c1e6bf6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -144,6 +144,17 @@ config DRM_PANEL_ELIDA_KD35T133
 	  KD35T133 controller for 320x480 LCD panels with MIPI-DSI
 	  system interfaces.
 
+config DRM_PANEL_FANNAL_C3004
+	tristate "Fannal C3004 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for the Fannal C3004
+	  2-lane 480x800 MIPI DSI panel which requires initialization
+	  sequence.
+
+	  If M is selected the module will be called panel-fannal-c3004.
+
 config DRM_PANEL_FEIXIN_K101_IM2BA02
 	tristate "Feixin K101 IM2BA02 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index ff169781e82d..13c0f00038b5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
 obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
+obj-$(CONFIG_DRM_PANEL_FANNAL_C3004) += panel-fannal-c3004.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
diff --git a/drivers/gpu/drm/panel/panel-fannal-c3004.c b/drivers/gpu/drm/panel/panel-fannal-c3004.c
new file mode 100644
index 000000000000..decbd0c59093
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-fannal-c3004.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MIPI DSI driver for Fannal C3004.
+ * Copyright (C) 2023, Zenitel
+ * Author: Paulo Pavacic <pavacic.p@gmail.com>
+ */
+
+// ↓ include headers, static values, static functions ↓
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+
+#include <video/mipi_display.h>
+#include <video/of_videomode.h>
+#include <video/videomode.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+static const struct fann_panel_info fann_c3004_panel_info;
+
+struct fann_panel_info {
+	const struct drm_display_mode *display_mode;
+	u32 num_of_dsi_lanes;
+	u32 mipi_dsi_format;
+	u32 mipi_dsi_mode_flags;
+	u32 bus_flags;
+	u32 video_mode;
+	void (*panel_enable_function)(struct mipi_dsi_device *dsi);
+};
+
+struct fann_panel_data {
+	const struct fann_panel_info *panel_info;
+	struct drm_panel panel;
+	struct gpio_desc *reset;
+};
+
+static struct fann_panel_data *
+get_fann_panel_data_from_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct fann_panel_data, panel);
+}
+
+static const struct fann_panel_info *
+get_fann_panel_info_from_panel(struct drm_panel *panel)
+{
+	return get_fann_panel_data_from_panel(panel)->panel_info;
+}
+
+enum FANN_VIDEO_MODES_ENUM {
+	FANN_BURST,
+	FANN_SYNC_EVENT,
+	FANN_SYNC_PULSE,
+	FANN_COMMAND,
+};
+
+static const u32 FANN_VIDEO_MODES[] = {
+	MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO, //BURST
+	MIPI_DSI_MODE_VIDEO, //SYNC_EVENT
+	MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO, //SYNC_PULSE
+	MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH //COMMAND MODE
+};
+
+//macro for writing to DSI
+#define WRITE_DSI(dsi, seq...)                                                   \
+	{                                                                        \
+		const u8 d[] = { seq };                                          \
+		int ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));         \
+		if (ret < 0) {                                                   \
+			dev_err(&dsi->dev,                                       \
+				"Error (%d) occurred while trying to"            \
+				" write MIPI DSI command: %s (decimal value)\n", \
+				ret, d);                                         \
+		}                                                                \
+	}
+
+// ↑ include headers, static values, static functions ↑
+// ↓ INTERACTION whole section: panel specific values, add panel as is shown ↓
+
+/**
+ * @brief Adding new panel
+ * Includes but isn't limited to following steps:
+ * 1. define new `fann__yourpanel_display_mode` with correct timings
+ * 2. define new `fann_panel_yourpanel_enable_function`
+ * 3. glue everything with fann_yourpanel_panel_info and set that srtucts values
+ * 4. add .compatible = "you,yourpanel", .data = &fann_yourpanel_panel_info }
+ */
+
+static const u32 fann_bus_formats[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+// resolution 480p x 800p, 56mmx93mm
+static const struct drm_display_mode fann_c3004_display_mode = {
+	.clock = 27000,
+	.hdisplay = 480, // display height pixels
+	.hsync_start = 480 + 30, // hdisplay + HBP
+	.hsync_end = 480 + 30 + 8, // hdisplay + HBP + HSync
+	.htotal = 480 + 30 + 8 + 30, // hdisplay + HBP + HSync + HFP
+	.vdisplay = 800, // display width pixels
+	.vsync_start = 800 + 20, // vdisplay + VBP
+	.vsync_end = 800 + 20 + 8, // vdisplay + VBP + VSync
+	.vtotal = 800 + 20 + 8 + 20, // vdisplay + VBP + VSync + VFP
+	.width_mm = 93,
+	.height_mm = 56,
+	.flags = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static void fann_panel_fannal_c3004_enable_function(struct mipi_dsi_device *dsi)
+{
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	WRITE_DSI(dsi, 0xEF, 0x08);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x10);
+	WRITE_DSI(dsi, 0xC0, 0x63, 0x00);
+	WRITE_DSI(dsi, 0xC1, 0x0A, 0x0C);
+	WRITE_DSI(dsi, 0xC2, 0x31, 0x08);
+	WRITE_DSI(dsi, 0xCC, 0x18);
+
+	WRITE_DSI(dsi, 0xB0, 0x00, 0x08, 0x10, 0x0E, 0x11, 0x07, 0x08, 0x08,
+		  0x08, 0x25, 0x04, 0x12, 0x0F, 0x2C, 0x30, 0x1F);
+	WRITE_DSI(dsi, 0xB1, 0x00, 0x11, 0x18, 0x0C, 0x10, 0x05, 0x07, 0x09,
+		  0x08, 0x24, 0x04, 0x11, 0x10, 0x2B, 0x30, 0x1F);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x11);
+	WRITE_DSI(dsi, 0xB0, 0x4D);
+	WRITE_DSI(dsi, 0xB1, 0x39);
+	WRITE_DSI(dsi, 0xB2, 0x87);
+	WRITE_DSI(dsi, 0xB3, 0x80);
+	WRITE_DSI(dsi, 0xB5, 0x47);
+	WRITE_DSI(dsi, 0xB7, 0x8A);
+	WRITE_DSI(dsi, 0xB8, 0x20);
+	WRITE_DSI(dsi, 0xB9, 0x10, 0x13);
+	WRITE_DSI(dsi, 0xC1, 0x78);
+	WRITE_DSI(dsi, 0xC2, 0x78);
+	WRITE_DSI(dsi, 0xD0, 0x88);
+
+	//PANEL
+	WRITE_DSI(dsi, 0xE0, 0x00, 0x00, 0x02);
+	WRITE_DSI(dsi, 0xE1, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,
+		  0x00, 0x20, 0x20);
+	WRITE_DSI(dsi, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		  0x00, 0x00, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0xE3, 0x00, 0x00, 0x33, 0x00);
+	WRITE_DSI(dsi, 0xE4, 0x22, 0x00);
+	WRITE_DSI(dsi, 0xE5, 0x04, 0x34, 0xAA, 0xAA, 0x06, 0x34, 0xAA, 0xAA,
+		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0xE6, 0x00, 0x00, 0x33, 0x00);
+	WRITE_DSI(dsi, 0xE7, 0x22, 0x00);
+	WRITE_DSI(dsi, 0xE8, 0x05, 0x34, 0xAA, 0xAA, 0x07, 0x34, 0xAA, 0xAA,
+		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0xEB, 0x02, 0x00, 0x40, 0x40, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0xEC, 0x00, 0x00);
+	WRITE_DSI(dsi, 0xED, 0xFA, 0x45, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
+		  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xB0, 0x54, 0xAF);
+	WRITE_DSI(dsi, 0xEF, 0x10, 0x0D, 0x04, 0x08, 0x3F, 0x1F);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	WRITE_DSI(dsi, 0xE8, 0x00, 0x0E);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0x11); //MIPI_DCS_EXIT_SLEEP_MODE
+
+	msleep(600);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	WRITE_DSI(dsi, 0xE8, 0x00, 0x0C);
+	msleep(50);
+	WRITE_DSI(dsi, 0xE8, 0x00, 0x00);
+
+	WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+	WRITE_DSI(dsi, 0x29); //MIPI_DCS_SET_DISPLAY_ON
+	msleep(100);
+}
+
+static const struct fann_panel_info fann_c3004_panel_info = {
+	.display_mode = &fann_c3004_display_mode,
+	.num_of_dsi_lanes = 2, //how many wires are connected to the panel
+	.video_mode = FANN_VIDEO_MODES[FANN_SYNC_PULSE],
+	.mipi_dsi_format = MIPI_DSI_FMT_RGB888,
+	.mipi_dsi_mode_flags =
+		MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH |
+		MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.panel_enable_function = &fann_panel_fannal_c3004_enable_function
+};
+
+// ↑ INTERACTION: panel specific values, add panel as is show in the example ↑
+// ↓ remove driver/cleanup ↓
+static void fann_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct fann_panel_data *panel_data = mipi_dsi_get_drvdata(dsi);
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(dev, "error: disable: mipi detach (%d)\n", ret);
+
+	drm_panel_remove(&panel_data->panel);
+}
+
+static int fann_panel_disable(struct drm_panel *panel)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(panel->dev);
+	struct device *dev = panel->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "error: disable: turn display OFF (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "error: disable: enter sleep mode (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fann_panel_unprepare(struct drm_panel *panel)
+{
+	struct fann_panel_data *panel_data =
+		get_fann_panel_data_from_panel(panel);
+
+	if (panel_data->reset) {
+		gpiod_set_value_cansleep(panel_data->reset, 1);
+		usleep_range(15000, 17000);
+		gpiod_set_value_cansleep(panel_data->reset, 0);
+	}
+
+	return 0;
+}
+
+static void fann_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct fann_panel_data *panel_data = mipi_dsi_get_drvdata(dsi);
+
+	fann_panel_disable(&panel_data->panel);
+	fann_panel_unprepare(&panel_data->panel);
+}
+
+// ↑ remove driver/cleanup ↑
+// ↓ probe/create functions ↓
+
+static int fann_panel_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	const struct fann_panel_info *panel_info =
+		get_fann_panel_info_from_panel(panel);
+	const struct drm_display_mode *panel_display_mode =
+		panel_info->display_mode;
+
+	mode = drm_mode_duplicate(connector->dev, panel_display_mode);
+	if (!mode) {
+		dev_err(panel->dev, "error: get_modes: add drm mode %ux%u@%u\n",
+			panel_display_mode->hdisplay,
+			panel_display_mode->vdisplay,
+			drm_mode_vrefresh(panel_display_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 fann_bus_formats,
+					 ARRAY_SIZE(fann_bus_formats));
+	return 1;
+}
+
+static const struct of_device_id fann_of_match[] = {
+	{ .compatible = "fannal,c3004", .data = &fann_c3004_panel_info },
+	{ /* sentinel */ }
+};
+
+static int fann_panel_enable(struct drm_panel *panel)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(panel->dev);
+	const struct fann_panel_info *panel_info =
+		get_fann_panel_info_from_panel(panel);
+	panel_info->panel_enable_function(dsi);
+
+	return 0;
+}
+
+static int fann_panel_prepare(struct drm_panel *panel)
+{
+	struct fann_panel_data *panel_data =
+		get_fann_panel_data_from_panel(panel);
+
+	/* At lest 10ms needed between power-on and reset-out as RM specifies */
+	usleep_range(10000, 12000);
+
+	if (panel_data->reset) {
+		gpiod_set_value_cansleep(panel_data->reset, 0);
+		/*
+		 * 50ms delay after reset-out, as per manufacturer initalization
+		 * sequence.
+		 */
+		msleep(50);
+	}
+
+	return 0;
+}
+
+static const struct drm_panel_funcs fann_panel_funcs = {
+	.prepare = fann_panel_prepare,
+	.unprepare = fann_panel_unprepare,
+	.enable = fann_panel_enable,
+	.disable = fann_panel_disable,
+	.get_modes = fann_panel_get_modes,
+};
+
+static int fann_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct of_device_id *of_id = of_match_device(fann_of_match, dev);
+	const struct fann_panel_info *panel_info = of_id->data;
+	struct fann_panel_data *panel_data;
+	int ret;
+
+	dev_notice(dev, "probe driver called\n");
+	if (!panel_info) {
+		dev_err(dev, "error: probe: get panel_data!\n");
+		return -ENODEV;
+	}
+
+	panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
+
+	if (!panel_data)
+		return -ENOMEM;
+
+	panel_data->panel_info = panel_info;
+	panel_data->reset = devm_gpiod_get_optional(
+		dev, "reset", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+
+	if (IS_ERR(panel_data->reset)) {
+		ret = PTR_ERR(panel_data->reset);
+		dev_err(dev,
+			"error: probe: get reset GPIO: (%d) Check the fdt\n",
+			ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, panel_data);
+
+	dsi->format = panel_info->mipi_dsi_format;
+	dsi->mode_flags = panel_info->mipi_dsi_mode_flags |
+			  panel_info->video_mode;
+	dsi->lanes = panel_info->num_of_dsi_lanes;
+
+	gpiod_set_value_cansleep(panel_data->reset, 1);
+
+	drm_panel_init(&panel_data->panel, dev, &fann_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	dev_set_drvdata(dev, panel_data);
+
+	drm_panel_add(&panel_data->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		drm_panel_remove(&panel_data->panel);
+		dev_err(dev, "error: probe fail: can't attach mipi_dsi!\n");
+	} else
+		dev_notice(dev, "probe driver success. Good job!\n");
+
+	return ret;
+}
+
+// ↑ probe/create functions ↑
+// ↓ generic driver stuff ↓
+
+static struct mipi_dsi_driver fann_panel_driver = {
+	.driver = {
+		.name = "panel-fannal-c3004",
+		.of_match_table = fann_of_match,
+	},
+	.probe = fann_panel_probe,
+	.remove = fann_panel_remove,
+	.shutdown = fann_panel_shutdown,
+};
+
+module_mipi_dsi_driver(fann_panel_driver);
+
+MODULE_AUTHOR("Paulo Pavacic <pavacic.p@gmail.com>");
+MODULE_DESCRIPTION("Fannal C3004 panel driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, fann_of_match);
-- 
2.40.1

