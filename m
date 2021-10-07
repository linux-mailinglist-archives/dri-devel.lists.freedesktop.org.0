Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA9424C4C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 05:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AED6E81D;
	Thu,  7 Oct 2021 03:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D36E81D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 03:51:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l7-20020a0568302b0700b0054e40740571so150183otv.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AfrdR87+CwTeV/7mViDbHqrFD29I/+viEcRqWA22b28=;
 b=hKkfK8dsRiN8VdeVSjSbWLJ+cA89j1+M4bKmuB+cCwqum7Is5xp4sGDtxDJrHBqQaD
 5a1MnTDXkkSIFJw7DeG+HqWlKFCp365yF3A7WWkdc9h1x8EPmdpF87gOQmTEOT8qNDrj
 TZEvQA9XTQlMNzRT1+VhzPmoIma9ABdEHvG5uVaAlgdRkrwP/w5Q5JsEecCVAcn44LMm
 IOHimGTfqf7bN2OYgJs0OLnHW9wdv/uCKVn8E8bB42whTvXpqmJf/8Xk6lYNAXy4jVMS
 Z/HunGQm+DMbgiEwooocAAdHNIA9wkPCaLbbITEADXYqQEqsZQbJ+hEDaGTPBR6BbUwH
 bCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AfrdR87+CwTeV/7mViDbHqrFD29I/+viEcRqWA22b28=;
 b=lYoGjCccCfPCVuHamnX4QB6VG3EXHI53ZZGR4+lNY0SVv1apnxDdiyNnrXWrj+7pj5
 H1ftJj7gaYBFOvbndv8XwXQNleYpIZWMr4pHOZoxN7WGs1qOhl7EfRkVhCix6gkss5P9
 rI24H2eJDQf1VAMsjef6gseN120MLEDttk63J/6OaazRXMd4/3A/RJBJc0RIO4ZszjFr
 KGYva106RA+0qHTEL8NM3dJrgBP68d1OErao0awrVo+nNpw67kXHuvAssdAdR1OxeuSv
 bvfX4afJOpFpdOIAkzBZA2sVHWp4fHpi1r1fJ05bBNhjGWL8URW+Zwi/x3mOPzXGNNIP
 EmLw==
X-Gm-Message-State: AOAM530dRtncaBeN/36cKAmNCC5VDt6veY2g9hqVLg0ntAy+1GEhWbDD
 a9cSNom51mE+U31TkiqZb9N0Qg==
X-Google-Smtp-Source: ABdhPJzOFeVgqRzEVsHFOnPjSfk9gdDCdCbn7fUZDzChiH0z8gbBcgRrJP1OrvW5cbFjAQ7cFHLHbQ==
X-Received: by 2002:a05:6830:1e54:: with SMTP id
 e20mr1832421otj.242.1633578687590; 
 Wed, 06 Oct 2021 20:51:27 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l2sm1120973otu.23.2021.10.06.20.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 20:51:27 -0700 (PDT)
Date: Wed, 6 Oct 2021 20:53:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <YV5vIyhy+m+Nx/gQ@ripper>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930030557.1426-3-bjorn.andersson@linaro.org>
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

On Wed 29 Sep 20:05 PDT 2021, Bjorn Andersson wrote:

> The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> with the primary purpose of controlling the backlight of the attached
> panel. Add an implementation that exposes this using the standard PWM
> framework, to allow e.g. pwm-backlight to expose this to the user.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Any feedback on this?

Thanks,
Bjorn

