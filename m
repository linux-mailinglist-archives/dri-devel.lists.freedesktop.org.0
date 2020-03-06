Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638517C552
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 19:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05D46E44A;
	Fri,  6 Mar 2020 18:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0104A6EBC1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 18:23:18 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i13so1505718pfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=44PG1bYEGaFCj7THr4F0ZjhE7QAfJ0hXnxjBIr00KfM=;
 b=by/45/SCHs0YbsDY9OV5TYWdxu8JGIz+fubFVMggvBKB7TymlB+dvgRPY6nAR687JW
 9HN8ckHtJtDM9m/ei+KSwgp8yCzd64UpRP1LhMKabpG05hLYFPJ4Ri8m2Ue0xpY5moyR
 NiwMeZerQ4YeNwKYFEq4+30YwPQnddAWW3HLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=44PG1bYEGaFCj7THr4F0ZjhE7QAfJ0hXnxjBIr00KfM=;
 b=AkYt8dUStTkCpLeansCYs8LzyWUJ57ljP+0wolf2QzGXIaE57UoEKwfGi6ZqPMO6U1
 1mive2hZd104fK2kgBUaK4Ik/22DSAZ7jT5XkjFf0ybgkAynVvzVnY9McbhKsF99LoZv
 3+YJ2cVoOQCOKOc+7ejqEyqOy8Gm0qBoih3KgkkWnEKUWnFIj2i1o8em72alaLjs9l5K
 FmDuHbvYS+L+Kecw5j6rj0+uJijCHqBKjQUhIaehppcq+fJdsMyln7jM/YYzz4fOLZWA
 co5Jl8GQnoNudr7lIuyGSZ8EL2L7tlmhmPFY7IVWr9s93O665mrwP8eImf0HrdlQba40
 oakQ==
X-Gm-Message-State: ANhLgQ2AT7FtGhQV7aO+Non4+sE28O7Lkf2wB8AjBaWhO+cLr6OXPCej
 3oZqUzwqxZBSVQOxrb21Cmk3UQ==
X-Google-Smtp-Source: ADFU+vsux5P/Cbqz3h1NLmhvth9Dl9JbIb2Z68tegMHcJlDiGiJVWbhl2y3h9Uq+Iym0hSXfr6TDpg==
X-Received: by 2002:a63:180c:: with SMTP id y12mr4685461pgl.120.1583518998432; 
 Fri, 06 Mar 2020 10:23:18 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id b2sm10004866pjc.40.2020.03.06.10.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 10:23:17 -0800 (PST)
Date: Fri, 6 Mar 2020 10:23:15 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v4 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200306182315.GV24720@google.com>
References: <20200306103628.8998-1-harigovi@codeaurora.org>
 <20200306103628.8998-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306103628.8998-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 06, 2020 at 04:06:28PM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Dropping redundant space in Kconfig(Sam Ravnborg).
> 	- Changing structure for include files(Sam Ravnborg).
> 	- Removing backlight related code and functions(Sam Ravnborg).
> 	- Removing repeated printing of error message(Sam Ravnborg).
> 	- Adding drm_connector as an argument for get_modes function.
> Changes in v3:
> 	- Adding arguments for drm_panel_init to support against mainline.
> Changes in v4:
> 	- Removing error messages from regulator_set_load.
> 	- Removing dev struct entry.
> 	- Removing checks.
> 	- Dropping empty comment lines.
> 
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 322 ++++++++++++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ae44ac2ec106..7b696f304a99 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -389,6 +389,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>  	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>  	  Video Mode panel
>  
> +config DRM_PANEL_VISIONOX_RM69299
> +	tristate "Visionox RM69299"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for Visionox
> +	  RM69299  DSI Video Mode panel.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>  	tristate "Xinpeng XPP055C272 panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7c4d3c581fd4..9f11d067a6b2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -41,4 +41,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..eb15dca15398
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct rm69299_config {
> +	unsigned long width_mm;
> +	unsigned long height_mm;
> +	const char *panel_name;
> +	u32 num_on_cmds;

not used, remove

> +	const struct drm_display_mode *dm;
> +};
> +
> +struct visionox_rm69299 {
> +	struct drm_panel panel;
> +
> +	struct regulator_bulk_data supplies[2];
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	struct mipi_dsi_device *dsi;

nit: the use of blank lines in this struct seems a bit arbitrary,
just remove them?

> +	const struct rm69299_config *config;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_rm69299, panel);
> +}
> +
> +static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Reset sequence of visionox panel requires the panel to be
> +	 * out of reset for 10ms, followed by being held in reset
> +	 * for 10ms and then out again
> +	 */
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(10000, 20000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(10000, 20000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}
> +
> +static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static int visionox_rm69299_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	int ret;
> +
> +	ctx->dsi->mode_flags = 0;
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->panel.dev, "set_display_off cmd failed ret = %d\n", ret);
> +
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"enter_sleep cmd failed ret = %d\n", ret);
> +	}
> +
> +	ret = visionox_rm69299_power_off(ctx);
> +
> +	ctx->prepared = false;
> +	return ret;
> +}
> +
> +static int visionox_rm69299_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	int ret;
> +	const struct rm69299_config *config;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = visionox_35597_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	config = ctx->config;
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +		"cmd set tx 0 failed, ret = %d\n",
> +		ret);

