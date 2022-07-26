Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271D58128A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 14:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201C98DFD9;
	Tue, 26 Jul 2022 12:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFBE8DFC2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 11:59:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v17so884502wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FeVAQTj8/mAfkMvlMLcvvaBxhrv6NPtimQHZr0slSEU=;
 b=xGMvXn3lMLClPC6eYxENOclGIczqTe4up2YIXe+hB4oiUuGwxnYbUcVPOjQ6uneBOn
 qF0JJhM66ZwzVuCuaD7h9ruyKVimYkfqcqQ4Kis3hhGc6TDEmPdt9pvCx2Q/ZtTFFx7/
 RxQQz5GA+s0dhVW4w4r7ML655as4ZXTF5j/m2lzozaDmwFuFXQ4lqKSN8sMMdxCI/075
 EWmE3VOrwt0RYvxBgte5TLjVz2Oaxglc4K/5fpz76xOLgwZrsFKVQt2JZRFWNVwF+Ble
 KiAB1b+a9gGWGvWz9lI4jQ8rsd/MCa4vLoay1yTaFYPW+XO+7sLz7zjt1JKcROEGLX+Z
 CX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FeVAQTj8/mAfkMvlMLcvvaBxhrv6NPtimQHZr0slSEU=;
 b=vnp2KETbjKVoLZAho+BaE+n3mn8kwWKEKNbG51X1iHKj5EQNT1P863Xc3jdJ5Odl0W
 0I8Iq9PXhLIT8SVOhf3Wmo94lszGHvT69Wt3grzcYhe8NTnTbBc6pkaL4WwA9AfFjqtD
 VTXD0/GWIVHVJF/9Ty1gT8J9XhNa3epkDz6/iHe9rj2wQOfxQVaV4NFtlnMguqFrPZor
 0flGK2h9AuLxDQ3JIWWEJ1ySlxB9dXRXvVijd5CV26IaJXALzc4AFx6UP49KHuRkAUVh
 7O9SX/wY6FNLUbQ/e/o/f/K2WJ7rnlerPlhMQc9LsgzIXW0lBL8NXH1fe4wryRiWVw3k
 aJsA==
X-Gm-Message-State: AJIora/UhlcmUT1k41EfZAkvUQrcf5dcCQtYbCFiR7H2OiNR8Nvdr3zm
 5NBIPDwBfSSrJFKCi3rp25J5Tg==
X-Google-Smtp-Source: AGRyM1uehfvDpwjgQ4OdVhAkG8XtMk/rrGDztYqeesidU3gudI8NvtnBD1+DZaV4TdshdsyfIFIYLQ==
X-Received: by 2002:a5d:6d0b:0:b0:21d:9f26:f84a with SMTP id
 e11-20020a5d6d0b000000b0021d9f26f84amr10703197wrq.155.1658836797777; 
 Tue, 26 Jul 2022 04:59:57 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0021e86504736sm6131350wrb.16.2022.07.26.04.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 04:59:57 -0700 (PDT)
Date: Tue, 26 Jul 2022 12:59:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
 <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
 <20220726093058.2fz2p2vg7xpfsnfe@maple.lan>
 <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
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

On Tue, Jul 26, 2022 at 07:28:48PM +0800, ChiaEn Wu wrote:
> On Tue, Jul 26, 2022 at 5:31 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> ...
> > > > Does the MT6372 support more steps than this? In other words does it use
> > > > a fourteen bit scale or does it use an 11-bit scale at a different
> > > > register location?
> > >
> > > Hi Daniel,
> > >
> > > Thanks for your reply.
> > > Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
> > > location. But the maximum current of each
> > > channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
> > > The main reason why MT6372 is designed this way is that one of the
> > > customers asked for a more delicate
> > > adjustment of the backlight brightness. But other customers actually
> > > do not have such requirements.
> > > Therefore, we designed it this way for maximum compatibility in software.
>
> Sorry for I used of the wrong word, I mean is 'driver', not
> higher-level software
>
> >
> > I don't think that is an acceptable approach for the upstream kernel.
> >
> > To be "compatible" with (broken) software this driver ends up reducing
> > the capability of the upstream kernel to the point it becomes unable to
> > meet requirements for delicate adjustment (requirements that were
> > sufficiently important to change the hardware design so you could meet
> > them).
>
> Originally, we just wanted to use one version of the driver to cover
> all the SubPMIC of the 6370 series(6370~6372).
> And, the users who use this series SubPMIC can directly apply this
> driver to drive the backlight device without knowing the underlying
> hardware.
> To achieve this goal, we have designed it to look like this.

You don't need a second driver to support two different values for
max-brightness. The same driver can support both ranges with nothing but
a small tweak during the driver probe function.


> ...
> > > > > +
> > > > > +     if (brightness) {
> > > > > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > > > > +
> > > > > +             /*
> > > > > +              * To make MT6372 using 14 bits to control the brightness
> > > > > +              * backward compatible with 11 bits brightness control
> > > > > +              * (like MT6370 and MT6371 do), we left shift the value
> > > > > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > > > > +              * backlight brightness will be almost the same as MT6370's
> > > > > +              * and MT6371's.
> > > > > +              */
> > > > > +             if (priv->vid_type == MT6370_VID_6372) {
> > > > > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > > > > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > > > > +             }
> > > >
> > > > This somewhat depends on the answer to the first question above, but
> > > > what is the point of this shifting? If the range is 14-bit then the
> > > > driver should set max_brightness to 16384 and present the full range of
> > > > the MT6372 to the user.
> > >
> > > So should we make all 16384 steps of MT6372 available to users?
> >
> > Yes.
> >
> >
> > > Does that mean the DTS needs to be modified as well?
> >
> > Yes... the property to set initial brightness needs a 14-bit range.
> >
> > It would also be a good idea to discuss with the DT maintainers whether
> > you should introduce a second compatible string (ending 6372) in order
> > to allow the DT validation checks to detect accidental use of MT6372
> > ranges on MT6370 hardware.
>
> hmmm... I have just thought about it,
> maybe I can just modify the maximum value of default-brightness and
> max-brightness in DT to 16384,
> modify the description and add some comments.

What for?

All the other backlight drivers (there are >130 of them) expose the hardware
range[1]. Most userspaces will already know how to handle that (by reading
the max_brightness and, if it is recent enough, also the scale
properties in sysfs).

I'm still don't understand why one should fix a bug in the userspace by
implementing a hack in the driver.


[1] Well almost. The PWM backlight driver does contain support for
    dead-spot avoidance and to allow the adoption of exponential scale.
    However this  purpose of these is based on how PWM backlights work



> And then on the driver side,
> we can use mt6370_check_vendor_info( ) to determine whether it is MT6372.
> If no, then in mt6370_bl_update_status(), first brightness_val / 8 and then set.
> In mt6370_bl_get_brightness(), first brightness_val * 8 and then return;
>
> If I do this change, does this meet your requirements?

Not really.

It's still misleading a sophisticated userspace, which may make bad
rounding decisions for backlight animation, in order to support a broken
one.


> > > Or, for the reasons, I have just explained (just one customer has this
> > > requirement), then we do not make any changes for compatibility
> > > reasons?
> >
> > I'd be curious what the compatiblity reasons are. In other words what
> > software breaks?
>
> The reason is as above. We just hope the users who use this series SubPMIC can
> directly apply this driver to drive the backlight device without
> knowing the underlying hardware.
> Not software breaks.

As above, ignoring the max_brightness property is a bug in the
userspace. I'm still unclear why sending faked ranges to userspace
it a better solution than fixing the userspace.


Daniel.
