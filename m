Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A118D3B2825
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 09:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA488E38;
	Thu, 24 Jun 2021 07:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585CB6E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:03:25 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwJOU-0002WV-M0; Thu, 24 Jun 2021 09:03:22 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwJO8-0005Zy-3n; Thu, 24 Jun 2021 09:03:00 +0200
Date: Thu, 24 Jun 2021 09:02:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210624070259.3mrjjt4mqs6jle5g@pengutronix.de>
References: <20210622030948.966748-1-bjorn.andersson@linaro.org>
 <20210622030948.966748-2-bjorn.andersson@linaro.org>
 <20210622202935.lbghwelbiwgufycd@pengutronix.de>
 <YNKKkEMD4sVhfcNr@yoga>
 <20210623082915.tj7pid46wm3dl5jf@pengutronix.de>
 <YNO+8O679/BVNR9K@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5rnubh7dcsdtzvrf"
Content-Disposition: inline
In-Reply-To: <YNO+8O679/BVNR9K@yoga>
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, kernel@pengutronix.de,
 Lee Jones <lee.jones@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5rnubh7dcsdtzvrf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Wed, Jun 23, 2021 at 06:08:32PM -0500, Bjorn Andersson wrote:
> On Wed 23 Jun 03:29 CDT 2021, Uwe Kleine-K?nig wrote:
> > On Tue, Jun 22, 2021 at 08:12:48PM -0500, Bjorn Andersson wrote:
> > > On Tue 22 Jun 15:29 CDT 2021, Uwe Kleine-K?nig wrote:
> > > > On Mon, Jun 21, 2021 at 10:09:48PM -0500, Bjorn Andersson wrote:
> > > > > +		/*
> > > > > +		 * PWM duty cycle is given as:
> > > > > +		 *
> > > > > +		 *   duty =3D BACKLIGHT / (BACKLIGHT_SCALE + 1)
> > > > > +		 *
> > > > > +		 * The documentation is however inconsistent in its examples,
> > > > > +		 * so the interpretation used here is that the duty cycle is
> > > > > +		 * the period of BACKLIGHT * PRE_DIV / REFCLK_FREQ.
> > > >=20
> > > > I don't understand this.
> > > >=20
> > > > > +		 *
> > > > > +		 * The ratio PRE_DIV / REFCLK_FREQ is rounded up to whole
> > > > > +		 * nanoseconds in order to ensure that the calculations are
> > > > > +		 * idempotent and gives results that are smaller than the
> > > > > +		 * requested value.
> > > > > +		 */
> > > > > +		tick =3D DIV_ROUND_UP(NSEC_PER_SEC * pre_div, pdata->pwm_refcl=
k_freq);
> > > > > +		backlight =3D state->duty_cycle / tick;
> > > >=20
> > > > You're loosing precision here by dividing by the result of a divisi=
on.
> > >=20
> > > The actual period is also a result of a division and after spending t=
oo
> > > many hours scratching my head I reached to conclusion that this was t=
he
> > > reason why I wasn't able to get the duty cycle calculation idempotent
> > > over the ranges I tested.
> >=20
> > How did you test? Using the sysfs interface?
> > =20
>=20
> I primarily tested this by transplanting this into a user space thing
> where I could sweep over various values for refclk, duty cycle and
> period.

Is this something that is worth sharing as it has some use for others,
too? How do you change the refclk from userspace? How do you interface
the PWM? (Note that if you use /sys/class/pwm your updates are not
atomic.)

> Then after that I tested it setting up pwm-backlight on top (as I don't
> have access to the signal anyways) and try a few different periods and
> for those test all possible brightness levels for those periods... (With
> CONFIG_PWM_DEBUG enabled)
>=20
> > > But in my effort to describe this to you here, I finally spotted the
> > > error and will follow up with a new version that does:
> > >=20
> > >                 actual =3D NSEC_PER_SEC * (pre_div * scale + 1) / pda=
ta->pwm_refclk_freq);
> > >                 backlight =3D state->duty_cycle * (scale + 1) / actua=
l;
> >=20
> > So the first term ("actual") is the period that you get for a given
> > pre_div, scale and pwm_refclk_freq, right? And the 2nd ("backlight")
> > defines the register value to configure the duty_cycle, right?
> >=20
>=20
> Right, pre_div and pwm_refclk_freq defines the rate at which the PWM
> ticks. "actual" is our estimate of the actual period that results in and
> "backlight" is then the number of ticks (each prediv / refclk seconds
> long) the signal should be high.
>=20
> > I wonder: Is it possible to configure a 100% relative duty cycle? Then
> > backlight would be scale + 1 which (at least if scale is 0xffff) would
> > overflow the 16 bit register width?!
> >=20
>=20
> The documentation gives two examples:
> * backlight =3D 0x40, scale =3D 0xff results in 25% duty cycle, i.e. the
>   duty is 0x40 / (0xff + 1).
> * backlight =3D 0xff, scale =3D 0xff results in 100% duty cycle, i.e. the
>   duty is 0xff / 0xff.
>=20
> As you can see these are in  conflict and I think the latter is the one
> that doesn't match the rest of what's described.

