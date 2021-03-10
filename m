Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF9333FEA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 15:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84C06E23B;
	Wed, 10 Mar 2021 14:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243966E23B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 14:05:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso5039348pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3n6Npc2UkFky2Jgdnrha/dA9nyJs658Gh0K+SHkyuf0=;
 b=YrVl3PJG9qQi4u856zwFswvLCxhcYmsWsxlf17oERgBHLc8dZzIqLbdwgNYTx/72/u
 4+RUpHoY8Wzn5UaDPSuD4lQKEWyvASEFyrZwdJHtYCh3ZEdq5Nav396l7oJ1U8ufjVFs
 GbEfGvAty+ljGbqe703xGsVdLLpT2niIo/p2ZtKOyrXK9SfCvjqHbjwm5THA4pAhQMdu
 LcfYLRW9zONhdnLB9qNf1l6dC+7AElIsWqDkoOCGOkehqyMDUNnK8BAALKa2+ObBARVZ
 xG+dIpu5GVvkDhB65fKuvWxZ+Q6kgC+SYVpdZdhxpWEy38Ij8m6flFHgPyiwLdUjFdxv
 zy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3n6Npc2UkFky2Jgdnrha/dA9nyJs658Gh0K+SHkyuf0=;
 b=ghjqTZ6HzqMZQSGw9pZ0TCsxS0oaP5OESyDy3eA5nhUn8ffK8k0O57QDe3XTb/BFwv
 6bWG967V1A+IBUAdYoN3K0yiwe5G5Q8gi3xThHEIZUZcThYahBVQmpekJiWDiLYqncJs
 xCw8leWhCnjQcMTqwmhBP/dpInWHbKzR7+fupJdpLKzH2fCEhyJycm0zkWnEmxVnlUuQ
 k6+8tiFUoLpzjFHo7RacOoN5YKVfWaQqUvL8379BVNb2vBkBDDWdFC9D0eqTCG9woAMt
 LPQFetlkenNWx6LGcl/SfoXiLctIU46nEzDE+Gc/o8QD1QrQ1igG07nQeX4TvzLF1IE2
 xdvA==
X-Gm-Message-State: AOAM530IYIxG5sxWv1WkptoFzF371yDl/OYoX7jAPJUGZhU/JN/87YrZ
 w73jEmV4B3bWG4RPl9woJGxd9a5aSAbzFQ==
X-Google-Smtp-Source: ABdhPJxqkocwr5KCp5xefQNXoA5jVT5T51nlTeA7dz2ahXZDabWPEwtE4+GFhdKSnElCa4cUNUK8pQ==
X-Received: by 2002:a17:90a:17ea:: with SMTP id
 q97mr3872444pja.71.1615385153673; 
 Wed, 10 Mar 2021 06:05:53 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id l3sm16176937pfc.81.2021.03.10.06.05.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:05:53 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, zhangxuezhi1@yulong.com,
 tzimmermann@suse.de, sam@ravnborg.org, kraxel@redhat.com
Subject: [PATCH] drm/tiny: add support for Waveshare 2inch LCD module
Date: Wed, 10 Mar 2021 22:06:02 +0800
Message-Id: <1615385162-130866-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Carlis" <zhangxuezhi1@yulong.com>

This adds a new module for the ST7789V controller with parameters for
the Waveshare 2inch LCD module.

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
 MAINTAINERS                    |   7 ++
 drivers/gpu/drm/tiny/Kconfig   |  14 +++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/st7789v.c | 269 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 291 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/st7789v.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85c..10161be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5769,6 +5769,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/tiny/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7789V PANELS
+M:	Carlis <zhangxuezhi1@yulong.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
+F:	drivers/gpu/drm/tiny/st7789v.c
+
 DRM DRIVER FOR SONY ACX424AKP PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 2b6414f..ac2c7fb 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -131,3 +131,17 @@ config TINYDRM_ST7735R
 	  * Okaya RH128128T 1.44" 128x128 TFT
 
 	  If M is selected the module will be called st7735r.
