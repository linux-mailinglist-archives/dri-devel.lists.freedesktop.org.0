Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BD17C7D0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 22:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC1D6E519;
	Fri,  6 Mar 2020 21:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12D6E512
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 21:26:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8B00A2001E;
 Fri,  6 Mar 2020 22:26:30 +0100 (CET)
Date: Fri, 6 Mar 2020 22:26:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/22] drm/atmel-hlcdc: Use simple encoder
Message-ID: <20200306212629.GB17369@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=ISFmP3M1dWiz_JBsLmoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 tomi.valkeinen@ti.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, ludovic.desroches@microchip.com,
 kgene@kernel.org, linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 04:59:30PM +0100, Thomas Zimmermann wrote:
> The atmel-hlcdc driver uses an empty implementation for its encoder.
> Replace the code with the generic simple encoder.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> index e2019fe97fff..43bc709e3523 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> @@ -11,9 +11,10 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of_graph.h>
>  
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_bridge.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "atmel_hlcdc_dc.h"
>  
> @@ -22,10 +23,6 @@ struct atmel_hlcdc_rgb_output {
>  	int bus_fmt;
>  };
>  
> -static const struct drm_encoder_funcs atmel_hlcdc_panel_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static struct atmel_hlcdc_rgb_output *
>  atmel_hlcdc_encoder_to_rgb_output(struct drm_encoder *encoder)
>  {
> @@ -98,9 +95,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>  		return -EINVAL;
>  	}
>  
> -	ret = drm_encoder_init(dev, &output->encoder,
> -			       &atmel_hlcdc_panel_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> +	ret = drm_simple_encoder_init(dev, &output->encoder,
> +				      DRM_MODE_ENCODER_NONE);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
