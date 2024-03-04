Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE586FB5F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8F810FE12;
	Mon,  4 Mar 2024 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12310FE12
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 08:12:53 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6087396e405so41597437b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 00:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709539972; x=1710144772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2J1p7SXZtqr3McfoeaXd0vJRTrL26m9P2IwKT4zVhdI=;
 b=WE0eZ6jKlBhUPOSdzvRrseLoZKvCJ1bJVIDD40Y0deFZipxfCuH4ZoOkbBNP0BBgnb
 G5Z3Qogr8Wq8nOZDaOyIREMIvp+9sxSX1nucIqorafDcakNk9qaR+JwVA0Sk9RNVNUmz
 wF+sWspGCvNnKXY8c0DE6ZThTlavu9qeWEUkHU6bqAJmnyAPpWtysJCx1YDla6tXPikJ
 x2aDJC1B3126NMpn50tN2+7qYkTVImS0yBdjOn6Uzf7mdqiNkpPvfNcrAeKJ0kF8Y02V
 X0dXvCsSvGMLYVcRy6swe2x2Z5OVrqPN4x1bVI2KYaXdqo0yn7mFgzx1pBD8h5aCLXaE
 riLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1LAPxs3pwl+fF6H8FKWFRrDcLnwTCSPliKadrq6woTq4NPUfxJzW2UlyKV9uvw5CJq+O7ehNuETUi/JT9uqZahprEmnio8taB8G90D3y4
X-Gm-Message-State: AOJu0YzfoTKlxs2oEk1iXN38HrBDpu/EGWFGiyTovMOB6McEC1dpSkK5
 QdzpxpUJxWrPgO67Nb5U4y0lbNlJ+ktgEAV6o1lK/T3OeU1zkCjd5XaAcfQ8sqc=
X-Google-Smtp-Source: AGHT+IEIrHAnEQR64lX/ascT6CT5rKO76Tt91Ih/Hz+dLd6y9g9dNx6kEF/+F0bYrWri4PRT0DNgyA==
X-Received: by 2002:a05:6902:2493:b0:dcc:6894:4ac0 with SMTP id
 ds19-20020a056902249300b00dcc68944ac0mr6719312ybb.20.1709539971590; 
 Mon, 04 Mar 2024 00:12:51 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5b0d46000000b00dc254858399sm2049872ybr.2.2024.03.04.00.12.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:12:50 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-607e54b6cf5so26969467b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 00:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeIrqTgIFFI+CTyONpBqOmrIWH6o5QjCPnWq8EiuterW+Atg2Une9XUBZsJq2h7s8sMqa/EvOXhxt3Y5zKNhCZKparjN8k7Qa3Mv0xtYcW
X-Received: by 2002:a81:451c:0:b0:609:7699:dc63 with SMTP id
 s28-20020a81451c000000b006097699dc63mr5362566ywa.9.1709539970555; Mon, 04 Mar
 2024 00:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
 <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 09:12:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
Message-ID: <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <groeck@google.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, 
 Nikolai Kondrashov <spbnick@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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

On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> > On 3/2/24 14:10, Guenter Roeck wrote:
> > > While checkpatch is indeed of arguable value, I think it would help a
> > > lot not having to bother about the persistent _build_ failures on
> > > 32-bit systems. You mentioned the fancy drm CI system above, but they
> > > don't run tests and not even test builds on 32-bit targets, which has
> > > repeatedly caused (and currently does cause) build failures in drm
> > > code when trying to build, say, arm:allmodconfig in linux-next. Most
> > > trivial build failures in linux-next (and, yes, sometimes mainline)
> > > could be prevented with a simple generic CI.
> >
> > Yes, definitely. Thanks for bringing that up.
>
> +1

> Kisskb can send out email when builds get broken, and when they get
> fixed again.  I receive such emails for the m68k builds.

Like this (yes, one more in DRM; sometimes I wonder if DRM is meant only
for 64-bit little-endian platforms with +200 GiB/s memory bandwidth):

---8<-------------------------------------------------------------------
Subject: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar 04, =
06:35
To: geert@linux-m68k.org
Date: Mon, 04 Mar 2024 08:05:14 -0000

FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar 04, 06:35

http://kisskb.ellerman.id.au/kisskb/buildresult/15135537/

Commit:   Add linux-next specific files for 20240304
          67908bf6954b7635d33760ff6dfc189fc26ccc89
Compiler: m68k-linux-gcc (GCC) 8.5.0 / GNU ld (GNU Binutils) 2.36.1

Possible errors
---------------

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undef=
ined!
make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
make[2]: *** [Makefile:1871: modpost] Error 2
make[1]: *** [Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

No warnings found in log.
------------------------------------------------------------------->8---

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
