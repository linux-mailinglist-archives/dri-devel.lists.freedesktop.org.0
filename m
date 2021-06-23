Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F63B15D6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4806E85A;
	Wed, 23 Jun 2021 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E406E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:29:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvyG5-0004q2-UE; Wed, 23 Jun 2021 10:29:17 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvyG4-00032S-3W; Wed, 23 Jun 2021 10:29:16 +0200
Date: Wed, 23 Jun 2021 10:29:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210623082915.tj7pid46wm3dl5jf@pengutronix.de>
References: <20210622030948.966748-1-bjorn.andersson@linaro.org>
 <20210622030948.966748-2-bjorn.andersson@linaro.org>
 <20210622202935.lbghwelbiwgufycd@pengutronix.de>
 <YNKKkEMD4sVhfcNr@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2vpq5rw3nar65532"
Content-Disposition: inline
In-Reply-To: <YNKKkEMD4sVhfcNr@yoga>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2vpq5rw3nar65532
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Tue, Jun 22, 2021 at 08:12:48PM -0500, Bjorn Andersson wrote:
> On Tue 22 Jun 15:29 CDT 2021, Uwe Kleine-K?nig wrote:
> > On Mon, Jun 21, 2021 at 10:09:48PM -0500, Bjorn Andersson wrote:
> > > +		/*
> > > +		 * PWM duty cycle is given as:
> > > +		 *
> > > +		 *   duty =3D BACKLIGHT / (BACKLIGHT_SCALE + 1)
> > > +		 *
> > > +		 * The documentation is however inconsistent in its examples,
> > > +		 * so the interpretation used here is that the duty cycle is
> > > +		 * the period of BACKLIGHT * PRE_DIV / REFCLK_FREQ.
> >=20
> > I don't understand this.
> >=20
> > > +		 *
> > > +		 * The ratio PRE_DIV / REFCLK_FREQ is rounded up to whole
> > > +		 * nanoseconds in order to ensure that the calculations are
> > > +		 * idempotent and gives results that are smaller than the
> > > +		 * requested value.
> > > +		 */
> > > +		tick =3D DIV_ROUND_UP(NSEC_PER_SEC * pre_div, pdata->pwm_refclk_fr=
eq);
> > > +		backlight =3D state->duty_cycle / tick;
> >=20
> > You're loosing precision here by dividing by the result of a division.
>=20
> The actual period is also a result of a division and after spending too
> many hours scratching my head I reached to conclusion that this was the
> reason why I wasn't able to get the duty cycle calculation idempotent
> over the ranges I tested.

How did you test? Using the sysfs interface?
=20
> But in my effort to describe this to you here, I finally spotted the
> error and will follow up with a new version that does:
>=20
>                 actual =3D NSEC_PER_SEC * (pre_div * scale + 1) / pdata->=
pwm_refclk_freq);
>                 backlight =3D state->duty_cycle * (scale + 1) / actual;

So the first term ("actual") is the period that you get for a given
pre_div, scale and pwm_refclk_freq, right? And the 2nd ("backlight")
defines the register value to configure the duty_cycle, right?

I wonder: Is it possible to configure a 100% relative duty cycle? Then
backlight would be scale + 1 which (at least if scale is 0xffff) would
overflow the 16 bit register width?!

> > > +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_de=
vice *pwm,
> > > +				struct pwm_state *state)
> > > +{
> > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > +	unsigned int pwm_en_inv;
> > > +	unsigned int pre_div;
> > > +	u16 backlight;
> > > +	u16 scale;
> > > +	int ret;
> > > +
> > > +	ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale=
);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> > > +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> > > +		state->polarity =3D PWM_POLARITY_INVERSED;
> > > +	else
> > > +		state->polarity =3D PWM_POLARITY_NORMAL;
> > > +
> > > +	state->period =3D DIV_ROUND_UP(NSEC_PER_SEC * (pre_div * scale + 1)=
, pdata->pwm_refclk_freq);
> > > +	state->duty_cycle =3D backlight * DIV_ROUND_UP(NSEC_PER_SEC * pre_d=
iv, pdata->pwm_refclk_freq);
> >=20
> > If you use
> >=20
> > 	state->duty_cycle =3D DIV_ROUND_UP(backlight * NSEC_PER_SEC * pre_div,=
 pdata->pwm_refclk_freq);
> >=20
> > instead (with a cast to u64 to not yield an overflow) the result is more
> > exact.
> >=20
>=20
> The problem with this is that it sometimes yields duty_cycles larger
> than what was requested... But going back to describing this as a ratio
> of the period this becomes:
>=20
>         state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period * backlight,=
 scale + 1);

I saw your next iteration of this patch set, but didn't look into it
yet. Note that if it uses this formula it sill looses precision.
Consider:

	pwm_refclk_freq =3D 1333333
	pre_div =3D 4
	scale =3D 60000
	backlight =3D 59999

then you calculate:

	state->period =3D 180000796 (exact value: 180000795.00019875)
	state->duty_cycle =3D 179994797 (exact value: 179994795.0736975)

so duty_cycle should actually be reported as 179994796. That happens
because state->period is already the result of a division, you get the
right value when doing:

	state->duty_cycle =3D round_up(NSEC_PER_SEC * (pre_div * scale + 1) * back=
light, (scale + 1) * pdata->pwm_refclk_freq)

> > I still find this surprising, I'd expect that SCALE also matters for the
> > duty_cycle. With the assumption implemented here modifying SCALE only
> > affects the period. This should be easy to verify?! I would expect that
> > changing SCALE doesn't affect the relative duty_cycle, so the brightness
> > of an LED is unaffected (unless the period gets too big of course).
> >=20
>=20
> I think the hardware is two nested counters, one (A) ticking at REFCLK_FR=
EQ
> and as that hits PRE_DIV, it kicks the second counter (B) (and resets).
>=20
> As counter A is reset the output signal goes high, when A hits BACKLIGHT =
the
> signal goes low and when A hits BACKLIGHT_SCALE it resets.

then we would probably have:

	period =3D (scale + 1) * pre_div / refclk

but not

	period =3D (scale * pre_div + 1) / refclk

=2E The former would be nicer because then in the calculation for
duty_cycle the factor (scale + 1) would cancel.

> Per this implementation the actual length of the duty cycle would indeed
> be independent of the BACKLIGHT_SCALE,

In your formula for duty_cycle scale actually does matter. So I think
we're not there yet?

> but the length of the low signal (and hence the ratio, which results
> in the actual brightness) does depend on BACKLIGHT_SCALE.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2vpq5rw3nar65532
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDS8NgACgkQwfwUeK3K
7AkmWQf8Cgehquu/iCwmNawhGxiQwrqeAVFvnlUEWyBetJg5IOeaL/HMb/zQmUI0
17YHKce8WtlQl+ggyPiXOw03Hj9Hdgg22AEi/AlBpUTCj3uRiuL2h18UqFTzDqO6
diXK5vaukl67y1+ty3wt1Nn6tkTidC3+3+z7gN4Rii0ww6q/RN50KacD/Hw3c/qU
rX1VpxznBhAH7YIL3K2++yeD/rHWCZJyaMgKCDV0v03RHxOkVZc4P6NgJreGYRfA
2x3mANPFi1GrIhZBvVEMApz5bIjiIjSyaY/ZHXKfpPGNKNe4p4ls2Gy8vOR0/w6L
Jlo1kmWoQV06Bja5wxVbT8aLDNsbHw==
=+/kF
-----END PGP SIGNATURE-----

--2vpq5rw3nar65532--
