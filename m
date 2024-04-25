Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25D8B21C6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 14:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7CA10FFE9;
	Thu, 25 Apr 2024 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ij7oVQmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9050C10FFE9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714048936; x=1745584936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xd08opKedHrtsU4GnsZbUiXElSa9U0/jkuoALRq3DZw=;
 b=ij7oVQmixMX5go7zjoiieegSJIiC9FpzV+dECme6hc/Ce/p9yr+KwEwg
 aeviq23W+pogOotFYTfhpv+RkmSHC2LtRqWhviRUGIHgVOdp+9HJ/g8en
 7qYtVCkZwG8tzcM7Ub8jPQfiNnX2IlhCK2aR5FY02JWkRNngrw6aXWZHT
 eUPO/HwLdKBpY1aXrrEDyv+Q1T/3imhWDwrYkRZ51YvgtVncDpxCXAfQ+
 Dw8StnNd6mBdM+Vp6a953CbmL+kviKXosoWKOKHlrkMJzeVVlmYMo1uDx
 df55aTp/Rb0Y0iZNBG3aaTJTMRoMm6H7rpRw5fl5aFFeI4/0FReXTe9Ql w==;
X-CSE-ConnectionGUID: ifRlMEAASla5lCGIVn52bw==
X-CSE-MsgGUID: IYeYNTG+QlKeJAMAcf5TSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9555808"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9555808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:42:15 -0700
X-CSE-ConnectionGUID: feb0LlWDTY6pGqiTfw9FeA==
X-CSE-MsgGUID: i5mRVIGfShCstltnol8NSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="62539171"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP; 25 Apr 2024 05:42:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EA79253E; Thu, 25 Apr 2024 15:42:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <dlechner@baylibre.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v1 1/1] drm/ili9341: Remove the duplicative driver
Date: Thu, 25 Apr 2024 15:42:07 +0300
Message-ID: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

First of all, the driver was introduced when it was already
two drivers available for Ilitek 9341 panels.

Second, the most recent (fourth!) driver has incorporated this one
and hence, when enabled, it covers the provided functionality.

Taking into account the above, remove duplicative driver and make
maintenance and support eaiser for everybody.

Also see discussion [1] for details about Ilitek 9341 duplication
code.

Link: https://lore.kernel.org/r/ZXM9pG-53V4S8E2H@smile.fi.intel.com [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/tiny/Kconfig   |  13 --
 drivers/gpu/drm/tiny/Makefile  |   1 -
 drivers/gpu/drm/tiny/ili9341.c | 253 ---------------------------------
 3 files changed, 267 deletions(-)
 delete mode 100644 drivers/gpu/drm/tiny/ili9341.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..2ab07bd0bb44 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -134,19 +134,6 @@ config TINYDRM_ILI9225
 
 	  If M is selected the module will be called ili9225.
 
-config TINYDRM_ILI9341
-	tristate "DRM support for ILI9341 display panels"
-	depends on DRM && SPI
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
-	help
-	  DRM driver for the following Ilitek ILI9341 panels:
-	  * YX240QV29-T 2.4" 240x320 TFT (Adafruit 2.4")
-
-	  If M is selected the module will be called ili9341.
-
 config TINYDRM_ILI9486
 	tristate "DRM support for ILI9486 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b..37cc9b27e79d 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
-obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
deleted file mode 100644
index 47b61c3bf145..000000000000
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ /dev/null
@@ -1,253 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * DRM driver for Ilitek ILI9341 panels
- *
- * Copyright 2018 David Lechner <david@lechnology.com>
- *
- * Based on mi0283qt.c:
- * Copyright 2016 Noralf Trønnes
- */
-
-#include <linux/backlight.h>
-#include <linux/delay.h>
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
-#include <linux/property.h>
-#include <linux/spi/spi.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
-#include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_managed.h>
-#include <drm/drm_mipi_dbi.h>
-#include <drm/drm_modeset_helper.h>
-#include <video/mipi_display.h>
-
-#define ILI9341_FRMCTR1		0xb1
-#define ILI9341_DISCTRL		0xb6
-#define ILI9341_ETMOD		0xb7
-
-#define ILI9341_PWCTRL1		0xc0
-#define ILI9341_PWCTRL2		0xc1
-#define ILI9341_VMCTRL1		0xc5
-#define ILI9341_VMCTRL2		0xc7
-#define ILI9341_PWCTRLA		0xcb
-#define ILI9341_PWCTRLB		0xcf
-
-#define ILI9341_PGAMCTRL	0xe0
-#define ILI9341_NGAMCTRL	0xe1
-#define ILI9341_DTCTRLA		0xe8
-#define ILI9341_DTCTRLB		0xea
-#define ILI9341_PWRSEQ		0xed
-
-#define ILI9341_EN3GAM		0xf2
-#define ILI9341_PUMPCTRL	0xf7
-
-#define ILI9341_MADCTL_BGR	BIT(3)
-#define ILI9341_MADCTL_MV	BIT(5)
-#define ILI9341_MADCTL_MX	BIT(6)
-#define ILI9341_MADCTL_MY	BIT(7)
-
-static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
-			     struct drm_crtc_state *crtc_state,
-			     struct drm_plane_state *plane_state)
-{
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-	struct mipi_dbi *dbi = &dbidev->dbi;
-	u8 addr_mode;
-	int ret, idx;
-
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
-		return;
-
-	DRM_DEBUG_KMS("\n");
-
-	ret = mipi_dbi_poweron_conditional_reset(dbidev);
-	if (ret < 0)
-		goto out_exit;
-	if (ret == 1)
-		goto out_enable;
-
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
-
-	mipi_dbi_command(dbi, ILI9341_PWCTRLB, 0x00, 0xc1, 0x30);
-	mipi_dbi_command(dbi, ILI9341_PWRSEQ, 0x64, 0x03, 0x12, 0x81);
-	mipi_dbi_command(dbi, ILI9341_DTCTRLA, 0x85, 0x00, 0x78);
-	mipi_dbi_command(dbi, ILI9341_PWCTRLA, 0x39, 0x2c, 0x00, 0x34, 0x02);
-	mipi_dbi_command(dbi, ILI9341_PUMPCTRL, 0x20);
-	mipi_dbi_command(dbi, ILI9341_DTCTRLB, 0x00, 0x00);
-
-	/* Power Control */
-	mipi_dbi_command(dbi, ILI9341_PWCTRL1, 0x23);
-	mipi_dbi_command(dbi, ILI9341_PWCTRL2, 0x10);
-	/* VCOM */
-	mipi_dbi_command(dbi, ILI9341_VMCTRL1, 0x3e, 0x28);
-	mipi_dbi_command(dbi, ILI9341_VMCTRL2, 0x86);
-
-	/* Memory Access Control */
-	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
-
-	/* Frame Rate */
-	mipi_dbi_command(dbi, ILI9341_FRMCTR1, 0x00, 0x1b);
-
-	/* Gamma */
-	mipi_dbi_command(dbi, ILI9341_EN3GAM, 0x00);
-	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
-	mipi_dbi_command(dbi, ILI9341_PGAMCTRL,
-			 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
-			 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
-	mipi_dbi_command(dbi, ILI9341_NGAMCTRL,
-			 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
-			 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
-
-	/* DDRAM */
-	mipi_dbi_command(dbi, ILI9341_ETMOD, 0x07);
-
-	/* Display */
-	mipi_dbi_command(dbi, ILI9341_DISCTRL, 0x08, 0x82, 0x27, 0x00);
-	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
-	msleep(100);
-
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
-	msleep(100);
-
-out_enable:
-	switch (dbidev->rotation) {
-	default:
-		addr_mode = ILI9341_MADCTL_MX;
-		break;
-	case 90:
-		addr_mode = ILI9341_MADCTL_MV;
-		break;
-	case 180:
-		addr_mode = ILI9341_MADCTL_MY;
-		break;
-	case 270:
-		addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
-			    ILI9341_MADCTL_MX;
-		break;
-	}
-	addr_mode |= ILI9341_MADCTL_BGR;
-	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
-out_exit:
-	drm_dev_exit(idx);
-}
-
-static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
-	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
-};
-
-static const struct drm_display_mode yx240qv29_mode = {
-	DRM_SIMPLE_MODE(240, 320, 37, 49),
-};
-
-DEFINE_DRM_GEM_DMA_FOPS(ili9341_fops);
-
-static const struct drm_driver ili9341_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.fops			= &ili9341_fops,
-	DRM_GEM_DMA_DRIVER_OPS_VMAP,
-	.debugfs_init		= mipi_dbi_debugfs_init,
-	.name			= "ili9341",
-	.desc			= "Ilitek ILI9341",
-	.date			= "20180514",
-	.major			= 1,
-	.minor			= 0,
-};
-
-static const struct of_device_id ili9341_of_match[] = {
-	{ .compatible = "adafruit,yx240qv29" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, ili9341_of_match);
-
-static const struct spi_device_id ili9341_id[] = {
-	{ "yx240qv29", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(spi, ili9341_id);
-
-static int ili9341_probe(struct spi_device *spi)
-{
-	struct device *dev = &spi->dev;
-	struct mipi_dbi_dev *dbidev;
-	struct drm_device *drm;
-	struct mipi_dbi *dbi;
-	struct gpio_desc *dc;
-	u32 rotation = 0;
-	int ret;
-
-	dbidev = devm_drm_dev_alloc(dev, &ili9341_driver,
-				    struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
-
-	dbi = &dbidev->dbi;
-	drm = &dbidev->drm;
-
-	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dbi->reset))
-		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
-
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
-	if (IS_ERR(dc))
-		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
-
-	dbidev->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(dbidev->backlight))
-		return PTR_ERR(dbidev->backlight);
-
-	device_property_read_u32(dev, "rotation", &rotation);
-
-	ret = mipi_dbi_spi_init(spi, dbi, dc);
-	if (ret)
-		return ret;
-
-	ret = mipi_dbi_dev_init(dbidev, &ili9341_pipe_funcs, &yx240qv29_mode, rotation);
-	if (ret)
-		return ret;
-
-	drm_mode_config_reset(drm);
-
-	ret = drm_dev_register(drm, 0);
-	if (ret)
-		return ret;
-
-	spi_set_drvdata(spi, drm);
-
-	drm_fbdev_generic_setup(drm, 0);
-
-	return 0;
-}
-
-static void ili9341_remove(struct spi_device *spi)
-{
-	struct drm_device *drm = spi_get_drvdata(spi);
-
-	drm_dev_unplug(drm);
-	drm_atomic_helper_shutdown(drm);
-}
-
-static void ili9341_shutdown(struct spi_device *spi)
-{
-	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
-}
-
-static struct spi_driver ili9341_spi_driver = {
-	.driver = {
-		.name = "ili9341",
-		.of_match_table = ili9341_of_match,
-	},
-	.id_table = ili9341_id,
-	.probe = ili9341_probe,
-	.remove = ili9341_remove,
-	.shutdown = ili9341_shutdown,
-};
-module_spi_driver(ili9341_spi_driver);
-
-MODULE_DESCRIPTION("Ilitek ILI9341 DRM driver");
-MODULE_AUTHOR("David Lechner <david@lechnology.com>");
-MODULE_LICENSE("GPL");
-- 
2.43.0.rc1.1336.g36b5255a03ac

