Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080F149FA6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEB06EA38;
	Mon, 27 Jan 2020 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F876E87B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 15:46:53 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id p18so1177179ils.6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 07:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fuBhp0/v+KwLfU5fGZAT0C1jf7HCpyVsrhLy6R1GrTc=;
 b=ISQfzng9ziKXw/uG3anATFKjkmUKfM3W+sXfHNKgSugAadJUb/NsGYZMNWcldEqN3v
 IgUMBHi6fgSLM6aI3dlEjMZ0KxumfU4FVilXOO0UaUIbZWwkjrZcfGZjJW4UfJv8l9BX
 JE4bj1bxzUjpilm557CZZqFeScpqhDElnQf9ON1Xv8fHRI5EVmzYb4t/Qit+ScI2rKrW
 89bIjl/KgQSyQFDh73oDZmpDYRcVKBF7Wp8UQN5v0aj/3Eft9i+8npHcjT0u9IIqDe0p
 4SP0mofRee1k5N/6/I68/7Buf7E+gDVEVSQkaguLUNg8lBVz9gzCVZmU3W4wag24W0Bj
 uiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fuBhp0/v+KwLfU5fGZAT0C1jf7HCpyVsrhLy6R1GrTc=;
 b=PDTElCAe3RFB230sXsvEKQwYPc/kJjmdOluq/6uvAUBWh8PDoZv8xQPblHefS5j8QF
 F1/aqB0kzxjR7iApTJ03TOB4EZgkaSNUibBYCOtV5iwBfLXFvZRIDUOEWN8r9tGwBEgA
 0RceTQhwx0q2d7zbkK+cz/4v7PsDgUP2tGms0ojDN5aKWWmnSUNLNnsekWDt9Kbcge+m
 RdsT4rqwU/qgTY3d9LrnOIPhMlbA19lOmNAVhxb1mp8kjC5ONJqSmyCyQ2zVrIxj7fS5
 1Sy6axFEtWufMSCjPOMthbWnuYvSX6253ZKC6vFzV7WPpD9XFD93xvzCIO1BUkhqLwYa
 oqWQ==
X-Gm-Message-State: APjAAAUhzjMq6wAdgg8W+OGAxTN+Q9SttuZ+AcG6C+YPGF5shoKR5580
 OehtoTLuFatOsd+MNfVVZXsLkCeVKj/6Bg==
X-Google-Smtp-Source: APXvYqw0/MpMSCTRnTKy1XxMHJFML3YPwvYgF9wobfGiul+dOkXP8DftfN5NOiG8k3iqSr4/W0yxFQ==
X-Received: by 2002:a63:3e03:: with SMTP id l3mr10200479pga.118.1579966728754; 
 Sat, 25 Jan 2020 07:38:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:717b:4cd5:6ebd:92d1])
 by smtp.gmail.com with ESMTPSA id h7sm10715715pfq.36.2020.01.25.07.38.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 25 Jan 2020 07:38:48 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org
Subject: [PATCH 2/2] drm/tinydrm: add support for ilitek,
 ili9486 based displays with regwidth=16
Date: Sat, 25 Jan 2020 21:08:43 +0530
Message-Id: <3a1a995019b405d1c03637db96271d33a25f6797.1579963130.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
References: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support fot ilitek,ili9486 based display with shift register in front
of controller, basically with regwidth=16

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 MAINTAINERS                    |   7 +
 drivers/gpu/drm/tiny/Kconfig   |  14 ++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ili9486.c | 288 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 310 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aa9add5..0e54cba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5227,6 +5227,13 @@ S:	Maintained
 F:	drivers/gpu/drm/tiny/ili9225.c
 F:	Documentation/devicetree/bindings/display/ilitek,ili9225.txt
 
+DRM DRIVER FOR ILITEK ILI9486 PANELS
+M:	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+S:	Maintained
+F:	drivers/gpu/drm/tiny/ili9486.c
+F:	Documentation/devicetree/bindings/display/ilitek,ili9486.txt
+
 DRM DRIVER FOR HX8357D PANELS
 M:	Eric Anholt <eric@anholt.net>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index a46ac28..fe135cd 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -47,6 +47,20 @@ config TINYDRM_ILI9341
 
 	  If M is selected the module will be called ili9341.
 
+config TINYDRM_ILI9486
+	tristate "DRM support for ILI9486 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the following Ilitek ILI486 panels:
+	  * PISCREEN 3.5" 320x480 TFT (Ozzmaker 3.5")
+	  * RPILCD 3.5" 320x480 TFT (Waveshare 3.5")
+
+	  If M is selected the module will be called ili9486.
+
 config TINYDRM_MI0283QT
 	tristate "DRM support for MI0283QT"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 896cf31..1f8a0f0 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
