Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444083AA97D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 05:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A166E868;
	Thu, 17 Jun 2021 03:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE26E868
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 03:22:21 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so4753998ott.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3WG8mkC6rO/iKoZqhIViiVewo5aRqVNidfZnDLQJ3CQ=;
 b=lvkY+ySUA+dUePYi1CGg9zzGDeWq4hjyvEDHvsHzNYZJCkGIRlCyeXEdMiK4u7pvCe
 Vtuo0ihp+6+XqX2Z0LEqRRp2pUabSre9NPc9O6Vuf87PixYMYQaQOHXQPoyfTC1mrZOo
 3c7qIBaNzIO0QvhLCmM9Uvm9pmIgMRLaLRyDfsqLmOWaz55hljsc24l3BrKhOeNDXG2+
 ZaaDytNurocZsQpSpvpJODoUjagKhfnkwVgobMpRpt7MWdKTid/1hmV0vDMJj/8xLMtR
 W1RNm+XAz0Rz0kRlf8onErS2hx9fUc2Oe1qq44epgWgHZxFPwcWdvHusYqsna1nNM0Yg
 1pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3WG8mkC6rO/iKoZqhIViiVewo5aRqVNidfZnDLQJ3CQ=;
 b=lRqPSiSWXklxByBkvztoD3rt+JGHmt6WF/5iNA1Ze2TLU/wlKlWWGl4Y4XSEUb1aV8
 9AxZUpAwVmGggIbgrhZF3w1gQLZcz5Mc2hTigxcUQf1fmA9D/3+QoKmU48dCOXBeebzL
 KKSkwnIt4LTx/KGg0OrOArt614iOUp4JZscRvmfahUnIGjqDYhozXSov7pmKFUq4kJ0A
 Vq+/3r22J4ls6qw6RbzeohUtgEuAalTCINhoLIBNWtW0RRp3fvdepqzq2KVg4EUDos1P
 9cORQGIb0aJbUoIlL2EuO5hM+3BBi0944N7zu8do3HrcFfeThWvzObz39lZ4yffq4ZWh
 d1AA==
X-Gm-Message-State: AOAM531u1wsj8jTbapjmVjUgv5c4NSKWFSem/UXWLRGHbqNJDhl07I8v
 reHMr7ROgTKHQcNqGZC57VUGFA==
X-Google-Smtp-Source: ABdhPJy6OpAUFp4RHIfdUmUNZF9QFTaPzZVNX6Yw2DknwVBE/0RerBrX5ii4IvA4xU3MPGLUDIYrdg==
X-Received: by 2002:a9d:4911:: with SMTP id e17mr2767046otf.38.1623900140146; 
 Wed, 16 Jun 2021 20:22:20 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w186sm850939oib.58.2021.06.16.20.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 20:22:19 -0700 (PDT)
Date: Wed, 16 Jun 2021 22:22:17 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <YMq/6VhXrYJoTVnj@yoga>
References: <20210615231828.835164-1-bjorn.andersson@linaro.org>
 <20210615231828.835164-2-bjorn.andersson@linaro.org>
 <20210616075637.jtoa25uyhnqkctlu@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616075637.jtoa25uyhnqkctlu@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 16 Jun 02:56 CDT 2021, Uwe Kleine-K?nig wrote:

> Hello Bjorn,
> 
> On Tue, Jun 15, 2021 at 06:18:28PM -0500, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Rebased ontop of Doug's auxiliary_bus patches
> > - Reworked the math, per Uwe's request
> > - Added pwm_chip->get_state and made sure it's happy (only tested with a few
> >   limited periods, such as 1kHz)
> > 
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 298 +++++++++++++++++++++++++-
> >  1 file changed, 297 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 5d712c8c3c3b..8f11c9b2da48 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -4,6 +4,7 @@
> >   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
> >   */
> >  
> > +#include <linux/atomic.h>
> >  #include <linux/auxiliary_bus.h>
> >  #include <linux/bits.h>
> >  #include <linux/clk.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > @@ -91,6 +93,13 @@
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
> > @@ -113,11 +122,14 @@
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
> > @@ -145,11 +157,17 @@
> >   *                bitmap so we can do atomic ops on it without an extra
> >   *                lock so concurrent users of our 4 GPIOs don't stomp on
> >   *                each other's read-modify-write.
> > + *
> > + * @pchip:        pwm_chip if the PWM is exposed.
> > + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> > + * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> > + * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
> >   */
> >  struct ti_sn65dsi86 {
> >  	struct auxiliary_device		bridge_aux;
> >  	struct auxiliary_device		gpio_aux;
> >  	struct auxiliary_device		aux_aux;
> > +	struct auxiliary_device		pwm_aux;
> >  
> >  	struct device			*dev;
> >  	struct regmap			*regmap;
> > @@ -172,6 +190,12 @@ struct ti_sn65dsi86 {
> >  	struct gpio_chip		gchip;
> >  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> >  #endif
> > +#if defined(CONFIG_PWM)
> > +	struct pwm_chip			pchip;
> > +	bool				pwm_enabled;
> > +	unsigned int			pwm_refclk_freq;
> > +	atomic_t			pwm_pin_busy;
> > +#endif
> >  };
> >  
> >  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
> > @@ -190,6 +214,25 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
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
> > @@ -253,6 +296,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
> >  
> >  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> >  			   REFCLK_FREQ(i));
> > +
> > +#if defined(CONFIG_PWM)
> > +	/*
> > +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> > +	 * regardless of its actual sourcing.
> > +	 */
> > +	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
> > +#endif
> >  }
> >  
> >  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > @@ -1044,6 +1095,221 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
> >  	return 0;
> >  }
> >  
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
> > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			   const struct pwm_state *state)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +	unsigned int pwm_en_inv;
> > +	unsigned int backlight;
> > +	unsigned int pre_div;
> > +	unsigned int scale;
> > +	int ret;
> > +
> > +	if (!pdata->pwm_enabled) {
> > +		ret = pm_runtime_get_sync(pdata->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> > +			goto out;
> > +		}
> 
> Do you need to do this even if state->enabled is false?

I presume I should be able to explicitly mux in the GPIO function and
configure that to output low. But I am not able to find anything in the
data sheet that would indicate this to be preferred.

> Does this already modify the output pin?
> 

Yes, coming out of reset this pin is configured as input, so switching
the mux here will effectively start driving the pin.

> > +	}
> > +
> > +	if (state->enabled) {
> > +		/*
> > +		 * Per the datasheet the PWM frequency is given by:
> > +		 *
> > +		 *   PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> > +		 *
> > +		 * which can be rewritten:
> > +		 *
> > +		 *   T_pwm * REFCLK_FREQ - 1 = PWM_PRE_DIV * BACKLIGHT_SCALE
> > +		 *
> > +		 * In order to keep BACKLIGHT_SCALE within its 16 bits, PWM_PRE_DIV
> > +		 * must be:
> > +		 *
> > +		 *   PWM_PRE_DIV >= (T_pwm * REFCLK_FREQ - 1) / BACKLIGHT_SCALE_MAX;
> > +		 *
> > +		 * To simplify the search and optimize the resolution of the PWM, the
> > +		 * lowest possible PWM_PRE_DIV is used. Finally the scale is calculated
> > +		 * as:
> > +		 *
> > +		 *   BACKLIGHT_SCALE = (T_pwm * REFCLK_FREQ - 1) / PWM_PRE_DIV
> > +		 *
> > +		 * Here T_pwm is represented in seconds, so appropriate scaling to
> > +		 * nanoseconds is necessary.
> > +		 */
> 
> Very nice.
> 
> > +		pre_div = DIV_ROUND_UP((state->period * pdata->pwm_refclk_freq - 1),
> > +				       (NSEC_PER_SEC * BACKLIGHT_SCALE_MAX));
> 
> 		if (pre_div > 0xffff)
> 			pre_div = 0xffff;
> 
> is needed here. (Assuming 0xffff is the bigest valid value for PRE_DIV.)
> 

Yes, that makes sense.

> > +		scale = (state->period * pdata->pwm_refclk_freq - 1) / (NSEC_PER_SEC * pre_div);
> 
> There is something wrong here. Consider:
> 
> 	pdata->pwm_refclk_freq = 3333334
> 	state->period = 100000
> 	state->duty_cycle = 600
> 
> then you calculate:
> 
> 	pre_div = 1
> 	scale = 333
> 
> which yields an actual period of 100199.98 ns. However you should get a
> period less or equal than the requested period.
> 
> It took me some time to spot the problem: Only state->period *
> pdata->pwm_refclk_freq must be divided by NSEC_PER_SEC, but not the -1.
> 
> So the right formula is:
> 
> 	scale = (state->period * pdata->pwm_refclk_freq - NSEC_PER_SEC) / (NSEC_PER_SEC * pre_div);
> 

Ahh, you're right! Thanks!

> (but you have to pay attention, the dividend might be negative in this
> formula).
> 

Right and that defines the lower limit for the period, something I don't
handle as this is currently written.

> > +		/*
> > +		 * The duty ratio is given as:
> > +		 *
> > +		 *   duty = BACKLIGHT / (BACKLIGHT_SCALE + 1)
> > +		 */
> > +		backlight = state->duty_cycle * (scale + 1) / state->period;
> 
> Lets continue the above example with the fixed calculation. So we have:
> 
> 	pdata->pwm_refclk_freq = 3333334
> 	state->period = 100000 [ns]
> 	state->duty_cycle = 600
> 	scale = 332
> 
> so the actually emitted period = 99899.98002000399 ns
> 
> Now you calculate:
> 
> 	backlight = 1
> 
> which yields an actual duty_cycle of 299.99994 ns, with backlight = 2
> you would get an actual duty_cycle of 599.99988 ns, which is better. The
> culprit here is that you divide by state->period but instead should
> divide by the actual period.
> 

What do I do about the case where the actual period is lower than the
requested one and thereby the duty cycle becomes larger than the period?

E.g. passing duty_cycle = period = 1,000,000 with a frequency of 3333334
results in a scale of 3332 and duty cycle (over the actual period) of
3333.

> > +
> > +		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> > +			goto out;
> > +		}
> > +
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
> 
> How does the output behave between these register writes? Can it happen
> that it emits a wave for corresponding to (e.g.) the new pre_div value
> but the old scale and backlight?
> 

