Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781D4391A1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2FD898C0;
	Mon, 25 Oct 2021 08:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1301898C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 08:43:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevZG-0001S4-Co; Mon, 25 Oct 2021 10:42:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevZC-00028D-VP; Mon, 25 Oct 2021 10:42:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevZC-0007Y0-Th; Mon, 25 Oct 2021 10:42:50 +0200
Date: Mon, 25 Oct 2021 10:42:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20211025084250.pkd5s4zdmevjjl7m@pengutronix.de>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cuexqcw75bfvdr5f"
Content-Disposition: inline
In-Reply-To: <20210930030557.1426-3-bjorn.andersson@linaro.org>
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


--cuexqcw75bfvdr5f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[replaced Andrzej Hajda's email address with his new one]

On Wed, Sep 29, 2021 at 10:05:57PM -0500, Bjorn Andersson wrote:
> The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> with the primary purpose of controlling the backlight of the attached
> panel. Add an implementation that exposes this using the standard PWM
> framework, to allow e.g. pwm-backlight to expose this to the user.

Sorry for the long delay in reviewing this.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v5:
> - Make ti_sn65dsi86_read_u16() use regmap_bulk_read()
> - Update the wording related to the formula for the period being wrong to=
 not
>   just say I'm "assuming because it's easier".
> - Updated comment related to minimum period
> - Clamp duty <=3D period in get_state()
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 366 +++++++++++++++++++++++++-
>  1 file changed, 360 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 412fb6f564ea..ccf6496cc9ff 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -4,7 +4,9 @@
>   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
>   */
> =20
> +#include <linux/atomic.h>
>  #include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
> @@ -15,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwm.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> =20
> @@ -91,6 +94,13 @@
>  #define SN_ML_TX_MODE_REG			0x96
>  #define  ML_TX_MAIN_LINK_OFF			0
>  #define  ML_TX_NORMAL_MODE			BIT(0)
> +#define SN_PWM_PRE_DIV_REG			0xA0
> +#define SN_BACKLIGHT_SCALE_REG			0xA1
> +#define  BACKLIGHT_SCALE_MAX			0xFFFF
> +#define SN_BACKLIGHT_REG			0xA3
> +#define SN_PWM_EN_INV_REG			0xA5
> +#define  SN_PWM_INV_MASK			BIT(0)
> +#define  SN_PWM_EN_MASK				BIT(1)
>  #define SN_AUX_CMD_STATUS_REG			0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> @@ -113,11 +123,14 @@
> =20
>  #define SN_LINK_TRAINING_TRIES		10
> =20
> +#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
> +
>  /**
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionalit=
y.
>   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
>   * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
> + * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
>   *
>   * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
> @@ -145,11 +158,17 @@
>   *                bitmap so we can do atomic ops on it without an extra
>   *                lock so concurrent users of our 4 GPIOs don't stomp on
>   *                each other's read-modify-write.
> + *
> + * @pchip:        pwm_chip if the PWM is exposed.
> + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> + * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
> + * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
>   */
>  struct ti_sn65dsi86 {
>  	struct auxiliary_device		bridge_aux;
>  	struct auxiliary_device		gpio_aux;
>  	struct auxiliary_device		aux_aux;
> +	struct auxiliary_device		pwm_aux;
> =20
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -172,6 +191,12 @@ struct ti_sn65dsi86 {
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +#if defined(CONFIG_PWM)
> +	struct pwm_chip			pchip;
> +	bool				pwm_enabled;
> +	atomic_t			pwm_pin_busy;
> +#endif
> +	unsigned int			pwm_refclk_freq;
>  };
> =20
>  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] =3D {
> @@ -190,6 +215,21 @@ static const struct regmap_config ti_sn65dsi86_regma=
p_config =3D {
>  	.cache_type =3D REGCACHE_NONE,
>  };
> =20
> +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> +				 unsigned int reg, u16 *val)
> +{
> +	u8 buf[2];
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> +	if (ret)
> +		return ret;
> +
> +	*val =3D buf[0] | (buf[1] << 8);
> +
> +	return 0;
> +}
> +
>  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  				   unsigned int reg, u16 val)
>  {
> @@ -254,6 +294,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_s=
n65dsi86 *pdata)
> =20
>  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
>  			   REFCLK_FREQ(i));
> +
> +	/*
> +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> +	 * regardless of its actual sourcing.
> +	 */
> +	pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
>  }
> =20
>  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> @@ -1260,9 +1306,289 @@ static struct auxiliary_driver ti_sn_bridge_drive=
r =3D {
>  };
> =20
>  /* ---------------------------------------------------------------------=
--------
> - * GPIO Controller
> + * PWM Controller
>   */
> +#if defined(CONFIG_PWM)
> +static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
> +{
> +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> +}
> +
> +static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
> +{
> +	atomic_set(&pdata->pwm_pin_busy, 0);
> +}
> +
> +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *ch=
ip)
> +{
> +	return container_of(chip, struct ti_sn65dsi86, pchip);
> +}
> +
> +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> =20
> +	return ti_sn_pwm_pin_request(pdata);
> +}
> +
> +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +
> +	ti_sn_pwm_pin_release(pdata);
> +}
> +
> +/*
> + * Limitations:
> + * - The PWM signal is not driven when the chip is powered down, or in i=
ts
> + *   reset state and the driver does not implement the "suspend state"
> + *   described in the documentation. In order to save power, state->enab=
led is
> + *   interpreted as denoting if the signal is expected to be valid, and =
is used
> + *   to determine if the chip needs to be kept powered.
> + * - Changing both period and duty_cycle is not done atomically, neither=
 is the
> + *   multi-byte register updates, so the output might briefly be undefin=
ed
> + *   during update.
> + */
> +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int backlight;
> +	unsigned int pre_div;
> +	unsigned int scale;
> +	u64 period_max;
> +	u64 period;
> +	int ret;
> +
> +	if (!pdata->pwm_enabled) {
> +		ret =3D pm_runtime_get_sync(pdata->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_sync(pdata->dev);
> +			return ret;
> +		}
> +	}
> +
> +	if (state->enabled) {
> +		if (!pdata->pwm_enabled) {
> +			/*
> +			 * The chip might have been powered down while we
> +			 * didn't hold a PM runtime reference, so mux in the
> +			 * PWM function on the GPIO pin again.
> +			 */
> +			ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> +						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> +			if (ret) {
> +				dev_err(pdata->dev, "failed to mux in PWM function\n");
> +				goto out;
> +			}
> +		}
> +
> +		/*
> +		 * Per the datasheet the PWM frequency is given by:
> +		 *
> +		 *                          REFCLK_FREQ
> +		 *   PWM_FREQ =3D -----------------------------------
> +		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> +		 *
> +		 * However, after careful review the author is convinced that
> +		 * the documentation has lost some parenthesis around
> +		 * "BACKLIGHT_SCALE + 1".
> +		 * With that the formula can be written:
> +		 *
> +		 *   T_pwm * REFCLK_FREQ =3D PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)

For my understanding: T_pwm =3D period length =3D 1 / PWM_FREQ, right? Maybe
it's a good idea to state this more explicitly?

> +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> +		 * PWM_PRE_DIV must be:
> +		 *
> +		 *                     T_pwm * REFCLK_FREQ
> +		 *   PWM_PRE_DIV >=3D -------------------------
> +		 *                   BACKLIGHT_SCALE_MAX + 1
> +		 *
> +		 * To simplify the search and to favour higher resolution of
> +		 * the duty cycle over accuracy of the period, the lowest
> +		 * possible PWM_PRE_DIV is used. Finally the scale is
> +		 * calculated as:
> +		 *
> +		 *                      T_pwm * REFCLK_FREQ
> +		 *   BACKLIGHT_SCALE =3D ---------------------- - 1
> +		 *                          PWM_PRE_DIV
> +		 *
> +		 * Here T_pwm is represented in seconds, so appropriate scaling
> +		 * to nanoseconds is necessary.
> +		 */
> +
> +		/* Minimum T_pwm is 1 / REFCLK_FREQ */
> +		if (state->period <=3D NSEC_PER_SEC / pdata->pwm_refclk_freq) {
> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> +		 * Limit period to this to avoid overflows
> +		 */
> +		period_max =3D div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1),
> +				     pdata->pwm_refclk_freq);
> +		if (period > period_max)

