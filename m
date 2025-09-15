Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23EDB56DA8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781F210E26D;
	Mon, 15 Sep 2025 00:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cA0AaN9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDB510E269
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:52:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMMd2F024273
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xGD01IAG8EgiNoSNBgigNyCq
 I9uoRjgAYy7dh2aPLpg=; b=cA0AaN9BcqNT4vuekkirm+8JldCOKOonsyr0WXvd
 824h9qQMKE3xROJI5HdgmFWvleZTyjLaH/LNk+WXuQ3N2rICLY5LBouWOruq2lL9
 iPN9ym4R97Nqj5WQzIu2kY9gb5XcsP9NBHLbriZ1/MiHZUYzbIz33nU+BpQDnSu7
 XF53BH2lwNqtTSwhyiTkmNc922PYo8EKAhmhgIanQTl6ORO62R3b7LncLt6VWuuQ
 luDywLsuutsP26H/2n+dYMP2IeNaKbSW7K/jTyhYC8uv8kBft9zte2ofcSZnzfFv
 2ThC6fCUHM/h/AxLXhlH6kuSooeecbFv9/6s89s2qXZ31Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv33pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:52:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b7a5595a05so9372511cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 17:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757897562; x=1758502362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGD01IAG8EgiNoSNBgigNyCqI9uoRjgAYy7dh2aPLpg=;
 b=J28Zs9ALDRLw6iRkpVg3x7xbuub8nJrHvFTMrkfnHLFNCzVMAVSuysU9ZIeKwaOJtT
 4+jb9MYMlMLlVQydcW2bNcnemY7yyVsPjc9pwVcGT/hsj24DF2/Mq5q68CPeO6vVeI5/
 66iWDlWMMZjIcXRGMuzCapVRs0Ynz+FxJ5Nl2mPt/nmLtzhTYzhTWU5SMkcaWfhuse/D
 ff1AJraOUMpWgkIEFhQaX/DB1PuW0ZANM49cTuJH8tgr4rIzUyIUhNMJ+qauFhuk9hr9
 sDuQJhnlWv+FLa8+7eoWm3PKhfHjm3TsFKgKyEixkxhc/mkSFcfLDw4MkSF0V8U/spuv
 NtTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiYKieEIg0xFUpNI5AByjQEQ7Peg1+vW11YPNktUcgLdoiz2qCs46GXhOIL7FvPGxaRbkL0MZ+4rE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcR+J4BAiVw/56jNJri1m/9cV/HTFKjrxBIPJMNM4GFWm/Z+EJ
 FlPk8g8jHuijmSmgOQWpBBHuSqGECbofyUV8SzbZrWEtIjViEka98dTXIRG+oyNyi7pPgdhjp6m
 +Zeg5s9yxXRP6c0N35rUe4vdairZD7FJ110I+ZPiYjAMZ/ORtNT8FmzyvefCl690z9fmsRB0=
X-Gm-Gg: ASbGncuI9UaOFV3T0ePwhKzscnWpMvgOx18qEcyf9Nm7L/t2qnhtHOiAvfcGHyA2zQV
 GtE6BwOyxoCGkFITNTahwhcDssdwvBhfo+ooXEeLbkGMCsmtyQ4dX6nSi3zgTYT6fyTcwvTIp3H
 ydqKbEC0jK55IVAfxI4eu7Ktql9vU2HbWxYfTU1sdJaH5qKdp7oG82uapBTFv6f2XjpbLD+DvnG
 +uUHdi30smTpPNAi+z2XITV6UaYnCiS7L+LMv0u9gG8wiLRwRkjvcvnQ6Jk0LVr+43Xpg9CWeaX
 3v7MlMMBiZtQw9Ltor2jdNxgcroJD4LjSY4eUc5xqFOP5kQX5rJpj8s7CSj2DzLfixKvAOeLtJO
 yu4Ro1Xbk8oDLRDRa33nKShX/v5609FdrKBY4GXp3tU0Nq7dSi43R
X-Received: by 2002:a05:622a:118b:b0:4b5:f27c:85f7 with SMTP id
 d75a77b69052e-4b77d1be2ccmr131463491cf.83.1757897561587; 
 Sun, 14 Sep 2025 17:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiGMEuGK2fMfFM34phtPtyHS2iG9N9oi8+i6v0OXyNy6+2Ly3OhQQUrROvts0Wj6aG5FZabQ==
