Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3365F516
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3192610E811;
	Thu,  5 Jan 2023 20:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BE510E811
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 20:16:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pDWfG-00011k-UO; Thu, 05 Jan 2023 21:16:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pDWfF-004441-1I; Thu, 05 Jan 2023 21:16:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pDWfE-00AVZS-8l; Thu, 05 Jan 2023 21:16:36 +0100
Date: Thu, 5 Jan 2023 21:16:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
Message-ID: <20230105201636.slzwxyqqrkwwe7gr@pengutronix.de>
References: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
 <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
 <Y7bfqaLUaqXBsBmr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ez7bb6rvuubelubm"
Content-Disposition: inline
In-Reply-To: <Y7bfqaLUaqXBsBmr@phenom.ffwll.local>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ez7bb6rvuubelubm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

On Thu, Jan 05, 2023 at 03:33:13PM +0100, Daniel Vetter wrote:
> On Tue, Dec 20, 2022 at 08:24:18AM +0100, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 19.12.22 um 19:31 schrieb Uwe Kleine-K=F6nig:
> > > There is a local variable that contains dev->driver. Make use of it
> > > instead of "open coding" it.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Added to drm-misc-next. Thanks a lot.
>=20
> Given that Uwe has a pile of drm commits all over, time for drm-misc
> commit rights?

I feel honored, but if you ask me, that's not necessary/sensible. At
least up to now my patches are more or less drive-by changes and letting
them go through someone else with commit access is fine for me. There is
no driver in the drm area I feel responsible for.

Or is this about reducing maintainer load on your end?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ez7bb6rvuubelubm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO3MCEACgkQwfwUeK3K
7AmoXQf/d3/FUOu1J8PQAQsrA0ecu99P/Nm3sTvOWsPYjyR1UFLpVl4JIHWHCMvK
Mq3n7+HqNctqODr4QJ9Fb6roFwgPcFCR9G6PfmbBAw5d1oJeYEKUfdbWJhk0SJiX
blOZ2o3h52TlAKBWrRU5OfzJIhkbObhYhGfujp6O6nLqhcdZzAMazyigmNaTHTPE
hZcvP2WlvkWesZzoI3CVbWoo3mjDjINqdgR6vmPYSeE4onidtz4pSHHTAkeeu3Ft
sPpbv39DtxmOCJLAHQqES219r+FhWCU0Ks97FiSRkyIoAHZHyK68jxgIgNHrClu+
168yI3wjC8X14bH3JSlLexprEYBR1Q==
=ubgQ
-----END PGP SIGNATURE-----

--ez7bb6rvuubelubm--
