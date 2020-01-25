Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5281496E8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 18:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADF96E8B0;
	Sat, 25 Jan 2020 17:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4C6E8B1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mx6uOl6AX1HGftWRBj9nF3MLcwA+M8i1721wiKsiOM=; b=EFpLiPCkvqFtaftDLNRkcjN+s6
 Gbd36+y5M5YcsRq2RTdRSb9w0Lu274gZeAyAyVwo4LnEslK++Gzhk13pB2yfn41kuPKNtMGc84Gpe
 59bFZ9JFAsyOrPjAUR+DPoMjw2i1EfH++onzJVxX0WvN6Im2BAWtIj/Sf3X1Uu35UjCObTEd+BD3Y
 OUoRiUY3oc6ochfWCJezyfo9f3tDFH7xoXIi4Tctxcm3jampl0zfXXzJmPckTJ0B+4wk6yV0cm5va
 Cs3kKE07QpKgo8SLqySABn1YfDozP/wfs3kjuReAVZNjCtIsvScrs3cdKC7T2W0rRpb2a+IsJtzt+
 bfxD+x6w==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55016
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ivPGI-0007wG-OE; Sat, 25 Jan 2020 18:30:22 +0100
Subject: Re: [PATCH 2/2] drm/tinydrm: add support for ilitek,ili9486 based
 displays with regwidth=16
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
References: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
 <3a1a995019b405d1c03637db96271d33a25f6797.1579963130.git.kamlesh.gurudasani@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <88f295e0-94f1-053e-4e7d-fa57a281ab21@tronnes.org>
Date: Sat, 25 Jan 2020 18:30:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a1a995019b405d1c03637db96271d33a25f6797.1579963130.git.kamlesh.gurudasani@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kamlesh,

Nice to see this driver, this means I can now drop the piscreen driver
from the out-of-tree tinydrm repo.

Den 25.01.2020 16.38, skrev Kamlesh Gurudasani:
> This adds support fot ilitek,ili9486 based display with shift register in front

s/fot/for/

> of controller, basically with regwidth=16

The last part of this sentence only makes sense for people that know
fbtft. Either add a reference to fbtft or just drop it.

> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---

<snip>

> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index a46ac28..fe135cd 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -47,6 +47,20 @@ config TINYDRM_ILI9341
>  
>  	  If M is selected the module will be called ili9341.
>  
> +config TINYDRM_ILI9486
> +	tristate "DRM support for ILI9486 display panels"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DBI
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM driver for the following Ilitek ILI486 panels:

s/ILI486/ILI9486/

> +	  * PISCREEN 3.5" 320x480 TFT (Ozzmaker 3.5")
> +	  * RPILCD 3.5" 320x480 TFT (Waveshare 3.5")
> +
> +	  If M is selected the module will be called ili9486.
> +
>  config TINYDRM_MI0283QT
>  	tristate "DRM support for MI0283QT"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 896cf31..1f8a0f0 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>  obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>  obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
>  obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> +obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o

Please keep the entries sorted alphabetically.

> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> new file mode 100644
> index 0000000..bed83b0
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DRM driver for Ilitek ILI9486 panels
> + *
> + * Copyright 2018 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>

2020?

> + *
> + * Some code copied from mipi-dbi.c
> + * Copyright 2016 Noralf Tronnes

You can drop this last paragraph, I see that you've copied it from
ili9225, but these tiny drivers are just more or less boilerplate
drivers with very little special stuff.

> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modeset_helper.h>
> +
> +#define ILI9486_ITFCTR1         0xb0
> +#define ILI9486_PWCTRL1         0xc2
> +#define ILI9486_VMCTRL1         0xc5
> +#define ILI9486_PGAMCTRL        0xe0
> +#define ILI9486_NGAMCTRL        0xe1
> +#define ILI9486_DGAMCTRL        0xe2
> +#define ILI9486_MADCTL_BGR      BIT(3)
> +#define ILI9486_MADCTL_MV       BIT(5)
> +#define ILI9486_MADCTL_MX       BIT(6)
> +#define ILI9486_MADCTL_MY       BIT(7)
> +
> +/*
> + * The PiScreen/waveshare rpi-lcd-35 has a SPI to 16-bit parallel bus converter
> + * in front of the  display controller. This means that 8-bit values has to be

s/has/have/

> + * transferred as 16-bit.
> + */
> +static int ili9486_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par, size_t num)

