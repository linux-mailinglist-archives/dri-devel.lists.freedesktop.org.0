Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DC65C7D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 21:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55210E4D2;
	Tue,  3 Jan 2023 20:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8010E4D9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=w5Zo8g3TaYgtcTCgy3oZXz9/r6oEXx/FaThzGWxOlgQ=;
 b=QF69kclAMJ1WiSsVmXgspI+wlsnU1t5wU03xvDraQsT68u08anwbPpNJIn/TflWrKk2F+ONiHpzGM
 MX3JjayNIqj5eOUlBv66xgI3DBgKDmsNGcW6bwmy+pJ+v7niPJR0EvWAogkn5hcfU3hbddwbZOj4vx
 jm00BoJwXtI+/24vTjoNHC34xV2mJtEMsiVBWA84nAxrCDsFwA6nb9fbaM5RqKMsd2tDjijaDIf8X5
 R9noZ5HBCHQTQJ/cLbA7rNjRFT6qYvHH8+Mj/2+mpnaeQXmzSFiJ0bqX2P1fePrrhSbAGjXwZFh8HE
 Yb7WEmng4fXdoz/1YH5V82TTcfmAz/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=w5Zo8g3TaYgtcTCgy3oZXz9/r6oEXx/FaThzGWxOlgQ=;
 b=sbKGLxlBEXYMWohDM8FaIG2hTwP7YZamH7LZXuMzh/8Q6ed7kYQM7W2fjeo38rD5YlasF6hANxnXf
 J6z4YNQAQ==
X-HalOne-ID: b45856cc-8ba1-11ed-b3cd-93f0a866dfbb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id b45856cc-8ba1-11ed-b3cd-93f0a866dfbb;
 Tue, 03 Jan 2023 20:03:38 +0000 (UTC)
Date: Tue, 3 Jan 2023 21:03:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V7 3/4] drm/panel: Add Magnachip D53E6EA8966 Panel Driver
Message-ID: <Y7SKGFKHY2SKnsdW@ravnborg.org>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
 <20230103190707.104595-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103190707.104595-4-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris.

On Tue, Jan 03, 2023 at 01:07:06PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Support Magnachip D53E6EA8966 based panels such as the Samsung
> AMS495QA01 panel as found on the Anbernic RG503. Note this driver
> supports only the AMS495QA01 today which receives video signals via DSI,
> however it receives commands via 3-wire SPI using DBI.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for being late with my feedback - I have not had any linux
bandwidth lately.

See a few comments in the following.
Mostly, I am concerned that backlight does not work in an optimal way.

	Sam

> ---
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-magnachip-d53e6ea8966.c   | 514 ++++++++++++++++++
>  3 files changed, 526 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 737edcdf9eef..204b84a83604 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -298,6 +298,17 @@ config DRM_PANEL_LG_LG4573
>  	  Say Y here if you want to enable support for LG4573 RGB panel.
>  	  To compile this driver as a module, choose M here.
>  
> +config DRM_PANEL_MAGNACHIP_D53E6EA8966
> +	tristate "Magnachip D53E6EA8966 DSI panel"
> +	depends on OF && SPI
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DBI
> +	help
> +	  DRM panel driver for the Samsung AMS495QA01 panel controlled
> +	  with the Magnachip D53E6EA8966 panel IC. This panel receives
> +	  video data via DSI but commands via 9-bit SPI using DBI.
> +
>  config DRM_PANEL_NEC_NL8048HL11
>  	tristate "NEC NL8048HL11 RGB panel"
>  	depends on GPIOLIB && OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f8f9d9f6a307..20de312aa5e9 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> +obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
> diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> new file mode 100644
> index 000000000000..ec90da8e2ae7
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> @@ -0,0 +1,514 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Magnachip d53e6ea8966 MIPI-DSI panel driver
> + * Copyright (C) 2022 Chris Morgan
2023

