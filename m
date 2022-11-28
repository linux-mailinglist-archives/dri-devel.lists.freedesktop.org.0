Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80963B007
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 18:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40310E0A3;
	Mon, 28 Nov 2022 17:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049010E0A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 17:48:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oziEl-0007sf-H2; Mon, 28 Nov 2022 18:48:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oziEi-000tGc-UD; Mon, 28 Nov 2022 18:48:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oziEi-0011WX-UO; Mon, 28 Nov 2022 18:48:08 +0100
Date: Mon, 28 Nov 2022 18:48:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that
 actually need it
Message-ID: <20221128174808.6nwikksxxho7ejjp@pengutronix.de>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
 <efad098d-f2b8-f8e2-571f-08dd6f4dbcb2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fgvj6fxtoj44k5j5"
Content-Disposition: inline
In-Reply-To: <efad098d-f2b8-f8e2-571f-08dd6f4dbcb2@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fgvj6fxtoj44k5j5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Mon, Nov 28, 2022 at 05:54:32PM +0100, Javier Martinez Canillas wrote:
> On 9/12/22 11:15, Uwe Kleine-K=F6nig wrote:
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 198ba846d34b..593d7335b10a 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -13,7 +13,6 @@ menuconfig DRM
> >  	select HDMI
> >  	select FB_CMDLINE
> >  	select I2C
>=20
> Is I2C still required or was just a dependency of I2C_ALGOBIT ?

I didn't convince myself I2C can go away, but I would expect this to be
an opportunity for another cleanup as I mentioned in the commit log.
=20
> I'll wait a few days in case others want to review this change too
> and then can push this to drm-misc-next.=20

I'm looking forward to all the people reviewing my patch now who missed
the patch during the last 18 months but who will take the opportunity of
these additional few days :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fgvj6fxtoj44k5j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOE9FUACgkQwfwUeK3K
7AkE4wf/cG64izTfCNemGa4aSQge5ApyQi7z+rFU9p+nxtVHimcOYv1C/NogTcO2
oJOLvhD1KlRYIvuG3kXvCCtkvKHCG3LUIl4QhCbMee3n/eDYy5mhRuIv5VHtDyPY
KQJocdo9eV/EOjqPUCz3dH8JYTSOeW1ymOomJsVwawoTq3sMBQ/p5QmJrU6t8Ypc
zVZGpotF6P2+h4W1UOm0WZdKByLYfpUDks16rWstaX58bve92/K7uS2kUG2QcOYC
5TSqx4ZPCH+tIjHnvIoyGhNMgbKQg4AAp+AtVJO6eND7eL0WiKjFTMouxiCSxDTM
l45nYdaPHDY8Eq/C1ar96+FfeRpGUg==
=5DEl
-----END PGP SIGNATURE-----

--fgvj6fxtoj44k5j5--
