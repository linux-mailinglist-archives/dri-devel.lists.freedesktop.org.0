Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3F26B27BA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5089F10E848;
	Thu,  9 Mar 2023 14:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02E710E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:51:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q16so2148724wrw.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678373470;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XJGT5gzayA+v60HrIF69Z0JKuo7e2zPr/v1zCwlC+z4=;
 b=xYagvbzg5nodi9IhJyWvIPCXtZ4FMPs4JtybUIIZt5jyfvKSQS45D2AL0NzZFbVa9K
 oYjVqmx2PrU54c0LSMZkK0FJ4w2F/+tQ4qfi/doHu9TA4IWUxucXblYAuNiHPF9eXVvS
 McXoxd8558zLlYTufqBlqbRmbjYmiHkJ6BCrudCRv5A816+hLdfUJ1cEgzE7RR9IKg1t
 F8tAZ3Omj2zciKBOIjtCYkj0vVcdGazcQL407jpSxBuJBktJ4pvuAGvh5Wfb0LyjeIWF
 e8URUiuab/pWVoU8Muh/TtbmSwbdA4XRotD6xHo6Ntm3wahmugeFwG47y3V2uCCYRu5/
 eSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373470;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJGT5gzayA+v60HrIF69Z0JKuo7e2zPr/v1zCwlC+z4=;
 b=LbrMUhJtGJ5PKE7R7i2w9NoJIUR1W/yuBimmCOaxb+hBLmdboEaBYw9eWrb+1d7iq3
 Zdvx7jv9zj0S2pR8FzjIPqYxYOF07oPjNdGIAUZkJBjL6BLQrRUckVSx0gr09njJqE/E
 SuL0oaOnb36tlrdXAnFdMSYRsb/F4soAioCW6COQsm/X2MocD+nmZeWYc11cM4T64jPK
 yjZO5Wl7hPSfG3/fU+wir2XjOZbKOmRUBifaPSWxL2tMiy6DTvLvPceztVtbYG2gZ8Jg
 rd+FVFG38EF4xlz2+NRglBI7Bt3pw/eF0GUJgoh5FmaqMYyMQPF2jDuiGsrd1+Y1C913
 8LDw==
X-Gm-Message-State: AO0yUKW7kKEapx95xqkaCjVuF00nOpTnSX/Kb5htWPJMrHlGofcImPDl
 d92p6fSJgeltiK2Wv8hN9x/gcg==
X-Google-Smtp-Source: AK7set+LmoE9+xUYtgCH4KkzAjZkLaBOJuVNgHmSvR7PX2pvirV6iNsHlZsD4hJuzRF5fYqQhZfsig==
X-Received: by 2002:a05:6000:110f:b0:2cb:5f2a:274e with SMTP id
 z15-20020a056000110f00b002cb5f2a274emr14576146wrw.41.1678373469891; 
 Thu, 09 Mar 2023 06:51:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9df7:bf3e:9813:995a?
 ([2a01:e0a:982:cbb0:9df7:bf3e:9813:995a])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b002c55efa9cbesm17887163wrh.39.2023.03.09.06.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 06:51:09 -0800 (PST)
Message-ID: <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
Date: Thu, 9 Mar 2023 15:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this
 display
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-21-45cbc68e188b@baylibre.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230220-display-v1-21-45cbc68e188b@baylibre.com>
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
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> From: Guillaume La Roque <glaroque@baylibre.com>
> 
> This driver support the Startek KD070FHFID015, which is a 7-inch TFT LCD
> display using MIPI DSI interface.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                      |  12 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 483 +++++++++++++++++++++
>   3 files changed, 496 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 737edcdf9eef..3fccf025013b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -666,6 +666,17 @@ config DRM_PANEL_SONY_TULIP_TRULY_NT35521
>   	  NT35521 1280x720 video mode panel as found on Sony Xperia M4
>   	  Aqua phone.
>   
> +config DRM_PANEL_STARTEK_KD070FHFID015
> +	tristate "STARTEK KD070FHFID015 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for STARTEK KD070FHFID015 DSI panel
> +	  based on RENESAS-R69429 controller. The pannel is a 7-inch TFT LCD display
> +	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
> +	  the host, a built-in LED backlight and touch controller.
> +
>   config DRM_PANEL_TDO_TL070WSH30
>   	tristate "TDO TL070WSH30 DSI panel"
>   	depends on OF
> @@ -736,4 +747,5 @@ config DRM_PANEL_XINPENG_XPP055C272
>   	  Say Y here if you want to enable support for the Xinpeng
>   	  XPP055C272 controller for 720x1280 LCD panels with MIPI/RGB/SPI
>   	  system interfaces.
> +

