Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56EC4A6F86
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2616910E93D;
	Wed,  2 Feb 2022 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC810E93D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:06:11 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so19067035otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IpJ0TBab2BIK0BhH3D/17qvgwP3yzTw1BAtMyaROLaU=;
 b=Fzd+LygVXDOoduPFgwOH9IJKicTMbbHhJJL9TL8Qa1UfZGx5FfTEo/Zvhc8FMEqOHz
 g/gaD2Lh2bhyh/QK7e3VhrZVivSapjL0JEWatVrIgSqwH7WkC6vJewBPq985yfD0WG21
 czz5q9Ak0zK2zcLUxC4ctAPBJd6WHJODLESsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpJ0TBab2BIK0BhH3D/17qvgwP3yzTw1BAtMyaROLaU=;
 b=cAHsUo976PQbBqQAtE4WkF1aGH9a2Uzuuej0D3FZK4qxgY1JHRZ8StwhV0JfR+MV8N
 8HRFMI71RTElp5TdqPlC8xoIotKjQUnCg2jQZmj0ogpXNkT+pPjbfZ26JM4eO2VFIQr3
 LtcTpiRZHPML8IZUzVA+DFRUJo4y7C6102okAheD6aksnkYyuztx1C0bZp6fPIQpgROM
 QAhJMAIxDYL0c7Egb8udott8kioY5zCYrBShI8acfeOjFBWE2T9tTbjD9BbBLWyQZZeD
 DBzlq4ix2PDIfOxGSonhjuA7ZJd5/q7JI+Ir4V3lP5p55CUDdqdhrBBJ+oX9lbHufPYR
 heHQ==
X-Gm-Message-State: AOAM533qUEBqOTGsbXTFFdT/lH6ZQ44VYIq/oNURTKLMSYuP5H6VqhuF
 CXdo4iuigBC2cfp7YRpk98ld1f4z8po7FFbABYQDGA==
X-Google-Smtp-Source: ABdhPJzPiulWPzFu78ZaXouRftPdYh55ze93VqZpL+iI14/VQ9R0Lzn6uJZVn+TVcHC21w8kCM69AVo/h18sTiUMBAE=
X-Received: by 2002:a05:6830:1153:: with SMTP id
 x19mr15886747otq.321.1643799970354; 
 Wed, 02 Feb 2022 03:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20220201185954.169768-1-deller@gmx.de>
 <20220201185954.169768-4-deller@gmx.de>
 <CAKMK7uFmMcC4p_zDq5G1Rpvjeg0zOz7v38mTj57JDZEis9fGAA@mail.gmail.com>
 <dd186ce6-56b3-fe68-daad-249b18ebd627@gmx.de>
In-Reply-To: <dd186ce6-56b3-fe68-daad-249b18ebd627@gmx.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 2 Feb 2022 12:05:59 +0100
Message-ID: <CAKMK7uGAMSGx4hNFAO5iqsL+ZeTS_L6Bx5YERkY=Bi2CGmJg-g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] fbcon: Add option to enable legacy hardware
 acceleration
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
Cc: linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 11:52 PM Helge Deller <deller@gmx.de> wrote:
>
> Hello Daniel,
>
> On 2/1/22 21:11, Daniel Vetter wrote:
> > On Tue, Feb 1, 2022 at 7:59 PM Helge Deller <deller@gmx.de> wrote:
> >>
> >> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> >> enable bitblt and fillrect hardware acceleration in the framebuffer
> >> console. If disabled, such acceleration will not be used, even if it is
> >> supported by the graphics hardware driver.
> >>
> >> If you plan to use DRM as your main graphics output system, you should
> >> disable this option since it will prevent compiling in code which isn't
> >> used later on when DRM takes over.
> >>
> >> For all other configurations, e.g. if none of your graphic cards support
> >> DRM (yet), DRM isn't available for your architecture, or you can't be
> >> sure that the graphic card in the target system will support DRM, you
> >> most likely want to enable this option.
> >>
> >> In the non-accelerated case (e.g. when DRM is used), the inlined
> >> fb_scrollmode() function is hardcoded to return SCROLL_REDRAW and as such the
> >> compiler is able to optimize much unneccesary code away.
> >>
> >> In this v3 patch version I additionally changed the GETVYRES() and GETVXRES()
> >> macros to take a pointer to the fbcon_display struct. This fixes the build when
> >> console rotation is enabled and helps the compiler again to optimize out code.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: stable@vger.kernel.org # v5.10+
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> ---
> >>  drivers/video/console/Kconfig           | 11 +++++++
> >>  drivers/video/fbdev/core/fbcon.c        | 39 ++++++++++++++++++-------
> >>  drivers/video/fbdev/core/fbcon.h        | 15 +++++++++-
> >>  drivers/video/fbdev/core/fbcon_ccw.c    | 10 +++----
> >>  drivers/video/fbdev/core/fbcon_cw.c     | 10 +++----
> >>  drivers/video/fbdev/core/fbcon_rotate.h |  4 +--
> >>  drivers/video/fbdev/core/fbcon_ud.c     | 20 ++++++-------
> >>  7 files changed, 75 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> >> index 840d9813b0bc..6029fd41d7d0 100644
> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
> >>         help
> >>           Low-level framebuffer-based console driver.
> >>
> >> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >> +       bool "Framebuffer Console hardware acceleration support"
> >> +       depends on FRAMEBUFFER_CONSOLE
> >> +       default n if DRM
> >> +       default y
> >> +       help
> >> +         If you use a system on which DRM is fully supported you usually want to say N,
> >> +         otherwise you probably want to enable this option.
> >> +         If enabled the framebuffer console will utilize the hardware acceleration
> >> +         of your graphics card by using hardware bitblt and fillrect features.
> >
> > This really doesn't have much to do with DRM but more about running
> > questionable code. That's why I went with the generalized stern
> > warning and default n, and explained when it's ok to do this (single
> > user and you care more about fbcon performance than potential issues
> > because you only run trusted stuff with access to your vt and fbdev
> > /dev node).
>
> I think this is something we both will keep to have different opinion about :-)
>
> This console acceleration code is not exported or visible to userspace,
> e.g. you can't access or trigger it via /dev/fb0.
> It's only called internally from inside fbcon, so it's independed if
> it's a single- or multi-user system.
> The only way to "access" it is via standard stdio, where fbcon then
> either scrolls the screen via redrawing characters at new positions
> or by using hardware bitblt to move screen contents.
> IMHO there is nothing which is critical here.
> Even when I analyzed the existing bug reports, there was none which
> affected that specific code.

