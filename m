Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE085AD5D3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE57C10E40A;
	Mon,  5 Sep 2022 15:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81910E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:13:55 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so12446338pjq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
 b=hkkpU5LscmWAGSEo3MfEtadx9VW4xDHJEup50A1r2cVLlq4cuETMEDvzQMWJ+25cub
 uKJeKBqoA/7oOn5M03KfF2SrWzMp8y/6jxlU6IOGtXhf5NBV25gS8epBm0aJ0S2QGuaI
 RjUYEWJv07AS8q77FSCkemAnzO0cF5SSPIB8vUM+JQ9+01vDbgKIvCwDLFJ0pxGW/o9D
 wfMCMCN77OXaTjmH8xcwvQmxfsPP25DPJzASvB1sg54cKUVgwF0SrI+mVebrCUQXQcEH
 UD6AosLEX29RH6M8jzXceVG7LBfIA3BiQKPCSDkkI0IwATFYFoPoughaGzGm0KCEERIH
 sz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
 b=JmB36VbBSzChQziylOhfaYoO6x0UWOya0ucO1z1FpvZm3Lcf5o8GrNzeDXmG4S431L
 tKdxEJOTav/NrG3nmGmLw6SuuEMba6uwNeYtAdYOcvYRVXNAgqIPfJkJYVKD2swlbF4b
 Fjb+TYuibUthAHKVs2RG+BWbfzZoZE/dbHIHYiAivUH9NaHuW4EvTlYMNngQuYbkd7SE
 rJSFX50isnB3AowsSjUJuYwi5w7uA+BThdSOiAXsqkPpp7wbW3yyIeRA3ilJ6mpofVDg
 5ZTLKk01Rfx4T+laRacMMfV73ybb9ZFYBGp+zndxEqqJQqDjkH/92i8lp+anHW96H+iZ
 tU0g==
X-Gm-Message-State: ACgBeo3IHCH+wB0ZhyuYmy748vzHa65S5r4kXeFYdL0w07LKDBSb2u6r
 vbSo680ScGOTV7Igvh2JUQQ=
X-Google-Smtp-Source: AA6agR759HBK1+PQYcZT7IJSAKYI4KNMvzd+GSuzCkEXpLGsOPIUySqoQ8VGjyqne3MH/nAfFroOyA==
X-Received: by 2002:a17:90b:164f:b0:1f5:4ced:ed81 with SMTP id
 il15-20020a17090b164f00b001f54ceded81mr19722762pjb.122.1662390835165; 
 Mon, 05 Sep 2022 08:13:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170903124f00b00176ba091cd3sm1684281plh.196.2022.09.05.08.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:13:48 -0700 (PDT)
Message-ID: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
Date: Mon, 5 Sep 2022 08:13:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 04:09, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
> 
> it, switch
> 
>> bd9576_wdt_probe() to the generic device property API as well.
> 
> ...
> 
>>          struct device *dev = &pdev->dev;
> 
> struct device *parent = dev->parent;
> 
> can make your code slightly neater.
> 
> ...
> 
>> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
>> +       if (count < 0 && count != -EINVAL)
>> +               return count;
>> +
>> +       if (count > 0) {
> 
>> +               if (count > ARRAY_SIZE(hw_margin))
>> +                       return -EINVAL;
> 
> Why double check? You may move it out of the (count > 0).
> 

Two checks will always be needed, so I don't entirely see
how that would be better.

> ...
> 
>> -       if (ret == 1)
>> -               hw_margin_max = hw_margin[0];
> 
>> +               ret = device_property_read_u32_array(dev->parent,
>> +                                                    "rohm,hw-timeout-ms",
>> +                                                    hw_margin, count);
>> +               if (ret < 0)
>> +                       return ret;
> 
> So, only this needs the count > 0 check since below already has it implicitly.
> 
Sorry, I don't understand this comment.

Guenter

>> -       if (ret == 2) {
>> -               hw_margin_max = hw_margin[1];
>> -               hw_margin_min = hw_margin[0];
>> +               if (count == 1)
>> +                       hw_margin_max = hw_margin[0];
>> +
>> +               if (count == 2) {
>> +                       hw_margin_max = hw_margin[1];
>> +                       hw_margin_min = hw_margin[0];
>> +               }
>>          }
> 

