Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DAD1EFB05
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765BF6E90F;
	Fri,  5 Jun 2020 14:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9AF6E90F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 14:24:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5255A80511;
 Fri,  5 Jun 2020 16:23:53 +0200 (CEST)
Date: Fri, 5 Jun 2020 16:23:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/43] drm/cma-helper: Rename symbols from
 drm_cma_gem_ to drm_gem_cma_
Message-ID: <20200605142351.GA204352@ravnborg.org>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-2-tzimmermann@suse.de>
 <20200605084026.GB11426@pendragon.ideasonboard.com>
 <8e2e8394-4110-9fb6-e99e-0495cf9f7218@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e2e8394-4110-9fb6-e99e-0495cf9f7218@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=zqeJn9o-U7iyyRRzNl8A:9 a=wPNLvfGTeEIA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
 philippe.cornu@st.com, paul@crapouillou.net,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mihail.atanassov@arm.com,
 alexandre.torgue@st.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 shawnguo@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 05, 2020 at 04:15:46PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 05.06.20 um 10:40 schrieb Laurent Pinchart:
> > Hi Thomas,
> > =

> > Thank you for the patch.
> > =

> > On Fri, Jun 05, 2020 at 09:32:05AM +0200, Thomas Zimmermann wrote:
> >> This fixes the naming of several symbols within CMA helpers. No functi=
onal
> >> changes are made.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > Thank you for the patch.
> > =

> > Speaking of naming, I wish we could rename drm_gem_cma_* to something
> > else, as those helpers don't use CMA directly (and may not use it at
> > all), but I think that would be too much intrusive changes for too
> > little gain :-(
> =

> I agree. Calling them GEM DMA helpers would be more precise. But I don't
> really see an easy solution without either a big patch that touches
> everything, or a lot of small patches with ugly intermediate states.
> =

> IMHO the best option would probably be an additional header file
> drm_gem_dma_helper.h that defines a dma name for each cma name. Drivers
> could then be converted individually with a single per-driver patch.

From todo.rst:

"
Rename CMA helpers to DMA helpers
---------------------------------

CMA (standing for contiguous memory allocator) is really a bit an accident =
of
what these were used for first, a much better name would be DMA helpers. In=
 the
text these should even be called coherent DMA memory helpers (so maybe CDM,=
 but
no one knows what that means) since underneath they just use dma_alloc_cohe=
rent.

Contact: Laurent Pinchart, Daniel Vetter

Level: Intermediate (mostly because it is a huge tasks without good partial
milestones, not technically itself that challenging)
"

The same?

	Sam

> =

> Best regards
> Thomas
> =

> > =

> >> ---
> >>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  2 +-
> >>  drivers/gpu/drm/drm_gem_cma_helper.c    | 10 +++++-----
> >>  include/drm/drm_gem_cma_helper.h        |  4 ++--
> >>  3 files changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm=
/aspeed/aspeed_gfx_drv.c
> >> index 6b27242b9ee3c..5e7ea0459d018 100644
> >> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> @@ -188,7 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
> >>  =

> >>  static struct drm_driver aspeed_gfx_driver =3D {
> >>  	.driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATO=
MIC,
> >> -	.gem_create_object	=3D drm_cma_gem_create_object_default_funcs,
> >> +	.gem_create_object	=3D drm_gem_cma_create_object_default_funcs,
> >>  	.dumb_create		=3D drm_gem_cma_dumb_create,
> >>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> >>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> >> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/dr=
m_gem_cma_helper.c
> >> index b3db3ca7bd7a7..842e2fa332354 100644
> >> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> >> @@ -572,7 +572,7 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_objec=
t *obj, void *vaddr)
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
> >>  =

> >> -static const struct drm_gem_object_funcs drm_cma_gem_default_funcs =
=3D {
> >> +static const struct drm_gem_object_funcs drm_gem_cma_default_funcs =
=3D {
> >>  	.free =3D drm_gem_cma_free_object,
> >>  	.print_info =3D drm_gem_cma_print_info,
> >>  	.get_sg_table =3D drm_gem_cma_prime_get_sg_table,
> >> @@ -581,7 +581,7 @@ static const struct drm_gem_object_funcs drm_cma_g=
em_default_funcs =3D {
> >>  };
> >>  =

> >>  /**
> >> - * drm_cma_gem_create_object_default_funcs - Create a CMA GEM object =
with a
> >> + * drm_gem_cma_create_object_default_funcs - Create a CMA GEM object =
with a
> >>   *                                           default function table
> >>   * @dev: DRM device
> >>   * @size: Size of the object to allocate
> >> @@ -593,7 +593,7 @@ static const struct drm_gem_object_funcs drm_cma_g=
em_default_funcs =3D {
> >>   * A pointer to a allocated GEM object or an error pointer on failure.
> >>   */
> >>  struct drm_gem_object *
> >> -drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_=
t size)
> >> +drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_=
t size)
> >>  {
> >>  	struct drm_gem_cma_object *cma_obj;
> >>  =

> >> @@ -601,11 +601,11 @@ drm_cma_gem_create_object_default_funcs(struct d=
rm_device *dev, size_t size)
> >>  	if (!cma_obj)
> >>  		return NULL;
> >>  =

> >> -	cma_obj->base.funcs =3D &drm_cma_gem_default_funcs;
> >> +	cma_obj->base.funcs =3D &drm_gem_cma_default_funcs;
> >>  =

> >>  	return &cma_obj->base;
> >>  }
> >> -EXPORT_SYMBOL(drm_cma_gem_create_object_default_funcs);
> >> +EXPORT_SYMBOL(drm_gem_cma_create_object_default_funcs);
> >>  =

> >>  /**
> >>   * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driv=
er's
> >> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cm=
a_helper.h
> >> index 947ac95eb24a9..64b7e9d42129a 100644
> >> --- a/include/drm/drm_gem_cma_helper.h
> >> +++ b/include/drm/drm_gem_cma_helper.h
> >> @@ -107,7 +107,7 @@ void *drm_gem_cma_prime_vmap(struct drm_gem_object=
 *obj);
> >>  void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr=
);
> >>  =

> >>  struct drm_gem_object *
> >> -drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_=
t size);
> >> +drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_=
t size);
> >>  =

> >>  /**
> >>   * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a=
 virtual
> >> @@ -118,7 +118,7 @@ drm_cma_gem_create_object_default_funcs(struct drm=
_device *dev, size_t size);
> >>   * imported buffers.
> >>   */
> >>  #define DRM_GEM_CMA_VMAP_DRIVER_OPS \
> >> -	.gem_create_object	=3D drm_cma_gem_create_object_default_funcs, \
> >> +	.gem_create_object	=3D drm_gem_cma_create_object_default_funcs, \
> >>  	.dumb_create		=3D drm_gem_cma_dumb_create, \
> >>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
> >>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
