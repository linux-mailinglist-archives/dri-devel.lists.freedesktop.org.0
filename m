Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB53026F1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AE56E1F5;
	Mon, 25 Jan 2021 15:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8786E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 15:39:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id k25so1050876oik.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 07:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xv2F8uEJDzNOELHmwTwNLPLNs8lRPkq+SnWZqNcKmSE=;
 b=T6dyk8R9y6Emp2ZYXdqTluInMRHbaZfPBzGFk0z2hRrHyv2Fze3yktjfdc/Em+3e/8
 hqpKgkc/Xu65szi4RX/wp/3nT81zOhO7/JSJ7O39FBw/yU18G8NkZfvaEHufrxpM3siD
 8YgVA2QT4CBdHs+8RdXGBR7bWe3byDllDOqbAdNad6ILLk/MsCV9FrvzWtl0PrR0CQvO
 AvATErtK5F6Ix2uBLmB6tYXLjEjbpXsH2n68bjNlOXGglMQ9CZxt2xD/GgbCbtX0VTT3
 +GR8pQyS68QjLJgjCTfKo8FnQpSRZ1atQb6boF7ePi9sekbuvQ3ozBkv09ow0Vf9q1Q8
 rCrQ==
X-Gm-Message-State: AOAM53297u0LrmhE0SoPCePwydq+1hDThXtrIdkwE1aSL1dXiCMtJIrm
 Rr3wQJsaveR4D4ldc1AHefmH/yZv07L1BAj5R8E=
X-Google-Smtp-Source: ABdhPJwZj9WDxzrkp5B5fBpFQxEJMl3itE2IsPYlaaZPJaGCbLO05CDNwOR5DGdC23BcrNbXL/hWQx20i4ztPmfvMHc=
X-Received: by 2002:aca:1219:: with SMTP id 25mr489984ois.54.1611589161153;
 Mon, 25 Jan 2021 07:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
 <87k0s4ai33.fsf@vps.thesusis.net>
In-Reply-To: <87k0s4ai33.fsf@vps.thesusis.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Jan 2021 16:39:09 +0100
Message-ID: <CAMuHMdVe-pS4wT++RDzF+EYd-_SC9naGJj8dzWbN6mt0yAnVxg@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To: Phillip Susi <phill@thesusis.net>
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Phillip,

On Fri, Jan 22, 2021 at 8:26 PM Phillip Susi <phill@thesusis.net> wrote:
> Geert Uytterhoeven writes:
> Judging from some of the comments in the code, it looks like you were
> one of the original authors of fbcon?  I haven't been able to find any

Indeed, a looooong time ago... Before DRM existed.

> of these sczbot crash reports, and am not sure how fuzzing syscalls
> would really affect this code ( it's not really handling a buch of
> ioctls or otherwise taking arguments from user space ) , but I am a bit

AFAIU, most of these are triggered by VT ioctls.
There is an intimate relation between the VT and fbev subsystems: VT
changes impact fbdev, and vice versa.

Perhaps these should be decoupled, at the expense of worse user
experience (i.e. the user needing to change both screen resolution and
number of columns/rows of the text console)?

> confused as to why the softback was implemented the way that it was.
>
> vgacon simply copies the main buffer to vram in ->set_origin() and then
> changes the pointers to operate out of the much larger vram while that
> virtual terminal is active.  If I understand it correctly, it looks like
> fbcon instead opts to operate out of the main buffer but rescue lines as
> they are scrolled off and relocate them to the softback buffer.  This
> seems to be rather more convoluted.
>
> I'm thinking of re-implementing scrollback more like the way vgacon does
> it: allocate a big "vram" buffer and operate out of that.  Obviously
> ->scroll() and ->scrolldelta() have to actually repaint the screen rather
> than simply change the pointer register, but that should be about the
> only difference.

I'm not that intimate familiar anymore with the current state of the
code, but it used to be like this:
  - vgacon used a VRAM buffer for the current VC, and multiple shadow
    buffers to implement virtual consoles,
  - fbcon always used the shadow buffers, with each update triggering
    an update of the frame buffer (see below).

As the text console buffer handling should be the same for vgacon and
fbcon, I expect most scrollback bugs (if any) to be present in both.

> I have also noticed that there was some code to use hardware panning of
> the video buffer rather than having to do a block bitblt to scroll the
> contents of the screen, but that it was disabled because virtually no
> video drivers actually implemented it?  That seems like a shame, but if
> it is so, then there's no sense carrying the dead code so I think I'll
> clean that up now.
>
> Now that I look at it again, everything is simply always redrawn now
> instead of even doing a simple bitblt.  Daniel, you mentioned that
> almost nobody supports hardware acceleration, but even without any
> specific hardware support, surely even if bitblt() is implemented just
> as a memcpy(), it has to be faster than redrawing all of the characters
> doesn't it?  Getting rid of the panning if it isn't generally supported
> I can see, but I don't understand killing bitblt even if most devices
> don't accelerate it.

There are multiple ways to implement scrolling:
  1. If the hardware supports a larger virtual screen and panning, and
     the virtual screen is enabled, most scrolling can be implemented by
     panning, with a casual copy when reaching the bottom (or top) of
     the virtual screen.
     This mode is (was) available on most graphics hardware with
     dedicated graphics memory.
  2. If a 2D acceleration engine is available, copying (and
     clearing/filling) can be implemented by rectangle copy/fill
     operations.
  3. Rectangle copy/fill by the CPU is always available.
  4. Redrawing characters by the CPU is always available.

Which option was used depended on the hardware: not all options are
available everywhere, and some perform better than others.
E.g. on PCI graphics cards, reading graphics memory by the CPU is
usually very slow, so option 3 is much slower than option 4 (given a
sufficiently fast CPU).
AFAIU, option 2 is not suitable for modern systems with 3D acceleration.
On the older (slower) systems (lacking VGA text mode) for which fbcon
was originally written, option 4 is usually the slowest.

Support for 1-3 were removed in commit 39aead8373b3c20b ("fbcon: Disable
accelerated scrolling"), which claimed only 3 (DRM) drivers made use of
this, ignoring the other 32 (fbdev) drivers making use of it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
