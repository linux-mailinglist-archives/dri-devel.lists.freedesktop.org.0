Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A788F5AD065
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139B10E2B4;
	Mon,  5 Sep 2022 10:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1544E10E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:43:01 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id a22so5840525qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
 b=hdRIxx5gYJprXyb7McPED88U6CjGFW4/o/oE2UEQDAnFQvuRdKTBrAbPBTxaUJ9avf
 ZhONilidxc49jl4KtjO3UBa42TeRciWGfG7/aHWNdgw4HkempGiN+R8+n9bi+njwfvsf
 u5vMv6wXB1Ye3Gbinm5yEMDUAfvTO2BfwcWFUoinJoVc2JXFHnCdTpKgEEuyojVrDzWD
 W+9CAhZTdkGDNzhki05EKQP0hWG3s9bgvQRV731RyOIqcTlNyTSHFHR46gnhjmW/VUhN
 vl25c1uxIRcxwJheohCT5s/0OzbaRy4WbiXoQTG++iLwB5P3a5Gf9fVcIKfh7m5uIR41
 Lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
 b=aqpeYzyw8wTTG97BRJMBch4o3+M05ie7TennM3SOTzIwYSXoh+7WS64/OSyraRLClI
 hlFJznOSSX6Qumpia/d2qBTaEVSQQMOLxqyWvS4updfwM4bV/1NnXIohkJFXTgXnSedX
 WWtF0A23TBjAV+oiMEIsrfuH6WmLoPORzBpW6QSNBnbdzYbbCQyfkHJ+EYI91Rx8S5p0
 Or6yo1X+ba5zoaXnmKNWlN3tmTkzfEdPIWKZsuG9LeIx9BZ36f96SwwE6xlCPBUJ7Hay
 zfV/nav3twdSdqvuQI9YrzvaWh6RGdUA/P7XHjEk+97I6oOBYJ8BsTClDND+kpYz5h+8
 /3JQ==
X-Gm-Message-State: ACgBeo0VWveutodVf6W8R9QYizSyiUI3PuzkKxLiAz8809xunfNVCxjx
 aMF5ZtcaC0wKdvqb1CTxfxI8hp3YiBKN9sO7a2s=
X-Google-Smtp-Source: AA6agR5J+1DJZPHd8O1DpA1QnLoQwr6drCn2l0fANuHmNbkAQyCPYj0H4aQjgFElwOjCvL9IFnO1bhj11LsfyBavbIE=
X-Received: by 2002:a05:622a:491:b0:344:95bf:8f05 with SMTP id
 p17-20020a05622a049100b0034495bf8f05mr38933704qtx.61.1662374580142; Mon, 05
 Sep 2022 03:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:42:24 +0300
Message-ID: <CAHp75Vfza3ubqwSDWnYidAjw52_zRp6sff6xhugXJNwHvRaXew@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using
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

Special thanks for using dev_fwnode().
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(Dunno if my suggestion about parent applies here)

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>                 dev_err(&pdev->dev, "No parent regmap\n");
>                 return -ENODEV;
>         }
> -       ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                             pdev->dev.parent->of_node,
> -                                                "rohm,vsel-gpios", 0,
> -                                                GPIOD_ASIS, "ldo4-en");
>
> +       ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                       dev_fwnode(pdev->dev.parent),
> +                                       "rohm,vsel", GPIOD_ASIS, "ldo4-en");
>         if (IS_ERR(ldo4_en)) {
>                 ret = PTR_ERR(ldo4_en);
>                 if (ret != -ENOENT)
>
> --
> b4 0.10.0-dev-fc921



-- 
With Best Regards,
Andy Shevchenko
