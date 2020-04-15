Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8EB1AB0EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 21:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAB26EA7F;
	Wed, 15 Apr 2020 19:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922B86EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:08:52 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id w65so422422pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sB3n1RByeKEWnzG3o88MvqVGBp2XG9gn6A5/Qzyf4Bg=;
 b=LYzKEsX0Gj4dtA+4OQnde9Jmq74FPr4ch+6TeFO78WyN08bsqN6u+T1A5JUBMpZivA
 bof0PM9HQVEb9y2euXcu2nEsMFAD4o24/15YjXITRTAtgJRdleqAmDMKBcF9JWRIEClo
 U1Fh4sbKFdbSJlWgc4uKwzKnWorz1XOJrYxuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sB3n1RByeKEWnzG3o88MvqVGBp2XG9gn6A5/Qzyf4Bg=;
 b=PSuP1TdEta8lTWnt8Td1NNcDqCex0bjT9rfstXXYzjy0MeQ5xCPRJOYQ8VIbHZZJi0
 dtmyHqzfyMtuVduy40/laa+Fl0AIo+otCM+M0duJ5ica9PkkaEjGFqnY4vTg9kxiV4ot
 +WIY5fYfOIAuDvnmJ9oRgy9Miw7pXSdLiLZ+RXs00eL/39q+7yDUV/6OwA/R0jaKXO5d
 X6EMrOOfIDPqO+aq0ftb8IscxJiDEvubL3aw6yFqP9bPm+xVx5DNPhSRCZqeTNGBfgu3
 RO7z6ds5PAU8NkkHdiwQ+FMVX5w6N7jegIAFKUZPs8eatu58Rnk2E/WqW/RZJV0RVjvC
 L4Og==
X-Gm-Message-State: AGi0PuaZtF5unM0UG3l7XMvk8myspj1jn1jpLTiXLDVyDTQ9rsmcqu0n
 bXLGwCyVXuHt2QLyaJhbuSSl7g==
X-Google-Smtp-Source: APiQypLrcpgfZBL6VVB6KrhDkywAoDNkOTr8rzzmiZA78cKxB3xLXjiDjC8Vbx4OQIQdzOF36lY0ZA==
X-Received: by 2002:a62:7d91:: with SMTP id
 y139mr20054207pfc.172.1586977731997; 
 Wed, 15 Apr 2020 12:08:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w134sm14597898pfd.41.2020.04.15.12.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 12:08:50 -0700 (PDT)
Date: Wed, 15 Apr 2020 12:08:49 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v7 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200415190849.GY199755@google.com>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

checkpatch finds multiple errors with this patch, as Sam reported on
https://patchwork.kernel.org/cover/11461945/. Please fix those and
send a new version (not sure which version number this should be (v11?),
this series is a bit confusing in this aspect).

Please also double check if there is any outstanding feedback that still
needs to be addressed (not from my side AFAIK).

Thanks

Matthias

On Mon, Mar 16, 2020 at 09:46:47AM +0530, Harigovindan P wrote:
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
> Changes in v5:
> 	- Removing unused struct member variables.
> 	- Removing blank lines.
> 	- Fixed indentation.
> 	- Invoking dsi_detach and panel_remove while early exiting from probe.
> Changes in v6:
> 	- Changed "35597" to "rm69299" for power_on function.
> 	- Removing rm69299_config since it supports single type of panel for now.
> 	- Fixed alignment.
> 	- Using goto statements when regulator_set_load fails.
> Changes in v7:
> 	- Added new goto statement when regulator_set_load fails.
> 
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
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
> index 000000000000..0f877d21fdf2
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,295 @@
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
> +struct visionox_rm69299 {
> +	struct drm_panel panel;
> +	struct regulator_bulk_data supplies[2];
> +	struct gpio_desc *reset_gpio;
> +	struct mipi_dsi_device *dsi;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_rm69299, panel);
> +}
> +
> +static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
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
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"set_display_off cmd failed ret = %d\n", ret);
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
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = visionox_rm69299_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"cmd set tx 0 failed, ret = %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"cmd set tx 1 failed, ret = %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"cmd set tx 2 failed, ret = %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"cmd set tx 3 failed, ret = %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->panel.dev,
> +			"exit_sleep_mode cmd failed ret = %d\n", ret);
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
> +	return ret;
> +}
> +
> +static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> +        .name = "1080x2248",
> +        .clock = 158695,
> +        .hdisplay = 1080,
> +        .hsync_start = 1080 + 26,
> +        .hsync_end = 1080 + 26 + 2,
> +        .htotal = 1080 + 26 + 2 + 36,
> +        .vdisplay = 2248,
> +        .vsync_start = 2248 + 56,
> +        .vsync_end = 2248 + 56 + 4,
> +        .vtotal = 2248 + 56 + 4 + 4,
> +        .vrefresh = 60,
> +        .flags = 0,
> +};
> +
> +static int visionox_rm69299_get_modes(struct drm_panel *panel,
> +				       struct drm_connector *connector)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"failed to create a new display mode\n");
> +		return 0;
> +	}
> +
> +	connector->display_info.width_mm = 74;
> +	connector->display_info.height_mm = 131;
> +	drm_mode_copy(mode, &visionox_rm69299_1080x2248_60hz);
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
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
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
> +		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret) {
> +               DRM_DEV_ERROR(dev, "regulator set load failed for vdda supply ret = %d\n", ret);
> +		goto err_set_load;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +               DRM_DEV_ERROR(dev, "regulator set load failed for vdd3p3 supply ret = %d\n", ret);
> +		goto err_set_load;
> +	}
> +
> +	return 0;
> +
> +err_set_load:
> +	mipi_dsi_detach(dsi);
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
> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
