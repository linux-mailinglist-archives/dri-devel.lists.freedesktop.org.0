Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B91EF342
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 10:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26252892DC;
	Fri,  5 Jun 2020 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA0892DC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 08:37:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F59D27C;
 Fri,  5 Jun 2020 10:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591346267;
 bh=a/RPO0OzT2AKJrLE2ET5CksaSq02V4xZgtBR0n6g+Mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bydqSrTo/7rsWSVTcuszmkgXfPHdtwTZOJqDZW/D1sJfL5YY2DuvCoQXj9RQzSIZ5
 /vFjQtg6p4YIUT+C4x3JCuUg260cy4sNyrNWXDqiiwW/y4Y/ENFYtGDfSfnUvrf4CC
 sMX7TjXvHZtyqsebdGbbSUWTHy8i+Ep607oq/ID8=
Date: Fri, 5 Jun 2020 11:37:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 43/43] drm: Remove struct drm_driver.gem_print_info
Message-ID: <20200605083729.GA11426@pendragon.ideasonboard.com>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-44-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605073247.4057-44-tzimmermann@suse.de>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 philippe.cornu@st.com, paul@crapouillou.net, mihail.atanassov@arm.com,
 sam@ravnborg.org, alexandre.torgue@st.com, marex@denx.de,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au,
 Emil Velikov <emil.velikov@collabora.com>, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Fri, Jun 05, 2020 at 09:32:47AM +0200, Thomas Zimmermann wrote:
> The .gem_print_info callback in struct drm_driver is obsolete and has
> no users left. Remove it.

I like code removal :-) Looking forward to the removal of more
GEM-related fields from struct drm_driver.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_gem.c |  2 --
>  include/drm/drm_drv.h     | 17 -----------------
>  2 files changed, 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index efc0367841e2b..08b3fa27ec406 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1191,8 +1191,6 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  
>  	if (obj->funcs && obj->funcs->print_info)
>  		obj->funcs->print_info(p, indent, obj);
> -	else if (obj->dev->driver->gem_print_info)
> -		obj->dev->driver->gem_print_info(p, indent, obj);
>  }
>  
>  int drm_gem_pin(struct drm_gem_object *obj)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index bb924cddc09c1..8f110a28b6a23 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -353,23 +353,6 @@ struct drm_driver {
>  	 */
>  	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
>  
> -	/**
> -	 * @gem_print_info:
> -	 *
> -	 * This callback is deprecated in favour of
> -	 * &drm_gem_object_funcs.print_info.
> -	 *
> -	 * If driver subclasses struct &drm_gem_object, it can implement this
> -	 * optional hook for printing additional driver specific info.
> -	 *
> -	 * drm_printf_indent() should be used in the callback passing it the
> -	 * indent argument.
> -	 *
> -	 * This callback is called from drm_gem_print_info().
> -	 */
> -	void (*gem_print_info)(struct drm_printer *p, unsigned int indent,
> -			       const struct drm_gem_object *obj);
> -
>  	/**
>  	 * @gem_create_object: constructor for gem objects
>  	 *

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