+
+config TINYDRM_ST7789V
+	tristate "DRM support for Sitronix ST7789V display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for Sitronix ST7789V with one of the following
+	  LCDs:
+	  * Waveshare 2inch lcd module 240x320 TFT
+
+	  If M is selected the module will be called st7789v.
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 6ae4e9e5..aa0caa2 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_TINYDRM_ST7789V)		+= st7789v.o
diff --git a/drivers/gpu/drm/tiny/st7789v.c b/drivers/gpu/drm/tiny/st7789v.c
new file mode 100644
index 0000000..b641857
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7789v.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DRM driver for display panels connected to a Sitronix ST7789V
+ * display controller in SPI mode.
+ *
+ * Copyright 2017 David Lechner <david@lechnology.com>
+ * Copyright (C) 2019 Glider bvba
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
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
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+
+#define ST7789V_PORCTRL     0xb2
+#define ST7789V_GCTRL       0xb7
+#define ST7789V_VCOMS       0xbb
+#define ST7789V_LCMCTRL     0xc0
+#define ST7789V_VDVVRHEN    0xc2
+#define ST7789V_VRHS        0xc3
+#define ST7789V_VDVS        0xc4
+#define ST7789V_FRCTRL2     0xc6
+#define ST7789V_PWCTRL1     0xd0
+#define ST7789V_PVGAMCTRL   0xe0
+#define ST7789V_NVGAMCTRL   0xe1
+
+#define ST7789V_MY	BIT(7)
+#define ST7789V_MX	BIT(6)
+#define ST7789V_MV	BIT(5)
+#define ST7789V_RGB	BIT(3)
+
+struct st7789v_cfg {
+	const struct drm_display_mode mode;
+	unsigned int left_offset;
+	unsigned int top_offset;
+	unsigned int write_only:1;
+	unsigned int rgb:1;		/* RGB (vs. BGR) */
+};
+
+struct st7789v_priv {
+	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
+	const struct st7789v_cfg *cfg;
+};
+
+static void st7789v_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct st7789v_priv *priv = container_of(dbidev, struct st7789v_priv,
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
+	msleep(150);
+
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(100);
+
+
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = 0;
+		break;
+	case 90:
+		addr_mode = ST7789V_MY | ST7789V_MV;
+		break;
+	case 180:
+		addr_mode = ST7789V_MX | ST7789V_MY;
+		break;
+	case 270:
+		addr_mode = ST7789V_MX | ST7789V_MV;
+		break;
+	}
+
+	if (priv->cfg->rgb)
+		addr_mode |= ST7789V_RGB;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
+			 MIPI_DCS_PIXEL_FMT_16BIT);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
+	mipi_dbi_command(dbi, ST7789V_PORCTRL, 0x0c, 0x0c, 0x00, 0x33, 0x33);
+	mipi_dbi_command(dbi, ST7789V_GCTRL, 0x35);
+	mipi_dbi_command(dbi, ST7789V_VCOMS, 0x1f);
+	mipi_dbi_command(dbi, ST7789V_LCMCTRL, 0x2c);
+	mipi_dbi_command(dbi, ST7789V_VDVVRHEN, 0x01);
+	mipi_dbi_command(dbi, ST7789V_VRHS, 0x12);
+	mipi_dbi_command(dbi, ST7789V_VDVS, 0x20);
+	mipi_dbi_command(dbi, ST7789V_FRCTRL2, 0x0f);
+	mipi_dbi_command(dbi, ST7789V_PWCTRL1, 0xa4, 0xa1);
+	mipi_dbi_command(dbi, ST7789V_PVGAMCTRL, 0xd0, 0x08, 0x11, 0x08, 0x0c,
+				0x15, 0x39, 0x33, 0x50, 0x36, 0x13, 0x14, 0x29, 0x2d);
+	mipi_dbi_command(dbi, ST7789V_NVGAMCTRL, 0xd0, 0x08, 0x10, 0x08, 0x06,
+				0x06, 0x39, 0x44, 0x51, 0x0b, 0x16, 0x14, 0x2f, 0x31);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7789v_pipe_funcs = {
+	.enable		= st7789v_pipe_enable,
+	.disable	= mipi_dbi_pipe_disable,
+	.update		= mipi_dbi_pipe_update,
+	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct st7789v_cfg ws_2inch_lcd_cfg = {
+	.mode		= { DRM_SIMPLE_MODE(240, 320, 34, 43) },
+	/* Cannot read from Waveshare 2inch lcd module" display via SPI */
+	.write_only	= true,
+	.rgb		= false,
+};
+
+
+DEFINE_DRM_GEM_CMA_FOPS(st7789v_fops);
+
+static const struct drm_driver st7789v_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &st7789v_fops,
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "st7789v",
+	.desc			= "Sitronix ST7789R",
+	.date			= "20210310",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id st7789v_of_match[] = {
+	{ .compatible = "waveshare,ws-2inch-lcd", .data = &ws_2inch_lcd_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, st7789v_of_match);
+
+static const struct spi_device_id st7789v_id[] = {
+	{ "ws-2inch-lcd", (uintptr_t)&ws_2inch_lcd_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, st7789v_id);
+
+static int st7789v_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	const struct st7789v_cfg *cfg;
+	struct mipi_dbi_dev *dbidev;
+	struct st7789v_priv *priv;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	int ret;
+
+	cfg = device_get_match_data(&spi->dev);
+	if (!cfg)
+		cfg = (void *)spi_get_device_id(spi)->driver_data;
+
+	priv = devm_drm_dev_alloc(dev, &st7789v_driver,
+				  struct st7789v_priv, dbidev.drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	dbidev = &priv->dbidev;
+	priv->cfg = cfg;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
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
+	if (cfg->write_only)
+		dbi->read_commands = NULL;
+
+	dbidev->left_offset = cfg->left_offset;
+	dbidev->top_offset = cfg->top_offset;
+
+	ret = mipi_dbi_dev_init(dbidev, &st7789v_pipe_funcs, &cfg->mode,
+				rotation);
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
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static int st7789v_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void st7789v_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver st7789v_spi_driver = {
+	.driver = {
+		.name = "st7789v",
+		.of_match_table = st7789v_of_match,
+	},
+	.id_table = st7789v_id,
+	.probe = st7789v_probe,
+	.remove = st7789v_remove,
+	.shutdown = st7789v_shutdown,
+};
+module_spi_driver(st7789v_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7789V DRM driver");
+MODULE_AUTHOR("Carlis <zhangxuezhi1@yulong.com>");
+MODULE_LICENSE("GPL");
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