Please document that, preferably with the wording "The hardware cannot
generate a 100% duty cycle." to match what pwm-sifive already has.
=20
> So I don't think it's possible to go beyond 99.6% - 99.998% duty cycle,
> depending on BACKLIGHT_SCALE.
>=20
> > > > > +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pw=
m_device *pwm,
> > > > > +				struct pwm_state *state)
> > > > > +{
> > > > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > > > +	unsigned int pwm_en_inv;
> > > > > +	unsigned int pre_div;
> > > > > +	u16 backlight;
> > > > > +	u16 scale;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_i=
nv);
> > > > > +	if (ret)
> > > > > +		return;
> > > > > +
> > > > > +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &s=
cale);
> > > > > +	if (ret)
> > > > > +		return;
> > > > > +
> > > > > +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlig=
ht);
> > > > > +	if (ret)
> > > > > +		return;
> > > > > +
> > > > > +	ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div=
);
> > > > > +	if (ret)
> > > > > +		return;
> > > > > +
> > > > > +	state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> > > > > +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> > > > > +		state->polarity =3D PWM_POLARITY_INVERSED;
> > > > > +	else
> > > > > +		state->polarity =3D PWM_POLARITY_NORMAL;
> > > > > +
> > > > > +	state->period =3D DIV_ROUND_UP(NSEC_PER_SEC * (pre_div * scale =
+ 1), pdata->pwm_refclk_freq);
> > > > > +	state->duty_cycle =3D backlight * DIV_ROUND_UP(NSEC_PER_SEC * p=
re_div, pdata->pwm_refclk_freq);
> > > >=20
> > > > If you use
> > > >=20
> > > > 	state->duty_cycle =3D DIV_ROUND_UP(backlight * NSEC_PER_SEC * pre_=
div, pdata->pwm_refclk_freq);
> > > >=20
> > > > instead (with a cast to u64 to not yield an overflow) the result is=
 more
> > > > exact.
> > > >=20
> > >=20
> > > The problem with this is that it sometimes yields duty_cycles larger
> > > than what was requested... But going back to describing this as a rat=
io
> > > of the period this becomes:
> > >=20
> > >         state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period * backli=
ght, scale + 1);
> >=20
> > I saw your next iteration of this patch set, but didn't look into it
> > yet. Note that if it uses this formula it sill looses precision.
> > Consider:
> >=20
> > 	pwm_refclk_freq =3D 1333333
> > 	pre_div =3D 4
> > 	scale =3D 60000
> > 	backlight =3D 59999
> >=20
> > then you calculate:
> >=20
> > 	state->period =3D 180000796 (exact value: 180000795.00019875)
> > 	state->duty_cycle =3D 179994797 (exact value: 179994795.0736975)
> >=20
> > so duty_cycle should actually be reported as 179994796. That happens
> > because state->period is already the result of a division, you get the
> > right value when doing:
> >=20
> > 	state->duty_cycle =3D round_up(NSEC_PER_SEC * (pre_div * scale + 2) * =
backlight, (scale + 1) * pdata->pwm_refclk_freq)
>=20
> The problem (in addition to that being hideous) with that added
> precision is that if I plug in that duty_cycle and period with
> pwm_refclk_freq =3D 19200000 (one of the valid ones) the function is no
> longer idempotent.
>=20
> With period given as 180000796 i get 179998542 back as actual period,
> but the duty cycle becomes 3186264 and if I throw that in I get 3185473.

I'm not sure if you're in need for some more mathematical assistance
here?! Independant of how complicate the calculation is, it should be
possible to make this idempotent. With the stuff you write below I think
everything is fine now, right?

