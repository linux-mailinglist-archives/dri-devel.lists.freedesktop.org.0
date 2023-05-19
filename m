Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F405F709A44
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 16:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4210E486;
	Fri, 19 May 2023 14:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA61810E4E3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:44:41 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-ba8374001abso4583784276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684507480; x=1687099480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmkRRs7o/GrPNRsnjEmMyXFmswNShBvbUzfAdFFg2lA=;
 b=EG9aXbSIdcA1ohGCDssqlAv1sYmD7uy1RoRvD42jkR53WsD2SU8bCAxOp2BItdethp
 93YHZHPDU7/XVof+6RLI2oUPDtsZHJm7UyrwQedqHmGpsK8VVZ5c0KuzV6k2mayPSgfA
 F8KSYUrwHzpznqFfmVkMzFhY6pKqp8QXFCC/ZYvo+q+Hb+X5POzy9LRScVtEgNYu0FAN
 Vbmr03KIbGD9Cv9UxeCe5j4j+bGUJ1OEYfy+XH9A1fsdluKJSMFq7QushEU6FIAR9lPE
 oHnMU7FjXGrQEZco4R3V01bPViT4JRGIfI+iQJhKsEj46nMgTtBzD2cb1XKDeoqJC7a4
 JUaA==
X-Gm-Message-State: AC+VfDzH/brI5ZtE/bjgen7SMgywIDVOIrHy82nLZOBWcggO618sU9uN
 sNheoSFNYKU3su8DBTMFR9mD2OvrfCQa0w==
X-Google-Smtp-Source: ACHHUZ4mVROlhV8lFou2aGHCZJhjpjtP7AuYS4FJ1UnaATU/5Y2kpdZ+P2T1NeFApIx6X8cXOfXZOQ==
X-Received: by 2002:a25:aacc:0:b0:ba8:1912:1f0b with SMTP id
 t70-20020a25aacc000000b00ba819121f0bmr1833093ybi.22.1684507480223; 
 Fri, 19 May 2023 07:44:40 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 x136-20020a25ce8e000000b00ba87e9b5bf9sm1076021ybe.45.2023.05.19.07.44.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 07:44:39 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-56186035b61so44827947b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:44:39 -0700 (PDT)
X-Received: by 2002:a0d:c043:0:b0:562:7f3:bee6 with SMTP id
 b64-20020a0dc043000000b0056207f3bee6mr2059739ywd.45.1684507479276; Fri, 19
 May 2023 07:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230516202257.559952-1-arnd@kernel.org>
 <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
 <ZGeJsYmPU/7CHJRV@ls3530>
In-Reply-To: <ZGeJsYmPU/7CHJRV@ls3530>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 May 2023 16:44:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTGcVoNh3EUK-K--=X5kf+c5Un6aDms-gP3QhgEKZUwg@mail.gmail.com>
Message-ID: <CAMuHMdVTGcVoNh3EUK-K--=X5kf+c5Un6aDms-gP3QhgEKZUwg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
To: Helge Deller <deller@gmx.de>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Fri, May 19, 2023 at 4:37=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org>:
> > On Tue, May 16, 2023 at 10:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > There is a global function with this name on sparc, but no
> > > global declaration:
> > >
> > > drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototyp=
e for 'get_fb_unmapped_area'
> > >
> > > Make the generic definition static to avoid this warning. On
> > > sparc, this is never seen.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -1468,7 +1468,7 @@ __releases(&info->lock)
> > >  }
> > >
> > >  #if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONF=
IG_MMU)
> > > -unsigned long get_fb_unmapped_area(struct file *filp,
> > > +static unsigned long get_fb_unmapped_area(struct file *filp,
> > >                                    unsigned long addr, unsigned long =
len,
> > >                                    unsigned long pgoff, unsigned long=
 flags)
> > >  {
> >
> > LGTM, as this is unrelated to the SPARC function, and SPARC does
> > not support nommu (yet? ;-)
> >
> > drivers/video/fbdev/Kconfig:config FB_PROVIDE_GET_FB_UNMAPPED_AREA
> > drivers/video/fbdev/Kconfig-    bool
> > drivers/video/fbdev/Kconfig-    depends on FB
> > drivers/video/fbdev/Kconfig-    help
> > drivers/video/fbdev/Kconfig-      Allow generic frame-buffer to
> > provide get_fb_unmapped_area
> > drivers/video/fbdev/Kconfig-      function.
> >
> > Probably you want to update this help text, too. E.g.
> > "to provide shareable character device support on nommu"?
>
> I've added Geerts suggestions and made it dependend on !MMU.
>
> Applied to fbdev git tree as below.
>
> Thanks!
> Helge
>
>
> From 9adfa68ca0ddd63007cdce60a8ffcb493bb30d97 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Subject: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
>
> There is a global function with this name on sparc, but no
> global declaration:
>
> drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype fo=
r 'get_fb_unmapped_area'
>
> Make the generic definition static to avoid this warning. On
> sparc, this is never seen.
>
> Edit by Helge:
> Update Kconfig text as suggested by Geert Uytterhoeven and make it depend=
end on
> !MMU.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 96e91570cdd3..1688875a07de 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -121,10 +121,10 @@ config FB_SYS_IMAGEBLIT
>
>  config FB_PROVIDE_GET_FB_UNMAPPED_AREA
>         bool
> -       depends on FB
> +       depends on FB && !MMU

I expect this to cause a Kconfig warning when enabling DRM_STM
with MMU=3Dy (e.g. multi_v7_defconfig).
ARCH_STM32 seems to support both MMU=3Dy and MMU=3Dn.

>         help
>           Allow generic frame-buffer to provide get_fb_unmapped_area
> -         function.
> +         function to provide shareable character device support on nommu=
.
>

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
