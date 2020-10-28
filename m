Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5129D1FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F896E3C1;
	Wed, 28 Oct 2020 19:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8DB6E3C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 19:58:07 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id o14so277758otj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzGFYe0nvbjrAeQ1YGLbXpu26Wc5OrEzBpgSP72OTZE=;
 b=IbrdKaer1oz3lB6otvi6JMKX2C1+erS1Bn6qEkAZTXR4nqydHt4Lfrums0QjfZr804
 2qSxQmPrOwNSXzHqa4CI/n1qIF8Ig/wvZJ1rhdFp1TnB6b3jyFcxwP1kdHN6FUvgSLED
 j1jePyg5Y/jDoSPjr4k6b3CgWB/0bMEH6TwrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzGFYe0nvbjrAeQ1YGLbXpu26Wc5OrEzBpgSP72OTZE=;
 b=bWd/OtAz4RUSSul0eb8exqUYN/FMPmTFc9yIB2LP7OQgD+JcH2Ow2HibKwM7mQP0v4
 /hDDBhNA50dqmsoMr9YWd6x+mCZKa3GCnogFtvZaZ8qyjZl9vgoIr7kkmQHSanaY/AoL
 BEDkGjvtuec4Pj2IBAaXvONtqnG+qV7AqbXjdKUuZi2r7+2VTukTilMff7ad0FrzvdGm
 0awNp6DqxXSOQVt4nYQ8YfCf6DoW5/VTfGKJXx84Q8apw8g4nzYmvMUGIaU2K9FqfpyK
 u/UMG4+iiVnIAjvJyTMXu1L6+Ewo8+puhCWLuq2Yk0VRBNESZLb60+xHOi9nkIIE7cn/
 K5vw==
X-Gm-Message-State: AOAM530XQD6t50Zrc3tYSKjzVPKPguOYT+WOxbB20A1f/u23upRvCHsz
 QmpG47/fIiUmfwzSYpkuKJmsF02R1DPSwb3psRMgrQ==
X-Google-Smtp-Source: ABdhPJzOcH+sWrQY1XBRDmK1H+9LbAf4p9j3EQkezWQ8iu8twrBjpuktkfHrPo1DkISrwDtFAuscuK3NMcuWuv7+OuQ=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr749100ote.188.1603915087219; 
 Wed, 28 Oct 2020 12:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
 <20201028185029.GA683411@ravnborg.org>
In-Reply-To: <20201028185029.GA683411@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Oct 2020 20:57:55 +0100
Message-ID: <CAKMK7uGBf7Revnr80n2jtBKht_3M7hoKskGhcEhOz5HqeMVB0g@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 7:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
> > So ever since syzbot discovered fbcon, we have solid proof that it's
> > full of bugs. And often the solution is to just delete code and remove
> > features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> >
> > Now the problem is that most modern-ish drivers really only treat
> > fbcon as an dumb kernel console until userspace takes over, and Oops
> > printer for some emergencies. Looking at drm drivers and the basic
> > vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> > acceleration:
> >
> > - nouveau, seems to be enabled by default
> > - omapdrm, when a DMM remapper exists using remapper rewriting for
> >   y/xpanning
> > - gma500, but that is getting deleted now for the GTT remapper trick,
> >   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
> >   flag, so unused (and could be deleted already I think).
> >
> > No other driver supportes accelerated fbcon. And fbcon is the only
> > user of this accel code (it's not exposed as uapi through ioctls),
> > which means we could garbage collect fairly enormous amounts of code
> > if we kill this.
> >
> > Plus because syzbot only runs on virtual hardware, and none of the
> > drivers for that have acceleration, we'd remove a huge gap in testing.
> > And there's no other even remotely comprehensive testing aside from
> > syzbot.
> >
> > This patch here just disables the acceleration code by always
> > redrawing when scrolling. The plan is that once this has been merged
> > for well over a year in released kernels, we can start to go around
> > and delete a lot of code.
>
> See below for a warning fix.
>
> Some figures from trying to toss accel code out from a few fbdev drivers:
>
>  drivers/video/fbdev/cirrusfb.c | 300 +----------------------------------------
>  1 file changed, 4 insertions(+), 296 deletions(-)
>
>  drivers/video/fbdev/aty/radeon_accel.c | 174 ---------------------------------
>  drivers/video/fbdev/aty/radeon_base.c  |  43 ++------
>  drivers/video/fbdev/aty/radeon_pm.c    |   7 --
>  drivers/video/fbdev/aty/radeonfb.h     |   3 -
>  4 files changed, 7 insertions(+), 220 deletions(-)
>
> This may open up the discussion if the right course of action would be
> to drop the drivers in favour of drm counterparts - but thats another
> story.

Yeah I think we can start deleting drivers for which we have drm
drivers which are mostly feature parity and see whether anyone pipes
up. There's always going to be the odd corner case (like apparently
the fbdev ati driver works better on some ppc machines than the drm
one).

The thing is, we can't delete the entire accel code with this, I think
only fb_copyarea goes away. The other hooks I think still have some
users.
-Daniel

>
>         Sam
>
> > @@ -1961,7 +1963,6 @@ static void updatescrollmode(struct fbcon_display *p,
> >  {
> >       struct fbcon_ops *ops = info->fbcon_par;
> >       int fh = vc->vc_font.height;
> > -     int cap = info->flags;
> >       u16 t = 0;
> >       int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> >                                 info->fix.xpanstep);
> > @@ -1969,37 +1970,12 @@ static void updatescrollmode(struct fbcon_display *p,
> >       int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> >       int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> >                                  info->var.xres_virtual);
> > -     int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
> > -             divides(ypan, vc->vc_font.height) && vyres > yres;
> > -     int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
> > -             divides(ywrap, vc->vc_font.height) &&
> > -             divides(vc->vc_font.height, vyres) &&
> > -             divides(vc->vc_font.height, yres);
> > -     int reading_fast = cap & FBINFO_READS_FAST;
> > -     int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
> > -             !(cap & FBINFO_HWACCEL_DISABLED);
> > -     int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
> > -             !(cap & FBINFO_HWACCEL_DISABLED);
>
> Some bot will likely tell you that this causes warnings.
> At least it did in my sparc64 build.
>
> Fix:
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 398914e035e9..e8b009c621d8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2150,10 +2150,6 @@ static void updatescrollmode(struct fbcon_display *p,
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         int fh = vc->vc_font.height;
> -       u16 t = 0;
> -       int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> -                                 info->fix.xpanstep);
> -       int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
>         int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>         int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>                                    info->var.xres_virtual);
>
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
