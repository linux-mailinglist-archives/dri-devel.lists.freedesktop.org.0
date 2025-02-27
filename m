Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A97A485B0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9405610EB35;
	Thu, 27 Feb 2025 16:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yssE5Xx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AADB10EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 16:50:43 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-abb86beea8cso212685766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675042; x=1741279842; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U9B6UFKW6QmOND+nqqfJHYUB8wm1gr52tPG9pQzTZMI=;
 b=yssE5Xx48KwxIpf1GS04UYApaUrsscNrCXf501G/m/5hDLqoB67fYnLGFmJ7k3D4Zb
 0rStmK0W/eVBNpTo/nmluzburl+JO53GV0Gax2BqJBp//Z8fwUjNd1GxG2HqEG0pIJSw
 zHHSpsTESX8OIPba0HhKPMQnFQ6OOQy+nODtWRwaP5hOrzdiSaRkeNDyT+ka9+VfIiU2
 4WBV4DRoci+/jI2eST9dV7wXf0mJP3jwtNHs5CJQgH/b5bmMOnkypEjUpJnNbg5Kkvj1
 7DskBVEZYmmlr+b6Lbgp4DFPczgaAsQbfDXf6irpNA9NixGygX5pjWm67TVU5vVhqoD/
 CVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675042; x=1741279842;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U9B6UFKW6QmOND+nqqfJHYUB8wm1gr52tPG9pQzTZMI=;
 b=cZXwuzyIYF+zrln8Mu4c3pwKEanfkd3eO2HBa/gPbhEmePyajl414CruNXMeyrbDvh
 ZWTBrvUOmXkeK8188hOkST4L+z++IteJtrVQX7EnBeU6n65KpiUbmKgfYlbnH9zZkK8b
 qhihXJ7bmY26yx/oGaVdtYhZUBqyybCxd+kI4CKhcznVhqwQCVHDMEXbXmS0raI0lXEp
 QlARqk2N2FGP1VNCaRA6BuXmvfJgDweLqn/o0J8cqWVnhqejzl3um4Lt/EqY/Hv/iKZg
 uI2iDtYmoeTI/8UmdjHLS5BtsfStZGKxXROloZRhoM+Vrcy+C+CWExPHP9oPn4RuCaOh
 dOJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjNIYo4XvQXSiVOh4AOQlCgz9kOWyUJN9/dVh8SOquGpNWDl27p7pG2GkUsL9UGXfW+TjvrliReY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIoLsJ1JLaysKjITYr9ocSXN+hOVYw3f5U7a4o9ys5M51mbGqg
 QbasvQhR2J9lsSvOpf1k52nvopfPW280RlVx9IWa5Lge+YslAs1UnbiW4KzGnE8=
X-Gm-Gg: ASbGncssvIL5NGrd8hC+8qN55crRqLvDvmS+ANyRLYBNaTLBrLevpRMhdpY+LCrPSxm
 lTJtq0LPemNi7TlED8YWsGUiS3UHOglnAzHBcIAXriut6HDp68s1JYWHisKFCWjD4oBbhkZ/SUx
 iYuV3RScTegB0C+jxpONKAn9yVFJopr95MpxG/FeXXoLr6TXqBBoRFBU9yxlevI1fz2ZZc8bNhI
 j3yAjIil8KlM7GyqnXT+9uRmzap3Lvzyj44aJHF7pMcGHKbeYDNkBE/N7kOiGbnBzdwffUMzN5/
 UIV4w+1B0pZt1fZRw8iqzZg=
X-Google-Smtp-Source: AGHT+IGfoZwgSLt/LlIZbdRYkcSEc5pTARTCn2VKVHoHQpdHvHilVJZaKDcCop6xnuShR5HL0iFVCQ==
X-Received: by 2002:a17:907:7f0a:b0:abb:aef3:6052 with SMTP id
 a640c23a62f3a-abf26838238mr11726366b.55.1740675041559; 
 Thu, 27 Feb 2025 08:50:41 -0800 (PST)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0ba408sm149482266b.37.2025.02.27.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:50:39 -0800 (PST)
Date: Thu, 27 Feb 2025 18:50:38 +0200
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
Message-ID: <Z8CX3vr1xuaKT38m@linaro.org>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
 <Z8BjiRjLin8jTE8j@linaro.org>
 <rplq65h5k7kfu7anwhuh3w6lmwtm47lzeruofon4ilsxkhogjl@6k7nmeotjidd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rplq65h5k7kfu7anwhuh3w6lmwtm47lzeruofon4ilsxkhogjl@6k7nmeotjidd>
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

