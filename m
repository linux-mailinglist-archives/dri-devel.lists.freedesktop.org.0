Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7265847A7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FC310EDD8;
	Thu, 28 Jul 2022 21:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754CF1124DD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 21:20:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ez10so5192734ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jAkPCigVLHrBtqVHphR26WDxi2DiUpnm1/Y0dqLKCmQ=;
 b=KbVm0qMVYx6vAxplpGdfXideOWadbCD17AoB6s1oPdJt9SKVU6HKNYR+4upp5Hraox
 rKn4Zxp0+fUK/toeW5i8cJnWIhfI0ZlJoGYsTejB23pW7LPgvi2BEHFLsCJ30EI6/tpC
 Ub2FuHYTmWrmJiwVXW5rd62zdJeSf3dY11EDMoJeJs90LjYKh3CbamhFS7B6ycXjB3kp
 L35BWmWGVi7yBMK/dodfGmDAXhcPMSzTNNe8Eu9EKUMyWYxlTEztLZ+xLdQy1jL+hyX1
 lt6JMpN1t2Uam6JuAofdK4MkGDtJ7PppBxIsmz5MPyCUsCNCQeKHqF/tMphkBPD43xWL
 Nlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jAkPCigVLHrBtqVHphR26WDxi2DiUpnm1/Y0dqLKCmQ=;
 b=fkuXLnZWMXjGmv0/eYnGMJq5aO8gw+59AkJdmGnXEDMNP/3MRDaHjPrBckurZkaBA+
 G1YOYa0bDE3h3XXQtfO3G7MFi8nyyam4b+5x+7BHid4WC9cj3G5AW+xzvH3VW6uY6Xpm
 M3DsxYZB6hzxAFuFonxWGZG6heD8O4ZDVUs7nq2imJIH5Oy1zEQ9pCrLmUhHb4OH7Ohq
 m+mPaMDGjoirzMrUyeQOu9O9usGWckbc0rGszw4U08VYsp7B4eT70zf0vS7Utbh6Aigy
 vLV802AZ7WjvgYfuU7blCisBrBEMCUyWqnVRw7iKyGNRF/fcpDQAUfA3QPRYg9ZA7zLm
 CiKA==
X-Gm-Message-State: AJIora8ptZ2oeqEtho5EZPvNaoaN1JjqT5TbKea0RlZBIPXylm2opdhK
 j2GsbgElndA0fnYBjwvTO1GX25lK9yEs2zhHdpg=
X-Google-Smtp-Source: AGRyM1te7Y5AHT6zHCE8M+M/Z37sGPGv8DKdrNYWIqZIHSDo7p9FDRZzoAwJaLCAER4a8q5/V+tMn3CP6GPk0Cf8U7Q=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr559720ejc.365.1659043232735; Thu, 28
 Jul 2022 14:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
In-Reply-To: <20220728142824.3836-3-markuss.broks@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Jul 2022 23:19:55 +0200
Message-ID: <CAHp75VdaDyyqRw9fAkUOhNjsyifeozVx6JuYXSU1HpoO+VHDNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
To: Markuss Broks <markuss.broks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jul 28, 2022 at 4:32 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Add early console support for generic linear framebuffer devices.
> This driver supports probing from cmdline early parameters
> or from the device-tree using information in simple-framebuffer node.
> The EFI functionality should be retained in whole.
> The driver was disabled on ARM because of a bug in early_ioremap
> implementation on ARM.

...

> -               efifb,[options]
> +               efifb
>                         Start an early, unaccelerated console on the EFI
> -                       memory mapped framebuffer (if available). On cache
> -                       coherent non-x86 systems that use system memory for
> -                       the framebuffer, pass the 'ram' option so that it is
> -                       mapped with the correct attributes.
> +                       memory mapped framebuffer (if available).

If somebody passes those (legacy) options, what will happen?

...

>  config EFI_EARLYCON
> -       def_bool y
> -       depends on SERIAL_EARLYCON && !ARM && !IA64
> -       select FONT_SUPPORT
> -       select ARCH_USE_MEMREMAP_PROT
> +       bool "EFI early console support"
> +       depends on FB_EARLYCON && !IA64

This doesn't sound right. Previously on my configuration it was
selected automatically, now I need to select it explicitly? I mean
that for me EFI_EARLYCON should be selected by default as it was
before.

...

> +static int __init simplefb_earlycon_remap_fb(void)
> +{
> +       int is_ram;

+ blank line.

> +       /* bail if there is no bootconsole or it has been disabled already */
> +       if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
> +               return 0;
> +
> +       is_ram = region_intersects(info.phys_base, info.size,
> +                                  IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE);
> +       is_ram = is_ram == REGION_INTERSECTS;

Was it in the original code? Otherwise, I would go with plain conditional:

  if (region_intersects())
    base = ...
  else
    base = ...

> +       info.virt_base = memremap(info.phys_base, info.size,
> +                                 is_ram ? MEMREMAP_WB : MEMREMAP_WC);
> +
> +       return info.virt_base ? 0 : -ENOMEM;
> +}

...

> +static void simplefb_earlycon_write_char(u8 *dst, unsigned char c, unsigned int h)
> +{
> +       const u8 *src;
> +       int m, n, bytes;
> +       u8 x;
> +
> +       bytes = BITS_TO_BYTES(font->width);
> +       src = font->data + c * font->height * bytes + h * bytes;
> +
> +       for (m = 0; m < font->width; m++) {
> +               n = m % 8;
> +               x = *(src + m / 8);
> +               if ((x >> (7 - n)) & 1)
> +                       memset(dst, 0xff, (info.depth / 8));
> +               else
> +                       memset(dst, 0, (info.depth / 8));
> +               dst += (info.depth / 8);
> +       }
> +}

Wondering if we already have something like this in DRM/fbdev and can
split into a generic helper.

...

> +       ret = sscanf(device->options, "%u,%u,%u", &info.x, &info.y, &info.depth);
> +       if (ret != 3)
> +               return -ENODEV;

Don't we have some standard template of this, something like XxYxD,
where X, Y, and D are respective decimal numbers?

-- 
With Best Regards,
Andy Shevchenko
