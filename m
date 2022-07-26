Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC4580969
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 04:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EFB14A139;
	Tue, 26 Jul 2022 02:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C80F14A139
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 02:20:39 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id m16so10068625qka.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 19:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W0xMOzx9xkEwYcg4IC9rpOdFz/8JFTGOz3GpQHY8CyA=;
 b=bQNzSCTQTDj5oJAikkEBCR3Q/tLaWKw4sj3Vy9sXwlvn8sYyxYtkIYLMGJHXeTnchw
 taB+Q9JNgrphDka9FLEaK8Qsw28p9ed1+CizwomW4uNr80I+wP1Lqo9LTTYwNWb3V89V
 GIklfwwZ1L8oQOXN4gS6QzAtgFIiB62NAp+81WQ1VPf3ZNTslXRqVWiUfEk+RoW/cY8f
 fDSw5bn9W+8qRxPD/H7Me+Tk8/fC32oiFqKIMjraRmMb5Kapx2uuyolL4AP030DYsD1r
 9zbtprQkDJeDZWr8JDzg2hRZyzyKu9MOyRP/v2uOlFD2v7biNRKTj8XzA8Co9eYGKCHI
 FE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W0xMOzx9xkEwYcg4IC9rpOdFz/8JFTGOz3GpQHY8CyA=;
 b=J099ZxNou9jGwTco3Oen5IlvP3n5zKTtDeHr3O3Nn14OEqNF5SYLLilzKUHlEwQks9
 fBJvUwnjZOMZS/ZV8Fv0HNSyz6542UWiYIMNhEd01PXK/u8ZcO6WUavn6f4MJ0et2yPv
 RRma0Zjb8tqy0M5L2ZAQVZ4xr91F2vSr5ItkooWIXkVQPAj8aSCsVuw2QOrnNhttcGJS
 K1vlM4BK7wusvl4UG/EN8WJz3VpcANXce1oICzluTKlln0QYaT2tF+G/UwVUDIGGR7Qg
 SADB+T5IaaAoPDC5AdCaRp1BnWRBkEUQ8H8Hu6NqXse2NUchlYsVLnkB2uC5Tg2zCnbc
 QfBA==
X-Gm-Message-State: AJIora80Y9I3aoL+rRTIp7+d+8i0y8nRT+22M+7WAuxxSk5ZTkvMN2ig
 rKaBsRERXCotX5Prh2n8oS7OWt/2F39dRv4IyLY=
X-Google-Smtp-Source: AGRyM1tZpCYcrI4GEenV5sl4ffLbB3S1w73dtE0jE5MocjhBVejW7P4d8PE22YJ6HvnYEZBNm5FpvyKW1Z34FzM/KzI=
X-Received: by 2002:a37:80c2:0:b0:6b5:e9e4:c4c1 with SMTP id
 b185-20020a3780c2000000b006b5e9e4c4c1mr11082627qkd.129.1658802038657; Mon, 25
 Jul 2022 19:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
In-Reply-To: <20220725103128.xtaw2c4y5fobowg7@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 26 Jul 2022 10:20:02 +0800
Message-ID: <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
To: Daniel Thompson <daniel.thompson@linaro.org>
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

On Mon, Jul 25, 2022 at 6:31 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jul 22, 2022 at 06:24:07PM +0800, ChiaEn Wu wrote:
> > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > index a003e02..846dbe7 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -268,6 +268,18 @@ config BACKLIGHT_MAX8925
> >         If you have a LCD backlight connected to the WLED output of MAX8925
> >         WLED output, say Y here to enable this driver.
> >
> > +config BACKLIGHT_MT6370
> > +     tristate "MediaTek MT6370 Backlight Driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       This enables support for Mediatek MT6370 Backlight driver.
> > +       It's commonly used to drive the display WLED. There are 4 channels
> > +       inside, and each channel supports up to 30mA of current capability
> > +       with 2048 current steps in exponential or linear mapping curves.
>
> Does the MT6372 support more steps than this? In other words does it use
> a fourteen bit scale or does it use an 11-bit scale at a different
> register location?

Hi Daniel,

Thanks for your reply.
Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
location. But the maximum current of each
channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
The main reason why MT6372 is designed this way is that one of the
customers asked for a more delicate
adjustment of the backlight brightness. But other customers actually
do not have such requirements.
Therefore, we designed it this way for maximum compatibility in software.

>
>
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called "mt6370-backlight".
> > +
> > [...]
> > diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
> > new file mode 100644
> > index 0000000..ba00a8f
> > --- /dev/null
> > +++ b/drivers/video/backlight/mt6370-backlight.c
> > [...]
> > +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> > +{
> > +     struct mt6370_priv *priv = bl_get_data(bl_dev);
> > +     int brightness = backlight_get_brightness(bl_dev);
> > +     unsigned int enable_val;
> > +     u8 brightness_val[2];
> > +     int ret;
> > +
> > +     if (brightness) {
> > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > +
> > +             /*
> > +              * To make MT6372 using 14 bits to control the brightness
> > +              * backward compatible with 11 bits brightness control
> > +              * (like MT6370 and MT6371 do), we left shift the value
> > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > +              * backlight brightness will be almost the same as MT6370's
> > +              * and MT6371's.
> > +              */
> > +             if (priv->vid_type == MT6370_VID_6372) {
> > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > +             }
>
> This somewhat depends on the answer to the first question above, but
> what is the point of this shifting? If the range is 14-bit then the
> driver should set max_brightness to 16384 and present the full range of
> the MT6372 to the user.

So should we make all 16384 steps of MT6372 available to users?
Does that mean the DTS needs to be modified as well?
Or, for the reasons, I have just explained (just one customer has this
requirement), then we do not make any changes for compatibility
reasons?
Thanks.

>
> Especially when using linear mappings (which are a totally pointless
> scale to use for a backlight) the extra steps are useful for backlight
> animation.
>
>
> Daniel.

-- 
Best Regards,
ChiaEn Wu
