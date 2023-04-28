Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A146F1791
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D45D10E29A;
	Fri, 28 Apr 2023 12:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1DB10E29A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:20:21 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-54fc6949475so113033327b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684420; x=1685276420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7o32H4PTL3mzxqBzaVY0LbmteAecqwupnN7CxCbojaQ=;
 b=Nzzs/I+ibeL6LpqPtRtm2XX9P9psxWriP1PYGX2sr19BuEWFDqqTW0rDFUa9w0KLLD
 F9aQrvCX9EHXGZaS2OTiuji/Of6XmGXBWN+smVpgFPM4fqEoSOAf8PBro7H+HLrQMcKH
 XPOoqJ29nqQuBz3lFk6WAhaIaUyIzj1yvq94TwBn9Yj0YfNRB61/a6b36EE/n7UNqnQd
 xyTK6pfhs8z9EzKNXfJq4mbAIswTn16BG8VNHPd10vXkg2S09HPEa3wOH6OE0jZT5aA/
 bEnGHIVOyF03ivDn3BFyZrc9zGciksKUSVecONivMYoEokvPg8HeuA982otEvKqzTX6I
 lq/w==
X-Gm-Message-State: AC+VfDxpxrJlgLLOwbfTnhnm64PZZh7Zuu0pda+jZM7b+EyY9TlIGGZm
 CwlLQ2aY6o3KVDJir1ZXk9E/3fldINocuA==
X-Google-Smtp-Source: ACHHUZ55e0GTXcE0jz87echznKe9Aq74IlkCbjV1PNlH/SML4RhMWFpjgWvZEEaEMJQToVhLXxoomA==
X-Received: by 2002:a81:88c5:0:b0:552:d36e:e6db with SMTP id
 y188-20020a8188c5000000b00552d36ee6dbmr3390512ywf.6.1682684420076; 
 Fri, 28 Apr 2023 05:20:20 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 i198-20020a816dcf000000b005463239c01esm5490942ywc.51.2023.04.28.05.20.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:20:18 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-b8f5121503eso14625889276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:20:18 -0700 (PDT)
X-Received: by 2002:a25:782:0:b0:b97:1e2e:a4e5 with SMTP id
 124-20020a250782000000b00b971e2ea4e5mr3739275ybh.40.1682684417838; Fri, 28
 Apr 2023 05:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
 <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
 <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
 <b7c09aa8-ce41-9c9a-062f-e652ea92f8a8@suse.de>
In-Reply-To: <b7c09aa8-ce41-9c9a-062f-e652ea92f8a8@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2023 14:20:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUq_bkCWQJfe=j+RAC8s6Ce9KPROy7RxaoPGpUX70+EXw@mail.gmail.com>
Message-ID: <CAMuHMdUq_bkCWQJfe=j+RAC8s6Ce9KPROy7RxaoPGpUX70+EXw@mail.gmail.com>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Apr 28, 2023 at 1:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 26.04.23 um 17:21 schrieb Geert Uytterhoeven:
> > On Wed, Apr 26, 2023 at 5:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Am 26.04.23 um 17:01 schrieb Geert Uytterhoeven:
> >>> On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> >>>> Move the existing CFB read and write code for I/O memory into
> >>>> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> >>>> default fp_ops. No functional changes.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> ---
> >>>>    drivers/video/fbdev/core/Makefile      |   2 +-
> >>>>    drivers/video/fbdev/core/fb_cfb_fops.c | 126 ++++++++++++++++++++=
+++++
> >>>>    drivers/video/fbdev/core/fbmem.c       | 113 +-------------------=
--
> >>>>    include/linux/fb.h                     |  10 ++
> >>>>    4 files changed, 139 insertions(+), 112 deletions(-)
> >>>>    create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
> >>>
> >>> While the general idea is fine, please do not call any of this "cfb",
> >>> as it is not related to chunky color frame buffer formats.
> >>> All of these operate on the raw frame buffer contents.
> >>
> >> Shall I call it fb_raw_() or fb_io_()?
> >
> > Given fb_memcpy_fromfb() is mapped to memcpy_fromio() on
> > most architectures, I'd go for fb_io_*().
>
> Ok, makes sense.
>
> >> CFB is used by the drawing helpers, which are usually used together wi=
th
> >> this code. Hence the current naming.
> >
> > That's because your drawing helpers operate (only) on chunky color
> > frame buffer formats ;-)
>
> Should we rename the CFB drawing functions to fb_io_ then? AFAICT they
> are the same algorithms as in the fb_sys_ functions; just with I/O memory=
.

I don't know if that's worth the churn.
Historically, the frame buffer was usually located in dedicated memory,
hence the drawing operations operated on I/O memory.
With the advent of unified memory architectures, the fb_sys_*()
functions were introduced.

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
