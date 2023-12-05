Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD43804BD6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E610610E495;
	Tue,  5 Dec 2023 08:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881610E494
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:07:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so3599018f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701763662; x=1702368462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0qrIp+ZfD6rxByDasoblSGlLKy5XMvqoSxroAd8Cnjc=;
 b=bEOP6ZGg4o0f7B5yEM2KtUxZQOIdsakc6kKfJXHpQ7rSxnMZtXOiAVBoPI0INdxZHT
 SibacSBSOZLREi0mKbrU/eOkqY9anllZ0xgPR33VCA66VhIKHoG+Dmq01noYP3+dEyhX
 JUmRbAkyZjpxGOIPPuYvXxVS3WfoNrQ6I7jrRFbOVMcqtSAgBzXWvUg7g0itmfd7W/jP
 aIzjx2l4szgCr+g52PA7Aphm0k+JUdx2yA7+mKOwAOmZy9tc4TANZavsTiG3HQZwdeVU
 QZZK2HJ5/cMsbB1PoULZSkrtaMvohu4h99wNnppt5MI0v13LR+CMwcfFgBs2MqcY2ymJ
 F/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701763662; x=1702368462;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0qrIp+ZfD6rxByDasoblSGlLKy5XMvqoSxroAd8Cnjc=;
 b=esbY/hVdfp9aagVIPptYmRbp1FpW+/A2W0c36WIv2SEvLI+iGTAX90PlgMkFRudse1
 lKmyNbKABkvd/WqRNq1Md3TfGeIvzeLB3BKd4aMOIzlQAIHvawx7zC2wadoYnK1+x0r0
 eZx72bU+N7F8VyySVdHHuJxXsyCGwcU+5kf+vEIgOTQHYnz8mDVnBToKVsQlgd17bjXK
 2EckKesad26w6y5fhGtcEjopHDiGwL/n9/nZ9JKPIhCnRoAvvlnDLTO2v2IAxQ6KL6Oo
 4LCRfRk8Z37jrPKZADVXEUHD7tWs6QPgaC5LLxkjIZJ9Wd8NR6oBrjyvtgQcMEhtgwZ/
 tO+g==
X-Gm-Message-State: AOJu0YwkZdAi0DoYPQLyxViIj3sGuBUDvrKxTqHAgaI9s5n+sJsD8S9z
 m5FlW74YpfBHK5/Xbaf40FCEBw==
X-Google-Smtp-Source: AGHT+IEPlJE3heDZ4eVAILtxgInhXoZoamSK6ZqeNJmkpl0NQe/C1gfsY3uOOXIBAN4WyJv1/uAexQ==
X-Received: by 2002:a05:6000:551:b0:333:4e3a:158d with SMTP id
 b17-20020a056000055100b003334e3a158dmr471922wrf.226.1701763661692; 
 Tue, 05 Dec 2023 00:07:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d5603000000b00333371c7382sm9148052wrv.72.2023.12.05.00.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:07:41 -0800 (PST)
Message-ID: <af45efb8-3ccc-43b1-a48d-792f0aebb158@linaro.org>
Date: Tue, 5 Dec 2023 09:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 06/10] drm/panel: Add Synaptics R63353 panel driver
Content-Language: en-US, fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
 <20231130141705.1796672-7-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20231130141705.1796672-7-dario.binacchi@amarulasolutions.com>
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

Hi Dario,

On 30/11/2023 15:16, Dario Binacchi wrote:
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
> (no changes since v2)
> 
> Changes in v2:
> - Adjust the timings of the panel reset
> 
>   MAINTAINERS                                   |   6 +
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-synaptics-r63353.c    | 375 ++++++++++++++++++
>   4 files changed, 391 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 012df8ccf34e..c373764b6e64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6875,6 +6875,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
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
> index 000000000000..d45373de7c9f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> @@ -0,0 +1,375 @@
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
> +	bool prepared;

You can drop this, it's no more needed since:commit:
d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")

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
> +			return ret;
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
> +	if (rpanel->prepared)
> +		return 0;
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
> +	rpanel->prepared = true;
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
> +	if (!rpanel->prepared)
> +		return 0;
> +
> +	r63353_panel_deactivate(rpanel);
> +	r63353_panel_power_off(rpanel);
> +
> +	rpanel->prepared = false;
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

Perhaps you can switch to devm_regulator_bulk_get(), or you really need a delay between
each regulators enable ? If yes then it's fine to keep as-is.

> +
> +	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(panel->reset_gpio)) {
> +		dev_err(dev, "failed to get RESET GPIO\n");
> +		return PTR_ERR(panel->reset_gpio);
> +	}
> +	gpiod_set_value(panel->reset_gpio, 0);

Just use devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW) and it will set the gpio to low
in a single operation.

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

Thanks,
Neil
