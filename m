Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E5752314
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530B890D2;
	Thu, 13 Jul 2023 13:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFC9890D2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:11:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJw66-0007iN-7D; Thu, 13 Jul 2023 15:11:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJw63-00E84W-VI; Thu, 13 Jul 2023 15:11:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJw63-004Yn8-AH; Thu, 13 Jul 2023 15:11:03 +0200
Date: Thu, 13 Jul 2023 15:11:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <20230713131102.rj4s66yui7cvuw54@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
 <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
 <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b3r4ed3vcdd4kfr2"
Content-Disposition: inline
In-Reply-To: <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
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
Cc: Maxime Ripard <mripard@kernel.org>, Julia Lawall <julia.lawall@inria.fr>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b3r4ed3vcdd4kfr2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:41:15PM +0200, Thomas Zimmermann wrote:
> Hi Uwe
>=20
> Am 13.07.23 um 12:22 schrieb Uwe Kleine-K=F6nig:
> [...]
> >=20
> > If that helps you: I plan to tackle these in a followup. I agree that's
> > ugly, but fixing these in the same series is too much and if we agree
> > that
> >=20
> > 	dev =3D crtc->dev;
> >=20
> > is ugly, there is then an intermediate state that either used
> >=20
> > 	drm =3D crtc->dev;
> >=20
> > or
> >=20
> > 	dev =3D crtc->drm;
> >=20
> > to finaly reach
> >=20
> > 	drm =3D crtc->drm;
> >=20
> > If you see a better way, please let me know. I don't see any.
>=20
> IF this renaming gets accepted, you could make a single patch
> that adds a union with both names to all affected DRM data structures.
>=20
> struct drm_foo {
>   union {
>     struct drm_device *drm; // use this
>     struct drm_device *dev; // don't use this
>   };
> }
>=20
> That patch prepares all of DRM for the renaming. And then you can go thro=
ugh
> drivers one-by-one with a patch or a patchset for each to do all the
> renaming there. Finally you send another DRM-wide patch to remove that
> union.
>=20
> That would split the changes into smaller pieces without ugly intermediate
> state. It also eases the problem for backporters and stable maintainers t=
hat
> have to deal with the name changes.
>=20
> IIRC you already did something similar for remove or probe callbacks?

Did you look at patch #1 of the initial series? That's exactly what I
did there. People argued to make a single patch and not use an anonymous
union though ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b3r4ed3vcdd4kfr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSv9+UACgkQj4D7WH0S
/k4S9gf9HoroFaSlK5Af1FNNaWYMve8yrFMYW6p39oHqgllJ4D5qkwISl6NmlSOy
eNx0TLm19c+1SqWCaW0vCSt5s2wCkJPZC9ZRpVyY4c5km2MV5MKRc0HPUXYEHsrA
QVuFNU7b9HYvAzaT/7lLbOb9gWIQNS5nyziwUb6wdeHzxf1y7mMmQHq+4ztgGH78
sBMs4qdgdxuy4CSbDy+m0Gn8N8oLafA13Sv30fSXWPR/eiKPuIizSqKdKa5owhZa
tss0CVYzL8O6w7v5T6XuTukycuLzQpcFPEoqVSpRpX5zCnOh40pTWwy/U8kS/EcF
oAC3JNCTtzNCmhDkDsf5+lbhujJwfw==
=Ieic
-----END PGP SIGNATURE-----

--b3r4ed3vcdd4kfr2--
