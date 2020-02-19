Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B11164B7F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DBF89180;
	Wed, 19 Feb 2020 17:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDA788FFE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:06:53 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r16so853589otd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Di04VlwtVd7b33dLYQPPOeqvq0+5y/vfykmCaNMreLI=;
 b=AtbBMaIFpY338JwP7YvTjC9//Zd6zTjwq3fdBEuTOuewR6YZcOrh+Bxfjfz4nkuk8A
 iM/QrN0Ux5Z/7I30Icq09tsQDH6LB8U3YGpVPIMzCM1NcgIQiOxqrXlUNz3GDfRgDjXh
 wPeRxrnVf/hSQBbKe1i3vuBaACGT4kx5Pz4xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Di04VlwtVd7b33dLYQPPOeqvq0+5y/vfykmCaNMreLI=;
 b=GZRoB4wGTo1EzjAz4g/7oUXPcgfHW4gIfmgyXmo9KdKabzUhi9dvaQduJ2Lnx0IQs0
 fVL8d+k15JMITc8+dCY6XzI8SiJlx5ge79j+mitbHhdGb6I/l662WMQPLjk0WJNBVpFR
 iHmaNtmu0T3tBFnOpwWVyrjS1r/MN5Qq5vJsa5WnwmoN3bZx6BC7QBnnjxao49SxKEbu
 3shAIxSGABSn+2eMvD+iDnzlY96lNHp8gndxsjfE9dEaNB3GRNDOafPYhRi51sZGL0/e
 XnwTE275rwcpFvT1BKvo6RbE8w5ZyfiG0nx7fJmNYUmeDTi35gYyd5b2qZg9ybASlmQY
 prCQ==
X-Gm-Message-State: APjAAAX1uJWiAfGCjD9xDmZJ6pP2Mwi4rZgi4Ffgl6p1ZLdTSCw43bTy
 csu+SFYqfjN7ViJiDGMZuVAFywdSOjeNGi/9W6BWOA==
X-Google-Smtp-Source: APXvYqxS5YjRfDGoZHL0VeXaAYL78/I3dXe505hb5hn6wKNsfUTgmMFkUzlf/4wkTEk+w/3U0gI0kSZ/4wbYg6FXJRA=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr21630999otq.281.1582132012306; 
 Wed, 19 Feb 2020 09:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
 <CACvgo52qxstEeXBgNvrck9zPZUYsOUbjQ9=a_C3x9u74gTA85w@mail.gmail.com>
 <CAKMK7uE0wAR9DsmL9gPYJCeAzRw8kEE5eGwXRoVpxb4ByHtehA@mail.gmail.com>
 <20200219164634.GB5070@pendragon.ideasonboard.com>
 <CAKMK7uG+PuiN9a+UnXOPMxDGp16ptAvmZrZSdKxFzsmNqkCosw@mail.gmail.com>
 <20200219165923.GD5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219165923.GD5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 18:06:40 +0100
Message-ID: <CAKMK7uF3moC9C=RyHCk=cg7hWjB8ES=HhhqVZwoXtxScXuL8Xg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/52] drm: add managed resources tied to
 drm_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 6:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 19, 2020 at 05:53:59PM +0100, Daniel Vetter wrote:
