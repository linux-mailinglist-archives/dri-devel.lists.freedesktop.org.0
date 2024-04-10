Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7644389F9FA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852D2112E79;
	Wed, 10 Apr 2024 14:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11121133CE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:36:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruZ3I-0002dX-5E; Wed, 10 Apr 2024 16:35:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruZ3G-00BVqF-1i; Wed, 10 Apr 2024 16:35:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruZ3F-00010D-34;
 Wed, 10 Apr 2024 16:35:49 +0200
Date: Wed, 10 Apr 2024 16:35:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove
 callback returning void
Message-ID: <i3expbg3whx3nbvmhcb66fxjs6dh6atmqzrg7xzilazhcnpmv2@kpxjzziasube>
References: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
 <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ih7btfnaphb76vfa"
Content-Disposition: inline
In-Reply-To: <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
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


--ih7btfnaphb76vfa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Wed, Apr 10, 2024 at 03:40:30PM +0200, Robert Foss wrote:
> On Mon, 4 Mar 2024 10:10:06 +0100, Uwe Kleine-K=F6nig wrote:
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
> [1/1] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback ret=
urning void
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D2caad4f7b024

Thank you, very appreciated!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ih7btfnaphb76vfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYWo8QACgkQj4D7WH0S
/k52pwf+Ixtq+qwtmOmlV3CDDI5xTkETuP2c8nM/eDLP6hsunsWYH+xOiYRQ4Dzm
d/a1NPAfxMFKgAv7EL5Wokn9k+dBEQNKUdyF4U5vlsDyKJPfAiP4pKAANrc1ujug
7oTRh3yDqwvAx/FrFB65OZzP3/CyaBPlnkZn1ZmNKduKYxv6R49VP9b4DRh+VOh+
/cb7+QvGx5pnSbXVheXHGqzxTmOMChvODeu4OL2BOUJgSzdcCwGvWsGFtYPMTjfA
wfhUKusiP3Lt6wKmjtmmrTnut8JLReFdAZcyKVITDsj5jfz9hgpXY7lDpsNmyRtn
LjsTAEX9Jwzo7KLWuEc4ukaydNmszQ==
=/J36
-----END PGP SIGNATURE-----

--ih7btfnaphb76vfa--
