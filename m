Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76557FAA5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647611AB80;
	Mon, 25 Jul 2022 08:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785B311AA7A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:00:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf4so19140312ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cFBmHW3aWYSVzhv+dCF1Vjg7vV6HTDbULFzKNdh7eA=;
 b=D59brI8ncH+WCdwU0Nfnk9ctLnRDZ3UUdc+xeXG2BjO1rrMZJ0I+JhW0C2WVRsU6I7
 ahgas2HVf3s+Q1M1+toqG4BgdFjA14FX2WipfWZqqPlpU/p57MdP2KZYLh9lAwA5I3P2
 78VXDrlkxZllvMa8g5WSechgcttVRJFweVlLmJ6o0bSzPej2NwYO4DbX/BcfTjOk0y/T
 XpvbkQ4bjio6MMumjuisV+WVTBnLQJzUwpW1vfpHFzzVndm/NE5Ss1d3hZjedpOJXc7m
 LuSKiZVCLZQUmdrfrVkrncRSqXCACm1BmRyqtDh1etSR8scG0DGif8X1+PGv78ob7tYR
 qx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cFBmHW3aWYSVzhv+dCF1Vjg7vV6HTDbULFzKNdh7eA=;
 b=FMNFIDF0OIBYDfQVi92Cbf31hFA0n7n/oY/cmWSgohRZcKVsOTIY13awIlJ4GFMAHj
 Ev+eOf/o/A2d24IjKQwCwvnIob9hDSl6E8PkJ2/KuNBLEXVf1ryOZP0oQU9U/cfPYAn0
 qokjRJIxBS1AfAEkOCIumf03wG0EkyzjaXxqEMCXO8ZJNQiADuBujZUbv+jJJCK2T+6J
 SgWe8EFYK04TepycfwdceWB/an49XDAMuJGgngRaG0wA7TtHifhXX9D0xwzfM6QQh4El
 PUUxKKz7iv/Pz/CVKKDL8WVi+Vv7gDA6QX8PVOauInEqG8mo0Nki2nM6VzkwUmIf5bkr
 4SZg==
X-Gm-Message-State: AJIora+z3VBkWVemYH+iHEM8GWqwYUJRq253bJWp+LsR137uJmslRdxA
 Di0TxwCtLQYbds7MdjBow863ZApUYM6t0qogrRA=
X-Google-Smtp-Source: AGRyM1unetnhWIzb3en09GsAOIg0xuhKBXgSQV7z/NkK9g6NHIamuCgYKepx6i2vYNKCBrnrnWiAXWzNdcPwAolpJPg=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr9140700ejc.394.1658735999558; Mon, 25
 Jul 2022 00:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-8-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 09:59:23 +0200
Message-ID: <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
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
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> This adds support for the MediaTek MT6370 SubPMIC. MediaTek MT6370 is a
> SubPMIC consisting of a single cell battery charger with ADC monitoring,
> RGB LEDs, dual channel flashlight, WLED backlight driver, display bias
> voltage supply, one general purpose LDO, and the USB Type-C & PD controller
> complies with the latest USB Type-C and PD standards.

...

> +#define MT6370_REG_DEV_INFO    0x100
> +#define MT6370_REG_CHG_IRQ1    0x1C0
> +#define MT6370_REG_CHG_MASK1   0x1E0
> +
> +#define MT6370_VENID_MASK      GENMASK(7, 4)
> +
> +#define MT6370_NUM_IRQREGS     16
> +#define MT6370_USBC_I2CADDR    0x4E

> +#define MT6370_REG_ADDRLEN     2
> +#define MT6370_REG_MAXADDR     0x1FF

These two more logically to have near to other _REG_* definitions above.

-- 
With Best Regards,
Andy Shevchenko
