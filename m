Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821637334BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFDD10E666;
	Fri, 16 Jun 2023 15:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657010E5C8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 15:29:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso1194656e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686929351; x=1689521351;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VeValyIzucrvcdVSMQeHHxyyygnInnDMzRn1T9fpOHo=;
 b=end5jpdjZlV6qafEDB7eSX+jg2bgePpVQoUMEvCdMs4hreRxXDJTk90OlYoNQQtlhe
 5WCLJCE+vW1emiDxw7J0yYxnPgN5ep/mo9Z1f0x9Mkle1kUegaX+vxNtqgCy2d6EAacZ
 VhGavcOJW24CkWuorxUkYU9MSDr0sYAuXKRqOnMXgglwd9KcDOdel7C854kZS4SZk4nv
 T/B7lnyv/xJ8m6EpHkhdY/flhM5ZCMKLzYjTRvRa0mcc5R88sr5jF+dwLmDci+q4QbNC
 QiDBOULejPo+aUUzTp54oqD4H7vp8c9zcScMR9wQSkscXM/gg1WnNtTbp4tzNzvTjlih
 dkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686929351; x=1689521351;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VeValyIzucrvcdVSMQeHHxyyygnInnDMzRn1T9fpOHo=;
 b=Tn/SLmjUmKbTij3mrRITckmKdad1L07LUI8/UOY18ikwtL6W+T5T19BrPb2zkyAYnM
 zWlXp3899G5Y9BwAcK+ZSZPDoh8G9XOQ10azB5zT1lWrR+kh2BuInimSeKWVPqh+6DQh
 Fgx6N4/9Nc3n+Tz9CUnxDOupGdDrUz2rfJ914dpSIVR7Bs0HY2WhmjxM6onSJeYXMd/N
 F5fJRWABCQez+JqMjzDO61XCZb4GpWwzssqNklyscwVZP1yJJi/8kdsda7KiexoulJpg
 3eJyPIFxX3GdHzUaat3I1/1Wa7in2/4YZOGm4De7VVfbgZXKvRjP25/BGNqdVLyZ9DzE
 9CZw==
X-Gm-Message-State: AC+VfDx7uMGFYkAXEItG3ASpvqwsuSFX9kvPMxtx1NTk/nr5ihRGuBEy
 r4AFWmyao6S77we1Yd6PjC4=
X-Google-Smtp-Source: ACHHUZ7lf6ZCg92WrS5N6WhJIVm8cZsqXmc9I3KGq/I3Ihg88kzzkPbjfTiefkPlMFqImG6X9xUaFA==
X-Received: by 2002:a05:6512:60a:b0:4f8:560e:f4d8 with SMTP id
 b10-20020a056512060a00b004f8560ef4d8mr1585656lfe.6.1686929351105; 
 Fri, 16 Jun 2023 08:29:11 -0700 (PDT)
Received: from [192.168.50.244] (83.8.116.77.ipv4.supernova.orange.pl.
 [83.8.116.77]) by smtp.gmail.com with ESMTPSA id
 d13-20020aa7d5cd000000b00510d110db58sm10019513eds.80.2023.06.16.08.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 08:29:10 -0700 (PDT)
Message-ID: <23f9f004-3e20-67b0-bddc-ab9700968c53@gmail.com>
Date: Fri, 16 Jun 2023 17:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 2/4] video: backlight: lp855x: get PWM for PWM mode during
 probe
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
 <20230429104534.28943-3-aweber.kernel@gmail.com>
 <20230614083953.e4kkweddjz7wztby@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20230614083953.e4kkweddjz7wztby@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 10:39, Uwe Kleine-König wrote:
> On Sat, Apr 29, 2023 at 12:45:32PM +0200, Artur Weber wrote:
>> Also deprecate the pwm-period DT property, as it is now redundant
>> (pwms property already contains period value).
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
>>  drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
>>  1 file changed, 26 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
>> index 81012bf29baf..21eb4943ed56 100644
>> --- a/drivers/video/backlight/lp855x_bl.c
>> +++ b/drivers/video/backlight/lp855x_bl.c
>> ...
>> @@ -472,11 +456,31 @@ static int lp855x_probe(struct i2c_client *cl)
>>  	lp->enable = devm_regulator_get_optional(dev, "enable");
>>  	if (IS_ERR(lp->enable)) {
>>  		ret = PTR_ERR(lp->enable);
>> -		if (ret == -ENODEV) {
>> +		if (ret == -ENODEV)
>>  			lp->enable = NULL;
>> -		} else {
>> +		else
>>  			return dev_err_probe(dev, ret, "getting enable regulator\n");
>> -		}
>> +	}
>> +
>> +	lp->pwm = devm_pwm_get(lp->dev, lp->chipname);
>> +	if (IS_ERR(lp->pwm)) {
>> +		ret = PTR_ERR(lp->pwm);
>> +		if (ret == -ENODEV || ret == -EINVAL)
> 
> Why would you ignore EINVAL?

EINVAL is returned when the pwms property is not found in the DT node
for the backlight. Not sure if there's a better way of separately
detecting whether it's present (especially when taking into
consideration non-DT platforms that might use the driver). Would be nice
to have something like devm_regulator_get_optional but for PWMs...

Still, someone who's setting up the driver could check the debug
messages to see if the backlight was set up in PWM mode or register mode.

> ...
>> +		pwm_init_state(lp->pwm, &pwmstate);
>> +		/* Legacy platform data compatibility */
>> +		if (lp->pdata->period_ns > 0)
>> +			pwmstate.period = lp->pdata->period_ns;
>> +		pwm_apply_state(lp->pwm, &pwmstate);
> 
> This is a change in behaviour. Before lp855x_probe() didn't modify the
> state the bootloader left the backlight in. Now you're disabling it (I
> think). Is this intended?

I didn't really consider the implication of this in this way, as on the
device I was testing this on (Exynos4212-based tablet) the PWM state
would get reset during PWM chip initialization in the kernel anyways,
meaning that the state from the bootloader would be lost regardless of
this change. Either way, there's no guarantee that this would be the
same on other devices, though I'd assume that in most cases it's not
noticeable anyways as brightness is usually set somewhere in userspace
(or even earlier, in the driver, if the init-brt property is set).
Nonetheless, that's an oversight on my part.

As for the reasoning for this change in behavior - the previous behavior
was to silently fail if, while setting the brightness, the PWM could not
be set up. This seemed rather confusing to me (I encountered this while
I was initially working on the tablet, I added a "pwm" property instead
of "pwms" and was wondering why the backlight didn't work...)

Of course, that could be fixed by adding error detection in the
brightness set function, but since I was already working on it, it made
more sense to me for the PWM to be set up during the probing process,
given that this way we could 1. warn about errors early, and 2. catch
deferred probes and defer the backlight's probe if we're still waiting
for the PWM. That's why it's done the way it is in this patch.

If this is undesired behavior, let me know and I'll submit another patch
to revert it.

Best regards
Artur
