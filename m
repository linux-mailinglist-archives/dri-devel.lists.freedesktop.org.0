Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC764CA0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 21:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E366E124;
	Wed, 10 Jul 2019 19:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EED6E124
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:16:39 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id EF28B805E5; Wed, 10 Jul 2019 21:16:26 +0200 (CEST)
Date: Wed, 10 Jul 2019 21:16:37 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v3 4/4] backlight: add led-backlight driver
Message-ID: <20190710191637.GD22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-5-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190710123932.28244-5-jjhiblot@ti.com>
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
Content-Type: multipart/mixed; boundary="===============0108642037=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0108642037==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:32, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

> +
> +		/*
> +		 *try to map actual LED brightness to backlight brightness
> +		 * level
> +		 */

"* Try"

> +		db =3D priv->default_brightness;
> +		for (i =3D 0 ; i < num_levels; i++) {
> +			if ((i && db > levels[i-1]) && db <=3D levels[i])
> +				break;
> +		}
> +		priv->default_brightness =3D i;
> +		priv->max_brightness =3D num_levels - 1;
> +		priv->levels =3D levels;
> +	} else if (num_levels >=3D 0)
> +		dev_warn(dev, "not enought levels defined\n");

"Not enough"

> +	ret =3D of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret && value <=3D priv->max_brightness)
> +		priv->default_brightness =3D value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "invalid default brightness. ignoring it\n");

"Invalid... Ignoring it."

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOZUACgkQMOfwapXb+vKGjACbBk0etpxF6Viyuje0o1lj4McY
wJgAoKbPa8b/CQqQPf5ELQ7VvqyxdarH
=TOSr
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--

--===============0108642037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0108642037==--
