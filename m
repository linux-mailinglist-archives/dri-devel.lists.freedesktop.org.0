Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052BA98E84
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C607E10E6D1;
	Wed, 23 Apr 2025 14:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F80410E6D1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:56:58 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c54b651310so902686285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745420217; x=1746025017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hlyPTphf+x28unQ9fsmlIwni94vcWgQaX/dq2nBGd2c=;
 b=EJMxn+POtZ1hVALbtAHW/TOzxqtNBYC1lgHuFksPog6tr3lhnKyUQz4ONbbDDab0+R
 Z8Zv8kgm9MJPvGt1CRhhrjt1QhLbD8cKhf68xG/FdOIz/Ymi45LwsSrUckhM292Zt/Z5
 OE5tELGhRSjQs2qBDRqG0Qzr2n2g/boI37jVQ6YlH+N4dux2daCBDvXACe9N6BekbUHw
 SQK01xL7MD37vW/qr9CUAaIqVHoKBn02o5erjcs5O9pVpxiv+YH9WJ6lrmmBcTsNvmFO
 b8ENQcmvKslzuUKzdbyB+rbsPVem69tGdFuEl40g7IssbJEhD47MwfCt8v9R4n0HSxvt
 O8Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnu3nJrkh3TDtvH5AcUTs4WaMY6OUvZLhSbXlCS8FNYM6QUOzeDlwO9KP6NApzu60MO0XMzBNCrAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlTs7fAS3hP3/Q6h9R2S3Jmdrwu36zKM/HWaRn4xRMfNIeJoA2
 QCsQYRC+Dgrft9/TJSBBf6NPTjeUUKIGn+PQgyj40AddwwOmxPSHzM1jEqw/fH0=
X-Gm-Gg: ASbGnctsPUtKLOrVIbXrk455OyoN+TNvFwi0OG79fvErB/h186keXyUnuyi0d9rZDKz
 X3oSlA0jusemVJ++6bXxAunVEkX6La7wyfvKriZHC0QHqn/RzuLAl717cRb69YuT2RmOcfC4/iP
 z8cxmJ99Njg2w5dTKN03ywwfXN6l2zMAaiFxgMSLDKiN1cf4F08C3RVzb64GgJhy81cEtip9ul6
 PCBRw1VV8KutAJJb9FGrHh99F71L+x64qw7OlzMITi4get3ujtGBiATrtCXPfl8uKWXa6GxCC2y
 KSir8/IHDH8KxRK0Zav46DQUPlZfAWpEb1XV2sex2uMLPXY8JJk6S6MRTB5w/JQ6+Tc5SiG3QYz
 W37/JcAY=
X-Google-Smtp-Source: AGHT+IG6pkSa4O3smYZipMkrinKMTnJuL36JFOSN4oiYn/85MT935Y18bNXxGAPNv4x1ux0tOj4jHQ==
X-Received: by 2002:a05:620a:258b:b0:7c5:5f58:9158 with SMTP id
 af79cd13be357-7c927f590bfmr3285045385a.9.1745420216644; 
 Wed, 23 Apr 2025 07:56:56 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925ac2f27sm688965485a.54.2025.04.23.07.56.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 07:56:56 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-47ae894e9b7so109504081cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyVEn1AEmPLJD2rn0AHGJH4D8zizuWB+ykC80RYTrdmQqpINjCefGDz6z9i+TLLoHbN5BtIgTMXkQ=@lists.freedesktop.org
X-Received: by 2002:a05:6122:793:b0:526:285a:f4b3 with SMTP id
 71dfb90a1353d-529253b90f7mr17209301e0c.2.1745419814638; Wed, 23 Apr 2025
 07:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAjthvTuIeUIO4CT@pathway.suse.cz>
In-Reply-To: <aAjthvTuIeUIO4CT@pathway.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 16:50:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
X-Gm-Features: ATxdqUEtXjwX1Xvi6EF4OaIe3skICOJiGJO6vzaZtD0WSg84WGPiul-c6IaIVeg
Message-ID: <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>,
 alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Hi Petr,

