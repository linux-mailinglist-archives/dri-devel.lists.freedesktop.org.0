Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0737967C
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 19:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC276E8D6;
	Mon, 10 May 2021 17:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BAD6E8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 17:52:26 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so3650229oot.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=j1xfxTlB6kdvw4Qq6xxoQ5zEc5YpLfaQSChecCnRyDU=;
 b=P292ufd09w3DBDcmC8PvXAvF4oPfWZvc9j+O4JeOtt5XP6ykvMElAHyt7lawJnKVo7
 Llc+r0kk6pBPRaJ+r/xZc+XJpKXaYxYdodVx2EKRcL3a3/urZ4GrfCbSXNm9TueWF6Pf
 eUExHQo+rfTsNOLQaerPFRA00qvTKztE3CBBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=j1xfxTlB6kdvw4Qq6xxoQ5zEc5YpLfaQSChecCnRyDU=;
 b=SPxAYJyDKdlu/Hj7I/AKXTkp+J7vSVxVxVam/0GSSNs8nQ0cXstT75Zpt1GN/abrVu
 5NyIupMU25WLOOTkcgVgCrxQXZV/oEfc07wtweG6rbOrHz5U232bnyEZdqg43t3apVxv
 wAZOjS2S31HA3d1rnc5lHI4x/BFRUokbj5u3dxb3W2WYgGkdDMtEb+n/RR4pvptnRlRb
 mcEvFAtZKH1xg1VHUJQbglV8dnFRHGun42T2gzmiXGh5TVyZ+5HTE7cb0Ma7wJ2wewG1
 2hHASgJz+raFSB9HWyosJZhwAtCmVec3IIgw5iVkk5ukwoPfm9hT49Oj5O0gch5yhEnt
 1Qug==
X-Gm-Message-State: AOAM5314svw6cyNNaqGW6nqS4gtzyowg80Nn+AkiyCw/ZaRNeguMRVXz
 Q9B+tNpEKpCZs/y/pxm3r8UiNZKOOvMv1e++4ZamEg==
X-Google-Smtp-Source: ABdhPJw1IDaRdP6RASMoXX2NdYKzZNWDeGssQdVmIuu7WQlsq4z76pAlpb4lgd0DVAWGxaxUjej01HSgXagSojWzERI=
X-Received: by 2002:a4a:1703:: with SMTP id 3mr19977335ooe.92.1620669145625;
 Mon, 10 May 2021 10:52:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 10:52:25 -0700
MIME-Version: 1.0
In-Reply-To: <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 10 May 2021 10:52:25 -0700
Message-ID: <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Daniel Vetter <daniel@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-05-10 09:05:21)
> On Sat, May 08, 2021 at 12:41:18AM -0700, Stephen Boyd wrote:
> > The device lists are poorly ordered when the component device code is
> > used. This is because component_master_add_with_match() returns 0
> > regardless of component devices calling component_add() first. It can
> > really only fail if an allocation fails, in which case everything is
> > going bad and we're out of memory. The host device (called master_dev in
> > the code), can succeed at probe and be put on the device lists before
> > any of the component devices are probed and put on the lists.
> >
> > Within the component device framework this usually isn't that bad
> > because the real driver work is done at bind time via
> > component{,master}_ops::bind(). It becomes a problem when the driver
> > core, or host driver, wants to operate on the component device outside
> > of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> > driver core doesn't understand the relationship between the host device
> > and the component devices and could possibly try to operate on component
> > devices when they're already removed from the system or shut down.
> >
> > Normally, device links or probe defer would reorder the lists and put
> > devices that depend on other devices in the lists at the correct
> > location, but with component devices this doesn't happen because this
> > information isn't expressed anywhere. Drivers simply succeed at
> > registering their component or host with the component framework and
> > wait for their bind() callback to be called once the other components
> > are ready. We could make various device links between 'master_dev' and
> > 'component->dev' but it's not necessary. Let's simply move the hosting
> > device to the end of the device lists when the component device fully
> > binds. This way we know that all components are present and have probed
> > properly and now the host device has really probed so it's safe to
> > assume the host driver ops can operate on any component device.
> >
> > This fixes the msm display driver shutdown path when the DSI controller
> > is connected to a DSI bridge that is controlled via i2c. In this case,
> > the msm display driver wants to tear down the display pipeline on
> > shutdown at msm_pdev_shutdown() by calling drm_atomic_helper_shutdown(),
> > and it can't do that unless the whole display chain is still probed and
> > active in the system. When a display bridge is on i2c, the i2c device
> > for the bridge will be created whenever the i2c controller probes, which
> > could be before or after the msm display driver probes. If the i2c
> > controller probes after the display driver, then the i2c controller will
> > be shutdown before the display controller during system wide shutdown
> > and thus i2c transactions will stop working before the display pipeline
> > is shut down. This means we'll have the display bridge trying to access
> > an i2c bus that's shut down because drm_atomic_helper_shutdown() is
> > trying to disable the bridge after the bridge is off.
> >
> > Moving the host device to the end of the lists at bind time moves the
> > drm_atomic_helper_shutdown() call before the i2c bus is shutdown.
> > This fixes the immediate problem, but we could improve it a bit by
> > modeling device links from the component devices to the host device
> > indicating that they supply something, although it is slightly different
> > because the consumer doesn't need the suppliers to probe to succeed.
> >
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Entirely aside, but an s/master/aggregate/ or similar over the entire
> component.c codebase would help a pile in making it easier to understand
> which part does what. Or at least I'm always terribly confused about which
> bind binds what and all that, so maybe an additional review whether we
> have a clear split into aggregate and individual components after that
> initial fix is needed.

