Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66163585947
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 10:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8E10E1AF;
	Sat, 30 Jul 2022 08:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DE510E1AF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 08:55:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id va17so12220483ejb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bxfY1htXxbYgZJF5B+dESeWX+UdX+4GjUNZm08CoJ8E=;
 b=YbS/lcslcbmkXpey5cpFq+X/ytIJj3qLqsAi5z2w3lorLorzgulYzXLv7skrAU7gN0
 EX8kGu++8KCaP8JbTGm7Bo3U8kDDvcQXkGjM1MLqVjThH9BjNQnNUYSsBpwGPt78mnIV
 OmvNjkD5/22LUnX3abOBs3Ip/74gtvYpkMEqaB47rKWbISEtyBK4LuIyQGvszb2bZdoL
 CgvYhVFbtXuOgKbSqVay5FL3qu2DJiuNMGh1IjG0TKwGsmXbUFFznpLlY3RbMcwjVw9M
 adMX/40d2nJLNi65Qz4IOrP2vL7GL5fg4YlumPSgmRc3Lgb1LQGlkLtbz97XAWPK/J7w
 FrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bxfY1htXxbYgZJF5B+dESeWX+UdX+4GjUNZm08CoJ8E=;
 b=i3XO3L29RE7RpHaLLNdBSa8w7mt2uzDKaZY9b1VqtnaFEvtY0oCPI9i+IH1yHv+KSt
 GXiFpk31mWVRqWjkv5QQvO8Oc8GGAATEe2YZePqBENdmRxUuNRxDh11F/5KMUT/NN4FJ
 EAs/VuyQUmVUZPcoqKp9Xk3PymKhtUuF14SroXSnUOGPMhzLlW0ZcJZqOH4Eh8/o+oVk
 aBhk3i+xv+g9fdgVE0fzp6eVBivUDkiO0bL+a1GY7vb/8nqLmITQ1R1iDUVqrud0zzFD
 GfgjDU2YBwMQ886pHSUFGYnCIRjTiEMs8umLXVs+CptHXGDRVwVaD8rNWyIz8NqO28fj
 Nlxw==
X-Gm-Message-State: AJIora/apej1To8AsB5OEhiamf6PeItWdPtmu2PgIXb3dThZKtwiizZL
 /c3Z3Vl8UWPiohBLGHk2ITwobYde9naaBNXN
X-Google-Smtp-Source: AGRyM1sheQBaWBbZ2/dbYWLUaQqAMJRtzg5nrxQDGH46I4vLTxOvUd/Zbug1LN1Ia1i+sismD/uiGg==
X-Received: by 2002:a17:907:970c:b0:72e:e972:5c73 with SMTP id
 jg12-20020a170907970c00b0072ee9725c73mr5518137ejc.352.1659171307805; 
 Sat, 30 Jul 2022 01:55:07 -0700 (PDT)
Received: from [0.0.0.0] ([81.17.18.61]) by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b0072b8fbc9be1sm2699005ejy.187.2022.07.30.01.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 01:55:07 -0700 (PDT)
Message-ID: <3c55e119-5b6f-25ab-99c9-2c99b1dfd9e9@gmail.com>
Date: Sat, 30 Jul 2022 14:54:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <CAHp75VdaDyyqRw9fAkUOhNjsyifeozVx6JuYXSU1HpoO+VHDNA@mail.gmail.com>
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <CAHp75VdaDyyqRw9fAkUOhNjsyifeozVx6JuYXSU1HpoO+VHDNA@mail.gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 7/29/22 00:19, Andy Shevchenko wrote:
> On Thu, Jul 28, 2022 at 4:32 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>>
>> Add early console support for generic linear framebuffer devices.
>> This driver supports probing from cmdline early parameters
>> or from the device-tree using information in simple-framebuffer node.
>> The EFI functionality should be retained in whole.
>> The driver was disabled on ARM because of a bug in early_ioremap
>> implementation on ARM.
> 
> ...
> 
>> -               efifb,[options]
>> +               efifb
>>                          Start an early, unaccelerated console on the EFI
>> -                       memory mapped framebuffer (if available). On cache
>> -                       coherent non-x86 systems that use system memory for
>> -                       the framebuffer, pass the 'ram' option so that it is
>> -                       mapped with the correct attributes.
>> +                       memory mapped framebuffer (if available).
> 
> If somebody passes those (legacy) options, what will happen?

Those would be ignored. Instead it would be automatically determined if 
framebuffer is located in RAM or in the I/O space.

> 
> ...
> 
>>   config EFI_EARLYCON
>> -       def_bool y
>> -       depends on SERIAL_EARLYCON && !ARM && !IA64
>> -       select FONT_SUPPORT
>> -       select ARCH_USE_MEMREMAP_PROT
>> +       bool "EFI early console support"
>> +       depends on FB_EARLYCON && !IA64
> 
> This doesn't sound right. Previously on my configuration it was
> selected automatically, now I need to select it explicitly? I mean
> that for me EFI_EARLYCON should be selected by default as it was
> before.

The problem I had with EFI_EARLYCON selected by default was that it 
would also carry fbdev with itself. Luckily, that's solved if it's moved 
to console subsystem.

> 
> ...
> 
>> +static int __init simplefb_earlycon_remap_fb(void)
>> +{
>> +       int is_ram;
> 
> + blank line.
> 
>> +       /* bail if there is no bootconsole or it has been disabled already */
>> +       if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
>> +               return 0;
>> +
>> +       is_ram = region_intersects(info.phys_base, info.size,
>> +                                  IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE);
>> +       is_ram = is_ram == REGION_INTERSECTS;
> 
> Was it in the original code? Otherwise, I would go with plain conditional:
> 
>    if (region_intersects())
>      base = ...
>    else
>      base = ...

It wasn't in original code. Original code assumed MEMREMAP_WC always
unless "ram" was specified as an option to efifb (e.g.
earlycon=efifb,ram). This code instead checks if the framebuffer is in 
RAM, and sets the mapping accordingly.

Another issue is that region_intersects() returns REGION_INTERSECTS 
(defined as 0) when true. I suppose we could use something like:

if (region_intersects() == REGION_INTERSECTS)
...

> 
>> +       info.virt_base = memremap(info.phys_base, info.size,
>> +                                 is_ram ? MEMREMAP_WB : MEMREMAP_WC);
>> +
>> +       return info.virt_base ? 0 : -ENOMEM;
>> +}
> 
> ...
> 
>> +static void simplefb_earlycon_write_char(u8 *dst, unsigned char c, unsigned int h)
>> +{
>> +       const u8 *src;
>> +       int m, n, bytes;
>> +       u8 x;
>> +
>> +       bytes = BITS_TO_BYTES(font->width);
>> +       src = font->data + c * font->height * bytes + h * bytes;
>> +
>> +       for (m = 0; m < font->width; m++) {
>> +               n = m % 8;
>> +               x = *(src + m / 8);
>> +               if ((x >> (7 - n)) & 1)
>> +                       memset(dst, 0xff, (info.depth / 8));
>> +               else
>> +                       memset(dst, 0, (info.depth / 8));
>> +               dst += (info.depth / 8);
>> +       }
>> +}
> 
> Wondering if we already have something like this in DRM/fbdev and can
> split into a generic helper.
> 
> ...
> 
>> +       ret = sscanf(device->options, "%u,%u,%u", &info.x, &info.y, &info.depth);
>> +       if (ret != 3)
>> +               return -ENODEV;
> 
> Don't we have some standard template of this, something like XxYxD,
> where X, Y, and D are respective decimal numbers?

I'm not aware of this.

> 

-Markuss
