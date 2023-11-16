Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672187EDCAD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 09:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09A8951B;
	Thu, 16 Nov 2023 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7AE10E2AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:12:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3XU9-0002Eo-11; Thu, 16 Nov 2023 09:12:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3XU7-009PTq-PW; Thu, 16 Nov 2023 09:12:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r3XU7-002XQH-G2; Thu, 16 Nov 2023 09:12:23 +0100
Date: Thu, 16 Nov 2023 09:12:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] backlight: pwm_bl: Use dev_err_probe
Message-ID: <20231116081223.6bdlwmy56eaahpgt@pengutronix.de>
References: <20231116075017.939926-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sk6c3h6rfs4ia424"
Content-Disposition: inline
In-Reply-To: <20231116075017.939926-1-alexander.stein@ew.tq-group.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sk6c3h6rfs4ia424
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 16, 2023 at 08:50:17AM +0100, Alexander Stein wrote:
> Let dev_err_probe handle the -EPROBE_DEFER case and also add an entry to
> /sys/kernel/debug/devices_deferred when deferred.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/p=
wm_bl.c
> index 289bd9ce4d36d..3825c2b67c53b 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -509,8 +509,7 @@ static int pwm_backlight_probe(struct platform_device=
 *pdev)
>  	pb->pwm =3D devm_pwm_get(&pdev->dev, NULL);
>  	if (IS_ERR(pb->pwm)) {
>  		ret =3D PTR_ERR(pb->pwm);
> -		if (ret !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "unable to request PWM\n");
> +		dev_err_probe(&pdev->dev, ret, "unable to request PWM\n");
>  		goto err_alloc;
>  	}

This change is an improvement, but I suggest to convert the complete
driver to dev_err_probe() while at it.

Something like:

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm=
_bl.c
index 289bd9ce4d36..9d80835158a2 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -461,10 +461,8 @@ static int pwm_backlight_probe(struct platform_device =
*pdev)
=20
 	if (!data) {
 		ret =3D pwm_backlight_parse_dt(&pdev->dev, &defdata);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to find platform data\n");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to find platform data\n");
=20
 		data =3D &defdata;
 	}
@@ -493,24 +491,27 @@ static int pwm_backlight_probe(struct platform_device=
 *pdev)
 	pb->enable_gpio =3D devm_gpiod_get_optional(&pdev->dev, "enable",
 						  GPIOD_ASIS);
 	if (IS_ERR(pb->enable_gpio)) {
-		ret =3D PTR_ERR(pb->enable_gpio);
+		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb->enable_gpio),
+				    "failed to acquire enable GPIO\n");
 		goto err_alloc;
 	}
=20
 	pb->power_supply =3D devm_regulator_get_optional(&pdev->dev, "power");
 	if (IS_ERR(pb->power_supply)) {
 		ret =3D PTR_ERR(pb->power_supply);
-		if (ret =3D=3D -ENODEV)
+		if (ret =3D=3D -ENODEV) {
 			pb->power_supply =3D NULL;
-		else
+		} else {
+			dev_err_probe(&pdev->dev, ret,
+				      "failed to acquire power regulator\n");
 			goto err_alloc;
+		}
 	}
=20
 	pb->pwm =3D devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(pb->pwm)) {
-		ret =3D PTR_ERR(pb->pwm);
-		if (ret !=3D -EPROBE_DEFER)
-			dev_err(&pdev->dev, "unable to request PWM\n");
+		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb->pwm),
+				    "unable to request PWM\n");
 		goto err_alloc;
 	}
=20
@@ -530,8 +531,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
=20
 	ret =3D pwm_apply_state(pb->pwm, &state);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
-			ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to apply initial PWM state\n");
 		goto err_alloc;
 	}
=20
@@ -568,8 +569,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
 		ret =3D pwm_backlight_brightness_default(&pdev->dev, data,
 						       state.period);
 		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"failed to setup default brightness table\n");
+			dev_err_probe(&pdev->dev, ret,
+				      "failed to setup default brightness table\n");
 			goto err_alloc;
 		}
=20
@@ -597,8 +598,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
 	bl =3D backlight_device_register(dev_name(&pdev->dev), &pdev->dev, pb,
 				       &pwm_backlight_ops, &props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
-		ret =3D PTR_ERR(bl);
+		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(bl),
+				    "failed to register backlight\n");
 		goto err_alloc;
 	}
=20

Feel free to pick up this diff claiming it's your's if you respin your
patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sk6c3h6rfs4ia424
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVVzuYACgkQj4D7WH0S
/k6tOQf/fv4hZevIaw/ejm2WHkTj/fG6G6i4bJ80obV7oBndCUd5oh8MfYrdvJio
slcVUNKpTrxSO8tzkLMjTGJtRJWsiRFz12LnOfMPo4apuiDpTYZNIaSmqXEFE1I6
zZP7trtt6mmUfBco94OAlWTjDsBB0OsVBIdJm1Sw2hQ5lDFiHLDNwWIBQ389IKvr
zWOtpwmzskK2Q++JlORiQ8mdLRWq5yYJVD0troq1GquPqd5v8O+uF0XZgfL7bE4J
bA3/SW0NHtujihbXy0nw7lPTt5a0I6VV5CCsbhV8SaXHyWi0P5zujos0U/ZloTEZ
shx5z3t17nkYvEIfV2wz4u7W+zKRNg==
=KPfS
-----END PGP SIGNATURE-----

--sk6c3h6rfs4ia424--
