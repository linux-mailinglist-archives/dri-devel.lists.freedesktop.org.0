Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DB5EDD20
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017F210E5FB;
	Wed, 28 Sep 2022 12:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCF410E5FB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 12:49:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id b2so4011221eja.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 05:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4+lluMcr3m13cduU3x+huhlQjsIsLYA0mTzk/FpQkiw=;
 b=TbuPHBKLON8foKh0LXTsxvt9Kfby/duFZ8lknK84spbsLy2Sgh9Cxzqpy482kiXWNb
 CB5sgM5hl/5F18PshmlEmgiT2kNFDpZ2MK25L/ixg5mHUYzQOWYx+I/1eoBCgsbURnfR
 RX+yO/2KZVG9ScC4aIFtrNvFAetU9HwHnj/xbIsHVl9IF8gglrkynv4sRUAAvU9vBtU5
 Aibuk3TWtSUfHJSdFRB6rF4Ax59rz/xHCUwNo9z+WgaKDdeFeLPgdf78FjEX9ssvE1RR
 QwWHvpO24dZluPTDwvk4FjFR8bx9Q4jqPDp+wgSQkaE/mDCFmFkh8ff0siWrVNHQjX/+
 4KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4+lluMcr3m13cduU3x+huhlQjsIsLYA0mTzk/FpQkiw=;
 b=xEbeZATMLCMi/9rtFH7/rg1bcU/QaDMLfFdEDBO/ciwTK6jH8uuaEuiRefrqRb5HBG
 rbqWarGpwHo9mgaKrllheDXXeeIDqmqUDhdBERjLBml9f9yi8I7/ol4gTZk1lzwjPkny
 gr36jrdp0MhOwmnhiw4Z1APt9SqRl6pGha94uBd4QebCGLUzcMvpOz2LWk3Z3aLjtjci
 mLZ3aK9ja97F3tjBijnUxCQvxsUpefzMYRy8KWjvQyhZ3u94/UokuhWqySWIKA8SGjiU
 T7KAuHrEVXJSTt8ZZ1hstmB0EWPf5twQJYlbRXtKLWWMI1vHApsUxeQMWc83/mVaVPtO
 EVFg==
X-Gm-Message-State: ACrzQf3ljxav+oYK6YhZsJldd1U5b2c78GighukUuiALcPf12Er1q+1Y
 W0pb8Kvc6DqxcNHYRkECi4c=
X-Google-Smtp-Source: AMsMyM4jPQQ5u/3m+rKfw6VX8SIHRQBZwrfJSCRneJr7Z8Dw7ndlfjUkO5P2lPhCZ8fS/U9zEnySfw==
X-Received: by 2002:a17:906:fe08:b0:77e:a290:988e with SMTP id
 wy8-20020a170906fe0800b0077ea290988emr26140766ejb.223.1664369343760; 
 Wed, 28 Sep 2022 05:49:03 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a170906115b00b0076f0a723f6bsm2310781eja.58.2022.09.28.05.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 05:49:02 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:49:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] pwm: Change prototype of .get_state() callback to
 return an error
Message-ID: <YzRCvGNpWXKyO/PE@orome>
References: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nu7Ly8ptYOpaC77P"
Content-Disposition: inline
In-Reply-To: <20220916151506.298488-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-gpio@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Robert Foss <robert.foss@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Nu7Ly8ptYOpaC77P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 05:15:04PM +0200, Uwe Kleine-K=C3=B6nig wrote:
[...]
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 7b357d1cf642..811e6f424927 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -121,8 +121,8 @@ static int crc_pwm_apply(struct pwm_chip *chip, struc=
t pwm_device *pwm,
>  	return 0;
>  }
> =20
> -static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -			      struct pwm_state *state)
> +static int crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     struct pwm_state *state)
>  {
>  	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(chip);
>  	struct device *dev =3D crc_pwm->chip.dev;
> @@ -132,13 +132,13 @@ static void crc_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  	error =3D regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg);
>  	if (error) {
>  		dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
> -		return;
> +		return -EIO;
>  	}
> =20
>  	error =3D regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cycle_reg=
);
>  	if (error) {
>  		dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error);
> -		return;
> +		return -EIO;
>  	}

In other drivers you propagate errors from regmap_read(), why not here?

> diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
> index 7004f55bbf11..aa06b3ce81a6 100644
> --- a/drivers/pwm/pwm-sprd.c
> +++ b/drivers/pwm/pwm-sprd.c
> @@ -65,8 +65,8 @@ static void sprd_pwm_write(struct sprd_pwm_chip *spc, u=
32 hwid,
>  	writel_relaxed(val, spc->base + offset);
>  }
> =20
> -static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -			       struct pwm_state *state)
> +static int sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +			      struct pwm_state *state)
>  {
>  	struct sprd_pwm_chip *spc =3D
>  		container_of(chip, struct sprd_pwm_chip, chip);
> @@ -80,11 +80,8 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, =
struct pwm_device *pwm,
>  	 * reading to the registers.
>  	 */
>  	ret =3D clk_bulk_prepare_enable(SPRD_PWM_CHN_CLKS_NUM, chn->clks);
> -	if (ret) {
> -		dev_err(spc->dev, "failed to enable pwm%u clocks\n",
> -			pwm->hwpwm);

This might be useful information, so perhaps leave it in?

[...]
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..ead909400e64 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct sun4i_pwm_=
chip *chip,
>  	writel(val, chip->base + offset);
>  }
> =20
> -static void sun4i_pwm_get_state(struct pwm_chip *chip,
> -				struct pwm_device *pwm,
> -				struct pwm_state *state)
> +static int sun4i_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm,
> +			       struct pwm_state *state)
>  {
>  	struct sun4i_pwm_chip *sun4i_pwm =3D to_sun4i_pwm_chip(chip);
>  	u64 clk_rate, tmp;
> @@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period, 2);
>  		state->polarity =3D PWM_POLARITY_NORMAL;
>  		state->enabled =3D true;
> -		return;
> +		return 0;
>  	}
> =20
>  	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm->hwpwm)];
> =20
>  	if (prescaler =3D=3D 0)
> -		return;
> +		/* huh? is this an error? */
> +		return 0;

Yeah, I think this would count as an error. The prescaler value returned
=66rom that table is 0 in what seems to be "invalid" configurations. If
you look at how this is used in sun4i_pwm_calculate(), these entries are
skipped for the computation of the duty cycle. So I would expect this to
happen in either an invalidly configured or completely unconfigured PWM.

That raises the question about what to do in these cases. If we return
an error, that could potentially throw off consumers. So perhaps the
closest would be to return a disabled PWM? Or perhaps it'd be up to the
consumer to provide some fallback configuration for invalidly configured
or unconfigured PWMs.

Thierry

--Nu7Ly8ptYOpaC77P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM0QroACgkQ3SOs138+
s6HrJA//R4NVzvmJDEIT0uJ/B/fTi506ikvJH3LlmAVviq98qg97iMix8rMCPGqc
62twdEyJY6/K4tP7obun6ECs4pS+dyimI6M3JO7TM9WVA5qy3wnAe3DWE3nRvDZl
DeGR2/GuuEbZkoXUN0ApOzs2zdZ5ad5D+lCV75PIpSeytQOPmBgwbEzgJ8i1THso
YP1w7gAs1IczyLOeQYg18ayS84OT5ckk19JEe9AR1W3eK3B1R3/SCxZlJMR3wzGH
Q8T/H3WmAWoKNdkFnZEiP4kpBDi19HGYcD6xFekE8GWq5HOr0ghI5J5scnWepzEG
ZDIOQHX41SEPF2OuvmqB3rd7Nn3h184Qez5gSq60a+up1teCKHaYL26rjvG3+ZRy
U95/iYVBGKLR5RYSyrckTS9Qf+9DUqkq849qymi8wAcblYd3cjxfEY8vFr7EKu6E
GBNFIESRgZa018Ql//iUdETcfWuRFXW8MYroBysHSxNSqEmBYNIndVLveuIwQ12A
WX3W/6os60lkoloqA3RC0/szowmm+IkfeXY0ojX5LbNpIZY0z8t41AodPRljJ+JK
GAEwFyw0uyadZKXAIEFdNNGEmy5pPKhKL2fLw68HFbpeHk2irRM5NMbT7RhNRi8t
bOtVwlaVLdgcRzD8drm4Z75ZMeuX9Trxji506euoejWNZIfOSW8=
=/E8C
-----END PGP SIGNATURE-----

--Nu7Ly8ptYOpaC77P--
