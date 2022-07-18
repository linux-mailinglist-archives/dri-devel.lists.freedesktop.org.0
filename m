Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B5578081
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D16CB0830;
	Mon, 18 Jul 2022 11:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF978B0823
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:18:17 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id r24so1822263qtx.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wSoYENXBgH2mwK4hdRwcr5ZngBoL0AeSrBZrHAlbPeQ=;
 b=qFnFWPwvGVggO9eAAgTTMi5N3kU74UfugZ/F1ND8Dh1XwEYNQq9hleridz+UuErbjp
 kKXke5m5utIeYESJxdI+Imw1dN7Ky712JivV5EepwVudgfHjmTqzT/4Csy8a5PRWaYcW
 WT7WNRwPzbR88elpVuCiYFy314nf03iGRthvnSl47bKymr5iw2ISiSCilphKmc3sjDBm
 wiODnzpQ5ZhUPmt72MGydEbUEk8Tl3V01TfyuGjdP3zZ6dMAa1QHvvhfxlrb1Fhq/iC3
 p3s1kljCg7uX6D1BpJ/6XC9U0bCN4LfKIpfi4lFkm26bo4VkK/Gcyeu4o/iFLsYdoMKG
 BZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSoYENXBgH2mwK4hdRwcr5ZngBoL0AeSrBZrHAlbPeQ=;
 b=ygshENGCqXYI4Ho5wVg4qFPuitFcK4s4GAzyTtAGwivBF2EmpMJIa6LRRW2goUJiip
 dO0WA/2MfBiYHSrOrZtZYi7N+5LnKU0+aVlOD4PliJPzXWSm1pl3Tg4hoIlkDzXhp/Jm
 wui16Kge0ZrXSlr8QunY6fwlj2PUdssEvvBbzXeX0OyBk/dpxgz/aZMF/ujtNYTbFLMB
 TwtngvAt78qkio43b3jO3gUXs+oO3vdGQejdHgtEcQX5aFFEpky5i9+/Ai1UjLP+MWZN
 7oem84M4+RWbyDg38r+WPmsBQD32IzsszcjXK5D78ya3BP/somm7y4IEIfkUTclEzz1G
 /wCQ==
X-Gm-Message-State: AJIora/IaSkVo8KtUVt3m92UH8nlCOB6nE6JEABE2NcpXyYtQsKyvCcs
 2O9G+OSNsw4qgZuLlp1f+18gRWiEotG6Siv8v9k=
X-Google-Smtp-Source: AGRyM1sDQntCUf7aWlvIzBrAp3ngAMq6sCK0MNxJ0IaoTAwyexPRWMVJcAdASNSTm/k1fe6tXf81WYvadsLxzbGsFLI=
X-Received: by 2002:ac8:5a8c:0:b0:31d:2826:d14f with SMTP id
 c12-20020ac85a8c000000b0031d2826d14fmr20168056qtc.198.1658143096830; Mon, 18
 Jul 2022 04:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
 <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
 <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
 <ee88aec0-f6f8-c554-6752-447cb0f34e16@collabora.com>
In-Reply-To: <ee88aec0-f6f8-c554-6752-447cb0f34e16@collabora.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 18 Jul 2022 19:17:40 +0800
Message-ID: <CABtFH5J3tjx6mLfXkx_MySXdYg3qms09gX0wxpuFQxWpz3gowQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Mon, Jul 18, 2022 at 4:27 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>

<snip>

> >>
> >> Hello ChiaEn,
> >>
> >> I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
> >> registering a backlight device, register a PWM device.
> >>
> >> This way you will be able to reuse the generic backlight-pwm driver, as you'd
> >> be feeding the PWM device exposed by this driver to the generic one: this will
> >> most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
> >> with a devicetree that looks like...
> >
> > Out of interest, does MT6370 have the same structure for backlights as the prior
> > systems using mtk-pwm-disp or was mtk-pwm-disp simply a normal(-ish) PWM
> > that relied on something on the board for all the constant current
> > driver hardware?
> >
> >
>
> As per my understanding, mtk-pwm-disp is chained to other multimedia features of
> the display block of MediaTek SoCs, such as the AAL (adaptive ambient light),
> CABC (content adaptive backlight control) etc, other than being a normal(ish)
> PWM... that's the reason of my request.
>
> Moreover, in the end, this PMIC's backlight controller is just a "fancy" PWM
> controller, with OCP/OVP.
>
> >>
> >>      pwmleds-disp {
> >>              compatible = "pwm-leds";
> >>
> >>              disp_led: disp-pwm {
> >>                      label = "backlight-pwm";
> >>                      pwms = <&pwm0 0 500000>;
> >>                      max-brightness = <1024>;
> >>              };
> >>      };
> >>
> >>      backlight_lcd0: backlight {
> >>              compatible = "led-backlight";
> >>              leds = <&disp_led>, <&pmic_bl_led>;
> >>              default-brightness-level = <300>;
> >>      };
> >
> > I think this proposal has to start with the devicetree bindings rather
> > than the driver. Instead I think the question is: does this proposal
> > result in DT bindings that better describe the underlying hardware?
> >
>
>  From how I understand it - yes: we have a fancy PWM (&pwm0) that we use
> to control display backlight (backlight-pwm)...
>
> Obviously, here we're not talking about OLEDs, but LCDs, where the backlight
> is made of multiple strings of WhiteLED (effectively, a "pwm-leds" controlled
> "led-backlight").
>
> Using PWM will also allow for a little more fine-grained board specific
> configuration, as I think that this PMIC (and/or variants of it) will be
> used in completely different form factors: I think that's going to be both
> smartphones and tablets/laptops... and I want to avoid vendor properties
> to configure the PWM part in a somehow different way.
>
> > This device has lots of backlight centric features (OCP, OVP, single
> > control with multiple outputs, exponential curves, etc) and its not
> > clear where they would fit into the "PWM" bindings.
> >
>
> For OCP and OVP, the only bindings that fit would be regulators, but that's
> not a regulator... and that's about it - I don't really have arguments for
> that.
>
> What I really want to see here is usage of "generic" drivers like led_bl
> and/or pwm_bl as to get some "standardization" around with all the benefits
> that this carries.
>
> > Come to think of it I'm also a little worried also about the whole linear
> > versus exponential curve thing since I thought LED drivers were required
> > to use exponential curves.
> >
>
> That probably depends on how the controller interprets the data, I guess,
> but I agree with you on this thought.

Hi Angelo,

MT6370 is just a SubPMIC, not an SoC, and is applied in cellular
telephones, tablet PCs, and portable instruments.
And the PWM mode of the MT6370 backlight driver is optional, and not
must be enabled.
From our perspective, this MT6370 backlight driver is not the same as
mtk-pwm-disp related driver.
Thanks!

>
> Regards,
> Angelo

-- 
Best Regards,
ChiaEn Wu
