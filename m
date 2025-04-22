Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A095FA96090
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D667510E532;
	Tue, 22 Apr 2025 08:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684B210E532
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:07:49 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-523dc190f95so2063097e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745309266; x=1745914066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8c8ma1h4TTKBEevU7DpgPt28PGW8UxGjza0Ib9e0KQ=;
 b=J76LhN2qbgDXnanXMdiE2UMWG+xFAmxE0hX85XgdBZfVSJNiwRZFB7J5rTqqxVvI0S
 Ku+S0utGsMiBdzHG+BYeKGoK+HiCrko+jAyC7oc/BhqCfZguJ9c86vxUK0sU71LvfXRL
 u4WciRPqMMQypNDmngeCDrMaOI79r4HM1vUkVUeR7ly11qLEmYysKaHKpmOJQYGCn23/
 BGFI32VzAYsC44gTgXyIh+X7kVbLG401gauROYQ2njbYLXe0k9vKe/gYMYdLXLFQKrZz
 mB6AOH+Gg4YQwXrBLmt1w3XxvA+OPH29eNHG8g6qRvy9ZZeOXx+qjbhuRuc/1EigR6WA
 EDGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhyNzIH5/ovzrSIeCDaF1ihubsLZ0btjLrhYTUxXHaMzeHuLC2U3m0pKNkhSmUr170SSw0WvpbfMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkcuTYpaKKmEBuIXo8P9LylcZj10uhlgkNxzrw4lzpjEctNLFQ
 N+q38ZrqJZQUDpTYaU9shnZn9O7nSu6x57DldDvA9kV/rCc30ceGtDXDp4v7
X-Gm-Gg: ASbGncuQZBVnkgzPiQ/2kgZ1JNc/gkKJKVaQz5KOBVRNFf9NfoSaQ0AwmHKXJ0kninX
 OyqduARb3cFeVgzb3egjH4zku9nodAW72Oy8gNo/WHtMQf47dtSEzfR5dVf5kx84euR1xAAylS9
 1q4V9zGVUKQwkrMzJ+bMDLapISk4VgCekoh30QMoud3hjYkZfRDDtf4+Gna5d5RK3RvuW74Of1Q
 qzZAf/YGdYv3u9IaO07MdPZDPHi93TfUGUmNgwdnrqOhLTGeyKXOreUDd9nSkWQMRmfHor9Gas+
 u1gclMHbFjMNTibgvhuLi7jKDiOjaZbpVfusjJNqHYvCaMNAak/jpMrMITsrtsv/gBa40t6cEUj
 vTcKvTZB6x5itvQ0G6Q==
X-Google-Smtp-Source: AGHT+IFzFPMoql4ko9/KXSd0IhJYhZMEX4mTd/XtC3G2DhQnDklL5FUBBHjiprZvGwOVSyem3sWG1Q==
X-Received: by 2002:a05:6122:1ace:b0:528:4f4b:f0c0 with SMTP id
 71dfb90a1353d-5292540fdabmr9832623e0c.5.1745309266259; 
 Tue, 22 Apr 2025 01:07:46 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52922d8b0a3sm1844205e0c.35.2025.04.22.01.07.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:07:45 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-5259327a937so1712974e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:07:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8uhalvdt7VCrCKf5j+cCwckZAKiiddYcKDrc4LEpdJYC3Vvn3wvb/jCJfVaAJmNVukHx7kWgKWZU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5f09:b0:4bb:c24b:b644 with SMTP id
 ada2fe7eead31-4cb802080d4mr7323250137.20.1745309264946; Tue, 22 Apr 2025
 01:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 10:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
X-Gm-Features: ATxdqUEkl9rVCtzV1tSRbSe8H75mXfNa-MVqCJWBKpRzjTvK50pHzHN-MSLc5t4
Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>, 
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
 Asahi Linux Mailing List <asahi@lists.linux.dev>
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

Hi Aditya, Hector,

On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FourCCs with various endian semantics:
>
> %p4ch   Host byte order
> %p4cn   Network byte order
> %p4cl   Little-endian
> %p4cb   Big-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FourCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> allow printing LSByte-first FourCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Thanks for your patch, which is now commit 1938479b2720ebc0
("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
in drm-misc-next/

> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -648,6 +648,38 @@ Examples::
>         %p4cc   Y10  little-endian (0x20303159)
>         %p4cc   NV12 big-endian (0xb231564e)
>
> +Generic FourCC code
> +-------------------
> +
> +::
> +       %p4c[hnlb]      gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The generic FourCC code is always printed in the big-endian format,
> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> +
> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> +endianness is used to load the stored bytes. The data might be interpreted
> +using the host byte order, network byte order, little-endian, or big-endian.
> +
> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)
> +       %p4cl   gP00 (0x67503030)
> +       %p4cb   00Pg (0x30305067)
> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)

This doesn't look right to me, as network byte order is big endian?
Note that I didn't check the code.

> +       %p4cl   00Pg (0x30305067)
> +       %p4cb   gP00 (0x67503030)
> +
>  Rust
>  ----
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