On 25-02-27 16:51:15, Uwe Kleine-König wrote:
> Hello Abel,
> 
> On Thu, Feb 27, 2025 at 03:07:21PM +0200, Abel Vesa wrote:
> > On 25-02-26 17:34:50, Uwe Kleine-König wrote:
> > > On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > > > The current implementation assumes that the PWM provider will be able to
> > > > meet the requested period, but that is not always the case. Some PWM
> > > > providers have limited HW configuration capabilities and can only
> > > > provide a period that is somewhat close to the requested one. This
> > > > simply means that the duty cycle requested might either be above the
> > > > PWM's maximum value or the 100% duty cycle is never reached.
> > > 
> > > If you request a state with 100% relative duty cycle you should get 100%
> > > unless the hardware cannot do that. Which PWM hardware are you using?
> > > Which requests are you actually doing that don't match your expectation?
> > 
> > The PWM hardware is Qualcomm PMK8550 PMIC. The way the duty cycle is
> > controlled is described in the following comment found in lpg_calc_freq
> > of the leds-qcom-lpg driver:
> > 
> > /*
> >  * The PWM period is determined by:
> >  *
> >  *          resolution * pre_div * 2^M
> >  * period = --------------------------
> >  *                   refclk
> >  *
> >  * Resolution = 2^9 bits for PWM or
> >  *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution PWM
> >  * pre_div = {1, 3, 5, 6} and
> >  * M = [0..7].
> >  *
> >  * This allows for periods between 27uS and 384s for PWM channels and periods between
> >  * 3uS and 24576s for high resolution PWMs.
> >  * The PWM framework wants a period of equal or lower length than requested,
> >  * reject anything below minimum period.
> >  */
> > 
> > So if we request a period of 5MHz, that will not ever be reached no matter what config
> > is used. Instead, the 4.26 MHz is selected as closest possible.
> 
> The trace in the other mail thread suggest that you asked for a period
> of 5 ms, not 5 MHz. And that results in a period of 4.26 ms.

OK. So unit is ms. Got it.

> 
> > Now, the pwm_bl is not aware of this limitation and will request duty cycle values that
> > go above 4.26MHz.
> 
> It requests .period = 5 ms + .duty_cycle = 5 ms. This is fine, and
> according to the trace this results in both values becoming 4.26 ms in
> real life. Seems fine to me.

Right, but as I keep trying to explain is that, the consumer keeps
asking for duty cycles that go over the 4.26ms, which is the period that
the provider decided it can do instead of 5ms.

> 
> > > > This could be easily fixed if the pwm_apply*() API family would allow
> > > > overriding the period within the PWM state that's used for providing the
> > > > duty cycle. But that is currently not the case.
> > > 
> > > I don't understand what you mean here.
> > 
> > What I was trying to say is that the PWM generic framework currently doesn't
> > allow overriding the PWM state's period with one provided by the consumer,
> > when calling pwm_apply_might_sleep().
> 
> Either I still don't understand what you want, or that is impossible or
> useless. If you target .period = 5 ms and the hardware can only do 4.26
> ms, why would you want to override period to 5 ms?

Meaning the consumer should become aware of the period the provider can
do before asking for a duty cycle. 

If you look at the other mail thread, the trace there shows the
following sequence for every new backlight update request:

1. pwm_apply with consumer's period (5ms)
2. pwm_get reads the provider's period (4.25ms) 
   - which is what the provider is able to do instead of 5ms
3. pwm_apply (due to debug) which uses the state from 2.
4. pwm_get reads back exactly as 2.

So we can ignore 3 and 4 for now as they are there due to debug,
but the step 1 still requests a value over the 4.26ms (5ms),
which in the provider will translate to a pwm value higher than allowed
by the selected configuration.

> 
> > Also, the pwm_get_state_hw() doesn't cache the state either.
> 
> *shrug*.
> 
> > This results in always having to call pwm_get_state_hw() before calling
> > pwm_apply_might_sleep().
> 
> I cannot follow this conclusion. At least one of us two didn't
> understand some detail yet.
> 
> > On top of that, pwm_get_state_hw() doesn't default to the cached value if the
> > provider doesn't implement the ->get_state() op.
> 
> If it did that, the consumer wouldn't know if the request was
> implemented exactly or if there is no way to read back the actual
> configuration.
> 
> > Please correct me if I'm wrong about these.
> > 
> > > 
> > > > So easiest fix here is to read back the period from the PWM provider via
> > > > the provider's ->get_state() op, if implemented, which should provide the
> > > > best matched period. Do this on probe after the first ->pwm_apply() op has
> > > > been done, which will allow the provider to determine the best match
> > > > period based on available configuration knobs. From there on, the
> > > > backlight will use the best matched period, since the driver's internal
> > > > PWM state is now synced up with the one from provider.
> > > > [...]
> > > > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > > > index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01b194d7466978f1ca78e 100644
> > > > --- a/drivers/video/backlight/pwm_bl.c
> > > > +++ b/drivers/video/backlight/pwm_bl.c
> > > > @@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> > > >  		goto err_alloc;
> > > >  	}
> > > >  
> > > > +	/*
> > > > +	 * The actual period might differ from the requested one due to HW
> > > > +	 * limitations, so sync up the period with one determined by the
> > > > +	 * provider driver.
> > > > +	 */
> > > > +	ret = pwm_get_state_hw(pb->pwm, &pb->pwm->state);
> > > 
> > > As a consumer you're not supposed to write to &pb->pwm->state. That's a
> > > layer violation. Please call pwm_get_state_hw() with a struct pwm_state
> > > that you own and save the relevant parts in your driver data.
> > 
> > Yep, that is indeed wrong. Maybe making the pwm opaque might be a good idea as well.
> > 
> > [1] Calling pwm_get_state_hw() would be wrong if the provider doesn't implement the ->get_state(),
> > as I mentioned above.
> > 
> > But are you suggesting we replace all calls to pwm_get_state() with
> > pwm_get_state_hw() in pwm_bl?
> 
> No, I still didn't understand the problem you want to fix here. So I'm
> not suggesting anything yet.
>  
> Best regards
> Uwe


