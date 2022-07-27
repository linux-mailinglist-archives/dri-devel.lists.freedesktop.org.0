Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213058200C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 08:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C8DC1981;
	Wed, 27 Jul 2022 06:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC136C1981
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 06:25:23 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a9so12011345qtw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3TPo7Ien9QeOugxuEK5vZ4jEbRvQ6L+0JHSHIFL79V8=;
 b=Ju/fvdD+2tscdEHB4jMKbtF6QmWjmZhx4K1G8NkrcLADIpn1JSvESTmxlpt3R4JNiz
 UREKmBz7PU2Y4uvwc4LZREeVj+DUEo2k1jrd7hNHdeyJaPFWuyOYHw16/YljzGwcQaoU
 IH9nnG8x+s+fp3W9UU/Nffn3iiGxPKEQbqR3X0123vmqEq4yNkiC0A2VH4Sesf85arfJ
 RzfM19DJEhBx9KsylbfN02wrMkNXOO4yndJf2oYfq2BmSNFuvo9Rdv3pkq/RJsxGlZB+
 ENmHhdFgodOhI3rw8EXt41BmEN6clXlYa2qisFRSVLQ9+VWdxO1/quC1BwvjDvoQk+pS
 Zcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TPo7Ien9QeOugxuEK5vZ4jEbRvQ6L+0JHSHIFL79V8=;
 b=VBxd+nNMnvJkO8+3jpnuqrLok3SM+Y+JxvJab3FmMU7gHOlUkJpctZ3q/JdpPSs0Rh
 VHNYjhuEep65FcedDdTeNYBtd9p/9+gMcqaQuGz9AQUERQCRIssIXjq/y3mNs4BDbNdM
 geuu/qAhMAkOFc3QBajuulrkElrDoBrMjtleLR4mD5+zabSNNLH9p1i27tJan/QdPlgV
 kky3iojbADTSyvGGgaoEeEPPdMHBZBCHiUxFOvCwp3s1ASFB3pTxAMGzhObTRYb4km2K
 bkzlzlRgqucltyEvXGWQSPGvl7JlXFZjgM/X/Bwp/hWCFYGdj1CZ4llZnzwhjNVhNMbT
 Yqew==
X-Gm-Message-State: AJIora+u3QLgK6SLTsDOsNT4qB2R7zybZVbNsFZg0dc1dzoiUadXYr9h
 YgmgBS/0z9r2dgFq2eTtQjoiV97MCNz+wzuXH1E=
X-Google-Smtp-Source: AGRyM1tfME3ecCaCTfMzeCQrYhvxtlKmxqJRxH1lMRN/F0J8TcAZeGQUzQp4E/o76yd4w8Asm4EShy68HPneD7bl0pE=
X-Received: by 2002:a05:622a:1742:b0:31f:ef:f6eb with SMTP id
 l2-20020a05622a174200b0031f00eff6ebmr17635908qtk.548.1658903123036; Tue, 26
 Jul 2022 23:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
 <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
 <20220726093058.2fz2p2vg7xpfsnfe@maple.lan>
 <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
 <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
In-Reply-To: <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 27 Jul 2022 14:24:46 +0800
Message-ID: <CABtFH5K3LLw9ZqY0Qrrx_8xs+3ioJpzP0=_HptmoDY6tvu2JVg@mail.gmail.com>
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

On Tue, Jul 26, 2022 at 7:59 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

 ...

