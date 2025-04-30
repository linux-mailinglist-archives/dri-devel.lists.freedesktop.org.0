Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B7AA4D3D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48EC10E084;
	Wed, 30 Apr 2025 13:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="dGOYjqch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E343E10E084
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:19:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso50324755e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1746019141; x=1746623941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GuuJRFOt/XpcZx7+f4J4r9/4kCyOrOivaFZ4Wj50lMA=;
 b=dGOYjqchWCa8GDTIFltuVM/fWlblsmbXCuVSQPVCi6f11kiSv5Ilk6pBOkyK6y6V6T
 RNgIcGamHuVa8Pl2emtUFuzuo2P0yAvYNzGfVOGEdGNMg9DCC2G+1GsYBSXqlNBKe3gj
 4n7IJ7+NFP8LC8XWXwZVzeyV9qP1VYGr6nOup0U1sVVs27cuad61iNeMnEQg6Qq4f+qk
 y65Y/rc0/YWTMEDFWVrFE9ySiw1YzrUlFzVi6MV1kaZSWozJs59Ps/wWc6ubu53Lk8ID
 J1y6E6FWNY3X6rlOpsCz64SipScd6AtHnsx/zsz3nP8RKwRFFhcxxcgabxpblzbMNliK
 poIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746019141; x=1746623941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GuuJRFOt/XpcZx7+f4J4r9/4kCyOrOivaFZ4Wj50lMA=;
 b=xKnS0BlFuyxnwGX/bvbufi2vsxOHA1/NpSYGAs8x6Tpkwv9Wu/hQRFiEyiUZ1Q/4Cy
 Bn5/YpvduaIfw5kagpw3p9S5DliBpNqLXpcbOVTyfPqwzeLK+yD6TeZ3Az/ly6GK/Uw2
 grLr+P/01ymNIJS6HMh9Sn0Qr78imzrPvJkK2CbKRNiXlLb6amyk1JqMQV1C6Ozi6hfI
 lCu0hmp0JwxxWGx8Gb1rMihAhhcB8R0JbtCPru1WszFKeear7fi3PsRIkojtFKNaDKA3
 UIIeEToSlgrYqD42sVXaHnEPn+HEabO0CR5axHTxfhIxD9jAq+0OiP5akOTmOi8ahL9/
 zyTA==
X-Gm-Message-State: AOJu0YywAnLlIfC5ZtwdE1bIAlcLoWzOFNtpDLi60ykTZcH2slW0TTGp
 3fF7d1jtu8mBm/gC+dFzUVby0Wc0qPN3rWvhOPqy4fMrzWuVw2gY+4wXlZ/gesAT+SkqeiouIUZ
 kt5TLMf53
X-Gm-Gg: ASbGncvWgc9OLT4BxtWLfrLNtjvu8MHrURWwuvlZ37pFc0YmU6wdgamsxexAgVyD0K9
 rzjIS+w0nppZkxwxBYkLEjuelE7pH5gOH5bfSzjITDH1eckkwMnsZO8GNyf3ZTF8P9EQJ83g53b
 Ew++4ODGZGUJu0YwoUPP5/PTyjnyYtIjE/McEGQTmVobiVGCMiL0GpNfNLVfYfH8wbOPU7ktWY7
 /syL2NLblX1ssB2KFUWbCJ41nZAhCeIWNvwzJ5Yfp6ys4oxX2VVbkwXDl4cAnNgV0NvkXs/XN8Z
 EPHLljq5mxFbenTi5X+JxuxCSDrO0ozdeWuQk05vWfdH2e99gboq6vt3oW+5iWMOAXIkUl1Ryv+
 jzg==
X-Google-Smtp-Source: AGHT+IFdqPO6DEXgI54UNvmEZOFQ4f/GuB9j1PWdW8j7g1x0rW9DsfvP4LQ9kIF5S4A0f1V6ZQAF8g==
X-Received: by 2002:a05:600c:1ca4:b0:43c:e478:889 with SMTP id
 5b1f17b1804b1-441b1dfc2c4mr28542635e9.0.1746019140615; 
 Wed, 30 Apr 2025 06:19:00 -0700 (PDT)
