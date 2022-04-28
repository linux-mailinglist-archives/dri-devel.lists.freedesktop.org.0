Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B21513A56
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 18:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68A10E610;
	Thu, 28 Apr 2022 16:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0810E610
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 16:49:41 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e922e68b0fso5736356fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=XISky4EfFFruGvnkmI6B4SFkxFQ52ohN9Fu2cRfYJfw=;
 b=OkCy3r1S0ZpJd0xw0VfvdODlVptYGtGD/s68vjFfu+cv5VfksDwVTELspFMjzyqn2l
 o3HoJm03XsZQdwbEbRWjI+Lb63jSRMQLNDN7FFeOkhyetGmz/gAbkEhkV3TcaKgGRG82
 vuwvRZEQI4XV6kVyb9AK1+aJWoE9PIAQbe2raaE3M+WY6coymTsE71a+p721Tp/oJ1tu
 En+rQbHzGa1KawncckJtHDkTWA14zP+YTiLHoNAAclpt3pPZZQzCVaSg0pgbdjB43usw
 AxIfxdOHjkKVb6pAsbdhR1cE59eZyAmq6cI4Gd58mfC+2jQzc1Zta0D378ut2yf8lfbd
 NqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=XISky4EfFFruGvnkmI6B4SFkxFQ52ohN9Fu2cRfYJfw=;
 b=Oid3m0/Gw8yQ5K9LXegGo1rCIAFjU3AvRlxeAqBl7caKH2CQ8Wdho1R4Wpctbar3Yx
 CuyS604yp9Rb2A9oSpdBv8P3KAJoI9Ld477Of0hymk+PFYnhphqGs5fBp/91WuoYLFc3
 T699MaFPCG5WmzvZQq5hmfWGLgn44ymQUj2P2UlEZpgD0C7nKdQ0NbHpVlFfEa4+Dx3X
 D+U/L+RT61gOHGeurfVh5xMmNn5SXPPYut1kOyATft32mlPmzKrbptGKga8VjXyTuqYg
 TYTgepLMuP4WXlmhLNf57u2Liucv3wx63S+fzJku1NdZntN6dSgautNhrLAat4N/XzYQ
 OYLQ==
X-Gm-Message-State: AOAM533iknpP0w0eQuL35mXTXaQWT5JjNn/NXzSRFjm3P0XDDnxouD1K
 nltUtVgCHQzmJzQ5PqkxhQU=
X-Google-Smtp-Source: ABdhPJzrsKYpUtqCt/iZ06NVVnsLxq83abuM+0rz/PmqCRR+0Jas/OQpo6w5mfl9KOVI8b7KjTk3bw==
X-Received: by 2002:a05:6870:3289:b0:e9:1a82:c010 with SMTP id
 q9-20020a056870328900b000e91a82c010mr11417956oac.25.1651164580861; 
 Thu, 28 Apr 2022 09:49:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a4a3651000000b0035d9b838f21sm205539ooe.10.2022.04.28.09.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 09:49:40 -0700 (PDT)
Message-ID: <dd3ac1fa-67c2-8bdf-f275-9210a9e23054@roeck-us.net>
Date: Thu, 28 Apr 2022 09:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
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

-next is pretty badly broken right now due to a series of less than
perfect mm patches, so testing there won't do any good.

I'll see if I can dig up the multiplatform branch and push it into
my 'testing' branch.

Guenter
