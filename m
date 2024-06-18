Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A890DBB4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 20:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905210E0D5;
	Tue, 18 Jun 2024 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OABaVC6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCAD10E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 18:39:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c8c0d73d3so6040185e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718735958; x=1719340758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+FwDjBzxOyA5K9+61SDRjXbz7t/PybP6aQR55s+tXa8=;
 b=OABaVC6y3X9LQn+mMFQ6lM678ZRp6aE8zuhnvBsejmcmQQ7jEGMEezG0vL5N47KPEP
 tiH1fChi5vuRvMhvfKY8KpSLkJKARpxvkzLD8VH87kc/bCJpLAdImLLE5AW22lcgDu3W
 vzp0anyPd9po/CfRQfmU2o82/Grv0BfZH4RXOgUTf8py3fe91nwPWr49gDA4bJZSJStu
 HiilhsapCI1ordvBsGez7SqV8OsVmmjvECQMJ8ccntGy7SuRJ4dfVmFSMyA+i0TRrIDC
 fWGzMDaJU6u++Xk0srnAITemXClSyXF8QoNOEXtv+dBfiBulCUEW9cO8WHtAy3tB4N+u
 HbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718735958; x=1719340758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FwDjBzxOyA5K9+61SDRjXbz7t/PybP6aQR55s+tXa8=;
 b=WqJRn/74NlJ3qTxnEoBL7d91iNSu/dFlSV+wxUZftSCu4VnJcZtuKedXkU6ruJzxHh
 i/HD7DQpaRP02tXwNE7Hrc3cibE5k4ZrmOIo9QCenzI+qpGtGBGKig7fV8TAjn/V0iW7
 vOJJ9PXKz1vJMSnlTncEolMRL3vtPVC/DcDvYDu21EWW8TeFjXsdrpgE/hl0lkYWMRmp
 U38mDkKtoUolDS/nJLAdtNSwVqR/bE4h8mt+EidMj7z5rCMzsh6AHlekZW3B5vxtnvrA
 E5jvI5jq3dON/HmNebindzzGOJTw5gumZfuNLVaFlQGZyiLcTmidH9bsMxYz1Y44Fh2r
 Gbgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHH6dp9mwzWCfBLkvgvG0ixg+Z+93PzkRLuKdvIMSwS0x5ZPVTjOE1p/i7ybjN4nPDkhpJ2iroIppSBVpIFHnG0EbxPBM9vLUGKxrPu2K6
X-Gm-Message-State: AOJu0YwfB5Ak0JbEhAFdllWHKqS3AGSCPrx5n7ofeqvqy/gm6H16UmZp
 tZjLkBwT2nv6Iz+KawSCqTor5NqjvoT83lk6P6QUeXkJwBeEEYPAOKebTtGS+Qg=
X-Google-Smtp-Source: AGHT+IHNJLZtrdVemSmcP9/vodwRV/x124sIZ1p+XWWDZ77OnquiYe6x9ozhXl/rnfxO7zDFAtaYZQ==
X-Received: by 2002:a05:6512:3c9e:b0:52b:82d5:8fd2 with SMTP id
 2adb3069b0e04-52ccaa97444mr341031e87.47.1718735957403; 
 Tue, 18 Jun 2024 11:39:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825922sm1575728e87.26.2024.06.18.11.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 11:39:17 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:39:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 11/23] drm/panel: Add support for S6E3HA8 panel driver
Message-ID: <pkmxbxoc4sno6mbjsftz6hp5lxefc6yhwxjlhiy2pd4wbkzpvl@as43z4t64mm6>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-11-e3f6662017ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-11-e3f6662017ac@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 18, 2024 at 04:59:45PM GMT, Dzmitry Sankouski wrote:
> Add support for MIPI-DSI based S6E3HA8 AMOLED panel
> driver. This panel has 1440x2960 resolution, 5.8-inch physical
> size, and can be found in starqltechn device.
> Brightness regulation is not yet supported.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |   7 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 426 ++++++++++++++++++++++++++
>  4 files changed, 435 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92a5d0a56353..fae3b8ea9ce4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7154,6 +7154,7 @@ DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
>  M:	Dzmitry Sankouski <dsankouski@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>  
>  DRM DRIVER FOR SITRONIX ST7586 PANELS
>  M:	David Lechner <david@lechnology.com>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2ae0eb0638f3..903fc8c155c0 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -651,6 +651,13 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	select VIDEOMODE_HELPERS
>  
> +config DRM_PANEL_SAMSUNG_S6E3HA8
> +	tristate "Samsung S6E3HA8 DSI video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +
>  config DRM_PANEL_SAMSUNG_S6E63J0X03
>  	tristate "Samsung S6E63J0X03 DSI command mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f0203f6e02f4..71774cc5820a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> new file mode 100644
> index 000000000000..49d629643171
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *  Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
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
> +#include <drm/drm_modes.h>
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
> +#define s6e3ha8_call_write_func(ret, func) do {	\
> +	ret = (func);				\
> +	if (ret < 0)				\
> +		return ret;			\
> +} while (0)

Please rework the driver to use mipi_dsi_*_multi() family of functions.
Using the mipi_dsi_multi_context should make this wrapper obsolete too.

> +
> +static int s6e3ha8_test_key_on_lvl1(struct mipi_dsi_device *dsi)
> +{
> +	static const u8 d[] = { 0x9f, 0xa5, 0xa5 };
> +
> +	return mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));
> +	return 0;

