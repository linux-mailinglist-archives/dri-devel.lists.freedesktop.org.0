Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6A64C98
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 21:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817D6E128;
	Wed, 10 Jul 2019 19:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398A6E127
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:13:17 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 81550805CD; Wed, 10 Jul 2019 21:13:03 +0200 (CEST)
Date: Wed, 10 Jul 2019 21:13:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20190710191314.GC22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-4-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190710123932.28244-4-jjhiblot@ti.com>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============0045744922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0045744922==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:31, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-=
backlight.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlig=
ht.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..0444eec8efe1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of
> LEDs.

Ok.

> +It can also be used to describe a backlight device controlled by the out=
put of
> +a LED driver.

? The LED driver should better be driving some LEDs...

> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs
> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. The levels m=
ust be
> +                       in the range accepted by the underlying LED devic=
es.
> +                       This is used to translate a backlight brightness =
level
> +                       into a LED brightness level. if not provided, the
> +                       identity mapping is used.

"If it is not"
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOMkACgkQMOfwapXb+vLScQCfaBoq0kMp1lvV8fNKwcWoHrBM
pnIAn3yAtCE4fHZ7pIAA9TiO8ghJ1kHM
=sILE
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

--===============0045744922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0045744922==--
