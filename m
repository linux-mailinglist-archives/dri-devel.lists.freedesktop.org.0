Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F49FF624
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 05:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172A10E21D;
	Thu,  2 Jan 2025 04:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G8DKZxmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860310E21D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 04:56:27 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30229d5b229so118378811fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2025 20:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735793725; x=1736398525; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
 b=G8DKZxmHfCRwFetk333j+Nn7Qx1kdrlnfmPwYqudl+92atdMLo3zNjln09pl5z6m2r
 i8tUX2vbjK+4r80jRbQzZ9Ac3fe2eha2dTzKJpFyp1gZG9KMQCYakPXByrs5bkGyZcAN
 7biaRTQVqaljHw8GWx6YejRkFqvZr+OQs1I9yNGdKJVMbvUONZF2//jGXmgEiSGLB0n8
 /PAgH3BreGxMvbeBLW5X/VNsOafniOkdoSFTjZpxM8bNSoB7hwwSCPMmRrT57yPNvlbZ
 B2Td+R8zQol+4aaylMlyzo7pm3Db6DugWy3ENM6C25pt3kOJwtWtOHcJ6Z8P0p/Jzbi/
 mkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735793725; x=1736398525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
 b=LfcJSVLZSlFWiVPSFCgJkbJoSbNewGldJVMwSaCtryCOjP19OpJxSKXzsU7GRwLg7W
 4XRoMBTLs2cHVhVwVmD5ETgPt4J2igLQ6dLGoIFo7tlipB93s3IU/P/JBnrq4fD73R5+
 8LVT53wFTgTqS4el0FtsCGA/g/deahvSigLWoua+M/1LsrUdvKEQi7aeexz5aFuFWrpo
 3SHVMVyJo0SsauHOr/TzHX0B2hRBdjPcz33jdICy/ph/vZ2VeQ+o4mfB0sGO7uDvj3yd
 LbcUT2E8b3soVGsg8m+xR0Me+aJd61L7oT0Qo9VNk/Yy5A8+Cup0R9qY2FJ53eAlBE8i
 YcsQ==
X-Gm-Message-State: AOJu0YxHdhgKthu8NUKjRJkE2h5kp0hixW4F6clf+3GM4VN54VFNmVWu
 bE9yR47K464jtoGuwEMtphNszmae6BZygjqXJUtwrogQIXLFToPsKYEGsW/ZzW0=
X-Gm-Gg: ASbGncvS7g2narCELrAOo6GJ1GKEKDkIrbchxWpYTDjJAJ4w8SZ3K7xvLn+6+NmSlMP
 K+EhBxGFtTgoz4gB1ZgK0KaHHa2gDbhdwuOZF+hJMZpYh7GEph1dV9Z2xJVda+XcVVlZx++KwZY
 7bgLV/lx3eNNIXaPh7zaomokpfW786Nfh9Usw2uw/IyDWrTrN/SR90Y5Lw+VjQdlifxmInb5ga7
 BB/NowoeCdlMXvD6QXOUzn/PgO/B02/mLk8xPGbnMLRzLfiT2UDPak2cbxb2R5pZVMClC0Uvdlh
 UYQ1FScLzH0DprAHh7i9QDRVIsglSrMjU9PB
X-Google-Smtp-Source: AGHT+IGG3mukVpNeyVH5K54Lp9BzgauZG9/9OolikaWA8gUQhWcUH40nRVYnybuB5sK96BFCwAUJaQ==
X-Received: by 2002:a2e:b8c6:0:b0:300:7f87:a4f with SMTP id
 38308e7fff4ca-30468557147mr160123631fa.19.1735793725424; 
 Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbe9sm41388161fa.43.2025.01.01.20.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Date: Thu, 2 Jan 2025 06:55:22 +0200
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
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-2-marex@denx.de>
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

On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> the oldest commit which adds HDMI support is commit:
> 
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> 
> That already contains the HDMI connector node. Most follow up additions
> of HDMI support to another devices has been a variation of the same commit,
> including connector node, which is the proper way of eanbling HDMI on the
> i.MX8MP.
> 
> The rest should be covered by output_port_optional which should make systems
> with DTs without HDMI connector node work, but such DTs should be updated and
> the HDMI connector node should be added.
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
> V3: - Update commit message
>     - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>     - Enable output_port_optional
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..db5c8a76193ac 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_DISPLAY_CONNECTOR

I was going to write that it is not to be selected by anybody, but then
I stumbled upon meson driver, which also selects the symbol.

I still think that it is not to be selected by your driver as there is
no direct dependency (and there can be other bridges inbetween or the
bridge chain can end up with some other bridge). Such decisions belong
to defconfig or distribution's kernel config file.

>  	select DRM_DW_HDMI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..3d63200e468bf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
> +	plat_data->output_port_optional = true;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
