Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C166FA47E8D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 14:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2EB10E1C1;
	Thu, 27 Feb 2025 13:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FvPPQpgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602C10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:07:26 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5e08064b4ddso1106679a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740661645; x=1741266445; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JTyMrNqruIfN80FNenPnWbn1JyAg6VWCPasiwyXp9FI=;
 b=FvPPQpgvOSWOZ3tjaW5fNEqBleDlAYFCQK5ijmD1y3DMSrKuVGKBPfmq94v12HK4xt
 Hfj8QHIDiZh2B7x4k9U0yEfJxmAhVIDstMQQxuCFwrniItPq3PjjWu3gfT8lF1aTv0i/
 ZlPMDVOJcLazp8Ks3/R7pI/oG5WM17vstxy+4WPYjyZM/zbB81FaIoVSShLI3eucQ3PR
 kfc31yAQbMN1eNDnKJCHrAWW4UStm41UA97GpwdPQ6aCNpdEN4MgZm2vEObWRSqGdCIP
 dvWfMYHTimb/ZzMi6bzobiXgK9Nhiqqk7qWRTmXtFK8++4JSSN9dF77iLazzj5TGXNjL
 R1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740661645; x=1741266445;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTyMrNqruIfN80FNenPnWbn1JyAg6VWCPasiwyXp9FI=;
 b=nAhzE8zyiqoXkiMjMmmWUm2gnhPiZ1GFKg/BzVOf6J46XqbFcolEkWCy+iBEcQztYL
 L4AEkfHiz9ErGmZeyxndsnLm8873dqNkkKPJV5wBV5nxh6fuK5W9FIYZOVSK54/jV5XJ
 lnx0qafgYaR8q/ngTO2XRLIkpmttc5KtZrEVO0NGCVAAE8dNTb23Ra5jBfh7lmiifDcQ
 A5tJW9T/L2H2i0PrRzPjK7cnOuG1rOiYZn5H9NIrvju8P3nLytpfCj/SGC7gdNWwYkQj
 AWsTN49mSdKJH6pV9dFS3Kmez8MeUedNLrts4q8LqlNzb49zgE0yqAeNqiOoOBvtONy7
 9oVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXspnJWvyeQd38Pzii0hhLI53czpXLi87VzxghClu7cLfOX5L0QyLTjlpEa0kQ/gb+MH6rlzFh+JbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXR92YhzC9cD9igmgMiIxmvlE1mQHZrsR8mv9rfvvDh/A9iJEn
 wGMkUwkVPun8Al+aeNP2dntHejhDHE8Gk3VSS19cNl9dMXMwp6x5Vfiicfa5Y3E=
X-Gm-Gg: ASbGnctZ0VWVSpsQrS2LWvoBb2qy2qw9VkAbXKBq3AzlpPQaFBjFw6MnMsSmLzGkGXA
 Bb1He0Nbh8wSTYOm6002SNlnaWQ+u1eeFAkrvQF99TQasztEOPK/NKAhBBhCtL37Q5zZrZW3OwK
 dcAYa1F7vw4+7La4d444e+efTK8+ZF1VB7UcHGKLCsojlTMrCZjJYcAghfA4Ef971F1EBQEyPXn
 LXK35YBmxS/Ve1VElyKPTtRwcQdx23RkfeVmLwf6XFpe9XPRei+BeJzu6ndoBVWfy8cYFRwRH9c
 bGMFjMssxo4cirXgoG+JMUs=
X-Google-Smtp-Source: AGHT+IGjfWHYiaAXdrqA594SKctf+/MPGNFwOKZ2m/oLfiL1GNAvt9xOlxqJ0+a9h6IWKjELe4604Q==
X-Received: by 2002:a05:6402:2b86:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5e0b70dc05emr25956467a12.11.1740661645077; 
 Thu, 27 Feb 2025 05:07:25 -0800 (PST)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c43a6ab7sm1071222a12.74.2025.02.27.05.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:07:24 -0800 (PST)