Spurious new line

>   endmenu
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f8f9d9f6a307..35771fc51187 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>   obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
> +obj-$(CONFIG_DRM_PANEL_STARTEK_KD070FHFID015) += panel-startek-kd070fhfid015.o
>   obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> new file mode 100644
> index 000000000000..88466bf6428d
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> @@ -0,0 +1,483 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 InforceComputing
> + * Copyright (C) 2016 Linaro Ltd
> + * Copyright (C) 2023 BayLibre, SAS
> + *
> + * Author:

NIT: Authors

> + * - Vinay Simha BN <simhavcs@gmail.com>
> + * - Sumit Semwal <sumit.semwal@linaro.org>
> + * - Guillaume La Roque <glaroque@baylibre.com>
> + *
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_crtc.h>

Is this include needed ?

> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#define DSI_REG_MCAP	0xB0
> +#define DSI_REG_IS	0xB3 /* Interface Setting */
> +#define DSI_REG_IIS	0xB4 /* Interface ID Setting */
> +#define DSI_REG_CTRL	0xB6
> +
> +struct stk_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *dsi;
> +
> +	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *dcdc_en_gpio;

Isn't this "DCDC" a regulator ???

> +	struct backlight_device *backlight;
> +	struct regulator *iovcc_supply;
> +	struct regulator *power_supply;
> +
> +	bool prepared;
> +	bool enabled;
> +
> +	const struct drm_display_mode *mode;
> +};
> +
> +static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct stk_panel, base);
> +}
> +
> +static int stk_panel_init(struct stk_panel *stk)
> +{
> +	struct mipi_dsi_device *dsi = stk->dsi;
> +	struct device *dev = &stk->dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_soft_reset(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
> +		return ret;
> +	}
> +	mdelay(5);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	ret = mipi_dsi_generic_write(dsi, (u8[]){DSI_REG_MCAP, 0x04}, 2);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set mcap: %d\n", ret);
> +		return ret;
> +	}
> +	/* Interface setting, video mode */
> +	ret = mipi_dsi_generic_write(dsi,
> +			(u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00}, 6);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set display interface setting: %d\n",
> +			ret);
> +		return ret;
> +	}

Use mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00); instead,
it's simpler and doesn't need explicit return check.

