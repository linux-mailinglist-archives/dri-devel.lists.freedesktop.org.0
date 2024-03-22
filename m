Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C5886D8C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9519F11248E;
	Fri, 22 Mar 2024 13:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s5c83M2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B113310F039
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:42:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4147b5d8a0dso4372055e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711114960; x=1711719760; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A6hfGLIkNuV+bd54RFwxJ/rLJaSW3AqRr6wL6CQTnzU=;
 b=s5c83M2TjCvPUCZO2QG52vkG/sDi1zSgkeiRfFttIWMmmNx2xcDfyM9sgDsXih2G1u
 o7Xj8pJRJtkZhJejhPvwzMBRakKjA+vSsGDY+Zz24hW6//JDo6o8uouk3vEtFicZKGIo
 4zWxurJCVhqrwEDr9GHljZDy4vvWyojiURBkil0bH+Cn1em8HFmDmy1yy3GbxeIgeDzm
 hNaXaMXIXULHMuhvxCwBCqqhPsGIvyoYvyQ3bobcIXltXWDrEuWkKmJpNYTyJyvf+gHS
 L041kwEc56zcuniDBnzajkFQDXmnArmZNTpw/quqaRtkflVipwS4+sqd1vCliEXZXNtR
 XVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711114960; x=1711719760;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A6hfGLIkNuV+bd54RFwxJ/rLJaSW3AqRr6wL6CQTnzU=;
 b=AJf+1BVcAzvpNwDViMq0hcX+b4vufdiN8+6/IPbpwJiJ5bkn4sN1XoAukSykjmzIJe
 98DuNEPPInzQQzMEtUrBW2bRZ/AAzK+pNr5qj4CgFp/FrbOH0LVVwWpf0tUD0G2OZiPV
 AHv4BIKGKtrdZwsHIUigCv8KOBIshUhpvYSyM9JZvtGh2e4TvBOO3xDTRDH/groU46Bj
 AJ3myiwaOxEe2Opoqk3mCJrVq7z2UkMyrzluPREATDPGQHY0OFhRYB3asKJJ2/j6bKlg
 26HqaZTzilxcOBQhifOYto/A3rnk7z3hOvnydoU0Mgr/nT1MhwFK2h38G31ZG+ALAPMZ
 ayxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYIau/LOFX9IdMh5NmyjGoTq88wg1juvGFGurAE8ia+VwrCbNbyK6hqd+zPPwmHIkqUt0jyh2pmPCTJdVVfSMDL0cqiYSTsgE3xeC7PSkk
X-Gm-Message-State: AOJu0YwBzr8ym8ylpH6GwnwRpH7dfp2U8wWv3dig9MTdxo75kF0scJx8
 eYMnLzfZhhweeh4YIe1Yee54SBAaywSzlfTg5TGvtJPn2mck+pRT7clxALHQR1c=
X-Google-Smtp-Source: AGHT+IG7Y4+3CMjIZETU15EhYLbThAldl+bWDmM62TGWlAy++IeoN0apSAyz5s2tueP+CPLm48pCdA==
X-Received: by 2002:a05:600c:5756:b0:414:a49:131a with SMTP id
 jw22-20020a05600c575600b004140a49131amr1803265wmb.23.1711114959789; 
 Fri, 22 Mar 2024 06:42:39 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b004146750314csm8996739wmq.3.2024.03.22.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 06:42:38 -0700 (PDT)
Date: Fri, 22 Mar 2024 13:42:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2] backlight: lp8788: Drop support for platform data
Message-ID: <20240322134236.GA124081@aspen.lan>
References: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
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

On Thu, Mar 14, 2024 at 12:35:28PM +0100, Uwe Kleine-König wrote:
> The backlight driver supports getting passed platform data. However this
> isn't used. This allows to remove quite some dead code from the driver
> because bl->pdata is always NULL, and so bl->mode is always
> LP8788_BL_REGISTER_ONLY.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I may be wrong but I think this driver can only be loaded manually
from userspace. On that basis its hugely likely that the entire driver is
dead code (along with the rest of the lp8788 drivers across
the kernel).

