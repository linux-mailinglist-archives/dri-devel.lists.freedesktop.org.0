Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D1164AC5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7254F89C97;
	Wed, 19 Feb 2020 16:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF5789C97;
 Wed, 19 Feb 2020 16:42:06 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id c18so703672vsq.7;
 Wed, 19 Feb 2020 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+4GxkhhO749R0v9AghTKkMnWBJSlp0ZYbZudmMHUAw=;
 b=Ke0qCX/iHdRotiyN1KT36o8zTuT0FxpieHurVpqaX5I2SsQH+NImLhUOptZ2ACXI6B
 ypCfC9q1dKszujBbUAUrzcczoW3i33AVl5Lnve86jK/FXEVvhrxQDQJb8JiLtGBBfmxb
 Qpal1ekGs4ka3zQXKhE/X4ExiuUEXqvoWYFxeiqTYaGCsnMyqhG4++wqDsXCz8BYBkcK
 wnxRjvQ1ez63IwLWiZZFzQhSfvdcpDNMeruoeQ6BP0ngYwC2swdi1EH4rFVK1piJVZpH
 GzT0eECtJY30RCs2da5llXr3MloUdpYwiQQauawC+Ib/pPJP3aQYYB+GfFCJ+5/DlYav
 4muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+4GxkhhO749R0v9AghTKkMnWBJSlp0ZYbZudmMHUAw=;
 b=DBljtDpwghjPbDHZkzlDL5theWHU+gJgeocesYRMxNdyhI1M7NCuXR4C0te4/DPhH2
 oc/xRSwkpg0CMjL0A/kt6KKSi+S4LpS8UCtSM+SPujO77gsN1kElE59EimrIgf0h7xQw
 qEZj434qPegbK9hZPOqMFx+uT2r/hXlyMTy61zNL/wMyIStMHj+qoY8cR6jr9IVjBNJf
 DFzrFhbsHolDM1AkNYE5RwiIh4GCFLDa9CqPj2p7Rq2sOX69Qx2osXSKQGXSOV863tsC
 zS7DvwoQPpjxH/8tQmYMTHsNFFuWf1GTT1F2QiUVg3nFVkA81EXHDpObX3RsDVCmxsuL
 pM0Q==
X-Gm-Message-State: APjAAAV97JQPSvBjm2lwZSMdEmeP2zATFzpTwlE1A+rA6vRRMyk87oHR
 SShZlIVMKnK1mhZJh0w8UMBSRd0OtOPEh9jqaL0=
X-Google-Smtp-Source: APXvYqztb0Vy3yo9JtexaX5qOyelNOXEDAYSUqCWAEbjYBx+JDOAj1mM6JaHdIbrS8l/nX6B68CASCSzGmvo0kAZMlo=
X-Received: by 2002:a67:fc54:: with SMTP id p20mr14596830vsq.37.1582130525409; 
 Wed, 19 Feb 2020 08:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
 <CACvgo52qxstEeXBgNvrck9zPZUYsOUbjQ9=a_C3x9u74gTA85w@mail.gmail.com>
 <CAKMK7uE0wAR9DsmL9gPYJCeAzRw8kEE5eGwXRoVpxb4ByHtehA@mail.gmail.com>
In-Reply-To: <CAKMK7uE0wAR9DsmL9gPYJCeAzRw8kEE5eGwXRoVpxb4ByHtehA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 16:41:54 +0000
Message-ID: <CACvgo52rY9GUvKPdDHV7VbmnkpF_92vPXKdX9YX6cX04N0AaCg@mail.gmail.com>
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

