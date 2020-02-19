Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F0164A1F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789AB6EC3D;
	Wed, 19 Feb 2020 16:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378F06E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:22:51 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id p125so24330235oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGAKSCVTSlba76kA8bCj6BIFCNLxdM654SnMC1CZakI=;
 b=R5zPn6HZUHGW8ujR++mj5GhFJO+wctrfDvewWzI9fEtUe+knpO9tqXj5bQBOBOmYQH
 k9cnW41+4SMVu8vLW9ULz2Cv8hNIXoG1/iNxp7budiyYNqpk49dBWR/zv3v/C9Tj8UZj
 m5KE+n/Gj02f7ONLKU/0C4gKB2S5Pyf5C1T90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGAKSCVTSlba76kA8bCj6BIFCNLxdM654SnMC1CZakI=;
 b=AGk4qLCqiV4L7N9jQPHRjc4B6fZcIB7TO2Ji1ObqxMXvYnTZW1xXJRzmnnSij8nX23
 34wLaXP2AQD5o75yGojA2Bqff3fSoFwYdXigXlWxZBLHBZwrFyTh+JUFWH1C22s4FJuI
 +9APE5JET3DCitTzhdpNbzGDYdbJBFe9n/L4g0NVvCRmmdSENbGrPr9sEK79/KyAKufL
 feEVElRc7XCjwP2gRDiCN3ifv7TXfkwXxkJ2KsRHky81sU5Nn+2EaISxWsMVhTWX/lPW
 6kVlVPlCs+yImshQR3vVe5cnUfU7L3ap3zYA1t284zvc8si8opuHyQx85+IsiuRvc5vm
 uCuw==
X-Gm-Message-State: APjAAAWQlG+sAMOo095UCB4t+asAsXmlh9BCaalH4R06VVxxkjXiqwQQ
 GfR0fkGTCSxSckEa02Kdph2tQiMBh3JhJ8v6k4dDSw==
X-Google-Smtp-Source: APXvYqyHd9QLuG1IAm0JRlxSQge8GavRlgai0M3HTGlykXOt08Ru/Me79hNAWFx/KZ27QfRerUA73KM5+xqQXJ0AzAs=
X-Received: by 2002:aca:af09:: with SMTP id y9mr4804950oie.101.1582129370370; 
 Wed, 19 Feb 2020 08:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
 <CACvgo52qxstEeXBgNvrck9zPZUYsOUbjQ9=a_C3x9u74gTA85w@mail.gmail.com>
In-Reply-To: <CACvgo52qxstEeXBgNvrck9zPZUYsOUbjQ9=a_C3x9u74gTA85w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 17:22:38 +0100
Message-ID: <CAKMK7uE0wAR9DsmL9gPYJCeAzRw8kEE5eGwXRoVpxb4ByHtehA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/52] drm: add managed resources tied to
 drm_device
To: Emil Velikov <emil.l.velikov@gmail.com>
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