The above lines should be indented, e.g. by adding a tab or aligning it
after the parenthesis of DRM_DEV_ERROR(). 'ret' shouldn't be in an
separate line unless the line would exceed 80 characters otherwise.

> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +		"cmd set tx 1 failed, ret = %d\n",
> +		ret);

fix indentation

> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +		"cmd set tx 2 failed, ret = %d\n",
> +		ret);

fix indentation

> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +		"cmd set tx 3 failed, ret = %d\n",
> +		ret);

fix indentation

> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"exit_sleep_mode cmd failed ret = %d\n",
> +			ret);

no separate line needed for 'ret'.

> +		goto power_off;
> +	}
> +
> +	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"set_display_on cmd failed ret = %d\n", ret);

make the others DRM_DEV_ERROR calls look like this :)

> +		goto power_off;
> +	}
> +
> +	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
> +	msleep(120);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +power_off:
> +	return visionox_rm69299_power_off(ctx);

I think you want to return 'ret' here, otherwise _prepare() appears to be
successful, unless _power_off() fails.

> +}
> +
> +static int visionox_rm69299_get_modes(struct drm_panel *panel,
> +				       struct drm_connector *connector)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct drm_display_mode *mode;
> +	const struct rm69299_config *config;
> +
> +	config = ctx->config;

nit: could be done in the declaration.

> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"failed to create a new display mode\n");
> +		return 0;
> +	}
> +
> +	connector->display_info.width_mm = config->width_mm;
> +	connector->display_info.height_mm = config->height_mm;
> +	drm_mode_copy(mode, config->dm);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
> +	.unprepare = visionox_rm69299_unprepare,
> +	.prepare = visionox_rm69299_prepare,
> +	.get_modes = visionox_rm69299_get_modes,
> +};
> +
> +static const struct drm_display_mode qcom_sc7180_mtp_1080p_mode = {

The QCOM SC7180 MTP is a board that uses this panel in a certain mode
(though in theory it could support multiple modes I guess). I don't
thihks the board should be references here. Instead the name could be
something like visionox_rm69299_1080x2248_60hz.

> +	.name = "1080x2248",
> +	.clock = 158695,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 26,
> +	.hsync_end = 1080 + 26 + 2,
> +	.htotal = 1080 + 26 + 2 + 36,
> +	.vdisplay = 2248,
> +	.vsync_start = 2248 + 56,
> +	.vsync_end = 2248 + 56 + 4,
> +	.vtotal = 2248 + 56 + 4 + 4,
> +	.vrefresh = 60,
> +	.flags = 0,
> +};
> +
> +static const struct rm69299_config rm69299_dir = {
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.panel_name = "qcom_sc7180_mtp_1080p_panel",

ditto, the fact that the MTP board uses this panel is irrelevant in this
driver. Actually 'panel_name' isn't used besides this assignment, just
remove it from the struct.

> +	.dm = &qcom_sc7180_mtp_1080p_mode,
> +};
> +
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +

nit: remove empty line between allocation and check?

> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +								ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +					PTR_ERR(ctx->reset_gpio));

The indentation looks a bit funny. Either use a tab wrt DRM_DEV_ERROR() or
align with 'dev'.

> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev,
> +			"dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret)
> +		return ret;

need to call mipi_dsi_detach() and drm_panel_remove(), add label below.

> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret)
> +		return ret;

ditto

> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}
> +
> +static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(ctx->dsi);
> +	mipi_dsi_device_unregister(ctx->dsi);
> +
> +	drm_panel_remove(&ctx->panel);
> +	return 0;
> +}
> +
> +static const struct of_device_id visionox_rm69299_of_match[] = {
> +	{
> +		.compatible = "visionox,rm69299-1080p-display",
> +		.data = &rm69299_dir,
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> +
> +static struct mipi_dsi_driver visionox_rm69299_driver = {
> +	.driver = {
> +		.name = "panel-visionox-rm69299",
> +		.of_match_table = visionox_rm69299_of_match,
> +	},
> +	.probe = visionox_rm69299_probe,
> +	.remove = visionox_rm69299_remove,
> +};
> +module_mipi_dsi_driver(visionox_rm69299_driver);
> +
> +MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");

nit: Visionox
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