The function name here is misleading, the ili9486 can use the default in
drm_mipi_dbi when used in SPI mode, so you should name it
piscreen_command or waveshare_command since it's special for those displays.

> +{
> +	struct spi_device *spi = mipi->spi;
> +	void *data = par;
> +	u32 speed_hz;
> +	unsigned int bpw = 8;
> +	int i, ret;
> +	u16 *buf;
> +
> +	buf = kmalloc(32 * sizeof(u16), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/*
> +	 * The Raspberry Pi supports only 8-bit on the DMA capable SPI
> +	 * controller and is little endian, so byte swapping is needed.
> +	 */

I found this comment a bit confusing at first, then I realised that I
wrote it myself in the piscreen driver. I think we should expand a
little here to make it clear that these displays are made for the Pi.
Maybe something like this:

The displays are Raspberry Pi HATs and connected to the 8-bit only SPI
controller so 16-bit command and parameters need byte swapping before
being transferred as 8-bit on the big endian SPI bus.
Pixel data bytes have already been swapped before this function is called.

> +	buf[0] = cpu_to_be16(*cmd);
> +	gpiod_set_value_cansleep(mipi->dc, 0);
> +	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 2);
> +	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, buf, 2);

You don't change bpw, so you can drop the variable and use the value
directly.

> +	if (ret || !num)
> +		goto free;
> +
> +	/* 8-bit configuration data, not 16-bit pixel data */
> +	if (num <= 32) {
> +		for (i = 0; i < num; i++)
> +			buf[i] = cpu_to_be16(par[i]);
> +		num *= 2;
> +		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
> +		data = buf;
> +	}
> +
> +	gpiod_set_value_cansleep(mipi->dc, 1);
> +	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
> + free:
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static void ili9486_enable(struct drm_simple_display_pipe *pipe,

Please change the function name here as well. The enable function is
always display specific.

> +			   struct drm_crtc_state *crtc_state,
> +			   struct drm_plane_state *plane_state)
> +{
> +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
> +	struct mipi_dbi *dbi = &dbidev->dbi;
> +	u8 addr_mode;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(pipe->crtc.dev, &idx))
> +		return;
> +
> +	DRM_DEBUG_KMS("\n");
> +
> +	ret = mipi_dbi_poweron_conditional_reset(dbidev);
> +	if (ret < 0)
> +		goto out_exit;
> +	if (ret == 1)
> +		goto out_enable;
> +
> +	mipi_dbi_command(dbi, ILI9486_ITFCTR1);
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(250);
> +
> +	/* Interface Pixel Format */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> +
> +	/* Power Control 3 */

The comment doesn't match the macro.
I think you can drop these comments, the macros (almost) says it all.