new file mode 100644
index 0000000..bed83b0
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DRM driver for Ilitek ILI9486 panels
+ *
+ * Copyright 2018 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+ *
+ * Some code copied from mipi-dbi.c
+ * Copyright 2016 Noralf Tronnes
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modeset_helper.h>
+
+#define ILI9486_ITFCTR1         0xb0
+#define ILI9486_PWCTRL1         0xc2
+#define ILI9486_VMCTRL1         0xc5
+#define ILI9486_PGAMCTRL        0xe0
+#define ILI9486_NGAMCTRL        0xe1
+#define ILI9486_DGAMCTRL        0xe2
+#define ILI9486_MADCTL_BGR      BIT(3)
+#define ILI9486_MADCTL_MV       BIT(5)
+#define ILI9486_MADCTL_MX       BIT(6)
+#define ILI9486_MADCTL_MY       BIT(7)
+
+/*
+ * The PiScreen/waveshare rpi-lcd-35 has a SPI to 16-bit parallel bus converter
+ * in front of the  display controller. This means that 8-bit values has to be
+ * transferred as 16-bit.
+ */
+static int ili9486_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par, size_t num)
+{
+	struct spi_device *spi = mipi->spi;
+	void *data = par;
+	u32 speed_hz;
+	unsigned int bpw = 8;
+	int i, ret;
+	u16 *buf;
+
+	buf = kmalloc(32 * sizeof(u16), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/*
+	 * The Raspberry Pi supports only 8-bit on the DMA capable SPI
+	 * controller and is little endian, so byte swapping is needed.
+	 */
+	buf[0] = cpu_to_be16(*cmd);
+	gpiod_set_value_cansleep(mipi->dc, 0);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 2);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, buf, 2);
+	if (ret || !num)
+		goto free;
+
+	/* 8-bit configuration data, not 16-bit pixel data */
+	if (num <= 32) {
+		for (i = 0; i < num; i++)
+			buf[i] = cpu_to_be16(par[i]);
+		num *= 2;
+		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+		data = buf;
+	}
+
+	gpiod_set_value_cansleep(mipi->dc, 1);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
+ free:
+	kfree(buf);
+
+	return ret;
+}
+
+static void ili9486_enable(struct drm_simple_display_pipe *pipe,
+			   struct drm_crtc_state *crtc_state,
+			   struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, ILI9486_ITFCTR1);
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(250);
+
+	/* Interface Pixel Format */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+
+	/* Power Control 3 */
+	mipi_dbi_command(dbi, ILI9486_PWCTRL1, 0x44);
+
+	/* VCOM Control 1 */
+	mipi_dbi_command(dbi, ILI9486_VMCTRL1, 0x00, 0x00, 0x00, 0x00);
+
+	/* PGAMCTRL(Positive Gamma Control) */
+	mipi_dbi_command(dbi, ILI9486_PGAMCTRL,
+			 0x0F, 0x1F, 0x1C, 0x0C, 0x0F, 0x08, 0x48, 0x98,
+			 0x37, 0x0A, 0x13, 0x04, 0x11, 0x0D, 0x0);
+	mipi_dbi_command(dbi, ILI9486_NGAMCTRL,
+			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
+			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
+	mipi_dbi_command(dbi, ILI9486_DGAMCTRL,
+			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
+			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+
+ out_enable:
+	switch (dbidev->rotation) {
+	case 90:
+		addr_mode = ILI9486_MADCTL_MY;
+		break;
+	case 180:
+		addr_mode = ILI9486_MADCTL_MV;
+		break;
+	case 270:
+		addr_mode = ILI9486_MADCTL_MX;
+		break;
+	default:
+		addr_mode = ILI9486_MADCTL_MV | ILI9486_MADCTL_MY |
+			ILI9486_MADCTL_MX;
+		break;
+	}
+	addr_mode |= ILI9486_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+ out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ili9486_pipe_funcs = {
+	.enable = ili9486_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode ili9486_mode = {
+	DRM_SIMPLE_MODE(480, 320, 73, 49),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
+
+static struct drm_driver ili9486_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9486_fops,
+	.release		= mipi_dbi_release,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "ili9486",
+	.desc			= "Ilitek ILI9486",
+	.date			= "20200118",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id ili9486_of_match[] = {
+	{ .compatible = "waveshare,rpi-lcd-35" },
+	{ .compatible = "ozzmaker,piscreen" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ili9486_of_match);
+
+static const struct spi_device_id ili9486_id[] = {
+	{ "ili9486", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9486_id);
+
+static int ili9486_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	int ret;
+
+	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
+	if (!dbidev)
+		return -ENOMEM;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+	ret = devm_drm_dev_init(dev, drm, &ili9486_driver);
+	if (ret) {
+		kfree(dbidev);
+		return ret;
+	}
+
+	drm_mode_config_init(drm);
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
+		return PTR_ERR(dc);
+	}
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_dev_init(dbidev, &ili9486_pipe_funcs, &ili9486_mode, rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	dbi->command = ili9486_command;
+	dbi->read_commands = NULL;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static int ili9486_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void ili9486_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver ili9486_spi_driver = {
+	.driver = {
+		.name = "ili9486",
+		.of_match_table = ili9486_of_match,
+	},
+	.id_table = ili9486_id,
+	.probe = ili9486_probe,
+	.remove = ili9486_remove,
+	.shutdown = ili9486_shutdown,
+};
+module_spi_driver(ili9486_spi_driver);
+
+MODULE_DESCRIPTION("Ilitek ILI9486 DRM driver");
+MODULE_AUTHOR("Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