> +
> +	ret = mipi_dsi_generic_write(dsi, (u8[]){DSI_REG_IIS, 0x0C, 0x00}, 3);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set Interface ID setting: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_generic_write(dsi, (u8[]){ DSI_REG_CTRL, 0x3A, 0xD3}, 3);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set DSI control: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write display brightness: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				 (u8[]){ MIPI_DCS_WRITE_MEMORY_START }, 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write control display: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set pixel format: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set column address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set page address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stk_panel_on(struct stk_panel *stk)
> +{
> +	struct mipi_dsi_device *dsi = stk->dsi;
> +	struct device *dev = &stk->dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0)
> +		dev_err(dev, "failed to set display on: %d\n", ret);
> +
> +	mdelay(20);
> +
> +	return ret;
> +}
> +
> +static void stk_panel_off(struct stk_panel *stk)
> +{
> +	struct mipi_dsi_device *dsi = stk->dsi;
> +	struct device *dev = &stk->dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		dev_err(dev, "failed to set display off: %d\n", ret);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
> +
> +	msleep(100);
> +}
> +
> +static int stk_panel_disable(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +
> +	if (!stk->enabled)
> +		return 0;
> +
> +	backlight_disable(stk->backlight);
> +
> +	stk->enabled = false;
> +
> +	return 0;
> +}
> +
> +static int stk_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +
> +	if (!stk->prepared)
> +		return 0;
> +
> +	stk_panel_off(stk);
> +	regulator_disable(stk->iovcc_supply);
> +	regulator_disable(stk->power_supply);
> +	gpiod_set_value(stk->reset_gpio, 0);
> +	gpiod_set_value(stk->dcdc_en_gpio, 1);
> +
> +	stk->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int stk_panel_prepare(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +	struct device *dev = &stk->dsi->dev;
> +	int ret;
> +
> +	if (stk->prepared)
> +		return 0;
> +
> +	gpiod_set_value(stk->reset_gpio, 0);
> +	gpiod_set_value(stk->dcdc_en_gpio, 0);
> +	gpiod_set_value(stk->enable_gpio, 0);
> +	ret = regulator_enable(stk->iovcc_supply);
> +	if (ret < 0)
> +		return ret;
> +	mdelay(8);
> +	ret = regulator_enable(stk->power_supply);
> +	if (ret < 0)
> +		goto iovccoff;

Add blank lines between code blocks for readability

> +	mdelay(20);
> +	gpiod_set_value(stk->dcdc_en_gpio, 1);
> +	mdelay(20);
> +	gpiod_set_value(stk->reset_gpio, 1);
> +	mdelay(10);
> +
> +	ret = stk_panel_init(stk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to init panel: %d\n", ret);
> +		goto poweroff;
> +	}
> +
> +	ret = stk_panel_on(stk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set panel on: %d\n", ret);
> +		goto poweroff;
> +	}
> +
> +	stk->prepared = true;
> +
> +	return 0;
> +
> +poweroff:
> +	regulator_disable(stk->power_supply);
> +iovccoff:
> +	regulator_disable(stk->iovcc_supply);
> +	gpiod_set_value(stk->enable_gpio, 0);
> +	gpiod_set_value(stk->reset_gpio, 0);
> +	gpiod_set_value(stk->dcdc_en_gpio, 0);
> +
> +	return ret;
> +}
> +
> +static int stk_panel_enable(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +
> +	if (stk->enabled)
> +		return 0;
> +
> +	backlight_enable(stk->backlight);
> +
> +	stk->enabled = true;
> +
> +	return 0;
> +}

Is this really needed ? the backlight core will enable it automatically.

