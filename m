Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DF5152EB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06F310F6FA;
	Fri, 29 Apr 2022 17:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE91810F6FA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:48:38 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id l16so1998904oil.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5t7cdt/CWgC/r7ZaFwRZ/Pe0JhVgK8SGggmxnAqq8E=;
 b=OnQlHi3ErSMC6qSiLPAQK9tsaNNmGUsK/yx8P84vl8ZH25FjCToTTPCP6xYzUtp823
 nQu8zFOChn7TRclx0bhUluxvWGG31ISy3vYfQGsDQqCS3EjmUrqIVRNyq2psGtG3IDpi
 1W6Ytq3a5RYAKQBAidu7fUxQYTQpt+5vW3SEkCPANbWWQlmsLBqc9x1cEkbQPaLnW01H
 /gSIWuD7kQ5j7LODOU/HAxL6B5EQxZzhqJDbdqVUp7cmUle2rokPIwVHwnAzyzTxiKGl
 riWnsbp5SbzhiGJgU3qP8CBvVkoxV+4fTE0nup4rFZ2hllcAmSpZXHHWttMly/Jd1ESk
 NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5t7cdt/CWgC/r7ZaFwRZ/Pe0JhVgK8SGggmxnAqq8E=;
 b=ztMQp+ECxCxhkMVrsqmsPLptJAH7P8GlysVtZVH5irzeThzGkhGhtg+27y31cbaXZZ
 9pOO8L/FOJaVyw7Bkd8GCl8OmFWlb2ILuYjSZFtUOdIYEBUNvzbzh9iu8htWK0aT1Zjv
 PwJJxsI4iQNSJ3oW2kqGqTmiOIwy4ntYG6+KtRTesNj8YnzhKSbo+V/B7RFkw+82H28Q
 xgBahRVC8OIMJonlsIQD888COurr3yUQdzd3JR492Ai1USFLP9c3NEth45XzYzwP+vuv
 LU3Drxwp27joFBeomW1CCw0L6YdVcu2lDdqUckfh8/IgrmDaqpVaSMCleoHXDczTa7/E
 5oJA==
X-Gm-Message-State: AOAM530ublHCEEt9fDWolvAHxV+KGgLiJTPHNXJWF5d7Vz6WMCAGbi/o
 yNkk6ylJkZvhkJy0FCt0EzCcDutK04JKKA==
X-Google-Smtp-Source: ABdhPJxkF8A90UBe5FIUXgDpVBp8codcF4hzbNyKrz59fIRSWDCgfC0jKHUvcyNxHQ5kW9qHkRB58A==
X-Received: by 2002:a05:6808:11ca:b0:2d4:6861:2a9e with SMTP id
 p10-20020a05680811ca00b002d468612a9emr282421oiv.114.1651254518245; 
 Fri, 29 Apr 2022 10:48:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a9d5d07000000b00605e7b6b19dsm1261051oti.39.2022.04.29.10.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 10:48:37 -0700 (PDT)
Message-ID: <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
Date: Fri, 29 Apr 2022 10:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
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
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
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

On 4/28/22 06:44, Arnd Bergmann wrote:
> On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 4/24/22 01:52, Arnd Bergmann wrote:
>>>> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> into the defconfig file, otherwise the multiplatform target defaults to
>>>> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
>>>> you also need to enable CONFIG_ARCH_MULTI_V4T.
>>>>
>>>> This is slightly unfortunate, but I don't see any way to avoid it, and the
>>>> modified defconfig will still work fine with older kernel trees.
>>>>
>>>
>>> Yes, that works. I changed it in my configuration.
>>
>> Ok, great!. I managed to boot the z2 machine with PCMCIA support
>> and it gets around the issue with my patch, correctly detecting the
>> CF card.
> 
> Hi Guenter,
> 
> I have now sent out a fix that I'm happy with, and applied it to the
> pxa-multiplatform-5.18 branch of the soc tree as well as the
> combined arm/multiplatform tree.
> 
> I have not merged this new version into the for-next branch
> since I would like to see if there are any other regressions first.
> 
> Can you run your boot tests on the arm/multiplatform branch
> and let me know if that fixes everything you found? If that
> takes a lot of manual steps on your side, I'd just wait for the
> build bots and merge it after all there are no new compile-time
> issues.
> 

I tried the pxa-multiplatform-5.18 branch. Its failures match
those in v5.18-rc1.

Should I try soc/arm/multiplatform as well ?

Guenter
