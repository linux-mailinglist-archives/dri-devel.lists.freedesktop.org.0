Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89735EA657
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8788A10E258;
	Mon, 26 Sep 2022 12:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E79710E258
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:40:55 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ocnPo-0002Pb-PG; Mon, 26 Sep 2022 14:40:52 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 72127ED39E;
 Mon, 26 Sep 2022 12:40:51 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:40:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kp7wde6tw3pqgn64"
Content-Disposition: inline
In-Reply-To: <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
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


--kp7wde6tw3pqgn64
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26.09.2022 14:08:04, Stefan Wahren wrote:
> Hi Marc,
>=20
> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM=
64,
> > > > using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
> > > >=20
> > > > | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410f=
d034]
> > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.=
debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debi=
an) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > 9-01)
> > > > | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> > > > | [    3.747500] raspberrypi-firmware soc:firmware: Attached to fir=
mware from 2022-03-24T13:21:11
> > > >=20
> > > > As soon a the vc4 module is loaded the following warnings hits 4
> > > > times, then the machine stops.
> > [...]
> >=20
> > > The warning itself is fixed, both upstream and in stable (5.19.7).
> > Ok. Debian is using 5.19.6
> >=20
> > > It shouldn't have any relation to the hang though. Can you share your
> > > setup?
> > - config.txt:
> >=20
> > -------->8-------->8-------->8-------->8--------
> > gpu_mem=3D16
> > disable_splash=3D1
> >=20
> > arm_64bit=3D1
> > enable_uart=3D1
> > uart_2ndstage=3D1
> >=20
> > os_prefix=3D/u-boot/
> >=20
> > [pi3]
> > force_turbo=3D1
> > -------->8-------->8-------->8-------->8--------
> >=20
> > - Raspberry Pi 3 Model B+
> > - no HDMI connected
>=20
> Does it mean, the issue only occurs without HDMI connected?
> If you didn't test with HDMI yet, could you please do?

The error occurs with HDMI not connected, as vc4 is the gfx driver I
thought this might be of interest. :)

I don't have a HDMI monitor here, but I'll come back to you as soon as I
get access to one (might take some time).

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--kp7wde6tw3pqgn64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmMxnc0ACgkQrX5LkNig
011FKAf8C5pVeN0vZUK4h2zTu209PyXqxPDSikAfLXBGcTxs8Re+e976zS9I1YqW
rMm6PpRLdkMvc/Qohrskmyl6ZkRp2bV07WMx/qNYub0k05EdrS30YT6cz+pfvXVC
fZMxy3vh0yixMvNLxhB7afplO+VqKZBtYaoFXo1X0I+SkGm8EOXvBvGPDd6qIX+D
FPpKpHp41sXax6lkEoWtZJYSK/1jBy2QZ6iiboXtvH98qws0/p4n593qoWmAZd6G
raydwfSgBfi2pNLU7e4imKZ1oSLHAbWEFkoTzptCoL+kTSEEJR+dc0eqURuVvXsG
Yf/hmlvYdhTHoukvpe2SdB6/Tg4n/g==
=shk4
-----END PGP SIGNATURE-----

--kp7wde6tw3pqgn64--
