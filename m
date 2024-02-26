Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E53867466
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917B110F0FF;
	Mon, 26 Feb 2024 12:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nBW1R7Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FDD10F101
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70A71610A4;
 Mon, 26 Feb 2024 12:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C99C433F1;
 Mon, 26 Feb 2024 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708949315;
 bh=adfrWuYIwgsIfTbuO3wQ6Ij/LtBOs+dKFcPeSwnWESo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nBW1R7YgmmrpE4uVCYXBVHrot1cyF2IL5Fsqpj0i23Ofr1hcP0Ql+IkSu+PcPfU3m
 OUkvTjt1sNR24Nixjq9zcN3xrrMsKMVQODdNi5XU7XvNAbEY3Vh/U+n/bLtJv4dUyB
 1CPBJHaRTLoUqzLevs86j3tT9i/q1lqYEQEpS+hII2x6mNpmiXc98BMsUqKON1SpRD
 RBr5R71khynNoRKbRvetta5MlN0usWF9s6YMxiLbGerLHRnV3+/1anp9KS93tzK3ef
 RMU0rTJdFbB0mzA83VH6k4asFTmIbUb4xXq5NNgP6B6sC02Stlqgbn6t200MzDdHkm
 KsYC7PWuoIzLg==
Date: Mon, 26 Feb 2024 13:08:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2] drm/edid/firmware: Remove built-in EDIDs
Message-ID: <tyfnjzi7nh7537fhmt65ocooy6bl37edxkrgjrc7c3u2aloa2z@66k4po6jwy72>
References: <20240221092636.691701-1-mripard@kernel.org>
 <20240221130731.70664a22@eldfell> <87edczo4d5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fihjdp3ksp64mjcl"
Content-Disposition: inline
In-Reply-To: <87edczo4d5.fsf@intel.com>
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


--fihjdp3ksp64mjcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 01:24:22PM +0200, Jani Nikula wrote:
> On Wed, 21 Feb 2024, Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> > Sounds good to me.
> >
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>=20
> > If it turns out that these cannot be completely removed, then yet
> > another option would to refuse to use these on digital connectors.
>=20
> Or provide them as binaries to the linux-firmware repo?

It's pretty much the discussion we had with Dave on v1, but putting the
EDID blobs in linux-firmware alone isn't equivalent if your driver is
built-in.

You can embed them into the kernel image and then it would be
equivalent, but there's some restrictions in licensing so I'm not sure
we can do that ourselves.

Maxime

--fihjdp3ksp64mjcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdx/QAAKCRDj7w1vZxhR
xQLBAQDC77CDPe4omAoKgnbi4hczu4oA8EqaAYLNpcpxHdrg5gEAksuouNO3OtTL
WW/37wS6mbpcT1Aw+mIuSk3GRfA6UAc=
=OLVv
-----END PGP SIGNATURE-----

--fihjdp3ksp64mjcl--
