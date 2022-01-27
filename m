Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C898949ED78
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 22:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AE510E21B;
	Thu, 27 Jan 2022 21:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ACE10E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 21:36:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDCRC-0006Rf-Ku; Thu, 27 Jan 2022 22:36:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDCRB-00CpYf-FH; Thu, 27 Jan 2022 22:36:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDCRA-001olD-2d; Thu, 27 Jan 2022 22:36:12 +0100
Date: Thu, 27 Jan 2022 22:36:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/5] staging: fbtft: Deduplicate driver registration macros
Message-ID: <20220127213607.xbggvbm454u7qfid@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="67mr4ifnx6prswud"
Content-Disposition: inline
In-Reply-To: <20220123175201.34839-3-u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Noralf Tronnes <notro@tronnes.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--67mr4ifnx6prswud
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Sun, Jan 23, 2022 at 06:51:58PM +0100, Uwe Kleine-K=F6nig wrote:
> The two macros FBTFT_REGISTER_DRIVER and FBTFT_REGISTER_SPI_DRIVER
> contain quite some duplication: Both define an spi driver and an of device
> table and the differences are quite subtle.
>=20
> So create two new macros and use both twice.
>=20
> Link: https://lore.kernel.org/r/20220118181338.207943-2-u.kleine-koenig@p=
engutronix.de
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

You picked this patch into your staging-next branch, I guess from the
original submission. Not sure how Mark wants to continue with the series
=66rom this thread, but at least my plan was that he will create an
immutable branch on top of 5.17-rc2 (assuming 5.17-rc2 will contain
"staging: fbtft: Fix error path in fbtft_driver_module_init()") with the
remaining 4 patches in this series.

In a private mail you agreed to this procedure, but this didn't stop you
taking this patch?! What is your plan here? The obvious (to me) options
are:

 - Delay this series until after the next merge window.
 - You back out this patch from staging-next and ack here for Mark to
   apply it to an immutable branch.
 - You keep this patch in staging-next and still ack here for Mark to
   apply it to an immutable branch. Then the patch would be included
   twice.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--67mr4ifnx6prswud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHzEEQACgkQwfwUeK3K
7AkdBQf/QYxLjRjjSpz8FTj3K6vGIxGPAC7hZKjN9Sekvmf8ql2qAJ0veXMox5Hs
AVo6BooWW8n6qnIE6j05wMMcJz16iBdVNo5kOSFo1vt7rP0sXbp/i1UIiU1hBcTT
Mt/oYvsLpnwdh0OyI7h3ZfOdHo05HG8l/fjCBsHMozW1wuGvVIHnbN9zMyLEClyC
58/88JKuKUU0REoLty0vkSjzfwmbQoXTbrkXgGHUkUyzk5g4JekV2R+xIkhmVWp6
49EtKM6Xg8ykJKh51BNltCBDtrvNRuw/oKa5atlrCgKAfhynZv29X/oPNg4jXVPw
k3jTHuwnI9NtkZxvtNMmRylFxVvrtw==
=JziW
-----END PGP SIGNATURE-----

--67mr4ifnx6prswud--
