Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432E72806E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132E10E265;
	Thu,  8 Jun 2023 12:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A0710E266
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 12:49:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30ad458f085so461367f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686228563; x=1688820563;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vfWLVHSaynosqDzEpjpn0x+xQ1lv5rwjFflJ53vQG5U=;
 b=Ld/I7TsVqq8lNET1145ywbdAk32fc/mKg+dQMRUBDbrcV+6L3uwbCBKQy5tEEV9O5B
 GvhkFZ1PviaaZO3axmNDTmG9Uvak+oraF/JeZ8z0f6eOfArSAMbI7W7TAzTHJwubfA5p
 LeZ7a5OTYzGQ4q2LBMfsAE/kLwBK8DvYRLIATcULGcCmf2/iAbePsjNtYofPDOcCtj0U
 lKOcbFO8gEyOG/HMDGxpeAYl3vf2CW8nE5EeFmtdRFY2drnJL6YL1glODb23bzQY0yoV
 IC8MVS4wmQ7VgNNjnu/Xvm8wtgq1XYF3rcJu+3IJ/2vY/J7+KYRVr9VNVK+2Tj2q5sgf
 nAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686228563; x=1688820563;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfWLVHSaynosqDzEpjpn0x+xQ1lv5rwjFflJ53vQG5U=;
 b=LdjfqQR6uqzrWRBgRGbDdlCwFB3me4zJdCmrkDWI2Nv47yNJqRHnq+8nVScjYzU5SI
 abZvvvpzKrzGAlufaUMKNGv5gzEND12ewm9skYL8jDVe2985hIxQUvkeEFWgszkfctCU
 YnLnIF9bha2kkmkcTiaFwMGf+bHajBDypy2TlDeEokr9i+pISZo3ENuCf43Ud20+D/PI
 ssmohUmfH4SHY4FlWZle6lVVhpCOAr58H+FRulZZA1OjeJMBNg5+DmPwGOPuIMwHAMqN
 zrv2Ung/wLQYYo+JKPG7erHUJczhFKd+ktPhVcROg6JZc4tyEycXTf0jENG5hqkgz9HT
 SnBA==
X-Gm-Message-State: AC+VfDzEtZgTFzhl11dk6eYDsP45WVatdpAvnzzhdm2CN+ZaqXhFI24K
 crClKfyd5jGM+fzooTblAkL+eA==
