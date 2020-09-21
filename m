Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C12734A8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 23:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0324089D9B;
	Mon, 21 Sep 2020 21:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Mon, 21 Sep 2020 21:13:27 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689DB89D9B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 21:13:27 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 8A4241C0B8C; Mon, 21 Sep 2020 23:06:11 +0200 (CEST)
Date: Mon, 21 Sep 2020 23:06:10 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: move Milo Kim to credits
Message-ID: <20200921210610.GA5338@amd>
References: <20200921210233.21449-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200921210233.21449-1-krzk@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============2091350143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2091350143==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and remove the separate driver entries for:
>=20
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I believe normal way would be to mark the entries "orphaned", not to
drop them altogether. Plus, I believe someone from TI is likely to
step up.

Best regards,
								Pavel



> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b9621ca2b31..031adeff29cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17471,29 +17471,6 @@ S:	Maintained
>  F:	sound/soc/codecs/isabelle*
>  F:	sound/soc/codecs/lm49453*
> =20
> -TI LP855x BACKLIGHT DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	Documentation/driver-api/backlight/lp855x-driver.rst
> -F:	drivers/video/backlight/lp855x_bl.c
> -F:	include/linux/platform_data/lp855x.h
> -
> -TI LP8727 CHARGER DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	drivers/power/supply/lp8727_charger.c
> -F:	include/linux/platform_data/lp8727.h
> -
> -TI LP8788 MFD DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	drivers/iio/adc/lp8788_adc.c
> -F:	drivers/leds/leds-lp8788.c
> -F:	drivers/mfd/lp8788*.c
> -F:	drivers/power/supply/lp8788-charger.c
> -F:	drivers/regulator/lp8788-*.c
> -F:	include/linux/mfd/lp8788*.h
> -
>  TI NETCP ETHERNET DRIVER
>  M:	Wingman Kwok <w-kwok2@ti.com>
>  M:	Murali Karicheri <m-karicheri2@ti.com>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9pFcIACgkQMOfwapXb+vLy/QCgpLhlHZK8W60IO1WeGXWGyjdL
DgUAnA9wxYGm4Wd3nk9+jCX3EnjhPK6A
=Cjsr
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--

--===============2091350143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2091350143==--