> +	mipi_dbi_command(dbi, ILI9486_PWCTRL1, 0x44);
> +
> +	/* VCOM Control 1 */
> +	mipi_dbi_command(dbi, ILI9486_VMCTRL1, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* PGAMCTRL(Positive Gamma Control) */
> +	mipi_dbi_command(dbi, ILI9486_PGAMCTRL,
> +			 0x0F, 0x1F, 0x1C, 0x0C, 0x0F, 0x08, 0x48, 0x98,
> +			 0x37, 0x0A, 0x13, 0x04, 0x11, 0x0D, 0x0);
> +	mipi_dbi_command(dbi, ILI9486_NGAMCTRL,
> +			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
> +			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
> +	mipi_dbi_command(dbi, ILI9486_DGAMCTRL,
> +			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
> +			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> +	msleep(100);
> +
> + out_enable:
> +	switch (dbidev->rotation) {
> +	case 90:
> +		addr_mode = ILI9486_MADCTL_MY;
> +		break;
> +	case 180:
> +		addr_mode = ILI9486_MADCTL_MV;
> +		break;
> +	case 270:
> +		addr_mode = ILI9486_MADCTL_MX;
> +		break;
> +	default:
> +		addr_mode = ILI9486_MADCTL_MV | ILI9486_MADCTL_MY |
> +			ILI9486_MADCTL_MX;
> +		break;
> +	}
> +	addr_mode |= ILI9486_MADCTL_BGR;
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> +	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> + out_exit:
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs ili9486_pipe_funcs = {

Pipe funcs are also display specific.

> +	.enable = ili9486_enable,
> +	.disable = mipi_dbi_pipe_disable,
> +	.update = mipi_dbi_pipe_update,
> +	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_display_mode ili9486_mode = {

Display specific.

> +	DRM_SIMPLE_MODE(480, 320, 73, 49),
> +};
> +
> +DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
> +
> +static struct drm_driver ili9486_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			= &ili9486_fops,
> +	.release		= mipi_dbi_release,
> +	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> +	.debugfs_init		= mipi_dbi_debugfs_init,
> +	.name			= "ili9486",
> +	.desc			= "Ilitek ILI9486",
> +	.date			= "20200118",
> +	.major			= 1,
> +	.minor			= 0,
> +};
> +
> +static const struct of_device_id ili9486_of_match[] = {
> +	{ .compatible = "waveshare,rpi-lcd-35" },
> +	{ .compatible = "ozzmaker,piscreen" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ili9486_of_match);
> +
> +static const struct spi_device_id ili9486_id[] = {
> +	{ "ili9486", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, ili9486_id);
> +
> +static int ili9486_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct mipi_dbi_dev *dbidev;
> +	struct drm_device *drm;
> +	struct mipi_dbi *dbi;
> +	struct gpio_desc *dc;
> +	u32 rotation = 0;
> +	int ret;
> +
> +	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
> +	if (!dbidev)
> +		return -ENOMEM;
> +
> +	dbi = &dbidev->dbi;
> +	drm = &dbidev->drm;
> +	ret = devm_drm_dev_init(dev, drm, &ili9486_driver);
> +	if (ret) {
> +		kfree(dbidev);
> +		return ret;
> +	}
> +
> +	drm_mode_config_init(drm);
> +
> +	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(dbi->reset)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> +		return PTR_ERR(dbi->reset);
> +	}
> +
> +	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);

I don't think DC is optional on these displays?

> +	if (IS_ERR(dc)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
> +		return PTR_ERR(dc);
> +	}
> +
> +	dbidev->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(dbidev->backlight))
> +		return PTR_ERR(dbidev->backlight);
> +
> +	device_property_read_u32(dev, "rotation", &rotation);
> +
> +	ret = mipi_dbi_spi_init(spi, dbi, dc);
> +	if (ret)
> +		return ret;
> +
> +	ret = mipi_dbi_dev_init(dbidev, &ili9486_pipe_funcs, &ili9486_mode, rotation);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	dbi->command = ili9486_command;
> +	dbi->read_commands = NULL;

You can't change these after the device has been registered, put the
assignements between mipi_dbi_spi_init and mipi_dbi_dev_init.

Noralf.

> +
> +	spi_set_drvdata(spi, drm);
> +
> +	drm_fbdev_generic_setup(drm, 0);
> +
> +	return 0;
> +}
> +
> +static int ili9486_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm = spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +
> +	return 0;
> +}
> +
> +static void ili9486_shutdown(struct spi_device *spi)
> +{
> +	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> +}
> +
> +static struct spi_driver ili9486_spi_driver = {
> +	.driver = {
> +		.name = "ili9486",
> +		.of_match_table = ili9486_of_match,
> +	},
> +	.id_table = ili9486_id,
> +	.probe = ili9486_probe,
> +	.remove = ili9486_remove,
> +	.shutdown = ili9486_shutdown,
> +};
> +module_spi_driver(ili9486_spi_driver);
> +
> +MODULE_DESCRIPTION("Ilitek ILI9486 DRM driver");
> +MODULE_AUTHOR("Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>");
> +MODULE_LICENSE("GPL");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
