Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1EE4184A5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 23:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29C6E466;
	Sat, 25 Sep 2021 21:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B076E466
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 21:25:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUFAm-0007ap-Em; Sat, 25 Sep 2021 23:25:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUFAf-0004lr-89; Sat, 25 Sep 2021 23:25:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mUFAf-0007ik-6c; Sat, 25 Sep 2021 23:25:21 +0200
Date: Sat, 25 Sep 2021 23:25:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210925212521.vwtyaqwstyssn5ne@pengutronix.de>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
 <20210924021225.846197-2-bjorn.andersson@linaro.org>
 <20210924075433.apkdkwur5ar67ge2@pengutronix.de>
 <YU5LeQlSANlt1/jk@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7p5usejj7bxwzsag"
Content-Disposition: inline
In-Reply-To: <YU5LeQlSANlt1/jk@builder.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7p5usejj7bxwzsag
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Fri, Sep 24, 2021 at 05:04:41PM -0500, Bjorn Andersson wrote:
> On Fri 24 Sep 02:54 CDT 2021, Uwe Kleine-K?nig wrote:
> > > +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> > > +				 unsigned int reg, u16 *val)
> > > +{
> > > +	unsigned int tmp;
> > > +	int ret;
> > > +
> > > +	ret =3D regmap_read(pdata->regmap, reg, &tmp);
> > > +	if (ret)
> > > +		return ret;
> > > +	*val =3D tmp;
> > > +
> > > +	ret =3D regmap_read(pdata->regmap, reg + 1, &tmp);
> > > +	if (ret)
> > > +		return ret;
> > > +	*val |=3D tmp << 8;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> > >  				   unsigned int reg, u16 val)
> > >  {
> > > -	regmap_write(pdata->regmap, reg, val & 0xFF);
> > > -	regmap_write(pdata->regmap, reg + 1, val >> 8);
> > > +	u8 buf[2] =3D { val & 0xff, val >> 8 };
> > > +
> > > +	regmap_bulk_write(pdata->regmap, reg, &buf, ARRAY_SIZE(buf));
> >=20
> > Given that ti_sn65dsi86_write_u16 uses regmap_bulk_write I wonder why
> > ti_sn65dsi86_read_u16 doesn't use regmap_bulk_read.
>=20
> Seems reasonable to make that use the bulk interface as well and this
> would look better in its own patch.

Not sure I understand you here. My position here would be to introduce
these two functions with a consistent behaviour. If both use bulk or
both don't use it (and you introduce it later in a separate patch)
doesn't matter to me.

> > >  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > @@ -253,6 +298,12 @@ static void ti_sn_bridge_set_refclk_freq(struct =
ti_sn65dsi86 *pdata)
> > > =20
> > >  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MAS=
K,
> > >  			   REFCLK_FREQ(i));
> > > +
> > > +	/*
> > > +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> > > +	 * regardless of its actual sourcing.
> > > +	 */
> > > +	pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
> > >  }
> > > =20
> > >  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > > @@ -1259,9 +1310,283 @@ static struct auxiliary_driver ti_sn_bridge_d=
river =3D {
> > >  };
> > > =20
> > >  /* -----------------------------------------------------------------=
------------
> > > - * GPIO Controller
> > > + * PWM Controller
> > > + */
> > > +#if defined(CONFIG_PWM)
> > > +static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
> > > +{
> > > +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> > > +}
> > > +
> > > +static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
> > > +{
> > > +	atomic_set(&pdata->pwm_pin_busy, 0);
> > > +}
> > > +
> > > +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip=
 *chip)