On Wed, 23 Apr 2025 at 15:39, Petr Mladek <pmladek@suse.com> wrote:
> On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:
> > On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> > > >> From: Hector Martin <marcan@marcan.st>
> > > >>
> > > >> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> > > >> it's useful to be able to print generic 4-character codes formatted as
> > > >> an integer. Extend it to add format specifiers for printing generic
> > > >> 32-bit FourCCs with various endian semantics:
> > > >>
> > > >> %p4ch   Host byte order
> > > >> %p4cn   Network byte order
> > > >> %p4cl   Little-endian
> > > >> %p4cb   Big-endian
> > > >>
> > > >> The endianness determines how bytes are interpreted as a u32, and the
> > > >> FourCC is then always printed MSByte-first (this is the opposite of
> > > >> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> > > >> allow printing LSByte-first FourCCs stored in host endian order
> > > >> (other than the hex form being in character order, not the integer
> > > >> value).
> > > >>
> > > >> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > >> Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > >> Tested-by: Petr Mladek <pmladek@suse.com>
> > > >> Signed-off-by: Hector Martin <marcan@marcan.st>
> > > >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > > >
> > > > Thanks for your patch, which is now commit 1938479b2720ebc0
> > > > ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> > > > in drm-misc-next/
> > > >
> > > >> --- a/Documentation/core-api/printk-formats.rst
> > > >> +++ b/Documentation/core-api/printk-formats.rst
> > > >> @@ -648,6 +648,38 @@ Examples::
> > > >>         %p4cc   Y10  little-endian (0x20303159)
> > > >>         %p4cc   NV12 big-endian (0xb231564e)
> > > >>
> > > >> +Generic FourCC code
> > > >> +-------------------
> > > >> +
> > > >> +::
> > > >> +       %p4c[hnlb]      gP00 (0x67503030)
> > > >> +
> > > >> +Print a generic FourCC code, as both ASCII characters and its numerical
> > > >> +value as hexadecimal.
> > > >> +
> > > >> +The generic FourCC code is always printed in the big-endian format,
> > > >> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > > >> +
> > > >> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > > >> +endianness is used to load the stored bytes. The data might be interpreted
> > > >> +using the host byte order, network byte order, little-endian, or big-endian.
> > > >> +
> > > >> +Passed by reference.
> > > >> +
> > > >> +Examples for a little-endian machine, given &(u32)0x67503030::
> > > >> +
> > > >> +       %p4ch   gP00 (0x67503030)
> > > >> +       %p4cn   00Pg (0x30305067)
> > > >> +       %p4cl   gP00 (0x67503030)
> > > >> +       %p4cb   00Pg (0x30305067)
> > > >> +
> > > >> +Examples for a big-endian machine, given &(u32)0x67503030::
> > > >> +
> > > >> +       %p4ch   gP00 (0x67503030)
> > > >> +       %p4cn   00Pg (0x30305067)
> > > >
> > > > This doesn't look right to me, as network byte order is big endian?
> > > > Note that I didn't check the code.
> > >
> > > Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.
> >
> > Ah, I found it[1]:
> >
> > | so, it needs more information that this mimics htonl() / ntohl() for
> > networking.
> >
> > IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
> > while %p4ch and %p4cl yield different results on big-endian.
> >
> > > So here network means reverse of host, not strictly big-endian.
> >
> > Please don't call it "network byte order" if that does not have the same
> > meaning as in the network subsystem.
> >
> > Personally, I like "%p4r" (reverse) more...
> > (and "%p4ch" might mean human-readable ;-)
> >
> > [1] https://lore.kernel.org/all/Z8B6DwcRbV-8D8GB@smile.fi.intel.com
>
> I have to admit that I was always a bit confused by the meaning of the
> new modifiers. And I did give up at some point and decided to do not
> block the patch when it made sense to others.
>
> But I have to agree with Geert here. The current behavior of %p4ch
> is confusing on big endian system. I would expect that it does not
> revert the ordering.
>
> Well, I still think that people might find all 4 variants useful.
> Andy does not like "r". What about "hR"? It is inspired by
> the existing %pmR.

I am not a fan of complicating the format specifier even more by adding
more characters...  But seeing %pmR, I have to admit it does make sense.

> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.

Note that for IPv4 addresses we have %pI4, which BTW also takes [hnbl]
modifiers.

> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Thanks, LGTM!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
