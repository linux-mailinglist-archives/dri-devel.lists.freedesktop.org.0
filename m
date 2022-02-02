Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4464A7BDA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4048810E67D;
	Wed,  2 Feb 2022 23:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7BA10E509
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:46:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F73249C;
 Thu,  3 Feb 2022 00:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643845582;
 bh=CaVS0Kyks3ICR5rk8SJa5uxDJYGLEoL13EdAxXCkADA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0xvy7V/ufO+uKZdqt7Id50H5u9q//7R3gs5WhcnVu9utkRgKiHPh/Hbcv3pEn2z8
 eZEtJppXQKdfsFR4V+6YAAZxaRtVqJ+KLv0VaGuAqrlwPrWmPrNIxVC1SZIHcgvdK+
 tZ/FQ13PoesHBCEjpFyWu/tQiJJ5izm4JUOAf/QI=
Date: Thu, 3 Feb 2022 01:45:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
Message-ID: <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

Thank you for the patch.

On Tue, Feb 01, 2022 at 12:07:17PM +0100, Christoph Niedermaier wrote:
> Without the data-mapping devicetree property my display won't
> work properly. It is flickering, because the bus flags won't
> be assigned without a defined bus format by the imx parallel
> display driver. There was a discussion about the removal [1]
> and an agreement that a better solution is needed, but it is
> missing so far. So what would be the better approach?
>
> [1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
> 
> This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3c08f9827acf..2c683d94a3f3 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>  	struct panel_desc *desc;
>  	unsigned int bus_flags;
>  	struct videomode vm;
> +	const char *mapping;
>  	int ret;
>  
>  	np = dev->of_node;
> @@ -477,6 +478,16 @@ static int panel_dpi_probe(struct device *dev,
>  	of_property_read_u32(np, "width-mm", &desc->size.width);
>  	of_property_read_u32(np, "height-mm", &desc->size.height);
>  
> +	of_property_read_string(np, "data-mapping", &mapping);
> +	if (!strcmp(mapping, "rgb24"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	else if (!strcmp(mapping, "rgb565"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +	else if (!strcmp(mapping, "bgr666"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +	else if (!strcmp(mapping, "lvds666"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;

You're right that there's an issue, but a revert isn't the right option.
The commit you're reverting never made it in a stable release, because
it was deemed to not be a good enough option.

First of all, any attempt to fix this should include an update to the DT
binding. Second, as this is about DPI panels, the LVDS option should be
dropped. Finally, I've shared some initial thoughts in [1], maybe you
can reply to that e-mail to continue the discussion there ?

https://lore.kernel.org/all/20200303185531.GJ11333@pendragon.ideasonboard.com/

> +
>  	/* Extract bus_flags from display_timing */
>  	bus_flags = 0;
>  	vm.flags = timing->flags;

-- 
Regards,

Laurent Pinchart
