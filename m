Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9D164983
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA686E825;
	Wed, 19 Feb 2020 16:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1E48934F;
 Wed, 19 Feb 2020 16:09:57 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g15so649063vsf.1;
 Wed, 19 Feb 2020 08:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vd/A1XM035Th+XXQbtMVGkIlibpszBQdd7DxiGKNnMo=;
 b=Q6XMYQRJkGmDkEVtA++f1IiICqJjnNk8RwIiEpAeSxLy98H1Znavd1FHHnCv9fKY8Z
 PlPeJAGzoETBUfo7lrjdqvigvXdf5yZWTOrJ/FmQBsz2iQmTSOqWFYajwk8xUy5PCeK6
 9DJR1i2eLc8M5d5ZrfcnQaQkXNUQJG8wPnunUWuOWyHWAbqdzaMTD/mHrtiu1zf+IZHW
 gZV/NiZjxzj3MeHiOq/H7YV/YEsXVN1pRDJ4WRG3j1rfA75KZmDAO1m0OizsPpbf8Vs1
 Zhs+IbhYKkHTbTaaaBhsRyJd2kPPt9mush83BvggmFjTw2FLORktFEgY/K/THwuu1dab
 i1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vd/A1XM035Th+XXQbtMVGkIlibpszBQdd7DxiGKNnMo=;
 b=aQo1bdr6s2gFTpTpXlEsD3fMz6thrLxu/o4TRNDff6XkIfizh58mBY8K29GtQj2J6e
 NboGWJPrgom4LLLimgzQfa6BHuzr3ykqyPJP8TF4UsplS2CLfq/cuJnfVFx7rZCnt8ZT
 +giNsxMVufZ7ZQtBQwxKqgkcgNm/t+obFDjhYTHeZXY1VjKPt41byEuJLW/HLI4VJpKm
 VXrldagUKH1/9U9/Uqyri9hqz2UacFILzFY0fqOCBPBGzGXl5ASlVs6plS3VA0XLwuHt
 +XCAcLon9KqFy1CJRsRhkKmkdhhHNklgo9Upbx8t/EpixrUAYoOwIE0LAZnNXLzZ2shx
 Yd4Q==
X-Gm-Message-State: APjAAAUIJAJTwJOthuYtbww44njsW2uc5WJlVSCtw+emgR2eZf0Q73nJ
 7O3W75DJbKyKIEfgwJDr4nyuR6bHIZ8svKa69fw=
X-Google-Smtp-Source: APXvYqzduThbH3UDhR0KjJTGvxStosIBFEC+HfBRC/WjWZ2XUdOzQ4wFHCkHcV9q+0URlBcSYmnLANeYwC7kCsQcYxg=
X-Received: by 2002:a05:6102:7a4:: with SMTP id
 x4mr13905970vsg.85.1582128595904; 
 Wed, 19 Feb 2020 08:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
In-Reply-To: <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 16:09:46 +0000
Message-ID: <CACvgo52qxstEeXBgNvrck9zPZUYsOUbjQ9=a_C3x9u74gTA85w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/52] drm: add managed resources tied to
 drm_device
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 14:23, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > > Hi Daniel,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > > > We have lots of these. And the cleanup code tends to be of dubious
> > > > quality. The biggest wrong pattern is that developers use devm_, which
> > > > ties the release action to the underlying struct device, whereas
> > > > all the userspace visible stuff attached to a drm_device can long
> > > > outlive that one (e.g. after a hotunplug while userspace has open
> > > > files and mmap'ed buffers). Give people what they want, but with more
> > > > correctness.
> > > >
> > > > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > > > a few simplifications - I didn't (yet) copy over everything. Since
> > > > the types don't match code sharing looked like a hopeless endeavour.
> > > >
> > > > For now it's only super simplified, no groups, you can't remove
> > > > actions (but kfree exists, we'll need that soon). Plus all specific to
> > > > drm_device ofc, including the logging. Which I didn't bother to make
> > > > compile-time optional, since none of the other drm logging is compile
> > > > time optional either.
> > > >
> > > > One tricky bit here is the chicken&egg between allocating your
> > > > drm_device structure and initiliazing it with drm_dev_init. For
> > > > perfect onion unwinding we'd need to have the action to kfree the
> > > > allocation registered before drm_dev_init registers any of its own
> > > > release handlers. But drm_dev_init doesn't know where exactly the
> > > > drm_device is emebedded into the overall structure, and by the time it
> > > > returns it'll all be too late. And forcing drivers to be able clean up
> > > > everything except the one kzalloc is silly.
> > > >
> > > > Work around this by having a very special final_kfree pointer. This
> > > > also avoids troubles with the list head possibly disappearing from
> > > > underneath us when we release all resources attached to the
> > > > drm_device.
> > >
> > > This is all a very good idea ! Many subsystems are plagged by drivers
> > > using devm_k*alloc to allocate data accessible by userspace. Since the
> > > introduction of devm_*, we've likely reduced the number of memory leaks,
> > > but I'm pretty sure we've increased the risk of crashes as I've seen
> > > some drivers that used .release() callbacks correctly being naively
> > > converted to incorrect devm_* usage :-(
> > >
> > > This leads me to a question: if other subsystems have the same problem,
> > > could we turn this implementation into something more generic ? It
> > > doesn't have to be done right away and shouldn't block merging this
> > > series, but I think it would be very useful.
> >
> > It shouldn't be that hard to tie this into a drv_m() type of a thing
> > (driver_memory?)
> >
> > And yes, I think it's much better than devm_* for the obvious reasons of
> > this being needed here.
>
> There's two reasons I went with copypasta instead of trying to share code:
> - Type checking, I definitely don't want people to mix up devm_ with
> drmm_. But even if we do a drv_m that subsystems could embed we do
> have quite a few different types of component drivers (and with
> drm_panel and drm_bridge even standardized), and I don't want people
> to be able to pass the wrong kind of struct to e.g. a managed
> drmm_connector_init - it really needs to be the drm_device, not a
> panel or bridge or something else.
>
> - We could still share the code as a kind of implementation/backend
> library. But it's not much, and with embedding I could use the drm
> device logging stuff which is kinda nice. But if there's more demand
> for this I can definitely see the point in sharing this, as Laurent
> pointed out with the tiny optimization with not allocating a NULL void
> * that I've done (and screwed up) it's not entirely trivial code.
>

My 2c as they say, although closer to a brain dump :-)

On one hand the drm_device has an embedded struct device. On the other
drm_device preserves state which outlives the embedded struct device.

Would it make sense to keep drm_device better related to the
underlying device? Effectively moving the $misc state to drm_driver.
This idea does raise another question - struct drm_driver unlike many
other struct $foo_driver, does not embedded device_driver :-(
So if one is to cover the above two, then the embedding concerns will
be elevated.

WRT type safety, with the embedded work sorted, one could introduce
trivial helpers for drmm_connector_init and friends.

In another email you've also raised the question of API diversity and
reviews, I believe. IMHO one could start with a bare minimum set and
extend as needed.
Based on the prompt response from Greg, I suspect review won't be an issue.

If people agree with my analysis and considering the size/complexity
of drm_device <> drm_driver reshuffle, we could add a TODO task.
I suspect the underlying work will be larger than the current 52 patch
set, so doing it in one go will be PITA.

HTH
Emil

* Based on the following quick greps
$git grep -W "struct [a-zA-Z0-9-]*_driver {" -- include/ | grep -w
"struct device_driver\>.*;"  | wc -l
56
$git cgrep "struct [a-zA-Z0-9-]*_driver {" -- include/ | wc -l
71
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
