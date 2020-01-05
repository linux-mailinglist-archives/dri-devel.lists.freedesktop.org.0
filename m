Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BB130AD0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 00:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF51D89CF2;
	Sun,  5 Jan 2020 23:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BF389CF2
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 23:55:55 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4A0E11C2453; Mon,  6 Jan 2020 00:55:52 +0100 (CET)
Date: Mon, 6 Jan 2020 00:55:51 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Tony Lindgren <tony@atomide.com>, linux-leds@vger.kernel.org
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200105235551.GB7598@amd>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200105202449.GC5885@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200105202449.GC5885@atomide.com>
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, jingoohan1@gmail.com,
 merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com, jjhiblot@ti.com,
 linux-omap@vger.kernel.org, lee.jones@linaro.org, agx@sigxcpu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1151245500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1151245500==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > It would be good to get LED backlight to work in clean way for 5.6
> > kernel.
>=20
> I agree, this is badly needed for many devices.
>=20
> > [If you have an idea what else is needed, it would be welcome; it
> > works for me in development tree but not in tree I'd like to
> > upstream.]
>=20
> I have some version of these patches working with modified dts in my
> droid4-pending-v5.4 branch git branch, maybe try to diff against that.

So.. backlight now works for me, and I put the LED parts of the
patches to

gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git for-next

tree. [I guess I could try to sneak them into 5.5 if that helps.]

Could we somehow get this to the backlight tree?

commit d457d0c97d6d55fe3e62633791ac05d289a37d2e
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:12 2019 +0200

    backlight: add led-backlight driver

    This patch adds a led-backlight driver (led_bl), which is similar
    to pwm_bl except the driver uses a LED class driver to adjust the
    brightness in the HW. Multiple LEDs can be used for a single
    backlight.

 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
 Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
 Acked-by: Pavel Machek <pavel@ucw.cz>
 Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4Sd4cACgkQMOfwapXb+vKtigCcD7s9rcf8yUC1oR22yqA5RyON
RW4AmgOniJ4uj2z21/PEdlR5LnqhdCB/
=7Rz5
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--

--===============1151245500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1151245500==--
