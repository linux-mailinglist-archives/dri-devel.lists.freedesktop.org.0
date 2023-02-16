Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A86993BB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FE510ED4A;
	Thu, 16 Feb 2023 11:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE84610ED47
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:59:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id g14so1655958ljh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vvqw0ynKNBJ1B/7gMRz42PQuqt35d7PQJK1Fa8dyiE0=;
 b=Y7faBx9X8SvNGXjJmwdi2RvfhOCAmQro7zKvwGhYTWgq30P6jbUhqG2JVNe9ooJL/2
 zkn+kaxXLJgrWALH3zYUZYmA/6ngL2cF5W+dZy1SbrF6fkXfc6NM/+f4/L4a1kQyjvlL
 xR0cIrKunnRcYYVnxjeGdrB0IA/XJ7Y0P3nIJjm/L9o/ctx6bVA3nBVPcMkWlWY2B4Nj
 afaT8zWpOVvcr+hqFBni5T/FQAQuuq6LC5OJiH9YhM/BSBLXognvva/fzgXfe0dAXRL1
 UL4vvehFJgG5ESPOmmjgJP9wgI7IQFbLjAQSEMiRyl65haKhFjCJSSaCt3AWcGNxsLWq
 NUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vvqw0ynKNBJ1B/7gMRz42PQuqt35d7PQJK1Fa8dyiE0=;
 b=VndtEtJoCubTHZnt666M5gK30j+wd+PEPWpYjx8tgmHEV/ahv+LXfmAISk43fbbCHN
 Z3vHFje87gLoLcQwGFUsaQe2RsWchkV12qvQrQ3DJmc2Y9MdbcNP5gB6a97YYfXaX+z6
 VOH0JpyIIUUvLTWs5y1sYc8d0Zd86STxjH4PiJXOJVW9rP37anLZzJT3NhiwBTvTaAOh
 IHoHmEsACokyAYwFoDGNclB4LE0IZdHHPN6i4/B1ThyU3dkQHD0xXMk0ZcVWFOnWVWn6
 1dVyxhyoGHjZB9u7DTo/UwAHoQPSwMbfltdSkz13dVvvf47+oWK+OEaPz5r9fTsCwvLv
 qd+A==
X-Gm-Message-State: AO0yUKUX0sFEr/lVd2U5OMKUJ8o7E1uGV7/r0oq3x0TA4G+hZuNdhNVr
 3wDbUtzrhap34Lv36iaFAiZHRw==
X-Google-Smtp-Source: AK7set8ZJtcfdnEHGeC2Hga+PjJ0uPjPEewxARdJqHh/dzsd+8L0a93zcAKc8nfMphv20Cyp2LdE8Q==
X-Received: by 2002:a05:651c:b28:b0:293:5360:162b with SMTP id
 b40-20020a05651c0b2800b002935360162bmr776549ljr.11.1676548767970; 
 Thu, 16 Feb 2023 03:59:27 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a2e9d54000000b002934ebf2f6asm167560ljj.73.2023.02.16.03.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:59:27 -0800 (PST)
Message-ID: <725a5727-fdde-e3ae-a448-2679c5c4c7f4@linaro.org>
Date: Thu, 16 Feb 2023 12:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
 <20230119163201.580858-2-konrad.dybcio@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119163201.580858-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.01.2023 17:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> of smartphone manufacturing, it is impossible to retrieve a better name
> for this panel.
> 
> This revision adds support for the default 60 Hz configuration, however
> there could possibly be some room for expansion, as the display panels
> used on Sony devices have historically been capable of >2x refresh rate
> overclocking.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Are there any outstanding issues with this driver, or perhaps I did
not CC some important list? It has gotten very little activity ever
since its initial submission around Sept'22..