Received: from hp445.cm.ii.zone (238.146.230.94.awnet.cz. [94.230.146.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b23c5e14sm18190885e9.0.2025.04.30.06.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:19:00 -0700 (PDT)
From: Josef Lusticky <josef.lusticky@braiins.cz>
To: dri-devel@lists.freedesktop.org
Cc: david@lechnology.com, lanzano.alex@gmail.com,
 Josef Lusticky <josef.lusticky@braiins.cz>
Subject: [PATCH] drm/tiny: Add driver for displays with ST7365P controller
Date: Wed, 30 Apr 2025 15:17:58 +0200
Message-Id: <20250430131758.13535-1-josef.lusticky@braiins.cz>
X-Mailer: git-send-email 2.30.2
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

The driver supports 3.5" Kingway HW-035P0Z002 display found
on Braiins Mini Miner BMM 101 product.

Signed-off-by: Josef Lusticky <josef.lusticky@braiins.cz>
---
 drivers/gpu/drm/tiny/Kconfig   |  14 ++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/st7365p.c | 275 +++++++++++++++++++++++++++++++++
 3 files changed, 290 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/st7365p.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index ad4dab525f93..5891ff8bc475 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -199,6 +199,20 @@ config TINYDRM_SHARP_MEMORY
 
 	  If M is selected the module will be called sharp_memory.
 
+config TINYDRM_ST7365P
+	tristate "DRM support for Sitronix ST7365P display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the following Sitronix ST7365P panels:
+	  * Kingway HW-035P0Z002
+
+	  If M is selected the module will be called st7365p.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0151590db5cb..d98bb5f01387 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -15,5 +15,6 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
+obj-$(CONFIG_TINYDRM_ST7365P)		+= st7365p.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7365p.c b/drivers/gpu/drm/tiny/st7365p.c
new file mode 100644
index 000000000000..c388d57682a7
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7365p.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DRM driver for display panels connected to Sitronix ST7365P
+ * display controller in SPI mode.
+ *
+ * Copyright (C) Braiins Systems s.r.o. 2025
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modeset_helper.h>
+#include <video/mipi_display.h>
+
+/* ST7356P specific defines */
+#define ST7356P_DIC     0xB4 // Display Inversion Control
+#define ST7356P_EM      0xB7 // Entry Mode Set
+#define ST7356P_PWR1    0xC0 // Power Control 1
+#define ST7356P_PWR2    0xC1 // Power Control 2
+#define ST7356P_PWR3    0xC2 // Power Control 3
+#define ST7356P_VCMPCTL 0xC5 // VCOM Control
+#define ST7356P_VCMOST  0xC6 // VCOM Offset Register
+#define ST7356P_PGC     0xE0 // Positive Gamma Control
+#define ST7356P_NGC     0xE1 // Negative Gamma Control
+#define ST7356P_DOCA    0xE8 // Display Output Ctrl Adjust
+#define ST7356P_CSCON   0xF0 // Command Set Control
+
+#define ST7356P_CSCON_ENABLE_PART_1  0xC3
+#define ST7356P_CSCON_ENABLE_PART_2  0x96
+#define ST7356P_CSCON_DISABLE_PART_1 0x3C
+#define ST7356P_CSCON_DISABLE_PART_2 0x69
+
+#define MADCTL_MY    BIT(7) // Row Address Order
+#define MADCTL_MX    BIT(6) // Column Address Order
+#define MADCTL_MV    BIT(5) // Row/Column Exchange
+#define MADCTL_ML    BIT(4) // Vertical Refresh Order
+#define MADCTL_BGR   BIT(3) // RGB-BGR ORDER
+
+struct st7365p_cfg {
+	const struct drm_display_mode mode;
+	unsigned int inverted:1; /* Color invert mode */
+};
+
+struct st7365p_priv {
+	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
+	const struct st7365p_cfg *cfg;
+};
+
+static void st7365p_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct st7365p_priv *priv = container_of(dbidev, struct st7365p_priv,
+						 dbidev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	int ret, idx;
+	u8 addr_mode;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_reset(dbidev);
+	if (ret)
+		goto out_exit;
+
+	/* Exit sleep mode */
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(5);
+
+	/* 16-bit pixels */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
+
+	/* ST7365P specific settings */
+	mipi_dbi_command(dbi, ST7356P_CSCON, ST7356P_CSCON_ENABLE_PART_1);
+	mipi_dbi_command(dbi, ST7356P_CSCON, ST7356P_CSCON_ENABLE_PART_2);
+
+	mipi_dbi_command(dbi, ST7356P_DIC, 0x0001);
+	mipi_dbi_command(dbi, ST7356P_EM, 0x00C6);
+
+	mipi_dbi_command(dbi, ST7356P_PWR2, 0x0015);
+	mipi_dbi_command(dbi, ST7356P_PWR3, 0x00AF);
+	mipi_dbi_command(dbi, ST7356P_VCMPCTL, 0x0022);
+	mipi_dbi_command(dbi, ST7356P_VCMOST, 0x0000);
+	mipi_dbi_command(dbi, ST7356P_DOCA, 0x0040, 0x008A, 0x0000, 0x0000,
+					    0x0029, 0x0019, 0x00A5, 0x0033);
+
+	mipi_dbi_command(dbi, ST7356P_CSCON, ST7356P_CSCON_DISABLE_PART_1);
+	mipi_dbi_command(dbi, ST7356P_CSCON, ST7356P_CSCON_DISABLE_PART_2);
+
+	/* Enter inverted mode */
+	if (priv->cfg->inverted)
+		mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
+
+	/* Rotation */
+	addr_mode = 0;
+	switch (dbidev->rotation) {
+	case 0:
+		addr_mode |= (MADCTL_MX);
+		break;
+	case 90:
+		addr_mode |= (MADCTL_MV | MADCTL_MX | MADCTL_MY);
+		break;
+	case 180:
+		addr_mode |= (MADCTL_MY);
+		break;
+	case 270:
+		addr_mode |= (MADCTL_MV);
+		break;
+	default:
+		addr_mode = 0;
+	}
+
+	/* NOTE: The meaning of this attribute has opposite effect on
+	 * the controller so 'MADCTL_BGR' is used for RGB mode.
+	 */
+	addr_mode |= MADCTL_BGR;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+
+	/* Turn on Brightness Control Block and Backlight Control */
+	mipi_dbi_command(dbi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+
+	/* Turn on the display */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7365p_pipe_funcs = {
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7365p_pipe_enable),
+};
+
+static const struct st7365p_cfg kingway_hw035p0z002 = {
+	.mode       = { DRM_SIMPLE_MODE(320, 480, 49, 73) },
+	.inverted   = 1,
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7365p_fops);
+
+static const struct drm_driver st7365p_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops            = &st7365p_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+	.debugfs_init    = mipi_dbi_debugfs_init,
+	.name            = "st7365p",
+	.desc            = "Sitronix ST7365P",
+	.major           = 1,
+	.minor           = 0,
+};
+
+static const struct of_device_id st7365p_of_match[] = {
+	{ .compatible = "kingway,hw-035p0z002", .data = &kingway_hw035p0z002 },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, st7365p_of_match);
+
+static const struct spi_device_id st7365p_id[] = {
+	{ "hw-035p0z002", (uintptr_t)&kingway_hw035p0z002 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, st7365p_id);
+
+static int st7365p_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	const struct st7365p_cfg *cfg;
+	struct mipi_dbi_dev *dbidev;
+	struct st7365p_priv *priv;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation;
+	int ret;
+
+	cfg = device_get_match_data(&spi->dev);
+	if (!cfg)
+		cfg = (void *)spi_get_device_id(spi)->driver_data;
+
+	priv = devm_drm_dev_alloc(dev, &st7365p_driver,
+				  struct st7365p_priv, dbidev.drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	dbidev = &priv->dbidev;
+	priv->cfg = cfg;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	/* Disable reading from display */
+	dbi->read_commands = NULL;
+
+	rotation = 0;
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_dev_init(dbidev, &st7365p_pipe_funcs, &cfg->mode, rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_client_setup(drm, NULL);
+
+	return 0;
+}
+
+static void st7365p_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void st7365p_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver st7365p_spi_driver = {
+	.driver = {
+		.name = "st7365p",
+		.of_match_table = st7365p_of_match,
+	},
+	.id_table = st7365p_id,
+	.probe = st7365p_probe,
+	.remove = st7365p_remove,
+	.shutdown = st7365p_shutdown,
+};
+module_spi_driver(st7365p_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7365P DRM driver");
+MODULE_AUTHOR("Josef Lusticky <josef.lusticky@braiins.cz>");
+MODULE_LICENSE("GPL");
-- 
2.30.2