X-Received: by 2002:a05:622a:118b:b0:4b5:f27c:85f7 with SMTP id
 d75a77b69052e-4b77d1be2ccmr131463361cf.83.1757897561109; 
 Sun, 14 Sep 2025 17:52:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fbdsm3179435e87.30.2025.09.14.17.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 17:52:39 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH 1/3] drm/panel: Add LG SW49410 Panel
Message-ID: <nhmlgiyde2xlevrpsvtjjqmewv3q3ifbyerdzxhdaalv7oysyq@yhlnddkudwwn>
References: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
 <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7635b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=d-sDLFr6_VOwSKI_PXAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: --ZA9rl2J6xPuvOMHFpcTdEWnn11Xoas
X-Proofpoint-GUID: --ZA9rl2J6xPuvOMHFpcTdEWnn11Xoas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX21BHjDRR+17y
 he9z7xp80kfH14FwQjnngHmyeOfrFI2I4Rnpc4JvcPgGEpds8F7cXsz8XR3JuucOgrbf+6vGF3H
 u7lqhfTX7somPWC8dgoy0RmZXvq3aWhJBRwXoZ3fHEEksSmb20JQbHKa4QiCR0lYynQQcTXYfCI
 hv5sfcflpvy2isc6ZWqDTHVrST9SGdQWTl4lhhQNkbcZk+WQJIqN6apWkEAm2E6pZD072LalQQu
 maAss4wZr81erftQHmDG29Qy84kUkh304OzCt4qJP7by33wrueuxuOzopTFSlxzObSvrRe0IOtM
 Gspt+eh0tD9qESZ7n9f+0sQ4WSEKGG4JtOLawLddD0dKhs8sI6ZvDtINrQMAtZjUF0PmpYLKnmP
 5tLpNsjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017
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

On Wed, Sep 10, 2025 at 08:08:20PM -0700, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Added panel driver used by LG G7 ThinQ (judyln)
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> Co-authored-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  drivers/gpu/drm/panel/Kconfig            |  14 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lg-sw49410.c | 513 +++++++++++++++++++++++++++++++
>  3 files changed, 528 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index cfebb08e8a62680a14a500d28decfafc2daf743a..48144848c8d3282d231d7495d694381456dde63b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -406,6 +406,20 @@ config DRM_PANEL_LG_SW43408
>  	  pixel. It provides a MIPI DSI interface to the host and has a
>  	  built-in LED backlight.
>  
> +config DRM_PANEL_LG_SW49410
> +	tristate "LG SW49410 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_DP_HELPER

You should not need DP helper for DSI panel

> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Say Y here if you want to enable support for LG sw49410 panel.
> +	  The panel has a 1440x3120@60Hz resolution and uses 24 bit RGB per
> +	  pixel. It provides a MIPI DSI interface to the host and has a
> +	  built-in LED backlight.
> +
>  config DRM_PANEL_MAGNACHIP_D53E6EA8966
>  	tristate "Magnachip D53E6EA8966 DSI panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 714cbac830e3f0be3659f1907c5dbacef863bbd8..f7f6d232ad9c7163f328d94f4461fcb3379f998b 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>  obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
> +obj-$(CONFIG_DRM_PANEL_LG_SW49410) += panel-lg-sw49410.o
>  obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw49410.c b/drivers/gpu/drm/panel/panel-lg-sw49410.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1243577f9280ecf3e906d2ad001c6c313b3af495
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lg-sw49410.c
> @@ -0,0 +1,513 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +// Copyright (c) 2025, The Linux Foundation. All rights reserved.
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
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +struct sw49410_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline
> +struct sw49410_panel *to_sw49410_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct sw49410_panel, panel);
> +}
> +
> +static void sw49410_panel_reset(struct sw49410_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int sw49410_panel_on(struct sw49410_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_page_address(ctx->dsi, 0x0000, 0x0c2f);

Please rewrite this function to only use _multi() functions. Don't use
functions that take mipi_dsi_device directly. If anything is missing,
please add new wrappers.

> +	mipi_dsi_dcs_set_display_brightness(ctx->dsi, 0x00ff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     0x2c);

[..]

> +
> +static int sw49410_panel_prepare(struct drm_panel *panel)
> +{
> +	struct sw49410_panel *ctx = to_sw49410_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	sw49410_panel_reset(ctx);
> +
> +	ret = sw49410_panel_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		return ret;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);

mipi_dsi_picture_parameter_set_multi(), move this call and the next ones
to sw49410_panel_on().

> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_compression_mode(ctx->dsi, true);

mipi_dsi_compression_mode_multi

> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable compression mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(28);

mipi_dsi_msleep

> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
