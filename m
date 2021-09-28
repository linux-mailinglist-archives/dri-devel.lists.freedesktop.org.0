Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4D41B4AB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045BD6E0FD;
	Tue, 28 Sep 2021 17:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2B76E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 17:03:09 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u22so30765281oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h+pBG2+zQaW7DavBnathBz0RUiNcLAWMkTtIjGqjerI=;
 b=ezoaA+F7MQYT6fp611R6gj9CG1SuEP0n0L7kNnkQYcnDDdN3gk17mYrV6HpWH/6jq2
 UHv24lLevxTGqlO9oZU7M04IzrwAcEDv+TyFedgX2XTxQzDWTY/2VlIMl1e4cxn7ratV
 INWIwR/4YyFkR8yFddPi9IKdCvHYgsKfGymUoWc5E4YR1WqMZeoqthA7ho5Lqz8wT4o8
 2SHf8+m2kjwO7XHde751BasW9UchAzCHmenZc9F2fOyvJeJsl4/vL+yD9tGuswHbKq2r
 2x/t35jKwGMdgPVK7CxHBmWGcfPpGsPi7/HOj+PLAlEtXd2Y2kQmviufMrP4pWblR4Tc
 fEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+pBG2+zQaW7DavBnathBz0RUiNcLAWMkTtIjGqjerI=;
 b=PhNfRTgS/P5DavV7f3chAJmpB50if30UbioxEHlCUpTKeeP+aCgsW5aBEfEZpfP0KY
 JfvVg7U5tiYkmMSwzRQI+xNk/ZNMdKSQFGXYgwD5vcj8RaANr4ltDHjUt8XsqrIlHPUN
 gSIPauYMPVLaJ8MDUSQJIWcyxqwXBLn5biV9Utoiqmhlaa7vW/oowKxk46sGwLSOVU3S
 IU1v0OFUtgpHW/i1SP3oqmlqfXWzYg/DDZuiw2xMXz1Cqi47hbMS4hGV1RD7kd2mFWgu
 1+ch8MuW5JiOtbE6AinfmRZjBVV4vVoi9lCCaDBCy26SR1yECF0vsKleAhljM0x7KwQ3
 j/mQ==
X-Gm-Message-State: AOAM530525y/PmQKTRM6pvfCm84btyKPYaQrKbHEU1gYyQpHJeSth/DK
 1hHZAj+a2b/l00pHPCh31l02SQ==
X-Google-Smtp-Source: ABdhPJyYPKGuRgIkPnAD9QS3MF3K+GfQOdT6YKcaGAzG7txp/rjb/quTjsmKLMx5onljLT/S2qhDgw==
X-Received: by 2002:a05:6808:198b:: with SMTP id
 bj11mr4431660oib.105.1632848588823; 
 Tue, 28 Sep 2021 10:03:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id bg36sm1803733oib.2.2021.09.28.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 10:03:08 -0700 (PDT)
Date: Tue, 28 Sep 2021 12:03:06 -0500
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
Message-ID: <YVNKykYBA3rWJVuf@builder.lan>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
 <20210924021225.846197-2-bjorn.andersson@linaro.org>
 <20210924075433.apkdkwur5ar67ge2@pengutronix.de>
 <YU5LeQlSANlt1/jk@builder.lan>
 <20210925212521.vwtyaqwstyssn5ne@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925212521.vwtyaqwstyssn5ne@pengutronix.de>
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

On Sat 25 Sep 16:25 CDT 2021, Uwe Kleine-K?nig wrote:

