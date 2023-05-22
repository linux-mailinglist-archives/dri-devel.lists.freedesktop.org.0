Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19370B7B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A16410E0B9;
	Mon, 22 May 2023 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188BB10E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:35:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso57086875e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684744498; x=1687336498;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NeV5En8UNDI6ND9Cl0vdQV/hWPRmeF2Nr0L6XTGGovE=;
 b=j501JRhvGDeMw+S1dWL4iUZXNgekf22uw688RzL8gjdv8mdfquL3uuobvC4YUD6Q3p
 r8IBTOiOtxeIa9slNmCmHUIVrfpmCt5Vf0SgIJqeEYr2KnN9y/J/nphfr70LSGI/UvMS
 gWpn73OimTcpOc3roagdeK7v0KQ70SLVUTvYGQQsz2ckXmHIWVDIIgGr5YL8GsfIlvjs
 KYMplWCOPf6PwGBdcitXS3TdOEpRNceHAqVBc9nh2mjWShW92cuKTO5Fw9f8zrMdclhr
 KukdYexZQYp3OceDvFP9VzGZzTqfx51zdGgA5H5KVhRE8JttI8udy7x+DRCo9OImZecZ
 uiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684744498; x=1687336498;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NeV5En8UNDI6ND9Cl0vdQV/hWPRmeF2Nr0L6XTGGovE=;
 b=jP1FrHLGR6ahfo3KDd73ZBNhBP5p3IP3Ct5ztQcTdvpVHE2YwvMjCiTZzMAsLVo6qZ
 ZOmURY9iXBOMqf/nUtmj/fhPJv32vXzojjLOVziUsa2t2EG7CWlld+gnAVd7UuzQX4qK
 lZ+fm88JZf/Fkl1SJfajE/jhauEy0Ode07+9pZ/c7yHb8RyLmQhfNNL3wSaQhb5D/zxI
 OT+9sPOFm1NQOEBG8W1TvfOs/XBAs2TMit6wyt8UJmqiuwSux2nXWoF7MpKCx1Np5n2V
 +7JV/F2d76F5FhOTGQnTD4HA8CNBikrDkCo77cl0YEz/t/WCeXCyEEfjcJSvZQWXnBLa
 VDSA==
X-Gm-Message-State: AC+VfDw9W7Q7x/RncAXf66fiK6OtDi2f4vVneP7Nxr9EyWFs6tbZFp3R
 mGpp8gaKA9UOcphv/s3Glnc/2Q==
X-Google-Smtp-Source: ACHHUZ5B5lkDie78Ztie00mhgpCSN+kOqfqpm/fSIKel6WVg/9NGhMQ/B5KT7law34VWBHiSWbKI/w==
X-Received: by 2002:a05:600c:2247:b0:3f4:86:33b with SMTP id
 a7-20020a05600c224700b003f40086033bmr6383787wmm.26.1684744498553; 
 Mon, 22 May 2023 01:34:58 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a1c7319000000b003f4ddde398csm7698807wmb.21.2023.05.22.01.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:34:58 -0700 (PDT)
Message-ID: <bef01726-7af9-973f-f090-29c8868c790f@linaro.org>
Date: Mon, 22 May 2023 10:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/3] drm/panel: Add Samsung S6D7AA0 panel controller
 driver
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>, thierry.reding@gmail.com
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
 <20230519170354.29610-3-aweber.kernel@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230519170354.29610-3-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 19:03, Artur Weber wrote:
