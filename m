Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438797DEC5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7810E31A;
	Sat, 21 Sep 2024 20:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wlVl7kyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543A510E31A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:34:50 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f74e613a10so46749701fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726950888; x=1727555688; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Gql3kqz7EM8ilLOWYXvV3TIt4LvQ2I+BPfmeaKF7W8=;
 b=wlVl7kyQZszKN8Y8ukNZ08U4phSK2qTY9Ruefj1iB5SIyFxjbTa63BqZFw7WFsY28K
 Oj7uarBsNvQFWuy3mxRksjkcdZCBWHYv5L3iw2c2ERF6Ojg/z21I/mp+1GEp2ApHtD9i
 bb+PkWW3QIKMB2VMRAwfzZD/A0VHzxoEYGJvfUvVUc73mjiSz0DdR2XVkU98qf5BD/Hq
 c3IVmzCA3huuCcoldyKbw7yqOZUn5PRiUi7HnCqi+ITLV9wgX6u7UPrtIbJUznNQFCA+
 W7aV51QVFUwWvHxOWEruPgyPnRLGAwj3RvkXH9icMRMhoYsXKwYHWTbXUhqFsrBJSAM0
 Mdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726950888; x=1727555688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Gql3kqz7EM8ilLOWYXvV3TIt4LvQ2I+BPfmeaKF7W8=;
 b=FDZHPEEcmK5k1sbd8UQBsZHdJ+UbPOUzApU7xeRAPUl4o+2n4HS+GSwX3IqJKQiPLm
 DOG96acTsW4hyypaBGIVriE52wDEQOTP0gwnmomPAGxwvZ97HI2f10TYxbC7p5welhoJ
 qlvoFbYPZrRP4sYRYTdd/yLD7QN4LdV900nxomqnAsV5ihWHXZhq4Wj48ZuqE0n5IHIl
 cNDSrmeu5wRyV+I7j60+JIGMeeEktb/W1cD3sxd+CT5zmBbSCo3zTOtTq5Fn2X8EK3ux
 vrw62E6mGmWuJy/u56nXVbkL4i5GcbLO5OtYqQJO6J1+4DHUPIUQu9W684+eghzThGgV
 Apdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ14veb777BzTbf+aZVd9fBxDaurvYTksoHNWLGbnQVL8jb3kjS0cFcdJ64/7MFVffRHGvZyEUGA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMYUnw4qvrc1yoKSaiSMm1NjDX62PntY5L6Fd2go6cbSYwvCGE
 q45jlMsJSIt24BgnOCwnUc583gjbau7GbRrirU1wU0qyICSS8shZKbqKqBuWQAQ=
X-Google-Smtp-Source: AGHT+IGBg+idycoSLJi8M4Ssf7GjJth1HbXFrrBHCkpHwTQWQDDS0vHRktKuo9q8Gv49mMMKwkJl0Q==
X-Received: by 2002:a2e:70a:0:b0:2f7:6869:3b55 with SMTP id
 38308e7fff4ca-2f7cb31c9e4mr38171251fa.21.1726950888048; 
 Sat, 21 Sep 2024 13:34:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d59bab3sm23570481fa.129.2024.09.21.13.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:34:46 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:34:44 +0300
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
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 07/27] drm/panel: Add support for S6E3HA8 panel driver
Message-ID: <slxeitknraechwzofwfq643ewy4ptmvy5oohxpdup5hf3rb5e4@lx32gcrjho4c>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-7-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-7-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:07:50PM GMT, Dzmitry Sankouski wrote:
> Add support for MIPI-DSI based S6E3HA8 AMOLED panel
> driver. This panel has 1440x2960 resolution, 5.8-inch physical
> size, and can be found in starqltechn device.
> Brightness regulation is not yet supported.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> Changes in v4:
> - inline power related functions
> - rework driver using new mipi_dsi_dcs_write_seq_multi macro
> - use drm_connector_helper_get_modes_fixed for modes
> - remove excessive compression setting
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |   7 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 350 ++++++++++++++++++++++++++
>  4 files changed, 359 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92135252264a..65cb2511ba22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7385,6 +7385,7 @@ DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
>  M:	Dzmitry Sankouski <dsankouski@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>  
>  DRM DRIVER FOR SITRONIX ST7586 PANELS
>  M:	David Lechner <david@lechnology.com>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d3a9a9fafe4e..65fb3a466e39 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -689,6 +689,13 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
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
> index 987a08702410..8ee28f5a2213 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> new file mode 100644
> index 000000000000..e69943f0527e
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -0,0 +1,350 @@
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
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set compression mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
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
> +	return 0;

return ctx.accum_err;

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
> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +	msleep(20);
> +
> +	s6e3ha8_test_key_on_lvl2(&ctx);
> +	s6e3ha8_afc_off(&ctx);
> +	s6e3ha8_test_key_off_lvl2(&ctx);
> +
> +	msleep(160);
> +
> +	return 0;
> +}
> +
> +static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
> +{
> +	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
> +	struct mipi_dsi_device *dsi = priv->dsi;
> +	struct device *dev = &dsi->dev;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
> +	if (ret < 0)
> +		return ret;
> +	msleep(120);
> +	s6e3ha8_amb577px01_wqhd_reset(priv);

empty line

> +	ret = s6e3ha8_amb577px01_wqhd_on(priv);
> +

no empty line

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);

_multi functions will say that for you already.

> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		goto err;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
> +
> +	s6e3ha8_test_key_on_lvl1(&ctx);
> +	ret = mipi_dsi_picture_parameter_set(priv->dsi, &pps);

Probably we should add _multi version here, could you please add it?
Otherwise you might have missed the fact that previous function has
failed.

> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +	s6e3ha8_test_key_off_lvl1(&ctx);
> +
> +	msleep(28);

mipi_dsi_msleep

> +
> +	return 0;


handle ctx.accum_err please.


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
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
