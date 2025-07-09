Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8067AFE406
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1AC10E1E4;
	Wed,  9 Jul 2025 09:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q/BAUCce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E46510E1E4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:24:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49367A53273;
 Wed,  9 Jul 2025 09:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736C6C4CEF6;
 Wed,  9 Jul 2025 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752053073;
 bh=aPGoriNuFs/wVHxg/f5Y0sNlMUD1XnZAy35ZruGWHLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/BAUCcerSkHT/x0y13D1byxts05xMsQaTPY89+tDdWQoPFYHDWwL4RQhzHncenxD
 er3wlIL3ooI+WzZp90ckIk3GftlZhayLP61L5dSPMBOzIyJvbJZT03JGPe6x7mKqR4
 RLvv9chh6kAqX4elHriUgGDbYbGOV5Jyx0tLHokcqRC3Zyjr7DEpl15rFMVByQZT6t
 DQc0UYHMGRO/MEc1J4GVZqjo8i0e90+Uq3GHt/8cgWKVMheWldPNsuspAscy+K2367
 D6mqXTxpSvcXvCdkH2grYTs6KG8ResumZbZ5x0kpvXNFqn0GfXfmOWVR2EmUHSBfcI
 meV/X4UfiFbzQ==
Date: Wed, 9 Jul 2025 11:24:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Message-ID: <20250709-sophisticated-loon-of-rain-6ccdd8@houat>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
 <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty>
 <ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com>
 <20250707125954.5e0bbaa8@booty> <20250708161915.421d241c@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zzvocojadzddqva7"
Content-Disposition: inline
In-Reply-To: <20250708161915.421d241c@booty>
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


--zzvocojadzddqva7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
MIME-Version: 1.0

Hi,

On Tue, Jul 08, 2025 at 04:19:15PM +0200, Luca Ceresoli wrote:
> Hello Maxime, all,
>=20
> On Mon, 7 Jul 2025 12:59:54 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > On Mon, 7 Jul 2025 11:07:26 +0200
> > Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >=20
> > > On 03.07.2025 17:50, Luca Ceresoli wrote: =20
> > > > On Tue, 1 Jul 2025 16:27:54 +0200
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >   =20
> > > >> On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:   =
=20
> > > >>> Hello Marek, Maxime,
> > > >>>
> > > >>> thanks Marek for spotting the issue and sending a patch!
> > > >>>
> > > >>> On Mon, 30 Jun 2025 18:44:24 +0200
> > > >>> Maxime Ripard <mripard@kernel.org> wrote:
> > > >>>       =20
> > > >>>>> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_d=
evice *dp, struct drm_device *drm_dev)
> > > >>>>>   		return ret;
> > > >>>>>   	}
> > > >>>>>  =20
> > > >>>>> -	ret =3D analogix_dp_create_bridge(drm_dev, dp);
> > > >>>>> +	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > >>>>>   	if (ret) {
> > > >>>>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > > >>>>>   		goto err_unregister_aux;   =20
> > > >>>> It looks like you don't set bridge->driver_private anymore. Is i=
t on purpose?   =20
> > > >>> This looks correct to me. In current code, driver_private is used=
 to
> > > >>> hold a pointer to the driver private struct (struct
> > > >>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() =
is now
> > > >>> enough, no pointer is needed. With the patch applied, driver_priv=
ate
> > > >>> becomes unused.   =20
> > > >> Then we should remove it from the structure if it's unused.   =20
> > > > Makes sense now that struct drm_bridge is meant to be always embedd=
ed
> > > > in a driver-private struct. But several drivers are still using it,=
 so
> > > > those would need to be updated beforehand:
> > > >
> > > > $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
> > > > 23
> > > > $
> > > >
> > > > So I think this patch should be taken as it fixes a regression. Do =
you
> > > > agree on this?   =20
> > >=20
> > > Yes, please apply it as a fix :)
> > >=20
> > >=20
> > > BTW, there are 2 more bridge drivers that need a fix similar to the=
=20
> > > $subject patch:
> > >=20
> > > $ git grep "bridge =3D devm_kzalloc" drivers/gpu
> > > drivers/gpu/drm/sti/sti_hda.c:=A0 bridge =3D devm_kzalloc(dev,=20
> > > sizeof(*bridge), GFP_KERNEL);
> > > drivers/gpu/drm/sti/sti_hdmi.c: bridge =3D devm_kzalloc(dev,=20
> > > sizeof(*bridge), GFP_KERNEL); =20
> >=20
> > Ouch. My grep logic was probably too clever and missed these obvious
> > ones. I'm taking care of converting these ones later this week as time
> > permits, unless patches are sent before.
>=20
> I think I missed those two because I searched for all calls to
> drm_bridge_add(), and converted matching drivers, but these two do now
> call drm_bridge_add() at all.
>=20
> I understand this probably works just fine, for non-DT hardware at
> least. However, doesn't this look like wrong, from a DRM bridge API
> point of view?
>=20
> Right now I'm preparing patches to convert to devm_drm_bridge_alloc(),
> but what about the following two additions:
>=20
>  * add calls to drm_bridge_add/remove() in those drivers

Yep, we definitely need to do that

>  * add a WARN in drm_bridge_attach() if the bridge was not added

We also need to update the documentation to make it more obvious,
because at the moment it's not documented that you need to add a bridge
before attaching it.

And for displaying the warning, I guess we could but I'd like to see the
implementation. If it's anything but trivial, I don't think it's worth it.

Maxime

--zzvocojadzddqva7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG41SAAKCRAnX84Zoj2+
diT3AXwJTot/GQmj1MKRa5YeY5PGG6ATpX/b0OlbGWCXiOTEaJipUA9kQe77LwLO
bGy6cp4BgLYbO9bSeHnJD3+FmHlFSogp8K+zYZq7fJ+hYiKUFXS2mgmcE6LBsve5
iXuI0wRiCA==
=uk8h
-----END PGP SIGNATURE-----

--zzvocojadzddqva7--
