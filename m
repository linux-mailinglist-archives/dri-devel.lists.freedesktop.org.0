Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39945ADB1A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966E10E2BC;
	Mon,  5 Sep 2022 22:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A810E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:07:53 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id b144so4784367pfb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date;
 bh=DI+EGf5Iiw4yLnQOM0iLSEUhYarB1qtVETYwX3ATTlI=;
 b=KDxaSPeOmIAHodHZoxO7+rPppr+0nc84E7WjJr09aHXf0y70VUqQeiGwM4ZbMT1+IG
 aswpW6qIia4RuP0oy/zixSqOkdUMGcBdQBZ+zCXrSbs5gzJjxQbyCJKm+qaEmHP0fbLr
 p+VnLtgDb/UqRnZ5jH6rY49caFH+X+TV7pDArSwV7zY/jQ9Qvi10MQT7HP3yHqCz6Ymq
 3ER0a2FyOYkl9+aJiUSNvNKZnQFKEXdO6qjVPIArqiSCS2eFf74FcrePSlFKeiFjZiPh
 a3swNk1c3KCQbDFwBwgMcHrg1CM/Xc0KnXfSUNi2LqKeA1gvQb715UJnDwV5eFIZMn4E
 JSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DI+EGf5Iiw4yLnQOM0iLSEUhYarB1qtVETYwX3ATTlI=;
 b=03VBXOZ7qli8rvsGCxwAO6LIlzW9FolGp2pypLtHKFF7FE/9csdDcWIeHJlq9fR5FK
 wsqRJ3Hz3FJwr+d+MkHsEB7jRjP8DwiILZZkahCBEVh54IglNlX2yT9264GtkeN/2Hr3
 CylvHhDnvvyxszNsLSaoE2AYfd8sJprPWROtC1AGhQFad12v1712qY6GfoR0DZkqTJaz
 2nRKgcLnjVlzzoNOITLd5eKsz+UPN9QQLn+PORT3rJeEncpgdT1PykWlwgCfhFOQ2izx
 9MW00KU95tH1yeemHJ2SyKp2/ecJP9cSdNTyEnoQa37ym7C8FWJ9CAa/JfS7tlliDrz4
 RwNQ==
X-Gm-Message-State: ACgBeo1UB8l5LZAYAxyTCRWZbiONRYHhnDwfCiKl4mU3FwzVyJB0mEhs
 l39KtEyv3vTjCWN5sBW7MrQ=
X-Google-Smtp-Source: AA6agR5VFvTDdUbzbYgkiV1tQs8QlnywRsbF0wBwVMI81k5tziGUND19h0NyYI/NQTVei/R57vjcgw==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr41816293pgs.502.1662415672598; 
 Mon, 05 Sep 2022 15:07:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170902db1000b00172dd10f64fsm8157821plx.263.2022.09.05.15.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 15:07:51 -0700 (PDT)
Message-ID: <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
Date: Mon, 5 Sep 2022 15:07:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
 <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
In-Reply-To: <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
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

On 9/5/22 12:55, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
>>> On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
>>>> On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
>>>>> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
>>>>> <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
>>>>>> -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
>>>>>> -                                                   "nvidia,phy-reset-gpio",
>>>>>> -                                                   0, GPIOD_OUT_HIGH,
>>>>>> -                                                   "ulpi_phy_reset_b");
>>>>>> +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
>>>>>> +                                      GPIOD_OUT_HIGH);
>>>>>>                  err = PTR_ERR_OR_ZERO(gpiod);
>>>>>
>>>>> What does _OR_ZERO mean now?
>>>>
>>>> This converts a pointer to an error code if a pointer represents
>>>> ERR_PTR() encoded error, or 0 to indicate success.
>>>
>>> Yes, I know that. My point is, how is it useful now (or even before)?
>>> I mean that devm_gpio_get() never returns NULL, right?
>>
>> What does returning NULL have to do with anything.
> 
> It has to do with a dead code. If defm_gpiod_get() does not return
> NULL, then why do we even bother to check?
> 

PTR_ERR_OR_ZERO() converts into an error code (if the pointer is an
ERR_PTR) or 0 if it is a real pointer. Its purpose is not to convert
NULL into 0, its purpose is to convert a pointer either into an error
code or 0. That is what is done here, and it is done all over the place
in the kernel. I don't see your problem with it. Care to explain ?

>> It converts a pointer
>> to a "classic" return code, with negative errors and 0 on success.
>>
>> It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
>> IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).
> 
> I don't see how this is relevant.
> 

You lost me. Really, please explain your problem with PTR_ERR_OR_ZERO().

Thanks,
Guenter
