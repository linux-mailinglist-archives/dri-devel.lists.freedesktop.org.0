Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DCB5AD3A0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F8710E37A;
	Mon,  5 Sep 2022 13:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11AC10E3A5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:19:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z23so9262145ljk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
 b=aEV1rqBvjxeacCvbFAd75H8X+CLchRyr/9zk9hD5i+6fjI5goF+z+vIzX1EGx55/p9
 IfgVdpjG1lFai91AKbjODKz/lHpxARajtjO0/XKEwTClgiAl+jHg1q1ZtcTqJSaZrYig
 kR3nTls+hkJUs4NpQl2JVkq0vuRSRbe2NpaIwzLJ3K0lc2PYHZIJgtnpLxVkCAdOdqcg
 ifK8uUxAARVYld1UXOrpCEvf1+8Q58EAJpFgdgBI0Ykb1k2J1j5CvEJW09aSZVHcvkGr
 fxrI6jqgvxBr8C13oZ4g0Qi71fqmPNdwqufFP+tdxrdtH88X4uGtw6Kli6+zcfTbP5V8
 zGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
 b=SnqZzXHGhzo5LpMAVuD3gQQh0OZvHW2fGvaVeFZXJiptl08vue5oFJ8qYKSLONYk41
 xCQxS5r0z/yz7Kc6BajMZ/jJI+bAAAJec4qxTSAMXRnSunoWDF7/VYj8cDi0ufJ0tAtU
 gT0RFlIdEdaTG34NemY4mioItx+qyy9uyMAi1ftapKVv5oj+HKz3GnHxhJ/nM3tFxcjd
 S9+X7vaEG9ZfsSLDj1HGuNG6sbSdYNhhAOaodVL9ueVorduR80EkHZt/6lMKuDqHNvFw
 +D3YnNyQlDWDFTuKBWVkQrSYUvmyVvcpSKUa5tIBErg3COFdV9s8cuOnhSedys92Bebp
 4itQ==
X-Gm-Message-State: ACgBeo29RGTN9Zc3GST4z63kZQMqSr9m7LAFrWSraVffo5mNfEFfnvwN
 8lsP5tPBs41hP9sijFewxB8=
X-Google-Smtp-Source: AA6agR6wIqHobJs4RjQ5AZ5zLGEJ30t4jOYW4FD1Y52S1XDgSMO7S1BLZYEyclCz9BqREtsj5+Cabg==
X-Received: by 2002:a05:651c:54c:b0:25f:dd42:5d06 with SMTP id
 q12-20020a05651c054c00b0025fdd425d06mr15535256ljp.161.1662383969981; 
 Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Received: from [172.16.194.195] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c128b00b00261e8f25460sm1409150ljc.14.2022.09.05.06.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Message-ID: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
Date: Mon, 5 Sep 2022 16:19:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
 devm_fwnode_gpiod_get()
In-Reply-To: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 13:40, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
>> bd957x_probe() to the generic device property API as well.
> 
> With or without below addressed,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
>> index aa42da4d141e..393c8693b327 100644
>> --- a/drivers/regulator/bd9576-regulator.c
>> +++ b/drivers/regulator/bd9576-regulator.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include <linux/regulator/driver.h>
>>   #include <linux/regulator/machine.h>
>>   #include <linux/regulator/of_regulator.h>
>> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>>          }
>>
>>          ic_data->regmap = regmap;
>> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
>> -                                        "rohm,vout1-en-low");
>> +       vout_mode = device_property_read_bool(pdev->dev.parent,
>> +                                             "rohm,vout1-en-low");
> 
> They all using parent device and you may make code neater by adding
> 
>    struct device *parent = pdev->dev.parent;

This is a matter of personal preference. I prefer seeing 
pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than 
what 'parent' would be.

I'd use the local variable only when it shortens at least one of the 
lines so that we avoid splitting it. After that being said - I'm not 
going to argue over this change either if one who is improving the 
driver wants to use the "helper" variable here.

Best Regards
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
