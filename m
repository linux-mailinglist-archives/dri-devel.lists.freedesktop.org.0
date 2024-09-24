Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04011984601
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6717C10E2AF;
	Tue, 24 Sep 2024 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZO4TKZbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B140B10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 12:34:05 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6dde476d3dfso43811687b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 05:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727181245; x=1727786045; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=waVu7uh+CPXnVRmgTe91YMGi0QNyeJbMskc9QqEgC7o=;
 b=ZO4TKZboaNlezz1R6q5gd8MTOR9XinZALhWz4zBU61H6xXgAGDBZ5A4FTf/Tt370Gf
 Eg5CRLB0l0ED/myo5+XNjSiXBTYqiqHFysQT4Y0FBYArOo5eU1C8ra6fjpJgasUBOJ6h
 yBQRdyn51V9KU3NcRHZiwLkMn9I63nKilkXYQI71JbUWPkDBjyR1LltgWYnjXrMa/byJ
 ZMilBsRBlFEfNUKOdDhs/feMWUp5aD1wG9wHHoVIBI1mCxaaxxR3uUVyMETH6l3At4EX
 1NgiAD6N6rIvglz0SRbefUIU1jPSFXchd3KIz6fZnfhuQU93VD1CDY4y9FdkLd8edl0i
 2nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727181245; x=1727786045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=waVu7uh+CPXnVRmgTe91YMGi0QNyeJbMskc9QqEgC7o=;
 b=e7IJC+g/QNymsBLrn7pafR+Qch27YMrVmTz884g5+MCovJV4/UI/Wd+C63fidW2JUn
 tnygHk1bMbeCSVxEZLLLgz4z9G/wILHR7EJae+0VzHARLEJOVYMPJOxk+W9OTdwPyBMC
 CC7Z+3gkXXqYghOfHRo2tgqGXbUgOvlykBJf+BjEVHLB/BvTUj2ubzWfEsqBRNdVoPtJ
 joMCKuxJ1rkqBxpOTwCN0uRa+SV+ITJvUN8xkBL/HqDbCMzyQ42h/tIjBzI3raP85OpX
 S94yYHQUpV1x4WDqY7FwfC7wOXoKdIi1wmqqZskl5MApInXW4uCFa8gJrRTw2evxeha6
 g0wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+F+8//wL5rYE5ftqMtxnHpsNCBUwJ5B1FUAuHSwinPtr4ZQEj/jrud+Uxr0onplkjXK/kFxgwPt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7lc0Rq0r8F5PduU6kxjl3PXXalKSKVb/vaikmODTLqDN/uMx2
 XUbK33wpd269ldpNWwzHDf79XHTRHzHxzy7Xeb+/Hy1pyDAEL8YBu32Uw3tIhS9tBVK4SPQ0K8R
 25TfR2pSba6OhL9gfKep019n43FRyWRrxW2dEoQ==
X-Google-Smtp-Source: AGHT+IF8d9t+DAekHL9aAw+MGEhPwN2Iu/txmTGUHM5WZpE5W7o9yq1MbHa+UZYEZdxq36DGWi2W/HUmyRo6OrH4l1Q=
X-Received: by 2002:a05:690c:6d82:b0:6e2:ed0:9dc3 with SMTP id
 00721157ae682-6e20ed09ffdmr14679487b3.38.1727181244680; Tue, 24 Sep 2024
 05:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240918103119.385597-1-manikandan.m@microchip.com>
 <20240918103119.385597-3-manikandan.m@microchip.com>
 <pjc75xbvdn4n7tqzjx33st2lf6bzryrs7zixahbv7j4fi5xa7j@xujs6wx7qeqs>
 <4cd72332-a718-42e0-8006-f589410c920f@microchip.com>
In-Reply-To: <4cd72332-a718-42e0-8006-f589410c920f@microchip.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 14:33:53 +0200
Message-ID: <CAA8EJppZNW7-qwkqPke-8vbf=PGhf0MU-h47EJHuVgKmdV9+8Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/bridge: add Microchip DSI controller support
 for sam9x7 SoC series
