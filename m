Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8312B7A3F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 10:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BF989B42;
	Wed, 18 Nov 2020 09:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DE589BA5;
 Wed, 18 Nov 2020 09:21:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s18so322613oih.1;
 Wed, 18 Nov 2020 01:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkMlGhBddK4CWlIkq4VYwxC7ANjZVCeqrUa0zy6WU0I=;
 b=uaoUQCadTyzWP80/vAYoNJZafrq7tbmPor2qMkoaqLVmVbrom0Z6NyriBLZyTcG+eP
 NbIedEoS6te5An81V6TXEJOPb0Xz793hbV3NsUIHBvetIjzwKcYt4kRIwW7KHP45oViJ
 iiGnhbF9dWa0AkUsr0FBkfc0agf+NUqjDrt+scbRvGKkXt0wiK/WE07C6Ls8Yvuhyek2
 3bFqGS6P4Pz9rnul51tu89va456ce+moRofM7QcI6FI1GO6kTQB+NzVY3dVQmBVSTKMD
 YGBVIOY1p1qemvowmP/YCn3N5VSqUPZf7ofiFq5hwI3IbQ5r0j19mZKDokYPimaCwQLS
 kg0A==
X-Gm-Message-State: AOAM5310T13j3hFbEZYbMK+rL5fDJpCi+x1/hNXc+DXFWw1Y+9WDSIYN
 /KRrSASP/w2a0rYBxGI6ElnKYv4nUGiP+W7UBsI=
X-Google-Smtp-Source: ABdhPJyqvIcxUrbL0AaN6gSRNz2wjNs4QkYGhaUKzlP3J9lx3udNRytqjWUm4S6ui6wFImY2T0gEVeBnLueaghIYvhM=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr1952687oia.153.1605691281629; 
 Wed, 18 Nov 2020 01:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
 <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
 <alpine.DEB.2.22.394.2010311116530.379363@ramsan.of.borg>
 <CAKMK7uH3SQEjhJkcMcZSW6foiDsMKS91StLYcKoyH+h1obKPCA@mail.gmail.com>
In-Reply-To: <CAKMK7uH3SQEjhJkcMcZSW6foiDsMKS91StLYcKoyH+h1obKPCA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2020 10:21:10 +0100
Message-ID: <CAMuHMdWOHgysOYNXWxo6YoqjJRaqAyFrHjDEm7ARLyP=xmnN5g@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Jiri Slaby <jirislaby@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Replying "early" (see below), as this was applied to
drm-misc/for-linux-next.

On Sat, Oct 31, 2020 at 3:17 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Sat, Oct 31, 2020 at 11:28 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, 29 Oct 2020, Daniel Vetter wrote:
> > > So ever since syzbot discovered fbcon, we have solid proof that it's
> > > full of bugs. And often the solution is to just delete code and remove
> > > features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> > >
> > > Now the problem is that most modern-ish drivers really only treat
> > > fbcon as an dumb kernel console until userspace takes over, and Oops
> > > printer for some emergencies. Looking at drm drivers and the basic
> > > vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> > > acceleration:
> > >
> > > - nouveau, seems to be enabled by default
> > > - omapdrm, when a DMM remapper exists using remapper rewriting for
> > >  y/xpanning
> > > - gma500, but that is getting deleted now for the GTT remapper trick,
> > >  and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
> > >  flag, so unused (and could be deleted already I think).
> > >
> > > No other driver supportes accelerated fbcon. And fbcon is the only
> > > user of this accel code (it's not exposed as uapi through ioctls),
> > > which means we could garbage collect fairly enormous amounts of code
> > > if we kill this.
> >
> > "git grep FBINFO_HWACCEL_COPYAREA" shows me there are 32 more drivers
> > using acceleration under drivers/video/fbdev/.
> >
> > > Plus because syzbot only runs on virtual hardware, and none of the
> > > drivers for that have acceleration, we'd remove a huge gap in testing.
> > > And there's no other even remotely comprehensive testing aside from
> > > syzbot.
> >
> > That sounds like a great argument to remove all hardware drivers from
> > the kernel ;-)
>
> fbdev is unmaintained, has no one volunteering to put in the work (and
> there's huge amounts of work needed), and there's no test suite. No,
> fbtest.c doesn't can't, that's not even close. We're not going to
> delete everything in the kernel, but slowly sunsetting stuff that's
> just costing and not bringing in up is a good idea.

The fbcon acceleration code is indeed not tested by fbset, and it is
purely in-kernel acceleration for the console.

> > Seriously, how hard can it be to add "software-accelerated" acceleration
> > hooks to drivers/video/fbdev/vfb.c, to enable syzbot to exercise the
> > core acceleration code paths?
>
> Just this one is 5 combinations, which means I'd need to convince
> syzbot to test 5 different machine setups.

Why 5 combinations?
Enable vfb (which can be a module) and be done with it?

> Plus we're still lacking a test suite, and judging from how much time
> it took to get something basic going for kms, that's about 2 engineer
> years of effort that no one is even close to willing to spend.

Sure, writing test suites is hard, and takes time.

> > > This patch here just disables the acceleration code by always
> > > redrawing when scrolling. The plan is that once this has been merged
> > > for well over a year in released kernels, we can start to go around
> > > and delete a lot of code.
> >
> > Have you benchmarked the performance impact on traditional fbdev
> > drivers?
>
> There's still some acceleration if you have an image blit engine for
> redrawing the screen. But the complexity is contained in the old
> drivers that no one cares about.
>
> For anything I have access to the difference is 0.

Sure, you're doing DRM drivers ;-)

> Reality is that fbdev is just there nowadays for Oops printing and
> emergency usage, and it's plenty good enough for that. If there's

That's true for systems that are supported by a DRM driver.

> anyone who cares beyond that, they're most definitely not able to put
> in time for upstream work.

There exist actual products using out-of-tree fbdev drivers that never
got the chance of being merged upstream due to the moratorium on new
fbdev drivers.

BTW, I'm trying to convert an old fbdev driver to DRM, but don't have it
working yet. I had hoped to get something working before replying to
this email, so I could provide more detailed feedback.

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
