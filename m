Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A82751EC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041C310E1C3;
	Thu, 13 Jul 2023 10:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2E210E1C3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:23:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtTN-0000LC-Rk; Thu, 13 Jul 2023 12:22:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtTK-00E5uf-2P; Thu, 13 Jul 2023 12:22:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtTJ-004WxU-Co; Thu, 13 Jul 2023 12:22:53 +0200
Date: Thu, 13 Jul 2023 12:22:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ahcqjnol4yntdur"
Content-Disposition: inline
In-Reply-To: <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sean Paul <seanpaul@chromium.org>, Julia Lawall <julia.lawall@inria.fr>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4ahcqjnol4yntdur
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 13, 2023 at 12:04:26PM +0200, Thomas Zimmermann wrote:
> Am 13.07.23 um 10:23 schrieb Uwe Kleine-K=F6nig:
> > after most feedback for my series "drm/crtc: Rename struct drm_crtc::dev
> > to drm_dev"[1] was positive in principle, here comes a new series. I
> > didn't call it v2 as it is different enough to stand on its own.
>=20
> To me, it didn't seel as if the discussion was over yet.

Up to when I started preparing this series my impression was that there
was a general acceptance that ->dev is bad and the hot topics were more
about details like "should this be a single patch" and "What is the best
name instead of dev?". For the first this new series is me implmenting
what was recommended and for the latter it's what I think is what most
people favoured.

And I didn't send this series to suppress discussion about the idea of
using a consistent name !=3D "dev".

> In these patches, I find it fairly irritating that the code is now full of
>=20
>  dev =3D crtc->drm;
>  dev =3D plane->drm;
>  dev =3D fb->drm;
>=20
> and so on. Having these differences in naming is even worse than keeping =
the
> current field name 'dev'.

If that helps you: I plan to tackle these in a followup. I agree that's
ugly, but fixing these in the same series is too much and if we agree
that

	dev =3D crtc->dev;

is ugly, there is then an intermediate state that either used

	drm =3D crtc->dev;

or

	dev =3D crtc->drm;

to finaly reach

	drm =3D crtc->drm;

If you see a better way, please let me know. I don't see any.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4ahcqjnol4yntdur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSv0HwACgkQj4D7WH0S
/k6izgf+PwZAYvn6VsfGNNfLeTQj1HmxU9svclNNbbN1rw6hc4P943M/S03rpUXv
lYhCKdob/Jq3GKW8LTUoTgWO9uR2sATmExRjoihw6EivXBi9xkV9b1Q2eBgSdj9g
OKkkeS9tp3QgvvYWBQd+re+Pp64TZa5jzaPft5edOusKLr5R9ZgCI/X8HsMh/nyY
Yis4S2Cscm9NdHwrF5KJzo7/w7tYFBgdREKnbDePdp//BmDT1yhb6uyJCA9/Elpk
fLQs66OG071KOAqAq3vrrdXDQOtG7FKR7CCGSOAjdGkpMPKkkPUjeVf5Dhx9eCx5
AeAJcTnqDxXL3OBDInZUSE0cecOb/Q==
=vvSr
-----END PGP SIGNATURE-----

--4ahcqjnol4yntdur--
