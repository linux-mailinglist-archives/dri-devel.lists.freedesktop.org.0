Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB305AD130
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004C110E2FC;
	Mon,  5 Sep 2022 11:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731E910E2FC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:09:46 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id j1so6181966qvv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
 b=W0LYg/x6oLLMVr5A9MMBVb+TxN0pk4+3xuh3Q/ipfqH1hrq5kvR4C13ZGg+8+DEqSd
 gi1J5ByiQnS+4NrTCIvUT/kKaXn5hL9zW9YV18N0SnlPLU0irWOq7beGGmmV2it9I/V8
 TSz0IwHJZsNw1mnLJ+EmjO0aVsfTD6x8QeroaNTk/ISAjEimxSO9AuqJQS/RTnqxI8me
 UqWOiBI+Wn0HCU5QQ9nYXLzwM0PBRWriqZaCP3K1erw3D5FZR6d/x6x4b60TAHtECET6
 J6AxXbDHgN6gXzpMM9fNWwiGiQLT2KqoyWZt7c52eyHpDdJ+EY+BURgwhcI9q/0V9kVd
 TT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
 b=clZ6rph7KdROatyOZRMNL3K+QzETsQTi8i6SDfrjyH/a5IuEHXivVQU0bExRE1FYdU
 4Ov19GbO6jEAX0N8QFvv43clK6xUamDFrFNbQMFLW7z6zTXlJQ0BhO8Svfvt3z3Dc8Ew
 YXs7E14Lsg3S2H42s2d43DMilVhanQErywCXidCfk1DrCzbWnWnFn5eAyDY25Dy9/YYQ
 RV/ZyqBDQ3kb5K9sl1evVfepgoW2L2VYON1qaRPp2Ia6LgXm0SGHF3Z449lGsFYv7OaC
 5WBqXXi1q+yEmAPAgWPQjlNxRlTvA2Vyoy9wW0IzY4WfWkxEV6UJmYDziijiCvn+4NBh
 013g==
X-Gm-Message-State: ACgBeo2U6KuznARKcnJC9RWZAjvexQZSEP6cPxCI5Ab4J+bgbr3HTEdc
 h7eiN34pSBaXrSdE3BmRQfGAk7Y5APGruBz65Cw=
X-Google-Smtp-Source: AA6agR5jCq5/GjKb+apw06fa/2t9tC05H0ZPM5KdsjnljOtEm1B4hEVBpVM1iH3NQHKg14ReUnIBjf+3AuFTQfBZ7lg=
X-Received: by 2002:a0c:e24b:0:b0:4a1:d41b:e280 with SMTP id
 x11-20020a0ce24b000000b004a1d41be280mr5474897qvl.11.1662376185481; Mon, 05
 Sep 2022 04:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:09:09 +0300
Message-ID: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in

it, switch

> bd9576_wdt_probe() to the generic device property API as well.

...

>         struct device *dev = &pdev->dev;

struct device *parent = dev->parent;

can make your code slightly neater.

...

> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> +       if (count < 0 && count != -EINVAL)
> +               return count;
> +
> +       if (count > 0) {

> +               if (count > ARRAY_SIZE(hw_margin))
> +                       return -EINVAL;

Why double check? You may move it out of the (count > 0).

...

> -       if (ret == 1)
> -               hw_margin_max = hw_margin[0];

> +               ret = device_property_read_u32_array(dev->parent,
> +                                                    "rohm,hw-timeout-ms",
> +                                                    hw_margin, count);
> +               if (ret < 0)
> +                       return ret;

So, only this needs the count > 0 check since below already has it implicitly.

> -       if (ret == 2) {
> -               hw_margin_max = hw_margin[1];
> -               hw_margin_min = hw_margin[0];
> +               if (count == 1)
> +                       hw_margin_max = hw_margin[0];
> +
> +               if (count == 2) {
> +                       hw_margin_max = hw_margin[1];
> +                       hw_margin_min = hw_margin[0];
> +               }
>         }

-- 
With Best Regards,
Andy Shevchenko
