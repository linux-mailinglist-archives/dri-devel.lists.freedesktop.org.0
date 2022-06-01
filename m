Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B853A132
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AC910EC28;
	Wed,  1 Jun 2022 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48C10EC28
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:49:35 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id y19so2598027ejq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27PUTNb2UH1CaFlaB6o+qtISHhMqVYpnRcYCFuMiVv4=;
 b=RLZe4nVv/Ic2Sv7cEK7VnKNh8dqoPXLpxnLc7UHjGVmmaOPOdprU9K/lDH3Kr6SBBs
 6QDIiqyi6WSTTNbbOkaJZQxy8YW00WXStF0ZngoQO8N9wcquuUTE85nb3APbRA0XivHe
 pRiLCDAis4jbIvybxugAxhkZlTL8NK/7VRcrLnDf0uEQG2evVEh8fmhzHI46goYAy/Rj
 q8Bbbjx+gKvOdjejX68tjSajQP70rVeZpFFv49Ib8lN+kErMrJya6+9vsV7cGjxOYuDc
 3XgnvxTdqukRyUlMaSwf9b5Yn8Xatlmpk1zSwUk3glp21S87SI0Q0DdcTQbIgVdEgv4s
 sXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27PUTNb2UH1CaFlaB6o+qtISHhMqVYpnRcYCFuMiVv4=;
 b=rUmznsHblD9EsPuQnVjcv23AnjxWA8ff3OWtJh/yuAtD/PO4ls9RsnN7kyZpZI4bhL
 ethqp5e/uRZ2yZRfhbxRy8fRI/8Q42QXUdqZBOGqyEV//7CEzuoM9s05j4c865P+lJrK
 dO+5djZ2w5FWyNQq/gVjHJG/2LQ2LWS7+c8/QH0lzwTXvBp2PJbFakxvG+7IhIRoQjzK
 r9V7jFe8V2N/0NKlU2gxs2SLunVrM/14wd9xRJKcdkAb7JWru8sK4DevRqavLp6knVN9
 DIYpCMioiec45jBPiNJNybUmZD5AbpiBMwAjvnzRoLxklsAF/pPfuzDfP3Nj+T4Ib8j0
 +edw==
X-Gm-Message-State: AOAM533pQBk9hfx6j9craEV+RHGw6Oe0FUSC2Vqpg5WqPEFRqSzRYheo
 Nvt4+ruvje/9AF14m1mrAKqKnSDqUYQTZHGOTgw=
X-Google-Smtp-Source: ABdhPJyRwbLQFMmfl3jzbmPNjvUrFSOgiS+i5wMk8MNJphpsSnNZ8UtMTX/OTZ0ronnNTUPtL2vf7d9XmnEYugvrfuk=
X-Received: by 2002:a17:907:6e1a:b0:6fe:f357:3837 with SMTP id
 sd26-20020a1709076e1a00b006fef3573837mr40896205ejc.44.1654076974098; Wed, 01
 Jun 2022 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
In-Reply-To: <20220531102809.11976-7-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jun 2022 11:48:58 +0200
Message-ID: <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
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
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang@richtek.com,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>

All below comments are applicable to the rest of the series as well
(one way or another), so please fix all your patches where it's
appropriate.

>
> Add Mediatek MT6370 Indicator support

What indicator?
Please also keep attention on English punctuation (missed period).

...

> +       help
> +         Support 4 channels and reg/pwm/breath mode.
> +         Isink4 can also use as a CHG_VIN power good Indicator.

be used

> +         Say Y here to enable support for
> +         MT6370_RGB_LED device.

...

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>

> +#include <linux/of.h>

Are you sure this is the correct header? Seems you need
mod_devicetable.h instead.

> +#include <linux/property.h>
> +#include <linux/regmap.h>

...

> +struct mt6370_priv {
> +       struct mutex lock;

Do you use regmap locking?

> +       struct device *dev;

> +       struct regmap *regmap;

> +       struct regmap_field *fields[F_MAX_FIELDS];
> +       const struct reg_field *reg_fields;
> +       const struct linear_range *ranges;
> +       struct reg_cfg *reg_cfgs;
> +       unsigned int leds_count;
> +       unsigned int leds_active;
> +       bool is_mt6372;
> +       struct mt6370_led leds[];
> +};

...

> +static const unsigned int common_tfreqs[] = {
> +       10000, 5000, 2000, 1000, 500, 200, 5, 1

Leave a comma at the end.

> +};
> +
> +static const unsigned int mt6372_tfreqs[] = {
> +       8000, 4000, 2000, 1000, 500, 250, 8, 4

Ditto.

> +};


-- 
With Best Regards,
Andy Shevchenko