I don't see anything indicating in the documentation indicating that
these writes would be buffered or similar. Unfortunately, as I said
earlier I don't have any way to access the signal to see for myself.

> 
> > +	}
> > +
> > +	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, !!state->enabled) |
> > +		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
> > +	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
> > +	if (ret) {
> > +		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
> > +		goto out;
> > +	}
> > +
> > +	pdata->pwm_enabled = !!state->enabled;
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
> > +	state->period = NSEC_PER_SEC * (pre_div * scale + 1) / pdata->pwm_refclk_freq;
> 
> round up here please. Then applying the result of .get_state() is
> a noop (as it should be).
> 

Together with the adjustment of the -1 above I can confirm that we get
something that PWM_DEBUG is happy with (over a larger range of tests
input than I previously tested...)

> > +	state->duty_cycle = DIV_ROUND_UP(state->period * backlight, scale + 1);
> 
> I find it surprising that the actual duty_cycle is:
> 
> 	  state->period * backlight
> 	  -------------------------
> 	          scale + 1
> 
>           pre_div * scale + 1
> 	= -------------------
> 	    refclk * scale
> 
> where scale occurs twice. Can you confirm this to be right?
> 

I came to the same conclusion - i.e. that this looks wrong.

As states above, the period of the PWM is:

	pre_div * scale + 1
	-------------------
	       refclk

or:

	T_refclk * (pre_div * scale + 1)

Which I interpret as us having two nested counters ticking based on
refclk. Once we hit pre_div * scale the counter resets, which takes 1
refclk pulse.

But then the duty cycle is described as:

	BACKLIGHT / (BACKLIGHT_SCALE + 1)

which I would say looks like the signal is high pre_div * BACKLIGHT
steps and then it resets at pre_div * (BACKLIGHT_SCALE + 1).

So I don't know what's going on here.


I will take another look tomorrow on why, but the including the + 1 in
the denominator seems to be necessary to keep the duty cycle
idempotent...

> > +}
> > +
> > +static const struct pwm_ops ti_sn_pwm_ops = {
> > +	.request = ti_sn_pwm_request,
> > +	.free = ti_sn_pwm_free,
> > +	.apply = ti_sn_pwm_apply,
> > +	.get_state = ti_sn_pwm_get_state,
> > +	.owner = THIS_MODULE,
> > +};
> > +
> > +static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> > +		const struct auxiliary_device_id *id)
> > +{
> > +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> > +
> > +	pdata->pchip.dev = pdata->dev;
> > +	pdata->pchip.ops = &ti_sn_pwm_ops;
> > +	pdata->pchip.base = -1;
> 
> base shouldn't be set since
> 
> 	f9a8ee8c8bcd (pwm: Always allocate PWM chip base ID dynamically)

Thanks, that's nice!


Many thanks for your feedback!

Regards,
Bjorn

> 
> > +	pdata->pchip.npwm = 1;
> > +	pdata->pchip.of_xlate = of_pwm_single_xlate;
> > +	pdata->pchip.of_pwm_n_cells = 1;
> > +
> > +	return pwmchip_add(&pdata->pchip);
> > +}
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


