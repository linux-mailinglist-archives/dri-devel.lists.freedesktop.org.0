Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA2165326
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 00:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3B66E88D;
	Wed, 19 Feb 2020 23:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E96E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 23:44:40 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D9C121D56;
 Wed, 19 Feb 2020 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582155880;
 bh=7Jwhbeg3NW/b7zKtfeleuO14hiDLfK4BEl3N5Su5gl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YkgX4bsYvHWMHYmBlyWxpFjKPR5cu4hbzmx05i0+WxrgHrLwOqK2Pj/2gdcEAE/2s
 hH9P/IYxdRmjObD7kcM/CQGwLQGobex69sien3T4gjCaKZT7rQ0tIpUUffIlvYz3lq
 N4taBPjSJ+DWFu6LgL/rN5LuZICRM1PbvtWuhz/o=
Received: by earth.universe (Postfix, from userid 1000)
 id A16013C0C83; Thu, 20 Feb 2020 00:44:37 +0100 (CET)
Date: Thu, 20 Feb 2020 00:44:37 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200219234437.l6ac7usebu7rnzsy@earth.universe>
References: <20200219191412.GA15905@amd> <20200219194540.GD37466@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200219194540.GD37466@atomide.com>
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, jingoohan1@gmail.com,
 merlijn@wizzup.org, kernel list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, martin_rysavy@centrum.cz, nekit1000@gmail.com,
 tomi.valkeinen@ti.com, Pavel Machek <pavel@ucw.cz>, jjhiblot@ti.com,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, agx@sigxcpu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0090434367=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0090434367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n6ehadolgogdw3bm"
Content-Disposition: inline


--n6ehadolgogdw3bm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 11:45:40AM -0800, Tony Lindgren wrote:
> * Pavel Machek <pavel@ucw.cz> [200219 19:15]:
> > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >=20
> > This patch adds a led-backlight driver (led_bl), which is similar to
> > pwm_bl except the driver uses a LED class driver to adjust the
> > brightness in the HW. Multiple LEDs can be used for a single backlight.
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Tested-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > ---
> >  drivers/video/backlight/Kconfig  |   7 ++
> >  drivers/video/backlight/Makefile |   1 +
> >  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 268 insertions(+)
> >  create mode 100644 drivers/video/backlight/led_bl.c
> >=20
> > Hi!
> >=20
> > Here's the version of the driver I have. AFAICT
> > default-brightness-level handling is ok, so does not need to be
> > changed.
> >=20
> > Lee, it would be easiest for me if you could apply it to your tree and
> > push, but given enough time I can push it to Linus, too.
>=20
> Oh you're using quoted-printable for patches.. Got it applied now,
> and it still works. Below is also the related dts change that
> I tested with.
>=20
> Feel free to pick the dts change too, naturally that should
> not be applied before the driver.
>=20
> If you guys instead want me to pick these both into my fixes
> branch, just let me know and I'll do the explaining why these
> are needed as fixes. Basically we no longer have a way to enable
> the LCD backlight for droid4 manually starting with v5.6-rc1
> unlike earlier.
>=20
> Regards,
>=20
> Tony
>=20
> 8< ------------------
> From tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Wed, 19 Feb 2020 11:25:27 -0800
> Subject: [PATCH] ARM: dts: droid4: Configure LED backlight for lm3532
>=20
> With the LED backlight changes merged, we still need the dts configured
> to have backlight working for droid4. Based on an earlier patch from
> Pavel Machek <pavel@ucw.cz>, let's configure the backlight but update
> the value range to be more usable.
>=20
> We have a range of 256 register values split into 8 steps, so we can
> generate the brightness levels backwards with:
>=20
> $ for i in 0 1 2 3 4 5 6 7; do echo "255 - ${i} * (256 / 8)" | bc; done
>=20
> To avoid more confusion why the LCD backlight is still not on, let's
> also enable LED backlight as a loadable module for omap2plus_defconfig.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 13 +++++++++++--
>  arch/arm/configs/omap2plus_defconfig            |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/b=
oot/dts/motorola-mapphone-common.dtsi
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -182,6 +182,14 @@ vibrator {
>  		pwm-names =3D "enable", "direction";
>  		direction-duty-cycle-ns =3D <10000000>;
>  	};
> +
> +	backlight: backlight {
> +		compatible =3D "led-backlight";
> +
> +		leds =3D <&backlight_led>;
> +		brightness-levels =3D <31 63 95 127 159 191 223 255>;
> +		default-brightness-level =3D <6>;
> +	};
>  };
> =20
>  &dss {
> @@ -205,6 +213,8 @@ lcd0: display {
>  		vddi-supply =3D <&lcd_regulator>;
>  		reset-gpios =3D <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
> =20
> +		backlight =3D <&backlight>;
> +
>  		width-mm =3D <50>;
>  		height-mm =3D <89>;
> =20
> @@ -393,12 +403,11 @@ led-controller@38 {
>  		ramp-up-us =3D <1024>;
>  		ramp-down-us =3D <8193>;
> =20
> -		led@0 {
> +		backlight_led: led@0 {
>  			reg =3D <0>;
>  			led-sources =3D <2>;
>  			ti,led-mode =3D <0>;
>  			label =3D ":backlight";
> -			linux,default-trigger =3D "backlight";
>  		};
> =20
>  		led@1 {
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap=
2plus_defconfig
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -375,6 +375,7 @@ CONFIG_BACKLIGHT_GENERIC=3Dm
>  CONFIG_BACKLIGHT_PWM=3Dm
>  CONFIG_BACKLIGHT_PANDORA=3Dm
>  CONFIG_BACKLIGHT_GPIO=3Dm
> +CONFIG_BACKLIGHT_LED=3Dm
>  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
>  CONFIG_LOGO=3Dy

Finally :)

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--n6ehadolgogdw3bm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5NyFcACgkQ2O7X88g7
+pr98Q/+JkurT+hW4mT1GQB8xFAJUfN0+tfx9gqKE2NeSjDY+IsZL0qQZOueskzl
k139MC29XV8DRDjX2xjOXhitc24UeCyoqwCKQsECpZ1ihpJtZyl985HVndgTwCC4
kA6FCjp1Pb4VY0gUwheILkGFZSEMJzQK7++mgeOy1xUsKx8iZhrvTfkkG3dNoTck
3dC6HgheQkr6QxL6yyF1yQqyaqwJPqo5zpkNTlyNgjoj8nynRnUfFx84Y2OYDBBM
8bdmMi1hlPQQttBHbQiO0ztkaZQy8QJFKoiTf5bIn5Kus9NJSZiSQjSzoR3L9ltD
U588aumKE7WKO9qClZh0f/CV1FFBH6eewN9wMFk977q9mj1+O2vf4ljvic8+qLMz
6hK+Di9WpBvK8YEpu+4f4vtJyafzugoi/+xPQa/M2au0Ifs3tXqstyZ6MxbpYCPs
wYMD8c8rcynS6KXhMZLTKdVSS20DnOXMYM7+4o7nq++kE8Pq6hHy0mJdy1YXvfij
YDWFovSU+5E2/4i5+v/r3VuCpfL8EY/49kXU/UsDVPTTEbZlysCWoPeJMrmgIBGo
OXLHVaY4KjJLxaMQ1/ixiiiYU/3X+d4eiDjN6P/L5cesP1O5FMePAYNPUX/FP5Xo
XRqBsnAyQtmADxHklBlbGMmgyb37MYi/Z5QSa1sS1Up0a9JMiZ0=
=ErQY
-----END PGP SIGNATURE-----

--n6ehadolgogdw3bm--

--===============0090434367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0090434367==--
