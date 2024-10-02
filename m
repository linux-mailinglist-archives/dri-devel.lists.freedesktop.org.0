Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0498D1E7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC3810E074;
	Wed,  2 Oct 2024 11:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Txg87ZnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E037C10E074
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 11:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96DECA43A88;
 Wed,  2 Oct 2024 11:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BA9C4CECD;
 Wed,  2 Oct 2024 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727866951;
 bh=9j2BeEGbLd2/42+mKnTsM3XBzovb8J2sED2Thy2UDJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Txg87ZnAx6t5DXL/Bltm0vLfwCEHLrh/euzGIVbfeKqbTdzNiE9c79d2B+EHvZSdN
 1xfoTFJqC8p8qVrzINEdSMyqttcWPT7ybgt60O3o+MHUmKKGDh9oqiNmkQhTvmAuko
 Rd6v12h7BjtWhNv1373RveOh1hFU1p3r6M5pj2kKkPuFKPM8MfpvwUYH/qEAvQJkiq
 aq9cUB6AN1ZvwI7VLe/9isEOyGDM+FFht5FftNMt5/RaQheEdjMEYEr1dogqcpllBz
 mL0KV/fAEcDkvqIN0TEjZ2vI9ZzpnrXWC2z0T4tvCZzJ2jbejT7G3NEImUNAhrvU8O
 Hcd2wD7/xLHew==
Date: Wed, 2 Oct 2024 13:02:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Yao Zi <ziyao@disroot.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
Message-ID: <20241002-vengeful-vivacious-salamander-cdc9f7@houat>
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
 <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="owesevwxs64vyreh"
Content-Disposition: inline
In-Reply-To: <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
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


--owesevwxs64vyreh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+ Jocelyn

On Wed, Oct 02, 2024 at 09:59:57AM GMT, Neil Armstrong wrote:
> > diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meso=
n/meson_plane.c
> > index b43ac61201f3..b2def784c00d 100644
> > --- a/drivers/gpu/drm/meson/meson_plane.c
> > +++ b/drivers/gpu/drm/meson/meson_plane.c
> > @@ -20,6 +20,8 @@
> >   #include <drm/drm_framebuffer.h>
> >   #include <drm/drm_gem_atomic_helper.h>
> >   #include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_panic.h>
> >   #include "meson_plane.h"
> >   #include "meson_registers.h"
> > @@ -419,10 +421,49 @@ static void meson_plane_atomic_disable(struct drm=
_plane *plane,
> >   	priv->viu.osd1_enabled =3D false;
> >   }
> > +static int meson_plane_get_scanout_buffer(struct drm_plane *plane,
> > +					  struct drm_scanout_buffer *sb)
> > +{
> > +	struct meson_plane *meson_plane =3D to_meson_plane(plane);
> > +	struct meson_drm *priv =3D meson_plane->priv;
> > +	struct drm_framebuffer *fb;
> > +
> > +	if (!meson_plane->enabled)
> > +		return -ENODEV;
> > +
> > +	if (priv->viu.osd1_afbcd) {
> > +		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
>=20
> This should be meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)
>=20
> You should call:
>=20
> 			if (priv->afbcd.ops) {
> 				priv->afbcd.ops->reset(priv);
> 				priv->afbcd.ops->disable(priv);
> 			}

I'm not sure it's a good idea. This code is run in the panic path, and
it comes with strict requirements that these functions don't have.

It'll be incredibly easy to add a sleeping call or a lock in there.

On a more fundamental level, I'm not sure we should be disableing AFBC
at all. Do we even have the guarantee that the buffer is large enough to
hold XRGB8888 pixels?

Maxime

--owesevwxs64vyreh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZv0oPwAKCRAnX84Zoj2+
drdoAYDUbD1TVzoD+vFsR/eZbWvIGzpO8oTzWhSg6rnB+ndSUhyUNF7jPYk6mlWQ
f0WykIcBgP6bb96gVvv8ODlkA5LKqj/JuphXpiLFhHc4hHZruUeOGcwCa1iSYoyg
0iDapEKO1A==
=l1k1
-----END PGP SIGNATURE-----

--owesevwxs64vyreh--
