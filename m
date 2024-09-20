Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B703197D81E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 18:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D9C10E2F0;
	Fri, 20 Sep 2024 16:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TD6c5Z64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1016510E2F0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 16:15:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso24625031fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726848934; x=1727453734; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OphryypYhfPdy6rBIHDWj5NDLRZZ7WPbVgTSeJ1lao0=;
 b=TD6c5Z64RAv475Al0hP/AMUjJc/GWDNejWWHBm5r+pbXJwYrc6njBvIk7FOQUIErko
 ppe4wJigWc4y2Lr/B6ptD0so+zJo1NUxV8yqcThRUkqAMIJpF2ZrkFphJfut8CgwjAYw
 kwra/tYQfvyA20XE4DLF64GbDDyBgm+5i9xDvLB7c+KSCxvfKc+GSe77/sBV1bIKFNIf
 Bxz/p/pI/vGgPfhVywFj6+bZYQlMp/llGmaHjVnsLHFoO/BAKSV3tN7zQ5+pGe+QceQq
 oeRk1ITTWMOToWJk3cQw5DgVlnHK3mGk0BhxP9Eqi1h0n3Tl6fOlZKAIGo0joSh4XpD+
 5NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726848934; x=1727453734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OphryypYhfPdy6rBIHDWj5NDLRZZ7WPbVgTSeJ1lao0=;
 b=xLyi//xq+F9PR8wNinDrm1jtheXZJupXWl4vzul6s4PBRx3vvgArOHq3Bn2jYTBvv6
 H8a99EHzTzeTyRY5ZS7ojBO8jBn9AplXsC3F3ak4e27d178ZhGQgwmvUcJE0AjyJW/ZR
 4OdFik9NDFNrvjHwXSM+QfdoZoXSzdRu3bbZKY4860yLkvwNoTVRZYNd5Z2wVnP8if+/
 GxCSlHcbU7eOahWFcCDgOVms0nfh64T16sdV+13+9fFflmXPZgEd/CQU/1XhPlofkqzJ
 A5IHntTwT6L6gNyFtriW69zQ3JoeCmJsqKrL5+hQR1gejj3NuKOMmbFpFUq29SsNIx43
 LEmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3hSEb5SBkzZoSyyzcL6Pm1B/V5yRxzXcfmw2bwmEcvALBNXDJTFbsDbpzgftABO0i3/H7egLyYO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvwy/Yvmtj9DqLdRm756lsPTPooiBYdi1LkI1IrdRSG0I/AM9J
 lroWaQWHw6dcrBIZP0GrOX0Xv8VHi1ArdOouE0uaEdnKTh+nrHlMpCr2VwRon0w=
X-Google-Smtp-Source: AGHT+IEGHGUdUWQyazsMFQmJdp2djSmBtEZyN6StbnToxoxWrnrCaZOygmkknGml8O6B+Ei/Yiy7tA==
X-Received: by 2002:a2e:4a19:0:b0:2f7:586d:e5d9 with SMTP id
 38308e7fff4ca-2f7cb31ac60mr19530151fa.16.1726848934007; 
 Fri, 20 Sep 2024 09:15:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d3002e2sm20270461fa.31.2024.09.20.09.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 09:15:32 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:15:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, dharma.b@microchip.com, arnd@arndb.de, 
 hari.prasathge@microchip.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] drm/bridge: add Microchip DSI controller support
 for sam9x7 SoC series
Message-ID: <pjc75xbvdn4n7tqzjx33st2lf6bzryrs7zixahbv7j4fi5xa7j@xujs6wx7qeqs>
References: <20240918103119.385597-1-manikandan.m@microchip.com>
 <20240918103119.385597-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918103119.385597-3-manikandan.m@microchip.com>
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

On Wed, Sep 18, 2024 at 04:01:17PM GMT, Manikandan Muralidharan wrote:
> Add the Microchip's DSI controller wrapper driver that uses
> the Synopsys DesignWare MIPI DSI host controller bridge.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v4:
> - Fixed issues reported by kernel test robot
> - replaced syscon_regmap_lookup_by_phandle with
> syscon_regmap_lookup_by_compatible
> 
> changes in v3:
> - make remove callback return void
> 
> changes in v2:
> - use static const with global variables
> - replace dev_err with dev_err_probe
> - move clk_prepare_enable to simplify the error path
> - use FIELD_PREP calls
> - remove unused macros and unused functions
> - rename function name with mchp_ suffix
> - add suspend and resume pm calls to handle pllref_clk
> ---
>  drivers/gpu/drm/bridge/Kconfig            |   8 +
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c | 545 ++++++++++++++++++++++
>  3 files changed, 554 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 683cb33805b2..317246509601 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -196,6 +196,14 @@ config DRM_MICROCHIP_LVDS_SERIALIZER
>  	help
>  	  Support for Microchip's LVDS serializer.
>  
> +config DRM_MICROCHIP_DW_MIPI_DSI
> +	tristate "Microchip specific extensions for Synopsys DW MIPI DSI"
> +	depends on DRM_ATMEL_HLCDC
> +	select DRM_DW_MIPI_DSI
> +	help
> +	  This selects support for Microchip's SoC specific extensions
> +	  for the Synopsys DesignWare dsi driver.
> +
>  config DRM_NWL_MIPI_DSI
>  	tristate "Northwest Logic MIPI DSI Host controller"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 3daf803ce80b..32e4233e6b5e 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
> +obj-$(CONFIG_DRM_MICROCHIP_DW_MIPI_DSI) += dw-mipi-dsi-mchp.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>  obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
> diff --git a/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> new file mode 100644
> index 000000000000..35cfca1ff000
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> @@ -0,0 +1,545 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
> + *
> + */
> +

[...]

> +
> +static int dw_mipi_dsi_mchp_get_lane_mbps(void *priv_data,
> +					  const struct drm_display_mode *mode,
> +					  unsigned long mode_flags, u32 lanes,
> +					  u32 format, unsigned int *lane_mbps)
> +{
> +	struct dw_mipi_dsi_mchp *dsi = priv_data;
> +	unsigned long best_freq, fvco_min, fvco_max, fin, fout;
> +	unsigned long min_delta = ULONG_MAX, delta;
> +	unsigned int target_mbps = 0, mpclk, desired_mbps;
> +	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
> +	unsigned int min_prediv, max_prediv;
> +	unsigned int _fbdiv, best_fbdiv, _prediv, best_prediv;
> +	int bpp;
> +	u64 freq_factor;

This function is significantly overlapping with dw_mipi_dsi_get_lane_mbps().
Please extract a common helper and add it to dw-mipi-dsi.c. Other than
that, LGTM.

> +
> +	dsi->format = format;
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	if (bpp < 0) {
> +		dev_err(dsi->dev,
> +			"failed to get bpp for pixel format %d\n",
> +			dsi->format);
> +		return bpp;
> +	}
> +
-- 
With best wishes
Dmitry
