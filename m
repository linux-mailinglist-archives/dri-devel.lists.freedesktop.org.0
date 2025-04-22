Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54353A965BB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE3A10E19F;
	Tue, 22 Apr 2025 10:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388AA10E19F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:20:53 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-873a2ba6f7cso1691720241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745317251; x=1745922051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohxPhiK6YcJP8Y4tA22q1xDQLWt1Qweo8WFh3HJlJLE=;
 b=Fctf41gNVWz49q8Aw/du1TeTPbxiCxwY26t07RRSdjk/lDhr++rUs3w7fJ8oL5y1Mo
 Ba/zcCETYOWxmXTtO3UjDr5Jvp2SYiM3RF+EAGygbIWWSM9szzwa7Vb4QDs2bYOf7mSs
 knYFrKfuC5XaL7SM+mwu5cC60sv8fEJWBuArD4PW9tPU85SVrWJAfiyAMHb2UXAwqnlk
 VY2Gq79yj4EPo6mZZh2vum2snSNEzajkGq43SlU/WpSsexoE1BfwYYL2n2lPNQI9ovdu
 0nNmXPp4nJZ2HwUyllQcOQO0W02e1ea6CBmxYxPpyqBBWxTqW1R3dmoNOvd+W22ezgPX
 z7Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSriudcTC2v4j3F5DYJrmZdTrW2nSEnGzoRcuzoL9Xt3AcymcIes57impihK0lnKQNK5mA40SDqmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTosrQiqr0Gl9h1eDYfVSOI7/ZSINKP5rTSgCem8Bc2pX4Oa9A
 Qc4eaeymtAE3W9aKddgFI/Wzp1O2e0kd4sO+5lIIKTaP6ApHn0SAg/KeeYtG
X-Gm-Gg: ASbGncsiBM2H5H00D1xhpPpVNiOya0AhFxI1kQjrBe5k/dBPrG12oejEqwys32IsFVi
 kK48MtJOZIR7TBiMOkUR8ZCieM0VP8ucTcVson7lDGf/C4YhWzfxmj3xQUwoGXYrblsoIBfNnmN
 0N+0p/PMTC2fOqMvNDm8gdwkKbczYJZtGSq8gl3MNpe3dw08B6aM7EPT4qCoB+oFg+MaHzSTCuL
 EsayQ+n1cEVOH0mbVfFIE2jgKxfwjcps6BZrSZTqYAkmg9WLXW19dxRu1EULKcF0FC8q4cFgLFo
 fqzEVTvG6IqOhQjnLu7JvHHGZyv9T6ucrnF3Tv/1Fy7aDCnya7bl/tnke5cX5JXUAIUPJRAthrv
 Ztv4=
X-Google-Smtp-Source: AGHT+IErqzYg4cJiQnZHHzExPFajbSLqktpF+LDKexNCxKQxtJbMqRplzGbeu5XA+o0axQJ+1GKo7Q==
X-Received: by 2002:a05:6102:3b04:b0:4c3:6393:83f4 with SMTP id
 ada2fe7eead31-4cb800d7de2mr8593339137.2.1745317251257; 
 Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4cb7dd7be00sm2135679137.6.2025.04.22.03.20.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-86f9c719d63so1604798241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmhOby2MXizFUhoniP/Vjp5axRJ+77rj2iirfhrpRmkF77X8wkdz03r0AiUcOQopz5rn5Pxd10HA=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1173:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4cb8026372bmr8785686137.25.1745317250910; Tue, 22 Apr 2025
 03:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <aAdrkxhHaEpdl05d@smile.fi.intel.com>
In-Reply-To: <aAdrkxhHaEpdl05d@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:20:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
X-Gm-Features: ATxdqUENa0qwyfrGVHcZ3QDmHbGb5nSiuKchVuCF7S-gHUHHmDPBWDnwpEhdUFQ
Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>,
 alyssa@rosenzweig.io, 
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>, 
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

Hi Andy,

On Tue, 22 Apr 2025 at 12:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 22, 2025 at 10:07:33AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>
> ...
>
> > > +Generic FourCC code
> > > +-------------------
> > > +
> > > +::
> > > +       %p4c[hnlb]      gP00 (0x67503030)
> > > +
> > > +Print a generic FourCC code, as both ASCII characters and its numerical
> > > +value as hexadecimal.
> > > +
> > > +The generic FourCC code is always printed in the big-endian format,
> > > +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > > +
> > > +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > > +endianness is used to load the stored bytes. The data might be interpreted
> > > +using the host byte order, network byte order, little-endian, or big-endian.
> > > +
> > > +Passed by reference.
> > > +
> > > +Examples for a little-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> > > +       %p4cl   gP00 (0x67503030)
> > > +       %p4cb   00Pg (0x30305067)
> > > +
> > > +Examples for a big-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> >
> > This doesn't look right to me, as network byte order is big endian?
> > Note that I didn't check the code.
>
> Yes, network is big endian and this seems right to me. What is the confusion?

On a big-endian machine, it should print 0x67503030, like the host
or explicit big-endian output.

> > > +       %p4cl   00Pg (0x30305067)
> > > +       %p4cb   gP00 (0x67503030)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
