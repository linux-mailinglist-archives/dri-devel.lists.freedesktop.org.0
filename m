Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0D494E24
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 13:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7431610E21F;
	Thu, 20 Jan 2022 12:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A839E10E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:46:26 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id m90so10644151uam.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVOsKevTrHGaSWoEOZEFy6vOm3loanQlCT1W9IuMkTY=;
 b=pW3T/ahOD4XaK2RUCTh8G6RHcBI7yEsUDTKMGXc2UGVYFWa3Bnm11bTwCYjXO2Okhs
 ST3HYrG0nkug29wNDA3KCpSybnwAEphZZ6n5WA91396gxBNOT8L587eOa3oICA7dzCeC
 ebM9T9jTCdoViRG4mwRF2fZns+3IKmje0s7u4EnT1V1zwaN+U8mvdzXER7Y+jUiAPIt+
 fvnKCOXrPz/9M4Ez7yXi05hHMDtAVGG6FmhJYGk2N6WvUp8UtbT57QNTlQqT/gLoYTWv
 +CcdEH94i+TCwXZzlC16DBRpVe27IbfRUyesxZU77WOGDjRQAdKe5f2cpwKfQblxuZiw
 qqFg==
X-Gm-Message-State: AOAM530gfSF2dgex7Tt0eqwBK93LUdVJkIJ2Vj3IEUlw4HXf7gW5stAh
 pFEa6JXdldNJ+Jj4IckimEXu70092tt96Q==
X-Google-Smtp-Source: ABdhPJy53GpPIarmo3cIVECJ1BQPkJMe79JceL2kp21jikfIMFfpul2NQVqax8M76afSxCNK30hyeA==
X-Received: by 2002:a05:6102:242f:: with SMTP id
 l15mr29698vsi.61.1642682785635; 
 Thu, 20 Jan 2022 04:46:25 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id h189sm538592vka.52.2022.01.20.04.46.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 04:46:25 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id w21so10566200uan.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:46:25 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr12549674vso.77.1642682784811; 
 Thu, 20 Jan 2022 04:46:24 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
 <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com>
 <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
 <CAKMK7uEwDdaR7kDVi9Oah0w8qFEoAywp_wj2eH7DtttVD2L00A@mail.gmail.com>
In-Reply-To: <CAKMK7uEwDdaR7kDVi9Oah0w8qFEoAywp_wj2eH7DtttVD2L00A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jan 2022 13:46:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXboG=DxpO9WN-e0c-Zoet-fWwiwYATGb6TZYQd9Ajg6Q@mail.gmail.com>
Message-ID: <CAMuHMdXboG=DxpO9WN-e0c-Zoet-fWwiwYATGb6TZYQd9Ajg6Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Jan 20, 2022 at 1:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jan 20, 2022 at 1:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jan 20, 2022 at 12:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Jan 20, 2022 at 10:06 AM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Thu, Jan 20, 2022 at 4:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > > On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > > > > > On Mon, 17 Jan 2022 19:47:39 +0100
> > > > > > Sven Schnelle <svens@stackframe.org> wrote:
> > > > > > > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > > > > > > a dmesg with 919 lines one the text console took about 2s to display. In
> > > > > > > x11, i measure 22ms. This might be unfair because encoding might be
> > > > > > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > > > > > blitting' point. I think if that would be the case, no-one would care
> > > > > > > about 2D acceleration.
> > > > > >
> > > > > > I think that is an extremely unfair comparison, because a graphical
> > > > > > terminal app is not going to render every line of text streamed to it.
> > > > > > It probably renders only the final view alone if you simply run
> > > > > > 'dmesg', skipping the first 800-900 lines completely.
> > > > >
> > > > > Probably more like "render on every vblank", but yes, unlike fbcon it
> > > > > surely wouldn't render every single character sent to the terminal.
> > > > >
> > > > > Also acceleration on modern hardware is more like "compose window
> > > > > content using the 3d engine" than "use 2d blitter to scroll the window".
> > > > >
> > > > > > Maybe fbcon should do the same when presented with a flood of text,
> > > > > > but I don't know how or why it works like it works.
> > > > >
> > > > > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > > > > doing it synchronously.
> > > >
> > > > Hopefully only the parts of the screen which need a redraw?
> > > >
> > > > Not all displays can be updated that fast. For a "modern" example, see
> > > > https://patchwork.freedesktop.org/series/93070/.
> > >
> > > drm does damage tracking throughout the stack, e.g.
> > >
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#damage-tracking-properties
> > >
> > > And unlike fbdev, it's explicit (so less overhead since userspace
> > > generally knows what it's drawn) and doesn't rely on page fault
> > > intercepting and fun stuff like that.
> >
> > My reply was to a paragraph about rendering text by fbcon, not about
> > userspace rendering graphics.
>
> Yeah, and ofc when I say "throughout the stack" this also includes the
> fbdev emulation, including the mmap intercepting with fbdev_defio and
> all that. They all get remapped to that damage tracking property,
> which drivers can then inspect using a bunch of helpers.

And I really meant the text rendering part, not the copy of the shadow
buffer after the rendering.

> But reading code&docs is too hard I guess, safer to assume it's just
> broken and not supported.

Don't worry, I'm actually writing a larger rebuttal _and_ code...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
