Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC40676BBE
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 10:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CE310E170;
	Sun, 22 Jan 2023 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A22710E170
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=d9F22B3vj5cHbv9BWUOtHZ6tLw2Kmub9+pOYWvGVcK0=;
 b=dxjQ32Djzu0WRdKfKPMddmxEErgcJsmHtL7V1PoS0Xb4CISRL17tQplycCIkktWvJUdt8UiT+HKmN
 UUSQDHL8VZ1jojy03PIu402ONTT3WOXEsBxtBNROSbxvvPpsqvJrTnHpzPP5Lx2Lpdi6oEenwTIu0W
 PhbxJzHkO/2FnWjSmR26PKezZl4mo+PdlUU2FIL9UGE1ZYTXnFbAi3t6iLn1368EHulyaUVDN8e5wh
 rJAVoU2vVOMDRvWO9Cxq0Alt+hflC0GOZJ/h0mWvX0GLkWfMgJilNQXh3MklG/kpFa3gpj7WDeNq2J
 AkLGlrF1V/1qmyOzmUBgTH37YIEur/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=d9F22B3vj5cHbv9BWUOtHZ6tLw2Kmub9+pOYWvGVcK0=;
 b=pg4rr2iR/ia/delonfKnHrKr1eg5yQ7XFSrFBu5nxoIAwj+DnxPjH6KyuiT7AFX+wsQHH1hte2NRy
 vWB/IJTDA==
X-HalOne-ID: 1b4a8f35-9a33-11ed-ba33-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 1b4a8f35-9a33-11ed-ba33-11abd97b9443;
 Sun, 22 Jan 2023 08:59:42 +0000 (UTC)
Date: Sun, 22 Jan 2023 09:59:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for the AUO A030JTN01 TFT LCD
Message-ID: <Y8z6/UaOdsDQI1zm@ravnborg.org>
References: <20230121162419.284523-1-cbranchereau@gmail.com>
 <20230121162419.284523-3-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230121162419.284523-3-cbranchereau@gmail.com>
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
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe/Paul.

On Sat, Jan 21, 2023 at 05:24:19PM +0100, Christophe Branchereau wrote:
> Add driver for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.

Two small nits about alphabetic ordering - that can be fixed while
applying. Otherwise it looks good.
I do not like the register names, but I guess this is the best we know.

With the sorting fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig               |   8 +
>  drivers/gpu/drm/panel/Makefile              |   1 +
>  drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 308 ++++++++++++++++++++
>  3 files changed, 317 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 737edcdf9eef..23cf0f4ba2e6 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -8,6 +8,14 @@ config DRM_PANEL
>  menu "Display Panels"
>  	depends on DRM && DRM_PANEL
>  
> +config DRM_PANEL_AUO_A030JTN01
> +	tristate "AUO A030JTN01"
> +	depends on SPI
> +	select REGMAP_SPI
> +	help
> +	  Say Y here to enable support for the AUO A030JTN01 320x480 3.0" panel
> +	  as found in the YLM RS-97 handheld gaming console.
> +
Can we have this added in alphabetic order?

