Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67359508164
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 08:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A80910E1D5;
	Wed, 20 Apr 2022 06:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E110E398
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nh47R-0002PY-QL; Wed, 20 Apr 2022 08:47:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nh47Q-00472A-Lr; Wed, 20 Apr 2022 08:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nh47O-004QPt-G6; Wed, 20 Apr 2022 08:47:14 +0200
Date: Wed, 20 Apr 2022 08:47:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ian Cowan <ian@linux.cowan.aero>
Subject: Re: [PATCH] Staging: fbtft: Fix style problem in header
Message-ID: <20220420064711.xuhuyhtgcrs3avhk@pengutronix.de>
References: <20220419192128.445023-1-ian@linux.cowan.aero>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6c7gyf26iz42gi3d"
Content-Disposition: inline
In-Reply-To: <20220419192128.445023-1-ian@linux.cowan.aero>
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6c7gyf26iz42gi3d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 03:21:28PM -0400, Ian Cowan wrote:
> Removed an unnecessary semicolon at the end of a macro call
>=20
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> ---
>  drivers/staging/fbtft/fbtft.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> index 2c2b5f1c1df3..aa66760e1a9c 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -277,7 +277,7 @@ static const struct of_device_id dt_ids[] =3D {					\
>  	{ .compatible =3D _compatible },						\
>  	{},									\
>  };										\
> -MODULE_DEVICE_TABLE(of, dt_ids);
> +MODULE_DEVICE_TABLE(of, dt_ids)

In fact the ; after MODULE_DEVICE_TABLE is necessary. There is only a
single instance in the kernel without a semicolon[1]. That's in
drivers/pci/controller/pcie-microchip-host.c and this only works because
this driver cannot be compiled as a module and so MODULE_DEVICE_TABLE
evaluates to nothing. Will send a patch for that one.

Best regards
Uwe

[1] git grep -E '^[[:space:]]*MODULE_DEVICE_TABLE\([^;]*$'

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6c7gyf26iz42gi3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJfrGwACgkQwfwUeK3K
7An8sgf9GnJXseRgcWM2oW4Lr9o461p+jzOaAhHzt3pQUx5hxJ2cjKQk5FVFTrNv
uLRMcMlz67g5iMVTvrD6SAW27jLjBhefhnKaRp6DmyxVjRcHQAxWZSxWYN/vQWol
ybIxQI0xLXukBgOOqCk4cf7CWpLYOEJJur9OyzBEmr/WEnzq2KP35mRiRnhawSAa
VksRFY0jGETfrh5+ikHYMv1YrwY22mwACjsC8awcIM02CNkZdV022AJ8v11nnKAO
FGbHzO0RP/nFD2m+eGKRlLiq159iIQTfTbOIDi51QfthUDYqa55vMLFf4wZ4akc1
ozi6TsEKKD7ZIwc72fy9mMJGfqeGxw==
=i61k
-----END PGP SIGNATURE-----

--6c7gyf26iz42gi3d--
