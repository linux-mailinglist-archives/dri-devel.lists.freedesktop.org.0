Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4D1A9988
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C086E0A5;
	Wed, 15 Apr 2020 09:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5063F6E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:52:33 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id j26so2578733ots.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YFJmjQNiAOx0RBp8NEu7Ryp5DJXdXDphNynwLCCto3Q=;
 b=IwQs1HsggPQ332o814hc6Qi7Fg8NKTgCxF3Px2eT0IAsFDMhUwzB5CxCDFZGTfCuE0
 YGlhjoTSIVb0TnkhuSBwIK2KQ6tamzCRnwrCPbWk+ZPNnRap/RcMV0Tc95XPmEm279ew
 7KX1P7A0Zy1LepXABOMGq0IJ1Mur5J3oh4VEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFJmjQNiAOx0RBp8NEu7Ryp5DJXdXDphNynwLCCto3Q=;
 b=lODTMGAmvLEHtUs5wHQpJkKtzajhMBl/pq89PHSsphWvr9kzQ6K6r2Q0hkN7jLvjyE
 1/VVBHvQVTRHX5MsGOUwVHZxsuAml0Pv5BTkdMhAnjb/Nf1IoBidFiCp3Eg25xBlU1H9
 UmndtqtsJfdZQIAzjRdiDFFdKBQ3oyp/aTRu5s5Y6ZqOHYA5GXyNZL/ZiCXt/R1QFrXx
 S736yUYcd6L73VBLyPs+eVOom/F8s2cDNa/USxJoCetEW1irfN+89s55u9kRKY4kL4wK
 pPR6CH5YsjegaHMlgy7EBfJj5BCdjdSYc9adcOe+KP8qbJz69k0CWUoW9mhICht7P8Ll
 3JPw==
X-Gm-Message-State: AGi0PuasXmq5l1NWC65CH7YZWiMyxrCVocX/2ct31viRxcZdosE4371F
 E8zfTZy4K1RXLgYRYebSqRQVaB75A96PVCv8HM7NBg==
X-Google-Smtp-Source: APiQypJ3+fV995u8H1CH3H4Yh2ZDIHidigW5xA28lgc3vZu7pnL/76SmvJCcDMzmEYv3XK+6v7t4rsJW6QAc1WdcWHQ=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr22990833ota.281.1586944352527; 
 Wed, 15 Apr 2020 02:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
In-Reply-To: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Apr 2020 11:52:21 +0200
Message-ID: <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Somewhat long mail, so I've divided it into "chapters", sorry.
>
> 1. Back ground info
> -------------------
>
> First some quick background, some recent Lenovo models have
> a builtin privacy screen which can be turned on/off in software
> and the kernel recently has gotten support for this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=110ea1d833ad291272d52e0a40a06157a3d9ba17
>
> We have been looking into adding support for this to GNOME,
> but the userspace API added by the above commit is very
> Thinkpad specific, and we would rather not rely on an
> userspace API which is specific to 1 series of laptops.
>
> When we started discussing this I had already seen some versions
> of Rajat's "drm/i915 Support for integrated privacy screen" series:
>
> https://patchwork.freedesktop.org/series/74650/
>
> Which adds support for integrated privacy screens
> as a drm-connector property. Anyone who has been involved
> in the backlight brightness control saga we have with
> the sysfs backlight class instantly knows/feels that
> this is the right way to handle this.
>
> So now we want to export the Thinkpad lcdshadow
> attribute as a drm-connector property.
>
>
> 2. Problem + Possible solutions
> -------------------------------
>
> The problem is that the code to get/set the lcdshadow
> setting and also the code to listen for firmware (hardcoded
> hotkeys) triggered state changes all lives inside the thinkpad_acpi
> driver; and to export the lcdshadow setting as a drm property
> we need to access that code (and it is too big to just copy
> over).
>
> One thing which makes this trickier is that all properties must
> be attached to the connector before it is registered, we cannot
> add it at a later time.
>
> I see 3 possible solutions here:
>
> i. Export some symbols from thinkpad_acpi and directly call these
> from drm_connector_create_standard_properties and other
> drm_connector functions if the thinkpad_acpi module is enabled.
> Note this should be done in the core drm_connector functions since
> the GPU might be one of i915 / amdgpu / nouveau. I believe that
> it is clear that this solution is not very elegant.
>
> A variant of this would be to have a separate helper module
> (probaly a few static inlines in a .h) which exports some hooks for
> i915 / amdgpu / nouveau to call this way we at least keep the
> ugliness out of the core and keep the module-dep on thinkpad_acpi
> limited to the i915 / amdgpu / nouveau modules. This might
> actually not be too bad, except that currently the thinkpad_acpi
> module refuses to load on non thinkpads...
>
>
> ii. Currently the "privacy-screen" property added by Rajat's
> patch-set is an enum with 2 possible values:
> "Enabled"
> "Disabled"
>
> We could add a third value "Not Available", which would be the
> default and then for internal panels always add the property
> so that we avoid the problem that detecting if the laptop has
> an internal privacy screen needs to be done before the connector
> is registered. Then we can add some hooks which allow an
> lcdshadow-driver to register itself against a connector later
> (which is non trivial wrt probe order, but lets ignore that for now).
>
>
> iii. We can add a generic framework to allow drivers outside
> of the drm-subsys to register something drm_property(ish) specifying
> a dev_name() and connector-name to which to attach the property
> when that connector gets created on that device.
>
> This requires the driver registering this property to be fully
> loaded before the connector gets registered.

