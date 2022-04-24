Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B6250CE61
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 04:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7F610E186;
	Sun, 24 Apr 2022 02:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5590610E158
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 02:09:08 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so8352346ots.6
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4WY8lQ2r9E3jRayXo+cM/u5KEpSVq7T3K2hgqZLRN8=;
 b=iMm7j9be64nnY2we3kMeOQC5Pj129NrX5ABYhzCFQgIRJ+Ik/psrhjF5r/pmbNZvJy
 nA3uaouN4tuYuhiNIaHKYw+YwzjV+kJKW5pZWtDU0GTKWu//N59zGG1fdbP9tNgWJRjg
 AqNszvtPvjJNt2cEMqoWc2MQsq1/aQ70s6DAcNDBOaPYwZvIWFR4+Zb0ls+3EVu9eOAb
 KTSMm2n+k9g4CyFP8heqe4gzTDNSh2sRc5XtpvQCIpTgIm/O2folezzCln192gATJAVk
 i8DvmOlTzlnLi/wkKkSV70TYGsg4chRlc2jxJB+NXokPS/xNBOb/lAVbFPkYyy464S89
 OnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4WY8lQ2r9E3jRayXo+cM/u5KEpSVq7T3K2hgqZLRN8=;
 b=f5qJtj3t3EDPmUDn+e7Q3Y3/VzDpTRAQ122+fgBG5jQhy7UMwKeR7JUQZPJrPv+kO9
 xSpJ67PDR8wa0C4hYBz33Mv2iJVfLfc91pujBnQVYTrqSbozHkbF5CV4JslHQjQgrYU/
 nPLzx0sm5DiV+ZVCijwdub63uoq0kDYUDxdi83W5YPA5suamic92ZcW1fzIJT1yaCDKo
 sR0Ru4aykIhfPaJVFRCD/tKBYTQsMsI5cbLHAdlLRNkTvQP0obKOqo/U+j2QEOthr7Nh
 jtYQVu52WfyBImXs0kbcefxYFUgo0RR/mx+CwTG53A8sYBMEknBK7+KjZQut6jDX2dZa
 LkEA==
X-Gm-Message-State: AOAM533OAmlXB9nSC9/nJJTS1XWkt43hJDAHCmx+B9HWKqgUjOtrrYCH
 K0Vwp5/k/8G5143fgEGgmBU=
X-Google-Smtp-Source: ABdhPJw1Nv7YurwGcrk889YKSXtPCE0PE6W5Bg0YNZLXIur1o0RT75r4zuYxuJBEQLPxL9fB1XCPwg==
X-Received: by 2002:a05:6830:2b29:b0:605:7cdb:f10b with SMTP id
 l41-20020a0568302b2900b006057cdbf10bmr4208370otv.157.1650766147578; 
 Sat, 23 Apr 2022 19:09:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm2325070oif.22.2022.04.23.19.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 19:09:06 -0700 (PDT)
Message-ID: <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
Date: Sat, 23 Apr 2022 19:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
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

On 4/23/22 12:55, Arnd Bergmann wrote:
> On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
>>> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 4/22/22 12:16, Arnd Bergmann wrote:
>>>>> On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> Which machine did you hit this on? Is this on hardware or in qemu?
>>>>>
>>>> qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
>>>> Also, I just noticed that the failure is not always the same.
>>>> z2 fails to boot from initrd, and sx1 fails to boot completely.
>>>
>>> That's a lot of machines failing, I hope at least we got the same bugs more
>>> than once here.
>>>
>>> For the I/O space, I found now that PXA was not using the standard
>>> virtual I/O address yet, but instead used a NULL-based offset.
>>>
>>> I'm not entirely happy with this patch, but this is an outline of what
>>> I think we need to fix that: https://pastebin.com/3nVgQsEw
>>> This one is probably incomplete, at least it breaks sa1100 for now,
>>> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
>>> in what way the last patch in the series triggers it, rather than the
>>> one that removed mach/io.h.
>>>
>>> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
>>> If you have a custom config for this one, make sure you get the right
>>> DEBUG_LL address.
>>>
>>>> I'll do another round of bisects.
>>>
>>
>> Here is the bisect for the sx1 boot failure.
> 
> Odd, I can't reproduce this at all. Do you get any console output at
> all for this?
> 
> Is this the plain omap1_defconfig, or something else?
> 

No, it is my own sx1 specific configuration.

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig

I don't recall where I got it from but ...

> One thing I keep having to apply myself is this snippet:
> 
> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> index 0bfad62ea858..87c695703580 100644
> --- a/arch/arm/mm/proc-arm925.S
> +++ b/arch/arm/mm/proc-arm925.S
> @@ -441,7 +441,6 @@ __arm925_setup:
> 
>   #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
>          mov     r0, #4                          @ disable write-back
> on caches explicitly
> -       mcr     p15, 7, r0, c15, c0, 0
>   #endif

it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.

Guenter

> 
>          adr     r5, arm925_crval
> 
> I don't remember what the story is behind this, but I can't actually manage
> to boot omap1_defconfig on qemu with the instruction intact.
> 
>         Arnd

