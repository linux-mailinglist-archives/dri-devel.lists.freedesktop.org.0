Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9C911F9B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 10:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170810F0E4;
	Fri, 21 Jun 2024 08:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hlmWt+cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8B10F0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:57:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 67B40CE288B;
 Fri, 21 Jun 2024 08:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B36FC32781;
 Fri, 21 Jun 2024 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718960236;
 bh=plu6KAHFdjshcozejG2DqlhUAt8bIckkt+ggGEPsMt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlmWt+cw3eot3P0tLiWjcYJAVMrPdZiE7sOYhEZTEtme+4ExxJ+3GrDa5Q+bkWyMT
 6dSKdEoII1yH9j4m2ujKDpl0t/IlJNU7nEpsfxMY9H+JRUsLPP3muvY43cOM9e2WuM
 nPf4K53rvFoMamzt1fRfuZ0gDSQjlra+L73Q3yCUj8GiIB4yB7Q9o3cVTCd/Rs8m5j
 OnpqJ7R0QCtCN2zEJTmu894HMyYetmBghbkowy5B5oqjW7M2stUFP7U5EqFU7mjomC
 rWAghk+JcrFZcPFxhg84MV7UiAsIiuokRVb7rOmaHofHBd+CdWA6z+4fHi7COOSCqq
 Jzeb6hJlUiOsA==
Date: Fri, 21 Jun 2024 10:57:14 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH 05/31] drm/vc4_plane: Add support for YUV444 formats
Message-ID: <20240621-spry-zippy-chamois-2b7ad2@houat>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
 <20240620154632.4125308-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2alhn5wunsulirbs"
Content-Disposition: inline
In-Reply-To: <20240620154632.4125308-6-dave.stevenson@raspberrypi.com>
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


--2alhn5wunsulirbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 20, 2024 at 04:46:06PM GMT, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> Support displaying DRM_FORMAT_YUV444 and DRM_FORMAT_YVU444 formats.
> Tested with kmstest and kodi. e.g.
>=20
> kmstest -r 1920x1080@60 -f 400x300-YU24
>=20
> Note: without the shift of width, only half the chroma is fetched,
> resulting in correct left half of image and corrupt colours on right half.
>=20
> The increase in width shouldn't affect fetching of Y data,
> as the hardware will clamp at dest width.
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>

Also, this is missing your Signed-off-by. It needs to be there for all
the patches you send on someone's behalf.

Maxime

--2alhn5wunsulirbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnVAaQAKCRDj7w1vZxhR
xVHIAQDxR9az8DqJn0lVbo0RDZGKwPT6OIVgcyg6XPjhMN+mAQEAjoXzeW0LWTKI
v0J7EFgy6Z2rYFI3SsKB6pl+MVU/wwY=
=qbXH
-----END PGP SIGNATURE-----

--2alhn5wunsulirbs--
