Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6F80C342
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29CF10E363;
	Mon, 11 Dec 2023 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ADC10E362
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:31:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3360ae2392eso2498318f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 00:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702283465; x=1702888265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hie7kqfhoG7lLXMPfWzBdiLzHzMSgpaIfadLIpcPChE=;
 b=RqVOrKg0wu+IVQ+izv0dHsIqq6aEFO8lHoRnXPb/lsb2U25j76QWZUjqpf42yH80w0
 Cv9MxKuLiiN2aapF8q9O8XNxLdfODpYGT12QcR3TgxMK26GJqGR6eHiRtijc0Wn3nELp
 MtHd6NwQxZVJVzaZzK9PEAdSBtcQ96NWlRAABsxWUOcMqPtFjbLnpMgS4Lw3e/YCb2nr
 4QjIIrNaVyI/6SfXafXY8duU4gAQ8LgcSyp0RcMBVRVgeTSsmfBjDAHIA7GdbNZvLfNR
 WLAP0TQSuZD9KCLH9D+5xX+BDp+JKKloAer5rlmgyIuZQ2B190bvz9nAa/+fXPCGddPF
 vHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702283465; x=1702888265;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hie7kqfhoG7lLXMPfWzBdiLzHzMSgpaIfadLIpcPChE=;
 b=WvdwMFvGFq4HIyim6sdhqmg0gZECRCGjiTJ1+H1kD6V5kYVk371Ok7HQ8XIl/QfUcg
 +0F47fFpzl0IhS6f1WStnrOD9BeLG88lqu54b4jPAlEjOD6eWqDEzjVHwWzZrOVIZnrS
 9Suv+kA6ChhG8ifjqxv0CN8IplRJBtvWGi35hpTmG/5Wp0FEGFKX/MN+rur1wL46LiB+
 2fzsKMoxHeBtNIkSOdObHQAfGczH8SKYXWHU5kn7l+aowR/G2FsGZzl5Ps+6kDCC4iZr
 K1HSmqsHTV+FQOaYwI3XLIp1FyMdlztx/CQonyhvq9PRSFJszilwM6LbGjrqr9e2XYxi
 VM4g==
X-Gm-Message-State: AOJu0Yw6v5SAcMOCzYsQz2m1pkXFoTw2FlQS8atTsQt8QEYW8Qkp4M5e
 nfTd8S7hHT5FNar5JiptZpS0tQ==
X-Google-Smtp-Source: AGHT+IGUQ0HGb5kWy0anjHtRi26aiWW/FOIqhMsIpaewZURKuvomRXG81Lskb2fJ6gQOyKu/ktUB3Q==
X-Received: by 2002:a5d:4b50:0:b0:333:5460:adb4 with SMTP id
 w16-20020a5d4b50000000b003335460adb4mr2188608wrs.22.1702283465038; 
 Mon, 11 Dec 2023 00:31:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23?
 ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056000118d00b003333d46a9e8sm7955435wrx.56.2023.12.11.00.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 00:31:04 -0800 (PST)