On Wed, 19 Feb 2020 at 16:22, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Feb 19, 2020 at 5:09 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > On Wed, 19 Feb 2020 at 14:23, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > > > > Hi Daniel,
> > > > >
> > > > > Thank you for the patch.
> > > > >
> > > > > On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > > > > > We have lots of these. And the cleanup code tends to be of dubious
> > > > > > quality. The biggest wrong pattern is that developers use devm_, which
> > > > > > ties the release action to the underlying struct device, whereas
> > > > > > all the userspace visible stuff attached to a drm_device can long
> > > > > > outlive that one (e.g. after a hotunplug while userspace has open
> > > > > > files and mmap'ed buffers). Give people what they want, but with more
> > > > > > correctness.
> > > > > >
> > > > > > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > > > > > a few simplifications - I didn't (yet) copy over everything. Since
> > > > > > the types don't match code sharing looked like a hopeless endeavour.
> > > > > >
> > > > > > For now it's only super simplified, no groups, you can't remove
> > > > > > actions (but kfree exists, we'll need that soon). Plus all specific to
> > > > > > drm_device ofc, including the logging. Which I didn't bother to make
> > > > > > compile-time optional, since none of the other drm logging is compile
> > > > > > time optional either.
> > > > > >
> > > > > > One tricky bit here is the chicken&egg between allocating your
> > > > > > drm_device structure and initiliazing it with drm_dev_init. For
> > > > > > perfect onion unwinding we'd need to have the action to kfree the
> > > > > > allocation registered before drm_dev_init registers any of its own
> > > > > > release handlers. But drm_dev_init doesn't know where exactly the
> > > > > > drm_device is emebedded into the overall structure, and by the time it
> > > > > > returns it'll all be too late. And forcing drivers to be able clean up
> > > > > > everything except the one kzalloc is silly.
> > > > > >
> > > > > > Work around this by having a very special final_kfree pointer. This
> > > > > > also avoids troubles with the list head possibly disappearing from
> > > > > > underneath us when we release all resources attached to the
> > > > > > drm_device.
> > > > >
> > > > > This is all a very good idea ! Many subsystems are plagged by drivers
> > > > > using devm_k*alloc to allocate data accessible by userspace. Since the
> > > > > introduction of devm_*, we've likely reduced the number of memory leaks,
> > > > > but I'm pretty sure we've increased the risk of crashes as I've seen
> > > > > some drivers that used .release() callbacks correctly being naively
> > > > > converted to incorrect devm_* usage :-(
> > > > >
> > > > > This leads me to a question: if other subsystems have the same problem,
> > > > > could we turn this implementation into something more generic ? It
> > > > > doesn't have to be done right away and shouldn't block merging this
> > > > > series, but I think it would be very useful.
> > > >
> > > > It shouldn't be that hard to tie this into a drv_m() type of a thing
> > > > (driver_memory?)
> > > >
> > > > And yes, I think it's much better than devm_* for the obvious reasons of
> > > > this being needed here.
> > >
> > > There's two reasons I went with copypasta instead of trying to share code:
> > > - Type checking, I definitely don't want people to mix up devm_ with
> > > drmm_. But even if we do a drv_m that subsystems could embed we do
> > > have quite a few different types of component drivers (and with
> > > drm_panel and drm_bridge even standardized), and I don't want people
> > > to be able to pass the wrong kind of struct to e.g. a managed
> > > drmm_connector_init - it really needs to be the drm_device, not a
> > > panel or bridge or something else.
> > >
> > > - We could still share the code as a kind of implementation/backend
> > > library. But it's not much, and with embedding I could use the drm
> > > device logging stuff which is kinda nice. But if there's more demand
> > > for this I can definitely see the point in sharing this, as Laurent
> > > pointed out with the tiny optimization with not allocating a NULL void
> > > * that I've done (and screwed up) it's not entirely trivial code.
> > >
> >
> > My 2c as they say, although closer to a brain dump :-)
> >
> > On one hand the drm_device has an embedded struct device. On the other
> > drm_device preserves state which outlives the embedded struct device.
> >
> > Would it make sense to keep drm_device better related to the
> > underlying device? Effectively moving the $misc state to drm_driver.
> > This idea does raise another question - struct drm_driver unlike many
> > other struct $foo_driver, does not embedded device_driver :-(
> > So if one is to cover the above two, then the embedding concerns will
> > be elevated.
>
> drm_driver isn't a bus device driver in the linux driver model sense,
> but an uapi thing that sits on top of some underlying device. So maybe
> better to rename drm_driver to drm_interface_driver, and drm_device to
> drm_interface. But that would be giantic churn and probably lots of
> confusion. We do require a link between drm_device->struct device
> nowadays, but that's just to guarantee userspace can find the
> drm_device in sysfs somewhere and make sense of what it actually
> drives.
>
> That's also why the lifetimes for the two things are totally
> different. The device driver an all it's resources are tied to the
> underlying physical device, and resources can be released when that
> driver<->device link is broken (either unbind or hotunplug). That's
> what devm_ does. The drm_driver/drm_device otoh is tied to the
> userspace api, and can only disappear once all the userspace handles
> have been cleaned up and released. And we have an enormous amount of
> those, with all the mmaps, and shared fd for dma-buf, sync_file,
> synobj and whatever else. The drm_device can only be cleaned up once
> userspace has closed all these things, or we'll go boom somewhere. The
> only connection is that the userspace interface drives the underlying
> hw (as long as it's still there) and the hw side holds a reference on
> the uapi side (drm_dev_get/put) to make sure the userspace side
> doesn't go poof and disappear when no one has the /dev node open :-)
>
> But aside from these links they're completely separate worlds, and
> mixing up the lifetimes results in all kinds of bad things happening.
> Ofc normally these two things exist at the same time, but hotunplug
> makes things very interesting here. And traditionally we've handled it
> badly, if at all in drm.
>
Seems like my drm_device/drm_driver definitions were off.

Thanks a lot for clarifying.
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
