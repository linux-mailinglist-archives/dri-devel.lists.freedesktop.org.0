Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71877492521
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 12:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5610E2AE;
	Tue, 18 Jan 2022 11:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EED10E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:44:51 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso10162431otb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 03:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+NXps7/AMZd6p8CbfFu1xLGWKKhiZWwP/hikl7qUV8=;
 b=ZXMuh4JpPKQQn028vR5TW28RkJRq/wWREsIVr/rEShZKjMg/B7Z9jPda0Y+LON7jx4
 Lp1zlJGCIVdT6vqE1wktMASEE0B18XeZWHJkPEPITavWPstuRkYq9nVNCVJNlJ6rFpzd
 hlaFfUyjK1pYhhAjPmo7KoompJW6Jk7rmN/ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+NXps7/AMZd6p8CbfFu1xLGWKKhiZWwP/hikl7qUV8=;
 b=rq8acupU8k2w8j2mMxzrwmbt1MvIBYxCxOlLNu7iOqyp/jgi1SojRYiDtUyG76x8mn
 h11w7cZU5S0IvztJzxQ0VZKjHZFVDYUG1OPYoAFRQ64I4pOgLGyQs/Ph8MGoArRddL+C
 o2cNskvt9/oa8wc/PM/a2R5Y6DHZBtwfEheoGg/Y1gmeKVQMTj1X9R26oyimZUNX/zDH
 M9np9jsSEVuuj7mR2l2oDEYeraionUQ0Q5ugHHuF0qb5HOXcpnqKzAAM0HyYkhgU3OW/
 N98srcrMyX+0LQxZcdG1ifG/WurGcdsHaEz6vQTXuGA25MUReN5faWvmwMgdwZ1FXU5P
 +8Lg==
X-Gm-Message-State: AOAM533H1e2OZ/Hqcr4Da63/lEAQTOYvenIMkVgkMLBIzzCMVxHUtjc4
 HrFJ2vsx81AO0aZZeuVHpqM42te3QN2OsDkFV3Cqozx9xRg=
X-Google-Smtp-Source: ABdhPJxbvQaGp+T6oYApy+hIHTb7hh7iMVhDsGckpsWeq9BaU3rN88FunYUfphQtcZoEenjamZA+BYQvRTrRz3ys6zk=
X-Received: by 2002:a9d:d12:: with SMTP id 18mr17457509oti.75.1642506290874;
 Tue, 18 Jan 2022 03:44:50 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jan 2022 12:44:39 +0100
Message-ID: <CAKMK7uEOd+N0Xfk_MRK4m6p-PFCRituimqeOzFMY925vyWcGkA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 9:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Gerd,
>
> On Tue, Jan 18, 2022 at 7:30 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > Also note that using a shadow framebuffer allows to decouple fbcon
> > updates and scanout framebuffer updates.  Can be used to speed up
> > things without depending on the 2d blitter.
>
> Assuming accesses to the shadow frame buffer are faster than accesses
> to the scanout frame buffer. While this is true on modern hardware,
> this is not the case on all hardware.  Especially if the shadow frame
> buffer has a higher depth (XRGB8888) than the scanout frame buffer
> (e.g. Cn)...
>
> The funny thing is that the systems we are interested in, once used
> to be known for their graphics capabilities and/or performance...

That's just a pure strawman. No one is forcing you to run your shadow
buffer with xrgb8888. You can already do C8, any any other C1 is a few
lines of code. Which I can't type for you, because I don't have such
high performance hardware, but if someone would have spent hacking
instead of typing mails any time this came up the past few years, we'd
have it long ago. It's really not hard.

Same goes for modesetting support in the fbdev emulation layer (that's
a bit more work, but really not much) and really anything. And we do
actually merge additions in the emulation support pretty quickly. If
they show up.
-Daniel

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
