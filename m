Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDF764760
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 08:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235E10E4DB;
	Thu, 27 Jul 2023 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1410E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:57:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOuvw-00045C-TD; Thu, 27 Jul 2023 08:57:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOuvt-002Pr9-Av; Thu, 27 Jul 2023 08:57:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOuvs-0088K0-Hi; Thu, 27 Jul 2023 08:57:08 +0200
Date: Thu, 27 Jul 2023 08:57:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] drm: omapdrm: dss: Remove redundant DSSERR()
Message-ID: <20230727065708.q7wrmzb7egzc4tmy@pengutronix.de>
References: <20230727113923.3093070-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g7ii4rrgxi7ozkxs"
Content-Disposition: inline
In-Reply-To: <20230727113923.3093070-1-ruanjinjie@huawei.com>
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
Cc: arnd@arndb.de, guozhengkui@vivo.com, tomi.valkeinen@ideasonboard.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, yuancan@huawei.com,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g7ii4rrgxi7ozkxs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 27, 2023 at 11:39:23AM +0000, Ruan Jinjie wrote:
> There is no need to call the DSSERR() function directly to print
> a custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message
> in case of a failure.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 1 -
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 +---
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
>  4 files changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdr=
m/dss/dispc.c
> index c26aab4939fa..9209103f5dc5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -4779,7 +4779,6 @@ static int dispc_bind(struct device *dev, struct de=
vice *master, void *data)
> =20
>  	dispc->irq =3D platform_get_irq(dispc->pdev, 0);
>  	if (dispc->irq < 0) {
> -		DSSERR("platform_get_irq failed\n");
>  		r =3D -ENODEV;
>  		goto err_free;
>  	}

Orthogonal to your patch I wonder about r =3D -ENODEV. Wouldn't r =3D
dispc->irq be the sensible option? Ditto for the other hunks.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g7ii4rrgxi7ozkxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTCFUMACgkQj4D7WH0S
/k6/sQgAlu8JiIDWijjQAWnIm7W6LnXF2PcEFXJ49r+mqhkQSbgt0gLOgGA0QjSv
LmjYUBWKukx/vslwKD8uJEnZrSoOuf9pqPfbdP+seF66ORFKPwu0nfc//c0YL1Xa
f6zYLS3V+qJbtFFXblWXNk6HUGwRyOs6bVBL57pw/VReRSYXb7TQ52oTeSemY5Yc
G/WYD0j0nXQ85kW4dT68dkoG8qFcmM54sR6hYEvREBRlTbXAn3xAzo1Fbavaox6N
OPMeErq/w1KHmZKp24o413B9D2ON9GnSfVORXyS3SMZYK3Q7bKchWXvhM/FAz3W9
yDFOrEq9Y5O7dynaUS4ns8pWRW3oSw==
=Bhpn
-----END PGP SIGNATURE-----

--g7ii4rrgxi7ozkxs--
