Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EF67F97A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 17:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5D10E1E9;
	Sat, 28 Jan 2023 16:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E66A10E1E9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 16:16:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLnsL-0001oA-TX; Sat, 28 Jan 2023 17:16:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLnsL-0012wE-GU; Sat, 28 Jan 2023 17:16:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLnsJ-00GZdu-RG; Sat, 28 Jan 2023 17:16:19 +0100
Date: Sat, 28 Jan 2023 17:16:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <20230128161613.zx24zhdqj66vxhcz@pengutronix.de>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9RuDM9VAMBzj4vd@Gentoo>
 <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
 <Y9Utsbi5PYZ26m9j@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cgcc2i37kj2jwq4r"
Content-Disposition: inline
In-Reply-To: <Y9Utsbi5PYZ26m9j@Gentoo>
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


--cgcc2i37kj2jwq4r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jan 28, 2023 at 10:14:09PM +0800, Jianhua Lu wrote:
> On Sat, Jan 28, 2023 at 02:32:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Sat, Jan 28, 2023 at 08:36:28AM +0800, Jianhua Lu wrote:
> > > I prefer that you pack this commit to the i2c-tree commit that drops
> > > old .probe().=20
> >=20
> > That's fine for me. Can I interpret this as an Ack for this patch?
>=20
> Yes, but can't get my A-b directly, this patch should be ignored and=20
> resend it within the i2c-tree patch series or split it to two patch
> series.

I'm not sure if I understand you correctly. Up to know I though you want
the patch as is go in together with the patch that modifies struct
i2c_driver such that the PR has in two separate commits:

	i2c: Modify .probe() to not take an id parameter
	backlight: ktz8866: Convert to i2c's .probe_new()

Did I understand that right?

In that case an Ack by you would be fine and welcome.

I don't want to squash the changes to the ktz8866 driver into the patch
that modifies struct i2c_driver, as this needlessly clutters the commit,
if it's that what you wanted. (There are more than 1000 i2c drivers and
the others are not converted in a single lockstep, too.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cgcc2i37kj2jwq4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPVSkoACgkQwfwUeK3K
7AnyLQf+KhM4gbai5n99iFIxc2w4KYcqIZRqq5U31k1oq15zBHQmwLiyc0bDmufi
P46aoBe4VwvWPp1IAW3P8cZv3fyN4AkvYIXOTd884BIxosV16ogwF3e7+btKLK4j
vxb3ENqJqYonbV7xJqHW/jLGqFx2AU2m8H3g2ZiOKmYijuUU4rn4x3SEUeOKlnLB
/SWCZVKgASinO+kN1kgRr1IkJMDfboUYC+QkweFzz5Sl4IAqiMkEXZyOORVaXOCh
KA0fG8UD+jTRH1XGjSTACVGhEzLwhQfETwRWxtZ0VJLUPHRdmbHfAr9H7phKd+c6
0g2A66S5DfoB1Q7ucf0bHZ4ZILCQwg==
=Q5qy
-----END PGP SIGNATURE-----

--cgcc2i37kj2jwq4r--