X-Google-Smtp-Source: ACHHUZ7ZSLakGms4uctT0aG0W9tRLGeB8tYPAvCcspi0o/V0pzajuizm1ie1V4k9LZ1CK1D0lzasZw==
X-Received: by 2002:a5d:6941:0:b0:307:9081:d355 with SMTP id
 r1-20020a5d6941000000b003079081d355mr1757375wrw.26.1686228563580; 
 Thu, 08 Jun 2023 05:49:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6?
 ([2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d6dc8000000b0030aec5e020fsm1495423wrz.86.2023.06.08.05.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 05:49:23 -0700 (PDT)
Message-ID: <86b8960b-7483-cacd-3f29-715a31c4f7b6@linaro.org>
Date: Thu, 8 Jun 2023 14:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v2-0-9c8d5eeef579@quicinc.com>
 <20230516-b4-r66451-panel-driver-v2-2-9c8d5eeef579@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <20230516-b4-r66451-panel-driver-v2-2-9c8d5eeef579@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica,

On 31/05/2023 20:12, Jessica Zhang wrote:
> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
> comes with the Qualcomm HDK8350 display expansion pack.
> 
> The panel enables display compression (DSC v1.2) by default.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-visionox-r66451.c | 390 ++++++++++++++++++++++++++
>   3 files changed, 400 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 29cf5fa39ff2..1f9d57854ea8 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -766,6 +766,15 @@ config DRM_PANEL_VISIONOX_VTDR6130
>   	  Say Y here if you want to enable support for Visionox
>   	  VTDR6130 1080x2400 AMOLED DSI panel.
>   
> +config DRM_PANEL_VISIONOX_R66451
> +	tristate "Visionox R66451"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Visionox
> +	  R66451 1080x2340 AMOLED DSI panel.
> +
>   config DRM_PANEL_WIDECHIPS_WS2401
>   	tristate "Widechips WS2401 DPI panel driver"
>   	depends on SPI && GPIOLIB
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b3e8ba29edd3..e043a92ee676 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -78,5 +78,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
>   obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>   obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> new file mode 100644
> index 000000000000..00fc28ad3d07
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> @@ -0,0 +1,390 @@
> +//SPDX-License-Identifier: GPL-2.0-only
> +//Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct visionox_r66451 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[2];
> +	bool prepared, enabled;
> +};
> +
> +static inline struct visionox_r66451 *to_visionox_r66451(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_r66451, panel);
> +}
> +
> +static void visionox_r66451_reset(struct visionox_r66451 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 10100);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 10100);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 10100);
> +}
> +
> +static int visionox_r66451_on(struct visionox_r66451 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc2,
> +			       0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
> +			       0x09, 0x3c);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd7,
> +			       0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
> +			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
> +			       0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> +	mipi_dsi_dcs_write_seq(dsi, 0xde,
> +			       0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
> +			       0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> +	mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc4,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
> +	mipi_dsi_dcs_write_seq(dsi, 0xcf,
> +			       0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
> +			       0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +			       0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd3,
> +			       0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
> +			       0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
> +			       0x3c, 0x9c);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd7,
> +			       0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
> +			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
> +			       0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
> +			       0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
> +			       0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> +	mipi_dsi_dcs_write_seq(dsi, 0xdf,
> +			       0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> +	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
> +	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> +	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
> +	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
> +	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> +	mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int visionox_r66451_off(struct visionox_r66451 *ctx)
> +{
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	return 0;
> +}
> +
> +static int visionox_r66451_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
> +				    ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	visionox_r66451_reset(ctx);
> +
> +	ret = visionox_r66451_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	mipi_dsi_compression_mode(ctx->dsi, true);
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int visionox_r66451_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = visionox_r66451_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode visionox_r66451_mode = {
> +	.clock = 345830,
> +	.hdisplay = 1080,
> +	.hsync_start = 1175,
> +	.hsync_end = 1176,
> +	.htotal = 1216,
> +	.vdisplay = 2340,
> +	.vsync_start = 2365,
> +	.vsync_end = 2366,
> +	.vtotal = 2370,
> +	.width_mm = 0,
> +	.height_mm = 0,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int visionox_r66451_enable(struct drm_panel *panel)
> +{
> +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	if (!dsi->dsc) {
> +		dev_err(&dsi->dev, "DSC not attached to DSI\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +	if (ret) {
> +		dev_err(&dsi->dev, "Failed to set PPS\n");
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(&dsi->dev, "Failed on set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int visionox_r66451_disable(struct drm_panel *panel)
> +{
> +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ctx->enabled = false;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
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
> +static int visionox_r66451_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	drm_connector_helper_get_modes_fixed(connector, &visionox_r66451_mode);
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_r66451_funcs = {
> +	.prepare = visionox_r66451_prepare,
> +	.unprepare = visionox_r66451_unprepare,
> +	.get_modes = visionox_r66451_get_modes,
> +	.enable = visionox_r66451_enable,
> +	.disable = visionox_r66451_disable,
> +};
> +
> +static int visionox_r66451_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +}
> +
> +static const struct backlight_ops visionox_r66451_bl_ops = {
> +	.update_status = visionox_r66451_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +visionox_r66451_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 255,
> +		.max_brightness = 4095,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &visionox_r66451_bl_ops, &props);
> +}
> +
> +static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_r66451 *ctx;
> +	struct drm_dsc_config *dsc;
> +	int ret = 0;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> +	if (!dsc)
> +		return -ENOMEM;
> +
> +	/* Set DSC params */
> +	dsc->dsc_version_major = 0x1;
> +	dsc->dsc_version_minor = 0x2;
> +
> +	dsc->slice_height = 20;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 2;
> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8 << 4;
> +	dsc->block_pred_enable = true;
> +
> +	dsi->dsc = dsc;

At some point we must check if the host controller supports
DSC, but it would be for later so it's not a blocker.

> +
> +	ctx->supplies[0].supply = "vddio";
> +	ctx->supplies[1].supply = "vdd";
> +
> +	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
> +			ctx->supplies);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.backlight = visionox_r66451_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				"Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +	}
> +
> +	return ret;
> +}
> +
> +static void visionox_r66451_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_r66451 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id visionox_r66451_of_match[] = {
> +	{.compatible = "visionox,r66451"},
> +	{ /*sentinel*/ }
> +};
> +MODULE_DEVICE_TABLE(of, visionox_r66451_of_match);
> +
> +static struct mipi_dsi_driver visionox_r66451_driver = {
> +	.probe = visionox_r66451_probe,
> +	.remove = visionox_r66451_remove,
> +	.driver = {
> +		.name = "panel-visionox-r66451",
> +		.of_match_table = visionox_r66451_of_match,
> +	},
> +};
> +
> +module_mipi_dsi_driver(visionox_r66451_driver);
> +
> +MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com>");
> +MODULE_DESCRIPTION("Panel driver for the Visionox R66451 AMOLED DSI panel");
> +MODULE_LICENSE("GPL");
> 

It looks fine for me, if there's no other comments I'll apply it later today.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil
