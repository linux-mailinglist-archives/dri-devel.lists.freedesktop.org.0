Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7EAEFC36
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95510E5BB;
	Tue,  1 Jul 2025 14:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qY6F/CYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5599710E5BB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:27:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D339C44CDA;
 Tue,  1 Jul 2025 14:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607C9C4CEEF;
 Tue,  1 Jul 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751380076;
 bh=y9X1ALiyCLSOcY+/sw/fWG42JhVyjLd5y/uuqaEq+mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qY6F/CYvpVwYlLjVVEf4uqcuNkteg9YSEPVl14RWKCLzXDXLoekZ5Ww38RhHkMIbl
 /w3d4VKI9lWlvfi6Z9A9cHzM+AfW/deVn4CyTswxoKQHvSqFj2l5diA9hsUo1aZAcD
 0ZCIyjYHQTC0jJCSCU2gfQzPskZrtn4UAl/kEOucVHHA59kR3Gw0EBXxx2Y6hqXJSY
 v7g79znCrjEQRaE7RyqRja4b0KnMTSemgxKllEAhEezzHZhcoxuXAPPpyMTUZ3EWV8
 GtjiGl0/+8lXk+CvnNGYoWm/oFX/W1mPBCM2NXK2ozPPFU/Fw0OipgrryqxiwCHeJb
 581MwdFM/qHIQ==
Date: Tue, 1 Jul 2025 16:27:54 +0200
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
Message-ID: <20250701-petite-mutant-starling-24bbe5@houat>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat>
 <20250701160219.20dc7466@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wwcgp3gjy5zqdnkj"
Content-Disposition: inline
In-Reply-To: <20250701160219.20dc7466@booty>
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


--wwcgp3gjy5zqdnkj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:
> Hello Marek, Maxime,
>=20
> thanks Marek for spotting the issue and sending a patch!
>=20
> On Mon, 30 Jun 2025 18:44:24 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > > @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device =
*dp, struct drm_device *drm_dev)
> > >  		return ret;
> > >  	}
> > > =20
> > > -	ret =3D analogix_dp_create_bridge(drm_dev, dp);
> > > +	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > >  	if (ret) {
> > >  		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > >  		goto err_unregister_aux; =20
> >=20
> > It looks like you don't set bridge->driver_private anymore. Is it on pu=
rpose?
>=20
> This looks correct to me. In current code, driver_private is used to
> hold a pointer to the driver private struct (struct
> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
> enough, no pointer is needed. With the patch applied, driver_private
> becomes unused.

Then we should remove it from the structure if it's unused.

Maxime

--wwcgp3gjy5zqdnkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGPwZQAKCRAnX84Zoj2+
dkRTAYCvLh9QSaHUbkyaWOv7s0xuRZBaRSuPEHCmBcDYCZI4MfPtLwdV8iDsogya
K8SDqXsBgLFMC4v2RUdsq/9IBCmCx38AR8Zma8PfGSMHwZjWGIVfPbCDO9bCzk29
hF4EVf6Ocg==
=K5EV
-----END PGP SIGNATURE-----

--wwcgp3gjy5zqdnkj--