Date: Thu, 27 Feb 2025 15:07:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <Z8BjiRjLin8jTE8j@linaro.org>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
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

On 25-02-26 17:34:50, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > The current implementation assumes that the PWM provider will be able to
> > meet the requested period, but that is not always the case. Some PWM
> > providers have limited HW configuration capabilities and can only
> > provide a period that is somewhat close to the requested one. This
> > simply means that the duty cycle requested might either be above the
> > PWM's maximum value or the 100% duty cycle is never reached.
> 
> If you request a state with 100% relative duty cycle you should get 100%
> unless the hardware cannot do that. Which PWM hardware are you using?
> Which requests are you actually doing that don't match your expectation?

The PWM hardware is Qualcomm PMK8550 PMIC. The way the duty cycle is
controlled is described in the following comment found in lpg_calc_freq
of the leds-qcom-lpg driver:

/*
 * The PWM period is determined by:
 *
 *          resolution * pre_div * 2^M
 * period = --------------------------
 *                   refclk
 *
 * Resolution = 2^9 bits for PWM or
 *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution PWM
 * pre_div = {1, 3, 5, 6} and
 * M = [0..7].
 *
 * This allows for periods between 27uS and 384s for PWM channels and periods between
 * 3uS and 24576s for high resolution PWMs.
 * The PWM framework wants a period of equal or lower length than requested,
 * reject anything below minimum period.
 */

So if we request a period of 5MHz, that will not ever be reached no matter what config
is used. Instead, the 4.26 MHz is selected as closest possible.

Now, the pwm_bl is not aware of this limitation and will request duty cycle values that
go above 4.26MHz.

>  
> > This could be easily fixed if the pwm_apply*() API family would allow
> > overriding the period within the PWM state that's used for providing the
> > duty cycle. But that is currently not the case.
> 
> I don't understand what you mean here.

What I was trying to say is that the PWM generic framework currently doesn't
allow overriding the PWM state's period with one provided by the consumer,
when calling pwm_apply_might_sleep().

Also, the pwm_get_state_hw() doesn't cache the state either.

This results in always having to call pwm_get_state_hw() before calling
pwm_apply_might_sleep().

On top of that, pwm_get_state_hw() doesn't default to the cached value if the
provider doesn't implement the ->get_state() op.

Please correct me if I'm wrong about these.

> 
> > So easiest fix here is to read back the period from the PWM provider via
> > the provider's ->get_state() op, if implemented, which should provide the
> > best matched period. Do this on probe after the first ->pwm_apply() op has
> > been done, which will allow the provider to determine the best match
> > period based on available configuration knobs. From there on, the
> > backlight will use the best matched period, since the driver's internal
> > PWM state is now synced up with the one from provider.
> > [...]
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01b194d7466978f1ca78e 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >  		goto err_alloc;
> >  	}
> >  
> > +	/*
> > +	 * The actual period might differ from the requested one due to HW
> > +	 * limitations, so sync up the period with one determined by the
> > +	 * provider driver.
> > +	 */
> > +	ret = pwm_get_state_hw(pb->pwm, &pb->pwm->state);
> 
> As a consumer you're not supposed to write to &pb->pwm->state. That's a
> layer violation. Please call pwm_get_state_hw() with a struct pwm_state
> that you own and save the relevant parts in your driver data.

Yep, that is indeed wrong. Maybe making the pwm opaque might be a good idea as well.

[1] Calling pwm_get_state_hw() would be wrong if the provider doesn't implement the ->get_state(),
as I mentioned above.

But are you suggesting we replace all calls to pwm_get_state() with
pwm_get_state_hw() in pwm_bl?

I can do that, but the concern from [1] still stands.

> 
> > +	if (ret && ret != -EOPNOTSUPP) {
> > +		dev_err(&pdev->dev, "failed to get PWM HW state");
> > +		goto err_alloc;
> > +	}
> > +
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> >  
> >  	if (data->levels) {
> 
> Best regards
> Uwe

Thanks for reviewing,
Abel
