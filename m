Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2850D2AC
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 17:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059210E466;
	Sun, 24 Apr 2022 15:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C810E466
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 15:28:25 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id z8so14563740oix.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=YTsJBncPwlsdJoy0clMDPkRYsap010NbelrrDwP4gT2p8VkAeOwyCadOMVg4EkLC3g
 BU6v4rcHRP7TcChruJdux/6WqtJmUToOWUlOimc0ldD0p/STL+v6YSxQqTz/SiEj3JGk
 6SfYzDXOC60C+Zk6YtFsjMz2c7gYsvaefbEF/eKAM03STJHCFm25OuC/Z0YH/2cfNqkA
 U538FM4O480tv4oZ6rwPTTcYDvIV4RyyrEvA6n7gY5KKJPB4B+s22HrjImpN8j9osv2G
 SEdJ9k63zxNOgRDgM+KmfcxMquHhbq8CJJjUKerT4sEDujG7ogRPrwOnyNIjdLCE9lFh
 BU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=3s6DtW1iSeFcZVBwJT6X4Gst6y8zjOdlpeySfVUDGm2LCvr6hdU4gEM8EDXpYPfO15
 ZMmwqqdgtY447yy4BXhdnQ1XgzTD+SYCMTtOIgeqekRsdDw1h1jsDPEi0zSEeH/aRJn7
 i/5Jz3JuFJxFqJw6WBxiQZofYoF6cPG17PAfFkJ/LZfkzONeFGb6vaM5irtD+5HRwcvO
 d7UOJVQP2P0WcqRP2z/OCF9g2OQ22n1gNA/t5lcQ9FM/2/eLP6qPMejGdE0xLTrVxGAJ
 c2POpQ5JDJ9z17nep99UqdTiKhyhqu64XHZLMz4a4ChiVWNSXghACaNvA4RPK98H7bN3
 us1A==
X-Gm-Message-State: AOAM533eZEaA0ffwR10ywZPLOBwwh5AAr03/f5XWL1vcALk9rkFsVOGB
 TwcjE+fMjqcQuprlH8/4t5o=
X-Google-Smtp-Source: ABdhPJy+gDyQI+jYYZai2x5URiEV01l+fMZDWT8YjU8/GgIriEk0FB5ZVdkvpb6NfVQx+IMk0aUfQA==
X-Received: by 2002:aca:f286:0:b0:2da:58ba:c578 with SMTP id
 q128-20020acaf286000000b002da58bac578mr6576017oih.127.1650814104777; 
 Sun, 24 Apr 2022 08:28:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056830410800b00605b48122eesm53063ott.14.2022.04.24.08.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 08:28:23 -0700 (PDT)
Message-ID: <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
Date: Sun, 24 Apr 2022 08:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
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
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/22 01:52, Arnd Bergmann wrote:
> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/23/22 12:55, Arnd Bergmann wrote:
>>> On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
>>>
>>> Odd, I can't reproduce this at all. Do you get any console output at
>>> all for this?
>>>
>>> Is this the plain omap1_defconfig, or something else?
>>>
>>
>> No, it is my own sx1 specific configuration.
>>
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>>
>> I don't recall where I got it from but ...
> 
> Ok, that explains it, thanks!
> 
> I fixed all the defconfig files that come with the kernel, but for your own
> ones you have to add
> 
> # CONFIG_ARCH_MULTI_V7 is not set
> 
> into the defconfig file, otherwise the multiplatform target defaults to
> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> you also need to enable CONFIG_ARCH_MULTI_V4T.
> 
> This is slightly unfortunate, but I don't see any way to avoid it, and the
> modified defconfig will still work fine with older kernel trees.
> 

Yes, that works. I changed it in my configuration.

>>> One thing I keep having to apply myself is this snippet:
>>>
>>> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
>>> index 0bfad62ea858..87c695703580 100644
>>> --- a/arch/arm/mm/proc-arm925.S
>>> +++ b/arch/arm/mm/proc-arm925.S
>>> @@ -441,7 +441,6 @@ __arm925_setup:
>>>
>>>    #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
>>>           mov     r0, #4                          @ disable write-back
>>> on caches explicitly
>>> -       mcr     p15, 7, r0, c15, c0, 0
>>>    #endif
>>
>> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.
> 
> Maybe it was disabled explicitly for the sx1_defconfig because of this
> bug. I would think that this is required for actual sx1 hardware because the
> option is default-enabled for ARM925T, and that CPU core is exclusively
> used in OMAP15xx.
> 

That looks like a bug in qemu. ARM925T instruction support is limited to V4T
instructions. qemu doesn't have explicit 5T support. It is either V4T
or V5.

Guenter
