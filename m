Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A322379700
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAD989ACD;
	Mon, 10 May 2021 18:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A789ACD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 18:26:52 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id c3so16592934oic.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xk4bl3dsZS6KLKYu1S58F9UPzYm5W7SG83Ij5mmCTUI=;
 b=K9LDfRPI9iOlXAenVDQcRBaTDzeM2pMDWZA+BbSNewHTTtQrepmyn7C3xyDE28z9t9
 BHC9GTEFbnTM2euHrOkbGkjQQvXc2oH90dwm6dGFGyclpnXr3jpjG4ATpCJslwNQ5xbE
 PZ83T/Mz2VGrlKBr6CEKdJOJ5JVkVLfsdQTC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xk4bl3dsZS6KLKYu1S58F9UPzYm5W7SG83Ij5mmCTUI=;
 b=o8PgW5eZTbCHGQxVsZ9EiOSyn2b37uToEvTf3mMNmgJGO9CMmarvsqh2qTAczPcUvS
 ScYqimPT6WlNl89A/fJA8Q24e3AlNcD0UG62jQppCGQDKCgqg/u+DWbBqv40C9BZhlDX
 Z3reMXBFAX6O86voSegfbjTOeyy2Efht6Ohu/xE67xJhagJZIhd9gawRkYDLkBqKU02C
 4XzzxV8D+iSreEyZwoybY1vq6xfV+ZKSSYKXM3kuWopIL2AwRBlpujRuXKMpWZSFBS63
 OJfbHqeRpVabfrBLQ5pLjlPcIZ7wjf0VjYESB79wVdrDkohCFUxZvjD3/P0w7fl5vpsO
 i+ew==
X-Gm-Message-State: AOAM530+vDmD/cE+dnG+iGxHKWdinMdnPy/WZ0i49BA/vpHcE+FWmIVN
 HDym4jaFfu+oE4pgQPPVYwAkQWyuDD3DK71OnHhVBg==
X-Google-Smtp-Source: ABdhPJyH0c7kPu4AUmwzqM8o4rjiQjSV5N5LjuF2EUFq6afvmu1aQK4GePZmlOY9oYc5LOd7F6D6SMfYU113SfOyDHw=
X-Received: by 2002:a05:6808:699:: with SMTP id
 k25mr344000oig.101.1620671211832; 
 Mon, 10 May 2021 11:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
In-Reply-To: <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 10 May 2021 20:26:40 +0200
Message-ID: <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 7:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Daniel Vetter (2021-05-10 09:05:21)
> > On Sat, May 08, 2021 at 12:41:18AM -0700, Stephen Boyd wrote:
> > > The device lists are poorly ordered when the component device code is
> > > used. This is because component_master_add_with_match() returns 0
> > > regardless of component devices calling component_add() first. It can
> > > really only fail if an allocation fails, in which case everything is
> > > going bad and we're out of memory. The host device (called master_dev in
> > > the code), can succeed at probe and be put on the device lists before
> > > any of the component devices are probed and put on the lists.
> > >
> > > Within the component device framework this usually isn't that bad
> > > because the real driver work is done at bind time via
> > > component{,master}_ops::bind(). It becomes a problem when the driver
> > > core, or host driver, wants to operate on the component device outside
> > > of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> > > driver core doesn't understand the relationship between the host device
> > > and the component devices and could possibly try to operate on component
> > > devices when they're already removed from the system or shut down.
> > >
> > > Normally, device links or probe defer would reorder the lists and put
> > > devices that depend on other devices in the lists at the correct
> > > location, but with component devices this doesn't happen because this
> > > information isn't expressed anywhere. Drivers simply succeed at
> > > registering their component or host with the component framework and
> > > wait for their bind() callback to be called once the other components
> > > are ready. We could make various device links between 'master_dev' and
> > > 'component->dev' but it's not necessary. Let's simply move the hosting
> > > device to the end of the device lists when the component device fully
> > > binds. This way we know that all components are present and have probed
> > > properly and now the host device has really probed so it's safe to
> > > assume the host driver ops can operate on any component device.
> > >
> > > This fixes the msm display driver shutdown path when the DSI controller
> > > is connected to a DSI bridge that is controlled via i2c. In this case,
> > > the msm display driver wants to tear down the display pipeline on
> > > shutdown at msm_pdev_shutdown() by calling drm_atomic_helper_shutdown(),
> > > and it can't do that unless the whole display chain is still probed and
> > > active in the system. When a display bridge is on i2c, the i2c device
> > > for the bridge will be created whenever the i2c controller probes, which
> > > could be before or after the msm display driver probes. If the i2c
> > > controller probes after the display driver, then the i2c controller will
> > > be shutdown before the display controller during system wide shutdown
> > > and thus i2c transactions will stop working before the display pipeline
> > > is shut down. This means we'll have the display bridge trying to access
> > > an i2c bus that's shut down because drm_atomic_helper_shutdown() is
> > > trying to disable the bridge after the bridge is off.
> > >
> > > Moving the host device to the end of the lists at bind time moves the
> > > drm_atomic_helper_shutdown() call before the i2c bus is shutdown.
> > > This fixes the immediate problem, but we could improve it a bit by
> > > modeling device links from the component devices to the host device
> > > indicating that they supply something, although it is slightly different
> > > because the consumer doesn't need the suppliers to probe to succeed.
> > >
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >
> > Entirely aside, but an s/master/aggregate/ or similar over the entire
> > component.c codebase would help a pile in making it easier to understand
> > which part does what. Or at least I'm always terribly confused about which
> > bind binds what and all that, so maybe an additional review whether we
> > have a clear split into aggregate and individual components after that
> > initial fix is needed.
>
> Agreed.
>
> >
> > On the actual topic: I agree there's a problem here, but I'm honestly not
> > sure how it should be fixed. That's way over my understanding of all the
> > device probe and pm interactions. Of which there are plenty.
> >
> > One question I have: Why is the bridge component driver not correctly
> > ordered wrt the i2c driver it needs? The idea is that the aggregate driver
> > doesn't access any hw itself, but entirely relies on all its components.
> > So as long as all the component drivers are sorted correctly in the device
> > list, things /should/ work. And as soon as we drop out a single component,
> > the aggregate gets unbound (and then does all the
> > drm_atomic_helper_shutdown and all the other drm teardown). So is the bug
> > perhaps that msm does the drm teardown in the wrong callback?
>
> I see my explanation of the problem wasn't sufficient :|
>
> The bridge driver is not a component device. It is connected to the
> aggregate device via the DSI device, where the DSI device is a component
> device. The i2c bus/controller must probe before the i2c bridge probes,
> so the device list is already ordered correctly for those two devices
> (i2c controller and i2c bridge). The problem is the aggregate device
> doesn't know that the bridge is part of the display pipeline/encoder
> chain.
>
> I thought that this design was intentional. Bridge devices can be mixed
> and matched with display drivers because they're (always?) off the SoC
> and so the aggregate device can't know which components it needs. I see
> that the msm driver has some logic to traverse from the display
> controller to the display phy, like DSI or HDMI, but it doesn't go
> beyond that.
>
> The crucially important part is that the DSI encoder will fail probe
> until the end of the encoder chain is probed, see
> msm_dsi_host_register() and how it checks for a panel and a bridge.
>
> The order of operations is like this
>
>  1. msm driver probes, creates aggregate device driver
>  2. i2c controller probes, creates i2c bus
>  3. i2c bridge probes, creates drm bridge and adds to drm
>  4. rest of component devices probe and aggregate device is bound
>
> The device list now has msm, i2c, bridge in that order. When we go to
> system wide shutdown the bridge is shutdown first, then the i2c bus, and
> then msm calls drm_atomic_helper_shutdown(). That tries to call the i2c
> bridge ops because it's attached to the end of the DSI encoder and
> things don't go well because i2c is gone. This patch fixes the order of
> the list so that msm is moved on the device list after all the
> components that make up the aggregate device have probed. This only
> works to move the aggregate device after the i2c bridge because the
> msm_dsi_host_register() function won't return success until the bridge
> device is probed.