Maybe to clarify. The issues that generally result in this code going
boom in syzbot are when you race console activity (which can be
largely controlled through VT ioctls from userspace too, plus
/dev/kmsg) against fbdev resizing on the /dev/fb/0 nodes. The locking
there is kinda wild, and the code is very hard to understand. This is
why we've resorted to just disabling/deleting this code because most
cases we have no idea what's actually going on, aside from something
is clearly not going right.

Also the multi-user here means "you run untrusted code from other
people", not "you run multiple things in parallel" or "multiple people
are logged in at the same time".

> Anyway, let's look at that part in your patch:
>
> +       bool "Enable legacy fbcon code for hw acceleration"
> +       depends on FRAMEBUFFER_CONSOLE
> +       default n
> +       help
> +        Only enable this options if you are in full control of machine since
> +        the fbcon acceleration code is essentially unmaintained and known
> +        problematic.
> +
> +        If unsure, select n.
>
> Since I'm willing to maintain that scrolling/panning code, I'd like to
> drop the "is essentially unmaintained" part.
> And the "known problematic" part is up to now just speculative (which would be
> valid for other parts of the kernel too, btw).
>
> As this whole disussions showed, there are some few architectures/platforms
> which really still need this acceleration, while others don't.
> So, why not leave the decision up to the arch maintainers, which may opt-in
> or opt-out, while keeping the default on "n"?
>
> With that, here is a new proposal:
>
> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +       bool "Enable legacy fbcon hardware acceleration code"
> +       depends on FRAMEBUFFER_CONSOLE
> +       default y if (PARISC) # a few other arches may want to be listed here too...
> +       default n
> +       help
> +         This option enables the fbcon (framebuffer text-based) hardware acceleration for
> +         graphics drivers which were written for the fbdev graphics interface.
> +
> +         On modern machines, on mainstream machines (like x86-64) or when using a modern
> +         Linux distribution those fbdev drivers usually aren't used.
> +         So enabling this option wouldn't have any effect, which is why you want
> +         to disable this option on such newer machines.
> +
> +         If you compile this kernel for older machines which still require the fbdev
> +         drivers, you may want to say Y.
> +
> +         If unsure, select n.
>
> Would that be acceptable?

Perfect.

> Arch maintainers may then later send (or reply now with) patches, e.g.:
> +       default y if (M68K && XYZ)
> ...

Yeah makes sense.

> > Also you didn't keep any todo entry for removing DRM accel code,
>
> That wasn't intentional.
> I just sent 2 revert-patches and an fbcon-accel-enabling-patch.
> I'll look up what you had in your patch series and add it as seperate patch.

tbh I think it's fine either way. I think it's still rather unclear
which way drm will go, least because there's not many people who can
occasionally squeeze some time away to move things forward. Could be
that we add a new emergency logging console in the kernel for drm, and
distros switch over to kmscon (which is in userspace, and accelerated
iirc if you have gl, so most modern systems). Or whether we just
improve fbcon until it's solid enough. Or some other option.

So given that just dropping the todo sounds ok, it was just a bit
inconsistent with the Kconfig :-)

> > and iirc some nouveau folks also complained that they at least
> > once had some kind of accel, so that's another reason to not tie this
> > to DRM.
>
> The above proposal to add additional "default y if XYZ" would enable
> them to opt-in.
>
> > Anyway aside from this looks reasonable, can you pls respin with a
> > more cautious Kconfig text?
>
> Sure, I'll do as soon as we have a decision on the above Kconfig text.

Ideally if you can send them out today so it's not missing the
drm-misc-fixes train that leaves tomorrow, that would be best.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
