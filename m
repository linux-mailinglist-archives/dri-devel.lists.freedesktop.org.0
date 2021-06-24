Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B63B3798
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A856E084;
	Thu, 24 Jun 2021 20:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF916E084
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:10:13 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwVfu-0002BF-TB; Thu, 24 Jun 2021 22:10:10 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwVft-0005ob-Uy; Thu, 24 Jun 2021 22:10:09 +0200
Date: Thu, 24 Jun 2021 22:10:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Message-ID: <20210624201009.5se7o27b7m6bff4g@pengutronix.de>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
 <YNHh2cdcyzLWSCkK@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6q5sr5ki5ppu4gv"
Content-Disposition: inline
In-Reply-To: <YNHh2cdcyzLWSCkK@dell>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6q5sr5ki5ppu4gv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Tue, Jun 22, 2021 at 02:12:57PM +0100, Lee Jones wrote:
> On Mon, 21 Jun 2021, Uwe Kleine-K=F6nig wrote:
>=20
> > The practical upside here is that this only needs a single API call to
> > program the hardware which (depending on the underlaying hardware) can
> > be more effective and prevents glitches.
> >=20
> > Up to now the return value of the pwm functions was ignored. Fix this
> > and propagate the error to the caller.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/video/backlight/lm3630a_bl.c | 42 +++++++++++++---------------
> >  1 file changed, 19 insertions(+), 23 deletions(-)
>=20
> Fixed the subject line and applied, thanks.

It's not obvious to me what needed fixing here, and I don't find where
you the patches, neither in next nor in
https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git; so I
cannot check what you actually changed.

I assume you did s/lm3630a/lm3630a_bl/ ? I didn't because it felt
tautological.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e6q5sr5ki5ppu4gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDU5p4ACgkQwfwUeK3K
7AmTZwf/ZQn7nKoCAT8thn0EIoPpaCREmTbKgFd9pjB/yd43HL30wWUWsLR54BDp
YMhPwHHfdN8aNyFiZpJx5nYRdxBSWTYnW+kfFp0RcRarDMgrzIr4KdRBPGrzf9p3
V9NJys4V4KWpdja6Tld2hBhsuKkZjJa17i0tcCfsje8XWNVMvT0Txb7dRAcb7oYO
w2/X5dsO5X+atCCchKwdyI9rKlRB2MvX8MBG1xx6k6spoLG0q3/mW5oiWCAoJaJu
rm7AJl6HDO6LBtm41vj8WCW+D145cR5fLqL7jmhO1hSHvmGf+WaFBF/VMspoStBW
lvNdPE8/9mcO3+jIOYUNNzG5WI2Hcw==
=jj+6
-----END PGP SIGNATURE-----

--e6q5sr5ki5ppu4gv--