>  config DRM_PANEL_ABT_Y030XX067A
>  	tristate "ABT Y030XX067A 320x480 LCD panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f8f9d9f6a307..af88658abcab 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
>  obj-$(CONFIG_DRM_PANEL_ABT_Y030XX067A) += panel-abt-y030xx067a.o
Same here, alphabetic order.
>  obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
>  obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
> diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> new file mode 100644
> index 000000000000..3c976a98de6a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AU Optronics A030JTN01.0 TFT LCD panel driver
> + *
> + * Copyright (C) 2023, Paul Cercueil <paul@crapouillou.net>
> + * Copyright (C) 2023, Christophe Branchereau <cbranchereau@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#define REG05			0x05
> +#define REG06			0x06
> +#define REG07			0x07
> +
> +#define REG05_STDBY		BIT(0)
> +#define REG06_VBLK		GENMASK(4, 0)
> +#define REG07_HBLK		GENMASK(7, 0)
> +
> +
> +struct a030jtn01_info {
> +	const struct drm_display_mode *display_modes;
> +	unsigned int num_modes;
> +	u16 width_mm, height_mm;
> +	u32 bus_format, bus_flags;
> +};
> +
> +struct a030jtn01 {
> +	struct drm_panel panel;
> +	struct spi_device *spi;
> +	struct regmap *map;
> +
> +	const struct a030jtn01_info *panel_info;
> +
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline struct a030jtn01 *to_a030jtn01(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct a030jtn01, panel);
> +}
> +
> +static int a030jtn01_prepare(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	struct device *dev = &priv->spi->dev;
> +	unsigned int dummy;
> +	int err;
> +
> +	err = regulator_enable(priv->supply);
> +	if (err) {
> +		dev_err(dev, "Failed to enable power supply: %d\n", err);
> +		return err;
> +	}
> +
> +	usleep_range(1000, 8000);
> +
> +	/* Reset the chip */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(100, 8000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(2000, 8000);
> +
> +	/*
> +	 * No idea why, but a register read (doesn't matter which) is needed to
> +	 * properly initialize the chip after a reset; otherwise, the colors
> +	 * will be wrong. It doesn't seem to be timing-related as a msleep(200)
> +	 * doesn't fix it.
> +	 */
> +	err = regmap_read(priv->map, REG05, &dummy);
> +	if (err)
> +		goto err_disable_regulator;
> +
> +	/* Use (24 + 6) == 0x1e as the vertical back porch */
> +	err = regmap_write(priv->map, REG06, FIELD_PREP(REG06_VBLK, 0x1e));
> +	if (err)
> +		goto err_disable_regulator;
> +
> +	/* Use (42 + 30) * 3 == 0xd8 as the horizontal back porch */
> +	err = regmap_write(priv->map, REG07, FIELD_PREP(REG07_HBLK, 0xd8));
> +	if (err)
> +		goto err_disable_regulator;
> +
> +	return 0;
> +
> +err_disable_regulator:
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	regulator_disable(priv->supply);
> +	return err;
> +}
> +
> +static int a030jtn01_unprepare(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	regulator_disable(priv->supply);
> +
> +	return 0;
> +}
> +
> +static int a030jtn01_enable(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	int ret;
> +
> +	ret = regmap_set_bits(priv->map, REG05, REG05_STDBY);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for the picture to be stable */
> +	if (panel->backlight)
> +		msleep(100);
> +
> +	return 0;
> +}
> +
> +static int a030jtn01_disable(struct drm_panel *panel)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +
> +	return regmap_clear_bits(priv->map, REG05, REG05_STDBY);
> +}
> +
> +static int a030jtn01_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	struct a030jtn01 *priv = to_a030jtn01(panel);
> +	const struct a030jtn01_info *panel_info = priv->panel_info;
> +	struct drm_display_mode *mode;
> +	unsigned int i;
> +
> +	for (i = 0; i < panel_info->num_modes; i++) {
> +		mode = drm_mode_duplicate(connector->dev,
> +					  &panel_info->display_modes[i]);
> +		if (!mode)
> +			return -ENOMEM;
> +
> +		drm_mode_set_name(mode);
> +
> +		mode->type = DRM_MODE_TYPE_DRIVER;
> +		if (panel_info->num_modes == 1)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> +
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	connector->display_info.bpc = 8;
> +	connector->display_info.width_mm = panel_info->width_mm;
> +	connector->display_info.height_mm = panel_info->height_mm;
> +
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &panel_info->bus_format, 1);
> +	connector->display_info.bus_flags = panel_info->bus_flags;
> +
> +	return panel_info->num_modes;
> +}
> +
> +static const struct drm_panel_funcs a030jtn01_funcs = {
> +	.prepare	= a030jtn01_prepare,
> +	.unprepare	= a030jtn01_unprepare,
> +	.enable		= a030jtn01_enable,
> +	.disable	= a030jtn01_disable,
> +	.get_modes	= a030jtn01_get_modes,
> +};
> +
> +static bool a030jtn01_has_reg(struct device *dev, unsigned int reg)
> +{
> +	static const u32 a030jtn01_regs_mask = 0x001823f1fb;
> +
> +	return a030jtn01_regs_mask & BIT(reg);
> +};
> +
> +static const struct regmap_config a030jtn01_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.read_flag_mask = 0x40,
> +	.max_register = 0x1c,
> +	.readable_reg = a030jtn01_has_reg,
> +	.writeable_reg = a030jtn01_has_reg,
> +};
> +
> +static int a030jtn01_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct a030jtn01 *priv;
> +	int err;
> +
> +	spi->mode |= SPI_MODE_3 | SPI_3WIRE;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->spi = spi;
> +	spi_set_drvdata(spi, priv);
> +
> +	priv->map = devm_regmap_init_spi(spi, &a030jtn01_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return dev_err_probe(dev, PTR_ERR(priv->map), "Unable to init regmap");
> +
> +	priv->panel_info = spi_get_device_match_data(spi);
> +	if (!priv->panel_info)
> +		return -EINVAL;
> +
> +	priv->supply = devm_regulator_get(dev, "power");
> +	if (IS_ERR(priv->supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->supply), "Failed to get power supply");
> +
> +	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio), "Failed to get reset GPIO");
> +
> +	drm_panel_init(&priv->panel, dev, &a030jtn01_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	err = drm_panel_of_backlight(&priv->panel);
> +	if (err)
> +		return err;
> +
> +	drm_panel_add(&priv->panel);
> +
> +	return 0;
> +}
> +
> +static void a030jtn01_remove(struct spi_device *spi)
> +{
> +	struct a030jtn01 *priv = spi_get_drvdata(spi);
> +
> +	drm_panel_remove(&priv->panel);
> +	drm_panel_disable(&priv->panel);
> +	drm_panel_unprepare(&priv->panel);
> +}
> +
> +static const struct drm_display_mode a030jtn01_modes[] = {
> +	{ /* 60 Hz */
> +		.clock = 14400,
> +		.hdisplay = 320,
> +		.hsync_start = 320 + 8,
> +		.hsync_end = 320 + 8 + 42,
> +		.htotal = 320 + 8 + 42 + 30,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 90,
> +		.vsync_end = 480 + 90 + 24,
> +		.vtotal = 480 + 90 + 24 + 6,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +	{ /* 50 Hz */
> +		.clock = 12000,
> +		.hdisplay = 320,
> +		.hsync_start = 320 + 8,
> +		.hsync_end = 320 + 8 + 42,
> +		.htotal = 320 + 8 + 42 + 30,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 90,
> +		.vsync_end = 480 + 90 + 24,
> +		.vtotal = 480 + 90 + 24 + 6,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
> +static const struct a030jtn01_info a030jtn01_info = {
> +	.display_modes = a030jtn01_modes,
> +	.num_modes = ARRAY_SIZE(a030jtn01_modes),
> +	.width_mm = 70,
> +	.height_mm = 51,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_3X8_DELTA,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
> +static const struct spi_device_id a030jtn01_id[] = {
> +	{ "a030jtn01", (kernel_ulong_t) &a030jtn01_info },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, a030jtn01_id);
> +
> +static const struct of_device_id a030jtn01_of_match[] = {
> +	{ .compatible = "auo,a030jtn01" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, a030jtn01_of_match);
> +
> +static struct spi_driver a030jtn01_driver = {
> +	.driver = {
> +		.name = "auo-a030jtn01",
> +		.of_match_table = a030jtn01_of_match,
> +	},
> +	.id_table = a030jtn01_id,
> +	.probe = a030jtn01_probe,
> +	.remove = a030jtn01_remove,
> +};
> +module_spi_driver(a030jtn01_driver);
> +
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.0