Ugh. So which return is it?

> +}
> +

[...]
> +static int s6e3ha8_power_on(struct s6e3ha8 *ctx)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);

Inline this function, it's just regulator_bulk_enable() in the end.

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int s6e3ha8_power_off(struct s6e3ha8 *ctx)
> +{
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	s6e3ha8_test_key_on_lvl1(dsi);
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +
> +	ret = mipi_dsi_compression_mode(dsi, true);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set compression mode: %d\n", ret);
> +		return ret;
> +	}

Interesting, compression mode is being set before the PPS programming?

> +
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(5000, 6000);
> +
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xf2, 0x13);
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +
> +	usleep_range(10000, 11000);
> +
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xf2, 0x13);
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +
> +	/* OMOK setting 1 (Initial setting) - Scaler Latch Setting Guide */
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x07);
> +	/* latch setting 1 : Scaler on/off & address setting & PPS setting -> Image update latch */
> +	mipi_dsi_generic_write_seq(dsi, 0xf2, 0x3c, 0x10);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x0b);
> +	/* latch setting 2 : Ratio change mode -> Image update latch */
> +	mipi_dsi_generic_write_seq(dsi, 0xf2, 0x30);
> +	/* OMOK setting 2 - Seamless setting guide : WQHD */
> +	mipi_dsi_generic_write_seq(dsi, 0x2a, 0x00, 0x00, 0x05, 0x9f); /* CASET */
> +	mipi_dsi_generic_write_seq(dsi, 0x2b, 0x00, 0x00, 0x0b, 0x8f); /* PASET */
> +	mipi_dsi_generic_write_seq(dsi, 0xba, 0x01); /* scaler setup : scaler off */
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00); /* TE Vsync ON */
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xed, 0x4c); /* ERR_FG */
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +	s6e3ha8_test_key_on_lvl3(dsi);
> +	/* FFC Setting 897.6Mbps */
> +	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x0d, 0x10, 0xb4, 0x3e, 0x01);
> +	s6e3ha8_test_key_off_lvl3(dsi);
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xb9,
> +				   0x00, 0xb0, 0x81, 0x09, 0x00, 0x00, 0x00,
> +				   0x11, 0x03); /* TSP HSYNC Setting */
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +	mipi_dsi_generic_write_seq(dsi, 0xf6, 0x43);
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +	s6e3ha8_test_key_on_lvl2(dsi);
> +	/* Brightness condition set */
> +	mipi_dsi_generic_write_seq(dsi, 0xca,
> +				   0x07, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				   0x80, 0x80, 0x80, 0x00, 0x00, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x00, 0x0c); /* AID Set : 0% */
> +	mipi_dsi_generic_write_seq(dsi, 0xb5,
> +				   0x19, 0xdc, 0x16, 0x01, 0x34, 0x67, 0x9a,
> +				   0xcd, 0x01, 0x22, 0x33, 0x44, 0x00, 0x00,
> +				   0x05, 0x55, 0xcc, 0x0c, 0x01, 0x11, 0x11,
> +				   0x10); /* MPS/ELVSS Setting */
> +	mipi_dsi_generic_write_seq(dsi, 0xf4, 0xeb, 0x28); /* VINT */
> +	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x03); /* Gamma, LTPS(AID) update */
> +	s6e3ha8_test_key_off_lvl2(dsi);
> +	s6e3ha8_test_key_off_lvl1(dsi);
> +
> +	return 0;
> +}
> +
> +static int s6e3ha8_enable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *ctx = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret;
> +
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_on_lvl1(dsi));
> +	s6e3ha8_call_write_func(ret, mipi_dsi_dcs_set_display_on(dsi));
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_off_lvl1(dsi));
> +
> +	return 0;
> +}
> +
> +static int s6e3ha8_disable(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *ctx = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret;
> +
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_on_lvl1(dsi));
> +	s6e3ha8_call_write_func(ret, mipi_dsi_dcs_set_display_off(dsi));
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_off_lvl1(dsi));
> +	msleep(20);
> +
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_on_lvl2(dsi));
> +	s6e3ha8_call_write_func(ret, s6e3ha8_afc_off(dsi));
> +	s6e3ha8_call_write_func(ret, s6e3ha8_test_key_off_lvl2(dsi));
> +
> +	msleep(160);
> +
> +	return 0;
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *ctx = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	s6e3ha8_power_on(ctx);
> +	msleep(120);
> +	s6e3ha8_amb577px01_wqhd_reset(ctx);
> +	ret = s6e3ha8_amb577px01_wqhd_on(ctx);
> +
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		goto err;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	s6e3ha8_test_key_on_lvl1(dsi);
> +	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +	s6e3ha8_test_key_off_lvl1(dsi);
> +
> +	ret = mipi_dsi_compression_mode(ctx->dsi, true);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable compression mode: %d\n", ret);
> +		return ret;
> +	}

Again?

> +
> +
> +	msleep(28);
> +
> +	return 0;
> +err:
> +	s6e3ha8_power_off(ctx);
> +	return ret;
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *ctx = to_s6e3ha8_amb577px01_wqhd(panel);
> +
> +	return s6e3ha8_power_off(ctx);
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
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &s6e3ha8_amb577px01_wqhd_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

drm_connector_helper_get_modes_fixed()

> +
> +	return 1;
> +}
> +

-- 
With best wishes
Dmitry