On Wed, Feb 19, 2020 at 5:09 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 19 Feb 2020 at 14:23, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > > > Hi Daniel,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > > > > We have lots of these. And the cleanup code tends to be of dubious
> > > > > quality. The biggest wrong pattern is that developers use devm_, which
> > > > > ties the release action to the underlying struct device, whereas
> > > > > all the userspace visible stuff attached to a drm_device can long
> > > > > outlive that one (e.g. after a hotunplug while userspace has open
> > > > > files and mmap'ed buffers). Give people what they want, but with more
> > > > > correctness.
> > > > >
> > > > > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > > > > a few simplifications - I didn't (yet) copy over everything. Since
> > > > > the types don't match code sharing looked like a hopeless endeavour.
> > > > >
> > > > > For now it's only super simplified, no groups, you can't remove
> > > > > actions (but kfree exists, we'll need that soon). Plus all specific to
> > > > > drm_device ofc, including the logging. Which I didn't bother to make
> > > > > compile-time optional, since none of the other drm logging is compile
> > > > > time optional either.
> > > > >
> > > > > One tricky bit here is the chicken&egg between allocating your
> > > > > drm_device structure and initiliazing it with drm_dev_init. For
> > > > > perfect onion unwinding we'd need to have the action to kfree the
> > > > > allocation registered before drm_dev_init registers any of its own
> > > > > release handlers. But drm_dev_init doesn't know where exactly the
> > > > > drm_device is emebedded into the overall structure, and by the time it
> > > > > returns it'll all be too late. And forcing drivers to be able clean up
> > > > > everything except the one kzalloc is silly.
> > > > >
> > > > > Work around this by having a very special final_kfree pointer. This
> > > > > also avoids troubles with the list head possibly disappearing from
> > > > > underneath us when we release all resources attached to the
> > > > > drm_device.
> > > >
> > > > This is all a very good idea ! Many subsystems are plagged by drivers
> > > > using devm_k*alloc to allocate data accessible by userspace. Since the
> > > > introduction of devm_*, we've likely reduced the number of memory leaks,
> > > > but I'm pretty sure we've increased the risk of crashes as I've seen
> > > > some drivers that used .release() callbacks correctly being naively
> > > > converted to incorrect devm_* usage :-(
> > > >
> > > > This leads me to a question: if other subsystems have the same problem,
> > > > could we turn this implementation into something more generic ? It
> > > > doesn't have to be done right away and shouldn't block merging this
> > > > series, but I think it would be very useful.
> > >
> > > It shouldn't be that hard to tie this into a drv_m() type of a thing
> > > (driver_memory?)
> > >
> > > And yes, I think it's much better than devm_* for the obvious reasons of
> > > this being needed here.
> >
> > There's two reasons I went with copypasta instead of trying to share code:
> > - Type checking, I definitely don't want people to mix up devm_ with
> > drmm_. But even if we do a drv_m that subsystems could embed we do
> > have quite a few different types of component drivers (and with
> > drm_panel and drm_bridge even standardized), and I don't want people
> > to be able to pass the wrong kind of struct to e.g. a managed
> > drmm_connector_init - it really needs to be the drm_device, not a
> > panel or bridge or something else.
> >
> > - We could still share the code as a kind of implementation/backend
> > library. But it's not much, and with embedding I could use the drm
> > device logging stuff which is kinda nice. But if there's more demand
> > for this I can definitely see the point in sharing this, as Laurent
> > pointed out with the tiny optimization with not allocating a NULL void
> > * that I've done (and screwed up) it's not entirely trivial code.
> >
>
> My 2c as they say, although closer to a brain dump :-)
>
> On one hand the drm_device has an embedded struct device. On the other
> drm_device preserves state which outlives the embedded struct device.
>
> Would it make sense to keep drm_device better related to the
> underlying device? Effectively moving the $misc state to drm_driver.
> This idea does raise another question - struct drm_driver unlike many
> other struct $foo_driver, does not embedded device_driver :-(
> So if one is to cover the above two, then the embedding concerns will
> be elevated.

drm_driver isn't a bus device driver in the linux driver model sense,
but an uapi thing that sits on top of some underlying device. So maybe
better to rename drm_driver to drm_interface_driver, and drm_device to
drm_interface. But that would be giantic churn and probably lots of
confusion. We do require a link between drm_device->struct device
nowadays, but that's just to guarantee userspace can find the
drm_device in sysfs somewhere and make sense of what it actually
drives.

That's also why the lifetimes for the two things are totally
different. The device driver an all it's resources are tied to the
underlying physical device, and resources can be released when that
driver<->device link is broken (either unbind or hotunplug). That's
what devm_ does. The drm_driver/drm_device otoh is tied to the
userspace api, and can only disappear once all the userspace handles
have been cleaned up and released. And we have an enormous amount of
those, with all the mmaps, and shared fd for dma-buf, sync_file,
synobj and whatever else. The drm_device can only be cleaned up once
userspace has closed all these things, or we'll go boom somewhere. The
only connection is that the userspace interface drives the underlying
hw (as long as it's still there) and the hw side holds a reference on
the uapi side (drm_dev_get/put) to make sure the userspace side
doesn't go poof and disappear when no one has the /dev node open :-)

But aside from these links they're completely separate worlds, and
mixing up the lifetimes results in all kinds of bad things happening.
Ofc normally these two things exist at the same time, but hotunplug
makes things very interesting here. And traditionally we've handled it
badly, if at all in drm.

> WRT type safety, with the embedded work sorted, one could introduce
> trivial helpers for drmm_connector_init and friends.
>
> In another email you've also raised the question of API diversity and
> reviews, I believe. IMHO one could start with a bare minimum set and
> extend as needed.
> Based on the prompt response from Greg, I suspect review won't be an issue.

The drmm_ stuff in here is the bare minimum we need to get started. I
expect lots of stuff will be added, but those are all just going to be
convenience functions on top of the drmm_add_action primitive.

> If people agree with my analysis and considering the size/complexity
> of drm_device <> drm_driver reshuffle, we could add a TODO task.
> I suspect the underlying work will be larger than the current 52 patch
> set, so doing it in one go will be PITA.

I'm not following what you want to shuffle. drm_driver is entirely
static and kinda global, drm_device is the per-instance structure we
have. And here we mean per-userspace uapi interface instance. So I
guess I'm confused what you want to do?
-Daniel

>
> HTH
> Emil
>
> * Based on the following quick greps
> $git grep -W "struct [a-zA-Z0-9-]*_driver {" -- include/ | grep -w
> "struct device_driver\>.*;"  | wc -l
> 56
> $git cgrep "struct [a-zA-Z0-9-]*_driver {" -- include/ | wc -l
> 71



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
