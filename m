Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF03AFAF85
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56F810E0DA;
	Mon,  7 Jul 2025 09:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wr4Wqbdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8618110E0DA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:21:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90B1D6143D;
 Mon,  7 Jul 2025 09:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5514C4AF09;
 Mon,  7 Jul 2025 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751880078;
 bh=cMgp7w1xzV8IZvTez7Crfym5sM3mfY6lYsuuyjV36MM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wr4Wqbdiotlti8NiuukR6NkPo/qxKP7/r0c91Aw8etczRNGxaodHte3BxLEZDrlDe
 6sdR94HNqjDxr3z2c3vrz6Z7TVrx2eCs7D30VCFSIHNa6U2WiOYVQJcTxwFw7pOU1z
 HJhTfznV6CCfa59NXuPL51GQoMMrU42HwshkKeV9hRfVC5I3T7mTlBjazyAT9lriDH
 9ovbAmYFyL/Ik9UiIowX0TetD5WMiBk1kOn47u6U/sFhipYTAMuTc7rv1BKGRBKb15
 LDqcckNLHdpfUNUo8fy0Erbgf5qtiiTqj7BR753W3tNjF/2L4KOdh7K3VtAEVVY2aL
 Q+WhKSV1nFb/g==
Date: Mon, 7 Jul 2025 11:21:15 +0200
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
Message-ID: <20250707-just-gray-sheep-1d8be4@houat>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
 <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ozqtq6qsjl6cvyk"
Content-Disposition: inline
In-Reply-To: <20250703175032.6f49f862@booty>
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


--4ozqtq6qsjl6cvyk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 05:50:32PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Tue, 1 Jul 2025 16:27:54 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:
> > > Hello Marek, Maxime,
> > >=20
> > > thanks Marek for spotting the issue and sending a patch!
> > >=20
> > > On Mon, 30 Jun 2025 18:44:24 +0200
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > > @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_dev=
ice *dp, struct drm_device *drm_dev)
> > > > >  		return ret;
> > > > >  	}
> > > > > =20
> > > > > -	ret =3D analogix_dp_create_bridge(drm_dev, dp);
> > > > > +	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > > >  	if (ret) {
> > > > >  		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > > > >  		goto err_unregister_aux;   =20
> > > >=20
> > > > It looks like you don't set bridge->driver_private anymore. Is it o=
n purpose? =20
> > >=20
> > > This looks correct to me. In current code, driver_private is used to
> > > hold a pointer to the driver private struct (struct
> > > analogix_dp_device). With devm_drm_bridge_alloc() container_of() is n=
ow
> > > enough, no pointer is needed. With the patch applied, driver_private
> > > becomes unused. =20
> >=20
> > Then we should remove it from the structure if it's unused.
>=20
> Makes sense now that struct drm_bridge is meant to be always embedded
> in a driver-private struct. But several drivers are still using it, so
> those would need to be updated beforehand:
>=20
> $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
> 23
> $

Ah, you're right, sorry for the noise.

> So I think this patch should be taken as it fixes a regression. Do you
> agree on this?

As far as I know, that commit only exists in drm-misc-next. Also, it
should have a Fixes tag.

Maxime

--4ozqtq6qsjl6cvyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGuRhwAKCRAnX84Zoj2+
dobyAYC5tJAbYuv+e8xjBJh6t5LMyfne0m8hew2h2w1CL4tQvlhg2TMAP9/A2XJD
+gcuBCYBgN58vb4p3LS+C+5OI94cusLvHH7Q50rbIYSvybcTCTbBXyHPp8/2nDyi
SrZlhynhdQ==
=ctMq
-----END PGP SIGNATURE-----

--4ozqtq6qsjl6cvyk--
