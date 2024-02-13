Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE68536CD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 18:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E1910E893;
	Tue, 13 Feb 2024 17:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="APl2Bi41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9E10E893
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 17:07:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-411d231ea71so2994985e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707844045; x=1708448845; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lBhUsqqEfcFUOvQn0dgNlKxDozoww9xJx2cBhPkvQ0Y=;
 b=APl2Bi412xuPTdZ9wpsKK4/fR0StweBYQPYAzGWrhkP4CAv2y84IuF8FAiRd5yhOtH
 46OlGNfduJGSHlzijR2rSVG9YS+yf439kW94m8WUEqS6cbkptzhFZ1IX52eQNUdfcooU
 cViL79ywwcLeSBLgSIOJq1BKp9Nxcl4UzwrA5A9sL4NYUiWAToKv1X3f0jYXjzt6+M0U
 CrGdgalYO5wPRm6O06GulXa7JeC1g31dvZeYjiHA9bTA02BeTpW4Xnlf/i90efp+fys1
 cm38zurMbIsHmyNULHC6EII1cOkSWzI+Ndn+04CMOdkAwMExwPa9PpciYB3/P3UpCIFr
 7KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707844045; x=1708448845;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBhUsqqEfcFUOvQn0dgNlKxDozoww9xJx2cBhPkvQ0Y=;
 b=mWknBu/LnWWr9OPCHC3PPU96U1+p3uEWJeqAcKafoWvU/1N4JzCXK7Y2F+qFbysTgU
 2SUND4Y0tituapmIl/GOepCa9xH/Gtu5QlZBpNjnW5kNx+bCGeRtSTrkueVZG6y8gdaA
 XzPaa0rSZYnx0c8+NErc7VBTbilCVfpV/xVHgkg41AswwCYv6t6mwz4JmC3Ib03NSOYg
 DC7Kv9YVF/IdB0t2qjc5XbuQ0XEYT6jMgO/C2wydjdLdFB2MGlNc2tkM491C2oJAyzlN
 B8WN7tZhcpAhnRxfFMyGpuTRCts0IyZhC/9dOzh4S4ZShcHV78ayr3qA6a07f8eWJizo
 2EpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVWeUB+T7kQoQTXDXCvS2w8mzXlNGrym+iziKnKOjkuA/TqhK7mYL18xmLAYhGZkdD+ejfmgxt/2KPGjwW1MdS3bifHYF1Xc2eOpyUZeBP
X-Gm-Message-State: AOJu0YwFTr8wZlMI4Mi7cZib8j9LQskfYBE/LQuDK/5DMegDNpuGzLdp
 5b7ihh3q8YJt8sRqyinmF0sQ5SuiwpUaX3vvgowsG7Fpjc7C+flI7aAdfk8nvn8dy+1/H/DsVxD
 ou8Q=
X-Google-Smtp-Source: AGHT+IHOdmbOSJodG4xOl8OtUHg2AhxnOnqOnhs7LvrrIGgbmbq6G6U6EGxCEuh7US+3LUcdJ4gq0A==
X-Received: by 2002:a05:600c:1d92:b0:411:c93e:17c4 with SMTP id
 p18-20020a05600c1d9200b00411c93e17c4mr230760wms.2.1707844044890; 
 Tue, 13 Feb 2024 09:07:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfnLplCeYI/9ht+8vLHNL7yNdcE/elB9esi3PTLOKi8C4CN0JprjLpV/UwO2rSV2YLb3+PvjNsrknQFajHYnGsENBTUFoEy2oEZy9dLEd3pTdOQVDKRFBQoy9elWj+dquWnfOiUBgJ+AnHB+IMYvZRWOmYIBVVoZCB3C3gVvJBFWgjgKJUhTMH4vfIpg4U2E6qe5GEDqGlj0m8lrEcmGiAK+oZKXxS+DhXAUjm/Ca9k5L5NCN21L0OPjTvyWlVwgjw67gFTcAV2txi26pKY0zCAMyWecm9KN78euNZIfSGLJlN5evqBHmqWkUnqhX9VGFunfhBoahg89QER8mvkgEVGlYopXhhcsrkCmJpJMy/69lx+sAkrenbWiuv4onyzm5Qlq5fYSIoPXJe43D5IH70ALA/Dk3I+5/Ccd9oZA==
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00410e90e82ebsm5520642wms.4.2024.02.13.09.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:07:24 -0800 (PST)
Date: Tue, 13 Feb 2024 17:07:20 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
 Hans de Goede <hdegoede@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: fix LED dependency
Message-ID: <20240213170720.GA297704@aspen.lan>
References: <20240212111819.936815-1-arnd@kernel.org>
 <20240212124428.GB4593@aspen.lan> <4869921.GXAFRqVoOG@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4869921.GXAFRqVoOG@radijator>
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

On Mon, Feb 12, 2024 at 03:31:50PM +0100, Duje Mihanović wrote:
> On Monday, February 12, 2024 1:44:28 PM CET Daniel Thompson wrote:
> > On Mon, Feb 12, 2024 at 12:18:12PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The new backlight driver unconditionally selects LEDS_EXPRESSWIRE, which
> > > is in a different subsystem that may be disabled here:
> > >
> > > WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
> > >
> > >   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
> > >   Selected by [y]:
> > >   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE
> [=y]
> > >
> > > Change the select to depends, to ensure the indirect dependency is
> > > met as well even when LED support is disabled.
> > >
> > > Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >
> > >  drivers/video/backlight/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/video/backlight/Kconfig
> > > b/drivers/video/backlight/Kconfig index 230bca07b09d..f83f9ef037fc 100644
> > > --- a/drivers/video/backlight/Kconfig
> > > +++ b/drivers/video/backlight/Kconfig
> > > @@ -185,7 +185,7 @@ config BACKLIGHT_KTD253
> > >
> > >  config BACKLIGHT_KTD2801
> > >
> > >  	tristate "Backlight Driver for Kinetic KTD2801"
> > >
> > > -	select LEDS_EXPRESSWIRE
> > > +	depends on LEDS_EXPRESSWIRE
> >
> > As far as I can tell this resolves the warning by making it impossible
> > to enable BACKLIGHT_KTD2801 unless a largely unrelated driver
> > (LEDS_KTD2692) is also enabled!
> >
> > A better way to resolve this problem might be to eliminate the NEW_LEDS
> > dependency entirely:
>
> I believe this would be the best thing to do here. Making LEDS_EXPRESSWIRE
> user selectable doesn't make much sense to me as the library is rather low-
> level (a quick grep turns up BTREE as an example of something similar) and IMO
> the GPIOLIB dependency should be handled by LEDS_EXPRESSWIRE as it's the one
> actually using the GPIO interface (except maybe for KTD2692 as it has some
> extra GPIOs not present in the other one and thus handles them itself).

We can keep the GPIOLIB dependency in LEDS_EXPRESSWIRE but it also needs
to be included in the KTD2801 KConfig too... otherwise we'll get similar
problems to the ones Arnd addressed here:
https://lore.kernel.org/all/20240213165602.2230970-1-arnd@kernel.org/


Daniel.
