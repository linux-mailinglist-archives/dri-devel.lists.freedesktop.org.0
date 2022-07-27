Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E958213A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B0C1E8D;
	Wed, 27 Jul 2022 07:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D80C1E8D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:37:36 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id b21so12073663qte.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7wBtopi5nrrnF3/tK6d3mUXKRzW2T+DIHWRi/Z/g55U=;
 b=JrXv07SnypKXIiO9c1hDaO1ve2XFoCQh3YJA9N0xzJ8VKdcy+NOWbVByEfE93yA1bT
 Tl79vU21bY1Riyh5vdmQjiXNRM6Y+lisVzjlFGA12N5TkfsJVvBTZVM+DXhLMCRLgtAT
 CWazI0B5gaYgTPfT/LBhBjVu7eM5hrdl/RUhg4FDmsUWR19oAbFy6HoE9edFHPyenD8T
 Qf2WPKI/e5SPnIeUMPrpopEK3VVMRKkcz81I6LE01vsC+va5BFGobzRlWIltgg+x4gCQ
 EHVJv70L2zauSaiZEF5yiD6RME26xNIBHXc93G+wfeZxZyIdgW4ZKl6QFkorqrFDfTKD
 6LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7wBtopi5nrrnF3/tK6d3mUXKRzW2T+DIHWRi/Z/g55U=;
 b=JZXzbsyb5AVqhOg6L+EdqAv2gbveZidrz4DOECV76ip9bJtEBaX7emmAkNBj/avHul
 9hh7DIHQf1luWifA2hNgp1Kx2Eju4cPvc68oSGktXQwzR/GiO19N01a+HnP+1hjEuvFG
 h1Ds9g8NytSv5BcEsWOuTPChrfHdDK+Yw/7lAmFoPq5uBMmEL7AtPKWQnrsxMaMfppfH
 w3/KYHJlKJAbe4CTVYrNxcuZEX0HfXawd5fQSoBm3gH54nSa8qqYRtrEy2VX5T2yoBbH
 ONOqLY3B3cS5MEFrHw5/JD8OEvdxS1jGh6yGDuN9JM5npYkY44FMP+zfIuzaYw8Tm6x+
 MAYw==
X-Gm-Message-State: AJIora8efyz452VeIjuf3bd17ug3eNhLlV+Y0wD7c9an2ypi8Xh5dMJ/
 NPw9hUWSzZPCXy4mADkjCVkXe2HzmN0vJ0Z7yjI=
X-Google-Smtp-Source: AGRyM1sXpKQZrYG0IbOgoxNKanSErlzr5LcY9lrHn4FGhRFmisG96yuJDLZQZGtegCOB6F8ydUZqqM5XWqwFIZtxfFQ=
X-Received: by 2002:a05:622a:6098:b0:2f0:f0d2:b5f0 with SMTP id
 hf24-20020a05622a609800b002f0f0d2b5f0mr17361865qtb.583.1658907456035; Wed, 27
 Jul 2022 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
 <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
 <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
In-Reply-To: <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 27 Jul 2022 15:36:59 +0800
Message-ID: <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Tue, Jul 26, 2022 at 8:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

...

> > Just for saving memory space.
> > Because these led_classdevs do not be used at the same time.
> > Or do you think it would be better to rewrite it as follows?
> > -------------------------------------------------------------------------------------
> > struct mt6370_led {
> >        struct led_classdev isink;
> >        struct led_classdev_mc mc;
> >        struct mt6370_priv *priv;
> >        u32 default_state;
> >        u32 index;
> > };
> > -------------------------------------------------------------------------------------
>
> You obviously didn't get what I'm talking about...
> Each union to work properly should have an associated variable that
> holds the information of which field of the union is in use. Do you
> have such a variable? If not, how does your code know which one to
> use? If yes, add a proper comment there.
>

Ummm... from my understanding,
if the colors of these four LEDs are set to 'LED_COLOR_ID_RGB' or
'LED_COLOR_ID_MULTI' in DT,
their 'led->index' will be set to 'MT6370_VIRTUAL_MULTICOLOR' in
'mt6370_leds_probe()'.
If so, these led devices will be set as 'struct led_classdev_mc' and
use related ops functions in 'mt6370_init_led_properties()'.
Instead, they whose 'led->index' is not 'MT6370_VIRTUAL_MULTICOLOR'
will be set as 'struct led_classdev'.
So, maybe the member 'index' of the 'struct mt6370_led' is what you
describe the information of which field of the union is in use?
I will add the proper comment here to describe this thing. I'm so
sorry for misunderstanding your mean last time.
Thanks again for your review.

-- 
Best Regards,
ChiaEn Wu
