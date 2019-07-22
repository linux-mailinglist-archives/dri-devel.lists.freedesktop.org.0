Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC116FAB3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61589951;
	Mon, 22 Jul 2019 07:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3093E89951
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 07:50:36 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 803AE80317; Mon, 22 Jul 2019 09:50:21 +0200 (CEST)
Date: Mon, 22 Jul 2019 09:50:32 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] Enable backlight when trigger is activated
Message-ID: <20190722075032.GA27524@amd>
References: <20190718190849.GA11409@amd>
 <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
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
Cc: linux-fbdev@vger.kernel.org, mpartap@gmx.net, b.zolnierkie@samsung.com,
 tony@atomide.com, merlijn@wizzup.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, jacek.anaszewski@gmail.com,
 linux-leds@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2077108748=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2077108748==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Configuring backlight trigger from dts results in backlight off during
> > boot. Machine looks dead upon boot, which is not good.
> >=20
> > Fix that by enabling LED on trigger activation.

> > +++ b/drivers/leds/trigger/ledtrig-backlight.c
> > @@ -114,6 +114,8 @@ static int bl_trig_activate(struct led_classdev *le=
d)
> >  	n->old_status =3D UNBLANK;
> >  	n->notifier.notifier_call =3D fb_notifier_callback;
> > =20
> > +	led_set_brightness(led, LED_ON);
> > +
>=20
> This looks fishy.
>=20
> Maybe you should use a default-state =3D "keep" instead? (and you'll have
> to support it in the LED driver).
>=20
> That'll give you proper "don't touch the LED if it was turned on" behavio=
r,
> which is what you seem to want.

Actually no, that's not what I want. LED should go on if the display
is active, as soon as trigger is activated.

Unfortunately, I have see no good way to tell if the display is
active (and display is usually active when trigger is activated).

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl01asgACgkQMOfwapXb+vK9lgCbBcUNDD1pNFmswZowkerycBcz
v80AoK7Dv7JR0+GNLhozQBGFuNFWTOIt
=oVmU
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============2077108748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2077108748==--
