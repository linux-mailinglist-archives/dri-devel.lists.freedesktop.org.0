Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359865AD051
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777B610E2A4;
	Mon,  5 Sep 2022 10:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A410E2A4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:41:19 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id e28so5873161qts.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
 b=a4V6ibAx1P4YjsDZwhtMLMuWUwWCK3+Yn9JF3VwjA4fF5N0JKuAGKvW0x7Oeq36vRu
 ZD2NpBYMNC8pDvV3B9bTynqivMhFDkGOtzwr7JY7i6mY6fQ9mOwr7PCsrNfMvKVlTB6m
 AQwPmzkKfJqq/qd3lYrZAvkeG/klQ18FzMuuftSPGpjscQilPNTppd9oLyhCECyBTnmS
 uo+4FUsm1gWsG4XuM9BafRncQA8YVM65g/X3SPg8260dxRuAheVR5JT3lXCfMda99osm
 3ghxFB0uVJftBWwHDXIPOXJK9RgFq/ZehUGlD71aQbbwaHNfsi/Wi+FWVWYy7rB5ueEz
 4ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
 b=JNzTdAacB1vRflEmZYzvH9w80n3amiDXg8jiBdwkweNZUp+2VF9eM9XBOb7YxDAyI7
 +iNO1dP9YgybRIsebgj5iysD9CqYDdX3f8CGGwRkLyJ+ctTmL8E3cDqlJjmSyDNKHRtU
 0F06Z8qhXfsqBgJngslYiAnuSoEPPJxXJ3uVA9hNwYjdazuT+9VmQrxahWSiQ1KFTzSU
 OeyIqJni5sn7jAN6Ysq6MTcLwZV64SdfuPu1mJ8gVXiwgztVqND9kG+sgdIeemaB7PmA
 M/dgJYfMH0V3dUBlEvAxUj6EzGqVuWO4Ook+IfqUh/z1wE1EG+pESGbapOo5NDqKddxj
 j1Aw==
X-Gm-Message-State: ACgBeo2SwI5lo0yW30p9+PFQch4pJpq6DZVT+SGInBGvpmpuOJyKABOk
 45nWckJMS4Ivc/nBd3SBHKhKaysRLAPCAmsnRQ4=
X-Google-Smtp-Source: AA6agR5jckAzCxTGD9mkHIt9A012zarGH47OL+wuWeavoOdmt2QYtP37qTO1N0BzU0mjGhkgR0fMvN19uxKTRqEH6ZQ=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr37941390qte.195.1662374478234; Mon, 05
 Sep 2022 03:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:40:42 +0300
Message-ID: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
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
> bd957x_probe() to the generic device property API as well.

With or without below addressed,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
> index aa42da4d141e..393c8693b327 100644
> --- a/drivers/regulator/bd9576-regulator.c
> +++ b/drivers/regulator/bd9576-regulator.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/regulator/of_regulator.h>
> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>         }
>
>         ic_data->regmap = regmap;
> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,vout1-en-low");
> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> +                                             "rohm,vout1-en-low");

They all using parent device and you may make code neater by adding

  struct device *parent = pdev->dev.parent;

at the definition block of the probe function.

>         if (vout_mode) {
>                 struct gpio_desc *en;
>
> @@ -948,10 +949,10 @@ static int bd957x_probe(struct platform_device *pdev)
>
>                 /* VOUT1 enable state judged by VOUT1_EN pin */
>                 /* See if we have GPIO defined */
> -               en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                                pdev->dev.parent->of_node,
> -                                                "rohm,vout1-en-gpios", 0,
> -                                                GPIOD_OUT_LOW, "vout1-en");
> +               en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                          dev_fwnode(pdev->dev.parent),
> +                                          "rohm,vout1-en", GPIOD_OUT_LOW,
> +                                          "vout1-en");
>                 if (!IS_ERR(en)) {
>                         /* VOUT1_OPS gpio ctrl */
>                         /*
> @@ -986,8 +987,8 @@ static int bd957x_probe(struct platform_device *pdev)
>          * like DDR voltage selection.
>          */
>         platform_set_drvdata(pdev, ic_data);
> -       ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,ddr-sel-low");
> +       ddr_sel = device_property_read_bool(pdev->dev.parent,
> +                                           "rohm,ddr-sel-low");
>         if (ddr_sel)
>                 ic_data->regulator_data[2].desc.fixed_uV = 1350000;
>         else
>
> --
> b4 0.10.0-dev-fc921



-- 
With Best Regards,
Andy Shevchenko
