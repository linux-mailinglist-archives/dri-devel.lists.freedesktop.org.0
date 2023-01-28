Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24867F9BF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 18:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A93F10E15B;
	Sat, 28 Jan 2023 17:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6710E15B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 17:07:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLofZ-0006go-ML; Sat, 28 Jan 2023 18:07:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLofZ-00134b-MH; Sat, 28 Jan 2023 18:07:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLofY-00GaBs-3F; Sat, 28 Jan 2023 18:07:12 +0100
Date: Sat, 28 Jan 2023 18:07:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <20230128170708.om77umvc43bmskgv@pengutronix.de>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9RuDM9VAMBzj4vd@Gentoo>
 <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
 <Y9Utsbi5PYZ26m9j@Gentoo>
 <20230128161613.zx24zhdqj66vxhcz@pengutronix.de>
 <Y9VQ7oEBtR6bA8fP@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o3v37c5hagobeljr"
Content-Disposition: inline
In-Reply-To: <Y9VQ7oEBtR6bA8fP@Gentoo>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o3v37c5hagobeljr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Jan 29, 2023 at 12:44:30AM +0800, Jianhua Lu wrote:
> On Sat, Jan 28, 2023 at 05:16:13PM +0100, Uwe Kleine-K=F6nig wrote:
> > I don't want to squash the changes to the ktz8866 driver into the patch
> > that modifies struct i2c_driver, as this needlessly clutters the commit,
> > if it's that what you wanted. (There are more than 1000 i2c drivers and
> > the others are not converted in a single lockstep, too.)
>=20
> Do't squash this patch, I'd like you send a series patch instead of
> a single patch.

This series was already sent before. However that happend based on a
tree that didn't contain the ktz8866 backlight driver, so this patch
came later (and I didn't resend the whole series for the two drivers
that were added since then :-). See
https://lore.kernel.org/lkml/20221118224540.619276-1-uwe@kleine-koenig.org.
for the original post.

Letting this patch go in via the i2c tree together with the commit
changing i2c_driver is fine for me, it won't be the only one.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o3v37c5hagobeljr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPVVjkACgkQwfwUeK3K
7Anxfgf9E13JzNC1YMhCbFKctFnER5WhWuo++pqLMA5Cs24zd9HH3yOk7AuUtYx9
NnSzkpTPjCbAcvN1fTCo/PV+5pjP5VnYIKnEZ8Py/b4tYKI198rP+063guGMebEC
THSepj4EN8d/QyslW2k0dFsmOQymE7ZPrBowsqwbRHieN3octmanQu1RAJt7Uupc
sIPTVFZatA2Ib0RJKRPqytbEV5AGcdHvx2jYZiHwe2EVHumqV5yREVhd7jHCkXUa
tAvT06VwldQpBHsE5G7qqx4qwjgzibjfmRXSXlxLiS9Xefe6G2dVgvkAik9jy6a+
0SO5hvzSaT/Hx8/9irEtASfzTFxRLw==
=hrjO
-----END PGP SIGNATURE-----

--o3v37c5hagobeljr--