To: Manikandan.M@microchip.com
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux@armlinux.org.uk, Nicolas.Ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 Dharma.B@microchip.com, arnd@arndb.de, Hari.PrasathGE@microchip.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 24 Sept 2024 at 12:17, <Manikandan.M@microchip.com> wrote:
>
> Hi Dmitry,
>
> On 20/09/24 9:45 pm, Dmitry Baryshkov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Wed, Sep 18, 2024 at 04:01:17PM GMT, Manikandan Muralidharan wrote:
> >> Add the Microchip's DSI controller wrapper driver that uses
> >> the Synopsys DesignWare MIPI DSI host controller bridge.
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> ---
> >> changes in v4:
> >> - Fixed issues reported by kernel test robot
> >> - replaced syscon_regmap_lookup_by_phandle with
> >> syscon_regmap_lookup_by_compatible
> >>
> >> changes in v3:
> >> - make remove callback return void
> >>
> >> changes in v2:
> >> - use static const with global variables
> >> - replace dev_err with dev_err_probe
> >> - move clk_prepare_enable to simplify the error path
> >> - use FIELD_PREP calls
> >> - remove unused macros and unused functions
> >> - rename function name with mchp_ suffix
> >> - add suspend and resume pm calls to handle pllref_clk
> >> ---
> >>   drivers/gpu/drm/bridge/Kconfig            |   8 +
> >>   drivers/gpu/drm/bridge/Makefile           |   1 +
> >>   drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c | 545 ++++++++++++++++++++++
> >>   3 files changed, 554 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> >>
> >> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >> index 683cb33805b2..317246509601 100644
> >> --- a/drivers/gpu/drm/bridge/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/Kconfig
> >> @@ -196,6 +196,14 @@ config DRM_MICROCHIP_LVDS_SERIALIZER
> >>        help
> >>          Support for Microchip's LVDS serializer.
> >>
> >> +config DRM_MICROCHIP_DW_MIPI_DSI
> >> +     tristate "Microchip specific extensions for Synopsys DW MIPI DSI"
> >> +     depends on DRM_ATMEL_HLCDC
> >> +     select DRM_DW_MIPI_DSI
> >> +     help
> >> +       This selects support for Microchip's SoC specific extensions
> >> +       for the Synopsys DesignWare dsi driver.
> >> +
> >>   config DRM_NWL_MIPI_DSI
> >>        tristate "Northwest Logic MIPI DSI Host controller"
> >>        depends on DRM
> >> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> >> index 3daf803ce80b..32e4233e6b5e 100644
> >> --- a/drivers/gpu/drm/bridge/Makefile
> >> +++ b/drivers/gpu/drm/bridge/Makefile
> >> @@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
> >>   obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> >>   obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> >>   obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
> >> +obj-$(CONFIG_DRM_MICROCHIP_DW_MIPI_DSI) += dw-mipi-dsi-mchp.o
> >>   obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> >>   obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> >>   obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
> >> diff --git a/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> >> new file mode 100644
> >> index 000000000000..35cfca1ff000
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
> >> @@ -0,0 +1,545 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries
> >> + *
> >> + * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> + *
> >> + */
> >> +
> >
> > [...]
> >
> >> +
> >> +static int dw_mipi_dsi_mchp_get_lane_mbps(void *priv_data,
> >> +                                       const struct drm_display_mode *mode,
> >> +                                       unsigned long mode_flags, u32 lanes,
> >> +                                       u32 format, unsigned int *lane_mbps)
> >> +{
> >> +     struct dw_mipi_dsi_mchp *dsi = priv_data;
> >> +     unsigned long best_freq, fvco_min, fvco_max, fin, fout;
> >> +     unsigned long min_delta = ULONG_MAX, delta;
> >> +     unsigned int target_mbps = 0, mpclk, desired_mbps;
> >> +     unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
> >> +     unsigned int min_prediv, max_prediv;
> >> +     unsigned int _fbdiv, best_fbdiv, _prediv, best_prediv;
> >> +     int bpp;
> >> +     u64 freq_factor;
> >
> > This function is significantly overlapping with dw_mipi_dsi_get_lane_mbps().
> > Please extract a common helper and add it to dw-mipi-dsi.c. Other than
> > that, LGTM.
> >
> I find it difficult to understand your concern.
> The dw_mipi_dsi_mchp_get_lane_mbps() is the .get_lane_mbps phy_op
> specific to Microchip DSI wrapper. The dw_mipi_dsi_get_lane_mbps
> functionalities across different SoC wrapper is not the same to extract
> a common helper.

Ok, somebody didn't do a proper prefix naming. I was looking at
dw_mipi_dsi_get_lane_mbps() from dw-mipi-dsi-rockchip.c. It looks
pretty close to your code.

> >> +
> >> +     dsi->format = format;
> >> +     bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> >> +     if (bpp < 0) {
> >> +             dev_err(dsi->dev,
> >> +                     "failed to get bpp for pixel format %d\n",
> >> +                     dsi->format);
> >> +             return bpp;
> >> +     }
> >> +
> > --
> > With best wishes
> > Dmitry
>
> --
> Thanks and Regards,
> Manikandan M.
>


-- 
With best wishes
Dmitry
