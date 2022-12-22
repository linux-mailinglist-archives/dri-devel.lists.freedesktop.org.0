Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023016547FB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 22:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762F410E180;
	Thu, 22 Dec 2022 21:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0602710E5A0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 21:41:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p8THb-0006by-Py; Thu, 22 Dec 2022 22:39:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p8THW-0015ii-Tp; Thu, 22 Dec 2022 22:39:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p8THW-007DI1-7x; Thu, 22 Dec 2022 22:39:14 +0100
Date: Thu, 22 Dec 2022 22:39:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Message-ID: <20221222213914.mlykf4xey6cbugk5@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kk3flh3igekl75hy"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Ajay Gupta <ajayg@nvidia.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kk3flh3igekl75hy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dave, hello Daniel,

On Fri, Nov 18, 2022 at 11:36:12PM +0100, Uwe Kleine-K=F6nig wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/i2c/ch7006_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch700=
6_drv.c
> index 578b738859b9..e0476a5bf84c 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -386,7 +386,7 @@ static const struct drm_encoder_slave_funcs ch7006_en=
coder_funcs =3D {
> =20
>  /* I2C driver functions */
> =20
> -static int ch7006_probe(struct i2c_client *client, const struct i2c_devi=
ce_id *id)
> +static int ch7006_probe(struct i2c_client *client)
>  {
>  	uint8_t addr =3D CH7006_VERSION_ID;
>  	uint8_t val;
> @@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops =3D {
> =20
>  static struct drm_i2c_encoder_driver ch7006_driver =3D {
>  	.i2c_driver =3D {
> -		.probe =3D ch7006_probe,
> +		.probe_new =3D ch7006_probe,
>  		.remove =3D ch7006_remove,
> =20
>  		.driver =3D {

I didn't get any feedback for the four drm/i2c drivers in this series,
(and they didn't appear in next).

Who is responsible for this area?

If you want to pick up just the drm/i2c patches, you can do:

	b4 am -l -P 38-41 20221118224540.619276-39-uwe@kleine-koenig.org

All four patches don't depend on i2c_client_get_device_id(), so they can
be applied to your tree as is.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kk3flh3igekl75hy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOkzn4ACgkQwfwUeK3K
7AmLAwf/VdWC1VNoUsCra60CFu7WbCCbmvFtJxTLgCX/QJEXqv2e8zPmzcfMLviw
FlZbloDDciqPfC5YDPBYouNnrKabzNRBH+lieih6WizK1DxFcFxBEkIHICRmvYZp
zhQv3z4AOSJCbRFg6i06PgbbofDhBNTe9FCx0PJKg2ngWSaWuVna4vsnu1Pm0jMv
LA7Q6hJPoV58lFoARMoOOVMACv3oFjCzfW25dPQWsgN2kaneXWHZrMSf4kcrHQv6
vE2OHAOKCQ4u8k6vB4h13tgNKnr51EJKYsoUbFyVdlcNA1rFL73s7fgy6R/XXGTl
E/VekLIT7GJUBi7Mi5S04yd4oSpCKg==
=gfAk
-----END PGP SIGNATURE-----

--kk3flh3igekl75hy--
