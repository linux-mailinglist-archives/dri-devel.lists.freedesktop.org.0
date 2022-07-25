Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D957FAFC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8410FBD2;
	Mon, 25 Jul 2022 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8D11AACA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:10:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z23so18978079eju.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QXb71uFWhSg39Viv30HgP3y8LahJOu5TtvkjW1YFFmA=;
 b=gcXWANYd95QqpDZNjT80H5El43Dovr5S0wOb+dj41WF0UAkuUiJDW2NAi4iQ305XFQ
 lVVKY0C+iGL0p5tVBSniVcX6zLS8O0o42jiM3VHbf3P2PJwPJY9pNrOD5I3tyZyDgnJy
 d6DIH0u/YAoFuSujbvAgci/gyOOkxjcOa7FgLYcccmWOMRReiJpRQvj8oeNjtzasRz45
 5wI5mC7zC/KC/unitlCB9w7h7MNbq7bWUvDLO3UqaeZF52Xc40wDLTHrTN6lnrUtKqrq
 8MOcmmfgBfz1xp4MxADiih/qQe4qXT1ndVyvX9sozOvgmH8wWtATEk7QsOTuHRb8u2m9
 CtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QXb71uFWhSg39Viv30HgP3y8LahJOu5TtvkjW1YFFmA=;
 b=hSpd03RCIiuvwl1+4FAuaAJyS2ss7/uS8PLHHoLf2ZTTHdgqeBwEvx3haqjqSS3o4W
 JKWXMhGmitOC/MqPtemhLstzlfytl2MGqVrXOPoc8Td49kBwkfLxJZGRbTm/e4fQxa/U
 nu0Ardw3Jw/WTh3xMLkdwiIymZobgTpwo9ObuWFOjb2p2+xMo6sCn8h2r7GlhATgCH4b
 HZ8imECSRhww7fzP8J5TC5E3MTysVmleqo7Lcc57W689vmcfYZrIpN7uqOwYom085skX
 N5LVAfDs+MMZsP8GOSiAUQQmcN1/zdCXuU+iScOzB3AfbwXG1sYkrlGzfErmsBV5T/B5
 lFFg==
X-Gm-Message-State: AJIora/NRWwDYWk3hjQSlDBAfWlxm26I3aqGLP4X4P07Rwu3qly6Z9nw
 XFiL3eakXhL7/L1sAOrhsdke1HdqnUxQp3TCgHw=
X-Google-Smtp-Source: AGRyM1vadWdzYb+xBUWIOSQf30AXu6Fkj1TEEjh0wt407LPyY4IeBvhlCzY8/E5xfgCj1T+lP6Op+S0BRvRPn0GRG+I=
X-Received: by 2002:a17:906:9b09:b0:72b:9612:d373 with SMTP id
 eo9-20020a1709069b0900b0072b9612d373mr8927348ejc.606.1658736649264; Mon, 25
 Jul 2022 01:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-10-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:10:12 +0200
Message-ID: <CAHp75VfRZvYA3HJg=LAxXxu26aLSwRGQaED19Bg2d+dZw3RPfw@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
> Add a support the MT6370 ADC driver for system monitoring, including

support for the

> charger current, voltage, and temperature.

...

> +#define MT6370_AICR_400_mA             0x6
> +#define MT6370_ICHG_500_mA             0x4
> +#define MT6370_ICHG_900_mA             0x8

^^^^ (Note this and read below)

...

> +               reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> +               if (reg_val < MT6370_AICR_400_mA)
> +                       *val1 = 3350;
> +               else
> +                       *val1 = 5000;

Here...

...

> +               if (reg_val < MT6370_ICHG_500_mA)
> +                       *val1 = 2375;
> +               else if (reg_val >= MT6370_ICHG_500_mA &&
> +                        reg_val < MT6370_ICHG_900_mA)
> +                       *val1 = 2680;
> +               else
> +                       *val1 = 5000;

...and especially here it is so counterintuitive to have an if-else
chain because the values are not ordered by semantic meaning.

What if the new standard/hardware decides to use 0x7 for 100mA (hypothetically)?

So, please use switch cases or other robust methods.

-- 
With Best Regards,
Andy Shevchenko
