Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456C6FBEE6
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 07:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595010E31F;
	Tue,  9 May 2023 05:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB31710E31F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 05:51:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGFw-0000yV-ND; Tue, 09 May 2023 07:51:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGFs-002A5w-Nh; Tue, 09 May 2023 07:51:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGFr-002fsi-Vr; Tue, 09 May 2023 07:51:20 +0200
Date: Tue, 9 May 2023 07:51:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 45/53] drm/tests: helpers: Convert to platform remove
 callback returning void
Message-ID: <20230509055119.g7ddzfvh5ouvjxwi@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-46-u.kleine-koenig@pengutronix.de>
 <164e2e26-7ed0-853f-c7d5-ad4fbbb61cac@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vcftgtemtlghqf2y"
Content-Disposition: inline
In-Reply-To: <164e2e26-7ed0-853f-c7d5-ad4fbbb61cac@igalia.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vcftgtemtlghqf2y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 07:10:27PM -0300, Ma=EDra Canal wrote:
> Hi Uwe,
>=20
> On 5/7/23 13:26, Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
> > and this typically results in resource leaks. To improve here there is a
> > quest to make the remove callback return void. In the first step of this
> > quest all drivers are converted to .remove_new() which already returns
> > void.
> >=20
> > Trivially convert this driver from always returning zero in the remove
> > callback to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >   drivers/gpu/drm/tests/drm_kunit_helpers.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/dr=
m/tests/drm_kunit_helpers.c
> > index e98b4150f556..049b98daedbb 100644
> > --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > @@ -19,14 +19,13 @@ static int fake_probe(struct platform_device *pdev)
> >   	return 0;
> >   }
> > -static int fake_remove(struct platform_device *pdev)
> > +static void fake_remove(struct platform_device *pdev)
> >   {
> > -	return 0;
> >   }
>=20
> This function was removed on commit 96c25b03145a. I'm not sure if
> we should bring it back.

Indeed. I sent my patch series before v6.4-rc1 was published and so
based it on top of v6.3, which doesn't include 96c25b03145a. Please
don't bring back fake_remove(), just drop this patch instead.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vcftgtemtlghqf2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRZ31cACgkQj4D7WH0S
/k6QgQf/UtUnxKz94gtzwBlnr6T3Gm9VsgAIz3W4w1CaItwqKdKArOxBQ+j/EnSW
nGUvEyUWCeY1973KUz6zkI1H68nyDq29+Jac5OobroAYgPgQEnuM4GN5K4A9+/U0
+lBlTXy9GM8ESkGRJytmIWGu2eGPu3Xv0LTo36vIt76j2XDVYgwpRg/JMkmAgMIF
nlSJ8yMtGuOJVTgWOpQ8y/z/m2r0dBE0RHVTxkCDol+18zrLEE0JVn6b3lojRZ1m
BzWOPvgEyQqMPx1cj8yzIRYlJOMu8G0r9MUer4/VSfWVs+RV/2RfAFQHYvvs/aOL
K85I1g42HIfzkC6w05HDC20Qd0vU7Q==
=MOGs
-----END PGP SIGNATURE-----

--vcftgtemtlghqf2y--
