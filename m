Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A109A49900C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A5210E9D5;
	Mon, 24 Jan 2022 19:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602110E9D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:58:14 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso23752933otr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2gDbuL9fMv2rl269QnqyXxLamH6Z2QbvH+WQ3k8mrg=;
 b=S6T6+fQYKJd2lvAA2I5oWA8UZplvZIJ/P3ivaU7HOkoWIHPFDNyYJIwGmCm+sZpo+G
 FyrOqGSwcjZXeOfBGe1nMuCMKv+cVnxYYWLF6aJd4VYpfc06NjX8KKCXhUHPbnFS6nxh
 nkXnT/qOflzhO0QObJxKdvbDWFz++9Iuvl5YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2gDbuL9fMv2rl269QnqyXxLamH6Z2QbvH+WQ3k8mrg=;
 b=ske40rScl6wToOec365GhrIWpg7jsa2PoBRCQmRuxLTr0hY7pCh+9w3N3s90wsmfBI
 bYcDAqkdlHx+M6F58oM80As+b7lzhii4FeyaMqLQb5hgtzFhMAVJmBOxKVhvIrI8/Gvb
 PenKyWiJUnXqmdhbY9C0rUXSE/Nj7lbnfRNCxHciuPQO65WEVsaQlk9ccmXgvSA1/hPO
 BTw4mjhGi/M9MJNq+5AeE4mgg2RO3F+pUO/6vcEW03Bxpsq2PLg9TxKXiMrOyMl9qx01
 WhjTb8wXxuoTkQTCrG70aaUKvFRs/nLKeZ6koWiEdUl7nUmeB2ihPB5UwvIwY8ltOMC7
 NOxw==
X-Gm-Message-State: AOAM530aFFMZwdNgdaeQ4GkDml7YxCrhJvGfIrGDqBZ+qnRskWAgPLcs
 BKGt0QYHERH3uspnM2zZz1b5T+nBoUZWYKpi8C/GAQ==
X-Google-Smtp-Source: ABdhPJyUUM/IIey5d4pq9ejNsaUDjZqTQVDk+w+6dfEsVTOAABJxU6UfFTMho4QBvDpTtANKviwZ2bSXix8WqmhS5ow=
X-Received: by 2002:a05:6830:1e76:: with SMTP id
 m22mr7775943otr.75.1643054293385; 
 Mon, 24 Jan 2022 11:58:13 -0800 (PST)
MIME-Version: 1.0
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
 <87zgnz71ic.fsf@x1.stackframe.org>
 <Yegwl/rwRhjROxcy@phenom.ffwll.local>
 <CAMuHMdVBFgo6ryq=h8e6mZZmnxnChZVP924yeX+C-KwghKx3tA@mail.gmail.com>
In-Reply-To: <CAMuHMdVBFgo6ryq=h8e6mZZmnxnChZVP924yeX+C-KwghKx3tA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 24 Jan 2022 20:58:01 +0100
Message-ID: <CAKMK7uHCtm3NSGBi=k5+RGtrmURG3-WJ6PLByZxDj0uaMBGOPA@mail.gmail.com>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
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
 Hamza Mahfooz <someguy@effective-light.com>, Helge Deller <deller@gmx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 7:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel et al,