> ---
> 
> Changes since v5:
> - Make ti_sn65dsi86_read_u16() use regmap_bulk_read()
> - Update the wording related to the formula for the period being wrong to not
>   just say I'm "assuming because it's easier".
> - Updated comment related to minimum period
> - Clamp duty <= period in get_state()
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 366 +++++++++++++++++++++++++-
>  1 file changed, 360 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 412fb6f564ea..ccf6496cc9ff 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -4,7 +4,9 @@
>   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
>   */
>  
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
>  
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
>  
>  #define SN_LINK_TRAINING_TRIES		10
>  
> +#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
> +
>  /**
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
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
>  
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
>  
>  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
> @@ -190,6 +215,21 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> +				 unsigned int reg, u16 *val)
> +{
> +	u8 buf[2];
> +	int ret;
> +
> +	ret = regmap_bulk_read(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> +	if (ret)
> +		return ret;
> +
> +	*val = buf[0] | (buf[1] << 8);
> +
> +	return 0;
> +}
> +
>  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  				   unsigned int reg, u16 val)
>  {
> @@ -254,6 +294,12 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
>  
>  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
>  			   REFCLK_FREQ(i));
> +
> +	/*
> +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> +	 * regardless of its actual sourcing.
> +	 */
> +	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
>  }
>  
>  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> @@ -1260,9 +1306,289 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
>  };
>  
>  /* -----------------------------------------------------------------------------
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
> +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct ti_sn65dsi86, pchip);
> +}
> +
> +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
>  
> +	return ti_sn_pwm_pin_request(pdata);
> +}
> +
> +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> +
> +	ti_sn_pwm_pin_release(pdata);
> +}
> +
> +/*
> + * Limitations:
> + * - The PWM signal is not driven when the chip is powered down, or in its
> + *   reset state and the driver does not implement the "suspend state"
> + *   described in the documentation. In order to save power, state->enabled is
> + *   interpreted as denoting if the signal is expected to be valid, and is used
> + *   to determine if the chip needs to be kept powered.
> + * - Changing both period and duty_cycle is not done atomically, neither is the
> + *   multi-byte register updates, so the output might briefly be undefined
> + *   during update.
> + */
> +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int backlight;
> +	unsigned int pre_div;
> +	unsigned int scale;
> +	u64 period_max;
> +	u64 period;
> +	int ret;
> +
> +	if (!pdata->pwm_enabled) {
> +		ret = pm_runtime_get_sync(pdata->dev);
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
> +			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
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
> +		 *   PWM_FREQ = -----------------------------------
> +		 *               PWM_PRE_DIV * BACKLIGHT_SCALE + 1
> +		 *
> +		 * However, after careful review the author is convinced that
> +		 * the documentation has lost some parenthesis around
> +		 * "BACKLIGHT_SCALE + 1".
> +		 * With that the formula can be written:
> +		 *
> +		 *   T_pwm * REFCLK_FREQ = PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
> +		 *
> +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> +		 * PWM_PRE_DIV must be:
> +		 *
> +		 *                     T_pwm * REFCLK_FREQ
> +		 *   PWM_PRE_DIV >= -------------------------
> +		 *                   BACKLIGHT_SCALE_MAX + 1
> +		 *
> +		 * To simplify the search and to favour higher resolution of
> +		 * the duty cycle over accuracy of the period, the lowest
> +		 * possible PWM_PRE_DIV is used. Finally the scale is
> +		 * calculated as:
> +		 *
> +		 *                      T_pwm * REFCLK_FREQ
> +		 *   BACKLIGHT_SCALE = ---------------------- - 1
> +		 *                          PWM_PRE_DIV
> +		 *
> +		 * Here T_pwm is represented in seconds, so appropriate scaling
> +		 * to nanoseconds is necessary.
> +		 */
> +
> +		/* Minimum T_pwm is 1 / REFCLK_FREQ */
> +		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> +		 * Limit period to this to avoid overflows
> +		 */
> +		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1),
> +				     pdata->pwm_refclk_freq);
> +		if (period > period_max)
> +			period = period_max;
> +		else
> +			period = state->period;
> +
> +		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> +		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
> +
> +		/*
> +		 * The documentation has the duty ratio given as:
> +		 *
> +		 *     duty          BACKLIGHT
> +		 *   ------- = ---------------------
> +		 *    period    BACKLIGHT_SCALE + 1
> +		 *
> +		 * Solve for BACKLIGHT, substituting BACKLIGHT_SCALE according
> +		 * to definition above and adjusting for nanosecond
> +		 * representation of duty cycle gives us:
> +		 */
> +		backlight = div64_u64(state->duty_cycle * pdata->pwm_refclk_freq,
> +				      (u64)NSEC_PER_SEC * pre_div);
> +		if (backlight > scale)
> +			backlight = scale;
> +
> +		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> +			goto out;
> +		}
> +
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
> +	}
> +
> +	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
> +		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
> +	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
> +	if (ret) {
> +		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
> +		goto out;
> +	}
> +
> +	pdata->pwm_enabled = state->enabled;
> +out:
> +
> +	if (!pdata->pwm_enabled)
> +		pm_runtime_put_sync(pdata->dev);
> +
> +	return ret;
> +}
> +
> +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +				struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int pre_div;
> +	u16 backlight;
> +	u16 scale;
> +	int ret;
> +
> +	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> +	if (ret)
> +		return;
> +
> +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> +	if (ret)
> +		return;
> +
> +	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> +	if (ret)
> +		return;
> +
> +	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> +	if (ret)
> +		return;
> +
> +	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> +		state->polarity = PWM_POLARITY_INVERSED;
> +	else
> +		state->polarity = PWM_POLARITY_NORMAL;
> +
> +	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
> +					 pdata->pwm_refclk_freq);
> +	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
> +					     pdata->pwm_refclk_freq);
> +
> +	if (state->duty_cycle > state->period)
> +		state->duty_cycle = state->period;
> +}
> +
> +static const struct pwm_ops ti_sn_pwm_ops = {
> +	.request = ti_sn_pwm_request,
> +	.free = ti_sn_pwm_free,
> +	.apply = ti_sn_pwm_apply,
> +	.get_state = ti_sn_pwm_get_state,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> +			   const struct auxiliary_device_id *id)
> +{
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> +
> +	pdata->pchip.dev = pdata->dev;
> +	pdata->pchip.ops = &ti_sn_pwm_ops;
> +	pdata->pchip.npwm = 1;
> +	pdata->pchip.of_xlate = of_pwm_single_xlate;
> +	pdata->pchip.of_pwm_n_cells = 1;
> +
> +	return pwmchip_add(&pdata->pchip);
> +}
> +
> +static void ti_sn_pwm_remove(struct auxiliary_device *adev)
> +{
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> +
> +	pwmchip_remove(&pdata->pchip);
> +
> +	if (pdata->pwm_enabled)
> +		pm_runtime_put_sync(pdata->dev);
> +}
> +
> +static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
> +	{ .name = "ti_sn65dsi86.pwm", },
> +	{},
> +};
> +
> +static struct auxiliary_driver ti_sn_pwm_driver = {
> +	.name = "pwm",
> +	.probe = ti_sn_pwm_probe,
> +	.remove = ti_sn_pwm_remove,
> +	.id_table = ti_sn_pwm_id_table,
> +};
> +
> +static int __init ti_sn_pwm_register(void)
> +{
> +	return auxiliary_driver_register(&ti_sn_pwm_driver);
> +}
> +
> +static void ti_sn_pwm_unregister(void)
> +{
> +	auxiliary_driver_unregister(&ti_sn_pwm_driver);
> +}
> +
> +#else
> +static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
> +static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
> +
> +static inline int ti_sn_pwm_register(void) { return 0; }
> +static inline void ti_sn_pwm_unregister(void) {}
> +#endif
> +
> +/* -----------------------------------------------------------------------------
> + * GPIO Controller
> + */
>  #if defined(CONFIG_OF_GPIO)
>  
>  static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
> @@ -1395,10 +1721,25 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
>  	return ret;
>  }
>  
> +static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
> +
> +	if (offset == SN_PWM_GPIO_IDX)
> +		return ti_sn_pwm_pin_request(pdata);
> +
> +	return 0;
> +}
> +
>  static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
>  {
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
> +
>  	/* We won't keep pm_runtime if we're input, so switch there on free */
>  	ti_sn_bridge_gpio_direction_input(chip, offset);
> +
> +	if (offset == SN_PWM_GPIO_IDX)
> +		ti_sn_pwm_pin_release(pdata);
>  }
>  
>  static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
> @@ -1420,6 +1761,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
>  	pdata->gchip.owner = THIS_MODULE;
>  	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
>  	pdata->gchip.of_gpio_n_cells = 2;
> +	pdata->gchip.request = ti_sn_bridge_gpio_request;
>  	pdata->gchip.free = ti_sn_bridge_gpio_free;
>  	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
>  	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
> @@ -1546,10 +1888,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	 * ordering. The bridge wants the panel to be there when it probes.
>  	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
>  	 * when it probes. The panel and maybe backlight might want the DDC
> -	 * bus. Soon the PWM provided by the bridge chip will have the same
> -	 * problem. Having sub-devices allows the some sub devices to finish
> -	 * probing even if others return -EPROBE_DEFER and gets us around the
> -	 * problems.
> +	 * bus or the pwm_chip. Having sub-devices allows the some sub devices
> +	 * to finish probing even if others return -EPROBE_DEFER and gets us
> +	 * around the problems.
>  	 */
>  
>  	if (IS_ENABLED(CONFIG_OF_GPIO)) {
> @@ -1558,6 +1899,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			return ret;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_PWM)) {
> +		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * NOTE: At the end of the AUX channel probe we'll add the aux device
>  	 * for the bridge. This is because the bridge can't be used until the
> @@ -1601,10 +1948,14 @@ static int __init ti_sn65dsi86_init(void)
>  	if (ret)
>  		goto err_main_was_registered;
>  
> -	ret = auxiliary_driver_register(&ti_sn_aux_driver);
> +	ret = ti_sn_pwm_register();
>  	if (ret)
>  		goto err_gpio_was_registered;
>  
> +	ret = auxiliary_driver_register(&ti_sn_aux_driver);
> +	if (ret)
> +		goto err_pwm_was_registered;
> +
>  	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
>  	if (ret)
>  		goto err_aux_was_registered;
> @@ -1613,6 +1964,8 @@ static int __init ti_sn65dsi86_init(void)
>  
>  err_aux_was_registered:
>  	auxiliary_driver_unregister(&ti_sn_aux_driver);
> +err_pwm_was_registered:
> +	ti_sn_pwm_unregister();
>  err_gpio_was_registered:
>  	ti_sn_gpio_unregister();
>  err_main_was_registered:
> @@ -1626,6 +1979,7 @@ static void __exit ti_sn65dsi86_exit(void)
>  {
>  	auxiliary_driver_unregister(&ti_sn_bridge_driver);
>  	auxiliary_driver_unregister(&ti_sn_aux_driver);
> +	ti_sn_pwm_unregister();
>  	ti_sn_gpio_unregister();
>  	i2c_del_driver(&ti_sn65dsi86_driver);
>  }
> -- 
> 2.32.0
> 
