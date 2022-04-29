Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9F51557F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF410FA38;
	Fri, 29 Apr 2022 20:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0F10FA38
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:23:57 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d39f741ba0so9211083fac.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFIOKWJe2JhWRyQ+23tvbYEj6baZGKnP/u3z5kRMOi8=;
 b=BahK7/YeJ4+uX3TzsNp83MyBHnpLrE/qMu4xIBQ+ZS6zy01DaiHuUoeMxTPloX76K5
 Ubgax4WkYffJVNJHfHbej2xMadXBqbARWF06vNjo4iI2fpzfmtqnvbFUit+eVhoT1JhV
 L/oOL5XftssttI+3dl8EE8ip+1SLDGWPYT/KGiBuWq9m2dSZpPqkNlOUQZQhXWucL9yn
 1fTqb9x/Wr6wFFu0woyAx4hT7nL1jqWbVXQZqXhqHEX6+b6K6K/EYkfUjIg0dufd9cmz
 QpF+Wag/CjwN6tGuBEbwsUj/v1JxGTP/6FWWqjwteWqgFXZ5FfZeR3y6GbuGNkqHg17F
 kvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFIOKWJe2JhWRyQ+23tvbYEj6baZGKnP/u3z5kRMOi8=;
 b=x/0J3BjnYbVyxLty0ID8O8rM/hzworjP76R0tvET3VwqSFwjDG7VFbiRxLzj2ejvKW
 Mlh/aLNUKNqRyxKDIo6TtX9InIQtiEvNU/ENk1Q+xW9I0s/I4dt+Nx8S8ewVKc3i6gVk
 ++JmME86afiZmuv5fWACXpprT+tpNxkJNE9Z6cQ9rQY2j05qXpy1CQVhKWSE7m6G8pwA
 2WC21EFlp0y/UmA1H/LJkZkfy534JJwBELiwoz4PkGTUBTyvogcXVQBRYMHM8bXKf6VR
 waDxnUjPTLMmWITCE3k+6NJ+lKqHUj8bo3el+EhnIk7RzuTPD2Dc/l4PWHSiFwgChY/k
 tg5Q==
X-Gm-Message-State: AOAM532OoNrPUoJ/bwEvxSK+GBX6R3mW28ZVAppqQVnuNofH0WZ8ptBz
 u9R17Zzdpdq9Agq5gIsplmc=
X-Google-Smtp-Source: ABdhPJzws2nk+8IQUdLMQ/UW+L134oqTe0mAkrmJ+izKxrmouBw2DYvgJERUyyz49n7YZEOnnZehOg==
X-Received: by 2002:a05:6870:60a1:b0:e2:b6b8:3e67 with SMTP id
 t33-20020a05687060a100b000e2b6b83e67mr2057906oae.137.1651263837158; 
 Fri, 29 Apr 2022 13:23:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a4ae28e000000b0035eb4e5a6cfsm1153965oot.37.2022.04.29.13.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:23:56 -0700 (PDT)
Message-ID: <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
Date: Fri, 29 Apr 2022 13:23:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
In-Reply-To: <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 10:48, Guenter Roeck wrote:
> On 4/28/22 06:44, Arnd Bergmann wrote:
>> On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 4/24/22 01:52, Arnd Bergmann wrote:
>>>>> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> into the defconfig file, otherwise the multiplatform target defaults to
>>>>> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
>>>>> you also need to enable CONFIG_ARCH_MULTI_V4T.
>>>>>
>>>>> This is slightly unfortunate, but I don't see any way to avoid it, and the
>>>>> modified defconfig will still work fine with older kernel trees.
>>>>>
>>>>
>>>> Yes, that works. I changed it in my configuration.
>>>
>>> Ok, great!. I managed to boot the z2 machine with PCMCIA support
>>> and it gets around the issue with my patch, correctly detecting the
>>> CF card.
>>
>> Hi Guenter,
>>
>> I have now sent out a fix that I'm happy with, and applied it to the
>> pxa-multiplatform-5.18 branch of the soc tree as well as the
>> combined arm/multiplatform tree.
>>
>> I have not merged this new version into the for-next branch
>> since I would like to see if there are any other regressions first.
>>
>> Can you run your boot tests on the arm/multiplatform branch
>> and let me know if that fixes everything you found? If that
>> takes a lot of manual steps on your side, I'd just wait for the
>> build bots and merge it after all there are no new compile-time
>> issues.
>>
> 
> I tried the pxa-multiplatform-5.18 branch. Its failures match
> those in v5.18-rc1.
> 

Uuh, wait, the build wasn't complete. There are still some
failures. I'll report later.

Guenter