However, that's not an objection to this change:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
> Changes since (implicit) v1 archived at
> https://lkml.kernel.org/20240313124828.861731-2-u.kleine-koenig@pengutronix.de:
>
>  - Also drop struct pwm_device *pwm member from struct lp8788_bl
>
> I'm surprised that this didn't fail to compile ...
>
> Best regards
> Uwe
>
>  drivers/video/backlight/lp8788_bl.c | 151 ++--------------------------
>  include/linux/mfd/lp8788.h          |  36 -------
>  2 files changed, 8 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
> index d1a14b0db265..d173e93f6348 100644
> --- a/drivers/video/backlight/lp8788_bl.c
> +++ b/drivers/video/backlight/lp8788_bl.c
> @@ -12,7 +12,6 @@
>  #include <linux/mfd/lp8788.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/pwm.h>
>  #include <linux/slab.h>
>
>  /* Register address */
> @@ -31,149 +30,40 @@
>  #define MAX_BRIGHTNESS			127
>  #define DEFAULT_BL_NAME			"lcd-backlight"
>
> -struct lp8788_bl_config {
> -	enum lp8788_bl_ctrl_mode bl_mode;
> -	enum lp8788_bl_dim_mode dim_mode;
> -	enum lp8788_bl_full_scale_current full_scale;
> -	enum lp8788_bl_ramp_step rise_time;
> -	enum lp8788_bl_ramp_step fall_time;
> -	enum pwm_polarity pwm_pol;
> -};
> -
>  struct lp8788_bl {
>  	struct lp8788 *lp;
>  	struct backlight_device *bl_dev;
> -	struct lp8788_backlight_platform_data *pdata;
> -	enum lp8788_bl_ctrl_mode mode;
> -	struct pwm_device *pwm;
>  };
>
> -static struct lp8788_bl_config default_bl_config = {
> -	.bl_mode    = LP8788_BL_REGISTER_ONLY,
> -	.dim_mode   = LP8788_DIM_EXPONENTIAL,
> -	.full_scale = LP8788_FULLSCALE_1900uA,
> -	.rise_time  = LP8788_RAMP_8192us,
> -	.fall_time  = LP8788_RAMP_8192us,
> -	.pwm_pol    = PWM_POLARITY_NORMAL,
> -};
> -
> -static inline bool is_brightness_ctrl_by_pwm(enum lp8788_bl_ctrl_mode mode)
> -{
> -	return mode == LP8788_BL_COMB_PWM_BASED;
> -}
> -
> -static inline bool is_brightness_ctrl_by_register(enum lp8788_bl_ctrl_mode mode)
> -{
> -	return mode == LP8788_BL_REGISTER_ONLY ||
> -		mode == LP8788_BL_COMB_REGISTER_BASED;
> -}
> -
>  static int lp8788_backlight_configure(struct lp8788_bl *bl)
>  {
> -	struct lp8788_backlight_platform_data *pdata = bl->pdata;
> -	struct lp8788_bl_config *cfg = &default_bl_config;
>  	int ret;
>  	u8 val;
>
> -	/*
> -	 * Update chip configuration if platform data exists,
> -	 * otherwise use the default settings.
> -	 */
> -	if (pdata) {
> -		cfg->bl_mode    = pdata->bl_mode;
> -		cfg->dim_mode   = pdata->dim_mode;
> -		cfg->full_scale = pdata->full_scale;
> -		cfg->rise_time  = pdata->rise_time;
> -		cfg->fall_time  = pdata->fall_time;
> -		cfg->pwm_pol    = pdata->pwm_pol;
> -	}
> -
>  	/* Brightness ramp up/down */
> -	val = (cfg->rise_time << LP8788_BL_RAMP_RISE_SHIFT) | cfg->fall_time;
> +	val = (LP8788_RAMP_8192us << LP8788_BL_RAMP_RISE_SHIFT) | LP8788_RAMP_8192us;
>  	ret = lp8788_write_byte(bl->lp, LP8788_BL_RAMP, val);
>  	if (ret)
>  		return ret;
>
>  	/* Fullscale current setting */
> -	val = (cfg->full_scale << LP8788_BL_FULLSCALE_SHIFT) |
> -		(cfg->dim_mode << LP8788_BL_DIM_MODE_SHIFT);
> +	val = (LP8788_FULLSCALE_1900uA << LP8788_BL_FULLSCALE_SHIFT) |
> +		(LP8788_DIM_EXPONENTIAL << LP8788_BL_DIM_MODE_SHIFT);
>
>  	/* Brightness control mode */
> -	switch (cfg->bl_mode) {
> -	case LP8788_BL_REGISTER_ONLY:
> -		val |= LP8788_BL_EN;
> -		break;
> -	case LP8788_BL_COMB_PWM_BASED:
> -	case LP8788_BL_COMB_REGISTER_BASED:
> -		val |= LP8788_BL_EN | LP8788_BL_PWM_INPUT_EN |
> -			(cfg->pwm_pol << LP8788_BL_PWM_POLARITY_SHIFT);
> -		break;
> -	default:
> -		dev_err(bl->lp->dev, "invalid mode: %d\n", cfg->bl_mode);
> -		return -EINVAL;
> -	}
> -
> -	bl->mode = cfg->bl_mode;
> +	val |= LP8788_BL_EN;
>
>  	return lp8788_write_byte(bl->lp, LP8788_BL_CONFIG, val);
>  }
>
> -static void lp8788_pwm_ctrl(struct lp8788_bl *bl, int br, int max_br)
> -{
> -	unsigned int period;
> -	unsigned int duty;
> -	struct device *dev;
> -	struct pwm_device *pwm;
> -
> -	if (!bl->pdata)
> -		return;
> -
> -	period = bl->pdata->period_ns;
> -	duty = br * period / max_br;
> -	dev = bl->lp->dev;
> -
> -	/* request PWM device with the consumer name */
> -	if (!bl->pwm) {
> -		pwm = devm_pwm_get(dev, LP8788_DEV_BACKLIGHT);
> -		if (IS_ERR(pwm)) {
> -			dev_err(dev, "can not get PWM device\n");
> -			return;
> -		}
> -
> -		bl->pwm = pwm;
> -
> -		/*
> -		 * FIXME: pwm_apply_args() should be removed when switching to
> -		 * the atomic PWM API.
> -		 */
> -		pwm_apply_args(pwm);
> -	}
> -
> -	pwm_config(bl->pwm, duty, period);
> -	if (duty)
> -		pwm_enable(bl->pwm);
> -	else
> -		pwm_disable(bl->pwm);
> -}
> -
>  static int lp8788_bl_update_status(struct backlight_device *bl_dev)
>  {
>  	struct lp8788_bl *bl = bl_get_data(bl_dev);
> -	enum lp8788_bl_ctrl_mode mode = bl->mode;
>
>  	if (bl_dev->props.state & BL_CORE_SUSPENDED)
>  		bl_dev->props.brightness = 0;
>
> -	if (is_brightness_ctrl_by_pwm(mode)) {
> -		int brt = bl_dev->props.brightness;
> -		int max = bl_dev->props.max_brightness;
> -
> -		lp8788_pwm_ctrl(bl, brt, max);
> -	} else if (is_brightness_ctrl_by_register(mode)) {
> -		u8 brt = bl_dev->props.brightness;
> -
> -		lp8788_write_byte(bl->lp, LP8788_BL_BRIGHTNESS, brt);
> -	}
> +	lp8788_write_byte(bl->lp, LP8788_BL_BRIGHTNESS, bl_dev->props.brightness);
>
>  	return 0;
>  }
> @@ -187,29 +77,15 @@ static int lp8788_backlight_register(struct lp8788_bl *bl)
>  {
>  	struct backlight_device *bl_dev;
>  	struct backlight_properties props;
> -	struct lp8788_backlight_platform_data *pdata = bl->pdata;
> -	int init_brt;
> -	char *name;
>
>  	props.type = BACKLIGHT_PLATFORM;
>  	props.max_brightness = MAX_BRIGHTNESS;
>
>  	/* Initial brightness */
> -	if (pdata)
> -		init_brt = min_t(int, pdata->initial_brightness,
> -				props.max_brightness);
> -	else
> -		init_brt = 0;
> -
> -	props.brightness = init_brt;
> +	props.brightness = 0;
>
>  	/* Backlight device name */
> -	if (!pdata || !pdata->name)
> -		name = DEFAULT_BL_NAME;
> -	else
> -		name = pdata->name;
> -
> -	bl_dev = backlight_device_register(name, bl->lp->dev, bl,
> +	bl_dev = backlight_device_register(DEFAULT_BL_NAME, bl->lp->dev, bl,
>  				       &lp8788_bl_ops, &props);
>  	if (IS_ERR(bl_dev))
>  		return PTR_ERR(bl_dev);
> @@ -229,16 +105,7 @@ static void lp8788_backlight_unregister(struct lp8788_bl *bl)
>  static ssize_t lp8788_get_bl_ctl_mode(struct device *dev,
>  				     struct device_attribute *attr, char *buf)
>  {
> -	struct lp8788_bl *bl = dev_get_drvdata(dev);
> -	enum lp8788_bl_ctrl_mode mode = bl->mode;
> -	char *strmode;
> -
> -	if (is_brightness_ctrl_by_pwm(mode))
> -		strmode = "PWM based";
> -	else if (is_brightness_ctrl_by_register(mode))
> -		strmode = "Register based";
> -	else
> -		strmode = "Invalid mode";
> +	const char *strmode = "Register based";
>
>  	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
>  }
> @@ -265,8 +132,6 @@ static int lp8788_backlight_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	bl->lp = lp;
> -	if (lp->pdata)
> -		bl->pdata = lp->pdata->bl_pdata;
>
>  	platform_set_drvdata(pdev, bl);
>
> diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
> index 3d5c480d58ea..46d8fa779134 100644
> --- a/include/linux/mfd/lp8788.h
> +++ b/include/linux/mfd/lp8788.h
> @@ -12,7 +12,6 @@
>
>  #include <linux/gpio.h>
>  #include <linux/irqdomain.h>
> -#include <linux/pwm.h>
>  #include <linux/regmap.h>
>
>  #define LP8788_DEV_BUCK		"lp8788-buck"
> @@ -88,12 +87,6 @@ enum lp8788_charger_event {
>  	CHARGER_DETECTED,
>  };
>
> -enum lp8788_bl_ctrl_mode {
> -	LP8788_BL_REGISTER_ONLY,
> -	LP8788_BL_COMB_PWM_BASED,	/* PWM + I2C, changed by PWM input */
> -	LP8788_BL_COMB_REGISTER_BASED,	/* PWM + I2C, changed by I2C */
> -};
> -
>  enum lp8788_bl_dim_mode {
>  	LP8788_DIM_EXPONENTIAL,
>  	LP8788_DIM_LINEAR,
> @@ -206,31 +199,6 @@ struct lp8788_charger_platform_data {
>  				enum lp8788_charger_event event);
>  };
>
> -/*
> - * struct lp8788_backlight_platform_data
> - * @name                  : backlight driver name. (default: "lcd-backlight")
> - * @initial_brightness    : initial value of backlight brightness
> - * @bl_mode               : brightness control by pwm or lp8788 register
> - * @dim_mode              : dimming mode selection
> - * @full_scale            : full scale current setting
> - * @rise_time             : brightness ramp up step time
> - * @fall_time             : brightness ramp down step time
> - * @pwm_pol               : pwm polarity setting when bl_mode is pwm based
> - * @period_ns             : platform specific pwm period value. unit is nano.
> -			    Only valid when bl_mode is LP8788_BL_COMB_PWM_BASED
> - */
> -struct lp8788_backlight_platform_data {
> -	char *name;
> -	int initial_brightness;
> -	enum lp8788_bl_ctrl_mode bl_mode;
> -	enum lp8788_bl_dim_mode dim_mode;
> -	enum lp8788_bl_full_scale_current full_scale;
> -	enum lp8788_bl_ramp_step rise_time;
> -	enum lp8788_bl_ramp_step fall_time;
> -	enum pwm_polarity pwm_pol;
> -	unsigned int period_ns;
> -};
> -
>  /*
>   * struct lp8788_led_platform_data
>   * @name         : led driver name. (default: "keyboard-backlight")
> @@ -272,7 +240,6 @@ struct lp8788_vib_platform_data {
>   * @buck2_dvs    : gpio configurations for buck2 dvs
>   * @chg_pdata    : platform data for charger driver
>   * @alarm_sel    : rtc alarm selection (1 or 2)
> - * @bl_pdata     : configurable data for backlight driver
>   * @led_pdata    : configurable data for led driver
>   * @vib_pdata    : configurable data for vibrator driver
>   * @adc_pdata    : iio map data for adc driver
> @@ -294,9 +261,6 @@ struct lp8788_platform_data {
>  	/* rtc alarm */
>  	enum lp8788_alarm_sel alarm_sel;
>
> -	/* backlight */
> -	struct lp8788_backlight_platform_data *bl_pdata;
> -
>  	/* current sinks */
>  	struct lp8788_led_platform_data *led_pdata;
>  	struct lp8788_vib_platform_data *vib_pdata;
>
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> --
> 2.43.0
>
