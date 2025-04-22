Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2910A9623C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7210E539;
	Tue, 22 Apr 2025 08:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ACE10E539
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:44:16 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-86715793b1fso1702243241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745311455; x=1745916255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mLaMluqDEwjyr3+Ikq130BwnO35HxC0ThAvpH6TmcJU=;
 b=NrKYFUmg5qkoKUWuT5YXP8HFvH4MjOx/wMWfHFfRKjfRAgxQ1OU4rU8jygf3FqhYRA
 Zr8l79Q34K4ZhVtyeJOU3NZRBQ5DsXhGSai0cyOiPnbrYZvYhJsfpiYznmTNZVMV7ZQF
 2hDd8H5XRNB3IVhuMdpljn7BnnuZISKavWoIpW8VexS9yIReOVhvy0z4ZgK7pxOmOrY+
 tV1gl3RtIDMyPspms8CLKZ0yEYfggpKh+fZmdmLsmicdbxsoWnyx1AM41cra73V7eU25
 a5tj5i/U5N1SIey+2c6fV8GWJEbia4/DQBgYhXAaFqZHTRNO6T78k4qDhPzyRyOPKuc9
 sRGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUYNV/Lhx+XYBVks3OGmxm773/sedxt4weNGRY92xb64ji8P0BRrV2BBLPl92xGzOoQQL8msoxhEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF1rIRhoOMd2MfkyPIzx2b8i2Xj3xjoLvaPXoGtkCWCXaYbq7H
 6BWtaNqf9qp/JPevdEFtWP5lkEMwwRSfu80kao3Afl94HWxh7TcqFbra7rCj
X-Gm-Gg: ASbGncvGXnpBbVuFhGPaXEgDSAFN852pQgRB0g8LuZFMHXjpqsMw5/BR6fe27cud5G4
 ddoGI+9kp9cUhyJNUPqOlmt3Y2lQsfxA4mEiYk+l2sqUqMdtUIZy3H7j1ArXMSkGoVKm+YZNYfU
 oad0yWfUs0gQ2tfIvWvJZkdGmgO6yOZrbhuWEpi2amm1m81ADYqyEyO4l8zdns64+Lw4IQdqOkL
 QQEr97ILEaQWZboaT+ZPMZ8q2wvLpxmvOrrBY4a1kbjwooJA31PXCqpF+CB+lFUPNkRaPQry+nE
 QdZTI3BTtCih8drmHkUnTzlGcFW3N41tPx9///TvmPFqewqQG33qEL/HoQLGA7ZYUtubM7So7zk
 TE2u1Pd8=
X-Google-Smtp-Source: AGHT+IFTTMDTjHGacRjTgr+Cj5y7DagUWERn9yxlYGC+lzVQnsHbca/+PdNbQWVkOJORd2OL3JaQow==
X-Received: by 2002:a05:6102:a06:b0:4c5:1bff:4589 with SMTP id
 ada2fe7eead31-4cb80207fa1mr8587345137.22.1745311454770; 
 Tue, 22 Apr 2025 01:44:14 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4cb7dd7b1c0sm2176106137.1.2025.04.22.01.44.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:44:13 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-523ee30e0d4so2090275e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVqJ+R2Qc5vvtBx9kA77rfHVfuovzrkkP2cv2yW5vVKiw1VY8mPJPxRcRUVNBGolh4nXWMqaIspPDg=@lists.freedesktop.org
X-Received: by 2002:a05:6122:3c44:b0:520:61ee:c815 with SMTP id
 71dfb90a1353d-529254ff048mr10359604e0c.10.1745311453748; Tue, 22 Apr 2025
 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 10:43:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
X-Gm-Features: ATxdqUE7mMMNjQJXGhijqI3kY1zbATKtnGoK226m5ymri0gv1G5LUPASpBBxpD0
Message-ID: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Petr Mladek <pmladek@suse.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
 tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aditya,

CC netdev

On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> >> From: Hector Martin <marcan@marcan.st>
> >>
> >> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> >> it's useful to be able to print generic 4-character codes formatted as
> >> an integer. Extend it to add format specifiers for printing generic
> >> 32-bit FourCCs with various endian semantics:
> >>
> >> %p4ch   Host byte order
> >> %p4cn   Network byte order
> >> %p4cl   Little-endian
> >> %p4cb   Big-endian
> >>
> >> The endianness determines how bytes are interpreted as a u32, and the
> >> FourCC is then always printed MSByte-first (this is the opposite of
> >> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> >> allow printing LSByte-first FourCCs stored in host endian order
> >> (other than the hex form being in character order, not the integer
> >> value).
> >>
> >> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Reviewed-by: Petr Mladek <pmladek@suse.com>
> >> Tested-by: Petr Mladek <pmladek@suse.com>
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> >
> > Thanks for your patch, which is now commit 1938479b2720ebc0
> > ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> > in drm-misc-next/
> >
> >> --- a/Documentation/core-api/printk-formats.rst
> >> +++ b/Documentation/core-api/printk-formats.rst
> >> @@ -648,6 +648,38 @@ Examples::
> >>         %p4cc   Y10  little-endian (0x20303159)
> >>         %p4cc   NV12 big-endian (0xb231564e)
> >>
> >> +Generic FourCC code
> >> +-------------------
> >> +
> >> +::
> >> +       %p4c[hnlb]      gP00 (0x67503030)
> >> +
> >> +Print a generic FourCC code, as both ASCII characters and its numerical
> >> +value as hexadecimal.
> >> +
> >> +The generic FourCC code is always printed in the big-endian format,
> >> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> >> +
> >> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> >> +endianness is used to load the stored bytes. The data might be interpreted
> >> +using the host byte order, network byte order, little-endian, or big-endian.
> >> +
> >> +Passed by reference.
> >> +
> >> +Examples for a little-endian machine, given &(u32)0x67503030::
> >> +
> >> +       %p4ch   gP00 (0x67503030)
> >> +       %p4cn   00Pg (0x30305067)
> >> +       %p4cl   gP00 (0x67503030)
> >> +       %p4cb   00Pg (0x30305067)
> >> +
> >> +Examples for a big-endian machine, given &(u32)0x67503030::
> >> +
> >> +       %p4ch   gP00 (0x67503030)
> >> +       %p4cn   00Pg (0x30305067)
> >
> > This doesn't look right to me, as network byte order is big endian?
> > Note that I didn't check the code.
>
> Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.

Ah, I found it[1]:

| so, it needs more information that this mimics htonl() / ntohl() for
networking.

IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
while %p4ch and %p4cl yield different results on big-endian.

> So here network means reverse of host, not strictly big-endian.

Please don't call it "network byte order" if that does not have the same
meaning as in the network subsystem.

Personally, I like "%p4r" (reverse) more...
(and "%p4ch" might mean human-readable ;-)

[1] https://lore.kernel.org/all/Z8B6DwcRbV-8D8GB@smile.fi.intel.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
