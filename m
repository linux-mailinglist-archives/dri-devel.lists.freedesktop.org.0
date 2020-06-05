Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A630D1EF2F6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 10:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1076E8B1;
	Fri,  5 Jun 2020 08:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474D36E8B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 08:16:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AA8927C;
 Fri,  5 Jun 2020 10:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591344991;
 bh=p5Ur/j+GarV1LooTi6qb8L1iIzILFAnLiwD57jXZ0O8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OjJe1Wb1VnaGby2M9kNOSA+o7Sj5wfl/82iRY85tEAZ82oy7lGgUqNmTOGpPENlsS
 YmanF5uYyz2MGgcGBA1LBzjiW4HXDTJUREOfnSD45i8Bpx52Ot/MF7fv2kmULoj2ZV
 ZiGMo0jv6v8ukhX3xPhDKNc/sAWMmAnkxORGvBDg=
Date: Fri, 5 Jun 2020 11:16:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 03/43] drm/cma-helper: Add DRM_GEM_CMA_DRIVER_OPS to
 set default GEM CMA functions
Message-ID: <20200605081613.GA9325@pendragon.ideasonboard.com>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605073247.4057-4-tzimmermann@suse.de>
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

On Fri, Jun 05, 2020 at 09:32:07AM +0200, Thomas Zimmermann wrote:
> The macro to DRM_GEM_CMA_DRIVER_OPS sets GEM callbacks in struct drm_driver
> to their defaults for CMA. An variant of the macro is provided for drivers

s/An variant/A variant/

> that override the default .dumb_create callback. Adapt drivers to the changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  include/drm/drm_gem_cma_helper.h | 46 +++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index 2cdf333ae585d..5e1e595c0e72d 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -109,6 +109,42 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>  struct drm_gem_object *
>  drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
>  
> +/**
> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
> + * @dumb_create_func: callback function for .dumb_create
> + *
> + * This macro provides a shortcut for setting the default GEM operations in the
> + * &drm_driver structure.
> + *
> + * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
> + * override the default implementation of &struct rm_driver.dumb_create. Use
> + * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
> + * on imported buffers should use
> + * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
> + */
> +#define DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
> +	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
> +	.dumb_create		= (dumb_create_func), \

Do we need parentheses here ?

> +	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
> +	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
> +	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
> +	.gem_prime_mmap		= drm_gem_cma_prime_mmap
> +
> +/**
> + * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
> + *
> + * This macro provides a shortcut for setting the default GEM operations in the
> + * &drm_driver structure.
> + *
> + * Drivers that come with their own implementation of
> + * &struct drm_driver.dumb_create should use
> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead. Use
> + * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
> + * on imported buffers should use DRM_GEM_CMA_DRIVER_OPS_VMAP instead.
> + */
> +#define DRM_GEM_CMA_DRIVER_OPS \
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
> +
>  /**
>   * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE - CMA GEM driver operations
>   *                                                ensuring a virtual address
> @@ -120,8 +156,10 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
>   * imported buffers.
>   *
>   * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS_VMAP for drivers that
> - * override the default implementation of &struct rm_driver.dumb_create. Use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
> + * override the default implementation of &struct drm_driver.dumb_create. Use
> + * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
> + * virtual address on imported buffers should use
> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
>   */
>  #define DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
>  	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
> @@ -142,7 +180,9 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
>   * Drivers that come with their own implementation of
>   * &struct drm_driver.dumb_create should use
>   * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead. Use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
> + * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
> + * virtual address on imported buffers should use DRM_GEM_CMA_DRIVER_OPS
> + * instead.
>   */
>  #define DRM_GEM_CMA_DRIVER_OPS_VMAP \
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