Konrad
> v3 -> v4:
> - De-magicize some numbers
> - Pick up rb
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 329 ++++++++++++++++++
>  3 files changed, 340 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d03a64155d15..8da741f1c2ba 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -677,6 +677,16 @@ config DRM_PANEL_SONY_ACX565AKM
>  	  Say Y here if you want to enable support for the Sony ACX565AKM
>  	  800x600 3.5" panel (found on the Nokia N900).
>  
> +config DRM_PANEL_SONY_TD4353_JDI
> +	tristate "Sony TD4353 JDI panel"
> +	depends on GPIOLIB && OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Sony Tama
> +	  TD4353 JDI command mode panel as found on some Sony Xperia
> +	  XZ2 and XZ2 Compact smartphones.
> +
>  config DRM_PANEL_SONY_TULIP_TRULY_NT35521
>  	tristate "Sony Tulip Truly NT35521 panel"
>  	depends on GPIOLIB && OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 1630dd0c69ae..22155d62bec0 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> +obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
>  obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
>  obj-$(CONFIG_DRM_PANEL_SONY_SYNAPTICS_JDI) += panel-sony-synaptics-jdi.o
>  obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
> diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> new file mode 100644
> index 000000000000..8d8813dbaa45
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@somainline.org>
> + *
> + * Generated with linux-mdss-dsi-panel-driver-generator with a
> + * substantial amount of manual adjustments.
> + *
> + * SONY Downstream kernel calls this one:
> + * - "JDI ID3" for Akari  (XZ2)
> + * - "JDI ID4" for Apollo (XZ2 Compact)
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +enum {
> +	TYPE_TAMA_60HZ,
> +	/*
> +	 * Leaving room for expansion - SONY very often uses
> +	 * *truly reliably* overclockable panels on their flagships!
> +	 */
> +};
> +
> +struct sony_td4353_jdi {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data supplies[3];
> +	struct gpio_desc *panel_reset_gpio;
> +	struct gpio_desc *touch_reset_gpio;
> +	bool prepared;
> +	int type;
> +};
> +
> +static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct sony_td4353_jdi, panel);
> +}
> +
> +static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set column address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2160 - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set page address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set tear on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +
> +	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set pixel format: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
> +			  0x00, 0x00, 0x08, 0x6f);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(70);
> +
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to turn display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(22);
> +
> +	ret = mipi_dsi_dcs_set_tear_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set tear off: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(80);
> +
> +	return 0;
> +}
> +
> +static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode)
> +{
> +	gpiod_set_value_cansleep(ctx->touch_reset_gpio, mode);
> +	gpiod_set_value_cansleep(ctx->panel_reset_gpio, mode);
> +	usleep_range(5000, 5100);
> +}
> +
> +static int sony_td4353_jdi_prepare(struct drm_panel *panel)
> +{
> +	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(100);
> +
> +	sony_td4353_assert_reset_gpios(ctx, 1);
> +
> +	ret = sony_td4353_jdi_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to power on panel: %d\n", ret);
> +		sony_td4353_assert_reset_gpios(ctx, 0);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int sony_td4353_jdi_unprepare(struct drm_panel *panel)
> +{
> +	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = sony_td4353_jdi_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to power off panel: %d\n", ret);
> +
> +	sony_td4353_assert_reset_gpios(ctx, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode sony_td4353_jdi_mode_tama_60hz = {
> +	.clock = (1080 + 4 + 8 + 8) * (2160 + 259 + 8 + 8) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 4,
> +	.hsync_end = 1080 + 4 + 8,
> +	.htotal = 1080 + 4 + 8 + 8,
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 259,
> +	.vsync_end = 2160 + 259 + 8,
> +	.vtotal = 2160 + 259 + 8 + 8,
> +	.width_mm = 64,
> +	.height_mm = 128,
> +};
> +
> +static int sony_td4353_jdi_get_modes(struct drm_panel *panel,
> +				   struct drm_connector *connector)
> +{
> +	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> +	struct drm_display_mode *mode = NULL;
> +
> +	if (ctx->type == TYPE_TAMA_60HZ)
> +		mode = drm_mode_duplicate(connector->dev, &sony_td4353_jdi_mode_tama_60hz);
> +	else
> +		return -EINVAL;
> +
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs sony_td4353_jdi_panel_funcs = {
> +	.prepare = sony_td4353_jdi_prepare,
> +	.unprepare = sony_td4353_jdi_unprepare,
> +	.get_modes = sony_td4353_jdi_get_modes,
> +};
> +
> +static int sony_td4353_jdi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct sony_td4353_jdi *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->type = (uintptr_t)of_device_get_match_data(dev);
> +
> +	ctx->supplies[0].supply = "vddio";
> +	ctx->supplies[1].supply = "vsp";
> +	ctx->supplies[2].supply = "vsn";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->panel_reset_gpio = devm_gpiod_get(dev, "panel-reset", GPIOD_ASIS);
> +	if (IS_ERR(ctx->panel_reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel_reset_gpio),
> +				     "Failed to get panel-reset-gpios\n");
> +
> +	ctx->touch_reset_gpio = devm_gpiod_get(dev, "touch-reset", GPIOD_ASIS);
> +	if (IS_ERR(ctx->touch_reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->touch_reset_gpio),
> +				     "Failed to get touch-reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &sony_td4353_jdi_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void sony_td4353_jdi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct sony_td4353_jdi *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id sony_td4353_jdi_of_match[] = {
> +	{ .compatible = "sony,td4353-jdi-tama", .data = (void *)TYPE_TAMA_60HZ },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sony_td4353_jdi_of_match);
> +
> +static struct mipi_dsi_driver sony_td4353_jdi_driver = {
> +	.probe = sony_td4353_jdi_probe,
> +	.remove = sony_td4353_jdi_remove,
> +	.driver = {
> +		.name = "panel-sony-td4353-jdi",
> +		.of_match_table = sony_td4353_jdi_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(sony_td4353_jdi_driver);
> +
> +MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@somainline.org>");
> +MODULE_DESCRIPTION("DRM panel driver for SONY Xperia XZ2/XZ2c JDI panel");
> +MODULE_LICENSE("GPL");
