Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA793826BA5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4762C10E20F;
	Mon,  8 Jan 2024 10:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3010E1F5;
 Mon,  8 Jan 2024 10:37:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1F96ACE1000;
 Mon,  8 Jan 2024 10:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8ABC433C7;
 Mon,  8 Jan 2024 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704710242;
 bh=I2cJ5pKDt48/1lLJBuJjqvcrXBZNtAWlklGQZCuHpjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hg6FlY7lKiLYrFwaqeNhLYHZxk7eszjRg2Fq0ct68Fv/psOZH3K+FPsv8oVYRmDX7
 A/fJiSYGMA9CO548Snl9fDWzi7xKz9YWA9dmzASPfH//TygDBGJPTbmyrfQlCHFff0
 6ChfaZZyomBzr0eBfBjjN0XyPJ/jxci7MMLYofT164sE4lwNzHw+p1ghcW9tQzVb9o
 8aCzlKV83NcGnyYc49XB7J/OQ8xG4R+d7DzqhQ6ZROYkWSvKO3GtDPFce/CLAn9As1
 pLzi6fgM+M81YsrxDJr/WKUwEF2NteH9lZD6o8u7lc/JgP8ei1NC5/h0iEkK3D0qJe
 d7xR16cKqV73w==
Date: Mon, 8 Jan 2024 11:37:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 2/6] drm/tests: managed: Rename the suite name to
 match other DRM tests
Message-ID: <ful4yeyeeqrfzdsgq6azz5rhlgood2cnjkodlrdozsglbhtymt@3r6wukug6gtr>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
 <20240105101324.26811-3-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wllsfru5xpnuqssj"
Content-Disposition: inline
In-Reply-To: <20240105101324.26811-3-michal.winiarski@intel.com>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wllsfru5xpnuqssj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 11:13:20AM +0100, Micha=C5=82 Winiarski wrote:
> DRM tests use "_" rather than "-" as word separator. Rename the test
> suite to match other tests.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_managed_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/t=
ests/drm_managed_test.c
> index 1652dca11d30c..659af5abb8014 100644
> --- a/drivers/gpu/drm/tests/drm_managed_test.c
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -61,7 +61,7 @@ static struct kunit_case drm_managed_tests[] =3D {
>  };
> =20
>  static struct kunit_suite drm_managed_test_suite =3D {
> -	.name =3D "drm-test-managed",
> +	.name =3D "drm_test_managed",
>  	.test_cases =3D drm_managed_tests
>  };

I guess if we were to truly follow the trend, it would be drm_managed?

Maxime

--wllsfru5xpnuqssj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvQXwAKCRDj7w1vZxhR
xZojAP9it/UDliDk2mE/BdkWkwweIMSTuPNInr+lArfeFsu9eQEA4bwgWSdKPPNS
P77GouENMe1JX2xdTSQ/TlMuvGeNfg4=
=ulYa
-----END PGP SIGNATURE-----

--wllsfru5xpnuqssj--
