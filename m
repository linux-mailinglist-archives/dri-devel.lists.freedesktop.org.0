Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73780C340
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5410E360;
	Mon, 11 Dec 2023 08:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAED10E360
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:30:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3334a701cbbso4368482f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702283452; x=1702888252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=aa50lg1f1L1j1Qu85ixh6XDRwQUTw92mLWoqhKYIANY=;
 b=TuVLIGA7cmlCC2JI9gGB+077i3GExolyM26uNABSIV1HZuQ7LQik9fuPxfjJvohdfD
 /fmqR/ILn7NdkkvJ23WwoND0r0DuqEbiiEdzSl46f8WTNgltLybKCCECLBF5nxRrWXb+
 ZCAZTlevnlGwuIJvtArxsQLOVe/BJuq9GZxPQFSo/PmuhGqxKTzbeAsL87EjOYoFef1T
 boE8NiNs9ZfwuQNB858u+f3mlbzVEbj9IoHt/lynKCNhHA2NB0ZTyMAjEgwh5e4U1Muq
 6TtWlFOFdBz8hOzQdk7JRlYtsWhqi3/7D1u2WJXp1b5saKRuYFo0ZMpK86tfpMTZgX+w
 3NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702283452; x=1702888252;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aa50lg1f1L1j1Qu85ixh6XDRwQUTw92mLWoqhKYIANY=;
 b=kf2bO1yJrZyY/ih3XQ3MP/2YNn4mneXwhtlRn9XxlQpxnVU6qdlqW0MP0tM8Zx0ape
 UL3EGHcrm2aNMNx/hEOBWRHWVRnQmRRR9fFl7zI5djPbslrWvo/3OMnKDhb9Qf2mhtjf
 STB7mk2c5B0JQPDvluxV6wSmTM2B18jKTG57canB/p7xj0LLzi31vb4DwpT699NQqFTx
 cWwO8/DwXbNs4TSRxnrEMcvsy90A1hvDsZw+If3Boiwx60z6rT9SW5LEOB9grBjf+w1W
 9WUZVqhN1i7RKqiww0/ZWo6QXze3iT0gn/GQ6aH/lXEsGfhqV1rwJ+WPHEeuMgXz4mhx
 BeUQ==
X-Gm-Message-State: AOJu0Ywii/tiwu4d+TvvwxHSDu85Mfln2vb4LA820dsbxpCaL+oy5UTJ
 AcIbES6j+fMs0XtEV4ZrUKJrSA==
X-Google-Smtp-Source: AGHT+IEqGQDp5V3C58U8REJc2ghTmoyIHSfqVVl5gK8W9D+qbMUNHM1hrmw50DeNqGJeG57kLhR+tQ==
X-Received: by 2002:a05:6000:111:b0:333:16:7a85 with SMTP id
 o17-20020a056000011100b0033300167a85mr1492063wrx.11.1702283452336; 
 Mon, 11 Dec 2023 00:30:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23?
 ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056000118d00b003333d46a9e8sm7955435wrx.56.2023.12.11.00.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 00:30:51 -0800 (PST)
Message-ID: <f1914694-56a8-45f7-bbc3-713220b16497@linaro.org>
Date: Mon, 11 Dec 2023 09:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 06/10] drm/panel: Add Synaptics R63353 panel driver
Content-Language: en-US, fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
 <20231207141723.108004-7-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231207141723.108004-7-dario.binacchi@amarulasolutions.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/12/2023 15:16, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> The LS068B3SX02 panel is based on the Synaptics R63353 Controller.
