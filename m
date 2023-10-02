Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1A7B4BBA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 08:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E230610E13C;
	Mon,  2 Oct 2023 06:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBC310E13C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 06:53:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40537481094so165113955e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Oct 2023 23:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696229631; x=1696834431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WrjWJhKeOAkid65L4hC3MT3PVVLWH4geZbbFbv5rxx4=;
 b=Au/b/tT62oQ6V1PKjCAjTacEl7D7hbACVCIyBxw5rrU7zZYI/4LatwYsDA0ePlHYE5
 e5N0i4pUqu4J7ZrqqyoBlPxj39tLntStkA8NlbftqkqCXPfp/gwttywL1kLxK5S04+os
 j9uWiuRqFFIo5eob2ro2J6Ixk90cgpM0qiElU2vgNAe9Rvu6908KuBsg0aMDzEDfG858
 SMv90heN3LHb/Pp4g4YZ1ErXZGfVPzh2tLx2PvK3xGbWVpczLdP+RzzN/c5xnv6vi2Nh
 i6UffpJ37d/sfmqL8kv679lpzfwmoNKzMpjz6pYEQSIweQtB7liKhjCas59aVYWpZvRn
 7nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696229631; x=1696834431;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WrjWJhKeOAkid65L4hC3MT3PVVLWH4geZbbFbv5rxx4=;
 b=ESIIkCUzqs3Y+YQ2XKzAm4rtw/HBhov69RiJHUOpPKEdVzha0ElZ0QrmBbzNJd4il2
 sFM4gru/CnHUDbnFr9BfZxyDW6W6M53c6QKFDpbaqRizlVzad6BDhd+/LsW37liOzdbU
 4OsEK/lnwehaAa4r0/xe/V1zvStHVAAT7QJbregyox1GGAMP6BqnUwMHEGz+OwJJPJtE
 PZAUKZ3uwI+/rDHT8lhsyex9mveySF8kPgDaISlCAY6nKzdxiuY0pTUuBJtWcsR4rlCq
 vWpJjvDBofV4MqE0qCJmHZJNo6GMwmkOqhan39UzKgzlZe5ZfWpgwpBVrqUkP8o1PYSv
 ybDQ==
X-Gm-Message-State: AOJu0Yy4LqqXhVyj9vQGSbQ+g7ourZDLVUeLvv4moYoca9uOfybvACBF
 UGzNsbuHnOzFH7aNWRxkzZ1i5g==
X-Google-Smtp-Source: AGHT+IEwbU1dI4/Xd0GBlkCiyhkDonCNIJ1Yq702agKxozkMhsqhUjlRGENpayznyDpRQDXH/aPsCA==
X-Received: by 2002:a05:600c:210e:b0:401:bdf9:c336 with SMTP id
 u14-20020a05600c210e00b00401bdf9c336mr9313746wml.27.1696229631224; 
 Sun, 01 Oct 2023 23:53:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b653:7e47:ffdd:9340?
 ([2a01:e0a:982:cbb0:b653:7e47:ffdd:9340])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1cf314000000b00401b242e2e6sm6504319wmq.47.2023.10.01.23.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 23:53:50 -0700 (PDT)
