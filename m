Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB6836BC8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99F610E533;
	Mon, 22 Jan 2024 16:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313BC10E533
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:51:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so40864315e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 08:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705942213; x=1706547013; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U2u02dHyzXh8Z7GhixGdPG0+iHyMzaUZy8vA0Gln640=;
 b=Ia0ohBP/IJZFZw+6VhDGUQxMBtfu3Y96L5LugPVfnBiW1LwtNb1ABk3VShlsZTgoh2
 BP+5Hpwb923XfVwPWU0D7cA66SenlchDgYMT9UEjT83Fc72AgOVhVVT3OTy0pA1x+ipo
 FNv/6WLvEOjkOuSrIEOz3dZ+vHd4tBFOcbuRl5HuVwfOCCqHZaHa01Emjr9u03aeANQK
 bnYSpOwFchcjOn8eMbb61AOVmbF0rWQM1w94l6Jm3cnnRmLxXVPl+1c/vlNmafrC3Yuo
 J/0A156XCfYiwBo/QT+zRvO2FrKHlSaZEVRTs8uCgrEsn8pEPrwJOhxZ7vdlBjJc52sv
 mXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705942213; x=1706547013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U2u02dHyzXh8Z7GhixGdPG0+iHyMzaUZy8vA0Gln640=;
 b=SC8l+eoOPMocqXkZEQ+HzMuF76hk0rU3Sip4xtN1WXj4YvVaMQTbIgBCBHiQJaLdcu
 MpbThf6A3ucJk3ivkvQrnHIV5/62fACHBFc5IDRygz9jmJ2sABZAopFnUc55ZzNpY+e4
 uTabM+69ZlDjKXR7WYhW4Hh1UN2/hwKOzamDXbVJRiOh3LroyyVNBUBMtTqnbbRyeNUw
 zfj3tfy+OBadEmMnE1rJv63J0K2EYpdoJNiu2G9F166y5lYhdGfEJC80jm2q2AxNeE8k
 uU016z7xhdT+SPOJjc/RG5gvu3ByjPDZnTKWn0jIsNhVsjwaYlQvSiBFc4Em1DsN0GeV
 +21A==
X-Gm-Message-State: AOJu0YzKSQxvAmD7w/cOJ8qmioDkKQ1ajySmJ3n70llLAZZ6q1k8uW07
 7QFY0iERFu9c62MGrRJbe32eDD0VaejNXmRx6T19E/xSvRViy6Ch7DgUMCSgkF8=
X-Google-Smtp-Source: AGHT+IH9kUc+oTorubUMxmQGsHzNDlOEembJL7z3hBRj9dGgCGiiPfSpDD3ONpdmGFYg9O2W5PgfHw==
X-Received: by 2002:a05:600c:310e:b0:40e:5186:7ed1 with SMTP id
 g14-20020a05600c310e00b0040e51867ed1mr1744941wmo.25.1705942213558; 
 Mon, 22 Jan 2024 08:50:13 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a7bc4c7000000b0040d5c58c41dsm38655169wmk.24.2024.01.22.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:50:13 -0800 (PST)
Date: Mon, 22 Jan 2024 16:50:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122165011.GA8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
 <20240122101926.GA8596@aspen.lan> <5907190.MhkbZ0Pkbq@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5907190.MhkbZ0Pkbq@radijator>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 05:24:51PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 11:19:26 AM CET Daniel Thompson wrote:
> > On Sat, Jan 20, 2024 at 10:26:43PM +0100, Duje Mihanović wrote:
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index 6292fddcc55c..d29b6823e7d1 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -181,6 +181,9 @@ config LEDS_EL15203000
> > >
> > >  	  To compile this driver as a module, choose M here: the module
> > >  	  will be called leds-el15203000.
> > >
> > > +config LEDS_EXPRESSWIRE
> > > +	bool
> > > +
> >
> > Shouldn't there be a "select GPIOLIB" here? It seems odd to make the
> > clients responsible for the dependencies.
> >
> > BTW there seems to be very little consistency across the kernel between
> > "depends on GPIOLIB" and "select GPIOLIB".. but select is marginally
> > more popular (283 vs. 219 in the kernel I checked).
>
> I believe a "select" would be more appropriate here unless these backlights
> should be hidden if GPIOLIB is disabled. The catch with "select" is that there
> seems to be no way to throw in the "|| COMPILE_TEST" other GPIO-based
> backlights have and I'm not sure what to do about that.

I think the "|| COMPILE_TEST" might just be a copy 'n paste'ism (in fact I
may even have been guilty off propagating it in reviews when checking
for inconsistencies).

AFAICT nothing will inhibit setting GPIOLIB so allyes- and allmodconfig
builds will always end up with GPIOLIB enabled. If we are happy to
select it then I think that is enough!


Daniel.
