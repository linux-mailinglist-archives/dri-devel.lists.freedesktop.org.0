Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043175811EF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 13:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643328D212;
	Tue, 26 Jul 2022 11:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE6E8D213
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 11:29:25 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id e16so10674243qka.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmalPe35Kd6mBY2zrJx1/gBiFU0BeHwwnpYA4t5eT1A=;
 b=A+GVbwXYOQP9Ox0/Kg5yJeoRW3oXpzMBaZl6QHpaFwLO6M1T19td44HKBJCw3Vx3Ve
 ktmd1UtTbJD+BAaE6zqsTfR3VrFzvGc1ycrJ+1lK2/hvc3kasb+7PiA3SElolBBnXFtK
 qNU1M+I1TW7DWOgloMTsxyAJYT/wMoGf+hgjJGl9GvTc59XZdmliUpeVii4f7rRJUKci
 5+dm/XriHCRguOo9xXqJD+t0HnoByVTO++9VWPfq2ouA2m5kGH3x5qWmIItqJ8Gb6hmg
 QDG8W9CtjH9uOf16p6XpJYeR5nrHxBx+z15ijLhKIUSlUrs9jUJNTlakGqIxckxJcedo
 9gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmalPe35Kd6mBY2zrJx1/gBiFU0BeHwwnpYA4t5eT1A=;
 b=vVu+G5TJRwl4G4WA0Ce1q2kCKQnE65rMReZwjhgD8J6HbldlWLMXk3hu+ScMqdW1sC
 PDDBb/HnKbknqXR+XlLNPbtVdGYpAxOVYM4P7f/U9AXjedSUXiyoKMrUy2itvF4vVqrX
 +xpz7i9HIyAYWHaC8jli9SEr93P/cF2iA1mQFpZr+sw0HTGJND5ArWJA4dXyOulI51Tm
 eP1ujJkQX8oCsE2+1JjgCLGfUhpDtweo3yuP+R33cYwiPtbGJUoT9yEVlxmz/SwXJBNj
 1SZ4FcCrtd7icdP0wFw3fzuHFNVo6DNnXNrgkVWOSzdhAIyk5vT11bQ6Zv+ulJ5ddlE5
 vfOA==
X-Gm-Message-State: AJIora8SxMY+ddkMGRXuPyR+jV+Ou8MQPUSPrkBQaAnFXPwymgORwIql
 HB0NwHacsPIxdsFzBw5t/nqY4GII97DzIPNRcLY=
X-Google-Smtp-Source: AGRyM1si+IPV1ALNFzlmWfFOBqoGQxrsIfnktGjjWvpLW/pQqJdQWp+MkeEPkSRN7kGJUl8EvpjK1o1GylYFhHZ2kkc=
X-Received: by 2002:a05:620a:2942:b0:6b5:e33a:1771 with SMTP id
 n2-20020a05620a294200b006b5e33a1771mr11971449qkp.665.1658834964512; Tue, 26
 Jul 2022 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
 <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
 <20220726093058.2fz2p2vg7xpfsnfe@maple.lan>
In-Reply-To: <20220726093058.2fz2p2vg7xpfsnfe@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 26 Jul 2022 19:28:48 +0800
Message-ID: <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
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

On Tue, Jul 26, 2022 at 5:31 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
...
> > > Does the MT6372 support more steps than this? In other words does it use
> > > a fourteen bit scale or does it use an 11-bit scale at a different
> > > register location?
> >
> > Hi Daniel,
> >
> > Thanks for your reply.
> > Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
> > location. But the maximum current of each
> > channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
> > The main reason why MT6372 is designed this way is that one of the
> > customers asked for a more delicate
> > adjustment of the backlight brightness. But other customers actually
> > do not have such requirements.
> > Therefore, we designed it this way for maximum compatibility in software.

Sorry for I used of the wrong word, I mean is 'driver', not
higher-level software

>
> I don't think that is an acceptable approach for the upstream kernel.
>
> To be "compatible" with (broken) software this driver ends up reducing
> the capability of the upstream kernel to the point it becomes unable to
> meet requirements for delicate adjustment (requirements that were
> sufficiently important to change the hardware design so you could meet
> them).

Originally, we just wanted to use one version of the driver to cover
all the SubPMIC of the 6370 series(6370~6372).
And, the users who use this series SubPMIC can directly apply this
driver to drive the backlight device without knowing the underlying
hardware.
To achieve this goal, we have designed it to look like this.

>
>
...
> > > > +
> > > > +     if (brightness) {
> > > > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > > > +
> > > > +             /*
> > > > +              * To make MT6372 using 14 bits to control the brightness
> > > > +              * backward compatible with 11 bits brightness control
> > > > +              * (like MT6370 and MT6371 do), we left shift the value
> > > > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > > > +              * backlight brightness will be almost the same as MT6370's
> > > > +              * and MT6371's.
> > > > +              */
> > > > +             if (priv->vid_type == MT6370_VID_6372) {
> > > > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > > > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > > > +             }
> > >
> > > This somewhat depends on the answer to the first question above, but
> > > what is the point of this shifting? If the range is 14-bit then the
> > > driver should set max_brightness to 16384 and present the full range of
> > > the MT6372 to the user.
> >
> > So should we make all 16384 steps of MT6372 available to users?
>
> Yes.
>
>
> > Does that mean the DTS needs to be modified as well?
>
> Yes... the property to set initial brightness needs a 14-bit range.
>
> It would also be a good idea to discuss with the DT maintainers whether
> you should introduce a second compatible string (ending 6372) in order
> to allow the DT validation checks to detect accidental use of MT6372
> ranges on MT6370 hardware.

hmmm... I have just thought about it,
maybe I can just modify the maximum value of default-brightness and
max-brightness in DT to 16384,
modify the description and add some comments.

And then on the driver side,
we can use mt6370_check_vendor_info( ) to determine whether it is MT6372.
If no, then in mt6370_bl_update_status(), first brightness_val / 8 and then set.
In mt6370_bl_get_brightness(), first brightness_val * 8 and then return;

If I do this change, does this meet your requirements?

>
>
> > Or, for the reasons, I have just explained (just one customer has this
> > requirement), then we do not make any changes for compatibility
> > reasons?
>
> I'd be curious what the compatiblity reasons are. In other words what
> software breaks?

The reason is as above. We just hope the users who use this series SubPMIC can
directly apply this driver to drive the backlight device without
knowing the underlying hardware.
Not software breaks.

Thanks!

>
> Normally the userspace backlight code reads the max_brightness property
> and configures things accordingly (and therefore if you the component
> that breaks is something like an Android HAL then fix the HAL instead).
>
>
> Daniel.

-- 
Best Regards,
ChiaEn Wu