Message-ID: <de48dc10-e7c5-441f-9e2f-8c4c9129a645@linaro.org>
Date: Mon, 11 Dec 2023 09:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 08/10] drm/panel: Add Ilitek ILI9805 panel driver
Content-Language: en-US, fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
 <20231207141723.108004-9-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20231207141723.108004-9-dario.binacchi@amarulasolutions.com>
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
> The GPM1790A0 panel is based on the Ilitek ILI9805 Controller.
> Add a driver for it.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Remove duplicated code for prepare/unprepare callbacks
> 
>   MAINTAINERS                                  |   6 +
>   drivers/gpu/drm/panel/Kconfig                |   9 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 353 +++++++++++++++++++
>   4 files changed, 369 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b82dc141d209..4dccc72a0ed6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6646,6 +6646,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
>   F:	drivers/gpu/drm/tiny/ili9486.c
>   
> +DRM DRIVER FOR ILITEK ILI9805 PANELS
> +M:	Michael Trimarchi <michael@amarulasolutions.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
> +F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
> +
>   DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
>   M:	Jagan Teki <jagan@edgeble.ai>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d018702be3dc..dad938cf6dec 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -194,6 +194,15 @@ config DRM_PANEL_ILITEK_ILI9341
>   	  QVGA (240x320) RGB panels. support serial & parallel rgb
>   	  interface.
>   
> +config DRM_PANEL_ILITEK_ILI9805
> +	tristate "Ilitek ILI9805-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI9805 controller.
> +
>   config DRM_PANEL_ILITEK_ILI9881C
>   	tristate "Ilitek ILI9881C-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f267d932c2b5..d94a644d0a6c 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
> new file mode 100644
> index 000000000000..e36984b46e14
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
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
> +#define ILI9805_EXTCMD_CMD_SET_ENABLE_REG	(0xff)
> +#define ILI9805_SETEXTC_PARAMETER1		(0xff)
> +#define ILI9805_SETEXTC_PARAMETER2		(0x98)
> +#define ILI9805_SETEXTC_PARAMETER3		(0x05)
> +
> +#define ILI9805_INSTR(_delay, ...) { \
> +		.delay = (_delay), \
> +		.len = sizeof((u8[]) {__VA_ARGS__}), \
> +		.data = (u8[]){__VA_ARGS__} \
> +	}
> +
> +struct ili9805_instr {
> +	size_t len;
> +	const u8 *data;
> +	u32 delay;
> +};
> +
> +struct ili9805_desc {
> +	const char *name;
> +	const struct ili9805_instr *init;
> +	const size_t init_length;
> +	const struct drm_display_mode *mode;
> +	u32 width_mm;
> +	u32 height_mm;
> +};
> +
> +struct ili9805 {
> +	struct drm_panel	panel;
> +	struct mipi_dsi_device	*dsi;
> +	const struct ili9805_desc	*desc;
> +
> +	struct regulator	*dvdd;
> +	struct regulator	*avdd;
> +	struct gpio_desc	*reset_gpio;
> +};
> +
> +static const struct ili9805_instr gpm1780a0_init[] = {
> +	ILI9805_INSTR(100, ILI9805_EXTCMD_CMD_SET_ENABLE_REG, ILI9805_SETEXTC_PARAMETER1,
> +		      ILI9805_SETEXTC_PARAMETER2, ILI9805_SETEXTC_PARAMETER3),
> +	ILI9805_INSTR(100, 0xFD, 0x0F, 0x10, 0x44, 0x00),
> +	ILI9805_INSTR(0, 0xf8, 0x18, 0x02, 0x02, 0x18, 0x02, 0x02, 0x30, 0x00,
> +		      0x00, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00),
> +	ILI9805_INSTR(0, 0xB8, 0x62),
> +	ILI9805_INSTR(0, 0xF1, 0x00),
> +	ILI9805_INSTR(0, 0xF2, 0x00, 0x58, 0x40),
> +	ILI9805_INSTR(0, 0xF3, 0x60, 0x83, 0x04),
> +	ILI9805_INSTR(0, 0xFC, 0x04, 0x0F, 0x01),
> +	ILI9805_INSTR(0, 0xEB, 0x08, 0x0F),
> +	ILI9805_INSTR(0, 0xe0, 0x00, 0x08, 0x0d, 0x0e, 0x0e, 0x0d, 0x0a, 0x08, 0x04,
> +		      0x08, 0x0d, 0x0f, 0x0b, 0x1c, 0x14, 0x0a),
> +	ILI9805_INSTR(0, 0xe1, 0x00, 0x08, 0x0d, 0x0e, 0x0e, 0x0d, 0x0a, 0x08, 0x04,
> +		      0x08, 0x0d, 0x0f, 0x0b, 0x1c, 0x14, 0x0a),
> +	ILI9805_INSTR(10, 0xc1, 0x13, 0x39, 0x19, 0x06),
> +	ILI9805_INSTR(10, 0xc7, 0xe5),
> +	ILI9805_INSTR(10, 0xB1, 0x00, 0x12, 0x14),
> +	ILI9805_INSTR(10, 0xB4, 0x02),
> +	ILI9805_INSTR(0, 0xBB, 0x14, 0x55),
> +	ILI9805_INSTR(0, MIPI_DCS_SET_ADDRESS_MODE, 0x08),
> +	ILI9805_INSTR(0, MIPI_DCS_SET_PIXEL_FORMAT, 0x77),
> +	ILI9805_INSTR(0, 0x20),
> +	ILI9805_INSTR(0, 0xB0, 0x01),
> +	ILI9805_INSTR(0, 0xB6, 0x31, 0x00, 0xef),
> +	ILI9805_INSTR(0, 0xDF, 0x23),
> +	ILI9805_INSTR(0, 0xB9, 0x02, 0x00),
> +};
> +
> +static inline struct ili9805 *panel_to_ili9805(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili9805, panel);
> +}
> +
> +static int ili9805_power_on(struct ili9805 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = regulator_enable(ctx->avdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable avdd regulator (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(ctx->dvdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dvdd regulator (%d)\n", ret);
> +		regulator_disable(ctx->avdd);
> +		return ret;
> +	}
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(5000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int ili9805_power_off(struct ili9805 *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	regulator_disable(ctx->dvdd);
> +	regulator_disable(ctx->avdd);
> +
> +	return 0;
> +}
> +
> +static int ili9805_activate(struct ili9805 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int i, ret;
> +
> +	for (i = 0; i < ctx->desc->init_length; i++) {
> +		const struct ili9805_instr *instr = &ctx->desc->init[i];
> +
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, instr->data, instr->len);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (instr->delay > 0)
> +			msleep(instr->delay);
> +	}
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
> +	if (ret) {
> +		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(5000, 6000);
> +
> +	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	if (ret) {
> +		dev_err(dev, "Failed to set display ON (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9805_prepare(struct drm_panel *panel)
> +{
> +	struct ili9805 *ctx = panel_to_ili9805(panel);
> +	int ret;
> +
> +	ret = ili9805_power_on(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = ili9805_activate(ctx);
> +	if (ret) {
> +		ili9805_power_off(ctx);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9805_deactivate(struct ili9805 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(5000, 10000);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9805_unprepare(struct drm_panel *panel)
> +{
> +	struct ili9805 *ctx = panel_to_ili9805(panel);
> +
> +	ili9805_deactivate(ctx);
> +	ili9805_power_off(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode gpm1780a0_timing = {
> +	.clock = 26227,
> +
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 10,
> +	.hsync_end = 480 + 10 + 2,
> +	.htotal = 480 + 10 + 2 + 36,
> +
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 2,
> +	.vsync_end = 480 + 10 + 4,
> +	.vtotal = 480 + 2 + 4 + 10,
> +};
> +
> +static int ili9805_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili9805 *ctx = panel_to_ili9805(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
> +	if (!mode) {
> +		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> +			ctx->desc->mode->hdisplay,
> +			ctx->desc->mode->vdisplay,
> +			drm_mode_vrefresh(ctx->desc->mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs ili9805_funcs = {
> +	.prepare	= ili9805_prepare,
> +	.unprepare	= ili9805_unprepare,
> +	.get_modes	= ili9805_get_modes,
> +};
> +
> +static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct ili9805 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +	ctx->desc = of_device_get_match_data(&dsi->dev);
> +
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
> +	dsi->lanes = 2;
> +
> +	drm_panel_init(&ctx->panel, &dsi->dev, &ili9805_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
> +	if (IS_ERR(ctx->dvdd))
> +		return PTR_ERR(ctx->dvdd);
> +	ctx->avdd = devm_regulator_get(&dsi->dev, "avdd");
> +	if (IS_ERR(ctx->avdd))
> +		return PTR_ERR(ctx->avdd);
> +
> +	ctx->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	ctx->panel.prepare_prev_first = true;
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(&dsi->dev, "mipi_dsi_attach failed: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ili9805_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ili9805 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
> +			ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct ili9805_desc gpm1780a0_desc = {
> +	.init = gpm1780a0_init,
> +	.init_length = ARRAY_SIZE(gpm1780a0_init),
> +	.mode = &gpm1780a0_timing,
> +	.width_mm = 65,
> +	.height_mm = 65,
> +};
> +
> +static const struct of_device_id ili9805_of_match[] = {
> +	{ .compatible = "giantplus,gpm1790a0", .data = &gpm1780a0_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9805_of_match);
> +
> +static struct mipi_dsi_driver ili9805_dsi_driver = {
> +	.probe		= ili9805_dsi_probe,
> +	.remove		= ili9805_dsi_remove,
> +	.driver = {
> +		.name		= "ili9805-dsi",
> +		.of_match_table	= ili9805_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ili9805_dsi_driver);
> +
> +MODULE_AUTHOR("Matthias Proske <Matthias.Proske@bshg.com>");
> +MODULE_AUTHOR("Michael Trimarchi <michael@amarulasolutions.com>");
> +MODULE_DESCRIPTION("Ilitek ILI9805 Controller Driver");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
