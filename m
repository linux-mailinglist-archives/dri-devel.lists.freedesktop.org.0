Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EF86FE60
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77610FF27;
	Mon,  4 Mar 2024 10:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4370210FF26
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:07:37 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-609241c2696so41323467b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709546855; x=1710151655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ER0dUVit3cfqDNJxrJfG+KdxGIXN2zcWnKvfnV+eZ4A=;
 b=iejqClgU/Nqbx100TataG0NIfrG9hp0NWxqmeH2b+3R6+TI8wgQHjmmZgVpKRSfxje
 GpDMj0XXE6cv/Jhqw+K/82p6QE3AWHK0YZnbaOWrRTHBBt/bYySRR+9fISw1HQEC+Nnn
 UBLgT29jJrvbZMlWQNPz8NubIMHDUhULSErIOrs5qh+OYA7AYAIZUA54r/e3AEi/7r83
 n+ndm60PKui7m729TawiBBy4mtfiOXkR/jQ7L/6kkBnu/C4MIeHZm8yFcTl5M/xbKblr
 lBNfSwaddUmItriWyXrNI1XfaPD5Bx3jn2S91JqFTSc2DstAPvdsXyeg/rd3LBmagBbW
 TgOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtm4mJP0hnyyFOQnco0hjhacxF/Zo3KAPppLG8VU90P0L3V8Ab4MuSkzltgUHu8SS1JGBJ6iY2Ak5HxN8bkIDliGMzksum5iZWZnO0QTPI
X-Gm-Message-State: AOJu0Yw7R+bkkd6v5vfG/aaRqx/sBH5iFbjOMur6np6W96J76zRF5z2W
 9rv7FO5m0VO2suGYc9Qho5c4LLQU2WGFFIhZr5j0RJQgEIFmEIchZCe0//53zz8=
X-Google-Smtp-Source: AGHT+IENrhsXNWlTFOpa5gJC/TVHjVN6w66ZlC+wYv8vnP7Pad2GvjaYwJNyGCSHwjCe/hwuiDYlIQ==
X-Received: by 2002:a05:690c:fc3:b0:608:c42f:9080 with SMTP id
 dg3-20020a05690c0fc300b00608c42f9080mr9869959ywb.15.1709546855484; 
 Mon, 04 Mar 2024 02:07:35 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 n39-20020a81af27000000b0060485f86449sm2501456ywh.69.2024.03.04.02.07.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 02:07:35 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6095dfcb461so40086407b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:07:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+5wPhmmmkliR6kQRLU0jfRhrx250FWAajZZ2vm1xxUudpVaJp911sFbD/m1R8jKG4FOspvZ7XSG0gYnLu7ARdGrlj+F53JJhxOU2yLWS7
X-Received: by 2002:a81:9856:0:b0:609:7e98:1562 with SMTP id
 p83-20020a819856000000b006097e981562mr6776283ywg.38.1709546855021; Mon, 04
 Mar 2024 02:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
 <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
 <20240304-transparent-oriole-of-honeydew-f4174e@houat>
In-Reply-To: <20240304-transparent-oriole-of-honeydew-f4174e@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 11:07:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
Message-ID: <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <groeck@google.com>, 
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>, 
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

Hi Maxime,

On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> > > > On 3/2/24 14:10, Guenter Roeck wrote:
> > > > > While checkpatch is indeed of arguable value, I think it would he=
lp a
> > > > > lot not having to bother about the persistent _build_ failures on
> > > > > 32-bit systems. You mentioned the fancy drm CI system above, but =
they
> > > > > don't run tests and not even test builds on 32-bit targets, which=
 has
> > > > > repeatedly caused (and currently does cause) build failures in dr=
m
> > > > > code when trying to build, say, arm:allmodconfig in linux-next. M=
ost
> > > > > trivial build failures in linux-next (and, yes, sometimes mainlin=
e)
> > > > > could be prevented with a simple generic CI.
> > > >
> > > > Yes, definitely. Thanks for bringing that up.
> > >
> > > +1
> >
> > > Kisskb can send out email when builds get broken, and when they get
> > > fixed again.  I receive such emails for the m68k builds.
> >
> > Like this (yes, one more in DRM; sometimes I wonder if DRM is meant onl=
y
> > for 64-bit little-endian platforms with +200 GiB/s memory bandwidth):
> >
> > ---8<------------------------------------------------------------------=
-
> > Subject: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar =
04, 06:35
> > To: geert@linux-m68k.org
> > Date: Mon, 04 Mar 2024 08:05:14 -0000
> >
> > FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar 04, 06:35
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/15135537/
> >
> > Commit:   Add linux-next specific files for 20240304
> >           67908bf6954b7635d33760ff6dfc189fc26ccc89
> > Compiler: m68k-linux-gcc (GCC) 8.5.0 / GNU ld (GNU Binutils) 2.36.1
> >
> > Possible errors
> > ---------------
> >
> > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] u=
ndefined!
> > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > make[2]: *** [Makefile:1871: modpost] Error 2
> > make[1]: *** [Makefile:240: __sub-make] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
> > No warnings found in log.
> > ------------------------------------------------------------------->8--=
-
>
> The driver is meant for a controller featured in an SoC with a Cortex-A8
> ARM CPU and less than a GiB/s memory bandwidth.

Good, so the hardware cannot possibly need 64-bit pixel clock values ;-)

BTW, doesn't the build fail on arm32, too?


> And I just sent a fix for that one, thanks for the report.

Thanks!

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
