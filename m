Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5E62D801
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 11:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792010E5E7;
	Thu, 17 Nov 2022 10:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D5910E5E2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:28:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovc7z-0000WM-Qg; Thu, 17 Nov 2022 11:28:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovc7y-004pZy-3c; Thu, 17 Nov 2022 11:28:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovc7y-00HG0o-B3; Thu, 17 Nov 2022 11:28:14 +0100
Date: Thu, 17 Nov 2022 11:28:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Drop support for legacy PWM probing
Message-ID: <20221117102814.vdgixgfq4pr77fly@pengutronix.de>
References: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
 <Y3YJaYx06Jzrs/Ej@maple.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3vajogj4gsixyjda"
Content-Disposition: inline
In-Reply-To: <Y3YJaYx06Jzrs/Ej@maple.lan>
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
Cc: linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3vajogj4gsixyjda
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 10:14:01AM +0000, Daniel Thompson wrote:
> On Thu, Nov 17, 2022 at 08:21:51AM +0100, Uwe Kleine-K=F6nig wrote:
> > There is no in-tree user left which relies on legacy probing. So drop
> > support for it which removes another user of the deprecated
> > pwm_request() function.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I have to take the "no in-tree user" on faith since I'm not familiar
> enough with PWM history to check that. However from a backlight
> point-of-view it looks like a nice tidy up:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Probably "in-tree provider" would have been the better term. You can
convince you about that:

$ git grep -l platform_pwm_backlight_data | xargs grep pwm_id

That is, no machine used pwm_id to make the legacy lookup necessary.

Who will pick up this patch? Should I resend for s/user/provider/?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3vajogj4gsixyjda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN2DLsACgkQwfwUeK3K
7AlOrQf+Ouq4rWFTigfyRNnrtw5UCKbH4FXAm4zAObrnMrBkuzVx6wczq5TIwcMO
hN1s6DZ7d1M4Ua9GoxQXUHFrLJfyhtUNIXbAWjwT7gV3dv2kPmhKKZjRWsgzwZeG
rZFfPqdJPiN04EVShgfcdGvMgjzRpfLP4YWy/whtTfNw/WcnACgzMJTlKofopQ7O
bSxYUBNCLBqoEwSJZp5BBp4Kbe4+WJRdZKRbcJzptiy1tej8WqUyN0oyzdAvdExs
ETq5sKKfhMr+eM+1pq9i6LfkcVexYU/n1XT02CmvlZBJJj6H9DNGoOo1L0hRdYUk
8WD7Aw2bbjsxFlhmIoCjbCkGPKRHkw==
=yW0S
-----END PGP SIGNATURE-----

--3vajogj4gsixyjda--
