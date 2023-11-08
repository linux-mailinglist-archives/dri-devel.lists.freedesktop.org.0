Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946B7E6037
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE4010E868;
	Wed,  8 Nov 2023 21:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4BF8921E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:52:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0qTG-0006JX-7B; Wed, 08 Nov 2023 22:52:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0qTF-007d0V-DT; Wed, 08 Nov 2023 22:52:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0qTF-00FUl2-47; Wed, 08 Nov 2023 22:52:21 +0100
Date: Wed, 8 Nov 2023 22:52:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231108215220.3iw5sydxad32gufj@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jmxjragmypaomjv7"
Content-Disposition: inline
In-Reply-To: <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nathan Chancellor <nathan@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jmxjragmypaomjv7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 10:24:09PM +0100, Helge Deller wrote:
> On 11/8/23 22:00, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 08, 2023 at 11:48:05AM -0700, Nathan Chancellor wrote:
> > > diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/=
atmel_lcdfb.c
> > > index 88c75ae7d315..9e391e5eaf9d 100644
> > > --- a/drivers/video/fbdev/atmel_lcdfb.c
> > > +++ b/drivers/video/fbdev/atmel_lcdfb.c
> > > @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(stru=
ct atmel_lcdfb_info *sinfo, int
> > >   	}
> > >   }
> > >=20
> > > -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =
=3D {
> > > +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
> > >   	.type		=3D FB_TYPE_PACKED_PIXELS,
> > >   	.visual		=3D FB_VISUAL_TRUECOLOR,
> > >   	.xpanstep	=3D 0,
> >=20
> > I wonder if this was broken already before my patch. atmel_lcdfb_probe()
> > does
> >=20
> > 	info->fix =3D atmel_lcdfb_fix;
> >=20
> > and unless I miss something (this is well possible) that is used e.g. in
> > atmel_lcdfb_set_par() -> atmel_lcdfb_update_dma(). So atmel_lcdfb_fix
> > should better not live in .init memory?! Someone with more knowledge
> > about fbdev might want to take a look and decide if this justifies a
> > separate fix that should then be backported to stable, too?!
>=20
> I don't think a backport this is necessary.
> The "__initconst" atmel_lcdfb_fix struct was only copied in the
> "__init" atmel_lcdfb_probe() function.
> So, both were dropped at the same time in older kernels.

But info and so info->fix live longer than the probe function, don't
they? So a call to atmel_lcdfb_update_dma() should better not happen
when .init is already discarded, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jmxjragmypaomjv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVMAxQACgkQj4D7WH0S
/k5YSQf6AxPchEkuYUXk6gx411eVDK/R4tn3tfcNjk8/B9Mq3j8sLPqQoRfQ7K7N
fHQQ/JrC48o2oc+EF80BM8gKMf0RoaaB7phh8SKbrnWJa9oriQtQURkHkE27+hTt
fM1njMKAZL1d4evY22cQEk1pzPPlQv4gb9pJ1vr7RSZ9quqF5hTi04syTbWdoAxa
R2GyrjZirtoIiJwfg8c+RaQrVvrMPxu+9c68q0rUBevVFZIFGqN/flOAp4ZurvB3
gDlZjQJk6q8OodLo6okDbTFusdoA2picLzXUGT7gnX/N6kIqHHymWnZjch/hPOza
5Mw9ByKx6RcAkWb8TQopR9NeCIGWeg==
=xFUk
-----END PGP SIGNATURE-----

--jmxjragmypaomjv7--
