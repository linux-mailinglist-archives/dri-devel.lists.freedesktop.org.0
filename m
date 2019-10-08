Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3712D0186
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 21:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1289939;
	Tue,  8 Oct 2019 19:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2B389939
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 19:55:16 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id E22FA803F9; Tue,  8 Oct 2019 21:54:56 +0200 (CEST)
Date: Tue, 8 Oct 2019 21:55:11 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Message-ID: <20191008195511.GA18412@amd>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003114028.GC21172@dell>
MIME-Version: 1.0
In-Reply-To: <20191003114028.GC21172@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============1944528981=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1944528981==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-10-03 12:40:28, Lee Jones wrote:
> On Thu, 03 Oct 2019, Jean-Jacques Hiblot wrote:
>=20
> > This series aims to add a led-backlight driver, similar to pwm-backligh=
t,
> > but using a LED class device underneath.
> >=20
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> >=20
> > The discussion stopped because Tomi lacked the time to work on it.
>=20
> [...]
>=20
> >  .../bindings/leds/backlight/led-backlight.txt |  28 ++
> >  drivers/leds/led-class.c                      |  98 ++++++-
> >  drivers/video/backlight/Kconfig               |   7 +
> >  drivers/video/backlight/Makefile              |   1 +
> >  drivers/video/backlight/led_bl.c              | 260 ++++++++++++++++++
> >  include/linux/leds.h                          |   6 +
> >  6 files changed, 399 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/le=
d-backlight.txt
> >  create mode 100644 drivers/video/backlight/led_bl.c
>=20
> How should this set be processed?  I'm happy to take it through
> Backlight via an immutable branch and PR to be consumed by LED.

That would make sense to me.

For the record, series is Tested-by: Pavel Machek <pavel@ucw.cz> .

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2c6Z4ACgkQMOfwapXb+vIK8gCgvJrxfKNoHu2ieHmTclJsB+9j
meEAoJXF0QGnU4ymvSKDTKD+Ge/pLySm
=+WdX
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

--===============1944528981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1944528981==--