> +
> +static const struct drm_display_mode default_mode = {
> +		.clock = 163204,
> +		.hdisplay = 1200,
> +		.hsync_start = 1200 + 144,
> +		.hsync_end = 1200 + 144 + 16,
> +		.htotal = 1200 + 144 + 16 + 45, // 1405

No need for the comment

> +		.vdisplay = 1920,
> +		.vsync_start = 1920 + 8,
> +		.vsync_end = 1920 + 8 + 4,
> +		.vtotal = 1920 + 8 + 4 + 4, // 1936

You can also set .width_mm & .height_mm and copy them to connector->display_info later.

> +};
> +
> +static int stk_panel_get_modes(struct drm_panel *panel,
> +				 struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &default_mode);
> +	if (!mode) {
> +		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> +			default_mode.hdisplay, default_mode.vdisplay,
> +			drm_mode_vrefresh(&default_mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = 95;
> +	connector->display_info.height_mm = 151;
> +
> +	return 1;
> +}
> +
> +static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int ret;
> +	u16 brightness = bl->props.brightness;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness & 0xff;
> +}
> +
> +static int dsi_dcs_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set DSI control: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops dsi_bl_ops = {
> +	.update_status = dsi_dcs_bl_update_status,
> +	.get_brightness = dsi_dcs_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct backlight_properties props;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.brightness = 255;
> +	props.max_brightness = 255;

You could write :
struct backlight_properties props = {
	.type = BACKLIGHT_RAW,
	.brightness = 255,
	.max_brightness = 255,
};

> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &dsi_bl_ops, &props);
> +}
> +
> +static const struct drm_panel_funcs stk_panel_funcs = {
> +	.disable = stk_panel_disable,
> +	.unprepare = stk_panel_unprepare,
> +	.prepare = stk_panel_prepare,
> +	.enable = stk_panel_enable,
> +	.get_modes = stk_panel_get_modes,
> +};
> +
> +static const struct of_device_id stk_of_match[] = {
> +	{ .compatible = "startek,kd070fhfid015", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, stk_of_match);
> +
> +static int stk_panel_add(struct stk_panel *stk)
> +{
> +	struct device *dev = &stk->dsi->dev;
> +	int ret;
> +
> +	stk->mode = &default_mode;
> +
> +	stk->iovcc_supply = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(stk->iovcc_supply))
> +		return PTR_ERR(stk->iovcc_supply);
> +
> +	stk->power_supply = devm_regulator_get(dev, "power");
> +	if (IS_ERR(stk->power_supply))
> +		return PTR_ERR(stk->power_supply);

You can switch to devm_regulator_bulk_get() to simplify code.

> +
> +	stk->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(stk->reset_gpio)) {
> +		ret = PTR_ERR(stk->reset_gpio);
> +		dev_err(dev, "cannot get reset-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	stk->dcdc_en_gpio = devm_gpiod_get(dev, "dcdc", GPIOD_OUT_LOW);
> +	if (IS_ERR(stk->dcdc_en_gpio)) {
> +		ret = PTR_ERR(stk->dcdc_en_gpio);
> +		dev_err(dev, "cannot get dcdc-en-gpio %d\n", ret);
> +		return ret;
> +	}
> +
> +	stk->backlight = drm_panel_create_dsi_backlight(stk->dsi);
> +	if (IS_ERR(stk->backlight)) {
> +		ret = PTR_ERR(stk->backlight);
> +		dev_err(dev, "failed to register backlight %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&stk->base, &stk->dsi->dev, &stk_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_panel_add(&stk->base);
> +
> +	return 0;
> +}
> +
> +static void stk_panel_del(struct stk_panel *stk)
> +{
> +	if (stk->base.dev)
> +		drm_panel_remove(&stk->base);

Is the if() necessary ? Not sure, you can remove it and directly call drm_panel_remove(&stk->base);

> +}
> +
> +static int stk_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct stk_panel *stk;
> +	int ret;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
> +			   MIPI_DSI_MODE_LPM);

This could be on a single line

> +
> +	stk = devm_kzalloc(&dsi->dev, sizeof(*stk), GFP_KERNEL);
> +	if (!stk)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, stk);
> +
> +	stk->dsi = dsi;
> +
> +	ret = stk_panel_add(stk);
> +	if (ret < 0)
> +		return ret;
> +
> +	return mipi_dsi_attach(dsi);

You should call drm_panel_remove() if attach fails

> +}
> +
> +static void stk_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
> +	int err;
> +
> +	err = stk_panel_disable(&stk->base);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to disable panel: %d\n", err) > +
> +	err = mipi_dsi_detach(dsi);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
> +			err);
> +
> +	stk_panel_del(stk);

Move the content of stk_panel_del() here, no need for a separate function.


> +}
> +
> +static void stk_panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
> +
> +	stk_panel_disable(&stk->base);
> +}
> +
> +static struct mipi_dsi_driver stk_panel_driver = {
> +	.driver = {
> +		.name = "panel-startek-kd070fhfid015",
> +		.of_match_table = stk_of_match,
> +	},
> +	.probe = stk_panel_probe,
> +	.remove = stk_panel_remove,
> +	.shutdown = stk_panel_shutdown,
> +};
> +module_mipi_dsi_driver(stk_panel_driver);
> +
> +MODULE_AUTHOR("Guillaume La Roque <glaroque@baylibre.com>");
> +MODULE_DESCRIPTION("STARTEK KD070FHFID015");
> +MODULE_LICENSE("GPL");
> 

Thanks,
Neil