period is uninitialized here. This must be

		if (state->period > period_max)

=2E Alternatively to the if you could use

		period =3D min(state->period, period_max);


Apart from this I'm happy with your patch set now.

> +			period =3D period_max;
> +		else
> +			period =3D state->period;
> +
> +		pre_div =3D DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> +		scale =3D div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC=
 * pre_div) - 1;

After thinking a while about this---I think I stumbled about this
calculation already in earlier revisions of this patch set---I think I
now understood it. I never saw something like this before because other
drivers with similar HW conditions would pick:

	pre_div =3D div64_u64(period * pdata->pwm_refclk_freq,
			    (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));

and then scale =3D BACKLIGHT_SCALE_MAX. This latter approach weights high
resolution of duty_cycle still higher over period exactness than your
approach. For me both approaches are fine.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cuexqcw75bfvdr5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmF2bgYACgkQwfwUeK3K
7AlbLQf/dX7AFhR4SnjkB5ypnLpUDz3ofrD8uilpwTivEN2u1nY3Er7vtUzJJ43m
EXBzk6PsLNTcs7032S7vPO1DVqHnWDHUhzaij4ePftrbPG7RQGOH85UBm67nJHj6
VM9fKpSO5k3mSMurhLKf3hhNyz6Qr6OyyYJMFzIrGBWvuaD8wPww6CyYImD+NRJS
t5uXV8Q/IWCWm9FDoOBGZoW/YoUHMpDydpwfHXDpUEZugqhduPb1346W5kWxQknW
84xyN9gFq+CSZQjnDj1yDgUnvsNOQe5np86zZgHTsSX9kTKgLXEY8UIbd9aIKcLC
R0ARA5/b96lOA7iorCZq1455FU2QTg==
=9lPG
-----END PGP SIGNATURE-----

--cuexqcw75bfvdr5f--