>
> On Wed, Jan 19, 2022 at 4:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Jan 13, 2022 at 10:46:03PM +0100, Sven Schnelle wrote:
> > > Helge Deller <deller@gmx.de> writes:
> > > > I may have missed some discussions, but I'm objecting against this patch:
> > > >
> > > >     b3ec8cdf457e5 ("fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)")
> > > >
> > > > Can we please (partly) revert it and restore the scrolling behaviour,
> > > > where fbcon uses fb_copyarea() to copy the screen contents instead of
> > > > redrawing the whole screen?
> > > >
> > > > I'm fine with dropping the ypan-functionality.
> > > >
> > > > Maybe on fast new x86 boxes the performance difference isn't huge,
> > > > but for all old systems, or when emulated in qemu, this makes
> > > > a big difference.
> > > >
> > > > Helge
> > >
> > > I second that. For most people, the framebuffer isn't important as
> > > they're mostly interested in getting to X11/wayland as fast as possible.
> > > But for systems like servers without X11 it's nice to have a fast
> > > console.
> >
> > Fast console howto:
> > - shadow buffer in cached memory
> > - timer based upload of changed areas to the real framebuffer
> >
> > This one is actually fast, instead of trying to use hw bltcopy and having
> > the most terrible fallback path if that's gone. Yes drm fbdev helpers has
> > this (but not enabled on most drivers because very, very few people care).
>
> That depends on the hardware, and the balance between CPU-to-RAM,
> CPU-to-VRAM, and GPU-to-VRAM bandwidths, and CPU and GPU performance.
>
> When scrolling, the fastest copy is the copy that doesn't need to copy
> much.  So that's why fbcon supports (or supported :-( many strategies:
> scrolling by wrapping, panning, copying (either by CPU or by (simple)
> GPU), re-rendering (useful for a GPU with bitmap expansion).  So forcing
> everybody to render into a fully cached shadow buffer and upload changed
> areas is not the silver bullet.
>
> Whether text output is rendered immediately or not is completely
> orthogonal to this.  While timer-based updates would speed up printing
> of large hunks of text (where no one actually reads what was printed at
> the top), that would have almost no impact on actual interactive console
> work: it may still take 0.5s to scroll the screen if you press "enter"
> when your cursor is positioned on the last line.
> BTW, implementing timer-based updates would make measuring real-world
> performance more difficult, as we would have to use a different
> benchmark than "time dmesg" ;-)
>
> Both Daniel and Thomas said: fbdev is not suitable for modern hardware.
> Fine, we do not debate that, and do not want to prevent you from using
> DRM for modern hardware.  Then please accept us saying that DRM (in its
> current form) is not suitable for other types of graphics hardware.
> Still, even modern (embedded) hardware may have small low-color
> displays.
>
> For the last +5 years, we've been pointed to the tinydrm drivers, to
> serve as examples for converting existing fbdev drivers to drm drivers.
> All but one of them are drivers for hi-color or better hardware, thus
> surpassing the capabilities of lots of hardware driven by fbdev drivers.
> The other one is an e-ink driver that exposes an XRGB8888 shadow frame
> buffer, and converts that in a two-step process, first to 8-bit
> grayscale, second to 1-bit monochrome.  If that is considered a good
> example, should I be impressed?
> Compare that to other subsystems boasting about zero-copy...

tiny drivers are the state of the art for small neat drivers. As you
pointed out multiple times now there's not Rx or Cx support for x < 8
in drm or fbdev yet, so that would need to be added. If someone cares
enough for that. Some of the fbtft drivers have gone down
substantially when ported to tiny, which is really the claim we've put
down. Not that you'll find the perfect C4 pixel format example in
there, at most you find C8 support in some of the really old drivers
like i915/radeon/nouveau for old platforms. But that's very well
burried.

I guess in practice (as you point out below) the repaper display is so
glacially slow anyway and connected to machines with enough ram that
generally the only case that mattered was convenience and hence
supporting what every drm userspace can cope with minimally. Which is
xrgb8888. So yeah don't look at a driver which updates at roughly
0.5fps for efficient upload code :-) The space wasting is a bit more
important and should be trivial to add if someone cares enough to do
that.
-Daniel

> Furthermore, for a contemporary e-ink device like[1], the shadow buffer
> would consume 10 MiB.  Of course this device has 4 GiB of RAM, and quad
> Cortex-A55 CPU cores, but not all systems have 10 MiB to spare...
>
> [1] https://linuxgizmos.com/rk3566-based-pinenote-e-ink-tablet-ships-at-399/
>
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