iv. What every SoC subsystem does:

- lcdshadow drivers register drivers
- drm drivers look them up
- if stuff isn't there yet, we delay loading with EPROBE_DEFER until
the entire thing is assembled.

That's what we're doing already for other standardized components like
drm_bridge or drm_panel, and I think that's also the right approach
for backlight and anything else like that. Hand-rolling our own
EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
to real pain. Also, with EPROBE_DEFER we have one standard way of
building a driver from component, which spans subsystems and is also
the underlying magic that makes stuff like component.c work.

Wrt the actual userspace interface, I think the drm core should handle
this as much as possible. Same way we let drm core handle a lot of the
atomic property stuff, to make sure things are standardized. So

- add an lcdshadow pointer to struct drm_connector
- implement the property glue code in drm core completely, at least
for the read side
- for the write side we might want to have some drm wrappers drivers
can call to at the appropriate times to e.g. restore privacy screen
settings when the panel gets enabled. In case that's needed.

Also one thing that the EPROBE_DEFER stuff forces us to handle
correctly is to track these depencies. That's the other nightmare in
backlight land, essentially you have no idea of knowing (in userspace)
whether the backlight driver you want is actually loaded, resulting in
lots of fun. The kernel is the only thing that can know, and for hw
that's built-in there's really no excuse to not know. So a model where
stuff gets assembled after drm_dev_register() is imo just plain buggy.

This means that the lcdshadow subsystem needs to have some idea of
whether it needs a driver, so that it can correctly differentiate
between EPROBE_DEFER and ENOENT error cases. In the latter the driver
should continue loading ofc.

Cheers, Daniel

> 3. Picking a solution
> ---------------------
>
> i. is just ugly, full stop, but also very KISS which still makes
> it somewhat appealing. Also i. does not scale if we get other
> vendor specific interfaces for interacting with these
> privacy screens.
>
>
> ii. is ugly from an userspace API pov, if there is no
> "privacy-screen" then we really should not have the property at
> all rather then setting it to "Not Available". Still it might be
> an acceptable compromise I guess
>
>
> iii. is/was the one I liked, until I started looking at the
> drm_connector code and saw that all properties must be attached
> before registering the connector, bummer. Then this morning I
> remembered that the i915 driver has a similar issue with the
> gvt stuff / the kvmgt module. The kvmgt module must be loaded
> and fully initialized before the i915 driver loads. This has
> been solved with module softdeps.
>
> I think that we can do the same here having either the
> i915+nouveau+amdgpu drivers; or the drm-core have a softdep on
> thinkpad_acpi so that it can register the lcdshadow property
> with the to-be-written framework for externally managed props
> before the internal panels drm-connector gets created.
>
> This also allows the thinkpad_acpi module_init function to
> return -ENODEV on non Thinkpad devices, so that it will
> not take up memory, where as with i. we would always need to
> have it in memory.
>
> I'm currently leaning towards iii. combined with using
> MODULE_SOFTDEP("pre: thinkpad_acpi") to make sure the thinkpad_acpi
> driver can do its thing before the internal display connector gets
> created.
>
> Daniel (and others) does this (iii. + softdeps) sound like
> something which might be acceptable (I know it will also
> depend on the resulting code implementing this idea) ?
>
> Any other ideas / suggestions are appreciated here.
>
> Regards,
>
> Hans
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
