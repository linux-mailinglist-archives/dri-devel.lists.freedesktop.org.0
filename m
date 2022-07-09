Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4800256CAA3
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 18:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1321811AAC9;
	Sat,  9 Jul 2022 16:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878011AAD1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 16:29:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oADKP-0004TP-8L; Sat, 09 Jul 2022 18:29:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oADKF-005TR7-TR; Sat, 09 Jul 2022 18:29:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oADKI-0049Aq-Es; Sat, 09 Jul 2022 18:29:02 +0200
Date: Sat, 9 Jul 2022 18:28:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/mipi-dsi: Make remove callback return void
Message-ID: <20220709162859.feqv2seectpte6i2@pengutronix.de>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
 <20220708094922.1408248-4-u.kleine-koenig@pengutronix.de>
 <YslBbzfNQgNwUcIm@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k5vxrdt7gldsrabn"
Content-Disposition: inline
In-Reply-To: <YslBbzfNQgNwUcIm@ravnborg.org>
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
Cc: Ondrej Jirman <megous@megous.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sumit Semwal <sumit.semwal@linaro.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k5vxrdt7gldsrabn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sam,

On Sat, Jul 09, 2022 at 10:50:55AM +0200, Sam Ravnborg wrote:
> On Fri, Jul 08, 2022 at 11:49:22AM +0200, Uwe Kleine-K=F6nig wrote:
> > All implementations return 0 and the return value of mipi_dsi_drv_remov=
e()
> > is ignored anyhow.
> >=20
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed and applied to drm-misc (drm-misc-next).
> While applying updating panel-ebbg-ft8719

Good catch, at one time during creation of this series I intended to
check next and hint about such requirements. Great you noticed that on
your own, thanks!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k5vxrdt7gldsrabn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLJrMgACgkQwfwUeK3K
7AnYOggAj5Bj+M+062DoqYztSTc78fyW5MTqExEqPHPu5AQT4hudEv9c2B/GPdLb
1gPIdUM2kCh4830/rP23KXjMCvBgerjDZ2JHXt+DP0ydLAzngae41Kr+BLihu0w+
1l9KdXSlD5HIh24ZgIZnT5vdWPm4TKQt2t5N/6NaX/E7KjUJpjzs0m3FzHS9Zbt+
+CPoYWWwcVcGb2K/UUwhxu+3RwFU458Xhcv1q97i59taEfH1SXbOGenNle9ztGz1
ILMNkWSx7ntKOkqbKC4N4M8/a9WK9RbZamYeRE/dWs/vfmRT+sMdfv/c/wlFyndN
ymnH0QaBMXXLJNntBR3z8dWWhTSFDQ==
=F5jR
-----END PGP SIGNATURE-----

--k5vxrdt7gldsrabn--