> + */
> +
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +
> +/* Forward declaration for use in backlight function */
> +struct d53e6ea8966;
> +
> +/* Panel info, unique to each panel */
> +struct d53e6ea8966_panel_info {
> +	/** @display_modes: the supported display modes */
> +	const struct drm_display_mode *display_modes;
> +	/** @num_modes: the number of supported display modes */
> +	unsigned int num_modes;
> +	/** @width_mm: panel width in mm */
> +	u16 width_mm;
> +	/** @height_mm: panel height in mm */
> +	u16 height_mm;
> +	/** @bus_flags: drm bus flags for panel */
> +	u32 bus_flags;
> +	/** @panel_funcs: panel functions for panel */
> +	const struct drm_panel_funcs *panel_funcs;
I can see that the prepare function is panel specific, the rest looks
like they are controller specific.
I suggest to refactor out the panel specifics in the prepare function,
and have this as the only function pointer.
The other operations in drm_panel_funcs are all controller specific and
there should be no need to set them depending on the panel.


> +	/** @backlight: panel backlight registration or NULL */
> +	int (*backlight_register)(struct d53e6ea8966 *db);
> +};
> +
> +struct d53e6ea8966 {
> +	/** @dev: the container device */
> +	struct device *dev;
> +	/** @dbi: the DBI bus abstraction handle */
> +	struct mipi_dbi dbi;
> +	/** @panel: the DRM panel instance for this device */
> +	struct drm_panel panel;
> +	/** @reset: reset GPIO line */
> +	struct gpio_desc *reset;
> +	/** @enable: enable GPIO line */
> +	struct gpio_desc *enable;
> +	/** @reg_vdd: VDD supply regulator for panel logic */
> +	struct regulator *reg_vdd;
> +	/** @reg_elvdd: ELVDD supply regulator for panel display */
> +	struct regulator *reg_elvdd;
> +	/** @dsi_dev: DSI child device (panel) */
> +	struct mipi_dsi_device *dsi_dev;
> +	/** @bl_dev: pseudo-backlight device for oled panel */
> +	struct backlight_device *bl_dev;
> +	/** @panel_info: struct containing panel timing and info */
> +	const struct d53e6ea8966_panel_info *panel_info;
> +};
> +
> +#define NUM_GAMMA_LEVELS	16
> +#define GAMMA_TABLE_COUNT	23
> +#define MAX_BRIGHTNESS		(NUM_GAMMA_LEVELS - 1)
> +
> +#define MCS_ELVSS_ON			0xb1
> +#define MCS_TEMP_SWIRE			0xb2
> +#define MCS_PASSWORD_0			0xf0
> +#define MCS_PASSWORD_1			0xf1
> +#define MCS_ANALOG_PWR_CTL_0		0xf4
> +#define MCS_ANALOG_PWR_CTL_1		0xf5
> +#define MCS_GTCON_SET			0xf7
> +#define MCS_GATELESS_SIGNAL_SET		0xf8
> +#define MCS_SET_GAMMA			0xf9
> +
> +static inline struct d53e6ea8966 *to_d53e6ea8966(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct d53e6ea8966, panel);
> +}
> +
> +/* Table of gamma values provided in datasheet */
> +static u8 ams495qa01_gamma[NUM_GAMMA_LEVELS][GAMMA_TABLE_COUNT] = {
> +	{0x01, 0x79, 0x78, 0x8d, 0xd9, 0xdf, 0xd5, 0xcb, 0xcf, 0xc5,
> +	 0xe5, 0xe0, 0xe4, 0xdc, 0xb8, 0xd4, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x7d, 0x7c, 0x92, 0xd7, 0xdd, 0xd2, 0xcb, 0xd0, 0xc6,
> +	 0xe5, 0xe1, 0xe3, 0xda, 0xbd, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x7f, 0x7e, 0x95, 0xd7, 0xde, 0xd2, 0xcb, 0xcf, 0xc5,
> +	 0xe5, 0xe3, 0xe3, 0xda, 0xbf, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x82, 0x81, 0x99, 0xd6, 0xdd, 0xd1, 0xca, 0xcf, 0xc3,
> +	 0xe4, 0xe3, 0xe3, 0xda, 0xc2, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x84, 0x83, 0x9b, 0xd7, 0xde, 0xd2, 0xc8, 0xce, 0xc2,
> +	 0xe4, 0xe3, 0xe2, 0xd9, 0xc3, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x87, 0x86, 0x9f, 0xd6, 0xdd, 0xd1, 0xc7, 0xce, 0xc1,
> +	 0xe4, 0xe3, 0xe2, 0xd9, 0xc6, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x89, 0x89, 0xa2, 0xd5, 0xdb, 0xcf, 0xc8, 0xcf, 0xc2,
> +	 0xe3, 0xe3, 0xe1, 0xd9, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x8b, 0x8b, 0xa5, 0xd5, 0xdb, 0xcf, 0xc7, 0xce, 0xc0,
> +	 0xe3, 0xe3, 0xe1, 0xd8, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x8d, 0x8d, 0xa7, 0xd5, 0xdb, 0xcf, 0xc6, 0xce, 0xc0,
> +	 0xe4, 0xe4, 0xe1, 0xd7, 0xc8, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x8f, 0x8f, 0xaa, 0xd4, 0xdb, 0xce, 0xc6, 0xcd, 0xbf,
> +	 0xe3, 0xe3, 0xe1, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x91, 0x91, 0xac, 0xd3, 0xda, 0xce, 0xc5, 0xcd, 0xbe,
> +	 0xe3, 0xe3, 0xe0, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x93, 0x93, 0xaf, 0xd3, 0xda, 0xcd, 0xc5, 0xcd, 0xbe,
> +	 0xe2, 0xe3, 0xdf, 0xd6, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x95, 0x95, 0xb1, 0xd2, 0xd9, 0xcc, 0xc4, 0xcd, 0xbe,
> +	 0xe2, 0xe3, 0xdf, 0xd7, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x99, 0x99, 0xb6, 0xd1, 0xd9, 0xcc, 0xc3, 0xcb, 0xbc,
> +	 0xe2, 0xe4, 0xdf, 0xd6, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x9c, 0x9c, 0xba, 0xd0, 0xd8, 0xcb, 0xc3, 0xcb, 0xbb,
> +	 0xe2, 0xe4, 0xdf, 0xd6, 0xce, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +	{0x01, 0x9f, 0x9f, 0xbe, 0xcf, 0xd7, 0xc9, 0xc2, 0xcb, 0xbb,
> +	 0xe1, 0xe3, 0xde, 0xd6, 0xd0, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> +	 0x00, 0x2f},
> +};
> +
> +/*
> + * Table of elvss values provided in datasheet and corresponds to
> + * gamma values.
> + */
> +static u8 ams495qa01_elvss[NUM_GAMMA_LEVELS] = {
> +	0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
> +	0x15, 0x15, 0x14, 0x14, 0x13, 0x12,
> +};
> +
> +static int ams495qa01_update_gamma(struct mipi_dbi *dbi, u32 brightness)
> +{
brightness is an int value in backlight.h - so try to use int for it
everywhere.

> +	u32 tmp = brightness;
> +
> +	mipi_dbi_command_buf(dbi, MCS_SET_GAMMA, ams495qa01_gamma[tmp],
> +			     ARRAY_SIZE(ams495qa01_gamma[tmp]));
> +	mipi_dbi_command(dbi, MCS_SET_GAMMA, 0x00);
> +
> +	/* Undocumented command */
> +	mipi_dbi_command(dbi, 0x26, 0x00);
> +
> +	mipi_dbi_command(dbi, MCS_TEMP_SWIRE, ams495qa01_elvss[tmp]);
> +
> +	return 0;
> +}
> +
> +static int ams495qa01_prepare(struct drm_panel *panel)
This looks like a panel specific function, so naming is OK.
But consider to split it up in something that is controller and panel
specific. We do not want too much duplicated if we add an extra panel.

> +{
> +	struct d53e6ea8966 *db = to_d53e6ea8966(panel);
> +	struct mipi_dbi *dbi = &db->dbi;
> +	int ret;
> +
> +	/* Power up */
> +	ret = regulator_enable(db->reg_vdd);
> +	if (ret) {
> +		dev_err(db->dev, "failed to enable vdd regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (db->reg_elvdd) {
> +		ret = regulator_enable(db->reg_elvdd);
> +		if (ret) {
> +			dev_err(db->dev,
> +				"failed to enable elvdd regulator: %d\n", ret);
> +			regulator_disable(db->reg_vdd);
> +			return ret;
> +		}
> +	}
> +
> +	/* Enable */
> +	if (db->enable)
> +		gpiod_set_value_cansleep(db->enable, 1);
> +
> +	msleep(50);
> +
> +	/* Reset */
> +	gpiod_set_value_cansleep(db->reset, 1);
> +	usleep_range(1000, 5000);
> +	gpiod_set_value_cansleep(db->reset, 0);
> +	msleep(20);
> +
> +	/* Panel Init Sequence */
> +
> +	mipi_dbi_command(dbi, MCS_PASSWORD_0, 0x5a, 0x5a);
> +	mipi_dbi_command(dbi, MCS_PASSWORD_1, 0x5a, 0x5a);
> +	/* Undocumented commands */
> +	mipi_dbi_command(dbi, 0xb0, 0x02);
> +	mipi_dbi_command(dbi, 0xf3, 0x3b);
> +
> +	mipi_dbi_command(dbi, MCS_ANALOG_PWR_CTL_0, 0x33, 0x42, 0x00, 0x08);
> +	mipi_dbi_command(dbi, MCS_ANALOG_PWR_CTL_1, 0x00, 0x06, 0x26, 0x35, 0x03);
> +
> +	/* Undocumented commands */
> +	mipi_dbi_command(dbi, 0xf6, 0x02);
> +	mipi_dbi_command(dbi, 0xc6, 0x0b, 0x00, 0x00, 0x3c, 0x00, 0x22,
> +			 0x00, 0x00, 0x00, 0x00);
> +
> +	mipi_dbi_command(dbi, MCS_GTCON_SET, 0x20);
> +	mipi_dbi_command(dbi, MCS_TEMP_SWIRE, 0x06, 0x06, 0x06, 0x06);
> +	mipi_dbi_command(dbi, MCS_ELVSS_ON, 0x07, 0x00, 0x10);
> +	mipi_dbi_command(dbi, MCS_GATELESS_SIGNAL_SET, 0x7f, 0x7a,
> +			 0x89, 0x67, 0x26, 0x38, 0x00, 0x00, 0x09,
> +			 0x67, 0x70, 0x88, 0x7a, 0x76, 0x05, 0x09,
> +			 0x23, 0x23, 0x23);
> +
> +	/* Undocumented commands */
> +	mipi_dbi_command(dbi, 0xb5, 0xff, 0xef, 0x35, 0x42, 0x0d, 0xd7,
> +			 0xff, 0x07, 0xff, 0xff, 0xfd, 0x00, 0x01,
> +			 0xff, 0x05, 0x12, 0x0f, 0xff, 0xff, 0xff,
> +			 0xff);
> +	mipi_dbi_command(dbi, 0xb4, 0x15);
> +	mipi_dbi_command(dbi, 0xb3, 0x00);
> +
> +	ams495qa01_update_gamma(dbi, MAX_BRIGHTNESS);
> +
> +	return 0;
> +}
> +
> +static int ams495qa01_enable(struct drm_panel *panel)
Controller specific, so adjust naming.

> +{
> +	struct d53e6ea8966 *db = to_d53e6ea8966(panel);
> +	struct mipi_dbi *dbi = &db->dbi;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(200);
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> +	usleep_range(10000, 15000);
> +
> +	return 0;
> +}
> +
> +static int ams495qa01_disable(struct drm_panel *panel)
Controller specific, so adjust naming.

> +{
> +	struct d53e6ea8966 *db = to_d53e6ea8966(panel);
> +	struct mipi_dbi *dbi = &db->dbi;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> +	msleep(20);
> +	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static int ams495qa01_unprepare(struct drm_panel *panel)
Controller specific, so adjust naming.

> +{
> +	struct d53e6ea8966 *db = to_d53e6ea8966(panel);
> +
> +	if (db->enable)
> +		gpiod_set_value_cansleep(db->enable, 0);
> +
> +	gpiod_set_value_cansleep(db->reset, 1);
> +
> +	if (db->reg_elvdd)
> +		regulator_disable(db->reg_elvdd);
> +
> +	regulator_disable(db->reg_vdd);
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static int ams495qa01_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
Controller specific, so adjust naming.

> +{
> +	struct d53e6ea8966 *db = to_d53e6ea8966(panel);
> +	const struct d53e6ea8966_panel_info *panel_info = db->panel_info;
> +	struct drm_display_mode *mode;
> +	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	unsigned int i;
> +
> +	for (i = 0; i < panel_info->num_modes; i++) {
> +		mode = drm_mode_duplicate(connector->dev,
> +					  &panel_info->display_modes[i]);
> +		if (!mode)
> +			return -ENOMEM;
> +
> +		drm_mode_set_name(mode);
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	connector->display_info.bpc = 8;
> +	connector->display_info.width_mm = panel_info->width_mm;
> +	connector->display_info.height_mm = panel_info->height_mm;
> +	connector->display_info.bus_flags = panel_info->bus_flags;
> +
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &bus_format, 1);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs ams495qa01_panel_funcs = {
> +	.disable = ams495qa01_disable,
> +	.enable = ams495qa01_enable,
> +	.get_modes = ams495qa01_get_modes,
> +	.prepare = ams495qa01_prepare,
> +	.unprepare = ams495qa01_unprepare,
> +};
This could be made more general, as most of the functions are
controller specific.

> +
> +static int ams495qa01_set_brightness(struct backlight_device *bd)
> +{
> +	struct d53e6ea8966 *db = bl_get_data(bd);
> +	struct mipi_dbi *dbi = &db->dbi;
> +	int brightness = bd->props.brightness;
Use backlight_get_brightness() here.
And use int, as this is the return type of the function.
> +
> +	ams495qa01_update_gamma(dbi, brightness);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops ams495qa01_backlight_ops = {
> +	.update_status	= ams495qa01_set_brightness,
> +};
> +
> +static int ams495qa01_backlight_register(struct d53e6ea8966 *db)
> +{
> +	struct backlight_properties props = {
> +		.type		= BACKLIGHT_RAW,
> +		.brightness	= MAX_BRIGHTNESS,
> +		.max_brightness = MAX_BRIGHTNESS,
> +	};
> +	struct device *dev = db->dev;
> +	int ret = 0;
> +
> +	db->bl_dev = devm_backlight_device_register(dev, "panel", dev, db,
> +						     &ams495qa01_backlight_ops,
> +						     &props);
> +	if (IS_ERR(db->bl_dev)) {
> +		ret = PTR_ERR(db->bl_dev);
> +		dev_err(dev, "error registering backlight device (%d)\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int d53e6ea8966_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct mipi_dsi_host *dsi_host;
> +	struct d53e6ea8966 *db;
> +	int ret;
> +	struct mipi_dsi_device_info info = {
> +		.type = "d53e6ea8966",
> +		.channel = 0,
> +		.node = NULL,
> +	};
> +
> +	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
> +	if (!db)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, db);
> +
> +	db->dev = dev;
> +
> +	db->panel_info = of_device_get_match_data(dev);
> +	if (!db->panel_info)
> +		return -EINVAL;
> +
> +	db->reg_vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(db->reg_vdd))
> +		return dev_err_probe(dev, PTR_ERR(db->reg_vdd),
> +				     "Failed to get vdd supply\n");
> +
> +	db->reg_elvdd = devm_regulator_get_optional(dev, "elvdd");
> +	if (IS_ERR(db->reg_elvdd))
> +		db->reg_elvdd = NULL;
> +
> +	db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(db->reset)) {
> +		ret = PTR_ERR(db->reset);
> +		return dev_err_probe(dev, ret, "no RESET GPIO\n");
> +	}
> +
> +	db->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(db->enable)) {
> +		ret = PTR_ERR(db->enable);
> +		return dev_err_probe(dev, ret, "cannot get ENABLE GPIO\n");
> +	}
> +
> +	ret = mipi_dbi_spi_init(spi, &db->dbi, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +
> +	ret = drm_of_get_dsi_bus(dev, &dsi_host, &info);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Error attaching DSI bus\n");
> +
> +	db->dsi_dev = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);
> +	if (IS_ERR(db->dsi_dev)) {
> +		dev_err(dev, "failed to register dsi device: %ld\n",
> +			PTR_ERR(db->dsi_dev));
> +		ret = PTR_ERR(db->dsi_dev);
> +	}
> +
> +	db->dsi_dev->lanes = 2;
> +	db->dsi_dev->format = MIPI_DSI_FMT_RGB888;
> +	db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	drm_panel_init(&db->panel, dev, db->panel_info->panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	if (db->panel_info->backlight_register != NULL) {
> +		ret = db->panel_info->backlight_register(db);
> +		if (ret < 0)
> +			return ret;
> +	}
Here I expected to see a
	db->panel->backlight = db->bl_dev; - or something.
	This is required to let the drm_panel code call
	backlight_enable(), backlight_disable().


> +
> +	drm_panel_add(&db->panel);
> +
> +	ret = devm_mipi_dsi_attach(dev, db->dsi_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
> +		drm_panel_remove(&db->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void d53e6ea8966_remove(struct spi_device *spi)
> +{
> +	struct d53e6ea8966 *db = spi_get_drvdata(spi);
> +
> +	drm_panel_remove(&db->panel);
> +}
> +
> +static const struct drm_display_mode ams495qa01_modes[] = {
> +	{ /* 60hz */
> +		.clock = 33500,
> +		.hdisplay = 960,
> +		.hsync_start = 960 + 10,
> +		.hsync_end = 960 + 10 + 2,
> +		.htotal = 960 + 10 + 2 + 10,
> +		.vdisplay = 544,
> +		.vsync_start = 544 + 10,
> +		.vsync_end = 544 + 10 + 2,
> +		.vtotal = 544 + 10 + 2 + 10,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +		},
> +	{ /* 50hz */
> +		.clock = 27800,
> +		.hdisplay = 960,
> +		.hsync_start = 960 + 10,
> +		.hsync_end = 960 + 10 + 2,
> +		.htotal = 960 + 10 + 2 + 10,
> +		.vdisplay = 544,
> +		.vsync_start = 544 + 10,
> +		.vsync_end = 544 + 10 + 2,
> +		.vtotal = 544 + 10 + 2 + 10,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.type = DRM_MODE_TYPE_DRIVER,
> +	},
> +};
> +
> +static const struct d53e6ea8966_panel_info ams495qa01_info = {
> +	.display_modes = ams495qa01_modes,
> +	.num_modes = ARRAY_SIZE(ams495qa01_modes),
> +	.width_mm = 117,
> +	.height_mm = 74,
> +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.panel_funcs = &ams495qa01_panel_funcs,
> +	.backlight_register = ams495qa01_backlight_register,
> +};
> +
> +static const struct of_device_id d53e6ea8966_match[] = {
> +	{ .compatible = "samsung,ams495qa01", .data = &ams495qa01_info },
> +	{},
Here we often write { /* sentinel */ },

> +};
> +MODULE_DEVICE_TABLE(of, d53e6ea8966_match);
> +
> +static const struct spi_device_id d53e6ea8966_ids[] = {
> +	{ "ams495qa01", 0 },
> +	{},
Here we often write { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(spi, d53e6ea8966_ids);
> +
> +static struct spi_driver d53e6ea8966_driver = {
> +	.driver		= {
> +		.name	= "d53e6ea8966-panel",
> +		.of_match_table = d53e6ea8966_match,
> +	},
> +	.id_table	= d53e6ea8966_ids,
> +	.probe		= d53e6ea8966_probe,
> +	.remove		= d53e6ea8966_remove,
> +};
> +module_spi_driver(d53e6ea8966_driver);
> +
> +MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
> +MODULE_DESCRIPTION("Magnachip d53e6ea8966 panel driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