Ah I think I get this now. There is indeed a design problem:
component.c only has bind/unbind hooks for all its things. Which means
driver load/unload will work correctly because in your above sequence:

1. drm_brige unbinds
-> this triggers the unbind of the entire aggregate of components
2. i2c unbinds
3. msm unbinds, but there's nothing to clean up anymore except the
aggregate/master struct

Now for runtime pm this also all works out, because each component
grabs the right runtime pm references. But for the system-wide pm
changes, where we rely on the device list order to make sure things
happen in the right way, it all blows up.

1. drm_bringe shutdown
2. i2c shutdown
3. msm shutdown, and with very sad thrombones because we blow up

I think the right fix is to make component.c more of  a driver model
thing, which probably means either the aggregate must get tied closer
to the main struct device, or it needs to gain its own struct device.
Or minimally at least, the aggregate needs to gain an entire set of
pm_ops, which gets called in the right order if any of the component's
pm_ops gets called. Wiring that all up will be major surgery I think.

I guess another option would be trying to figure out how the aggreate
registration could fail with EPROBE_DEFER until all the parts are
there, to guarantee the right ordering. Not sure that will work with
the current component users though.

> It's an interesting idea to trigger shutdown when the component device
> is unbound. Are you suggesting that the i2c bridge device have a
> 'shutdown' callback, that essentially removes the bridge from the
> encoder chain via mipi_dsi_detach() and then drm_bridge_remove()?
> Presumably that would somehow tell the DSI encoder that it should stop
> trying to use the i2c bridge and then drm_atomic_helper_shutdown()
> wouldn't try to traverse beyond the DSI to shut things down.

Nope, we don't want to unbind the driver on shutdown. I somehow
thought you're dying in there, which is why I wondered what's going
on. But since you're dying in pm_ops->shutdown, that's a different
thing.

> I will try it, but then I wonder about things like system wide
> suspend/resume too. The drm encoder chain would need to reimplement the
> logic for system wide suspend/resume so that any PM ops attached to the
> msm device run in the correct order. Right now the bridge PM ops will
> run, the i2c bus PM ops will run, and then the msm PM ops will run.
> After this change, the msm PM ops will run, the bridge PM ops will run,
> and then the i2c bus PM ops will run. It feels like that could be a
> problem if we're suspending the DSI encoder while the bridge is still
> active.

Yup suspend/resume has the exact same problem as shutdown.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
