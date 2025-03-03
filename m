Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FFA4C411
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6D10E22F;
	Mon,  3 Mar 2025 15:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lNj/pod5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B72710E43C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:00:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A43915C46EE;
 Mon,  3 Mar 2025 14:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB54BC4CED6;
 Mon,  3 Mar 2025 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741014036;
 bh=mbiIUj4/EVUrMF8Ts2vQ2M6GWTdgcmnzN/tc58xgIt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNj/pod5Qt5IJeia9n3u9LWgap4a9MOon1FelHi80RE3+JAgmRc1OY2rXm1PaPZIo
 dQ/9J6Cka5/r5k7xpLl5Xsc2qN27oKnHzWCKb7TrxIKXWC10crQyT0yZl6vUVNAcSf
 4CNVKV6bjnr6rb2qajbvHleV1ulLoiUax3O90AUZkGZd0b3i2rcd+OF422ClMCZog0
 ckXRW2TbN+0FyUuAEre+rbt0u+zrhxYHQ3+Tlop6lFMLaGVHl95hBgYgdmccwXNLVJ
 UB5w+NDE0kTd2oRHOkV5EIAWah1v1aeyUEfq04mDzk2NINY6QCG6YBnN9XteKNSs5W
 eE3RJEVmklKrQ==
Date: Mon, 3 Mar 2025 16:00:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250303-idealistic-camouflaged-mandrill-4fb5f8@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
 <20250303-urban-trout-of-vastness-f8d0e7@houat>
 <20250303143404.623a3178@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cogn5gh4bnpmv6p3"
Content-Disposition: inline
In-Reply-To: <20250303143404.623a3178@bootlin.com>
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


--cogn5gh4bnpmv6p3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 02:34:04PM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Mon, 3 Mar 2025 14:11:05 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote:
> > > Hi Maxime,
> > >=20
> > > On Tue, 25 Feb 2025 17:43:48 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > Hi,
> > > >=20
> > > > Here's a series of changes after to the KMS helpers and bridge API
> > > > following a bunch of reviews I did.
> > > >=20
> > > > It's mostly centered across providing an easier time to deal with b=
ridge
> > > > states, and a somewhat consistent with the other entities API.
> > > >=20
> > > > It's build tested only, with arm64 allmodconfig.
> > > >=20
> > > > Maxime
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > --- =20
> > >=20
> > > I Tried to test this series on my system but I've got a compilation i=
ssue.
> > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > >      depmod: ERROR: Found 2 modules in dependency cycles!
> > >=20
> > > CONFIG_DRM=3Dm in my configuration. =20
> >=20
> > Could you share your configuration? it doesn't happen with allmodconfig.
> >=20
>=20
> Here is a defconfig that leads to the issue on my side:

I still can't reproduce it, sorry. Is this based on linux-next /
drm-misc-next, or a private branch?

Maxime

--cogn5gh4bnpmv6p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8XEDQAKCRAnX84Zoj2+
dg0uAX0WvqRhLb/HZAkDURiKptJwT/cCV4cvWXvhwevHn99+9y2MbewgRPnDXQAD
WRpELIIBfA98EqeQ6CPJ5vopALVEFTKGw5yAzuxR8RwfzvRHaac58eNTlLZYuxYE
9WqcJ9Ho8Q==
=qrxN
-----END PGP SIGNATURE-----

--cogn5gh4bnpmv6p3--
