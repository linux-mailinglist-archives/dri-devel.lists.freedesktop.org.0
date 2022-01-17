Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D93490B0D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345B510E312;
	Mon, 17 Jan 2022 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B86610E312
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:03:51 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x31-20020a056830245f00b00599111c8b20so6640905otr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THQ5/GDYwzhowPGkTHlKwpOER01fDlo33fQ7jTXIfGM=;
 b=HyEfUGHwC/aDJmOWqsnYpDBv2rJLeDcksnXdbJ10SqiszTT2cU3u8SfwrzwBEYzzDe
 zBJb7AN4dhihR7JDJfW0yGofsulhJHbR8psBK97UVMakM8KRHiCBFh8dsObuEzHJpBvi
 pgxi/GP0D4r44P9WLgjDOHO7vQ3S6QhH66wkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THQ5/GDYwzhowPGkTHlKwpOER01fDlo33fQ7jTXIfGM=;
 b=Tf7l1tchYJp48MENWN0egLEaREiX7zKmTcrliYGRZ08PxuKS9fLPwewB1mkFrNH9Jx
 Ucm69+V9V4VwMlxYFEHIKwZfEmEe+04che1fJqKnFCO4ss9k5SiKSFlh/cIPW3j2crtZ
 6TUNXqQY/bTdrlAauNTQOiiqRp9mwYvsq1Oj+rp/gaf0W7l70O4JBKCqrUjMQZ8M1l+h
 xtJQoZgOx8HEI+EZ3HGQIUAPHehLOhYspGNhcNE3fC3H7nFYbtOi6MJPuwTnAxE6EJ0K
 o4W5GNEwq9a7ysXNtWBVNAXJ714WGGBc5R/E00pciEvWUTNwTKDYkd/EIN8XOY+tPibT
 F5NA==
X-Gm-Message-State: AOAM532lie2i2pyuLoTYqaoPJUSh1gOYZYqLtpLaF4CqG61YDOEvYk9T
 R2Dcf6+D7znnE56SdHRoXUpET2V9mvUVSlFmTLW32w==
X-Google-Smtp-Source: ABdhPJzSDDOCkmzV3Sk6ECBMGYdBHWibu6XEyZwL/kT0+dKt5n4BVpNxu6iCvabnhidMw4EMC2Im+NYWtI63JpZvzBI=
X-Received: by 2002:a9d:d12:: with SMTP id 18mr14105706oti.75.1642431830676;
 Mon, 17 Jan 2022 07:03:50 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
In-Reply-To: <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jan 2022 16:03:39 +0100
Message-ID: <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Helge Deller <deller@gmx.de>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 3:48 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/17/22 15:10, Geert Uytterhoeven wrote:
> > Hi Thomas,
> >
> > On Mon, Jan 17, 2022 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Am 17.01.22 um 14:29 schrieb Geert Uytterhoeven:
> >>> On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>>>> b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
> >>>>>     I know of at least one driver which won't be able to support DRM....
> >>>>
> >>>> Hmm?  I seriously doubt that.  There is always the option to use a
> >>>> shadow framebuffer, then convert from standard drm formats to whatever
> >>>> esoteric pixel format your hardware expects.
> >>>>
> >>>> Been there, done that.  Have a look at the cirrus driver.  The physical
> >>>> hardware was designed in the early 90-ies, almost 30 years ago.  These
> >>>> days it exists in virtual form only (qemu emulates it).  Thanks to the
> >>>> drm driver it runs wayland just fine even though it has a bunch of
> >>>> constrains dictated by the hardware design.
> >>>
> >>> The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
> >>> modes only.  The Cirrus fbdev driver also supports mochrome and 256
> >>> color modes.
> >>>
> >>> There exist some DRM drivers that do support DRM_FORMAT_C8, but none of
> >>> the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.  Using a shadow
> >>> frame buffer to convert from truecolor to 256 colors would be doable,
> >>> but would give bad results. And what about less colors?
> >>> Adding support for e.g. DRM_FORMAT_C4 is not straight-forward, as
> >>> the DRM core assumes in many places that a pixel is at least 1 byte,
> >>> and would crash otherwise (yes I tried).  Other modes needed are
> >>> DRM_FORMAT_Y4 and DRM_FORMAT_{BW,WB} (monochrome).
> >>
> >> We export XRGB32 from each driver, because userspace expects it. But
> >> that is not a hard requirement. Userspace can use any format. It's just
> >> that no one seems to have any use cases so far, so no work has been
> >> done. Think of XRGB32 as a fallback.
> >
> > Using an XRGB32 intermediate would kill the user experience on old
> > machines, due to both increased memory usage and copy overhead.
> >
> >> Personally, I'd much appreciate if userspace would support more of the
> >> native formats and not rely on XRGB32.
> >
> > Supporting monochrome, 16 colors, and 256 colors would be nice.
>
> From this conversation it seems DRM completely lacks backwards compatibility,
> including a missing 2D bitblt copy.
> Isn't that all what's needed and then migrating existing drivers would
> be easy ?

Not sure who you talked to, but we have drivers with fbdev bitblt
accel (well, in some cases had, because driver maintainers decided
it's just not worth it and ripped it out again or never merged it).
Also the other discussions about some low-bit formats is pretty much
just a question of extending a few enums and wiring through the fbdev
emulation layer. So the things brought up in this thread thus far are
actually the fairly easy items, which should take at most a handful of
patches to rectify. There's much more nastier issues in fbdev, which
will take serious amounts of development time to fix.

Unfortunately in the past 5+ years absolutely no one stepped up with
actual patches, which is why fbdev was marked as orphaned in
MAINTAINERS.
-Daniel

>
> Helge
>
>
> >>> This not only to support "old" hardware, but also modern small OLED
> >>> and e-ink displays.
> >>
> >> There's a DRM driver for Repaper e-Ink displays. So it seems doable at
> >> least.
> >
> > Which uses an DRM_FORMAT_XRGB8888 intermediate, and
> > drm_fb_xrgb8888_to_gray8() and repaper_gray8_to_mono_reversed()
> > to convert from truecolor to monochrome.  I guess that would work,
> > as this is a slow e-ink display.  Have fun as a text console ;-)
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
