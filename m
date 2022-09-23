Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A395E84FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 23:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF5E10E060;
	Fri, 23 Sep 2022 21:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657B410E060
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 21:34:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u24so1833232edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=2tSqnggIyDo6YUr0zNltSFoKVKbExYQv0L5PsQaqx/s=;
 b=mC5OTEroAwnh1aV0/k1oPe+NXV0TA7Ze+A1xSqjAYtWFHQmQllTO2D5NFTgRNAaYmT
 9ftX5WSLtzU2ypfDMT3O8sHcHAnbhOQyP3iw/qBmEo1MS7KrHK9T7qMSNgKzSJ+gKYID
 /abixiX9djqlc0Y/J/wim5USaRy8aF+H2vHddS2/BtkRSL/9hE50+MF2PbOdi3Sk2Gl6
 VosQoBRGmWXFe5bsDbIbt+mPWxWzs9fsS3VkuvMuKTsQce3IGe9Tc+oS/HXH/f+GD3ev
 uHxxaisRU0SVBPc0aV+ppRW6J8ERcyNX4rsfpw6JIQ1m3AX4/2lvWnFKGIrpL0hEOzl5
 cXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=2tSqnggIyDo6YUr0zNltSFoKVKbExYQv0L5PsQaqx/s=;
 b=Wl4SZuYes11HlR030uswUwNbFpFWnNq2/Gva7CnsrCRCWIe/vmHo+tw37ck3btBAaU
 tzHk6S5yvwiDoSO8Br2GEKjKHBS8jyd8Z0weL18M4oRKSdzNhzsOvWtrywOVdz8w1hKv
 Vp0YpHyoh3XynhCAvA5btz6+RcSuFwxtGR+iM1yWBliB8qaaMsqIC/uafDA1BP8M2L+g
 wCwkE+L/MGpPzWM/dmAq5VK3+JuV3mbFimFqQTuALSrtFWB12s67FzJFslih1cNVWJCd
 18/jbyIUPm6SHOmK3YKdXmeV0FeJmmmAa0tHLW0KpUxDdxOI3hck9tarkmoGyC7STxIg
 IeRA==
X-Gm-Message-State: ACrzQf2jWhxz0C0mF/Z1wRyZspgmUsE7XGvyRaJYICYrz+TZno5UuSz5
 W1XUAUagZcuA6v0GL2cA2r7bqarYR8xcjV9iBYQ=
X-Google-Smtp-Source: AMsMyM5IZsfJ8dcFfC0J6aK5kWjLl/L84uf2axz39u9HVDC/sm5vNCQLHxNNHmrmfV4MxviVVR/a5HiZQAJ2yKDCUpw=
X-Received: by 2002:a05:6402:1e8c:b0:44f:f70:e75e with SMTP id
 f12-20020a0564021e8c00b0044f0f70e75emr10298957edf.405.1663968858816; Fri, 23
 Sep 2022 14:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
 <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
 <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
In-Reply-To: <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
From: Han Jingoo <jingoohan1@gmail.com>
Date: Fri, 23 Sep 2022 14:34:07 -0700
Message-ID: <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>, torvalds@linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Julia.Lawall@inria.fr, krzysztof.kozlowski@linaro.org
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 lee@kernel.org, ChiaEn Wu <peterwu.pub@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, mazziesaccount@gmail.com,
 szuni chen <szunichen@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, andriy.shevchenko@linux.intel.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
> > > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > > > +#define MT6370_ITORCH_MIN_uA           25000
> > > > +#define MT6370_ITORCH_STEP_uA          12500
> > > > +#define MT6370_ITORCH_MAX_uA           400000
> > > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > > +#define MT6370_ISTRB_MIN_uA            50000
> > > > +#define MT6370_ISTRB_STEP_uA           12500
> > > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> > >
> > > Use upper letters as below:
>
> For microseconds (and other -seconds) the common practice (I assume
> historically) is to use upper letters, indeed. But for current it's
> more natural to use small letters for unit multiplier as it's easier
> to read and understand.

(CC'ed Linus Torvalds, Andrew Morton, Joe Perches, Julia Lawall,
Krzysztof Kozlowski,)

Yep, it is common practice. Long time ago, I met the same problem on
how to present micro-ampere:
visibility vs coding practice. At that time, I followed the coding
practice. So, was there anyone who
rejected this decision to mix upper and lower letters when you gave
your comment last July?
If there is no objection, or most of maintainers and long-term
contributors agree with that,
I am ok with that.

To Tovalds, Andrew, Joe, Julia, Krzysztof,

I just need your feedback on coding styles. Are you ok with mixing
upper and lower letters for visibility
to present micro-seconds or micro-ampere? Andy (one of very-active
contributors) gives his opinion that
mixing upper and lower letters can be acceptable. I remain neutral on
this coding style issue.

e.g., #define MT6370_ITORCH_DOUBLE_MAX_uA    800000

Thank you.

Best regards,
Jingoo Han

>
> > > #define MT6370_ITORCH_MIN_UA           25000
> > > #define MT6370_ITORCH_STEP_UA          12500
> > > #define MT6370_ITORCH_MAX_UA           400000
> > > #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > > #define MT6370_ISTRB_MIN_UA            50000
> > > #define MT6370_ISTRB_STEP_UA           12500
> > > #define MT6370_ISTRB_MAX_UA            1500000
> > > #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> > >
> > > > +#define MT6370_STRBTO_MIN_US           64000
> > > > +#define MT6370_STRBTO_STEP_US          32000
> > > > +#define MT6370_STRBTO_MAX_US           2432000
> >
> > Hi Jingoo,
> >
> > This coding style is in accordance with Andy's opinion in this mail:
> > https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/
>
> True.
>
> --
> With Best Regards,
> Andy Shevchenko
