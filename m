Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B698A755
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 16:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B0410E51B;
	Mon, 30 Sep 2024 14:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QdSMqaeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA6C10E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 14:36:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cae102702so32728995e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727706966; x=1728311766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/zvU2kbXlorom1wXUzluEetYqhKKfZYRsfs5/p/oz1E=;
 b=QdSMqaeqib8W7gJjIZOaXz0gZysnCpoLmuyC9iNhKff8LgUT5zagCQ2IIgQZbdxgtM
 LeHKNOgHTywxCj7VUimQh3tz7NeRsTht2CSVtLmpzvcZmjSq8tMSeDLyPwaXwVjKC2dM
 LEFPhnBmPOK91iWp3mpAxP0KzPTSv1DzRgiUqN7lXVAR1Us7ndJK8AnfdNSUguk6l8jW
 UlRdgY3jedvz8OQ44MM+KOxS23hcvjIECrbQDBj9EL1P8tvFEIXVpl/AUKnjDp79d34l
 gC8lbXY3xHjrvs6HN1IFwutJ/8ihhA7IKRpPcMo7zOUvlTnVmTE5dkOyFeNOlJQZzQTc
 Krwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727706966; x=1728311766;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/zvU2kbXlorom1wXUzluEetYqhKKfZYRsfs5/p/oz1E=;
 b=IZL/F4wmay7iWH4hIT1URo5Edos80cLOhDeZaKgiclL3SlIkHht2EDFDMs75Ggqai4
 8X/9yPA9G7d+uTew10rODxaaV+w0FOGsqt9dgMvsaSMPUhpC9+LL2pqieE1TQESwb8nE
 0WgvgKKKJliqa8m4wqt+mW91qfNZ4RmDwLcg3la8h7ODyy2BZtoSau4ONsGjuQhOu/Ew
 Dcc+zJ0igeiAuUz5vqNa8UHDQiLu17W1NcakC7zI1WwlSJMMFgOc41s/QZU3GeYjIosS
 ZcCydoDTw50DESwJjPMV79WLm4/1ZAN5FaEQY0cnxsGg9fN+jwEj4hi2fs+fQ/z1i7Az
 kOTQ==
X-Gm-Message-State: AOJu0YzOppssLrJcu+XEpGMZy4VXeVZ42uxL9rY/a6W9qNX4MFExdDfN
 9bOT0pLrzskpMaNDbbS2UFBO320psYlg3cd/vlhaVGCXchnraLP1pMUKzBq9z+k=
X-Google-Smtp-Source: AGHT+IHtnl1h8NjpR7ZN2dQkI05xMEAuD6MoJOkcU9SoruKT8gvHc2UYs4pCRSQq9TJ4+k3xY05kFQ==
X-Received: by 2002:a05:600c:1d1f:b0:424:ad14:6b79 with SMTP id
 5b1f17b1804b1-42f58412c63mr95182495e9.8.1727706966309; 
 Mon, 30 Sep 2024 07:36:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828?
 ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57dd2d3bsm104448585e9.2.2024.09.30.07.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 07:36:05 -0700 (PDT)
Message-ID: <608e3af1-6dc3-40d9-a566-fc49d89cd132@linaro.org>
Date: Mon, 30 Sep 2024 16:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add support for S6E3HA8 panel driver
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com>
 <20240926-starqltechn_integration_upstream-v5-2-1cb0e43e623f@gmail.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-2-1cb0e43e623f@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/09/2024 13:29, Dzmitry Sankouski wrote:
> Add support for MIPI-DSI based S6E3HA8 AMOLED panel
> driver. This panel has 1440x2960 resolution, 5.8-inch physical
> size, and can be found in starqltechn device.
> Brightness regulation is not yet supported.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes for v5:
> - return ctx.accum_err instead of 0 where possible
> - switch mipi_dsi_picture_parameter_set to _multi
> - replace msleep with mipi_dsi_msleep
> 
> Changes in v4:
> - inline power related functions
> - rework driver using new mipi_dsi_dcs_write_seq_multi macro
> - use drm_connector_helper_get_modes_fixed for modes
> - remove excessive compression setting
> ---
>   MAINTAINERS                                   |   1 +
>   drivers/gpu/drm/panel/Kconfig                 |   7 ++
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 344 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 353 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc876e3653e7..3c4fa75c8e95 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7392,6 +7392,7 @@ DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
>   M:	Dzmitry Sankouski <dsankouski@gmail.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>   
>   DRM DRIVER FOR SITRONIX ST7586 PANELS
>   M:	David Lechner <david@lechnology.com>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d3a9a9fafe4e..65fb3a466e39 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -689,6 +689,13 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select VIDEOMODE_HELPERS
>   
> +config DRM_PANEL_SAMSUNG_S6E3HA8
> +	tristate "Samsung S6E3HA8 DSI video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +
>   config DRM_PANEL_SAMSUNG_S6E63J0X03
>   	tristate "Samsung S6E63J0X03 DSI command mode panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 987a08702410..8ee28f5a2213 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> new file mode 100644
> index 000000000000..e20cf16a65a5
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +//	Copyright (c) 2013, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_panel.h>
> +
> +struct s6e3ha8 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static inline
> +struct s6e3ha8 *to_s6e3ha8_amb577px01_wqhd(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct s6e3ha8, panel);
> +}
> +
> +#define s6e3ha8_test_key_on_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> +#define s6e3ha8_test_key_off_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> +#define s6e3ha8_test_key_on_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
> +#define s6e3ha8_test_key_off_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
> +#define s6e3ha8_test_key_on_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0xa5, 0xa5)
> +#define s6e3ha8_test_key_off_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0x5a, 0x5a)
> +#define s6e3ha8_afc_off(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xe2, 0x00, 0x00)
> +
> +static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *priv)
> +{
> +	struct mipi_dsi_device *dsi = priv->dsi;
> +	struct device *dev = &dsi->dev;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	s6e3ha8_test_key_on_lvl1(&ctx);
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +
> +	ret = mipi_dsi_compression_mode(dsi, true);

Either use mipi_dsi_compression_mode_ext_multi(&ctx, true, MIPI_DSI_COMPRESSION_DSC, 0)
or add mipi_dsi_compression_mode_multi()

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set compression mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);

Use mipi_dsi_dcs_exit_sleep_mode_multi()

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(5000, 6000);
> +
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x13);
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	usleep_range(10000, 11000);
> +
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x13);
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	/* OMOK setting 1 (Initial setting) - Scaler Latch Setting Guide */
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x07);
> +	/* latch setting 1 : Scaler on/off & address setting & PPS setting -> Image update latch */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x3c, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x0b);
> +	/* latch setting 2 : Ratio change mode -> Image update latch */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x30);
> +	/* OMOK setting 2 - Seamless setting guide : WQHD */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x00, 0x00, 0x05, 0x9f); /* CASET */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x00, 0x00, 0x0b, 0x8f); /* PASET */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x01); /* scaler setup : scaler off */
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00); /* TE Vsync ON */
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xed, 0x4c); /* ERR_FG */
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +	s6e3ha8_test_key_on_lvl3(&ctx);
> +	/* FFC Setting 897.6Mbps */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc5, 0x0d, 0x10, 0xb4, 0x3e, 0x01);
> +	s6e3ha8_test_key_off_lvl3(&ctx);
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9,
> +				   0x00, 0xb0, 0x81, 0x09, 0x00, 0x00, 0x00,
> +				   0x11, 0x03); /* TSP HSYNC Setting */
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf6, 0x43);
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	/* Brightness condition set */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xca,
> +				   0x07, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0x0c); /* AID Set : 0% */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5,
> +				   0x19, 0xdc, 0x16, 0x01, 0x34, 0x67, 0x9a,
> +				   0xcd, 0x01, 0x22, 0x33, 0x44, 0x00, 0x00,
> +				   0x05, 0x55, 0xcc, 0x0c, 0x01, 0x11, 0x11,
> +				   0x10); /* MPS/ELVSS Setting */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf4, 0xeb, 0x28); /* VINT */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf7, 0x03); /* Gamma, LTPS(AID) update */
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int s6e3ha8_enable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = priv->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +
> +	s6e3ha8_test_key_on_lvl1(&ctx);
> +	ctx.accum_err = mipi_dsi_dcs_set_display_on(dsi);

Use mipi_dsi_dcs_set_display_on_multi

> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int s6e3ha8_disable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = priv->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +
> +	s6e3ha8_test_key_on_lvl1(&ctx);
> +	ctx.accum_err = mipi_dsi_dcs_set_display_off(dsi);

Use mipi_dsi_dcs_set_display_off_multi

> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +	mipi_dsi_msleep(&ctx, 20);
> +
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	s6e3ha8_afc_off(&ctx);
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 160);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = priv->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
> +	if (ret < 0)
> +		return ret;
> +	mipi_dsi_msleep(&ctx, 120);
> +	s6e3ha8_amb577px01_wqhd_reset(priv);
> +
> +	ret = s6e3ha8_amb577px01_wqhd_on(priv);
> +	if (ret < 0) {
> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		goto err;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
> +
> +	s6e3ha8_test_key_on_lvl1(&ctx);
> +	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 28);
> +
> +	return ctx.accum_err;
> +err:
> +	regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies);
> +	return ret;
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
> +
> +	return regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies);
> +}
> +
> +static const struct drm_display_mode s6e3ha8_amb577px01_wqhd_mode = {
> +	.clock = (1440 + 116 + 44 + 120) * (2960 + 120 + 80 + 124) * 60 / 1000,
> +	.hdisplay = 1440,
> +	.hsync_start = 1440 + 116,
> +	.hsync_end = 1440 + 116 + 44,
> +	.htotal = 1440 + 116 + 44 + 120,
> +	.vdisplay = 2960,
> +	.vsync_start = 2960 + 120,
> +	.vsync_end = 2960 + 120 + 80,
> +	.vtotal = 2960 + 120 + 80 + 124,
> +	.width_mm = 64,
> +	.height_mm = 132,
> +};
> +
> +static int s6e3ha8_amb577px01_wqhd_get_modes(struct drm_panel *panel,
> +					     struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &s6e3ha8_amb577px01_wqhd_mode);
> +}
> +
> +static const struct drm_panel_funcs s6e3ha8_amb577px01_wqhd_panel_funcs = {
> +	.prepare = s6e3ha8_amb577px01_wqhd_prepare,
> +	.unprepare = s6e3ha8_amb577px01_wqhd_unprepare,
> +	.get_modes = s6e3ha8_amb577px01_wqhd_get_modes,
> +	.enable = s6e3ha8_enable,
> +	.disable = s6e3ha8_disable,
> +};
> +
> +static int s6e3ha8_amb577px01_wqhd_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e3ha8 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->supplies[0].supply = "vdd3";
> +	priv->supplies[1].supply = "vci";
> +	priv->supplies[2].supply = "vddr";
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies),
> +				      priv->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get regulators: %d\n", ret);
> +		return ret;
> +	}

Perhaps you can try to switch to devm_regulator_bulk_get_const()

> +
> +	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	drm_panel_init(&priv->panel, dev, &s6e3ha8_amb577px01_wqhd_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	priv->panel.prepare_prev_first = true;
> +
> +	drm_panel_add(&priv->panel);
> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc = &priv->dsc;
> +
> +	priv->dsc.dsc_version_major = 1;
> +	priv->dsc.dsc_version_minor = 1;
> +
> +	priv->dsc.slice_height = 40;
> +	priv->dsc.slice_width = 720;
> +	WARN_ON(1440 % priv->dsc.slice_width);
> +	priv->dsc.slice_count = 1440 / priv->dsc.slice_width;
> +	priv->dsc.bits_per_component = 8;
> +	priv->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +	priv->dsc.block_pred_enable = true;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&priv->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void s6e3ha8_amb577px01_wqhd_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e3ha8 *priv = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&priv->panel);
> +}
> +
> +static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> +	{ .compatible = "samsung,s6e3ha8" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3ha8_amb577px01_wqhd_of_match);
> +
> +static struct mipi_dsi_driver s6e3ha8_amb577px01_wqhd_driver = {
> +	.probe = s6e3ha8_amb577px01_wqhd_probe,
> +	.remove = s6e3ha8_amb577px01_wqhd_remove,
> +	.driver = {
> +		.name = "panel-s6e3ha8",
> +		.of_match_table = s6e3ha8_amb577px01_wqhd_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3ha8_amb577px01_wqhd_driver);
> +
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for S6E3HA8 panel");
> +MODULE_LICENSE("GPL");
> 

With that fixes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
