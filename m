Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927B3A5D84
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDEE89CDF;
	Mon, 14 Jun 2021 07:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2A89CDF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:15:59 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lsgog-0000BB-Lg; Mon, 14 Jun 2021 09:15:26 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lsgoe-0005Jf-D8; Mon, 14 Jun 2021 09:15:24 +0200
Date: Mon, 14 Jun 2021 09:15:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 0/7] Prepare EP93xx drivers for Common Clock Framework
Message-ID: <20210614071521.bv6tc5d27tj3yvlv@pengutronix.de>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tzksnyblxledsl3b"
Content-Disposition: inline
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-input@vger.kernel.org,
 dmaengine@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-spi@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tzksnyblxledsl3b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 01:30:34AM +0200, Alexander Sverdlin wrote:
> Nikita posted a patch converting EP93xx to use Common Clock Framework. It
> turns out some cleanup is necessary in the EP93xx drivers to avoid
> "Enabling unprepared" clock warnings.
>=20
> Patches with stack traces in the commit messages are tested on EP9302.

One thing to note is: ep93xx currently doesn't provide a clk_prepare
function, this isn't a problem though because include/linux/clk.h
provides a dummy if CONFIG_HAVE_CLK_PREPARE isn't defined. So as ep93xx
doesn't define this symbol the changes here effectively only add a
might_sleep.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tzksnyblxledsl3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDHAgYACgkQwfwUeK3K
7Anz4wf/fZ6UpIbiQ9trvkqr6Bj6ontdmEdjh7ZjZkt/uCGHoWMQ1h2blpmdMD/z
wzcscbTaQkBDOdRPlWqqRB77EOqy7TdJe7vKeGygZflhyBx6so3Yk+Jf9NhZ73sY
WpFRQP5v/utpk7qmx7SXBdlJG3mkWmIujPAJd56OX6RwFped6Bqh+bpRv+jMKhHv
KLWyqkKehDsDd9EQtPokkcgnhvFo584TGv3oWUFi0AtPTgVXCSSNCiIxkR8BKLhs
/pwCZo/rdneUeHPZpvBsR2AAVefwMmCQphi9CA4JaCsxGkA6Hfa5c1YBpsPXKnSZ
aL6XNpm9fn67SU0C3GhW4R4lGjRoMQ==
=giTe
-----END PGP SIGNATURE-----

--tzksnyblxledsl3b--