> > > +{
> > > +	return container_of(chip, struct ti_sn65dsi86, pchip);
> > > +}
> > > +
> > > +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_devic=
e *pwm)
> > > +{
> > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > +
> > > +	return ti_sn_pwm_pin_request(pdata);
> > > +}
> > > +
> > > +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device =
*pwm)
> > > +{
> > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > +
> > > +	ti_sn_pwm_pin_release(pdata);
> > > +}
> > > +
> > > +/*
> > > + * Limitations:
> > > + * - The PWM signal is not driven when the chip is powered down, or =
in its
> > > + *   reset state and the driver does not implement the "suspend stat=
e"
> > > + *   described in the documentation. In order to save power, state->=
enabled is
> > > + *   interpreted as denoting if the signal is expected to be valid, =
and is used
> > > + *   to determine if the chip needs to be kept powered.
> > > + * - Changing both period and duty_cycle is not done atomically, nei=
ther is the
> > > + *   multi-byte register updates, so the output might briefly be und=
efined
> > > + *   during update.
> > >   */
> > > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device =
*pwm,
> > > +			   const struct pwm_state *state)
> > > +{
> > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > +	unsigned int pwm_en_inv;
> > > +	unsigned int backlight;
> > > +	unsigned int pre_div;
> > > +	unsigned int scale;
> > > +	u64 period_max;
> > > +	u64 period;
> > > +	int ret;
> > > +
> > > +	if (!pdata->pwm_enabled) {
> > > +		ret =3D pm_runtime_get_sync(pdata->dev);
> > > +		if (ret < 0) {
> > > +			pm_runtime_put_sync(pdata->dev);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	if (state->enabled) {
> > > +		if (!pdata->pwm_enabled) {
> > > +			/*
> > > +			 * The chip might have been powered down while we
> > > +			 * didn't hold a PM runtime reference, so mux in the
> > > +			 * PWM function on the GPIO pin again.
> > > +			 */
> > > +			ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > > +						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > > +						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > > +			if (ret) {
> > > +				dev_err(pdata->dev, "failed to mux in PWM function\n");
> > > +				goto out;
> > > +			}
> > > +		}
> > > +
> > > +		/*
> > > +		 * Per the datasheet the PWM frequency is given by:
> > > +		 *
> > > +		 *                          REFCLK_FREQ
> > > +		 *   PWM_FREQ =3D -----------------------------------
> > > +		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> > > +		 *
> > > +		 * Unfortunately the math becomes overly complex unless we
> > > +		 * assume that this formula is missing parenthesis around
> > > +		 * BACKLIGHT_SCALE + 1.
> >=20
> > We shouldn't assume a different formula than the reference manual
> > describes because it's complex. The reasoning should be that the
> > reference manual is wrong and that someone has convinced themselves the
> > assumed formula is the right one instead.
>=20
> Given the effort put in to conclude that there must be some parenthesis
> there, I agree that "assume" might be to weak of a word...
>=20
> > With the assumed formula: What happens if PWM_PRE_DIV is 0?
>=20
> Looking at the specification again and I don't see anything prohibiting
> from writing 0 in the PRE_DIV register, and writing a 0 to the register
> causes no visual on my backlight from writing 1.

So the backlight behaves identically for PRE_DIV =3D 0 and PRE_DIV =3D 1 as
far as you can tell?

> Per our new understanding this should probably have resulted in a period
> of 0.

=2E.. but a period of zero doesn't make sense.

> That said, if the formula from the datasheet was correct then we'd
> have a period T_pwm (given T_ref as refclk pulse length) of:
>=20
>   T_pwm =3D T_ref * (div * scale + 1)
>=20
> And with div =3D 0 we'd have:
>=20
>   T_pwm =3D T_ref * 1
>=20
> Which wouldn't give any room for adjusting the duty cycle, and I can
> still do that. So that's not correct either.

I don't see a problem here (just the hardware would be unusual and
complicated and so more expensive than the simple straigt forward way).

One way to find out if

	 PWM_PRE_DIV * BACKLIGHT_SCALE + 1
	-----------------------------------
	            REFCLK_FREQ

or

	 PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
	-------------------------------------
	             REFCLK_FREQ

is the right formula is to program PWM_PRE_DIV=3D1 and BACKLIGHT_SCALE=3D1
and then check if the backlight is fully on with SN_BACKLIGHT_REG=3D2 (or
only with SN_BACKLIGHT_REG=3D3).

> Unfortunately I still don't want to dismantle my working laptop, so I
> don't know if I can do any better than this. Perhaps they do the typical
> trick of encoding prediv off-by-1 and the PWM duty is off by a factor
> of 2. Perhaps the comparator for the prediv counter trips at 1 even
> though the register is configured at 0...

I would guess the latter.

> > > +		/*
> > > +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> > > +		 * Limit period to this to avoid overflows
> > > +		 */
> > > +		period_max =3D div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1), pdat=
a->pwm_refclk_freq);
> > > +		if (period > period_max)
> > > +			period =3D period_max;
> > > +		else
> > > +			period =3D state->period;
> > > +
> > > +		pre_div =3D DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> > > +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> > > +		scale =3D div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER=
_SEC * pre_div) - 1;
> >=20
> > You're loosing precision here as you divide by the result of a division.
>=20
> As described above, I'm trying to find suitable values for PRE_DIV and
> BACKLIGHT_SCALE in:
>=20
>   T_pwm * refclk_freq
>  --------------------- =3D PRE_DIV * (BACKLIGHT_SCALE + 1)
>      NSEC_PER_SEC
>=20
> BACKLIGHT_SCALE must fit in 16 bits and in order to be useful for
> driving the backlight control be large enough that the resolution
> (BACKLIGTH =3D [0..BACKLIGHT_SCALE]) covers whatever resolution
> pwm-backlight might expose.
>=20
> For the intended use case this seems pretty good, but I presume you
> could pick better values to get closer to the requested period.
>=20
> Do you have a better suggestion for how to pick PRE_DIV and
> BACKLIGHT_SCALE?

My motivation is limited to spend brain cycles here if we're not sure
we're using the right formula. Maybe my concern is wrong given that
pre_div isn't only an interim result but an actual register value. I
will have to think about that when I'm not tired.

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
> > > +	state->period =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (s=
cale + 1),
> > > +					 pdata->pwm_refclk_freq);
> > > +	state->duty_cycle =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div =
* backlight,
> > > +					     pdata->pwm_refclk_freq);
> >=20
> > What happens if scale + 1 < backlight?
>=20
> When we write the backlight register above, we cap it at scale, so for
> the typical case that shouldn't happen.

=2Eget_state() is called before the first .apply(), to the values to
interpret here originate from the bootloader which might write strange
settings that the linux driver would never do. So being prudent here is
IMHO a good idea.

It's a shame that .get_state() cannot return an error.

> So I guess the one case when this could happen is if we get_state()
> before pwm_apply(), when someone else has written broken values

ack.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7p5usejj7bxwzsag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFPk7wACgkQwfwUeK3K
7AnEOwf+N/6J54akrF+J3lbKi917BOVkoi83lIKZta93CNzHxr2i5MVWVWm/x/rU
WbXCxPLyuI3bfO+BbcYYo7/lYQlS14Zf9fZg75ZQtXJKZuxHnaKQ4GMY4vLkBqsH
5NsPaKaGiMp841zPNiVPQPvvAorUzNaiHs5tHYjQYVlcAMXEVcCEgnZavmo+IgUH
MAL0GJZxS6sW2o9yevofK0HzvEZBLcUhfVvwtYuRNxjVgL9JKwSjub6AKRgNHPT+
m0rmWiPwqFZai2h+jlNkqAJBpYsiQFFGZjbS1TErH2S4PeMZgjOdORa2cOtG+WrT
rhXjjc5rPdVe6+HActGI/PlIgEOh7A==
=bPuQ
-----END PGP SIGNATURE-----

--7p5usejj7bxwzsag--
