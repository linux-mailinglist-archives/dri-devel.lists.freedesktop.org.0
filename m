Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8388457FB3F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470AB10F364;
	Mon, 25 Jul 2022 08:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437FD113ADA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:25:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mf4so19245533ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5rSRKJzZCEe75lE89H4BacTqhlHPMQzJe7RV2ORfWI=;
 b=BNlVjsxRro5TG97838xZbVcQ/pG/LD+g/7G/AjwrIrlPvPS37j9HRk59ZPvQZFMbo9
 MnOMniee2k168J7vlVevltwedsYw1fwJcNYMweUNuLPFL7JEp9m9CEssAgQLNBEXPpLX
 65np3ghAZ/JI0ou7IY+VAdXdeEM9Dx5l6K3VMtdxVw5MaZ+JcN9Mz6qTKX+a72GlbThf
 YgqMy4pPKGjxlN3v8ojq6p7cX1h0ysW9lnKZ5pLCEPb56UCWlozkB+OoACaoaIIUBRbZ
 /V/wW4p+YYsXXLnpTvXofuXoBPwxmOEVHWVRTZH6OK6PGjSYJaBn82vKtB7a1B3eaVvy
 gAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5rSRKJzZCEe75lE89H4BacTqhlHPMQzJe7RV2ORfWI=;
 b=C2JX2wYU4lupm9Z56X1hDrEQjmIQoEG0lkBcJiPoe/VU+WYXBb58miPvgOSg+Aq10Q
 ZPUC4NWaQc/n6tjnHHeGQirmu+28vWwC/9djyLf+6TxASSUzL+OoTO8bBOXext8gG6/U
 7I4hUhHFD/jGSYaSDgzr83lPYeeyzK7bdCr81+bfyiM8WGFN8x+ZpAGIC+7PfUEQSzaX
 zBkHncp4p8VHQlW2Zi/BaVymSZr0xuzHwMLed/clhu5I+r9wT0jT5pVUuBwCfKfxE4FY
 /KSG7Qp9Nmq248D51458CQJlEfe8LT7Gx4U/KTVnbs2EvlaQRj52IWOou7S57mW/HZjI
 FFaA==
X-Gm-Message-State: AJIora8+wx7ZVJ1xn5Gs/dv3KhMSxKzKmWTM9Ji7iNvueAKUYfYHJpyO
 mzvuiBpUOGreH6DwS4wZNSvFuXenLbnZf2YPIHA=
X-Google-Smtp-Source: AGRyM1tb8lf0258KwCgCSc1j2TNtucrsLChWD53/F5ZAYHmenBBMp0FJqJ/Hs5trX2iqStdOTyF6IVkbw5ytFnaOucM=
X-Received: by 2002:a17:906:8a4a:b0:72b:5b23:3065 with SMTP id
 gx10-20020a1709068a4a00b0072b5b233065mr9396194ejc.557.1658737543426; Mon, 25
 Jul 2022 01:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-11-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:25:06 +0200
Message-ID: <CAHp75VeafmppD=Ge-kGZ7ab8=P9p5wmZXi_1fKFf+1uVA-SNog@mail.gmail.com>
Subject: Re: [PATCH v6 10/13] power: supply: mt6370: Add MediaTek MT6370
 charger driver
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
> This adds MediaTek MT6370 Charger driver support. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.

...

> +static inline void mt6370_chg_enable_irq(struct mt6370_priv *priv,
> +                                        const char *irq_name, bool en)
> +{
> +       int irq_num;
> +       struct platform_device *pdev = to_platform_device(priv->dev);
> +
> +       irq_num = platform_get_irq_byname(pdev, irq_name);

Every time the IRQ is not found you will get an error message printed here.
1) Is IRQ optional?
2) If not, can't you do validation only once?

> +       if (irq_num < 0)
> +               return;
> +
> +       if (en)
> +               enable_irq(irq_num);
> +       else
> +               disable_irq_nosync(irq_num);
> +}


...

> +       ret = mt6370_chg_field_set(priv, F_USBCHGEN, 0);
> +       if (ret < 0) {

> +       ret = mt6370_chg_field_set(priv, F_ICHG, 900000);
> +       if (ret < 0) {

> +       ret = mt6370_chg_field_set(priv, F_IINLMTSEL, 3);
> +       if (ret < 0) {

Do all these ' < 0' parts make sense?
(Not only these cases, but in many in the entire driver)

...

> +       /* Check in otg mode or not */

OTG

...

> +               ret = devm_request_threaded_irq(priv->dev, ret, NULL,
> +                                               mt6370_chg_irqs[i].handler,
> +                                               IRQF_TRIGGER_FALLING,
> +                                               dev_name(priv->dev), priv);

> +

Redundant blank line.

> +               if (ret < 0)
> +                       return dev_err_probe(priv->dev, ret,
> +                                            "Failed to request irq %s\n",
> +                                            mt6370_chg_irqs[i].name);
> +       }

-- 
With Best Regards,
Andy Shevchenko
