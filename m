Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17F417D6F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 00:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BC6EE8E;
	Fri, 24 Sep 2021 22:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA03E6EE90
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 22:04:44 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u22so16435298oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XBLqgfVNdsrWmIwa9/gDDxqQEr3G/K1n0rpQlHMzRQo=;
 b=W6EjcgPb7WfYfZG4mD09oDjaFuGLOgheGj1J1XDv7NDnwR97Enu93wSb6MDZZA/pfC
 VXqieEGcpQiz3AEnYZD/rWEcJuuFI7C/Lo2gDksv16Cnez7CLYHk9x9hYkkSiWaGwvwz
 xb4A+bhwS/Q0eS0Z1Jht58xla8E1vpl2SZhxH8XWzkIQ/IqNb6G0Hk1pTbvM7ApTEDQ1
 w1/tnNjnZHXfDBjyPfPyVreTuBs7y94f1+2SOmDMrRSgdE7wIBnxELC/ebudBDLfCfIA
 vujexrT4JrymMzjD4xpoAcI8cmLhOlq3cAaT21q4z//hU04HsA8vw8W5D65rCNLEEHEW
 AtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XBLqgfVNdsrWmIwa9/gDDxqQEr3G/K1n0rpQlHMzRQo=;
 b=nZ9PgBKAoB9yroJkhG4cc+ScJjWO2IkpXj+4OfCPirbsgret5D8Er3WqJQGtg9gsT7
 A7kPXmO/f0/msgZBjYp2f0V5ABIWOkehT632GlO9G4R2tQ4nLrpJhbXPpR9Lva5RsPe5
 Fn1oy40qz5FV5QWEcHkLWYNqEV5LIu9H7Q4HDfXjiyXLO/buGXpAtQMkoliLRI/ClWgG
 hQBVZrunhyYjvzKqPpBOAxARkMDrvJNH90DW36ca82f1vhIzfl3YrEmlQ+HnrDHVcohv
 I6DdVxmMCJezGm8rjgMLVWlm41/J4wOKRqZ93WYqqCnMX/bkKy9umhsHePW34XnRTywI
 RZAg==
X-Gm-Message-State: AOAM533vpTZK3E1Vc0ys7XTBA/uwhYbduZRc0DGLEZEeDtJKPC9uV5o5
 qOnuJJnfuvsutEc2uvvsE8IY7A==
X-Google-Smtp-Source: ABdhPJz8yTPoleILefGTZF0pMerrD/z4exdfQ8M5rfhJSR6PPdy1uE1N3AEpLZrHiZE6YQbSC+0Htg==
X-Received: by 2002:a05:6808:2128:: with SMTP id
 r40mr3326332oiw.24.1632521083920; 
 Fri, 24 Sep 2021 15:04:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k6sm2342629otf.80.2021.09.24.15.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 15:04:43 -0700 (PDT)
Date: Fri, 24 Sep 2021 17:04:41 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
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
Message-ID: <YU5LeQlSANlt1/jk@builder.lan>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
 <20210924021225.846197-2-bjorn.andersson@linaro.org>
 <20210924075433.apkdkwur5ar67ge2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924075433.apkdkwur5ar67ge2@pengutronix.de>
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

On Fri 24 Sep 02:54 CDT 2021, Uwe Kleine-K?nig wrote:

