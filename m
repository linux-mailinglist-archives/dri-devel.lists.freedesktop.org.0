Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D389558B876
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 23:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F435113024;
	Sat,  6 Aug 2022 21:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1D112AA6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 21:38:13 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 17so4175164qky.8
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MfKNCdoirxc2xo2dJ2ZnrKHYVycXxfrXH8JNH8fm1Y8=;
 b=YBzle4Bzk8bMM2eG1wG0QftAx91m2KHC2NzsZY+bkn3ddnh1U940M/jxSnYcV7UjIc
 pKdr3JCm6dxKjr9Hb2YoyGGOlso4bztjd2UILk6zq6O2FGtlS2u6FlMhyadpHXVi+OQ4
 VLFnXJt0xdQYzrfMfNi5GuvEG+2nm5LIWyd/WwVe/+vURptktX6hP5gZ+kqvBnq5GW/x
 uOYMEySPd9JJ4EjR9eel8ie2TJuDeTQgonSosqk441GIXY39IMjaq9ezX4siGpJPGaNe
 dumUqe4+XqL9xkAHhTVD7Bi6ZhQIocYnNbNY/wY9R8aWANkblzYAgHFibHzxlMWRpxl6
 C9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MfKNCdoirxc2xo2dJ2ZnrKHYVycXxfrXH8JNH8fm1Y8=;
 b=YWS++ZTcmsT+emIwDFy4KTUFQwh0J+iYJ0B3fAjsi07tXhudNV3bYtqwVamGxVrHO0
 +4PpmH2M+0zl/6xYTBfjz0vEg6PvWI0kJxjBAe+eb/Ryd5WI71VKbACj9TwUWXaOmWev
 /zbHOqr6jomjPAeBlcR+qGFL2EpHZ9qY0b2AvuHhXbWaN7tGepStoKBASLnf5FrXzBUl
 8io8PttP2v1u1m0DlgYiCp1pRzuMcPOSF5sjhdFFENB3kwsf++EEi3kZZLgPHR+l/7HA
 1oZT2KAxquTnT4p5WZwYTdnhiAATIU6KLxSzRRQ2ert1x/GB1dnxrEnnkP0o8nuhBy2W
 45lA==
X-Gm-Message-State: ACgBeo3gWOiw/bEqoTjKJ/X7ew7CTY8hZ214i95CF2VMSQDT7K2FRxIm
 5qElABRXOatUaJXhhAx9Egu2oVxE4F9PvVB4ia8=
X-Google-Smtp-Source: AA6agR56Da74aJjiF+4nLUKRTvJqjbVZJG6Bbd44zgX3ASwhuBBjAStAwYDAMCCSp6ij5AOPtil/tLlaj2OWYcKKILA=
X-Received: by 2002:a05:620a:8018:b0:6b6:5df:977 with SMTP id
 ee24-20020a05620a801800b006b605df0977mr9477710qkb.320.1659821892589; Sat, 06
 Aug 2022 14:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220806163255.10404-1-markuss.broks@gmail.com>
 <20220806163255.10404-4-markuss.broks@gmail.com>
In-Reply-To: <20220806163255.10404-4-markuss.broks@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Aug 2022 23:37:35 +0200
Message-ID: <CAHp75VcMgFQJoFC68GCTej--44+iFWXEpjh2Q7O0XbHk588OCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] efi: earlycon: Add support for generic
 framebuffers and move to console subsystem
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
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 6, 2022 at 6:38 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Add early console support for generic linear framebuffer devices.
> This driver supports probing from cmdline early parameters
> or from the device-tree using information in simple-framebuffer node.
> The EFI functionality should be retained in whole.
> The driver was disabled on ARM because of a bug in early_ioremap

We refer to functions like func().

> implementation on ARM and on IA64 because of lack of early_memremap_prot.

Ditto.

...

> +#include <asm/early_ioremap.h>

Can it be placed after linux/* ones?

> +#include <linux/console.h>
> +#include <linux/efi.h>
> +#include <linux/font.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/serial_core.h>
> +#include <linux/screen_info.h>

...

> +static int __init simplefb_earlycon_remap_fb(void)
> +{
> +       unsigned long mapping;

+ Blank line.

> +       /* bail if there is no bootconsole or it has been disabled already */
> +       if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
> +               return 0;
> +
> +       if (region_intersects(info.phys_base, info.size,
> +                             IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE) == REGION_INTERSECTS)
> +               mapping = MEMREMAP_WB;
> +       else
> +               mapping = MEMREMAP_WC;

> +       info.virt_base = memremap(info.phys_base, info.size, mapping);
> +
> +       return info.virt_base ? 0 : -ENOMEM;

Easier to read the standard pattern:

  if (!info.virt_base)
    return -ENOMEM;

  return 0;

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

I would write it as

  x = src[m / 8];

> +               if ((x >> (7 - n)) & 1)

> +                       memset(dst, 0xff, (info.depth / 8));

Too many parentheses.

> +               else
> +                       memset(dst, 0, (info.depth / 8));

Ditto.

> +               dst += (info.depth / 8);

Ditto.

> +       }
> +}

-- 
With Best Regards,
Andy Shevchenko
