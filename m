Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71C64F0C1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4410E616;
	Fri, 16 Dec 2022 18:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5BE10E616
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:11:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6FBL-0005s9-DM; Fri, 16 Dec 2022 19:11:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6FBJ-004yp6-8J; Fri, 16 Dec 2022 19:11:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6FBJ-005bku-6S; Fri, 16 Dec 2022 19:11:37 +0100
Date: Fri, 16 Dec 2022 19:11:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that
 actually need it
Message-ID: <20221216181134.c5d7rsojb22w2c2g@pengutronix.de>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
 <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mqzoy32hcnef52gz"
Content-Disposition: inline
In-Reply-To: <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mqzoy32hcnef52gz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 07:16:11PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 12.09.22 um 11:15 schrieb Uwe Kleine-K=F6nig:
> > While working on a drm driver that doesn't need the i2c algobit stuff I
> > noticed that DRM selects this code even tough only 8 drivers actually u=
se
> > it. While also only some drivers use i2c, keep the select for I2C for t=
he
> > next cleanup patch. Still prepare this already by also selecting I2C for
> > the individual drivers.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Changes since v1
> > (20210514100142.1182997-1-u.kleine-koenig@pengutronix.de) from
> > 2021-05-14:
> >=20
> >   - rebased to next-20220909
> >     was something around v5.13-rc2 before, required to fix context
> >     changes in the nouveau Kconfig file. git am -3 handled it just fine.
> >=20
> > I reverified that no new drivers were added that need a corresponding
> > select.
> >=20
> > Best regards
> > Uwe
> >=20
> >   drivers/gpu/drm/Kconfig                 | 5 ++++-
> >   drivers/gpu/drm/ast/Kconfig             | 2 ++
> >   drivers/gpu/drm/gma500/Kconfig          | 2 ++
> >   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
> >   drivers/gpu/drm/i915/Kconfig            | 2 ++
> >   drivers/gpu/drm/mgag200/Kconfig         | 2 ++
> >   drivers/gpu/drm/nouveau/Kconfig         | 2 ++
> >   7 files changed, 16 insertions(+), 1 deletion(-)
>=20
> amdgpu and radeon also include <linux/i2c-algo-bit.h>. Are they special in
> some way?

You wonder why there is no change in drivers/gpu/drm/amd/amdgpu/Kconfig
and drivers/gpu/drm/radeon/Kconfig, right?

Yes, amdgpu and radeon are special because their toplevel Kconfig
symbols (DRM_AMDGPU and DRM_RADEON respectively) are defined in
drivers/gpu/drm/Kconfig. For the other 6 drivers it's in their own
Kconfig file.

If that isn't your concern, please retry explaining it to me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mqzoy32hcnef52gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOctNMACgkQwfwUeK3K
7Al7mQgAk0alcHVjCIrH1HWyEyF0ElpZXb2ztUHKf0wDBuHBJxeoiyvzB+zoeda1
/U6YemflBzyyxvNFUvRGMTDevQLgWh0aroHIwN8fjq+YEQOoC4zckrQAhTcPb0ul
CPKEhpicBqZpuUlQDCkg4qDz9KK37M5m8ogOGFM2vcoB3T8xagTBWLVezt3V5Vle
iBbiDeTGuHeQCqUeNnlmkv1cZIRHrmKa73jjAylfGHSG/AEo+2Q77WYV7ha4a37G
VYJsQrCUULHquuhIJS7kZnHG35kBFc4mf59XGeviKBCICladcigkcXfDKlvCiyjY
lDXEDVo6dfh7RE6KAnMR46/And38Gw==
=crjI
-----END PGP SIGNATURE-----

--mqzoy32hcnef52gz--
