Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9715A061BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A94610E8FA;
	Wed,  8 Jan 2025 16:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423A10E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:23:55 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-85bafa89d73so2709905241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736353434; x=1736958234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWaN/8ptyC2cYFUazZR9DiU44cT/Ebl32OM7k/AY7UI=;
 b=lV+uZqLxiPU4CayApuoHiM+cBNwx1zFXqDcXBT3IkDW/WG9L/m8vntjAujGRCly8/r
 6qiKR+NqRq4HV3X2VblBkryvXOTG5677boNx8WD0WyAdInOMfr4k3LCJzCxy6rEOY+0z
 /sy3VDZCm98mKxqKJyQ9HsBwB5pwJ88BnY0KHvlRDU9nKyh7/c6X7rKE4hAF33rWF0pD
 TR8zPUfqaDCWEeAjdfaSBYSOrE/RhOtxfidB6u3+aDfbeTR2f4x1IhLFQ1Isd4+YSKum
 uaCoMybniYGFGb4DBEss92y0IvbJcMxAglt0Dubm7RQv/N5YFKjBnOJ36YbQcoTljZLL
 +D4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwJ4gGZCD/FfINDQ8yKtWtekm0Xfq9tfwU97aDtxVyO4hNFBoHQsGCSGb9equgbamMuQGzYjsgXWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo4h5uN3HpQklBOvD217zZCbzWJ0YhycGtMizQgeqS5kwur8F1
 yG1rZjAW2OxlP2kO68W0Y49b15xpnqHIWfCvsOAwMMCYd34bhW8AgjerXHWx
X-Gm-Gg: ASbGncuMyk0rIHxurlOBGGWTAuzv7MyU11c6ZxaefpefUL0afmVNNHBFTzmJM9qIWRY
 EENw0xm0LlzsjZaVAhTruLZ/US7jfwwW18EV9w9jhS3E4ukABiOdCk63BtKyRdo7kAwgA/nZOoe
 IPywoeXdevUFlhWOO6pz96NxcSSydrgEWaXlrPDUdtQaTElf9iyFX7EUDIrxXTJNb7rBU7tHiD/
 4QMQiuLNWyu3tZjoqtC7aCnxL2TmCPWODxjxlJLy+DLOweUmJa+9BI+KyFfMnUYcVCCjduhfWxJ
 6AzM2ayP1s9lwnbMxGk=
X-Google-Smtp-Source: AGHT+IGcK8QGk2kXzfWHRfJYJf0ki6IBNXKT25rBrP6gGgvZ3bVLSSna7ccE+64ryFMKKWZWyoaIbA==
X-Received: by 2002:a05:6122:2a04:b0:518:778b:70a1 with SMTP id
 71dfb90a1353d-51c6c50f8e0mr2018280e0c.7.1736353433836; 
 Wed, 08 Jan 2025 08:23:53 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8610ad5a149sm8537438241.35.2025.01.08.08.23.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 08:23:53 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85b92397fe2so2747562241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:23:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/Bo0DOMm2kfrCeVIncrbaC66yD/pfK4zye7iwbDrw2ojR1vQG/hhBrjInVJWR/9+ArWmvBAI3sI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:26d4:b0:4b2:5d63:ff72 with SMTP id
 ada2fe7eead31-4b3d0fc1ca8mr2837377137.13.1736353432987; Wed, 08 Jan 2025
 08:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20250107095912.130530-1-tzimmermann@suse.de>
In-Reply-To: <20250107095912.130530-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 17:23:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKNq2PAef0tF_AJv7zgmXQpPgYs5Rwokjo=1M+2n2EBQ@mail.gmail.com>
X-Gm-Features: AbW1kvZp0cV5Of05CmFxR0NTT0IyghMVuM7nBAA7tF5qwUX0JfhnOOwbtasx9h8
Message-ID: <CAMuHMdXKNq2PAef0tF_AJv7zgmXQpPgYs5Rwokjo=1M+2n2EBQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix VGA I/O defines
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jan 7, 2025 at 10:59=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Including m86k's <asm/raw_io.h> in vga.h on nommu platforms results
> in conflicting defines with io_no.h for various I/O macros from the
> __raw_read and __raw_write families. An example error is
>
>    In file included from arch/m68k/include/asm/vga.h:12,
>                  from include/video/vga.h:22,
>                  from include/linux/vgaarb.h:34,
>                  from drivers/video/aperture.c:12:
> >> arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
>       39 | #define __raw_readb in_8
>          |
>    In file included from arch/m68k/include/asm/io.h:6,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:17,
>                     from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                     from include/linux/hardirq.h:11,
>                     from include/linux/interrupt.h:11,
>                     from include/linux/trace_recursion.h:5,
>                     from include/linux/ftrace.h:10,
>                     from include/linux/kprobes.h:28,
>                     from include/linux/kgdb.h:19,
>                     from include/linux/fb.h:6,
>                     from drivers/video/aperture.c:5:
>    arch/m68k/include/asm/io_no.h:16: note: this is the location of the pr=
evious definition
>       16 | #define __raw_readb(addr) \
>          |
>
> Include <asm/io.h>, which avoid raw_io.h on nommu platforms. Also change
> the defined values of some of the read/write symbols in vga.h to
> __raw_read/__raw_write as the raw_in/raw_out symbols are not generally
> available.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.DNEswlm8-lkp@i=
ntel.com/
> Fixes: 5c3f968712ce ("m68k/video: Create <asm/vga.h>")
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v3.5+

Thanks for your patch!

> --- a/arch/m68k/include/asm/vga.h
> +++ b/arch/m68k/include/asm/vga.h
> @@ -9,7 +9,7 @@
>   */
>  #ifndef CONFIG_PCI
>
> -#include <asm/raw_io.h>
> +#include <asm/io.h>

It definitely makes sense to include <asm/io.h> instead of
<asm/raw_io.h> in this file.

>  #include <asm/kmap.h>
>
>  /*
> @@ -29,9 +29,9 @@
>  #define inw_p(port)            0
>  #define outb_p(port, val)      do { } while (0)
>  #define outw(port, val)                do { } while (0)
> -#define readb                  raw_inb
> -#define writeb                 raw_outb
> -#define writew                 raw_outw
> +#define readb                  __raw_readb
> +#define writeb                 __raw_writeb
> +#define writew                 __raw_writew

OK

>
>  #endif /* CONFIG_PCI */
>  #endif /* _ASM_M68K_VGA_H */

I gave it a try on various configs, and inspected the impact
(none, except for killing the warnings), so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
