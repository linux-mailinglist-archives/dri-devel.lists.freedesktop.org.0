Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD189F445
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1466112909;
	Wed, 10 Apr 2024 13:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115DB10FE8C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:29:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruY0K-00060d-RT; Wed, 10 Apr 2024 15:28:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruY0J-00BVJ9-Hh; Wed, 10 Apr 2024 15:28:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruY0J-00HaHf-1Q;
 Wed, 10 Apr 2024 15:28:43 +0200
Date: Wed, 10 Apr 2024 15:28:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Lucas Stach <l.stach@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 imx@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove
 callback returning void
Message-ID: <nb4f2nk2tsx7hitww57nkfjdvxpeowxprxde5qihkzhudm6zoo@ty5r5f3hjuff>
References: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
 <171275462600.2936896.18026577866490629134.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zcnaej4vqfuhzrxq"
Content-Disposition: inline
In-Reply-To: <171275462600.2936896.18026577866490629134.b4-ty@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zcnaej4vqfuhzrxq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Wed, Apr 10, 2024 at 03:10:26PM +0200, Robert Foss wrote:
> On Mon, 4 Mar 2024 10:05:56 +0100, Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is ignored (apart
> > from emitting a warning) and this typically results in resource leaks.
> >=20
> > To improve here there is a quest to make the remove callback return
> > void. In the first step of this quest all drivers are converted to
> > .remove_new(), which already returns void. Eventually after all drivers
> > are converted, .remove_new() will be renamed to .remove().
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback re=
turning void
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D29b39672bc1d

Great, do you feel like caring for its brother at

	https://lore.kernel.org/dri-devel/20240304091005.717012-2-u.kleine-koenig@=
pengutronix.de

, too?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zcnaej4vqfuhzrxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYWlAoACgkQj4D7WH0S
/k4yqQf/Uc0FHle5vWdWreDPieZMw6XYvyes4om62AZHWT0/c8Ep8HzSWZ67Zm/B
4Zt7DWlsTciavr115GoNbqn990M4ExFyXl7dSgHlWFbPLLJABlYzU336eXG5dFUy
MTBKNXdSdO7Jlun0q/wkA2CAS+jJkQB35VqcPoOTj1Zfe2GOJ5kOE3rDo06AdPHA
vf9BmY78zwWA5l18Z3y66eZ86y9TjqrrTZSag0b1RksiGd2YfIm1C4GL4BGaoL1R
EX3T1yFZ/pO9b5U06bNTkgQXknOHgg8j8h1PSA2eGPC6l99cmwrF7fnoJtfWy6XS
1Pa+sajbb8V0d9bXqUIgH397ucp8Rg==
=I27l
-----END PGP SIGNATURE-----

--zcnaej4vqfuhzrxq--