Agreed.

>
> On the actual topic: I agree there's a problem here, but I'm honestly not
> sure how it should be fixed. That's way over my understanding of all the
> device probe and pm interactions. Of which there are plenty.
>
> One question I have: Why is the bridge component driver not correctly
> ordered wrt the i2c driver it needs? The idea is that the aggregate driver
> doesn't access any hw itself, but entirely relies on all its components.
> So as long as all the component drivers are sorted correctly in the device
> list, things /should/ work. And as soon as we drop out a single component,
> the aggregate gets unbound (and then does all the
> drm_atomic_helper_shutdown and all the other drm teardown). So is the bug
> perhaps that msm does the drm teardown in the wrong callback?

I see my explanation of the problem wasn't sufficient :|

The bridge driver is not a component device. It is connected to the
aggregate device via the DSI device, where the DSI device is a component
device. The i2c bus/controller must probe before the i2c bridge probes,
so the device list is already ordered correctly for those two devices
(i2c controller and i2c bridge). The problem is the aggregate device
doesn't know that the bridge is part of the display pipeline/encoder
chain.

I thought that this design was intentional. Bridge devices can be mixed
and matched with display drivers because they're (always?) off the SoC
and so the aggregate device can't know which components it needs. I see
that the msm driver has some logic to traverse from the display
controller to the display phy, like DSI or HDMI, but it doesn't go
beyond that.

The crucially important part is that the DSI encoder will fail probe
until the end of the encoder chain is probed, see
msm_dsi_host_register() and how it checks for a panel and a bridge.

The order of operations is like this

 1. msm driver probes, creates aggregate device driver
 2. i2c controller probes, creates i2c bus
 3. i2c bridge probes, creates drm bridge and adds to drm
 4. rest of component devices probe and aggregate device is bound

The device list now has msm, i2c, bridge in that order. When we go to
system wide shutdown the bridge is shutdown first, then the i2c bus, and
then msm calls drm_atomic_helper_shutdown(). That tries to call the i2c
bridge ops because it's attached to the end of the DSI encoder and
things don't go well because i2c is gone. This patch fixes the order of
the list so that msm is moved on the device list after all the
components that make up the aggregate device have probed. This only
works to move the aggregate device after the i2c bridge because the
msm_dsi_host_register() function won't return success until the bridge
device is probed.

It's an interesting idea to trigger shutdown when the component device
is unbound. Are you suggesting that the i2c bridge device have a
'shutdown' callback, that essentially removes the bridge from the
encoder chain via mipi_dsi_detach() and then drm_bridge_remove()?
Presumably that would somehow tell the DSI encoder that it should stop
trying to use the i2c bridge and then drm_atomic_helper_shutdown()
wouldn't try to traverse beyond the DSI to shut things down.

I will try it, but then I wonder about things like system wide
suspend/resume too. The drm encoder chain would need to reimplement the
logic for system wide suspend/resume so that any PM ops attached to the
msm device run in the correct order. Right now the bridge PM ops will
run, the i2c bus PM ops will run, and then the msm PM ops will run.
After this change, the msm PM ops will run, the bridge PM ops will run,
and then the i2c bus PM ops will run. It feels like that could be a
problem if we're suspending the DSI encoder while the bridge is still
active.
