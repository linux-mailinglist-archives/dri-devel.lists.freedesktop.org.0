Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855D70B2C2
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 03:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605DF10E22F;
	Mon, 22 May 2023 01:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11E10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:24:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so6385722e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 18:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684718639; x=1687310639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R1Kg71Yn7RWL/4Ga7NTwFSI9VJC5V2do2uEu4WZxPUg=;
 b=NtJQFciY39CIF37Gcjs9xEBE3HlfQIP5QpwL3E1TG2vc9RE1p4EG5kl71c07CiFbKl
 R++lGC7kl2gSPUrofNw60xxObMVEnW+xHUEpEltVFvhZq4uCy42nc/6SF1t0HFSmJz6A
 6VTdFakJ30+Tvddk8XN70Yxmbd6dJto7352Vqtod5alFQZarerEruNinlzazOdCgJPEU
 tBXKDjbkfzBJsIUzp3L06dFPZBlWqS1aI/fhmqoj0XocbR4dJ8V6XACIXKsbOgRA2Hwq
 okfh5SNy5EXmdl25P30XJQsoQYzVuGnVZT0geRuGgPJxqvF4Ses2X4Tymy3g8Q3Er7PP
 +zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684718639; x=1687310639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R1Kg71Yn7RWL/4Ga7NTwFSI9VJC5V2do2uEu4WZxPUg=;
 b=cqg3IA3ZxzJTOqLNoev/i46Gv/pCxATdlVeoE7aucPGaIKOgNGDxDvCCU7RN4W3j+Q
 ii5G7eb0EIDsU3UldinvUGhSOTU5+EweaDz7vwSGDYdgyBPRB0ga1JP65O2aoeFKc7pm
 lDpEGgEs/QUBoGfvPFn+wCDgA4ftcdiDUslpqkmgvfmtT+MS5IGrlDWSuzQSz0vulXLd
 xYwzVZNKIyKrz2TK43cOYqhlQ+CvE8cU8ohDEXhdpSEzdJtbDIL2z5ntqtlOGdU/cvBI
 hg5nn/NZfxjXknc0uTm6TlFtdLUhIJ5Prw904BmHSeokMIlWVktzBafbcLcCQvVAfpZI
 vk2A==
X-Gm-Message-State: AC+VfDy6EjCAWGmkjT4oT5kpx9fI+Cuc8ZuOgggU1f//vFNORpXzHzMQ
 knFtLxl2tfLM2/XPBaEcDS7vYw==
X-Google-Smtp-Source: ACHHUZ4C0iP34vrXSwIpxlIzUsOaKK7ZUyKuAru1LT3Dj8i38rTt2w5QQwm6UY7H8+nQmdOs/yEegw==
X-Received: by 2002:ac2:5510:0:b0:4f3:b32d:f739 with SMTP id
 j16-20020ac25510000000b004f3b32df739mr2050410lfk.19.1684718638842; 
 Sun, 21 May 2023 18:23:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004f252f48e5fsm796666lfc.40.2023.05.21.18.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 18:23:58 -0700 (PDT)
Message-ID: <4679c741-7877-ce79-4086-08ec4ee9e6bf@linaro.org>
Date: Mon, 22 May 2023 04:23:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 08/10] drm/panel/samsung-sofef03: Add panel driver for
 Sony Xperia 5 II
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Caleb Connolly <caleb@connolly.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 00:23, Marijn Suijten wrote:
> The SOFEF03-M Display-IC paired with an unknown panel in the Sony Xperia
> 5 II always uses Display Stream Compression 1.1 and features a 60hz and
> 120hz refresh-rate mode.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad's S-o-b is also required then

> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  14 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-samsung-sofef03.c | 423 ++++++++++++++++++++++++++
>   3 files changed, 438 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 3f11e9906f2cb..8e2668153bce2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -630,6 +630,20 @@ config DRM_PANEL_SAMSUNG_SOFEF01
>   
>   	  This panel features a fixed mode of 1080x2520@60.
>   
> +config DRM_PANEL_SAMSUNG_SOFEF03
> +	tristate "Samsung sofef03 Sony Xperia 5 II DSI cmd mode panel"
> +	depends on GPIOLIB
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y or M here if you want to enable support for the Samsung AMOLED
> +	  command mode panel found in the Sony Xperia 5 II smartphone.
> +
> +	  This panel uses Display Stream Compression 1.1.
> +
> +	  The panel features a 1080x2520@60 and 1080x2520@120 mode.
> +
>   config DRM_PANEL_SEIKO_43WVF1G
>   	tristate "Seiko 43WVF1G panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4039d0fc9cfb..52dcd82e33120 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams4
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF01) += panel-samsung-sofef01.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF03) += panel-samsung-sofef03.o
>   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>   obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
>   obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef03.c b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
> new file mode 100644
> index 0000000000000..2763e1c56b37b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@linaro.org>
> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
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
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +static const bool enable_120hz = true;
> +
> +struct samsung_sofef03_m {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator *vddio, *vci;
> +	struct gpio_desc *reset_gpio;
> +	bool prepared;
> +};
> +
> +static inline struct samsung_sofef03_m *to_samsung_sofef03_m(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct samsung_sofef03_m, panel);
> +}
> +
> +static void samsung_sofef03_m_reset(struct samsung_sofef03_m *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int samsung_sofef03_m_on(struct samsung_sofef03_m *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0x9d, 0x01);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x09);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x08);
> +	mipi_dsi_dcs_write_seq(dsi, 0xee, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set tear on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set column address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2520 - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set page address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, 100);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display brightness: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x83);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, 0xec, 0x02, 0x00, 0x1c, 0x1c);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x0c);
> +	mipi_dsi_dcs_write_seq(dsi, 0xec, 0x01, 0x19);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x2d, 0x27);
> +	mipi_dsi_dcs_write_seq(dsi, 0x60, enable_120hz ? 0x10 : 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	msleep(110);
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
> +static int samsung_sofef03_m_off(struct samsung_sofef03_m *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to turn display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
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
> +static int samsung_sofef03_m_prepare(struct drm_panel *panel)
> +{
> +	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
> +	struct drm_dsc_picture_parameter_set pps;
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(ctx->vddio);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable vddio regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(ctx->vci);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable vci regulator: %d\n", ret);
> +		regulator_disable(ctx->vddio);
> +		return ret;
> +	}
> +
> +	samsung_sofef03_m_reset(ctx);
> +
> +	ret = samsung_sofef03_m_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		goto fail;
> +	}
> +
> +	if (ctx->dsi->dsc) {

Always true

> +		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
> +
> +		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to transmit PPS: %d\n", ret);
> +			goto fail;
> +		}
> +
> +		ret = mipi_dsi_compression_mode(ctx->dsi, true);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to enable compression mode: %d\n", ret);
> +			goto fail;
> +		}
> +
> +		msleep(28);
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +
> +fail:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_disable(ctx->vci);
> +	regulator_disable(ctx->vddio);
> +	return ret;
> +}
> +
> +static int samsung_sofef03_m_unprepare(struct drm_panel *panel)
> +{
> +	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = samsung_sofef03_m_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_disable(ctx->vci);
> +	regulator_disable(ctx->vddio);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode samsung_sofef03_m_60hz_mode = {
> +	.clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 156,
> +	.hsync_end = 1080 + 156 + 8,
> +	.htotal = 1080 + 156 + 8 + 8,
> +	.vdisplay = 2520,
> +	.vsync_start = 2520 + 2393,
> +	.vsync_end = 2520 + 2393 + 8,
> +	.vtotal = 2520 + 2393 + 8 + 8,
> +	.width_mm = 61,
> +	.height_mm = 142,
> +};
> +
> +static const struct drm_display_mode samsung_sofef03_m_120hz_mode = {
> +	.clock = (1080 + 56 + 8 + 8) * (2520 + 499 + 8 + 8) * 120 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 56,
> +	.hsync_end = 1080 + 56 + 8,
> +	.htotal = 1080 + 56 + 8 + 8,
> +	.vdisplay = 2520,
> +	.vsync_start = 2520 + 499,
> +	.vsync_end = 2520 + 499 + 8,
> +	.vtotal = 2520 + 499 + 8 + 8,
> +	.width_mm = 61,
> +	.height_mm = 142,
> +};
> +
> +static int samsung_sofef03_m_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	if (enable_120hz)

Is it possible to switch between these modes at runtime? It might be 
logical to define 60 Hz mode as preferred, while allowing users to 
switch to 120 Hz when required for some reason.

> +		return drm_connector_helper_get_modes_fixed(connector,
> +							    &samsung_sofef03_m_120hz_mode);
> +	else
> +		return drm_connector_helper_get_modes_fixed(connector,
> +							    &samsung_sofef03_m_60hz_mode);
> +}
> +
> +static const struct drm_panel_funcs samsung_sofef03_m_panel_funcs = {
> +	.prepare = samsung_sofef03_m_prepare,
> +	.unprepare = samsung_sofef03_m_unprepare,
> +	.get_modes = samsung_sofef03_m_get_modes,
> +};
> +
> +static int samsung_sofef03_m_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	pr_err("Writing %#x\n", brightness);
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
> +static int samsung_sofef03_m_bl_get_brightness(struct backlight_device *bl)
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
> +	pr_err("Read display brightness %#x\n", brightness);
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops samsung_sofef03_m_bl_ops = {
> +	.update_status = samsung_sofef03_m_bl_update_status,
> +	.get_brightness = samsung_sofef03_m_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +samsung_sofef03_m_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 100,
> +		.max_brightness = 1023,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &samsung_sofef03_m_bl_ops, &props);
> +}
> +
> +static int samsung_sofef03_m_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct drm_dsc_config *dsc;
> +	struct samsung_sofef03_m *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(ctx->vddio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vddio),
> +				     "Failed to get vddio regulator\n");
> +
> +	ctx->vci = devm_regulator_get(dev, "vci");
> +	if (IS_ERR(ctx->vci))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vci),
> +				     "Failed to get vci regulator\n");
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
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &samsung_sofef03_m_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->panel.backlight = samsung_sofef03_m_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc = dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);

Double assignment

> +	if (!dsc)
> +		return -ENOMEM;
> +
> +	dsc->dsc_version_major = 1;
> +	dsc->dsc_version_minor = 1;
> +
> +	dsc->slice_height = 30;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 2;
> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +	dsc->block_pred_enable = true;
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
> +static void samsung_sofef03_m_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct samsung_sofef03_m *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id samsung_sofef03_m_of_match[] = {
> +	{ .compatible = "samsung,sofef03-m" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, samsung_sofef03_m_of_match);
> +
> +static struct mipi_dsi_driver samsung_sofef03_m_driver = {
> +	.probe = samsung_sofef03_m_probe,
> +	.remove = samsung_sofef03_m_remove,
> +	.driver = {
> +		.name = "panel-samsung-sofef03-m",
> +		.of_match_table = samsung_sofef03_m_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(samsung_sofef03_m_driver);
> +
> +MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@linaro.org>");
> +MODULE_AUTHOR("Marijn Suijten <marijn.suijten@somainline.org>");
> +MODULE_DESCRIPTION("DRM panel driver for Samsung SOFEF03-M Display-IC panels");
> +MODULE_LICENSE("GPL");
> 

-- 
With best wishes
Dmitry

