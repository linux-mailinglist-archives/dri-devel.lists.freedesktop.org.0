Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275D1E3A17
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE076E29A;
	Wed, 27 May 2020 07:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFDB6E060
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590539329; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eNQy+HfaYgDqYPYkxNUOBbsWhF12apm1sawTSRbUxM=;
 b=ph4Oq3FAxEZc30cpk4hReFsdFhqADMQEK74TqMUgoTpR8GLEmCzAm+554fKqssFp5Hgy3a
 KAnTbBiLswq+G2wB2Q9Fo1F98CE+Ad5C1tAFCZJ6V5XjuWp94dkxvgbz1mkv09J6Ed/82J
 iinOdsAP5CSOEgoKN5MtiqCiEy6N7sU=
Date: Wed, 27 May 2020 02:28:31 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/21] drm/ingenic: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <JZRYAQ.1QIOMTT6TPVS1@crapouillou.net>
In-Reply-To: <20200522135246.10134-10-tzimmermann@suse.de>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-10-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
 philippe.cornu@st.com, laurent.pinchart@ideasonboard.com,
 mihail.atanassov@arm.com, sam@ravnborg.org, alexandre.torgue@st.com,
 marex@denx.de, abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le ven. 22 mai 2020 =E0 15:52, Thomas Zimmermann <tzimmermann@suse.de> a =

=E9crit :
> The ingenic driver uses the default implementation for CMA functions. =

> The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct =

> drm_driver.
> All remaining operations are provided by CMA GEM object functions.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index eff57a1f70fb0..1c1cee367b752 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -519,18 +519,7 @@ static struct drm_driver ingenic_drm_driver_data =

> =3D {
>  	.patchlevel		=3D 0,
> =

>  	.fops			=3D &ingenic_drm_fops,
> -
> -	.dumb_create		=3D drm_gem_cma_dumb_create,
> -	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
> -	.gem_vm_ops		=3D &drm_gem_cma_vm_ops,
> -
> -	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	=3D drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		=3D drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	=3D drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap,
> +	DRM_GEM_CMA_DRIVER_OPS,
> =

>  	.irq_handler		=3D ingenic_drm_irq_handler,
>  };
> --
> 2.26.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