> > > > > Does the MT6372 support more steps than this? In other words does it use
> > > > > a fourteen bit scale or does it use an 11-bit scale at a different
> > > > > register location?
> > > >
> > > > Hi Daniel,
> > > >
> > > > Thanks for your reply.
> > > > Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
> > > > location. But the maximum current of each
> > > > channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
> > > > The main reason why MT6372 is designed this way is that one of the
> > > > customers asked for a more delicate
> > > > adjustment of the backlight brightness. But other customers actually
> > > > do not have such requirements.
> > > > Therefore, we designed it this way for maximum compatibility in software.
> >
> > Sorry for I used of the wrong word, I mean is 'driver', not
> > higher-level software
> >
> > >
> > > I don't think that is an acceptable approach for the upstream kernel.
> > >
> > > To be "compatible" with (broken) software this driver ends up reducing
> > > the capability of the upstream kernel to the point it becomes unable to
> > > meet requirements for delicate adjustment (requirements that were
> > > sufficiently important to change the hardware design so you could meet
> > > them).
> >
> > Originally, we just wanted to use one version of the driver to cover
> > all the SubPMIC of the 6370 series(6370~6372).
> > And, the users who use this series SubPMIC can directly apply this
> > driver to drive the backlight device without knowing the underlying
> > hardware.
> > To achieve this goal, we have designed it to look like this.
>
> You don't need a second driver to support two different values for
> max-brightness. The same driver can support both ranges with nothing but
> a small tweak during the driver probe function.
>
>
> > ...
> > > > > > +
> > > > > > +     if (brightness) {
> > > > > > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > > > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > > > > > +
> > > > > > +             /*
> > > > > > +              * To make MT6372 using 14 bits to control the brightness
> > > > > > +              * backward compatible with 11 bits brightness control
> > > > > > +              * (like MT6370 and MT6371 do), we left shift the value
> > > > > > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > > > > > +              * backlight brightness will be almost the same as MT6370's
> > > > > > +              * and MT6371's.
> > > > > > +              */
> > > > > > +             if (priv->vid_type == MT6370_VID_6372) {
> > > > > > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > > > > > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > > > > > +             }
> > > > >
> > > > > This somewhat depends on the answer to the first question above, but
> > > > > what is the point of this shifting? If the range is 14-bit then the
> > > > > driver should set max_brightness to 16384 and present the full range of
> > > > > the MT6372 to the user.
> > > >
> > > > So should we make all 16384 steps of MT6372 available to users?
> > >
> > > Yes.
> > >
> > >
> > > > Does that mean the DTS needs to be modified as well?
> > >
> > > Yes... the property to set initial brightness needs a 14-bit range.
> > >
> > > It would also be a good idea to discuss with the DT maintainers whether
> > > you should introduce a second compatible string (ending 6372) in order
> > > to allow the DT validation checks to detect accidental use of MT6372
> > > ranges on MT6370 hardware.
> >
> > hmmm... I have just thought about it,
> > maybe I can just modify the maximum value of default-brightness and
> > max-brightness in DT to 16384,
> > modify the description and add some comments.
>
> What for?
>
> All the other backlight drivers (there are >130 of them) expose the hardware
> range[1]. Most userspaces will already know how to handle that (by reading
> the max_brightness and, if it is recent enough, also the scale
> properties in sysfs).
>
> I'm still don't understand why one should fix a bug in the userspace by
> implementing a hack in the driver.
>
>
> [1] Well almost. The PWM backlight driver does contain support for
>     dead-spot avoidance and to allow the adoption of exponential scale.
>     However this  purpose of these is based on how PWM backlights work
>
> > And then on the driver side,
> > we can use mt6370_check_vendor_info() to determine whether it is MT6372.
> > If no, then in mt6370_bl_update_status(), first brightness_val / 8 and then set.
> > In mt6370_bl_get_brightness(), first brightness_val * 8 and then return;
> >
> > If I do this change, does this meet your requirements?
>
> Not really.
>
> It's still misleading a sophisticated userspace, which may make bad
> rounding decisions for backlight animation, in order to support a broken
> one.
>
>
> > > > Or, for the reasons, I have just explained (just one customer has this
> > > > requirement), then we do not make any changes for compatibility
> > > > reasons?
> > >
> > > I'd be curious what the compatiblity reasons are. In other words what
> > > software breaks?
> >
> > The reason is as above. We just hope the users who use this series SubPMIC can
> > directly apply this driver to drive the backlight device without
> > knowing the underlying hardware.
> > Not software breaks.
>
> As above, ignoring the max_brightness property is a bug in the
> userspace. I'm still unclear why sending faked ranges to userspace
> it a better solution than fixing the userspace.

Ok, I got it!
If I add a second compatible string (like 'mediatek,mt6372-backlight')
in the DT section,
and append 'if-then-else' to determine the correct maximum value of
'default-brightness' and 'max-brightness',
Also, I will append 'bled exponential mode' to make user control using
linear or exponential mode.
These changes I will explain to DT's maintainer again.

Back to the driver section,
do I still need to use the register to confirm again whether this
SubPMIC used now is MT6372 and record this information? (using
'mt6370_check_vendor_info()')
I am afraid that the user who uses the MT6370 hardware, but the DT
compatible string is set to 'mediatek,mt6372-backlight'.
This may cause errors when update/get brightness values.
So I hope the driver here can check again to make sure the
'default-brightness', 'max-brightness', can be updated/got correctly.
I don't know if this will make you feel redundant if I do this??

Thank you so much!

-- 
Best Regards,
ChiaEn Wu
