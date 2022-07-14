Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A4574987
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2DA3D53;
	Thu, 14 Jul 2022 09:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A21BA3D50
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:47:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b26so1820396wrc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hz+S9gbmjTBRbI9IGEo00yr8q6U8gYAIZkZve+s14sI=;
 b=jGRWumBYRWsPFRAHiNOF9bcUJ5TNxCTJ10BCXYBR6dF5XY8QP1BaD0ju5ijzduBadz
 M7fhdhDNh9X474nV6zPJ7e1R/z8AAJRizIr/3CpUbGzGKBc7QY0JT2IoCubdKhUsVB2D
 Fo9X7Qexd9TDha4225wY5GnXsVw+Qq4igsIWi7ZGskKx65onGrtT5A4Eai7F7A/5TU5q
 ehpk/JuiqKYzmvo58fp5IXfwHX6D2oDhRs4pu5dG34iaFTJb/8kDr/vljaafddvSmTQt
 FofPVS5NrtArjBlTl0domfLu4V5bkUAzCbxcFxSi14WPEKaNDZDAnaRvllsVTcVTH+E8
 GmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hz+S9gbmjTBRbI9IGEo00yr8q6U8gYAIZkZve+s14sI=;
 b=F29S0Esz5A1GDVHi1XeOqopwP+QWQMZ+CGOMeA2OLh9uwqpZAPd72kktTauI4WGmN3
 1+BgsykXEfdw8Nd/tV3OP3w59l/qrmOAq+XGo/p6Wkg7llqp8EWceHj8lkvleUMkbGa6
 HLXKNBGXmxzEvp+GEUlymVSDbcOam6fcCVCuEA8oAM3YHTtXDNChxqxJkm2I5/fIP5fQ
 cstZbhNUvZ2zUk+Yy8Vkih9Z3flq90XMJKpuAUz+ZlWcFQYobFlYRlLy5QmzavX6Fwf4
 2a/FunWEbafhjJujlRlTTDCi+K1/ocemGe/GJY+EmSQeoyhnqWobSnvNroYW0K8aV5+p
 TNBg==
X-Gm-Message-State: AJIora8/xgOYt1NZipElCz03Sd3q7BtFM6LIUabVXeuZsEIiWBUMnpYU
 CIBL/hDEArMUuS7ZyPhkjh/7qQ==
X-Google-Smtp-Source: AGRyM1vnaGqcjfiDi9IGxZuq03hn9M2jXCQvULWiEOP+eJIxh4bgzvMgPaE9Bz5dtGUwBLz/VP+cVQ==
X-Received: by 2002:a05:6000:12c8:b0:21d:6913:89af with SMTP id
 l8-20020a05600012c800b0021d691389afmr7419194wrx.546.1657792031934; 
 Thu, 14 Jul 2022 02:47:11 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bg10-20020a05600c3c8a00b003a0323463absm1456168wmb.45.2022.07.14.02.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:47:11 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:47:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220714094709.6ekfnfcf5sktiegi@maple.lan>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 11:27:07AM +0200, Andy Shevchenko wrote:
> On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > I have tried two methods so far, as follows
> > -------------------------------------------------------------
> > /*
> >  * prop_val =  1      -->  1 steps --> b'00
> >  * prop_val =  2 ~  4 -->  4 steps --> b'01
> >  * prop_val =  5 ~ 16 --> 16 steps --> b'10
> >  * prop_val = 17 ~ 64 --> 64 steps --> b'11
> > */
>
> So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> Now, consider x - 1:
> 0  ( 0 ) --> 0
> 1  (2^0) --> 1
> 4  (2^2) --> 2
> 16 (2^4) --> 3
> 64 (2^6) --> ? (but let's consider that the range has been checked already)
>
> Since we take the lower limit, it means ffs():
>
>   y = (ffs(x - 1) + 1) / 2;
>
> Does it work for you?

To be honest, for this tiny table, writing code that *doesn't* require intricate
deciphering together with a huge comment saying what is does would probably be
better:

		prop_val = (prop_val <=  1 ? 0 :
		            prop_val <=  4 ? 1 :
			    prop_val <= 16 ? 2 :
			                     3);

This would be "obviously correct" and require no comment.


Daniel.
