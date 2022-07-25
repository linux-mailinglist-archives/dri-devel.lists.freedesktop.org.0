Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A557FBFE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512658FB76;
	Mon, 25 Jul 2022 09:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997A8FB61
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 09:08:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e15so13059209edj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKEZcZKyJPxnUIHg9vM+IkXxZdZ8ejobr3a6ltkwgqg=;
 b=SF+aqs+EVnbsbKQkA/8xNH4ehlnunss9fmN5U1pnRWAD2EMIQ+vnoZbzG36K5peZlX
 CXhER1ViMJa80xFPZtY843nWQs5F1BNT454kUiXwBosjz4IYFjnLaJailn/bPKEmOYYj
 OQZu//AWglB0ze0HUO1SQYsIXOFhVkCy9Y+HPByleJg8LXsl2myXUq38a43P555UG4Bx
 W4w40So2uuPYw5I5cWqSTLAX8vR149Ik4ff+qJQus9SdkPcCLkZ3D5xoOpeLQVKUQZ8Y
 zppNE2E5jRpSRhv5vq/EJEOVqtSyTp9xfxGx+C2GzeLpQ8Hqwv5+/dQLpC89uzdBr14a
 kbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKEZcZKyJPxnUIHg9vM+IkXxZdZ8ejobr3a6ltkwgqg=;
 b=Kyr0wfmNESIAtcRPDzEZwiop/nMEtzkfRxkFcah+c2av4Hvip55+jfDGndg2E6vy3d
 yniMujvD99yKxKKZds9O72eJgp/3pfraV2k0cTZCPsJ4VkNYrckfmdIHlRIEvcCs8pfQ
 iwat4D+Hpbw3RlxcSWFj2sPi4U4RTpEO+sJYavopIFu20ggg0NoO3SvxTfRuks+qiJLs
 dTB8pEztf8VaTbTtj6YJLZO6txTzSsKcgpuJUbHbjcBhdzgY/L3NeXir5B+c/2pVxOsf
 qMEeSQP5APhh8hug+cmOsYvtx7I+89Rraj3gSLGwUOJNQxDua8fEezUyCTXF+GNCZBE4
 ceBw==
X-Gm-Message-State: AJIora8h43RAAGT8YYokoLsCjMOqsczZtKGYUK8rRIA9Vl+xcGLA3VF8
 GDe1bv1WzcWv6/Hmz36lHbLNFipM07QvXHk4xb4=
X-Google-Smtp-Source: AGRyM1v5JqoLA7zG3OW50lchaZUo0NzhFJOo3SiC7x0i5Bb09pqP2OvkrfyBcnIJEGb6N4UIi+1F3CYnjToz5WfvfBA=
X-Received: by 2002:a05:6402:50c9:b0:43c:163a:4d5f with SMTP id
 h9-20020a05640250c900b0043c163a4d5fmr1821081edb.386.1658740092120; Mon, 25
 Jul 2022 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 11:07:35 +0200
Message-ID: <CAHp75VfxeRR7BzOWwfNSo+x3JZcH37ogR+ZbapTAWrCYkr+FUg@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds support for MediaTek MT6370 Backlight driver. It's commonly used

Read Submitting Patches, please!

(In this case, find "This patch" in the above mentioned document, read
and act accordingly)

> to drive the display WLED. There are 4 channels inside, and each channel
> supports up to 30mA of current capability with 2048 current steps in
> exponential or linear mapping curves.

...

> +               brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);


(see below)

...

> +               /*
> +                * To make MT6372 using 14 bits to control the brightness
> +                * backward compatible with 11 bits brightness control
> +                * (like MT6370 and MT6371 do), we left shift the value
> +                * and pad with 1 to remaining bits. Hence, the MT6372's

to the remaining

> +                * backlight brightness will be almost the same as MT6370's
> +                * and MT6371's.
> +                */
> +               if (priv->vid_type == MT6370_VID_6372) {
> +                       brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> +                       brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> +               }

Nice! Why not...

...

> +       gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);

!!brightness will do as well.

...

> +       brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);

> +               val |= prop_val << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);

> +               val |= ovp_uV << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);

> +               val |= ocp_uA << (ffs(MT6370_BL_OC_SEL_MASK) - 1);

> +       val = prop_val << (ffs(MT6370_BL_CH_MASK) - 1);

...to use respective _SHIFTs in all these?

...

> +       priv->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> +                                                   GPIOD_OUT_HIGH);
> +       if (IS_ERR(priv->enable_gpio))
> +               dev_err(dev, "Failed to get 'enable' gpio\n");

What does this mean? Shouldn't be

  return dev_err_probe()?

-- 
With Best Regards,
Andy Shevchenko
