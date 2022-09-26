Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F063E5E9F35
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C2410E3DA;
	Mon, 26 Sep 2022 10:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818810E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 10:21:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1oclEz-0006FX-FW; Mon, 26 Sep 2022 12:21:33 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 75079ED1EB;
 Mon, 26 Sep 2022 10:21:32 +0000 (UTC)
Date: Mon, 26 Sep 2022 12:21:30 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="44wlbfj42o7tokq7"
Content-Disposition: inline
In-Reply-To: <20220922150600.h4srjmgxc52qiv6r@houat>
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--44wlbfj42o7tokq7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
> > using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
> >=20
> > | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034=
]                                                                          =
                                               =20
> > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debi=
an.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) =
2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > 9-01)                                                                  =
                                                                           =
                                             =20
> > | [    0.000000] Machine model: Raspberry Pi 3 Model B+          =20
> > | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmwar=
e from 2022-03-24T13:21:11=20
> >=20
> > As soon a the vc4 module is loaded the following warnings hits 4
> > times, then the machine stops.

[...]

> The warning itself is fixed, both upstream and in stable (5.19.7).

Ok. Debian is using 5.19.6

> It shouldn't have any relation to the hang though. Can you share your
> setup?

- config.txt:

-------->8-------->8-------->8-------->8--------
gpu_mem=3D16
disable_splash=3D1

arm_64bit=3D1
enable_uart=3D1
uart_2ndstage=3D1

os_prefix=3D/u-boot/

[pi3]
force_turbo=3D1
-------->8-------->8-------->8-------->8--------

- Raspberry Pi 3 Model B+
- no HDMI connected
- firmware 2022-03-24T13:21:11
  which boot u-boot:
- u-boot 2022.04+dfsg-2+b1 (Debian testing)
  I'm using the "/usr/lib/u-boot/rpi_3/u-boot.bin"
  u-boot start:
- Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org)
  kernel and dtb are unmodified Debian's linux-image-5.19.0-1-arm64
  $ ls -l /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb
  -rwxr-xr-x 1 root root 15351 Sep 22 09:52 /boot/dtbs/5.19.0-1-arm64/broad=
com/bcm2837-rpi-3-b-plus.dtb*
  $ md5sum /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2837-rpi-3-b-plus.dtb
  4a9c76c3c4dcafac7d69872ee88ac5fc  /boot/dtbs/5.19.0-1-arm64/broadcom/bcm2=
837-rpi-3-b-plus.dtb
- currently, I've blacklisted vc4, but systems hangs after modprobe vc4
  (4x backtrace, then hang)

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--44wlbfj42o7tokq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmMxfScACgkQrX5LkNig
013qBwf+NVNk/ABJ4C+tpktEiKPVSRT0+fAZby6BT0jXm0+sq80YiQEDyRa6yi3U
SyjLR7ePgVot1JL/dBnQ55BF4X4MZTZ+I0yv1NA4PKVTmNJ6fS+Z01qvGb1CwgD+
piArMx9ainlAbXIKWHywJhvjrzmxY5Tz+McFj5tzjpoi/WV43xMEq6wY1lepV+lk
3jbfMQvS5mUAipaWLa+Oqh7Y2vt+j6Blw+NcwM4tPpyif8Y65LjfnmDWCBdqwXYZ
AdRfdzzwBU95THqmh7ITdMHcYyY+oZoWBPgZ2xR8teBizASxi7N8QSv1JsAtJfNY
zWRcHs1d1dtIhdp2kSe7tjAzupTH7g==
=7ZPb
-----END PGP SIGNATURE-----

--44wlbfj42o7tokq7--
