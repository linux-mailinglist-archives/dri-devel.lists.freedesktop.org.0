Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08785BF315
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 03:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CA910E7FB;
	Wed, 21 Sep 2022 01:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940C10E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 01:48:57 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id j10so3166620qtv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 18:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=30wLobZRnFv5zggcZVF2u6wy/96nEdpY/Ifl53dhDFM=;
 b=KPvreMS9cTD4YrMaMm0W35RXTuEm5G6cH9FqS5KKO/LdRVMrIzDCLbnnVsrr0aTF+M
 N637xD82AWRAKw0fe2ZZFejrBD5iZfaLPj7akR8TDl8QqRK0Yc5StwWzkJAPUv82OBe5
 /c2X2yf41KWii3ok0Kn/9kOU36HeBguY2Dz/Nekfnnij3EQIY9nBLl/PaKGQDi4oi4Pv
 sFFueSJMtV98szCHTj+aEUPa7E9SkqEuBaE5mBsjXhajCK1zmtmoHLWetEldHrvED/r1
 niPKxhRbwuOMZGoYphFO68twpl4C32uW7DWmlFLSVhE+W8Kl2AE0vv97jtpm6LZp1X+0
 OkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=30wLobZRnFv5zggcZVF2u6wy/96nEdpY/Ifl53dhDFM=;
 b=nYnpYtQktkn7gFVGFG+W2e1zuy/uWWhgdwcFkVYkFxJxai7KqK+US4MpTYi+a+W4Yt
 8duNV6g6SmQlo7Icyxh0PMStvM/DYiH0uW+3ualoQtRxYMluYDZ1AYMCm2R4BsBFgbSg
 jOuBWgjsmtuT46FWyJQ6/4ob1dtYA1/0CzvDHrzHVCBAHGBQOf6Q6+LzwB1hTeSvXI0u
 RXCXQ+Oew8NaDWMK0YOKlbkeWXVWXpmEVFDdj8AO740OYbHUjuRuGOEQYmAglCv5HzXQ
 It++e8Qv5Pgl+wKF8l77EFdOM8VipcMIgsOQ/Ic0MibP5oCm2Dz2oYs+do4wSjT9oHtZ
 U6Ew==
X-Gm-Message-State: ACrzQf3ykt3Ejknh8vd9/TF2FVmkxFk7OJAncBq3EvJfFyDFVCoWDTjI
 RnhdOIXj+2ZN1zsX1KENKMJ/kWDo5dp5KzASnns=
X-Google-Smtp-Source: AMsMyM7bBhxaQAfT+rCoAiTyYG/eF3l1J9PoSVv3K9nIjI5BkzQczZAqbJin74KiibXz/4K0z0LmAcynXI+rqdfngVA=
X-Received: by 2002:a05:622a:48c:b0:35c:d99a:3002 with SMTP id
 p12-20020a05622a048c00b0035cd99a3002mr17703201qtx.564.1663724937128; Tue, 20
 Sep 2022 18:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
In-Reply-To: <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 21 Sep 2022 09:48:21 +0800
Message-ID: <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Han Jingoo <jingoohan1@gmail.com>
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
 lee@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, mazziesaccount@gmail.com,
 szuni chen <szunichen@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, andriy.shevchenko@linux.intel.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
>
> On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > +#define MT6370_ITORCH_MIN_uA           25000
> > +#define MT6370_ITORCH_STEP_uA          12500
> > +#define MT6370_ITORCH_MAX_uA           400000
> > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > +#define MT6370_ISTRB_MIN_uA            50000
> > +#define MT6370_ISTRB_STEP_uA           12500
> > +#define MT6370_ISTRB_MAX_uA            1500000
> > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
>
> Use upper letters as below:
>
> #define MT6370_ITORCH_MIN_UA           25000
> #define MT6370_ITORCH_STEP_UA          12500
> #define MT6370_ITORCH_MAX_UA           400000
> #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> #define MT6370_ISTRB_MIN_UA            50000
> #define MT6370_ISTRB_STEP_UA           12500
> #define MT6370_ISTRB_MAX_UA            1500000
> #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
>
>
> > +#define MT6370_STRBTO_MIN_US           64000
> > +#define MT6370_STRBTO_STEP_US          32000
> > +#define MT6370_STRBTO_MAX_US           2432000
> > +

Hi Jingoo,

This coding style is in accordance with Andy's opinion in this mail:
https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/

And I will revise other parts in v12.
Thanks for your review!

--
Best Regards,
ChiaEn Wu