> > On Wed, Feb 19, 2020 at 5:46 PM Laurent Pinchart wrote:
> > > On Wed, Feb 19, 2020 at 05:22:38PM +0100, Daniel Vetter wrote:
> > >> On Wed, Feb 19, 2020 at 5:09 PM Emil Velikov wrote:
> > >>> On Wed, 19 Feb 2020 at 14:23, Daniel Vetter wrote:
> > >>>> On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman wrote:
> > >>>>> On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > >>>>>> On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > >>>>>>> We have lots of these. And the cleanup code tends to be of dubious
> > >>>>>>> quality. The biggest wrong pattern is that developers use devm_, which
> > >>>>>>> ties the release action to the underlying struct device, whereas
> > >>>>>>> all the userspace visible stuff attached to a drm_device can long
> > >>>>>>> outlive that one (e.g. after a hotunplug while userspace has open
> > >>>>>>> files and mmap'ed buffers). Give people what they want, but with more
> > >>>>>>> correctness.
> > >>>>>>>
> > >>>>>>> Mostly copied from devres.c, with types adjusted to fit drm_device and
> > >>>>>>> a few simplifications - I didn't (yet) copy over everything. Since
> > >>>>>>> the types don't match code sharing looked like a hopeless endeavour.
> > >>>>>>>
> > >>>>>>> For now it's only super simplified, no groups, you can't remove
> > >>>>>>> actions (but kfree exists, we'll need that soon). Plus all specific to
> > >>>>>>> drm_device ofc, including the logging. Which I didn't bother to make
> > >>>>>>> compile-time optional, since none of the other drm logging is compile
> > >>>>>>> time optional either.
> > >>>>>>>
> > >>>>>>> One tricky bit here is the chicken&egg between allocating your
> > >>>>>>> drm_device structure and initiliazing it with drm_dev_init. For
> > >>>>>>> perfect onion unwinding we'd need to have the action to kfree the
> > >>>>>>> allocation registered before drm_dev_init registers any of its own
> > >>>>>>> release handlers. But drm_dev_init doesn't know where exactly the
> > >>>>>>> drm_device is emebedded into the overall structure, and by the time it
> > >>>>>>> returns it'll all be too late. And forcing drivers to be able clean up
> > >>>>>>> everything except the one kzalloc is silly.
> > >>>>>>>
> > >>>>>>> Work around this by having a very special final_kfree pointer. This
> > >>>>>>> also avoids troubles with the list head possibly disappearing from
> > >>>>>>> underneath us when we release all resources attached to the
> > >>>>>>> drm_device.
> > >>>>>>
> > >>>>>> This is all a very good idea ! Many subsystems are plagged by drivers
> > >>>>>> using devm_k*alloc to allocate data accessible by userspace. Since the
> > >>>>>> introduction of devm_*, we've likely reduced the number of memory leaks,
> > >>>>>> but I'm pretty sure we've increased the risk of crashes as I've seen
> > >>>>>> some drivers that used .release() callbacks correctly being naively
> > >>>>>> converted to incorrect devm_* usage :-(
> > >>>>>>
> > >>>>>> This leads me to a question: if other subsystems have the same problem,
> > >>>>>> could we turn this implementation into something more generic ? It
> > >>>>>> doesn't have to be done right away and shouldn't block merging this
> > >>>>>> series, but I think it would be very useful.
> > >>>>>
> > >>>>> It shouldn't be that hard to tie this into a drv_m() type of a thing
> > >>>>> (driver_memory?)
> > >>>>>
> > >>>>> And yes, I think it's much better than devm_* for the obvious reasons of
> > >>>>> this being needed here.
> > >>>>
> > >>>> There's two reasons I went with copypasta instead of trying to share code:
> > >>>> - Type checking, I definitely don't want people to mix up devm_ with
> > >>>> drmm_. But even if we do a drv_m that subsystems could embed we do
> > >>>> have quite a few different types of component drivers (and with
> > >>>> drm_panel and drm_bridge even standardized), and I don't want people
> > >>>> to be able to pass the wrong kind of struct to e.g. a managed
> > >>>> drmm_connector_init - it really needs to be the drm_device, not a
> > >>>> panel or bridge or something else.
> > >>>>
> > >>>> - We could still share the code as a kind of implementation/backend
> > >>>> library. But it's not much, and with embedding I could use the drm
> > >>>> device logging stuff which is kinda nice. But if there's more demand
> > >>>> for this I can definitely see the point in sharing this, as Laurent
> > >>>> pointed out with the tiny optimization with not allocating a NULL void
> > >>>> * that I've done (and screwed up) it's not entirely trivial code.
> > >>>
> > >>> My 2c as they say, although closer to a brain dump :-)
> > >>>
> > >>> On one hand the drm_device has an embedded struct device. On the other
> > >>> drm_device preserves state which outlives the embedded struct device.
> > >>>
> > >>> Would it make sense to keep drm_device better related to the
> > >>> underlying device? Effectively moving the $misc state to drm_driver.
> > >>> This idea does raise another question - struct drm_driver unlike many
> > >>> other struct $foo_driver, does not embedded device_driver :-(
> > >>> So if one is to cover the above two, then the embedding concerns will
> > >>> be elevated.
> > >>
> > >> drm_driver isn't a bus device driver in the linux driver model sense,
> > >> but an uapi thing that sits on top of some underlying device. So maybe
> > >> better to rename drm_driver to drm_interface_driver, and drm_device to
> > >> drm_interface. But that would be giantic churn and probably lots of
> > >> confusion. We do require a link between drm_device->struct device
> > >> nowadays, but that's just to guarantee userspace can find the
> > >> drm_device in sysfs somewhere and make sense of what it actually
> > >> drives.
> > >
> > > If we wanted to rename drm_driver to align with the rest of the kernel,
> > > it should probably be drm_device_ops, with the non-ops fields being
> > > moved to a separate structure.
> > >
> > > I don't mind churn (but I agree it may not be worth it), but even if we
> > > don't rename the structure, I think it would be very useful to remove
> > > the non-const fields, in order to allow storing the structure as a
> > > global static const struct. Function pointers in non-const memory can be
> > > a security issue. As far as I can tell, the only blocker is the
> > > legacy_dev_list field.
> >
> > Oh man ... we could make the legacy_dev_list depend on
> > CONFIG_DRM_LEGACY and the INIT_LIST_HEAD also depend upon
> > DRIVER_LEGACY and then at least all the new drivers could make their
> > drm_driver structure const. Or something along those lines.
>
> We would however need different function prototypes for drm_dev_init() &
> co. that would take const struct drm_driver instead of struct
> drm_driver.

Huh right, this would require quite serious amounts of lying. Legacy
drivers only enter this entire thing through drm_legacy_pci_init, so
we could cast there to a const and move the LIST_INIT_HEAD to that
function. All the other list manipulation is also only happening in
drm_pci.c. But would be kinda ugly.

> > Properly ditching legacy_dev_list is probably not worth it, since
> > those drivers tend to be all root exploits anyway :-)
>
> What if we turned the list into a global list in drm_pci.c ?

I guess that would work too.
-Daniel

> > >> That's also why the lifetimes for the two things are totally
> > >> different. The device driver an all it's resources are tied to the
> > >> underlying physical device, and resources can be released when that
> > >> driver<->device link is broken (either unbind or hotunplug). That's
> > >> what devm_ does. The drm_driver/drm_device otoh is tied to the
> > >> userspace api, and can only disappear once all the userspace handles
> > >> have been cleaned up and released.
> > >
> > > And so they're tied to the lifetime of the struct device that models the
> > > userspace interface. Shame they're both called device :-)
> > >
> > >> And we have an enormous amount of those, with all the mmaps, and
> > >> shared fd for dma-buf, sync_file, synobj and whatever else. The
> > >> drm_device can only be cleaned up once userspace has closed all these
> > >> things, or we'll go boom somewhere. The only connection is that the
> > >> userspace interface drives the underlying hw (as long as it's still
> > >> there) and the hw side holds a reference on the uapi side
> > >> (drm_dev_get/put) to make sure the userspace side doesn't go poof and
> > >> disappear when no one has the /dev node open :-)
> > >>
> > >> But aside from these links they're completely separate worlds, and
> > >> mixing up the lifetimes results in all kinds of bad things happening.
> > >> Ofc normally these two things exist at the same time, but hotunplug
> > >> makes things very interesting here. And traditionally we've handled it
> > >> badly, if at all in drm.
> > >>
> > >>> WRT type safety, with the embedded work sorted, one could introduce
> > >>> trivial helpers for drmm_connector_init and friends.
> > >>>
> > >>> In another email you've also raised the question of API diversity and
> > >>> reviews, I believe. IMHO one could start with a bare minimum set and
> > >>> extend as needed.
> > >>> Based on the prompt response from Greg, I suspect review won't be an issue.
> > >>
> > >> The drmm_ stuff in here is the bare minimum we need to get started. I
> > >> expect lots of stuff will be added, but those are all just going to be
> > >> convenience functions on top of the drmm_add_action primitive.
> > >>
> > >>> If people agree with my analysis and considering the size/complexity
> > >>> of drm_device <> drm_driver reshuffle, we could add a TODO task.
> > >>> I suspect the underlying work will be larger than the current 52 patch
> > >>> set, so doing it in one go will be PITA.
> > >>
> > >> I'm not following what you want to shuffle. drm_driver is entirely
> > >> static and kinda global, drm_device is the per-instance structure we
> > >> have. And here we mean per-userspace uapi interface instance. So I
> > >> guess I'm confused what you want to do?
> > >>
> > >>> * Based on the following quick greps
> > >>> $git grep -W "struct [a-zA-Z0-9-]*_driver {" -- include/ | grep -w
> > >>> "struct device_driver\>.*;"  | wc -l
> > >>> 56
> > >>> $git cgrep "struct [a-zA-Z0-9-]*_driver {" -- include/ | wc -l
> > >>> 71
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
