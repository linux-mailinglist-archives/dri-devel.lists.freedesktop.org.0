Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE81E6BC6
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 21:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3BC6E201;
	Thu, 28 May 2020 19:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22E6E201
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:57:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j8so31468301iog.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C1yxG+5EPv3E4hC3r9qMne3qQ1WLqR3rVkfPRz5Lf7A=;
 b=ljx9dXRHcgrzCWkmHPi9SlbQ5EfIDq8/LRBgoDXHY9QktpvUIpw+yGeqA/QeV4/QWl
 wc7Wf2KLZIKPRra4TTpRX5PFWlUyCQ0+SitniDqWo1+1WDy6ejrHoaKOwTo888PwLvkB
 TBpWrcOUXd+DvAZ2//f4CgvraUaPCounvJG/1fV/yo0JOYybPrMleqXJXFCSSDuZ7ONy
 /ohk7Y8z3Q7JlH/Kbms/ZDgLYwlG386YvpbFvbQy1zfODm2xZdEKAaFo889yNsdN62Nl
 bckxtL02xnV5NXPWt4tKnbD1QoBVRr2+NGRjmrIryxZepsOdTHVqO8xR1sxvKymI7saD
 k0Ew==
X-Gm-Message-State: AOAM5331vg4AyyjfroiqGH5KHT1n4ka6gujjAkUYnosoSZOVDPQ59bhy
 nTs5m8Fg32nlL18qKtGavg==
X-Google-Smtp-Source: ABdhPJwSH+qxIcWv8h/fKAo6SOTAQdcOfw2m0OYWjSIpa6W5m47BsalTXqPIM9X9CbE4u2CeC3MeOw==
X-Received: by 2002:a02:95a6:: with SMTP id b35mr4047016jai.40.1590695839998; 
 Thu, 28 May 2020 12:57:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b18sm3627485ilh.77.2020.05.28.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 12:57:19 -0700 (PDT)
Received: (nullmailer pid 580805 invoked by uid 1000);
 Thu, 28 May 2020 19:57:17 -0000
Date: Thu, 28 May 2020 13:57:17 -0600
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [RFC PATCH 4/6] drm/bridge/nwl-dsi: Drop mux handling
Message-ID: <20200528195717.GA568887@bogus>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <951688795f969ebcbf9fb3c38065ccce6f488235.1589548223.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951688795f969ebcbf9fb3c38065ccce6f488235.1589548223.git.agx@sigxcpu.org>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 03:12:13PM +0200, Guido G=FCnther wrote:
> This will be handled via the mux-input-bridge.

You can't do this. What happens booting a kernel with this change and an =

un-modified dtb? You just broke it.

> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  1 -
>  drivers/gpu/drm/bridge/nwl-dsi.c | 61 --------------------------------
>  2 files changed, 62 deletions(-)
> =

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 3886c0f41bdd..11444f841e35 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -78,7 +78,6 @@ config DRM_NWL_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
>  	select GENERIC_PHY_MIPI_DPHY
>  	select MFD_SYSCON
> -	select MULTIPLEXER
>  	select REGMAP_MMIO
>  	help
>  	  This enables the Northwest Logic MIPI DSI Host controller as
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index b14d725bf609..8839f333f39c 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -12,7 +12,6 @@
>  #include <linux/math64.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> -#include <linux/mux/consumer.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
> @@ -44,9 +43,6 @@ enum transfer_direction {
>  	DSI_PACKET_RECEIVE,
>  };
>  =

> -#define NWL_DSI_ENDPOINT_LCDIF 0
> -#define NWL_DSI_ENDPOINT_DCSS 1
> -
>  struct nwl_dsi_plat_clk_config {
>  	const char *id;
>  	struct clk *clk;
> @@ -94,7 +90,6 @@ struct nwl_dsi {
>  	struct reset_control *rst_esc;
>  	struct reset_control *rst_dpi;
>  	struct reset_control *rst_pclk;
> -	struct mux_control *mux;
>  =

>  	/* DSI clocks */
>  	struct clk *phy_ref_clk;
> @@ -1018,14 +1013,6 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  	}
>  	dsi->tx_esc_clk =3D clk;
>  =

> -	dsi->mux =3D devm_mux_control_get(dsi->dev, NULL);
> -	if (IS_ERR(dsi->mux)) {
> -		ret =3D PTR_ERR(dsi->mux);
> -		if (ret !=3D -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dsi->dev, "Failed to get mux: %d\n", ret);
> -		return ret;
> -	}
> -
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -1073,47 +1060,6 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  	return 0;
>  }
>  =

> -static int nwl_dsi_select_input(struct nwl_dsi *dsi)
> -{
> -	struct device_node *remote;
> -	u32 use_dcss =3D 1;
> -	int ret;
> -
> -	remote =3D of_graph_get_remote_node(dsi->dev->of_node, 0,
> -					  NWL_DSI_ENDPOINT_LCDIF);
> -	if (remote) {
> -		use_dcss =3D 0;
> -	} else {
> -		remote =3D of_graph_get_remote_node(dsi->dev->of_node, 0,
> -						  NWL_DSI_ENDPOINT_DCSS);
> -		if (!remote) {
> -			DRM_DEV_ERROR(dsi->dev,
> -				      "No valid input endpoint found\n");
> -			return -EINVAL;
> -		}
> -	}
> -
> -	DRM_DEV_INFO(dsi->dev, "Using %s as input source\n",
> -		     (use_dcss) ? "DCSS" : "LCDIF");
> -	ret =3D mux_control_try_select(dsi->mux, use_dcss);
> -	if (ret < 0)
> -		DRM_DEV_ERROR(dsi->dev, "Failed to select input: %d\n", ret);
> -
> -	of_node_put(remote);
> -	return ret;
> -}

You could however make these functions generic for any bridge to use. =

Define a function that checks for mux-control property and if found sets =

up the mux (IIRC, there's already a concept of a default state). That =

should be callable from somewhere generic too.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
