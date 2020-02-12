Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E553D15B1C6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 21:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAE36E0FF;
	Wed, 12 Feb 2020 20:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Wed, 12 Feb 2020 20:25:07 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DF56E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:25:07 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CF1E11C0370; Wed, 12 Feb 2020 21:16:38 +0100 (CET)
Date: Wed, 12 Feb 2020 21:16:38 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200212201638.GB20085@amd>
References: <20200105183202.GA17784@duo.ucw.cz> <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200211172900.GH64767@atomide.com>
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, tony@atomide.com,
 jingoohan1@gmail.com, merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com, jjhiblot@ti.com,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, agx@sigxcpu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0691466491=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0691466491==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > It would be good to get LED backlight to work in clean way for 5.6
> > > kernel.
> ...
> > > [If you have an idea what else is needed, it would be welcome; it
> > > works for me in development tree but not in tree I'd like to
> > > upstream.]
> > >=20
> > > Lee, would you be willing to take "backlight: add led-backlight
> > > driver"? Would it help if I got "leds: Add managed API to get a LED
> > > from a device driver" and "leds: Add of_led_get() and led_put()" into
> > > for_next tree of the LED subsystem?
> >=20
> > It looks like you have an open question from Tony on v10.
> >=20
> > Is that patch orthogonal, or are there depend{ants,encies}?
>=20
> Uhh looks like we messed up a bit with integration. Now droid4
> LCD backlight can no longer be enabled at all manually in v5.6-rc1
> without the "add led-backlight driver" patch.. Should we just
> merge it to fix it rather than start scrambling with other
> temporary hacks?

We should just merge the "add led-backlight driver". Everything should
be ready for it. I'm sorry if I broke something working, I was not
aware it worked at all.

Unfortunately, this is backlight code, not LED, so I can't just merge it.

> I don't care if we use "default-brightness", or if we use
> "default-brightness-level". The binding merged says now
> "default-brightness", so let's go with that one. That's what
> other LED drivers are using too.

No opinion on that.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5EXSYACgkQMOfwapXb+vICqQCfdtyPBlJKQO90lCtkFWlVhCoQ
XaAAoILSfdQrM5bUUqiTeghX0xqVkkHp
=vMQC
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--

--===============0691466491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0691466491==--
