Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757E1E83A2
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 18:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150426E940;
	Fri, 29 May 2020 16:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAA66E940
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:27:33 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7ADB11C0385; Fri, 29 May 2020 18:27:29 +0200 (CEST)
Date: Fri, 29 May 2020 18:27:28 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: sun50i-a64-pinephone: Enable LCD
 support on PinePhone
Message-ID: <20200529162728.GB3709@amd>
References: <20200513212451.1919013-1-megous@megous.com>
 <20200513212451.1919013-5-megous@megous.com>
MIME-Version: 1.0
In-Reply-To: <20200513212451.1919013-5-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1819435197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1819435197==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> PinePhone uses PWM backlight and a XBD599 LCD panel over DSI for
> display.
>=20
> Backlight levels curve was optimized by Martijn Braam using a
> lux meter.

If it was possible to preserve lux values for individual settings in
the comment somewhere... that would be nice :-).

One day, it would be nice to have brightness settings in lux, so I
could easily set matching levels on multiple devices, for example...

Best regards,

								Pavel

> +
> +&backlight {
> +	power-supply =3D <&reg_ldo_io0>;
> +	/*
> +	 * PWM backlight circuit on this PinePhone revision was changed since
> +	 * 1.0, and the lowest PWM duty cycle that doesn't lead to backlight
> +	 * being off is around 20%. Duty cycle for the lowest brightness level
> +	 * also varries quite a bit between individual boards, so the lowest
> +	 * value here was chosen as a safe default.
> +	 */
> +	brightness-levels =3D <
> +		774  793  814  842
> +		882  935  1003 1088
> +		1192 1316 1462 1633
> +		1830 2054 2309 2596
> +		2916 3271 3664 4096>;
> +	num-interpolated-steps =3D <50>;
> +	default-brightness-level =3D <400>;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7RN/AACgkQMOfwapXb+vKbHQCgpslUZBfZdvt5G0n+46mybETz
vjcAnj6Q0OeuWlJccqmIncSEyhdvvZh2
=w+1i
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

--===============1819435197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1819435197==--