> Initial driver for S6D7AA0-controlled panels. Currently, the following
> panels are supported:
> 
>   - S6D7AA0-LSL080AL02 (Samsung Galaxy Tab 3 8.0)
>   - S6D7AA0-LSL080AL03 (Samsung Galaxy Tab A 8.0 2015)
>   - S6D7AA0-LTL101AT01 (Samsung Galaxy Tab A 9.7 2015)
> 
> It should be possible to extend this driver to work with other panels
> using this IC.
> 
> Tested-by: Nikita Travkin <nikita@trvn.ru> #ltl101at01
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>   - Removed unused panel_name property from desc struct
> Changed in v4:
>   - Added LSL080AL03 and LTL101AT01 panels
>   - Added DSI-controlled backlight support for panels that support it
>   - Renamed command defines: CMD_* -> MCS_*
>   - Dropped s6d7aa0_bl_ctl_on (not universal across panels)
>   - Dropped MIPI_DSI_MODE_LPM flag
>   - Added vmipi-supply, renamed enable-supply to power-supply
> Changed in v5:
>   - Changed compatible to avoid concatenating multiple model numbers
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   7 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 585 ++++++++++++++++++
>   3 files changed, 593 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2b9d6db7860b..203c0ef0bbfd 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -553,6 +553,13 @@ config DRM_PANEL_SAMSUNG_S6D27A1
>   	  This panel can be found in Samsung Galaxy Ace 2
>   	  GT-I8160 mobile phone.
>   
> +config DRM_PANEL_SAMSUNG_S6D7AA0
> +	tristate "Samsung S6D7AA0 MIPI-DSI video mode panel controller"
> +	depends on OF
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +
>   config DRM_PANEL_SAMSUNG_S6E3HA2
>   	tristate "Samsung S6E3HA2 DSI video mode panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index ff169781e82d..30cf553c8d1d 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> new file mode 100644
> index 000000000000..f532aa018428
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -0,0 +1,585 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung S6D7AA0 MIPI-DSI TFT LCD controller drm_panel driver.
> + *
> + * Copyright (C) 2022 Artur Weber <aweber.kernel@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +
> +#include <video/mipi_display.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +/* Manufacturer command set */
> +#define MCS_BL_CTL		0xc3
> +#define MCS_OTP_RELOAD		0xd0
> +#define MCS_PASSWD1		0xf0
> +#define MCS_PASSWD2		0xf1
> +#define MCS_PASSWD3		0xfc
> +
> +struct s6d7aa0 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[2];
> +	const struct s6d7aa0_panel_desc *desc;
> +};
> +
> +struct s6d7aa0_panel_desc {
> +	unsigned int panel_type;
> +	int (*init_func)(struct s6d7aa0 *ctx);
> +	int (*off_func)(struct s6d7aa0 *ctx);
> +	const struct drm_display_mode drm_mode;
> +	unsigned long mode_flags;
> +	u32 bus_flags;
> +	bool has_backlight;
> +	bool use_passwd3;
> +};
> +
> +enum s6d7aa0_panels {
> +	S6D7AA0_PANEL_LSL080AL02,
> +	S6D7AA0_PANEL_LSL080AL03,
> +	S6D7AA0_PANEL_LTL101AT01,
> +};
> +
> +static inline struct s6d7aa0 *panel_to_s6d7aa0(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct s6d7aa0, panel);
> +}
> +
> +static void s6d7aa0_reset(struct s6d7aa0 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	msleep(50);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(50);
> +}
> +
> +static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret = 0;
> +
> +	if (lock) {
> +		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> +		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
> +		if (ctx->desc->use_passwd3)
> +			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
> +	} else {
> +		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
> +		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
> +		if (ctx->desc->use_passwd3)
> +			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
> +	}
> +
> +	return ret;
> +}
> +
> +static int s6d7aa0_on(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = ctx->desc->init_func(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_off(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = ctx->desc->off_func(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Panel-specific off function failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(64);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_prepare(struct drm_panel *panel)
> +{
> +	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6d7aa0_reset(ctx);
> +
> +	ret = s6d7aa0_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_disable(struct drm_panel *panel)
> +{
> +	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = s6d7aa0_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_unprepare(struct drm_panel *panel)
> +{
> +	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +/* Backlight control code */
> +
> +static int s6d7aa0_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	return brightness & 0xff;
> +}
> +
> +static const struct backlight_ops s6d7aa0_bl_ops = {
> +	.update_status = s6d7aa0_bl_update_status,
> +	.get_brightness = s6d7aa0_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +s6d7aa0_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 255,
> +		.max_brightness = 255,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &s6d7aa0_bl_ops, &props);
> +}
> +
> +/* Initialization code and structures for LSL080AL02 panel */
> +
> +static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	usleep_range(20000, 25000);
> +
> +	ret = s6d7aa0_lock(ctx, false);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to unlock registers: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
> +	usleep_range(1000, 1500);
> +
> +	/* SEQ_B6_PARAM_8_R01 */
> +	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x10);
> +
> +	/* BL_CTL_ON */
> +	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x28);
> +
> +	usleep_range(5000, 6000);
> +
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(120);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +
> +	ret = s6d7aa0_lock(ctx, true);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to lock registers: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_lsl080al02_off(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +
> +	/* BL_CTL_OFF */
> +	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x20);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode s6d7aa0_lsl080al02_mode = {
> +	.clock = (800 + 16 + 4 + 140) * (1280 + 8 + 4 + 4) * 60 / 1000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 16,
> +	.hsync_end = 800 + 16 + 4,
> +	.htotal = 800 + 16 + 4 + 140,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 8,
> +	.vsync_end = 1280 + 8 + 4,
> +	.vtotal = 1280 + 8 + 4 + 4,
> +	.width_mm = 108,
> +	.height_mm = 173,
> +};
> +
> +static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
> +	.panel_type = S6D7AA0_PANEL_LSL080AL02,
> +	.init_func = s6d7aa0_lsl080al02_init,
> +	.off_func = s6d7aa0_lsl080al02_off,
> +	.drm_mode = s6d7aa0_lsl080al02_mode,
> +	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +
> +	.has_backlight = false,
> +	.use_passwd3 = false,
> +};
> +
> +/* Initialization code and structures for LSL080AL03 panel */
> +
> +static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	usleep_range(20000, 25000);
> +
> +	ret = s6d7aa0_lock(ctx, false);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to unlock registers: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
> +		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
> +		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0xa0);
> +		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
> +				       0x09);
> +		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
> +				       0x80, 0x78);
> +	} else if (ctx->desc->panel_type == S6D7AA0_PANEL_LTL101AT01) {
> +		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x08);
> +		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0x0b);
> +		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
> +				       0x09);
> +		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
> +				       0x80, 0x68);
> +	}
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x51);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x02, 0x08, 0x08);
> +
> +	usleep_range(10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x80, 0x80, 0x30);
> +	mipi_dsi_dcs_write_seq(dsi, 0xcd,
> +			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
> +			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e);
> +	mipi_dsi_dcs_write_seq(dsi, 0xce,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x03);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = s6d7aa0_lock(ctx, true);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to lock registers: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6d7aa0_lsl080al03_off(struct s6d7aa0 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode s6d7aa0_lsl080al03_mode = {
> +	.clock = (768 + 18 + 16 + 126) * (1024 + 8 + 2 + 6) * 60 / 1000,
> +	.hdisplay = 768,
> +	.hsync_start = 768 + 18,
> +	.hsync_end = 768 + 18 + 16,
> +	.htotal = 768 + 18 + 16 + 126,
> +	.vdisplay = 1024,
> +	.vsync_start = 1024 + 8,
> +	.vsync_end = 1024 + 8 + 2,
> +	.vtotal = 1024 + 8 + 2 + 6,
> +	.width_mm = 122,
> +	.height_mm = 163,
> +};
> +
> +static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al03_desc = {
> +	.panel_type = S6D7AA0_PANEL_LSL080AL03,
> +	.init_func = s6d7aa0_lsl080al03_init,
> +	.off_func = s6d7aa0_lsl080al03_off,
> +	.drm_mode = s6d7aa0_lsl080al03_mode,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.bus_flags = 0,
> +
> +	.has_backlight = true,
> +	.use_passwd3 = true,
> +};
> +
> +/* Initialization structures for LTL101AT01 panel */
> +
> +static const struct drm_display_mode s6d7aa0_ltl101at01_mode = {
> +	.clock = (768 + 96 + 16 + 184) * (1024 + 8 + 2 + 6) * 60 / 1000,
> +	.hdisplay = 768,
> +	.hsync_start = 768 + 96,
> +	.hsync_end = 768 + 96 + 16,
> +	.htotal = 768 + 96 + 16 + 184,
> +	.vdisplay = 1024,
> +	.vsync_start = 1024 + 8,
> +	.vsync_end = 1024 + 8 + 2,
> +	.vtotal = 1024 + 8 + 2 + 6,
> +	.width_mm = 148,
> +	.height_mm = 197,
> +};
> +
> +static const struct s6d7aa0_panel_desc s6d7aa0_ltl101at01_desc = {
> +	.panel_type = S6D7AA0_PANEL_LTL101AT01,
> +	.init_func = s6d7aa0_lsl080al03_init, /* Similar init to LSL080AL03 */
> +	.off_func = s6d7aa0_lsl080al03_off,
> +	.drm_mode = s6d7aa0_ltl101at01_mode,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.bus_flags = 0,
> +
> +	.has_backlight = true,
> +	.use_passwd3 = true,
> +};
> +
> +static int s6d7aa0_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +	struct s6d7aa0 *ctx;
> +
> +	ctx = container_of(panel, struct s6d7aa0, panel);
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	mode = drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	connector->display_info.bus_flags = ctx->desc->bus_flags;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs s6d7aa0_panel_funcs = {
> +	.disable = s6d7aa0_disable,
> +	.prepare = s6d7aa0_prepare,
> +	.unprepare = s6d7aa0_unprepare,
> +	.get_modes = s6d7aa0_get_modes,
> +};
> +
> +static int s6d7aa0_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6d7aa0 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->desc = of_device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return -ENODEV;
> +
> +	ctx->supplies[0].supply = "power";
> +	ctx->supplies[1].supply = "vmipi";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +					      ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> +		| ctx->desc->mode_flags;
> +
> +	drm_panel_init(&ctx->panel, dev, &s6d7aa0_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	/* Use DSI-based backlight as fallback if available */
> +	if (ctx->desc->has_backlight && !ctx->panel.backlight) {
> +		ctx->panel.backlight = s6d7aa0_create_backlight(dsi);
> +		if (IS_ERR(ctx->panel.backlight))
> +			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +					     "Failed to create backlight\n");
> +	}
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
> +static void s6d7aa0_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6d7aa0 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id s6d7aa0_of_match[] = {
> +	{
> +		.compatible = "samsung,lsl080al02",
> +		.data = &s6d7aa0_lsl080al02_desc
> +	},
> +	{
> +		.compatible = "samsung,lsl080al03",
> +		.data = &s6d7aa0_lsl080al03_desc
> +	},
> +	{
> +		.compatible = "samsung,ltl101at01",
> +		.data = &s6d7aa0_ltl101at01_desc
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static struct mipi_dsi_driver s6d7aa0_driver = {
> +	.probe = s6d7aa0_probe,
> +	.remove = s6d7aa0_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6d7aa0",
> +		.of_match_table = s6d7aa0_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6d7aa0_driver);
> +
> +MODULE_AUTHOR("Artur Weber <aweber.kernel@gmail.com>");
> +MODULE_DESCRIPTION("Samsung S6D7AA0 MIPI-DSI LCD controller driver");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
