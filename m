Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C7B11F6A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267A10E369;
	Fri, 25 Jul 2025 13:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GM2vzpvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A05810E366;
 Fri, 25 Jul 2025 13:36:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 362854525C;
 Fri, 25 Jul 2025 13:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C0DC4CEE7;
 Fri, 25 Jul 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753450596;
 bh=WrNG2A2T1lbCyrfIAR22wZ996FVOUNzLrJwpgHngQ/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GM2vzpvj43GFd7GYg9NbQIe42by9gbphpXmUf/8ymEj7K+Xs0jvdB+2T2PJ3ZjkHG
 rP0ca7Qi5E43wFtFfCNff6WpIDKe6zuwBbOG2aLGzOyOhrJOmp4Z1NBb7cDVNONghX
 sfXIqNrlbmwYlCsgm6B0x/nQSD9eB68AZQzQS0Lf0nNWRqD11k2bCWRUTOsLXRmUjZ
 Urv/7/46vHInscPvS3braT9f6XUYajd9ts2pXapnYJxpbvQXT+y2JU0kzxXGqOtt9v
 aYj8irFE1MN/iH4qoVIYkFV8T1oz9fFvrOG4J5MBYsmewAFPFB4NJ7zldPFZudQFpp
 cHTj8eJ55aq8A==
Date: Fri, 25 Jul 2025 14:36:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vylxctu0IRYQ5iOZ"
Content-Disposition: inline
In-Reply-To: <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
X-Cookie: They also surf who only stand on waves.
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


--vylxctu0IRYQ5iOZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 02:41:53PM +0100, Mark Brown wrote:
> On Tue, Jul 01, 2025 at 12:07:22PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Now that everyone passes along the format info to
> > drm_helper_mode_fill_fb_struct() we can make this behaviour
> > mandatory and drop the extra lookup.
>=20
> This patch, which is in -next as 41ab92d35ccd2d66, appears to be
> triggering warnings on TI x15 boards:

This regression is still present in today's -next, I've not seen any
response to my report?

--vylxctu0IRYQ5iOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDiF8ACgkQJNaLcl1U
h9AoxQf+OIwE4hO3xadUmev/DrLzIBOr8ubTZx2FWTmgsjDQfCjJeSrzq8105cmn
6qjkj6/S266V6t7sWTshNmHQ2N/nBHN367LqzTgTzw7jxG9pU7I+WSrlrNSqbruM
TztWlHXKIx/DFKYCSkuUQRyJn5ZO3AtnBPcu2pT9rijEygNy7UTur4CSHmB775aX
J7JwFvFR2sEfknntlM8ndFRx77hB44dU37YwXDoFfbsmY9Li6QnWg40NHoMpEJDd
hS/ttga7IK/BrdnF72MlGBVWZ89dwBioq/tohugqswfzdAZ860tnFnK9LI5Lb3Cf
Eqm5XorkpHpEiH97SoJL8lxuaTSZLQ==
=sxLa
-----END PGP SIGNATURE-----

--vylxctu0IRYQ5iOZ--