> Add a driver for it.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v5:
> - Replace a 'return ret' with a 'goto fail' in the r63353_panel_activate()
> 
> Changes in v4:
> - Set the reset gpio to low in a single operation
> - Remove duplicated code for prepare/unprepare callbacks
> 
> Changes in v2:
> - Adjust the timings of the panel reset
> 
>   MAINTAINERS                                   |   6 +
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-synaptics-r63353.c    | 363 ++++++++++++++++++
>   4 files changed, 379 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 788be9ab5b73..b82dc141d209 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6874,6 +6874,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
>   F:	drivers/gpu/drm/mcde/
>   
> +DRM DRIVER FOR SYNAPTICS R63353 PANELS
> +M:	Michael Trimarchi <michael@amarulasolutions.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
> +F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
> +
>   DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
>   M:	Jagan Teki <jagan@amarulasolutions.com>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 99e14dc212ec..d018702be3dc 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -735,6 +735,15 @@ config DRM_PANEL_SITRONIX_ST7789V
>   	  Say Y here if you want to enable support for the Sitronix
>   	  ST7789V controller for 240x320 LCD panels
>   
> +config DRM_PANEL_SYNAPTICS_R63353
> +	tristate "Synaptics R63353-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Synaptics R63353 controller.
> +
>   config DRM_PANEL_SONY_ACX565AKM
>   	tristate "Sony ACX565AKM panel"
>   	depends on GPIOLIB && OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index d10c3de51c6d..f267d932c2b5 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>   obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
>   obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
> diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> new file mode 100644
> index 000000000000..3f61fcdc550b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> @@ -0,0 +1,363 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synaptics R63353 Controller driver
> + *
> + * Copyright (C) 2020 BSH Hausgerate GmbH
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/fb.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/media-bus-format.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +#define R63353_INSTR(...) { \
> +		.len = sizeof((u8[]) {__VA_ARGS__}), \
> +		.data = (u8[]){__VA_ARGS__} \
> +	}
> +
> +struct r63353_instr {
> +	size_t len;
> +	const u8 *data;
> +};
> +
> +static const struct r63353_instr sharp_ls068b3sx02_init[] = {
> +	R63353_INSTR(0x51, 0xff),
> +	R63353_INSTR(0x53, 0x0c),
> +	R63353_INSTR(0x55, 0x00),
> +	R63353_INSTR(0x84, 0x00),
> +	R63353_INSTR(0x29),
> +};
> +
> +struct r63353_desc {
> +	const char *name;
> +	const struct r63353_instr *init;
> +	const size_t init_length;
> +	const struct drm_display_mode *mode;
> +	u32 width_mm;
> +	u32 height_mm;
> +};
> +
> +struct r63353_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *dsi;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator *dvdd;
> +	struct regulator *avdd;
> +
> +	struct r63353_desc *pdata;
> +};
> +
> +static inline struct r63353_panel *to_r63353_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct r63353_panel, base);
> +}
> +
> +static int r63353_panel_power_on(struct r63353_panel *rpanel)
> +{
> +	struct mipi_dsi_device *dsi = rpanel->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = regulator_enable(rpanel->avdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable avdd regulator (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(15000, 25000);
> +
> +	ret = regulator_enable(rpanel->dvdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dvdd regulator (%d)\n", ret);
> +		regulator_disable(rpanel->avdd);
> +		return ret;
> +	}
> +
> +	usleep_range(300000, 350000);
> +	gpiod_set_value(rpanel->reset_gpio, 1);
> +	usleep_range(15000, 25000);
> +
> +	return 0;
> +}
> +
> +static int r63353_panel_power_off(struct r63353_panel *rpanel)
> +{
> +	gpiod_set_value(rpanel->reset_gpio, 0);
> +	regulator_disable(rpanel->dvdd);
> +	regulator_disable(rpanel->avdd);
> +
> +	return 0;
> +}
> +
> +static int r63353_panel_activate(struct r63353_panel *rpanel)
> +{
> +	struct mipi_dsi_device *dsi = rpanel->dsi;
> +	struct device *dev = &dsi->dev;
> +	int i, ret;
> +
> +	ret = mipi_dsi_dcs_soft_reset(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
> +		goto fail;
> +	}
> +
> +	usleep_range(15000, 17000);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
> +		goto fail;
> +	}
> +
> +	for (i = 0; i < rpanel->pdata->init_length; i++) {
> +		const struct r63353_instr *instr = &rpanel->pdata->init[i];
> +
> +		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
> +		if (ret < 0)
> +			goto fail;
> +	}
> +
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
> +		goto fail;
> +	}
> +
> +	usleep_range(5000, 10000);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display ON (%d)\n", ret);
> +		goto fail;
> +	}
> +
> +	return 0;
> +
> +fail:
> +	gpiod_set_value(rpanel->reset_gpio, 0);
> +
> +	return ret;
> +}
> +
> +static int r63353_panel_prepare(struct drm_panel *panel)
> +{
> +	struct r63353_panel *rpanel = to_r63353_panel(panel);
> +	struct mipi_dsi_device *dsi = rpanel->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dev_dbg(dev, "Preparing\n");
> +
> +	ret = r63353_panel_power_on(rpanel);
> +	if (ret)
> +		return ret;
> +
> +	ret = r63353_panel_activate(rpanel);
> +	if (ret) {
> +		r63353_panel_power_off(rpanel);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "Prepared\n");
> +	return 0;
> +}
> +
> +static int r63353_panel_deactivate(struct r63353_panel *rpanel)
> +{
> +	struct mipi_dsi_device *dsi = rpanel->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(5000, 10000);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int r63353_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct r63353_panel *rpanel = to_r63353_panel(panel);
> +
> +	r63353_panel_deactivate(rpanel);
> +	r63353_panel_power_off(rpanel);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode sharp_ls068b3sx02_timing = {
> +	.clock = 70000,
> +	.hdisplay = 640,
> +	.hsync_start = 640 + 35,
> +	.hsync_end = 640 + 35 + 2,
> +	.htotal = 640 + 35 + 2 + 150,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 2,
> +	.vsync_end = 1280 + 2 + 4,
> +	.vtotal = 1280 + 2 + 4 + 0,
> +};
> +
> +static int r63353_panel_get_modes(struct drm_panel *panel,
> +				  struct drm_connector *connector)
> +{
> +	struct r63353_panel *rpanel = to_r63353_panel(panel);
> +	struct drm_display_mode *mode;
> +	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	mode = drm_mode_duplicate(connector->dev, rpanel->pdata->mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = rpanel->pdata->width_mm;
> +	connector->display_info.height_mm = rpanel->pdata->height_mm;
> +
> +	drm_display_info_set_bus_formats(&connector->display_info,
> +					 &bus_format, 1);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs r63353_panel_funcs = {
> +	.prepare = r63353_panel_prepare,
> +	.unprepare = r63353_panel_unprepare,
> +	.get_modes = r63353_panel_get_modes,
> +};
> +
> +static int r63353_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	int ret = 0;
> +	struct device *dev = &dsi->dev;
> +	struct r63353_panel *panel;
> +
> +	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
> +	if (!panel)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, panel);
> +	panel->dsi = dsi;
> +	panel->pdata = (struct r63353_desc *)of_device_get_match_data(dev);
> +
> +	dev_info(dev, "Panel %s\n", panel->pdata->name);
> +
> +	dsi->lanes = 2;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM |
> +			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	panel->dvdd = devm_regulator_get(dev, "dvdd");
> +	if (IS_ERR(panel->dvdd))
> +		return PTR_ERR(panel->dvdd);
> +	panel->avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(panel->avdd))
> +		return PTR_ERR(panel->avdd);
> +
> +	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(panel->reset_gpio)) {
> +		dev_err(dev, "failed to get RESET GPIO\n");
> +		return PTR_ERR(panel->reset_gpio);
> +	}
> +
> +	drm_panel_init(&panel->base, dev, &r63353_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	panel->base.prepare_prev_first = true;
> +	ret = drm_panel_of_backlight(&panel->base);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&panel->base);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
> +		drm_panel_remove(&panel->base);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void r63353_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to detach from host (%d)\n", ret);
> +
> +	drm_panel_remove(&rpanel->base);
> +}
> +
> +static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
> +
> +	r63353_panel_unprepare(&rpanel->base);
> +}
> +
> +static const struct r63353_desc sharp_ls068b3sx02_data = {
> +	.name = "Sharp LS068B3SX02",
> +	.mode = &sharp_ls068b3sx02_timing,
> +	.init = sharp_ls068b3sx02_init,
> +	.init_length = ARRAY_SIZE(sharp_ls068b3sx02_init),
> +	.width_mm = 68,
> +	.height_mm = 159,
> +};
> +
> +static const struct of_device_id r63353_of_match[] = {
> +	{ .compatible = "sharp,ls068b3sx02", .data = &sharp_ls068b3sx02_data },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, r63353_of_match);
> +
> +static struct mipi_dsi_driver r63353_panel_driver = {
> +	.driver = {
> +		   .name = "r63353-dsi",
> +		   .of_match_table = r63353_of_match,
> +	},
> +	.probe = r63353_panel_probe,
> +	.remove = r63353_panel_remove,
> +	.shutdown = r63353_panel_shutdown,
> +};
> +
> +module_mipi_dsi_driver(r63353_panel_driver);
> +
> +MODULE_AUTHOR("Matthias Proske <Matthias.Proske@bshg.com>");
> +MODULE_AUTHOR("Michael Trimarchi <michael@amarulasolutions.com>");
> +MODULE_DESCRIPTION("Synaptics R63353 Controller Driver");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
