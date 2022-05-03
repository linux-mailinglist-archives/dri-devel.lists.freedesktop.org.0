Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F22517C14
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 04:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D806210F668;
	Tue,  3 May 2022 02:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B3210F663
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 02:55:39 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l16so9784343oil.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=ML+ALf4muC9UINFB1D+jUSUaT6Yc1q590//LqncXPBg=;
 b=i7O9COFXjCPh9mubsfg4ugisxlHT5wiyH0MXCmkS/E9xJKUh9gtudd7mJOdt/lRU5s
 XviWqp4uUxdnstDiOc3faSUjpvZagNsoavB45X1ONbSZGvYwKqCS3Q4EtrJCw38BFSTy
 GfNBd7eRD5cCXw35f/BALZfCm/WuBWvrvy8CHiiL2yrOPGPoRYnxiuE92NR59Xn+HZB5
 KmWN9JXFhIw1dIK45cEVSlCPHBcxANoVGaomRAUVkCZ8j7FysnRmKK/nqDi0QqiAU5qN
 jRYD07RpfwKLRhTaIOHoyPVauNdPj2DaFQwX8xWbJUP/uVrx5krbwy8PAtKyqKnZh5Fk
 0gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ML+ALf4muC9UINFB1D+jUSUaT6Yc1q590//LqncXPBg=;
 b=2ys+qnJKIuB28d3Lq6FoPAGNlNgs0+hpf6KDhJV+qj1++ZrEydaD/eZMsk6ey7Q0x3
 5U+3HklDsnUnshSG6j545RzJn52QvSI5lwM9ane490DKjkcwCsDMGTXtrSOickQV0RJN
 2p1wiosXGGkArYMTasn9wbM6kYwSA3hjJEX0uC1UCzwqfg6DjcuDnOt0lgrApsHo9Oxa
 mlnc+3ZSgK2W4R48Fbo7vpX1PC+r6bmBwNTg/W+vzACOBZeKgP3kW/KF9zo/EUemPUmg
 jOLrtuZpySwIx10nMV4qRotIhcejqYY9lNEMiy+Ba/417m8Ygyyx3+nDz9ZvD+vSiPic
 aoyw==
X-Gm-Message-State: AOAM533sYQ8Zyl3JdjVSq2Iq8KWlD/8R2u8H/2vds1YJ4n17O9QrVDIu
 Sba6ZGKMyTN5j8xEIK/y/6k=
X-Google-Smtp-Source: ABdhPJznbXpW7jRNt5UM7xwEtyewbcsNlzza6ofH1kXi3NQqMh/99I9VMArk+DRpxcBP+PFc4iZ78A==
X-Received: by 2002:a05:6808:1115:b0:2ec:e78e:3fc0 with SMTP id
 e21-20020a056808111500b002ece78e3fc0mr978131oih.207.1651546539238; 
 Mon, 02 May 2022 19:55:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a9d7e91000000b006060322126csm1564658otp.60.2022.05.02.19.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 19:55:38 -0700 (PDT)
Message-ID: <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
Date: Mon, 2 May 2022 19:55:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
 <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
 <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
 <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
 <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
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

On 5/2/22 14:03, Arnd Bergmann wrote:
> On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 5/2/22 12:21, Arnd Bergmann wrote:
>>>
>>
>> To boot from initrd:
>>
>> qemu-system-arm -M z2 -kernel \
>>        arch/arm/boot/zImage -no-reboot -initrd \
>>        rootfs-armv5.cpio --append \
>>        "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
>>        -monitor null -serial stdio
>>
>> where rootfs-armv5.cpio is from my repository at github.com.
>>
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz
>>
> 
> Ok, that works here with any configuration, I don't see a regression.
> Could this be a problem with the size increase? The machine only has
> 32MB of RAM, so it's possible that the multiplatform-enabled kernel
> with DT support etc pushes it over the edge, especially with an initramfs.
> 

qemu puts initrd in the middle of available memory. With the image size
being ~1MB larger than with v5.18-rc, this is too much, and the kernel
overwrites part of initrd. This causes it to be corrupted.

It looks like that would have happened eventually, your patch series just
made it happen now. The kernel is just getting too large to run on such small
systems. I worked around the problem in my version of qemu by loading initrd
at the end of the (small) RAM. With that, I no longer see the boot failure.

Guenter
