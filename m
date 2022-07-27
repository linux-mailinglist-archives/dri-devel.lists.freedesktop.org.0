Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9E5823BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 12:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA487C4542;
	Wed, 27 Jul 2022 10:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93251C4546
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 10:04:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z15so8934765edc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+itH6nCjnZkG3yJTUkgH3T3RkzlJIEijujwFkNTeHs=;
 b=cG/IRfZwWO83wiK8SoAZgFegp/oSsSTdk6uMQXsyEzBbyDQ15vq0yzVYGG9pEdfz0Z
 ZOOouCQXEYxdPO6EleD7jGQocetQsqrcx2C7y57nBleaH3XWNh/p9EZXeeMxomYeea0n
 ccGpQbPM3KyJhbgX8FqfpXge+UD+lyXVuyBlv7AUvzyTYioFKkLUVdtqpGd8x6O73yOd
 o3BHcOkkAf6zj76YWhjS7ePObKwBxNP5KslRU9Zg6sRbYapoWTeSb3rLO4m4qR/dd5mY
 Xo/AD9faus7q33rPJGp/5b3BvXu4+tVOAzawSfBgIW64yo4mi098uiZmqwCRYHPukGG4
 n1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+itH6nCjnZkG3yJTUkgH3T3RkzlJIEijujwFkNTeHs=;
 b=lHax0NMtzAJkVw7163yJ6I/lKZ8yjARgOWEUrEPD/wP8dPATM3GpHBxiWuQkKGBfWp
 76epGyf5wkifbhrvCEmIBlRa4viGuljgi85c/2fmlLunBG5YaDcikn9q6OzgYoDJfPan
 dlN1ZVMMLRTXKUE+NuHb8PV73JKjh/RRv17HV/W6Lc+SyEEP7+ofVtEdKFlx+ew0dEU+
 tK1wYvkBIj5o98EE309pDdMnJvV0ix7NltTwz8pbosAOo5k1Bure9pdzQ3CM9BC0bI2/
 mkxgIKimgjxHXXi6FE7e5DK/QNS6tw3WJUTAHTLYCyRYzo8tfGh96Zd5y05QoCsEp8Y1
 dUjw==
X-Gm-Message-State: AJIora9q4AfxCKGeGLyUEc5wkrdSGhZPbKkLjEyVooR7VELAmmtCog+s
 7l/Wu5GZSFhGOiUBgnIVAKNOmYlWtfrk8xfW5Uc=
X-Google-Smtp-Source: AGRyM1uwEejs5nDWqG+s979XFdwYwQmE2ZsEpW0n4nQQ7TCJsCqlYSNktlo34cJclnigei8K3rZk9qCXUcGHByv5Ilw=
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id
 p29-20020a056402501d00b00437e000a898mr22474219eda.265.1658916275876; Wed, 27
 Jul 2022 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
 <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
 <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
 <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
In-Reply-To: <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Jul 2022 12:03:59 +0200
Message-ID: <CAHp75Vf7jeG_DmD3sZnerFDEVpMxDiL9DkMBddAk-kJH7Hfttg@mail.gmail.com>
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

On Wed, Jul 27, 2022 at 9:37 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Tue, Jul 26, 2022 at 8:18 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > Just for saving memory space.
> > > Because these led_classdevs do not be used at the same time.
> > > Or do you think it would be better to rewrite it as follows?
> > > -------------------------------------------------------------------------------------
> > > struct mt6370_led {
> > >        struct led_classdev isink;
> > >        struct led_classdev_mc mc;
> > >        struct mt6370_priv *priv;
> > >        u32 default_state;
> > >        u32 index;
> > > };
> > > -------------------------------------------------------------------------------------
> >
> > You obviously didn't get what I'm talking about...
> > Each union to work properly should have an associated variable that
> > holds the information of which field of the union is in use. Do you
> > have such a variable? If not, how does your code know which one to
> > use? If yes, add a proper comment there.
> >
>
> Ummm... from my understanding,
> if the colors of these four LEDs are set to 'LED_COLOR_ID_RGB' or
> 'LED_COLOR_ID_MULTI' in DT,
> their 'led->index' will be set to 'MT6370_VIRTUAL_MULTICOLOR' in
> 'mt6370_leds_probe()'.
> If so, these led devices will be set as 'struct led_classdev_mc' and
> use related ops functions in 'mt6370_init_led_properties()'.
> Instead, they whose 'led->index' is not 'MT6370_VIRTUAL_MULTICOLOR'
> will be set as 'struct led_classdev'.
> So, maybe the member 'index' of the 'struct mt6370_led' is what you
> describe the information of which field of the union is in use?

From this description it sounds like it is.

> I will add the proper comment here to describe this thing. I'm so
> sorry for misunderstanding your mean last time.

Yes, please add a compressed version of what you said above to the code.

-- 
With Best Regards,
Andy Shevchenko