> > > > I still find this surprising, I'd expect that SCALE also matters fo=
r the
> > > > duty_cycle. With the assumption implemented here modifying SCALE on=
ly
> > > > affects the period. This should be easy to verify?! I would expect =
that
> > > > changing SCALE doesn't affect the relative duty_cycle, so the brigh=
tness
> > > > of an LED is unaffected (unless the period gets too big of course).
> > > >=20
> > >=20
> > > I think the hardware is two nested counters, one (A) ticking at REFCL=
K_FREQ
> > > and as that hits PRE_DIV, it kicks the second counter (B) (and resets=
).
> > >=20
> > > As counter A is reset the output signal goes high, when A hits BACKLI=
GHT the
> > > signal goes low and when A hits BACKLIGHT_SCALE it resets.
> >=20
> > then we would probably have:
> >=20
> > 	period =3D (scale + 1) * pre_div / refclk
> >=20
> > but not
> >=20
> > 	period =3D (scale * pre_div + 1) / refclk
> >=20
> > . The former would be nicer because then in the calculation for
> > duty_cycle the factor (scale + 1) would cancel.
> >=20
>=20
> Not only does scale + 1 cancel, there's something entity that actually
> divides the (BACKLIGHT_SCALE + 1) in the denominator of the duty cycle
> ratio.
>=20
> > > Per this implementation the actual length of the duty cycle would ind=
eed
> > > be independent of the BACKLIGHT_SCALE,
> >=20
> > In your formula for duty_cycle scale actually does matter. So I think
> > we're not there yet?
> >=20
>=20
> Right, the relationship between pre_div, backlight and duty_cycle should
> be independent of period. I think is misinterpreted what you said
> yesterday, and thought you where looking for there to be a relationship.
>=20
>=20
> So, if we decide that we have a typo in the datasheet and make the
> formula:
>=20
>           NSEC_PER_SEC * PRE_DIV * (BACKLIGHT_SCALE + 1)
> period =3D -----------------------------------------------
>                         REFCLK_FREQ
>=20
> then given the formula for the duty ratio:
>=20
>   duty           BACKLIGHT
> -------- =3D ---------------------
>  period     BACKLIGHT_SCALE + 1
>=20
> with NSEC_PER_SEC * PRE_DIV / REFCLK_FREQ cancelled out, this fits
> better together and we can deduce that:
>=20
>               NSEC_PER_SEC * PRE_DIV * BACKLIGHT
> duty_cycle =3D ------------------------------------
>                         REFCLK_FREQ
>=20
> So after adjusting the calculations for pre_div and scale I can
> calculate backlight, without first calculating the actual period using:
>=20
>              duty_cycle * REFCLK_FREQ
> BACKLIGHT =3D --------------------------
>               NSEC_PER_SEC * PRE_DIV
>=20
> Which I now assume is what you where trying to say but I misunderstood
> the other day?

I expected something similar because I didn't see why a hardware
engineer should make the hardware so complicated to implement the logic
needed to match your driver maths.

> PS. With refclk 19200000 and period 180000796 this satisfies the
> PWM_DEBUG requirements for all possible duty_cycles.

\o/

I'll mark your v4 in patchwork as "changes requested" and look forward
to your v5 now.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5rnubh7dcsdtzvrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDULiEACgkQwfwUeK3K
7Am9NggAgiso23QHA19hAwPuo8aB/f6fDP9E6OY0UNyHBPwje/siizB8a+ZmWdL+
Rn2eiYb9t+xVUTKWf0871mwQG2pslMVXq1RZQU/y8EboViHeXo5J4FAU2QUob/dd
tJF/Rqb6M5UL6ZCzh8hzSxwB3mdkvBECCfwmdUxhC8jgiutDXvL7iOBj0lJ62RlB
ePdx32rPhiiXyCBkF1hEHfiy5y0F87ovyNc7+GAXcns6p1FMCj3QzmYBldZ8DrRw
rSAtIzyfSHnbrIw1do3pB03Q+JPzcx+d0GdvuuEqQSpW9IEAiEMAwVR1WTlFTUqH
WqfIb1sMrmWI8G2bQ3viV+ur0JbbfA==
=4whj
-----END PGP SIGNATURE-----

--5rnubh7dcsdtzvrf--