Message-ID: <b1ac674c-c667-4dd5-908c-4834e44bde88@linaro.org>
Date: Mon, 2 Oct 2023 08:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for BOE RM692E5 AMOLED panel
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
 <20230927-topic-fp5_disp-v2-2-7b5e1d1662a6@linaro.org>
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
In-Reply-To: <20230927-topic-fp5_disp-v2-2-7b5e1d1662a6@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2023 14:54, Konrad Dybcio wrote:
> Add support for the 2700x1224 AMOLED BOE panel bundled with a RM692E5
> driver IC, as found on the Fairphone 5 smartphone.
> 
> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 423 ++++++++++++++++++++++++++
>   3 files changed, 433 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2d6d96ee3547..ecb22ea326cb 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -516,6 +516,15 @@ config DRM_PANEL_RAYDIUM_RM68200
>   	  Say Y here if you want to enable support for Raydium RM68200
>   	  720x1280 DSI video mode panel.
>   
> +config DRM_PANEL_RAYDIUM_RM692E5
> +	tristate "Raydium RM692E5-based DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Raydium RM692E5-based
> +	  display panels, such as the one found in the Fairphone 5 smartphone.
> +
>   config DRM_PANEL_RONBO_RB070D30
>   	tristate "Ronbo Electronics RB070D30 panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 157c77ff157f..e14ce55a0875 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
>   obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen.o
>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
> +obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> new file mode 100644
> index 000000000000..a613ba5b816c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2023 Linaro Limited
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct rm692e5_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct regulator_bulk_data supplies[3];
> +	struct gpio_desc *reset_gpio;
> +	bool prepared;
> +};
> +
> +static inline struct rm692e5_panel *to_rm692e5_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct rm692e5_panel, panel);
> +}
> +
> +static void rm692e5_reset(struct rm692e5_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int rm692e5_on(struct rm692e5_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x41);
> +	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x16);
> +	mipi_dsi_generic_write_seq(dsi, 0x8a, 0x87);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x71);
> +	mipi_dsi_generic_write_seq(dsi, 0x82, 0x01);
> +	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x2c);
> +	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x64);
> +	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x3c);
> +	mipi_dsi_generic_write_seq(dsi, 0xca, 0x80);
> +	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x02);
> +	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x02);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
> +	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
> +	mipi_dsi_generic_write_seq(dsi, 0x00, 0xff);
> +	mipi_dsi_generic_write_seq(dsi, 0x01, 0xff);
> +	mipi_dsi_generic_write_seq(dsi, 0x02, 0xcf);
> +	mipi_dsi_generic_write_seq(dsi, 0x03, 0xbc);
> +	mipi_dsi_generic_write_seq(dsi, 0x04, 0xb9);
> +	mipi_dsi_generic_write_seq(dsi, 0x05, 0x99);
> +	mipi_dsi_generic_write_seq(dsi, 0x06, 0x02);
> +	mipi_dsi_generic_write_seq(dsi, 0x07, 0x0a);
> +	mipi_dsi_generic_write_seq(dsi, 0x08, 0xe0);
> +	mipi_dsi_generic_write_seq(dsi, 0x09, 0x4c);
> +	mipi_dsi_generic_write_seq(dsi, 0x0a, 0xeb);
> +	mipi_dsi_generic_write_seq(dsi, 0x0b, 0xe8);
> +	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x32);
> +	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x07);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
> +	mipi_dsi_generic_write_seq(dsi, 0x0d, 0xc0);
> +	mipi_dsi_generic_write_seq(dsi, 0x0e, 0xff);
> +	mipi_dsi_generic_write_seq(dsi, 0x0f, 0xff);
> +	mipi_dsi_generic_write_seq(dsi, 0x10, 0x33);
> +	mipi_dsi_generic_write_seq(dsi, 0x11, 0x6f);
> +	mipi_dsi_generic_write_seq(dsi, 0x12, 0x6e);
> +	mipi_dsi_generic_write_seq(dsi, 0x13, 0xa6);
> +	mipi_dsi_generic_write_seq(dsi, 0x14, 0x80);
> +	mipi_dsi_generic_write_seq(dsi, 0x15, 0x02);
> +	mipi_dsi_generic_write_seq(dsi, 0x16, 0x38);
> +	mipi_dsi_generic_write_seq(dsi, 0x17, 0xd3);
> +	mipi_dsi_generic_write_seq(dsi, 0x18, 0x3a);
> +	mipi_dsi_generic_write_seq(dsi, 0x19, 0xba);
> +	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xcc);
> +	mipi_dsi_generic_write_seq(dsi, 0x1b, 0x01);
> +
> +	ret = mipi_dsi_dcs_nop(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to nop: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(32);
> +
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
> +	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xd1);
> +	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x01);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf9);
> +	mipi_dsi_generic_write_seq(dsi, 0x00, 0xaf);
> +	mipi_dsi_generic_write_seq(dsi, 0x1d, 0x37);
> +	mipi_dsi_generic_write_seq(dsi, 0x44, 0x0a, 0x7b);
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xfa, 0x01);
> +	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x08);
> +	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0x51, 0x05, 0x42);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(100);
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
> +static int rm692e5_disable(struct drm_panel *panel)
> +{
> +	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static int rm692e5_prepare(struct drm_panel *panel)
> +{
> +	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
> +	struct drm_dsc_picture_parameter_set pps;
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
> +	rm692e5_reset(ctx);
> +
> +	ret = rm692e5_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_compression_mode(ctx->dsi, true);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable compression mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(28);
> +
> +	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x40);
> +
> +	/* 0x05 -> 90Hz, 0x00 -> 60Hz */
> +	mipi_dsi_generic_write_seq(ctx->dsi, 0xbd, 0x05);
> +
> +	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x00);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +}
> +
> +static int rm692e5_unprepare(struct drm_panel *panel)
> +{
> +	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode rm692e5_mode = {
> +	.clock = (1224 + 32 + 8 + 8) * (2700 + 8 + 2 + 8) * 90 / 1000,
> +	.hdisplay = 1224,
> +	.hsync_start = 1224 + 32,
> +	.hsync_end = 1224 + 32 + 8,
> +	.htotal = 1224 + 32 + 8 + 8,
> +	.vdisplay = 2700,
> +	.vsync_start = 2700 + 8,
> +	.vsync_end = 2700 + 8 + 2,
> +	.vtotal = 2700 + 8 + 2 + 8,
> +	.width_mm = 68,
> +	.height_mm = 150,
> +};
> +
> +static int rm692e5_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &rm692e5_mode);
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
> +static const struct drm_panel_funcs rm692e5_panel_funcs = {
> +	.prepare = rm692e5_prepare,
> +	.unprepare = rm692e5_unprepare,
> +	.disable = rm692e5_disable,
> +	.get_modes = rm692e5_get_modes,
> +};
> +
> +static int rm692e5_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int rm692e5_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops rm692e5_bl_ops = {
> +	.update_status = rm692e5_bl_update_status,
> +	.get_brightness = rm692e5_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +rm692e5_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 4095,
> +		.max_brightness = 4095,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &rm692e5_bl_ops, &props);
> +}
> +
> +static int rm692e5_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct rm692e5_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vddio";
> +	ctx->supplies[1].supply = "dvdd";
> +	ctx->supplies[2].supply = "vci";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
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
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &rm692e5_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = rm692e5_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc = &ctx->dsc;
> +
> +	/* TODO: Pass slice_per_pkt = 2 */
> +	ctx->dsc.dsc_version_major = 1;
> +	ctx->dsc.dsc_version_minor = 1;
> +	ctx->dsc.slice_height = 60;
> +	ctx->dsc.slice_width = 1224;
> +
> +	ctx->dsc.slice_count = 1224 / ctx->dsc.slice_width;
> +	ctx->dsc.bits_per_component = 8;
> +	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +	ctx->dsc.block_pred_enable = true;
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
> +static void rm692e5_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct rm692e5_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id rm692e5_of_match[] = {
> +	{ .compatible = "fairphone,fp5-rm692e5-boe" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rm692e5_of_match);
> +
> +static struct mipi_dsi_driver rm692e5_driver = {
> +	.probe = rm692e5_probe,
> +	.remove = rm692e5_remove,
> +	.driver = {
> +		.name = "panel-rm692e5-boe-amoled",
> +		.of_match_table = rm692e5_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(rm692e5_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for rm692e5-equipped DSI panels");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
