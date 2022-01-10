Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEE48A284
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B5F10E2D3;
	Mon, 10 Jan 2022 22:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643CD10E2D3;
 Mon, 10 Jan 2022 22:13:16 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j124so20539137oih.12;
 Mon, 10 Jan 2022 14:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCLg1+gAtBtfm/JniWwMOPYIQHO9KKXaUPzzO04UAG0=;
 b=NDMlLJcvyL1XU50XTu4Csg2jS74GGkAFbQr3C9M7drxRVy/zJStBCkiZBE8dQ8Ny2A
 24XSlJ9VUkR8Ltr0altZrcMNHU3MPa9mk0Zw7wPRRC2RkUdfVv++BjLzt9bHvQLQYp0r
 9fjtUqRYJlZfK4vzOlqorIN8ZSfom9DI9uHfdvtP686vo11ZsnRg15VG7MkExw7gIi0U
 LDpVRFkKHmYVDtL4XKVw8/64IZuaiFpshhTO6FVUetTwZ9Nkkj0yP6aowj2GxiGiZqiM
 X/uHTxmo/qSdmkav9ZhBPCcyqqmp37b+ux6e3Zpqyyvjm0YK5l32aKgp7isfwes5Gl6n
 zTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCLg1+gAtBtfm/JniWwMOPYIQHO9KKXaUPzzO04UAG0=;
 b=uRTrEpUGzz7xErZcvq9bVcZRUIq+f/oEuR/mIMSQk7OtRBNqohHuKdY8h1bWIt2que
 w6Zp36eWsNHOsrs1IPMI+6xEwNnhWqvh/kEvhuaqD09SlCvc6KgIKi4hA2pq8NzVuhWX
 qjm66A4WH1WXX+MrwcpJWiAQqc95bFTkf7CzW7F0iJ6s7OGmp55i6pssnqyieu54Gi1m
 ze+pt/+4KOiao4Tj8sY2rSuZax6vfQ0aYJBu9ufTQyNODKkkfXerPcVqKGBJm/nZV8mu
 yB5pRF79pMuGCR5pe2PqOGfqsN9vw6yxe/Twv0SkmnEDXEb1rrxlEvdvzgBPXrI65Vou
 RiOw==
X-Gm-Message-State: AOAM530/UCgCz7ZlJOpYX6XJsQi/cESo/3pfJFhb+w0vRaV9tJ5gKHc6
 WuhvDmtq6+lAd9VaZ7DbBHrAfyNTdn3JsvZpGI4=
X-Google-Smtp-Source: ABdhPJx8DF6wEYlqdbZgoZWTZFDvsXW0Hv6pc6K2gMmTYSOBlxHfjyNKDvnOaBa/NnFVFRFv26Tt6jYvu41ElS6hdRc=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr1047412oib.120.1641852795592; 
 Mon, 10 Jan 2022 14:13:15 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
In-Reply-To: <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jan 2022 17:13:04 -0500
Message-ID: <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 5:05 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, Jan 10, 2022 at 10:30 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, Jan 6, 2022 at 10:12 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > >   git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-07
> >
> > Gaah. I merged things and it built cleanly, and I pushed it out.
> >
> > But then I actually *booted* it, and that's not pretty.
> >
> > It *works", but it's almost unusable because of random scanline
> > flickering.  I'm not sure how to explain it, but it's as if there
> > wasn't quite enough bandwidth on the scan-out, so you get these lines
> > of noise and/or shifted output. They are temporary - so the
> > framebuffer contents themselves is not damaged (although I don't know
> > how the compositor works - maybe the problem happens before scanout).
> >
> > This is on the same Radeon device:
> >
> >    49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> > [AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)
> >
> > with dual 4k monitors.
> >
> > Any idea?

Sounds like something related to watermarks.  That said, we haven't
really touched the display code for DCE11 cards in quite a while.  Can
you provide your dmesg output?

Alex


>
> Since Christian is mostly the compute/memory side, adding some display
> folks for this.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
