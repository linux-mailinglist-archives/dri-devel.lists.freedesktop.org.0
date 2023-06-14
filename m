Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A5730B7C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 01:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AF510E034;
	Wed, 14 Jun 2023 23:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C4210E034
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 23:22:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40B7F62E08;
 Wed, 14 Jun 2023 23:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD2AC433C8;
 Wed, 14 Jun 2023 23:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686784940;
 bh=Mx3Aiw2pyHArebLgkIkk0UbyEDZrq2g2lA5Q0XMjWao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LdP8jnM9riT0PgVIQmODvacaJPbvQNaj+dJGvPvwn/eedxhjOB1+yF8ntY1P8Lcse
 8ub4mfIN0yGBwEeAa101zhFkW7tw53gWYfOK86J1zlzQoyUav11j+bUpW/BKherLCH
 ZPBOcqdFaeHc8+ZdI9H7cw22zYr0KvlMdKzSqI7tSjskcOFb9YTdEnhSoGFUTCH6pE
 HGAlgOR9GJyc8JHWSSZVgiw/0gGC4R07i4svRv3PwLMDDHQeIzbLVGO7Ymz3RxGRHV
 +X53sCt96pxvHG27WA8TPm6cm7yL2E7ngwNhllN7s4wXoFmEltTHAmTO+S0iWJLEGw
 F1VpKygJP5hBg==
Received: by mercury (Postfix, from userid 1000)
 id 3DEED1060A05; Thu, 15 Jun 2023 01:22:17 +0200 (CEST)
Date: Thu, 15 Jun 2023 01:22:17 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Message-ID: <20230614232217.d7lf4l3y7oqmjisy@mercury.elektranox.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-2-miquel.raynal@bootlin.com>
 <b4ae6e9c-b548-b1e3-42f9-e24aacaf2b38@wolfvision.net>
 <20230613085630.4a48fa8b@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i2skpqgptx4h7ct3"
Content-Disposition: inline
In-Reply-To: <20230613085630.4a48fa8b@xps-13>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i2skpqgptx4h7ct3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 13, 2023 at 08:56:30AM +0200, Miquel Raynal wrote:
> Hi Michael,
>=20
> michael.riesch@wolfvision.net wrote on Tue, 13 Jun 2023 08:15:26 +0200:
>=20
> > Hi Miquel,
> >=20
> > On 6/9/23 16:59, Miquel Raynal wrote:
> > > The spi core warns us about using an of_device_id table without a =20
> >=20
> > s/spi/SPI ?
>=20
> Actually both are accepted in the kernel, IIRC it depends whether you
> refer to the name of the bus or the Linux subsystem. Same for picking
> "a" vs "an" before "spi/SPI". An attempt to use a unique formatting was
> actually canceled because both are used equivalently and I believe even
> the spi maintainer and the spi-nor maintainer kind of disagreed on the
> default :)
>=20
> > > spi_device_id table aside for module utilities in orter to not rely o=
n =20
> >=20
> > s/in orter to/in order to ?
>=20
> Yes, sorry for this typo as well as the two others you rightly pointed
> out in another patch. I'll fix them.
>=20
> > > OF modaliases. Just add this table using the device name without the
> > > vendor prefix (as it is usually done).
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c =20
> > b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > > index bbc4569cbcdc..c67b9adb157f 100644
> > > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > > @@ -400,9 +400,16 @@ static const struct of_device_id =20
> > st7789v_of_match[] =3D {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, st7789v_of_match);
> > >
> > > +static const struct spi_device_id st7789v_ids[] =3D {
> > > +	{ "st7789v", },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(spi, st7789v_ids);
> > > +
> > >  static struct spi_driver st7789v_driver =3D {
> > >  	.probe =3D st7789v_probe,
> > >  	.remove =3D st7789v_remove,
> > > +	.id_table =3D st7789v_ids,
> > >  	.driver =3D {
> > >  		.name =3D "st7789v",
> > >  		.of_match_table =3D st7789v_of_match, =20
> >=20
> > May I point to you Sebastian Reichel's series that features a partial
> > overlap with your work? [0]
>=20
> Woow. That driver has been untouched for years and now two
> contributions at the same time.

Three actually. Michael also submitted a series :)

> Sebastian, what is the current state of your series?

The DT changes got Ack'd by Rob and I have the R-B from Michael
(minus a minor comment to make the panel struct 'static const').
It's mainly waiting for a review from Sam.

I was a bit distracted by a boot regression on the devices and
some other projects. The boot regression got solved, so I can
prepare a new version if that makes things easier.

> Shall I base my work on top of yours? Or is it still too
> premature and we shall instead try to merge both and contribute a new
> version of the series bringing support for the two panels?

I suppose whatever is easier for Sam to review.

-- Sebastian

--i2skpqgptx4h7ct3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSKS6UACgkQ2O7X88g7
+pr7ag//aIXJhLAMjUhHGJdIftjtxwYTW9Q/kTSwg7kr5JYuaI0lz+/F/csGETtK
qmHOIdka5ibiLxudbk5KqGCfCXPh/x7HfXqkFWA4iknku6cE71iwoRi/v5JnWjiZ
D2R52x0ykD2vwt6jdEA+r0jDDH83DelNhKJZTv2t8bdXNy36MY8YCYW/8pw3ZniA
Bnpcs3wY9m9P4RBf8+bHHAE0z4vZHY5NWyVHh2DdHCU7fspX9EXLsmZQ7vofptNf
0QOWwBQibfZXfXEYf1/6DekU6MuBBgmt+eNtbv5h/3Shdf4lecXt4i3pMKhjAppO
L+Yc2u1hfW8QjZSCL/slJ+LRCN06+uhpHdqmjcz1VOH1/v2l2oVP5weQ0FXCyyEE
07aln0F9cTV/zih4X+wfKxybgo7CT/twAyZrywfF63t2OuUxPK0UCkczGxSyVKCZ
6qhxJrziWl5mNX+nV1d2yp62vpUmuSuZgzF4OkmxA8DBiBOLNEd8MEFUYSt430SX
q3s4Yd4L66L6g+SBzQsXhvQdEPsVOwBcNFtkexH8ci15hDg5u6cw1Ri6DywDipz7
1gqJa8lGb6tQSpF6P/qDLPWkjnHxMWYu+5JRVDLbmA0Qs8gZrkwcbGA126+CBANM
e16RC+CffTyUsm4e7ie+w2Jo9rXeULdeQgP/ussgwTQ3sKMCYGA=
=EAvt
-----END PGP SIGNATURE-----

--i2skpqgptx4h7ct3--
