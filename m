Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74451581302
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 14:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273F38E8DB;
	Tue, 26 Jul 2022 12:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00108E8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 12:18:22 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w5so5071612edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFNBuksRAUHG8SQKGfIMoqHF0ZeQIQql/Pes//0/1FE=;
 b=p25ViQRAGjIzoqbyw32XacT85JsM0ATOnc/aJ7f4OQUM+aio/Y993fmTKcDeocHCd9
 Ip6z+1IDcK1emNmby8GCnHh8nTAZJOit+jilIBMN3MN8BHArbq5Y7jX0AdPoo5PJRGP+
 qBAvo4C0uBT25Q/8kqgwUa9AThgrYs6OVHHMaOpyea8oHPpg79QNvmgM1Uz/oDBPwnAl
 AufVZdMZG9DZBf3rhJ84O3aYj5LM94YzLZW6y/dSBdJHdO6Du6+eIPe3NFTEc8T9fHX5
 OTqmGMZhfJaXrcwzJtTP8MEOT5b0nUwAv/+Z19lTei3pSAbzl6AU10dk5npcBMsgvF/p
 dQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFNBuksRAUHG8SQKGfIMoqHF0ZeQIQql/Pes//0/1FE=;
 b=2Ls71HcggB6k9riMQqdnrvcesb3bwYTN0wXuAJ+rGOJr/0tmnE3gFsCm2rw8AhDq0N
 1WJgtpCHM/C6KKqWTklXS2cNbodfSSl2WRq5ilE1ux7DWvc5DrZqr6pVEihkmYy8HhCS
 RpF15RTmJEf4ctoiUDUwiaFVMkBN9vw9Q9mqLEfkeKAwCeEWZ/HOIiOIsawwJVhp05iP
 TsF07GYzfZjy4m2CK3h9ELf5aphqboricbrtCOF8z2z9+4/KghvVVGbP3PQPb1yCFe07
 mJAb92XbOd/9ko/CiPssJOWyH3iipnqp01iqZGmopkMMkDG7kfSnBfCMEONV/FNgF/Op
 ONGw==
X-Gm-Message-State: AJIora+MMyY9TdnSbb/1cIemGgLfJhQzXKfDS8L3QgtdKIjN/ecyfyGW
 qMdYnyR+7bO7gJEw2i4ClDYI4uT0YP1Thp3dt08=
X-Google-Smtp-Source: AGRyM1uzT38suKCsbCmFfyzBHLwwuulTdOWUnr3cD4+NYEDfZRxNjDpqwVCvJTRb6rCtiz3um/F+ZSKguXrhc6flE20=
X-Received: by 2002:a05:6402:50c9:b0:43c:163a:4d5f with SMTP id
 h9-20020a05640250c900b0043c163a4d5fmr7812854edb.386.1658837901255; Tue, 26
 Jul 2022 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
 <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
In-Reply-To: <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 14:17:44 +0200
Message-ID: <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
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

On Tue, Jul 26, 2022 at 1:46 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:41 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > +struct mt6370_led {
> > > +       union {
> > > +               struct led_classdev isink;
> > > +               struct led_classdev_mc mc;
> > > +       };
> >
> > Where is the field that makes union work?
>
> Just for saving memory space.
> Because these led_classdevs do not be used at the same time.
> Or do you think it would be better to rewrite it as follows?
> -------------------------------------------------------------------------------------
> struct mt6370_led {
>        struct led_classdev isink;
>        struct led_classdev_mc mc;
>        struct mt6370_priv *priv;
>        u32 default_state;
>        u32 index;
> };
> -------------------------------------------------------------------------------------

You obviously didn't get what I'm talking about...
Each union to work properly should have an associated variable that
holds the information of which field of the union is in use. Do you
have such a variable? If not, how does your code know which one to
use? If yes, add a proper comment there.

-- 
With Best Regards,
Andy Shevchenko
