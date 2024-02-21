Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0185D6AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 12:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF63910E58C;
	Wed, 21 Feb 2024 11:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J7NujKEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49510E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:20:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4127706e48cso2806695e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708514409; x=1709119209; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3IS7GmUQyf4Yyr+5gHh+d/StyGrTtVUVJakHsBQ6JDE=;
 b=J7NujKEWnhp+34qZd5gQtxnHE+0sshdlBGFu8xL0zwvLG4l4X+2np6g+qTTG/HwSQt
 dQ/d29al0eplOSJ/IA1LHVu9KgkA9BPfXbsiO+vmuUYGNC3iY5BwH5moc2i0bbQ9TXJT
 2ysXRtxy5VFO1ZYYgze4N0mD9Fj63u9R6kWVaNJMTZqGNuh0D5StwZ8hiazc9/tgjvO5
 Y2Iz9ntTGKpiT3EK8JY+cB2vV23skxpsN3CGTRMQEIWnyiHX5h8DUKUJx9Q/9fMtFSpa
 wsoc2gENEsrcmhtehu2sHFWujY0lJ0NVhHmqao9/CdHgPVrqyUSvgF4M8pmwTnZqbvnz
 kPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708514409; x=1709119209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IS7GmUQyf4Yyr+5gHh+d/StyGrTtVUVJakHsBQ6JDE=;
 b=l51dW/nbTahrZJR8oPTR5fdoRMBqkXpWeVPUCxkQoyRHmND1lZB29MjLESnq9GAQWN
 /PexWAg/0+57inxtwh6KCeT61fhgyZO7M6Y8L/4BiagB4v5IaTJJDmIVtUDAyoXyCynO
 UM8NreNbBlBmh3BUy4vo5V6ERI4c122OE4Qtc6VmggbauHFf8bzyGySjxOWBGEKHspQf
 +gFfHJypP+96JWFiERbFIUarc+1exPdJ78sik7YkM+paeWLePf6cLe5P7luYBwTQm3Tu
 O0pO16K25fxepEpuErCkBizF44V+z48MPUlZjnYKhG5e2EMYMrl7nNYr5xAHtGlQRvb9
 44Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWbMPVTj+3LuEsCiKBfk8wPzx13QV0YNrc1y5OA/qioSnCcuUADY9+11y80RE9AsWaITeWzYuxEVukghqOUD7KEP+i7aFZiuli4eO39GyN
X-Gm-Message-State: AOJu0YzcueJG8+j9mFg+FLZ0Hek/f6ZHX0cpMpWYemt1WI8RSB6z9YsO
 WRZ1fAmkSNfrs2Ccw6jWktCcTkjN/8QBNLqfYDL9d1q3AMEI7PxwBOvwuudxPvQ=
X-Google-Smtp-Source: AGHT+IFiJJDtB9EWh/YWcgzszDlU4x8SjMxMWN9afl/QitAi2hghHKAv2cmSNEg07ItVMniNr+hMeA==
X-Received: by 2002:a05:6000:1841:b0:33d:839b:113b with SMTP id
 c1-20020a056000184100b0033d839b113bmr630280wri.15.1708514409453; 
 Wed, 21 Feb 2024 03:20:09 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bn7-20020a056000060700b0033d3ff1cb67sm11304851wrb.66.2024.02.21.03.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 03:20:09 -0800 (PST)
Date: Wed, 21 Feb 2024 11:20:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: lm3630a: Use backlight_get_brightness
 helper in update_status
Message-ID: <20240221112007.GJ6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
 <20240220141107.GF6716@aspen.lan> <5027630.31r3eYUQgx@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5027630.31r3eYUQgx@g550jk>
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

On Tue, Feb 20, 2024 at 05:43:32PM +0100, Luca Weiss wrote:
> On Dienstag, 20. Februar 2024 15:11:07 CET Daniel Thompson wrote:
> > On Tue, Feb 20, 2024 at 12:11:21AM +0100, Luca Weiss wrote:
> > > As per documentation "drivers are expected to use this function in their
> > > update_status() operation to get the brightness value.".
> > >
> > > With this we can also drop the manual backlight_is_blank() handling
> > > since backlight_get_brightness() is already handling this correctly.
> > >
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > However...
> >
> > > ---
> > >  	/* disable sleep */
> > > @@ -201,9 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
> > >  		goto out_i2c_err;
> > >  	usleep_range(1000, 2000);
> > >  	/* minimum brightness is 0x04 */
> > > -	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
> > > +	ret = lm3630a_write(pchip, REG_BRT_A, brightness);
> >
> > ... then handling of the minimum brightness looks weird in this driver.
> >
> > The range of the backlight is 0..max_brightness. Sadly the drivers
> > are inconsistant regarding whether zero means off or just minimum,
> > however three certainly isn't supposed to mean off! In other words the
> > offsetting should be handled by driver rather than hoping userspace has
> > some magic LM3630A mode.
>
> I could also try and fix that..
>
> 1. Treat 1..4 as 4, so have backlight on at that minimum level? Probably
> wouldn't be noticable that brightness 1=2=3=4. And the backlight will be
> on compared to off as it is now.
>
> 2. Decrease max_brightness by 4 values, so probably 0..251 and shift the
> values up in the driver so we get 4..255?
>
> Or would you have some other idea here?

I think #2 is the right option but shouldn't it be decrease max_brightness
by 3, yielding 0..252 .

Only nitpicking on that because, given how old this driver is I'd like
to be conservative. I don't expect there to be userspaces with magic
LM3630A modes but there could be some that assume #0 is off! Hence I
wanted to make sure we are on the same page.


Daniel.
