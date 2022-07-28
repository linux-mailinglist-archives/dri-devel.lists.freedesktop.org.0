Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71545583D72
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 13:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8F12B972;
	Thu, 28 Jul 2022 11:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21752997C7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:31:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v5so816651wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=SMC59iUGEUeIWikaYVLjy2odSUsf6J1BxrN5JwfwEpY=;
 b=I2LvfwRSLT0FBLkzKL97tXa0j3AxOgqK4JwBDMsSM+Z8HGBr1Hsl+SUU8HPYMLz66e
 8uwZd7/fPyOTDqCE8CpYD1EB4BMYrqBICeOrQcRtAgtcyK1eE/L39avZt/VLlWPC4Uor
 LoRGhJiBQNR/hDNsANtNPDEqnDWOhfwEJTmwgA0Cv1jj23KAfdmGOY1sasEYVFjLX/YX
 ZlPZ2zhQiq7NYJ6LHAqKNcChUNlEupakqOtGb+CZPupdBgaFq1mBMgBamPwT1GZ2CiGh
 Xxn5YMmbVopGqmz+InpOVGDvq/m/bhIDEUtdkMhmWHk2Kp5mn0bff3ZHplSxHO3nCLJd
 f6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=SMC59iUGEUeIWikaYVLjy2odSUsf6J1BxrN5JwfwEpY=;
 b=58RSR5jxB88uE4GNL8Jq/gam+AFKMwpKueyLAK0s6xQngXVAkkbsmzNoNanLO7Wx2z
 kh4bTqM3GZlEmePOTE3EKfzrdyuuAL0lAuI+aS+BWBycOUVVHXfCcxqgTF2sGYEaWK5/
 hBQqC+MPHGs0IaX3O+DbDKIq09gbbaN4pKYBeaYPRvkRtPXZbuWxN2sFPdi4IxOqnB0R
 DS9r8zNjD+dpDstGL2K01sXsdqU8XW7xVv6t9oysy3W/DyGK15pfXN9fln3md9PV5aXv
 CO+9xaGRLLV8nZpqsomV/OG3b3e9wQIFyW9dTFV+P/pc6E7ABneRA3eyGiqYf9UJeXKU
 ctRQ==
X-Gm-Message-State: AJIora+xmnkNeDn5aZ7GDHUI/HcS/GdULYU0gjmm+/rlbSXcIm9tsKVX
 tCZfvfLRWaYF0tdJh82enIyG2Q==
X-Google-Smtp-Source: AGRyM1vjIPgxwYbMk8BsnZlSouB9NDyINH+vUJA52rfBsJa1/epNS6uEmdrCNjJkZQ9qNZQU8kklUA==
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr6221269wmq.58.1659007873312; 
 Thu, 28 Jul 2022 04:31:13 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 z22-20020a1cf416000000b003a35516ccc3sm937306wma.26.2022.07.28.04.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:31:12 -0700 (PDT)
Date: Thu, 28 Jul 2022 12:31:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220728113109.7gf3b36mqjxlhcq3@maple.lan>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
 <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
 <20220726093058.2fz2p2vg7xpfsnfe@maple.lan>
 <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
 <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
 <CABtFH5K3LLw9ZqY0Qrrx_8xs+3ioJpzP0=_HptmoDY6tvu2JVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtFH5K3LLw9ZqY0Qrrx_8xs+3ioJpzP0=_HptmoDY6tvu2JVg@mail.gmail.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 szuni chen <szunichen@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 02:24:46PM +0800, ChiaEn Wu wrote:
> On Tue, Jul 26, 2022 at 7:59 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > > > > So should we make all 16384 steps of MT6372 available to users?
> > > >
> > > > Yes.
> > > >
> > > >
> > > > > Does that mean the DTS needs to be modified as well?
> > > >
> > > > Yes... the property to set initial brightness needs a 14-bit range.
> > > >
> > > > It would also be a good idea to discuss with the DT maintainers whether
> > > > you should introduce a second compatible string (ending 6372) in order
> > > > to allow the DT validation checks to detect accidental use of MT6372
> > > > ranges on MT6370 hardware.

[snip]

> > > > I'd be curious what the compatiblity reasons are. In other words what
> > > > software breaks?
> > >
> > > The reason is as above. We just hope the users who use this series SubPMIC can
> > > directly apply this driver to drive the backlight device without
> > > knowing the underlying hardware.
> > > Not software breaks.
> >
> > As above, ignoring the max_brightness property is a bug in the
> > userspace. I'm still unclear why sending faked ranges to userspace
> > it a better solution than fixing the userspace.
>
> Ok, I got it!
> If I add a second compatible string (like 'mediatek,mt6372-backlight')
> in the DT section,
> and append 'if-then-else' to determine the correct maximum value of
> 'default-brightness' and 'max-brightness',
> Also, I will append 'bled exponential mode' to make user control using
> linear or exponential mode.

I'd be very pleased to see support for exponential mode added: it's a
much better way to control LEDs and backlights.


> These changes I will explain to DT's maintainer again.

Excellent. I know DT maintainers are copied into this thread but they
will probably not be following this patch's thread so it is better to
discuss in the mail thread for the DT bindings!


> Back to the driver section,
> do I still need to use the register to confirm again whether this
> SubPMIC used now is MT6372 and record this information? (using
> 'mt6370_check_vendor_info()')
> I am afraid that the user who uses the MT6370 hardware, but the DT
> compatible string is set to 'mediatek,mt6372-backlight'.
> This may cause errors when update/get brightness values.
> So I hope the driver here can check again to make sure the
> 'default-brightness', 'max-brightness', can be updated/got correctly.
> I don't know if this will make you feel redundant if I do this??

Yes, it's good idea to check the hardware model during probe. I'd
suggest just reporting this as an error ("Buggy DT, wrong compatible
string") rather than trying to re-intepret the parameters.


Daniel.
