Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BD72F80C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C3D10E11F;
	Wed, 14 Jun 2023 08:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F610E11F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:40:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q9M2n-0006Xo-A7; Wed, 14 Jun 2023 10:39:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q9M2l-007JTu-5z; Wed, 14 Jun 2023 10:39:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q9M2j-00E9QN-TW; Wed, 14 Jun 2023 10:39:53 +0200
Date: Wed, 14 Jun 2023 10:39:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 2/4] video: backlight: lp855x: get PWM for PWM mode
 during probe
Message-ID: <20230614083953.e4kkweddjz7wztby@pengutronix.de>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
 <20230429104534.28943-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ek7wuekooig4rg5c"
Content-Disposition: inline
In-Reply-To: <20230429104534.28943-3-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ek7wuekooig4rg5c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 12:45:32PM +0200, Artur Weber wrote:
> Also deprecate the pwm-period DT property, as it is now redundant
> (pwms property already contains period value).
>=20
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backligh=
t/lp855x_bl.c
> index 81012bf29baf..21eb4943ed56 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -218,23 +218,10 @@ static int lp855x_configure(struct lp855x *lp)
> =20
>  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  {
> -	struct pwm_device *pwm;
>  	struct pwm_state state;
> =20
> -	/* request pwm device with the consumer name */
> -	if (!lp->pwm) {
> -		pwm =3D devm_pwm_get(lp->dev, lp->chipname);
> -		if (IS_ERR(pwm))
> -			return;
> -
> -		lp->pwm =3D pwm;
> -
> -		pwm_init_state(lp->pwm, &state);
> -	} else {
> -		pwm_get_state(lp->pwm, &state);
> -	}
> +	pwm_get_state(lp->pwm, &state);

pwm_get_state returns an error code. Do you care if it fails? (You
probably should.)
> =20
> -	state.period =3D lp->pdata->period_ns;
>  	state.duty_cycle =3D div_u64(br * state.period, max_br);
>  	state.enabled =3D state.duty_cycle;
> =20
> @@ -339,6 +326,7 @@ static int lp855x_parse_dt(struct lp855x *lp)
>  	of_property_read_string(node, "bl-name", &pdata->name);
>  	of_property_read_u8(node, "dev-ctrl", &pdata->device_control);
>  	of_property_read_u8(node, "init-brt", &pdata->initial_brightness);
> +	/* Deprecated, specify period in pwms property instead */
>  	of_property_read_u32(node, "pwm-period", &pdata->period_ns);
> =20
>  	/* Fill ROM platform data if defined */
> @@ -399,6 +387,7 @@ static int lp855x_probe(struct i2c_client *cl)
>  	const struct i2c_device_id *id =3D i2c_client_get_device_id(cl);
>  	const struct acpi_device_id *acpi_id =3D NULL;
>  	struct device *dev =3D &cl->dev;
> +	struct pwm_state pwmstate;
>  	struct lp855x *lp;
>  	int ret;
> =20
> @@ -457,11 +446,6 @@ static int lp855x_probe(struct i2c_client *cl)
>  		}
>  	}
> =20
> -	if (lp->pdata->period_ns > 0)
> -		lp->mode =3D PWM_BASED;
> -	else
> -		lp->mode =3D REGISTER_BASED;
> -
>  	lp->supply =3D devm_regulator_get(dev, "power");
>  	if (IS_ERR(lp->supply)) {
>  		if (PTR_ERR(lp->supply) =3D=3D -EPROBE_DEFER)
> @@ -472,11 +456,31 @@ static int lp855x_probe(struct i2c_client *cl)
>  	lp->enable =3D devm_regulator_get_optional(dev, "enable");
>  	if (IS_ERR(lp->enable)) {
>  		ret =3D PTR_ERR(lp->enable);
> -		if (ret =3D=3D -ENODEV) {
> +		if (ret =3D=3D -ENODEV)
>  			lp->enable =3D NULL;
> -		} else {
> +		else
>  			return dev_err_probe(dev, ret, "getting enable regulator\n");
> -		}
> +	}
> +
> +	lp->pwm =3D devm_pwm_get(lp->dev, lp->chipname);
> +	if (IS_ERR(lp->pwm)) {
> +		ret =3D PTR_ERR(lp->pwm);
> +		if (ret =3D=3D -ENODEV || ret =3D=3D -EINVAL)

Why would you ignore EINVAL?

> +			lp->pwm =3D NULL;
> +		else
> +			return dev_err_probe(dev, ret, "getting PWM\n");
> +
> +		lp->mode =3D REGISTER_BASED;
> +		dev_dbg(dev, "mode: register based\n");
> +	} else {

pwmstate could be declared here.

> +		pwm_init_state(lp->pwm, &pwmstate);
> +		/* Legacy platform data compatibility */
> +		if (lp->pdata->period_ns > 0)
> +			pwmstate.period =3D lp->pdata->period_ns;
> +		pwm_apply_state(lp->pwm, &pwmstate);

This is a change in behaviour. Before lp855x_probe() didn't modify the
state the bootloader left the backlight in. Now you're disabling it (I
think). Is this intended?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ek7wuekooig4rg5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSJfNkACgkQj4D7WH0S
/k5BdAgAs/Rb0sNvnazKhyxx1/2B+8B8l05A3se8y+qIfYwQkuhUfSSbRq80AX6G
E3LMnbhe/ZeJSNWsxC27KTQfq0549+UgOrKjn6C4XgHk2hXOHTddWHmYDdwXu2WP
Xioakfi2oNQxtyyGpx/moi+RLXGkiENoMqdoVdoXv/s4xY9vYHGOh1y6wf24yODH
qSmd4fhumjKaqhl60wyH8n9JJJP2RFf3qIvH1Y4f421I8mZNriOjdPoou4b8ra5t
o/MjffWe9Jx6h4IWGnl3YWM2t2c9jNnFcEnEtQKnSRBnCtFJC30WfKdGQPuxYYvh
LF47pzLCWDJQBbJYpKZ6u02A8AOQog==
=ZFS9
-----END PGP SIGNATURE-----

--ek7wuekooig4rg5c--
