Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258207E63D6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 07:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A9910E1B5;
	Thu,  9 Nov 2023 06:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43B10E1B5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 06:25:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0yTN-0002rd-EG; Thu, 09 Nov 2023 07:25:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0yTL-007iId-Va; Thu, 09 Nov 2023 07:24:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0yTL-00Flau-M4; Thu, 09 Nov 2023 07:24:59 +0100
Date: Thu, 9 Nov 2023 07:24:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231109062459.5hk7vb54t4iy5kp6@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
 <20231108215220.3iw5sydxad32gufj@pengutronix.de>
 <656080fb-7d10-47ec-bdeb-a099ceee99bf@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3kqb4iadfxwx3nek"
Content-Disposition: inline
In-Reply-To: <656080fb-7d10-47ec-bdeb-a099ceee99bf@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nathan Chancellor <nathan@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3kqb4iadfxwx3nek
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 08, 2023 at 10:57:00PM +0100, Helge Deller wrote:
> On 11/8/23 22:52, Uwe Kleine-K=F6nig wrote:
> > But info and so info->fix live longer than the probe function, don't
> > they?
>=20
> Yes, they do.
> But AFAICS info->fix contains a *copy* of the initial atmel_lcdfb_fix str=
uct
> (and not a pointer to it). So that should be ok.

If you say so that's good. I grepped a bit around and didn't find a
place where a copy is made. But that's probably me and I'll consider the
case closed.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3kqb4iadfxwx3nek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVMezoACgkQj4D7WH0S
/k7q/wgArxm2BvyCentus6W2LMuLfhOlRWssY41U6crdkW2BAR8S85WMcflzm8x8
LJvcizkBfw+flQR/w4UHHmEqq/r3ITBa7AYlD/tYbwATihPQZtCLgmIf5OT/D8ur
RqhcnzFkdj6tHccaOLBQuLJ6lin946/ghokktbTDOwRbhJKxkV3uI8seepdGVg5Z
soUjFq8Da82cXiqeuEnHPUFizigl/RhMHmjeDA+nbA8A3TQYLXNMyKAZBzi2JQZs
lQsDlI5yatfWPOwRjA2H9PckJgNvysrcgqU2pVaxwXKx/cQur7GP8EnnCuJAma/k
n3hhvc6Fu/qozs6Tz1asn3kh10mj6w==
=bkJX
-----END PGP SIGNATURE-----

--3kqb4iadfxwx3nek--
