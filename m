Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB22D5559
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF986EA3F;
	Thu, 10 Dec 2020 08:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836EC6E82D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 04:00:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id y24so3677036otk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 20:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gIdhhdeDOjOvNvXjvma9ceMqMwjrmoXcN6a4wX/2Q5c=;
 b=B6yJJE8edGvq9GI6I2ip+hXyldCH1UORaOGEJP9DITXrGk7c9vehnTczkdr+g/tePa
 cuxyOOopsq9W7WZ3zNMRi2hT1OpI2VNUobWHE6G83cQYB4/DiBWTJGPs5lMz7et09/70
 7s4BUKY2qMeZ+OJnL0AkoGdO6Ta+v6yBuzxZOG1oDbgqgiudiD5vtm9Nwl1G/vV22kmb
 wl+DzqnvhBlmvOjEXtaJhCza5lHVf0XNGpbg9tdXDNjvAlEZ6iby0JDbIOTkrfUL+29H
 GTTFOyicTiN2UeL8srSUizNkAg+WmiGvFatmL75AB/IPL8ZxmY1foMA98hBfPXa4lycc
 E16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gIdhhdeDOjOvNvXjvma9ceMqMwjrmoXcN6a4wX/2Q5c=;
 b=Y3OigNK6P72u/Sc2I0UAHlwG1xAIn2zabdh81aexm7IfHWQl575Yy5HEHZ4fZ19667
 fKn4u9wXs49QGzNsIqFyoaVjjq1ArNTPT/+BjZmVok+tJ8WsCArYPgaAjcA6wPhyn8qv
 l23F8QEbQ69t2Eibq0iPzfaHTqt0W+qEOASAIsKQ2/ZbilGH3mUX+feoGjo0cJo1XEk6
 uDTEgwBBLkjhL7UHs2kRvziZqzZXblVhG5NL8/740zsxskfJiTIw5XZZ+ZH0PZuUG3Ut
 +dIQ5JNX0rtm6nshFCjveaMel0gxqZ+fefOKpg8W7cmaC87ooJ80OCq9zqRjrKR1Kz4v
 RhIw==
X-Gm-Message-State: AOAM531QuD+Ay1jWN4SliMTUrxMHyOhsk27iEstQIRxNCeansUIZ16yY
 E9PHlmFUDAnaKELB4SUwcxEHag==
X-Google-Smtp-Source: ABdhPJxEzu0PWJYyMdg/aaKM8sDA3h3RiLnGMa8if2kOj8EM0/iGaYLHRsE3qsi828dakvByFU9lzA==
X-Received: by 2002:a9d:5f9a:: with SMTP id g26mr4594273oti.241.1607572852476; 
 Wed, 09 Dec 2020 20:00:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g21sm836776otj.77.2020.12.09.20.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 20:00:51 -0800 (PST)
Date: Wed, 9 Dec 2020 22:00:49 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <X9GdceiglgdoKKbC@builder.lan>
References: <20201208044022.972872-1-bjorn.andersson@linaro.org>
 <20201210015136.GA18407@dragon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210015136.GA18407@dragon>
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 09 Dec 19:51 CST 2020, Shawn Guo wrote:

> On Mon, Dec 07, 2020 at 10:40:22PM -0600, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> > 
> > Special thanks to Doug Anderson for suggestions related to the involved
> > math.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 202 ++++++++++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index f27306c51e4d..43c0acba57ab 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -4,6 +4,7 @@
> >   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
> >   */
> >  
> > +#include <linux/atomic.h>
> >  #include <linux/bits.h>
> >  #include <linux/clk.h>
> >  #include <linux/debugfs.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > @@ -89,6 +91,11 @@
> >  #define SN_ML_TX_MODE_REG			0x96
> >  #define  ML_TX_MAIN_LINK_OFF			0
> >  #define  ML_TX_NORMAL_MODE			BIT(0)
> > +#define SN_PWM_PRE_DIV_REG			0xA0
> > +#define SN_BACKLIGHT_SCALE_REG			0xA1
> > +#define  BACKLIGHT_SCALE_MAX			0xFFFF
> > +#define SN_BACKLIGHT_REG			0xA3
> > +#define SN_PWM_EN_INV_REG			0xA5
> >  #define SN_AUX_CMD_STATUS_REG			0xF4
> >  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
> >  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> > @@ -111,6 +118,8 @@
> >  
> >  #define SN_LINK_TRAINING_TRIES		10
> >  
> > +#define SN_PWM_GPIO			3
> 
> So this maps to the GPIO4 described in sn65dsi86 datasheet.  I'm
> wondering if it's more readable to define the following SHIFT constants
> (your code), and use GPIO_MUX_GPIO4_SHIFT >> 2 where you need GPIO
> offset?
> 
> #define  GPIO_MUX_GPIO1_SHIFT	0
> #define  GPIO_MUX_GPIO2_SHIFT	2
> #define  GPIO_MUX_GPIO3_SHIFT	4
> #define  GPIO_MUX_GPIO4_SHIFT	6
> 
> If you agree, you may consider to integrate this patch beforehand:
> 