> Hello Bjorn,
> 
> On Fri, Sep 24, 2021 at 05:04:41PM -0500, Bjorn Andersson wrote:
> > On Fri 24 Sep 02:54 CDT 2021, Uwe Kleine-K?nig wrote:
> > > > +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> > > > +				 unsigned int reg, u16 *val)
> > > > +{
> > > > +	unsigned int tmp;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(pdata->regmap, reg, &tmp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	*val = tmp;
> > > > +
> > > > +	ret = regmap_read(pdata->regmap, reg + 1, &tmp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	*val |= tmp << 8;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> > > >  				   unsigned int reg, u16 val)
> > > >  {
> > > > -	regmap_write(pdata->regmap, reg, val & 0xFF);
> > > > -	regmap_write(pdata->regmap, reg + 1, val >> 8);
> > > > +	u8 buf[2] = { val & 0xff, val >> 8 };
> > > > +
> > > > +	regmap_bulk_write(pdata->regmap, reg, &buf, ARRAY_SIZE(buf));
> > > 
> > > Given that ti_sn65dsi86_write_u16 uses regmap_bulk_write I wonder why
> > > ti_sn65dsi86_read_u16 doesn't use regmap_bulk_read.
> > 
> > Seems reasonable to make that use the bulk interface as well and this
> > would look better in its own patch.
> 
> Not sure I understand you here. My position here would be to introduce
> these two functions with a consistent behaviour. If both use bulk or
> both don't use it (and you introduce it later in a separate patch)
> doesn't matter to me.
> 

We're in agreement :)

> > > >  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > > @@ -253,6 +298,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
> > > >  
> > > >  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> > > >  			   REFCLK_FREQ(i));
> > > > +
> > > > +	/*
> > > > +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> > > > +	 * regardless of its actual sourcing.
> > > > +	 */
> > > > +	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
> > > >  }
> > > >  
> > > >  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > > > @@ -1259,9 +1310,283 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
> > > >  };
> > > >  
> > > >  /* -----------------------------------------------------------------------------
> > > > - * GPIO Controller
> > > > + * PWM Controller
> > > > + */
> > > > +#if defined(CONFIG_PWM)
> > > > +static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
> > > > +{
> > > > +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> > > > +}
> > > > +
> > > > +static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
> > > > +{
> > > > +	atomic_set(&pdata->pwm_pin_busy, 0);
> > > > +}
> > > > +
> > > > +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
> > > > +{
> > > > +	return container_of(chip, struct ti_sn65dsi86, pchip);
> > > > +}
> > > > +
> > > > +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > > > +{
> > > > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > > > +
> > > > +	return ti_sn_pwm_pin_request(pdata);
> > > > +}
> > > > +
> > > > +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > > > +{
> > > > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > > > +
> > > > +	ti_sn_pwm_pin_release(pdata);
> > > > +}
> > > > +
> > > > +/*
> > > > + * Limitations:
> > > > + * - The PWM signal is not driven when the chip is powered down, or in its
> > > > + *   reset state and the driver does not implement the "suspend state"
> > > > + *   described in the documentation. In order to save power, state->enabled is
> > > > + *   interpreted as denoting if the signal is expected to be valid, and is used
> > > > + *   to determine if the chip needs to be kept powered.
> > > > + * - Changing both period and duty_cycle is not done atomically, neither is the
> > > > + *   multi-byte register updates, so the output might briefly be undefined
> > > > + *   during update.
> > > >   */
> > > > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > > > +			   const struct pwm_state *state)
> > > > +{
> > > > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > > > +	unsigned int pwm_en_inv;
> > > > +	unsigned int backlight;
> > > > +	unsigned int pre_div;
> > > > +	unsigned int scale;
> > > > +	u64 period_max;
> > > > +	u64 period;
> > > > +	int ret;
> > > > +
> > > > +	if (!pdata->pwm_enabled) {
> > > > +		ret = pm_runtime_get_sync(pdata->dev);
> > > > +		if (ret < 0) {
> > > > +			pm_runtime_put_sync(pdata->dev);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (state->enabled) {
> > > > +		if (!pdata->pwm_enabled) {
> > > > +			/*
> > > > +			 * The chip might have been powered down while we
> > > > +			 * didn't hold a PM runtime reference, so mux in the
> > > > +			 * PWM function on the GPIO pin again.
> > > > +			 */
> > > > +			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > > > +						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > > > +						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > > > +			if (ret) {
> > > > +				dev_err(pdata->dev, "failed to mux in PWM function\n");
> > > > +				goto out;
> > > > +			}
> > > > +		}
> > > > +
> > > > +		/*
> > > > +		 * Per the datasheet the PWM frequency is given by:
> > > > +		 *
> > > > +		 *                          REFCLK_FREQ
> > > > +		 *   PWM_FREQ = -----------------------------------
> > > > +		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> > > > +		 *
> > > > +		 * Unfortunately the math becomes overly complex unless we
> > > > +		 * assume that this formula is missing parenthesis around
> > > > +		 * BACKLIGHT_SCALE + 1.
> > > 
> > > We shouldn't assume a different formula than the reference manual
> > > describes because it's complex. The reasoning should be that the
> > > reference manual is wrong and that someone has convinced themselves the
> > > assumed formula is the right one instead.
> > 
> > Given the effort put in to conclude that there must be some parenthesis
> > there, I agree that "assume" might be to weak of a word...
> > 
> > > With the assumed formula: What happens if PWM_PRE_DIV is 0?
> > 
> > Looking at the specification again and I don't see anything prohibiting
> > from writing 0 in the PRE_DIV register, and writing a 0 to the register
> > causes no visual on my backlight from writing 1.
> 
> So the backlight behaves identically for PRE_DIV = 0 and PRE_DIV = 1 as
> far as you can tell?
> 

Flipping between them I see no difference on my screen.

> > Per our new understanding this should probably have resulted in a period
> > of 0.
> 
> ... but a period of zero doesn't make sense.
> 

Right, that's what I meant. If the hardware really did operate with a
zero period (or a period of 1 refclock cycle) that would be visually
noticeable.

> > That said, if the formula from the datasheet was correct then we'd
> > have a period T_pwm (given T_ref as refclk pulse length) of:
> > 
> >   T_pwm = T_ref * (div * scale + 1)
> > 
> > And with div = 0 we'd have:
> > 
> >   T_pwm = T_ref * 1
> > 
> > Which wouldn't give any room for adjusting the duty cycle, and I can
> > still do that. So that's not correct either.
> 
> I don't see a problem here (just the hardware would be unusual and
> complicated and so more expensive than the simple straigt forward way).
> 
> One way to find out if
> 
> 	 PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> 	-----------------------------------
> 	            REFCLK_FREQ
> 
> or
> 
> 	 PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
> 	-------------------------------------
> 	             REFCLK_FREQ
> 
> is the right formula is to program PWM_PRE_DIV=1 and BACKLIGHT_SCALE=1
> and then check if the backlight is fully on with SN_BACKLIGHT_REG=2 (or
> only with SN_BACKLIGHT_REG=3).
> 
> > Unfortunately I still don't want to dismantle my working laptop, so I
> > don't know if I can do any better than this. Perhaps they do the typical
> > trick of encoding prediv off-by-1 and the PWM duty is off by a factor
> > of 2. Perhaps the comparator for the prediv counter trips at 1 even
> > though the register is configured at 0...
> 
> I would guess the latter.
> 

I will do some more experiments, but as we concluded previously, the
first formula (without parenthesis) doesn't make sense.

> > > > +		/*
> > > > +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> > > > +		 * Limit period to this to avoid overflows
> > > > +		 */
> > > > +		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1), pdata->pwm_refclk_freq);
> > > > +		if (period > period_max)
> > > > +			period = period_max;
> > > > +		else
> > > > +			period = state->period;
> > > > +
> > > > +		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> > > > +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> > > > +		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
> > > 
> > > You're loosing precision here as you divide by the result of a division.
> > 
> > As described above, I'm trying to find suitable values for PRE_DIV and
> > BACKLIGHT_SCALE in:
> > 
> >   T_pwm * refclk_freq
> >  --------------------- = PRE_DIV * (BACKLIGHT_SCALE + 1)
> >      NSEC_PER_SEC
> > 
> > BACKLIGHT_SCALE must fit in 16 bits and in order to be useful for
> > driving the backlight control be large enough that the resolution
> > (BACKLIGTH = [0..BACKLIGHT_SCALE]) covers whatever resolution
> > pwm-backlight might expose.
> > 
> > For the intended use case this seems pretty good, but I presume you
> > could pick better values to get closer to the requested period.
> > 
> > Do you have a better suggestion for how to pick PRE_DIV and
> > BACKLIGHT_SCALE?
> 
> My motivation is limited to spend brain cycles here if we're not sure
> we're using the right formula. Maybe my concern is wrong given that
> pre_div isn't only an interim result but an actual register value. I
> will have to think about that when I'm not tired.
> 

The alternative to this approach, afaict, would be to search for PRE_DIV
and BACKLIGHT_SCALE that gives us the closest period to the requested
one.

But that would come at the expense of duty cycle resolution, which is
what this currently optimizes for.

> > > > +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> > > > +				struct pwm_state *state)
> > > > +{
> > > > +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > > > +	unsigned int pwm_en_inv;
> > > > +	unsigned int pre_div;
> > > > +	u16 backlight;
> > > > +	u16 scale;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> > > > +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> > > > +		state->polarity = PWM_POLARITY_INVERSED;
> > > > +	else
> > > > +		state->polarity = PWM_POLARITY_NORMAL;
> > > > +
> > > > +	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
> > > > +					 pdata->pwm_refclk_freq);
> > > > +	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
> > > > +					     pdata->pwm_refclk_freq);
> > > 
> > > What happens if scale + 1 < backlight?
> > 
> > When we write the backlight register above, we cap it at scale, so for
> > the typical case that shouldn't happen.
> 
> .get_state() is called before the first .apply(), to the values to
> interpret here originate from the bootloader which might write strange
> settings that the linux driver would never do. So being prudent here is
> IMHO a good idea.
> 

Didn't notice that as I traced things, I will add some sanity nudging
here.

> It's a shame that .get_state() cannot return an error.
> 
> > So I guess the one case when this could happen is if we get_state()
> > before pwm_apply(), when someone else has written broken values
> 
> ack.
> 

Thanks,
Bjorn