> Hello,
> 
> On Thu, Sep 23, 2021 at 09:12:25PM -0500, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v4:
> > - Rebased the patch
> > - Turned ti_sn65dsi86_write_u16 into using regmap bulk write
> > - Moved pwm_refclk_freq out of the #if CONFIG_PWM, to allow removing the guard
> >   from ti_sn_bridge_set_refclk_freq()
> > - Updates "Limitations" text
> > - pm_runtime_put_sync() on pm_runtime_get_sync() failure
> > - Added parenthesis around (scale + 1) in the PWM_FREQ formula and thereby
> >   redid all the math
> > - Rewrote the comments related to the math
> > - Rewrote the math for calculating the backlight (duty cycle) register value
> > - Dropped some !! on already boolean state->enabled
> > - Dropped a spurious newline
> > - Rewrote comment in ti_sn65dsi86_probe() talking about future PWM work
> > 
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 369 +++++++++++++++++++++++++-
> >  1 file changed, 361 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 41d48a393e7f..857a53dc6c75 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -4,7 +4,9 @@
> >   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
> >   */
> >  
> > +#include <linux/atomic.h>
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/clk.h>
> >  #include <linux/debugfs.h>
> > @@ -15,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > @@ -91,6 +94,13 @@
> >  #define SN_ML_TX_MODE_REG			0x96
> >  #define  ML_TX_MAIN_LINK_OFF			0
> >  #define  ML_TX_NORMAL_MODE			BIT(0)
> > +#define SN_PWM_PRE_DIV_REG			0xA0
> > +#define SN_BACKLIGHT_SCALE_REG			0xA1
> > +#define  BACKLIGHT_SCALE_MAX			0xFFFF
> > +#define SN_BACKLIGHT_REG			0xA3
> > +#define SN_PWM_EN_INV_REG			0xA5
> > +#define  SN_PWM_INV_MASK			BIT(0)
> > +#define  SN_PWM_EN_MASK				BIT(1)
> >  #define SN_AUX_CMD_STATUS_REG			0xF4
> >  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
> >  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> > @@ -113,11 +123,14 @@
> >  
> >  #define SN_LINK_TRAINING_TRIES		10
> >  
> > +#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
> > +
> >  /**
> >   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
> >   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
> >   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
> >   * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
> > + * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
> >   *
> >   * @dev:          Pointer to the top level (i2c) device.
> >   * @regmap:       Regmap for accessing i2c.
> > @@ -145,11 +158,17 @@
> >   *                bitmap so we can do atomic ops on it without an extra
> >   *                lock so concurrent users of our 4 GPIOs don't stomp on
> >   *                each other's read-modify-write.
> > + *
> > + * @pchip:        pwm_chip if the PWM is exposed.
> > + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> > + * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
> > + * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> >   */
> >  struct ti_sn65dsi86 {
> >  	struct auxiliary_device		bridge_aux;
> >  	struct auxiliary_device		gpio_aux;
> >  	struct auxiliary_device		aux_aux;
> > +	struct auxiliary_device		pwm_aux;
> >  
> >  	struct device			*dev;
> >  	struct regmap			*regmap;
> > @@ -172,6 +191,12 @@ struct ti_sn65dsi86 {
> >  	struct gpio_chip		gchip;
> >  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> >  #endif
> > +#if defined(CONFIG_PWM)
> > +	struct pwm_chip			pchip;
> > +	bool				pwm_enabled;
> > +	atomic_t			pwm_pin_busy;
> > +#endif
> > +	unsigned int			pwm_refclk_freq;
> >  };
> >  
> >  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
> > @@ -190,11 +215,31 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
> >  	.cache_type = REGCACHE_NONE,
> >  };
> >  
> > +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> > +				 unsigned int reg, u16 *val)
> > +{
> > +	unsigned int tmp;
> > +	int ret;
> > +
> > +	ret = regmap_read(pdata->regmap, reg, &tmp);
> > +	if (ret)
> > +		return ret;
> > +	*val = tmp;
> > +
> > +	ret = regmap_read(pdata->regmap, reg + 1, &tmp);
> > +	if (ret)
> > +		return ret;
> > +	*val |= tmp << 8;
> > +
> > +	return 0;
> > +}
> > +
> >  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> >  				   unsigned int reg, u16 val)
> >  {
> > -	regmap_write(pdata->regmap, reg, val & 0xFF);
> > -	regmap_write(pdata->regmap, reg + 1, val >> 8);
> > +	u8 buf[2] = { val & 0xff, val >> 8 };
> > +
> > +	regmap_bulk_write(pdata->regmap, reg, &buf, ARRAY_SIZE(buf));
> 
> Given that ti_sn65dsi86_write_u16 uses regmap_bulk_write I wonder why
> ti_sn65dsi86_read_u16 doesn't use regmap_bulk_read.
> 

Seems reasonable to make that use the bulk interface as well and this
would look better in its own patch.

> >  }
> >  
> >  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > @@ -253,6 +298,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
> >  
> >  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> >  			   REFCLK_FREQ(i));
> > +
> > +	/*
> > +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> > +	 * regardless of its actual sourcing.
> > +	 */
> > +	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
> >  }
> >  
> >  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > @@ -1259,9 +1310,283 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
> >  };
> >  
> >  /* -----------------------------------------------------------------------------
> > - * GPIO Controller
> > + * PWM Controller
> > + */
> > +#if defined(CONFIG_PWM)
> > +static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
> > +{
> > +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> > +}
> > +
> > +static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
> > +{
> > +	atomic_set(&pdata->pwm_pin_busy, 0);
> > +}
> > +
> > +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
> > +{
> > +	return container_of(chip, struct ti_sn65dsi86, pchip);
> > +}
> > +
> > +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +
> > +	return ti_sn_pwm_pin_request(pdata);
> > +}
> > +
> > +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +
> > +	ti_sn_pwm_pin_release(pdata);
> > +}
> > +
> > +/*
> > + * Limitations:
> > + * - The PWM signal is not driven when the chip is powered down, or in its
> > + *   reset state and the driver does not implement the "suspend state"
> > + *   described in the documentation. In order to save power, state->enabled is
> > + *   interpreted as denoting if the signal is expected to be valid, and is used
> > + *   to determine if the chip needs to be kept powered.
> > + * - Changing both period and duty_cycle is not done atomically, neither is the
> > + *   multi-byte register updates, so the output might briefly be undefined
> > + *   during update.
> >   */
> > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			   const struct pwm_state *state)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +	unsigned int pwm_en_inv;
> > +	unsigned int backlight;
> > +	unsigned int pre_div;
> > +	unsigned int scale;
> > +	u64 period_max;
> > +	u64 period;
> > +	int ret;
> > +
> > +	if (!pdata->pwm_enabled) {
> > +		ret = pm_runtime_get_sync(pdata->dev);
> > +		if (ret < 0) {
> > +			pm_runtime_put_sync(pdata->dev);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (state->enabled) {
> > +		if (!pdata->pwm_enabled) {
> > +			/*
> > +			 * The chip might have been powered down while we
> > +			 * didn't hold a PM runtime reference, so mux in the
> > +			 * PWM function on the GPIO pin again.
> > +			 */
> > +			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > +						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > +						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > +			if (ret) {
> > +				dev_err(pdata->dev, "failed to mux in PWM function\n");
> > +				goto out;
> > +			}
> > +		}
> > +
> > +		/*
> > +		 * Per the datasheet the PWM frequency is given by:
> > +		 *
> > +		 *                          REFCLK_FREQ
> > +		 *   PWM_FREQ = -----------------------------------
> > +		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> > +		 *
> > +		 * Unfortunately the math becomes overly complex unless we
> > +		 * assume that this formula is missing parenthesis around
> > +		 * BACKLIGHT_SCALE + 1.
> 
> We shouldn't assume a different formula than the reference manual
> describes because it's complex. The reasoning should be that the
> reference manual is wrong and that someone has convinced themselves the
> assumed formula is the right one instead.
> 

Given the effort put in to conclude that there must be some parenthesis
there, I agree that "assume" might be to weak of a word...

> With the assumed formula: What happens if PWM_PRE_DIV is 0?
> 

Looking at the specification again and I don't see anything prohibiting
from writing 0 in the PRE_DIV register, and writing a 0 to the register
causes no visual on my backlight from writing 1.

Per our new understanding this should probably have resulted in a period
of 0. That said, if the formula from the datasheet was correct then we'd
have a period T_pwm (given T_ref as refclk pulse length) of:

  T_pwm = T_ref * (div * scale + 1)

And with div = 0 we'd have:

  T_pwm = T_ref * 1

Which wouldn't give any room for adjusting the duty cycle, and I can
still do that. So that's not correct either.

Unfortunately I still don't want to dismantle my working laptop, so I
don't know if I can do any better than this. Perhaps they do the typical
trick of encoding prediv off-by-1 and the PWM duty is off by a factor
of 2. Perhaps the comparator for the prediv counter trips at 1 even
though the register is configured at 0...

> > +		 * With that the formula can be written:
> > +		 *
> > +		 *   T_pwm * REFCLK_FREQ = PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
> > +		 *
> > +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> > +		 * PWM_PRE_DIV must be:
> > +		 *
> > +		 *                     T_pwm * REFCLK_FREQ
> > +		 *   PWM_PRE_DIV >= -------------------------
> > +		 *                   BACKLIGHT_SCALE_MAX + 1
> > +		 *
> > +		 * To simplify the search and optimize the resolution of the
> > +		 * PWM, the lowest possible PWM_PRE_DIV is used. Finally the
> > +		 * scale is calculated as:
> > +		 *
> > +		 *                      T_pwm * REFCLK_FREQ
> > +		 *   BACKLIGHT_SCALE = ---------------------- - 1
> > +		 *                          PWM_PRE_DIV
> > +		 *
> > +		 * Here T_pwm is represented in seconds, so appropriate scaling
> > +		 * to nanoseconds is necessary.
> > +		 */
> > +
> > +		/* Minimum T_pwm is (0 * 1) / REFCLK_FREQ */
> 
> So the minimal T_pwm (which corresponds to .period, right?) is 0? That
> sounds wrong.
> 

Yes, that seems more likely.

> > +		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
> 
> The implemented check assumes 1 / REFCLK_FREQ, which looks more reasonable.
> 

I agree.

> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		/*
> > +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> > +		 * Limit period to this to avoid overflows
> > +		 */
> > +		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1), pdata->pwm_refclk_freq);
> > +		if (period > period_max)
> > +			period = period_max;
> > +		else
> > +			period = state->period;
> > +
> > +		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> > +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> > +		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
> 
> You're loosing precision here as you divide by the result of a division.
> 

As described above, I'm trying to find suitable values for PRE_DIV and
BACKLIGHT_SCALE in:

  T_pwm * refclk_freq
 --------------------- = PRE_DIV * (BACKLIGHT_SCALE + 1)
     NSEC_PER_SEC

BACKLIGHT_SCALE must fit in 16 bits and in order to be useful for
driving the backlight control be large enough that the resolution
(BACKLIGTH = [0..BACKLIGHT_SCALE]) covers whatever resolution
pwm-backlight might expose.

For the intended use case this seems pretty good, but I presume you
could pick better values to get closer to the requested period.

Do you have a better suggestion for how to pick PRE_DIV and
BACKLIGHT_SCALE?

> > +
> > +		/*
> > +		 * The documentation has the duty ratio given as:
> > +		 *
> > +		 *     duty          BACKLIGHT
> > +		 *   ------- = ---------------------
> > +		 *    period    BACKLIGHT_SCALE + 1
> > +		 *
> > +		 * Solve for BACKLIGHT, substituting BACKLIGHT_SCALE according
> > +		 * to definition above and adjusting for nanosecond
> > +		 * representation of duty cycle gives us:
> > +		 */
> > +		backlight = div64_u64(state->duty_cycle * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div);
> > +		if (backlight > scale)
> > +			backlight = scale;
> > +
> > +		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> > +			goto out;
> > +		}
> >  
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
> > +	}
> > +
> > +	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
> > +		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
> > +	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
> > +	if (ret) {
> > +		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
> > +		goto out;
> > +	}
> > +
> > +	pdata->pwm_enabled = state->enabled;
> > +out:
> > +
> > +	if (!pdata->pwm_enabled)
> > +		pm_runtime_put_sync(pdata->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> > +				struct pwm_state *state)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +	unsigned int pwm_en_inv;
> > +	unsigned int pre_div;
> > +	u16 backlight;
> > +	u16 scale;
> > +	int ret;
> > +
> > +	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> > +	if (ret)
> > +		return;
> > +
> > +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> > +	if (ret)
> > +		return;
> > +
> > +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> > +	if (ret)
> > +		return;
> > +
> > +	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> > +	if (ret)
> > +		return;
> > +
> > +	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> > +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> > +		state->polarity = PWM_POLARITY_INVERSED;
> > +	else
> > +		state->polarity = PWM_POLARITY_NORMAL;
> > +
> > +	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
> > +					 pdata->pwm_refclk_freq);
> > +	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
> > +					     pdata->pwm_refclk_freq);
> 
> What happens if scale + 1 < backlight?
> 

When we write the backlight register above, we cap it at scale, so for
the typical case that shouldn't happen.

So I guess the one case when this could happen is if we get_state()
before pwm_apply(), when someone else has written broken values
(reset values are scale = 0xff and backlight = 0)

Thanks,
Bjorn