Afaict this is the only place in the driver where the gpio number is a
compile time constant and as you say I need both the shifted value and
the value itself in the patch. But I think it's worth clarifying that
"3" means GPIO 4, so if nothing else I should add a comment about that.

> https://github.com/shawnguo2/linux/commit/7cde887ffb3b27a36e77a08bee3666d14968b586
> 

These looks rather generic, but I like the consistency. Feel free to
post this and I'll review it for you.

Regards,
Bjorn

> 
> Shawn
> 
> > +
> >  /**
> >   * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
> >   * @dev:          Pointer to our device.
> > @@ -162,6 +171,12 @@ struct ti_sn_bridge {
> >  	struct gpio_chip		gchip;
> >  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> >  #endif
> > +#if defined(CONFIG_PWM)
> > +	struct pwm_chip			pchip;
> > +	bool				pwm_enabled;
> > +	unsigned int			pwm_refclk;
> > +	atomic_t			pwm_pin_busy;
> > +#endif
> >  };
> >  
> >  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> > @@ -499,6 +514,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> >  
> >  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> >  			   REFCLK_FREQ(i));
> > +
> > +#if defined(CONFIG_PWM)
> > +	/*
> > +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> > +	 * regardless of its actual sourcing.
> > +	 */
> > +	pdata->pwm_refclk = ti_sn_bridge_refclk_lut[i];
> > +#endif
> >  }
> >  
> >  static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
> > @@ -981,6 +1004,161 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
> >  	return 0;
> >  }
> >  
> > +#if defined(CONFIG_PWM)
> > +static int ti_sn_pwm_pin_request(struct ti_sn_bridge *pdata)
> > +{
> > +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> > +}
> > +
> > +static void ti_sn_pwm_pin_release(struct ti_sn_bridge *pdata)
> > +{
> > +	atomic_set(&pdata->pwm_pin_busy, 0);
> > +}
> > +
> > +static struct ti_sn_bridge *
> > +pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
> > +{
> > +	return container_of(chip, struct ti_sn_bridge, pchip);
> > +}
> > +
> > +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +
> > +	return ti_sn_pwm_pin_request(pdata);
> > +}
> > +
> > +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +
> > +	ti_sn_pwm_pin_release(pdata);
> > +}
> > +
> > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			   const struct pwm_state *state)
> > +{
> > +	struct ti_sn_bridge *pdata = pwm_chip_to_ti_sn_bridge(chip);
> > +	unsigned int pwm_en_inv;
> > +	unsigned int backlight;
> > +	unsigned int pwm_freq;
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
> > +					 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO),
> > +					 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO));
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	if (state->enabled) {
> > +		/*
> > +		 * Per the datasheet the PWM frequency is given by:
> > +		 *
> > +		 * PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> > +		 *
> > +		 * In order to find the PWM_FREQ that best suits the requested
> > +		 * state->period, the PWM_PRE_DIV is calculated with the
> > +		 * maximum possible number of steps (BACKLIGHT_SCALE_MAX). The
> > +		 * actual BACKLIGHT_SCALE is then adjusted down to match the
> > +		 * requested period.
> > +		 *
> > +		 * The BACKLIGHT value is then calculated against the
> > +		 * BACKLIGHT_SCALE, based on the requested duty_cycle and
> > +		 * period.
> > +		 */
> > +		pwm_freq = NSEC_PER_SEC / state->period;
> > +		pre_div = DIV_ROUND_UP(pdata->pwm_refclk / pwm_freq - 1, BACKLIGHT_SCALE_MAX);
> > +		scale = (pdata->pwm_refclk / pwm_freq - 1) / pre_div;
> > +
> > +		backlight = scale * state->duty_cycle / state->period;
> > +
> > +		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> > +		if (ret) {
> > +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> > +			goto out;
> > +		}
> > +
> > +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> > +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
> > +	}
> > +
> > +	pwm_en_inv = FIELD_PREP(BIT(1), !!state->enabled) |
> > +		     FIELD_PREP(BIT(0), state->polarity == PWM_POLARITY_INVERSED);
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
> > +static const struct pwm_ops ti_sn_pwm_ops = {
> > +	.request = ti_sn_pwm_request,
> > +	.free = ti_sn_pwm_free,
> > +	.apply = ti_sn_pwm_apply,
> > +	.owner = THIS_MODULE,
> > +};
> > +
> > +static struct pwm_device *ti_sn_pwm_of_xlate(struct pwm_chip *pc,
> > +					     const struct of_phandle_args *args)
> > +{
> > +	struct pwm_device *pwm;
> > +
> > +	if (args->args_count != 1)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	pwm = pwm_request_from_chip(pc, 0, NULL);
> > +	if (IS_ERR(pwm))
> > +		return pwm;
> > +
> > +	pwm->args.period = args->args[0];
> > +
> > +	return pwm;
> > +}
> > +
> > +static int ti_sn_setup_pwmchip(struct ti_sn_bridge *pdata)
> > +{
> > +	pdata->pchip.dev = pdata->dev;
> > +	pdata->pchip.ops = &ti_sn_pwm_ops;
> > +	pdata->pchip.base = -1;
> > +	pdata->pchip.npwm = 1;
> > +	pdata->pchip.of_xlate = ti_sn_pwm_of_xlate;
> > +	pdata->pchip.of_pwm_n_cells = 1;
> > +
> > +	return pwmchip_add(&pdata->pchip);
> > +}
> > +
> > +static void ti_sn_remove_pwmchip(struct ti_sn_bridge *pdata)
> > +{
> > +	pwmchip_remove(&pdata->pchip);
> > +
> > +	if (pdata->pwm_enabled)
> > +		pm_runtime_put_sync(pdata->dev);
> > +}
> > +#else
> > +static int ti_sn_pwm_pin_request(struct ti_sn_bridge *pdata) { return 0; }
> > +static void ti_sn_pwm_pin_release(struct ti_sn_bridge *pdata) {}
> > +static int ti_sn_setup_pwmchip(struct ti_sn_bridge *pdata) { return 0; }
> > +static void ti_sn_remove_pwmchip(struct ti_sn_bridge *pdata) {}
> > +#endif
> > +
> >  #if defined(CONFIG_OF_GPIO)
> >  
> >  static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
> > @@ -1113,10 +1291,25 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
> >  	return ret;
> >  }
> >  
> > +static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> > +
> > +	if (offset == SN_PWM_GPIO)
> > +		return ti_sn_pwm_pin_request(pdata);
> > +
> > +	return 0;
> > +}
> > +
> >  static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
> >  {
> > +	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> > +
> >  	/* We won't keep pm_runtime if we're input, so switch there on free */
> >  	ti_sn_bridge_gpio_direction_input(chip, offset);
> > +
> > +	if (offset == SN_PWM_GPIO)
> > +		ti_sn_pwm_pin_release(pdata);
> >  }
> >  
> >  static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
> > @@ -1136,6 +1329,7 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> >  	pdata->gchip.owner = THIS_MODULE;
> >  	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
> >  	pdata->gchip.of_gpio_n_cells = 2;
> > +	pdata->gchip.request = ti_sn_bridge_gpio_request;
> >  	pdata->gchip.free = ti_sn_bridge_gpio_free;
> >  	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
> >  	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
> > @@ -1282,6 +1476,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >  		return ret;
> >  	}
> >  
> > +	ret = ti_sn_setup_pwmchip(pdata);
> > +	if (ret)  {
> > +		pm_runtime_disable(pdata->dev);
> > +		return ret;
> > +	}
> > +
> >  	i2c_set_clientdata(client, pdata);
> >  
> >  	pdata->aux.name = "ti-sn65dsi86-aux";
> > @@ -1320,6 +1520,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> >  
> >  	drm_bridge_remove(&pdata->bridge);
> >  
> > +	ti_sn_remove_pwmchip(pdata);
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.29.2
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
