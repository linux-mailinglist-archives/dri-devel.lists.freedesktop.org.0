Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1793C5EC193
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE33E10E906;
	Tue, 27 Sep 2022 11:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119E710E8F9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:36:47 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1od8tI-0005sU-Hi; Tue, 27 Sep 2022 13:36:44 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 0C010EE010;
 Tue, 27 Sep 2022 11:36:42 +0000 (UTC)
Date: Tue, 27 Sep 2022 13:36:41 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927113641.hjild2jzfdk3tfaw@pengutronix.de>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pqm6m3y4xc4hiu2t"
Content-Disposition: inline
In-Reply-To: <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pqm6m3y4xc4hiu2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.09.2022 13:12:35, Stefan Wahren wrote:
> > > > yes the issue is only triggered without HDMI connected. I was able =
to
> > > > reproduce with an older vc4 firmware from 2020 (don't want to upgra=
de yet).
> > > > Kernel was also an arm64 build with defconfig.
> > > >=20
> > > > Here some rough starting point for bisection:
> > > >=20
> > > > 5.18.0 good
> > > > 5.19.0 bad
> > > > 5.19.6 bad
> > > Sorry it took a bit of time, it looks like I found another bug while
> > > trying to test this yesterday.
> > >=20
> > > Your datapoints are interesting though. I have a custom configuration
> > > and it does boot 5.19 without an HDMI connected.
> > >=20
> > > So I guess it leaves us with either the firmware version being differ=
ent
> > > (I'm using a newer version, from March 2022), or the configuration. I=
'll
> > > test with defconfig.
> > So it turns out compiling vc4 as a module is the culprit.
>=20
> Do you mean regardless of the kernel version in your case?

On Debian vc4 is a module, too, both on 5.18.x (good) and 5.19.6 (bad).

> In my test cases i build vc4 always as module.
>=20
> > It's not clear to me why at this point, but the first register write in
> > vc4_hdmi_reset stalls.
>
> Sounds like timing issue or a missing dependency (clock or power domain)

Here it fails 100%, regardless if the module is automatically loaded by
udev or later on an idle system via insmod.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--pqm6m3y4xc4hiu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmMy4EYACgkQrX5LkNig
0119fAf2O6Z4e4D+h9ddlMKxPxcGqrbJfA4qb8UuUyD/MJpyH6HQT2fOZtqYYfZ6
n3lVEfMtaDhBKY3oAcm0AEfyiQP6TWwgWk0v6lVV0NpLZmE2KyftuJn2VRdb5w5i
zy+8mlkVlGttVNCSX6XHBFTGGGMlX7jd95WOU1/zwa2XhqCNQxpw6f/eel/pLzqp
V5Qa1ZgSlkP+89WB+xCzO+q2iFWVI3dao9DoqU9h4rM01KfA2i5cZblK9vXHNvff
NzTg3h4lD4BMlNIM84JwFDZdYikTkkm9uL1daFer8xAzRKNKDMNIfPM5ua9buCDe
H38X6dDWXCLF8Hqv58XQYAD3fyQr
=ADjk
-----END PGP SIGNATURE-----

--pqm6m3y4xc4hiu2t--
