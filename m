Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA5A96618
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7110E19C;
	Tue, 22 Apr 2025 10:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D8210E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:38:28 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c081915cf3so678473885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745318307; x=1745923107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vytO4TOm8gf3AQur2lnADNQtT+Rd1ucyY5nITKDwjU=;
 b=xJD1QXrOyH5wEXZb1DT3wFRqQsCil+2NNKDsG3nb4h6GK7GBmqhRZY4iJLZLi0hVCj
 AaqruDg8kwlc5xLi6530R0VlOOLxEkY8LoT3BSSpTmnu3HKdm8gTJHIiCZ3AjAj5RfUZ
 NJip5ZqpM5QJ0sYM6vvUR189yRrs0hYXjwKfti+51tAq9I5i58+5wxeYgzTht6k+76z8
 FNU+MU1PfVqldV3gJ/Yu3vv2V1djkZ3Wrf+a7TAi3Ovj8BU8UCGvL12lX7IiG6Fm5Dv0
 XFeZ7KsAoGE+2BizxZ4BYGhof377R9wPqZHHhgDINFxQN0uUkIfzJ5e+GpLylwI+aAmX
 qzAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXntm3N5qCTjzpM/BXxS9Rr8l8nqh//hX3s8KvE6qM9Ya6DWJ4Eh7MZ2ue2Nhg0nCtNgQHsptdnWZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHX4lj++PXD16ZikFzCqDX1CrceDR701YoVsJiTt3FAk9Z9Ubp
 /UQlypZOnL35Q8li3TqXDBqW8GOBEsXzfVdosXZ9stFaih9sag0jHQm2VFV+
X-Gm-Gg: ASbGncvcpT8pOwsZAmeiTrfwgGk6fOyabgnscL9QbOl80psH9BbXEjvH9XnCS8jTjQZ
 Sag8hHlZSAfgA4rZziIp0FZP5Vj/SHq2dfbuHteFr5gJenklsmtpiDLPFuBBnWyMqgW20sge49E
 a5hww/Fx0UPyy+arpYQMZDki4Npa38fOOXZ3UYlegIlLidurFvU6+jkKA+glQWqjMx/exg567Z1
 +vPLJYQy7jk2OOQl2UurcP45+a5SBt0j8APYyAlc8UXsEsWIg5JBLpAA0Y/SD6Y0fRYnMJrON15
 tjltweQaw/EtIKvtAef3FcGdvBOQidAitqiEZbmPw78/gx8sJ6R88a+fOcLQHD9nVElndTgmLvg
 ljWk=
X-Google-Smtp-Source: AGHT+IFEsC+4NJXqZZGxnVUHlDznXVdallNNrZXzbqc+Nz9yvd71UyFT+7ZnI+APvFqXKYG3DwAGWA==
X-Received: by 2002:a05:620a:4156:b0:7c5:562d:ccfa with SMTP id
 af79cd13be357-7c9280167a6mr2762597085a.36.1745318306643; 
 Tue, 22 Apr 2025 03:38:26 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925ac5f78sm540573185a.65.2025.04.22.03.38.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 03:38:26 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6e8f05acc13so65200266d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPgBy0UZxTMKHYHuVLqdwIAc65JnRlTB/bRA875O3JlrOAHhhFNscOFV2CA7PQttYLhmMRhDHw1Ts=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3139:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4cb80232571mr8147349137.25.1745317975059; Tue, 22 Apr 2025
 03:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
In-Reply-To: <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:32:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
X-Gm-Features: ATxdqUFtFyy2GYQo3KtAmKWE1aHynw34_2Dg7VBWf7uTMs4ERXRYeYaDF1kqp6E
Message-ID: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
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

Hi Andy,

On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 22, 2025 at 10:43:59AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>
> ...
>
> > > Originally, it was %p4cr (reverse-endian), but on the request of the
> > > maintainers, it was changed to %p4cn.
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
>
> It will confuse the reader. h/r is not very established pair. If you really
> wont see h/n, better to drop them completely for now then. Because I'm against
> h/r pair.

I am not against h/n in se, but I am against bad/confusing naming.
The big question is: should it print
  (A) the value in network byte order, or
  (B) the reverse of host byte order?

If the answer is (A), I see no real reason to have %p4n, as %p4b prints
the exact same thing.  Moreover, it leaves us without a portable
way to print values in reverse without the caller doing an explicit
__swab32() (which is not compatible with the %p pass-by-pointer
calling convention).

If the answer is (B), "%p4n using network byte order" is bad/confusing
naming.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
