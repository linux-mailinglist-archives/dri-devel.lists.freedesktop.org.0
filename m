Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457F10614
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 10:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300C8906D;
	Wed,  1 May 2019 08:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E03B8906D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 08:26:29 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 5CE3A80555; Wed,  1 May 2019 10:26:18 +0200 (CEST)
Date: Wed, 1 May 2019 10:26:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 3/3] backlight: lm3630a: add firmware node support
Message-ID: <20190501082627.GA2971@amd>
References: <20190415072905.2861-1-masneyb@onstation.org>
 <20190415072905.2861-4-masneyb@onstation.org>
 <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com>
MIME-Version: 1.0
In-Reply-To: <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: multipart/mixed; boundary="===============0900050795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0900050795==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > @@ -396,13 +506,20 @@ static int lm3630a_probe(struct i2c_client *clien=
t,
> >  				     GFP_KERNEL);
> >  		if (pdata =3D=3D NULL)
> >  			return -ENOMEM;
> > +
> >  		/* default values */
> > -		pdata->leda_ctrl =3D LM3630A_LEDA_ENABLE;
> > -		pdata->ledb_ctrl =3D LM3630A_LEDB_ENABLE;
> > +		pdata->leda_ctrl =3D LM3630A_LEDA_DISABLE;
> > +		pdata->ledb_ctrl =3D LM3630A_LEDB_DISABLE;
>=20
> This is not needed since default is disabled and kzalloc will set these t=
o 0

Let compiler do this kind of optimalizations. Code makes sense as-is.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzJWDMACgkQMOfwapXb+vK/6QCguYAgoaGIpYPAGtybTC9vIfZi
p4UAn2Haq8zwV7EpVgAkDZlkZ4x+gZWb
=7kTY
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============0900050795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0900050795==--
