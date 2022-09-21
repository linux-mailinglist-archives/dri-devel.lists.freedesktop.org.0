Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA75BFD48
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 13:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A510E937;
	Wed, 21 Sep 2022 11:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E2610E937
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 11:48:15 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id c11so3819830qtw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HcWKSOQfnh3ALysQmzthyFKSaMJvE4eOBrZ5WykYnf0=;
 b=HfVB+cBHeUsQkTV1IF9sAKMKS/kfT/Ev0F60sC685i2kFcutzNrfuaR5hD53IQByBD
 9jivhTdsPvvs9lm5s9kXj+as2t8kAgL1f43MFcqX9USDOu2lzD+2ybZqMBbG4XjQgQ4Y
 jgCd4dOsRnsjo+D/4PaHD504CDzEYM9SJ2KgM046n1ux86DUbQlEjZm/iIajLF0rSeEV
 P//RD6N416qpoC6TwB3WBhbRgASsfx49tC7zYBmYWU1FUcKvYqXMPYCf8BhyzBlmv2s2
 9Zr3PFAQ2AikJFRKDDuta9GMnT5+GY/mdV/Fqdk13QWG5P6njup+PIsHziVHd+GZKtJz
 y93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HcWKSOQfnh3ALysQmzthyFKSaMJvE4eOBrZ5WykYnf0=;
 b=nkLPqH4cs5HJuMmpFNQcSSB9YbiQp0FPWUQNUuSbRIeKd1Vk+DJF2LGWeDNZRYXB3/
 H6bbA8JU2HmdiwU2fH5hev6+fVltkLdo9HnmHn0d72OZ98DtkJhucWdv0NMb/E6aT9Ru
 9q9wd+m+e4XSFgQP6hriJu8xpNGDvhAEWqk+DLRfzcViWV5MsMesEg1Ejo3oy+A9oqW9
 45907gNmEZA9dLl7tbglp0xqVozprClszx9Hb5xdUW709uh641ZOtOMk5mRYb9k/jX7N
 u3NHHTtKEn6q5dznD++8kPEG0yyMr47k8MJU3XbgjHyN9oDKy4RstBDfI6ykksYcv61P
 YB3g==
X-Gm-Message-State: ACrzQf3F/8ftZ/9hmBOtZsmUhH3u357QsQsNH4sANYfQPs51Czwc0UFz
 CjBO9RHzZCHNuGL1pdNq6+Ag4CcEkTCvtyzhP6c=
X-Google-Smtp-Source: AMsMyM6G55bRb+0Lbv2MWoChlYMO/VkxvcVvZF6+qxE/8auesJXC3OqMo6uD5hrChQNEavPXUJ5w0Du+HXIis6UE2X0=
X-Received: by 2002:ac8:5e07:0:b0:35c:e7fd:1e94 with SMTP id
 h7-20020ac85e07000000b0035ce7fd1e94mr12904471qtx.384.1663760894316; Wed, 21
 Sep 2022 04:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
 <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
In-Reply-To: <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Sep 2022 14:47:38 +0300
Message-ID: <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 lee@kernel.org, devicetree <devicetree@vger.kernel.org>,
 mazziesaccount@gmail.com, szuni chen <szunichen@gmail.com>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, andriy.shevchenko@linux.intel.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Han Jingoo <jingoohan1@gmail.com>, Linux PM <linux-pm@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
> > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> > > +#define MT6370_ITORCH_MIN_uA           25000
> > > +#define MT6370_ITORCH_STEP_uA          12500
> > > +#define MT6370_ITORCH_MAX_uA           400000
> > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > +#define MT6370_ISTRB_MIN_uA            50000
> > > +#define MT6370_ISTRB_STEP_uA           12500
> > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> >
> > Use upper letters as below:

For microseconds (and other -seconds) the common practice (I assume
historically) is to use upper letters, indeed. But for current it's
more natural to use small letters for unit multiplier as it's easier
to read and understand.

> > #define MT6370_ITORCH_MIN_UA           25000
> > #define MT6370_ITORCH_STEP_UA          12500
> > #define MT6370_ITORCH_MAX_UA           400000
> > #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > #define MT6370_ISTRB_MIN_UA            50000
> > #define MT6370_ISTRB_STEP_UA           12500
> > #define MT6370_ISTRB_MAX_UA            1500000
> > #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> >
> > > +#define MT6370_STRBTO_MIN_US           64000
> > > +#define MT6370_STRBTO_STEP_US          32000
> > > +#define MT6370_STRBTO_MAX_US           2432000
>
> Hi Jingoo,
>
> This coding style is in accordance with Andy's opinion in this mail:
> https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/

True.

-- 
With Best Regards,
Andy Shevchenko
