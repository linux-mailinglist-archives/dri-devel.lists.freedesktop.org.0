Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A85813340
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466FE10E931;
	Thu, 14 Dec 2023 14:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EBD10E931
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 14:36:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4B6A2B822DF;
 Thu, 14 Dec 2023 14:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC45C433C7;
 Thu, 14 Dec 2023 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702564614;
 bh=HPhal4ajNlpqTsuk3U92+JlLB95CdzW1vgQ8BebR6Zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHRBxD0kqGb9MqIMRDO+niGms5TPec+anv/4LuSZ/iqokSoUqk/rkv1qsk3Hari2O
 dkO1L6oHHayaeIDrVIPpq7KpJZs0Iu9U6EjupebuZD12w6W4PofPfrROdHMaki9mLJ
 LrNFBGOv9uyBIxQp+i3io1YNHjrWE5nWuom/We7GMxFZXgkNMC4/5EoQ9/VlFkMqLH
 nXpsN+of/XumWb8lHa5qS3VRfC9rzH4U3nS0VGS9ntjzaJPPEx4RQD+kZ5JTZAfnkZ
 pIRzcs6AeoxVMqrNgAArRU+xT+uaXeP/jmk6Ww0UBoAFtZZ5oU/z679dmPBem3hu6v
 PobLLzJUmX4uw==
Date: Thu, 14 Dec 2023 15:36:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v5 6/6] drm/imx: Add drm_panic support
Message-ID: <qfm2tke7xiclte5ka5fx5zsvvet3cvalqfoy26fr2zuohcr7b3@f2q43zovvytw>
References: <20231103145526.628138-1-jfalempe@redhat.com>
 <20231103145526.628138-7-jfalempe@redhat.com>
 <4rmhvbb7kli4dm7swqhmjgbh5at6e4mwh73krloxanxgsd3bkv@zxz7mx4e5ft4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oglnojtkshiyizm2"
Content-Disposition: inline
In-Reply-To: <4rmhvbb7kli4dm7swqhmjgbh5at6e4mwh73krloxanxgsd3bkv@zxz7mx4e5ft4>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oglnojtkshiyizm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 02:48:21PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Nov 03, 2023 at 03:53:30PM +0100, Jocelyn Falempe wrote:
> > Proof of concept to add drm_panic support on an arm based GPU.
> > I've tested it with X11/llvmpipe, because I wasn't able to have
> > 3d rendering with etnaviv on my imx6 board.
> >=20
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>=20
> Like I said in the v6, this shouldn't be dropped because it also kind of
> documents and shows what we are expecting from a "real" driver.
>=20
> > ---
> >  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 30 ++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm=
/imx/ipuv3/imx-drm-core.c
> > index 4a866ac60fff..db24b4976c61 100644
> > --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> > +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/iosys-map.h>
> > =20
> >  #include <video/imx-ipu-v3.h>
> > =20
> > @@ -17,9 +18,12 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_fbdev_dma.h>
> > +#include <drm/drm_fb_dma_helper.h>
> > +#include <drm/drm_framebuffer.h>
> >  #include <drm/drm_gem_dma_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_managed.h>
> > +#include <drm/drm_panic.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -160,6 +164,31 @@ static int imx_drm_dumb_create(struct drm_file *fi=
le_priv,
> >  	return ret;
> >  }
> > =20
> > +static int imx_drm_get_scanout_buffer(struct drm_device *dev,
> > +				      struct drm_scanout_buffer *sb)
> > +{
> > +	struct drm_plane *plane;
> > +	struct drm_gem_dma_object *dma_obj;
> > +
> > +	drm_for_each_plane(plane, dev) {
> > +		if (!plane->state || !plane->state->fb || !plane->state->visible ||
> > +		    plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> > +			continue;
> > +
> > +		dma_obj =3D drm_fb_dma_get_gem_obj(plane->state->fb, 0);
> > +		if (!dma_obj->vaddr)
> > +			continue;
> > +
> > +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> > +		sb->format =3D plane->state->fb->format;
>=20
> Planes can be using a framebuffer in one of the numerous YUV format the
> driver advertises.
>=20
> > +		sb->height =3D plane->state->fb->height;
> > +		sb->width =3D plane->state->fb->width;
> > +		sb->pitch =3D plane->state->fb->pitches[0];
>=20
> And your code assumes that the buffer will be large enough for an RGB
> buffer, which probably isn't the case for a single-planar YUV format,
> and certainly not the case for a multi-planar one.
>=20
> When the driver gives back its current framebuffer, the code should check:

Oh, and also, you need to keep an eye on the solid fill support:

https://lore.kernel.org/all/20231027-solid-fill-v7-0-780188bfa7b2@quicinc.c=
om/

Because with that, a plane might not have a framebuffer anymore.

>   * If the buffer backed by an actual buffer (and not a dma-buf handle)
>   * If the buffer is mappable by the CPU
>   * If the buffer is in a format that the panic code can handle
>   * If the buffer uses a linear modifier
>=20
> Failing that, your code cannot work at the moment. We need to be clear
> about that and "gracefully" handle things instead of going forward and
> writing pixels to places we might not be able to write to.
>=20
> Which kind of makes me think, why do we need to involve the driver at
> all there?
>=20
> If in the panic code, we're going over all enabled CRTCs, finding the
> primary plane currently setup for them and getting the drm_framebuffer
> assigned to them, it should be enough to get us all the informations we
> need, right?
>=20
> Maxime



--oglnojtkshiyizm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXsTBAAKCRDj7w1vZxhR
xYPEAP43mpVh3nrZ+REHkVLrUXG3VSaCnOFDHvv3uhTUZp/ougEAyZFQ5mCCOOes
EMOtAdjf7dvkStgtmQpH9hosDoAAaA4=
=ar5y
-----END PGP SIGNATURE-----

--oglnojtkshiyizm2--
