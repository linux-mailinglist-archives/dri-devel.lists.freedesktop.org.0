Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE86439A68
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674A6E063;
	Mon, 25 Oct 2021 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7386E063
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:26:13 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q129so16111032oib.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p4DTS+XDrRU1zoDF0JXsJDKfzlw1Jx2jETNT5iMePnI=;
 b=g2mOb7t41N5cc6GiB6ZWW8pit9ZMFe7sLknkU8KdXdL+pOnmDmId3kzmHS4y0DtBpw
 I32xsjou3/rS4rnA+q4kYdvturfTXNlWEso0uvlQFO2DEmEqVQ65bRt3ouiS/5iEYAA7
 e1iVvseAu+CdriJ4zt2zMeWIBXO1FUjPbaxZwclrkzofT3BZLGKgom6aztrN9cwjGKd3
 pBhMmEYMMQa4Yssj1VLaiUdEndOq5LU7c7Qm76pD9Xuz11TflCmhq7J9c2fIlByX/yBl
 dFEAz+0ixVWJf9fvHKKMlW/mdsZSyq24e2DFQqxx1D2rxllUJ+ZQNdQmeL61FGXOR77i
 rozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p4DTS+XDrRU1zoDF0JXsJDKfzlw1Jx2jETNT5iMePnI=;
 b=XLEfYvyKgHyZ6Bd7iKMSy85i0N/gtMfD/toDGyZN6+ceuvCjY08mEP+1PM7VehWgbV
 UXGJtVDzmL+sr3jgVNXVNeEtVsg6XPoS/T9WXUpey52VHdMnn8FTQ2aRU+MJRNkB0QTz
 GClxtmz1osvSBPP8UCCPkzzd1oEJpFda6OEx3ZxUm7yyR7+BbS0+cvsEMHsvXd0JFpjx
 uEL77SZz2SFAl3dvfvC52nsAgqKks0GX1zXLWzDrv0jloLk3TgRiCwDbbAdd/gkMBq3E
 ht8mU/aH+2DEg+7poOuwIVnel16qOWf/nOVBgUm3TwiC3e4WUDwpBPc7TsXEtvmm3zzd
 O5Mw==
X-Gm-Message-State: AOAM531am2Ra/tQQPah+P7VRx97LSqo0FbSEkeREAEDkkQYgMDZFsExc
 z9DiWabYRCGQRQ3mC3Uw4HOTeA==
X-Google-Smtp-Source: ABdhPJz+aGu1DW+AHAHdR7S/AfP0mjfSmCKCdM4kWHzZY7VGk5rnkngQoMCvlKGwWg4u8iN0ZVtFRQ==
X-Received: by 2002:aca:a817:: with SMTP id r23mr12992262oie.71.1635175572431; 
 Mon, 25 Oct 2021 08:26:12 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id bn41sm3688631oib.43.2021.10.25.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 08:26:11 -0700 (PDT)
Date: Mon, 25 Oct 2021 08:27:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
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
Message-ID: <YXbM9Pnxpo50TQy+@ripper>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org>
 <20211025084250.pkd5s4zdmevjjl7m@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211025084250.pkd5s4zdmevjjl7m@pengutronix.de>
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

On Mon 25 Oct 01:42 PDT 2021, Uwe Kleine-K?nig wrote:

> Hello,
> 
> [replaced Andrzej Hajda's email address with his new one]
> 
> On Wed, Sep 29, 2021 at 10:05:57PM -0500, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> 
> Sorry for the long delay in reviewing this.
> 

No worries, glad to hear from you again.

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
[..]
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
> > +		 * However, after careful review the author is convinced that
> > +		 * the documentation has lost some parenthesis around
> > +		 * "BACKLIGHT_SCALE + 1".
> > +		 * With that the formula can be written:
> > +		 *
> > +		 *   T_pwm * REFCLK_FREQ = PWM_PRE_DIV * (BACKLIGHT_SCALE + 1)
> 
> For my understanding: T_pwm = period length = 1 / PWM_FREQ, right? Maybe
> it's a good idea to state this more explicitly?
> 

Correct. I've improved the comment accordingly.

> > +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> > +		 * PWM_PRE_DIV must be:
> > +		 *
> > +		 *                     T_pwm * REFCLK_FREQ
> > +		 *   PWM_PRE_DIV >= -------------------------
> > +		 *                   BACKLIGHT_SCALE_MAX + 1
> > +		 *
> > +		 * To simplify the search and to favour higher resolution of
> > +		 * the duty cycle over accuracy of the period, the lowest
> > +		 * possible PWM_PRE_DIV is used. Finally the scale is
> > +		 * calculated as:
> > +		 *
> > +		 *                      T_pwm * REFCLK_FREQ
> > +		 *   BACKLIGHT_SCALE = ---------------------- - 1
> > +		 *                          PWM_PRE_DIV
> > +		 *
> > +		 * Here T_pwm is represented in seconds, so appropriate scaling
> > +		 * to nanoseconds is necessary.
> > +		 */
> > +
> > +		/* Minimum T_pwm is 1 / REFCLK_FREQ */
> > +		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		/*
> > +		 * Maximum T_pwm is 255 * (65535 + 1) / REFCLK_FREQ
> > +		 * Limit period to this to avoid overflows
> > +		 */
> > +		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1),
> > +				     pdata->pwm_refclk_freq);
> > +		if (period > period_max)
> 
> period is uninitialized here. This must be
> 
> 		if (state->period > period_max)
> 
> . Alternatively to the if you could use
> 
> 		period = min(state->period, period_max);
> 

Yes of course.

> 
> Apart from this I'm happy with your patch set now.
> 

Thank you.

> > +			period = period_max;
> > +		else
> > +			period = state->period;
> > +
> > +		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
> > +					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> > +		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
> 
> After thinking a while about this---I think I stumbled about this
> calculation already in earlier revisions of this patch set---I think I
> now understood it. I never saw something like this before because other
> drivers with similar HW conditions would pick:
> 
> 	pre_div = div64_u64(period * pdata->pwm_refclk_freq,
> 			    (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
> 
> and then scale = BACKLIGHT_SCALE_MAX. This latter approach weights high
> resolution of duty_cycle still higher over period exactness than your
> approach.

Interesting.

> For me both approaches are fine.
> 

Thanks, I'll respin with the two minor things above and leave the math
as is now :)

Regards,
Bjorn

> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


