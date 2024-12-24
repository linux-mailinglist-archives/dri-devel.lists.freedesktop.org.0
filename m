Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA849FB930
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 05:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA6010E190;
	Tue, 24 Dec 2024 04:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uxYJilQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3560A10E190
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 04:22:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000dso5461734e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014073; x=1735618873; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
 b=uxYJilQkaRtk/AYNqj9Sk4F82JsdL0MBWQfBKGLe3jnYuyuKshepJA0SR2MjHpjrot
 aM7iURUdfA9IQ93WJEIYO+6Jbs0wzbwftjc27iP/HcSPMWAPnwmGcVLfS9ZQ/kDOq5PS
 iMjFIMHqIwb1ER7RvrFKb+8HgunRffTs5TuY/fadr/giZZoEpeUPUKs/xsLJFOm8G1ad
 7iY9TBnKJs1IoOmxGDA/fLYD6hrEHALnLoy/mg1CJvHOlEm17waBItsO+z4e0R8zAE+l
 /Fy9MHAVIT3j6H9QrS5HqZ0p0owmqWi9aM5CeSUOySYDDsP1gzItmyiNhKNZnl4alZ36
 lhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014073; x=1735618873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
 b=cyYrlDuwP4X2sS5SXsNAXpyjxbVXfMeXtz85GchJVhF43GbESvHtpMHjopKYHQeAG9
 F5t5kWqRY3WRkMbhFXVQXAEiUYc4d946k12oBTkrXuUpLCr6APZZGJLpzLing8nff6VN
 K2xl16zjC99eY+K+JZNdqwn1C3DUi2ooINqYPoefgIr5MFbAcxr2kPKYDS/5fdJ9awAg
 eUqcsYB+Dg8/cPS0ww5OG/4fJK8cuWxDe05TYjt7DxP36TP/aLzfCPb6AkU4jtu0OX2N
 zm3qCcN0YGRSzwlPgMNqqlE2n23/CnQla67awABsry0+WcwOHNb0rXqWDxsYckuymMbx
 dBHQ==
X-Gm-Message-State: AOJu0YwUtmOTPuzFZopVQiC1495+JTIiLNe1aoBD19qC9Rd6S99kp7TG
 zJThIMB91ifflTH33rpJyPOdO1CCadKVQ1alM7A8rZsraEgCZ1myNYngS+gqdVo=
X-Gm-Gg: ASbGncs1xHuMCLNnl5fMhidYtjZUJMEoaLnsRE36D3XmV0SWCVLqa5fPsgRSRj9+PbA
 zDQj/mcXdtMrjxY1EyeCBPwnR/8G8q3iLNcPdNUjgX8cL6bComwc2u1dU8C0LR+Tsi9oM2nLJw3
 BudoJKVTlXjmPFG/BVBW00qtoH/gYiYUYH0pnGKEaMKbCCuS8TA2cF8PidXCF2seI6lZ4f6KY1y
 4Q+ZKg+n6KlyPD7apv+h4kmtviUDzcP01zT2l2VHG9DZqMr93DZSfLL9lakf0U3y8uReDFsyE10
 N3XOBwDNcBwji5V9iZu1ZH68D/rT2td3lBsX
X-Google-Smtp-Source: AGHT+IFnlazk3zp2S6fkLYTj/a/W11Tm8ZQUr/v3AouJ9WApV+dF+AqJMzBzTQnC6rJjgT9VhrQ83Q==
X-Received: by 2002:a05:6512:b22:b0:540:5b5c:c196 with SMTP id
 2adb3069b0e04-5422956be94mr4052066e87.56.1735014072611; 
 Mon, 23 Dec 2024 20:21:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422360054csm1498117e87.111.2024.12.23.20.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:21:11 -0800 (PST)
Date: Tue, 24 Dec 2024 06:21:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
References: <20241224014701.253490-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-1-marex@denx.de>
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

On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..d8e9fbf75edbb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
>  	help
>  	  Choose this to enable support for the internal HDMI TX Parallel
>  	  Video Interface found on the Freescale i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..4ebae5ad072ad 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;

Quoting my feedback to a similar Liu's patch:

This will break compatibility with older DT files, which don't have
output port. I think you need to add output_port_optional flag to
dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
is set, but there is no remote node.

>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
