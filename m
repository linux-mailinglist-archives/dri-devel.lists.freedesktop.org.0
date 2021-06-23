Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F53B1142
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 03:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271CD6E3C6;
	Wed, 23 Jun 2021 01:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22C46E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 01:12:52 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so353318otl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 18:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nCv+uSQRxGQLv4Iq8REm/hvddqVa4LVl72DXjsH2DWE=;
 b=O/2YYYltHfQUibLivV48z/F/ZDnlQsZ2gFJNBkS+swKt56why4V8mcsHfj87K2aD+A
 kYVTGAd5GwRDBUh/2YCIgZqXt/jhf2Ufpi2SjPMCylMdPc+B3rGke6+ELG5nCqn88W82
 96gIeWykgCssxDtgaY17yKMyWsWGPzsn6NCIbr2VKuAPykaIUOY3+gDOrFjow0Y8814W
 DJTGdly/6AeE8F4MRX7lBJMk3E9SbQiguQc5phu3PlyAOllFQkuJ+lQerRo99za4m4gn
 UJiP+hENKjaiDzuzikXMhrzDwU9nK0c7B2kHqU9prGRmtDdTDZB5em94cu6pJCyyIken
 2FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nCv+uSQRxGQLv4Iq8REm/hvddqVa4LVl72DXjsH2DWE=;
 b=o9hDRWVGgElOBHLfZKkxxMRaQJFVFzMUVu/p0CEXy0vZQtVEXNvCa1BMfLDPjaCr5h
 UQb2gIjXlduCUu8P7U/bGOnnsrdJdasqin28gzb3VyN6J3f7Psu6kACkk/vW2wEE7qYy
 hHCPlUTbWp1ndlElOriJDPTNTacn9j8q7ipCT7KUSN/J9vLM7461v5Bthxe6hjfvv0FV
 J65OX1Ey1qhFAV4ltvIn4i8pwblB0pPQyB1q48E4s3TTU5bigTamZDdkTAIUtuTRFHv8
 d7JruZyO8jaCkZonKLlKS7gpy6/YjTghATJSxUZdosTTmidBrsN0d/21LYSKwezSxalK
 493Q==
X-Gm-Message-State: AOAM532AUkLlZZ6vEArRVV0asP/2ot5UIXwT/w/hZVWAwBFvim7r7fcJ
 DYLDsTG5+h9SA9Cqp57BUqMAMw==
X-Google-Smtp-Source: ABdhPJzZ5OlRRDdkwmla7NAqmzozmrf7HNC9smIBLEw6y3WLWoXqM60enZH0eFbalTMYtceelKDz6Q==
X-Received: by 2002:a9d:6303:: with SMTP id q3mr5541388otk.197.1624410771973; 
 Tue, 22 Jun 2021 18:12:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d10sm873802oop.3.2021.06.22.18.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 18:12:51 -0700 (PDT)
Date: Tue, 22 Jun 2021 20:12:48 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <YNKKkEMD4sVhfcNr@yoga>
References: <20210622030948.966748-1-bjorn.andersson@linaro.org>
 <20210622030948.966748-2-bjorn.andersson@linaro.org>
 <20210622202935.lbghwelbiwgufycd@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622202935.lbghwelbiwgufycd@pengutronix.de>
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

On Tue 22 Jun 15:29 CDT 2021, Uwe Kleine-K?nig wrote:

> On Mon, Jun 21, 2021 at 10:09:48PM -0500, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v2:
> > - Corrected calculation of scale, to include a 1 instead of 1/NSEC_TO_SEC and
> >   rounded the period up in get_state, to make sure its idempotent
> > - Changed duty_cycle calculation to make sure it idempotent over my tested period
> > - Documented "Limitations"
> > - Documented muxing operation after pm_runtime_get_sync()
> > 
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 335 +++++++++++++++++++++++++-
> >  1 file changed, 334 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 5d712c8c3c3b..0eabbdad1830 100644
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
> > @@ -1044,6 +1095,258 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
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
> > +/*
> > + * Limitations:
> > + * - The PWM signal is not driven when the chip is powered down, or in its
> > + *   reset state and the driver does not implement the "suspend state"
> > + *   described in the documentation. In order to save power, state->enabled is
> > + *   interpreted as denoting if the signal is expected to be valid, and is used to keep
> > + *   the determine if the chip needs to be kept powered.
> > + * - Changing both period and duty_cycle is not done atomically, so the output
> > + *   might briefly be a mix of the two settings.
> > + */
> > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			   const struct pwm_state *state)
> > +{
> > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +	unsigned int pwm_en_inv;
> > +	unsigned int backlight;
> > +	unsigned int pre_div;
> > +	unsigned int scale;
> > +	u64 tick;
> > +	int ret;
> > +
> > +	if (!pdata->pwm_enabled) {
> > +		ret = pm_runtime_get_sync(pdata->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		/*
> > +		 * The chip might have been powered down while we didn't hold a
> > +		 * PM runtime reference, so mux in the PWM function on the GPIO
> > +		 * pin again.
> > +		 */
> > +		ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> > +			goto out;
> > +		}
> 
> In reply to your v2 I requested to short-cut the case !pdata->pwm_enabled
> && !state->enabled without enabling stuff.
> 

You're right, got lost in my thoughts about the power state. But per my
own reasoning there's no need enable the mux when state->enabled = false

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
> > +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> > +		 * PWM_PRE_DIV must be:
> > +		 *
> > +		 *   PWM_PRE_DIV >= (T_pwm * REFCLK_FREQ - 1) / BACKLIGHT_SCALE_MAX;
> > +		 *
> > +		 * To simplify the search and optimize the resolution of the
> > +		 * PWM, the lowest possible PWM_PRE_DIV is used. Finally the
> > +		 * scale is calculated as:
> > +		 *
> > +		 *   BACKLIGHT_SCALE = (T_pwm * REFCLK_FREQ - 1) / PWM_PRE_DIV
> > +		 *
> > +		 * Here T_pwm is represented in seconds, so appropriate scaling
> > +		 * to nanoseconds is necessary.
> > +		 */
> > +
> > +		/* Minimum T_pwm is (1 * 1 + 1) / REFCLK_FREQ */
> > +		if (state->period * pdata->pwm_refclk_freq <= 2 * NSEC_PER_SEC) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		pre_div = DIV_ROUND_UP((state->period * pdata->pwm_refclk_freq - NSEC_PER_SEC),
> > +				       (NSEC_PER_SEC * BACKLIGHT_SCALE_MAX));
> > +		if (pre_div > 0xff)
> > +			pre_div = 0xff;
> > +
> > +		scale = (state->period * pdata->pwm_refclk_freq - NSEC_PER_SEC) / (NSEC_PER_SEC * pre_div);
> 
> Please consider this multiplication to overflow. Something like:
> 
> 	if (state->period > $someterm)
> 		period = $someterm;
> 	else
> 		period = state->period;
> 
> is usually appropriate. Also NSEC_PER_SEC * pre_div might overflow.
> Moreover to divide a u64 you must not rely on / but need do_div() or
> some variant of it.
> 

Didn't consider that someone would ask for a period of 430 second, but
that sounds reasonable and you're right the denominator might be only 4
bytes on some architectures.

Will fix this, and ensure that things are promoted to 64 bits where
needed and divided appropriately.

> > +
> > +		/*
> > +		 * PWM duty cycle is given as:
> > +		 *
> > +		 *   duty = BACKLIGHT / (BACKLIGHT_SCALE + 1)
> > +		 *
> > +		 * The documentation is however inconsistent in its examples,
> > +		 * so the interpretation used here is that the duty cycle is
> > +		 * the period of BACKLIGHT * PRE_DIV / REFCLK_FREQ.
> 
> I don't understand this.
> 
> > +		 *
> > +		 * The ratio PRE_DIV / REFCLK_FREQ is rounded up to whole
> > +		 * nanoseconds in order to ensure that the calculations are
> > +		 * idempotent and gives results that are smaller than the
> > +		 * requested value.
> > +		 */
> > +		tick = DIV_ROUND_UP(NSEC_PER_SEC * pre_div, pdata->pwm_refclk_freq);
> > +		backlight = state->duty_cycle / tick;
> 
> You're loosing precision here by dividing by the result of a division.
> 

The actual period is also a result of a division and after spending too
many hours scratching my head I reached to conclusion that this was the
reason why I wasn't able to get the duty cycle calculation idempotent
over the ranges I tested.

But in my effort to describe this to you here, I finally spotted the
error and will follow up with a new version that does:

                actual = NSEC_PER_SEC * (pre_div * scale + 1) / pdata->pwm_refclk_freq);
                backlight = state->duty_cycle * (scale + 1) / actual;

(With appropriate u64 casts and divisions)

> > +		if (backlight > scale)
> > +			backlight = scale;
> > +
> > +		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> > +			goto out;
> > +		}
> > +
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> > +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
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
> > +	state->period = DIV_ROUND_UP(NSEC_PER_SEC * (pre_div * scale + 1), pdata->pwm_refclk_freq);
> > +	state->duty_cycle = backlight * DIV_ROUND_UP(NSEC_PER_SEC * pre_div, pdata->pwm_refclk_freq);
> 
> If you use
> 
> 	state->duty_cycle = DIV_ROUND_UP(backlight * NSEC_PER_SEC * pre_div, pdata->pwm_refclk_freq);
> 
> instead (with a cast to u64 to not yield an overflow) the result is more
> exact.
> 

The problem with this is that it sometimes yields duty_cycles larger
than what was requested... But going back to describing this as a ratio
of the period this becomes:

        state->duty_cycle = DIV_ROUND_UP_ULL(state->period * backlight, scale + 1);

> I still find this surprising, I'd expect that SCALE also matters for the
> duty_cycle. With the assumption implemented here modifying SCALE only
> affects the period. This should be easy to verify?! I would expect that
> changing SCALE doesn't affect the relative duty_cycle, so the brightness
> of an LED is unaffected (unless the period gets too big of course).
> 

I think the hardware is two nested counters, one (A) ticking at REFCLK_FREQ
and as that hits PRE_DIV, it kicks the second counter (B) (and resets).

As counter A is reset the output signal goes high, when A hits BACKLIGHT the
signal goes low and when A hits BACKLIGHT_SCALE it resets.

Per this implementation the actual length of the duty cycle would indeed
be independent of the BACKLIGHT_SCALE, but the length of the low signal
(and hence the ratio, which results in the actual brightness) does
depend on BACKLIGHT_SCALE.

> I didn't spend much cycles to verify that the logic in .apply() matches
> .get_state(). I'd keep that check for the next iteration.
> 

Your feedback is much appreciated!

Regards,
Bjorn

> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


