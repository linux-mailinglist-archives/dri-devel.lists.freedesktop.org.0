Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E96928D8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 21:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607010EE1E;
	Fri, 10 Feb 2023 20:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEAE10EE1E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 20:59:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQaUC-00017w-SN; Fri, 10 Feb 2023 21:59:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQaU9-0044Gn-RM; Fri, 10 Feb 2023 21:59:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQaUA-002WPM-Ea; Fri, 10 Feb 2023 21:59:10 +0100
Date: Fri, 10 Feb 2023 21:59:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Danilo Krummrich <dakr@redhat.com>, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v5 2/2] drm/imx/lcdc: Implement DRM driver for imx25
Message-ID: <20230210205909.yn542sleh3ovyapc@pengutronix.de>
References: <20230210180014.173379-1-u.kleine-koenig@pengutronix.de>
 <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="46wxytn6ohmr6q5z"
Content-Disposition: inline
In-Reply-To: <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--46wxytn6ohmr6q5z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Feb 10, 2023 at 07:00:14PM +0100, Uwe Kleine-K=F6nig wrote:
> +	ret =3D drm_bridge_attach(&lcdc->pipe.encoder, lcdc->bridge, NULL, DRM_=
BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
> +
> +	lcdc->connector =3D drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
> +	if (IS_ERR(lcdc->connector))
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init =
bridge connector\n");
> +
> +	drm_connector_attach_encoder(lcdc->connector, &lcdc->pipe.encoder);

At one point when I talked to Philipp, we wondered if it was sensible to
create a helper function for the above sequence of drm_bridge_attach +
drm_bridge_connector_init + drm_connector_attach_encoder.

Would that make sense? What would be a good name for such a function?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--46wxytn6ohmr6q5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPmsBoACgkQwfwUeK3K
7Amilwf+P7MUiYvkz5OxsnUfnnhE/LvnBfPkz6SosyXRutbbLx+kA6BP7xSKS6D5
J6zbQwP4PLcvj4Ny2Jw7juRdd9We4p3AskS2ofgGvVYG3RMLpwg+2OhZf4kRedV4
o1xnkkUzDBazWiZnD/Rx9lECYZlFNVcLUGCnq584nuHW09HC4zqHFrfQnXAGda8c
ql0cvfhhr7WDBjMaQg2zLeJ+aysiEF9DhY/WMpJQbtVTtBpjH4UXFS8ZC2h9ZYq1
5re8JQgVe/HUQBvmrGc9NHGvslRhG+TezfbbDnjAPa1ZAi2TopM3zjZphQQYrT/7
28mTS0uGV4zHW4mVlL1HQG4FK4bYkQ==
=L1PC
-----END PGP SIGNATURE-----

--46wxytn6ohmr6q5z--
