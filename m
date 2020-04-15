Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9931A9A4B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 12:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8357A6E955;
	Wed, 15 Apr 2020 10:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDF76E955
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:22:56 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id i22so2814192otp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZMC72XYSV8/CjwYnxH1jPP3zz6jucJPdc3uGx5+XGs=;
 b=P0GQJzq1xvbgKKYq7V1OQRbK/ioMcVvSLTty3yBKbQLCzv+w4eyNHApyYOSWxBQ5zu
 2G28/T/W85z0SUgeXf5BpX0JSexuqGcAspmpYP9i1QvtrrhWez8XmSW+VkEhCvCZJQM6
 VJaXr2eeuEV55j/YJq8vLMH3eRdCd9j+u9OPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZMC72XYSV8/CjwYnxH1jPP3zz6jucJPdc3uGx5+XGs=;
 b=dRrDA/1HKC9YkL6gGuiY6w+NjQpla/cDRv/c851oo16PDjLIjqRXOI6RZoHyEpVgu/
 jsl+VnxybkkOj4T3l5ZLqbyrc+pI+02s/4GrwUL38TZG+ayh/MbUC2+J1QLRJPoEuiID
 xPGlD/qMoxc4aUNDKWc4w722Kuo5yoFMrwbhJqTYiV9YFRoIm0rPQqiZrNG9MFXIGoUO
 G2f5K0MzzLDYfgSbYoApXkSs43uWY0fXk38Uly/USMUT8TOTKpLjDPzkbUPZGZdqr3XR
 3LQ841YLnncWeRyRICPwJzyRUDxBDktiPIvcWt8DB0pst1F7QDyeHM5CUMhnKXFjEKZs
 kmTg==
X-Gm-Message-State: AGi0PuZlwcv72uypGjdlge18fBeVrfKI0Hlgk6c8SXUytehdMnC5VM6h
 RF0PTlK+tXlfi6dzjQx+0k3QmBTcuyjodaWt39cBCg==
X-Google-Smtp-Source: APiQypKmQpU06cpGgnJVI29hQ29oJUxld3+ddwo8kusHZtPGZNw9eubXi/s5qJsydaTNallmu7M9bxk8RLVFWSxYYLQ=
X-Received: by 2002:a05:6830:1599:: with SMTP id
 i25mr13215517otr.188.1586946175428; 
 Wed, 15 Apr 2020 03:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
In-Reply-To: <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Apr 2020 12:22:44 +0200
Message-ID: <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
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

On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/15/20 11:52 AM, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 11:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi All,
> >>
> >> Somewhat long mail, so I've divided it into "chapters", sorry.
> >>
> >> 1. Back ground info
> >> -------------------
> >>
> >> First some quick background, some recent Lenovo models have
> >> a builtin privacy screen which can be turned on/off in software
> >> and the kernel recently has gotten support for this:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=110ea1d833ad291272d52e0a40a06157a3d9ba17
> >>
> >> We have been looking into adding support for this to GNOME,
> >> but the userspace API added by the above commit is very
> >> Thinkpad specific, and we would rather not rely on an
> >> userspace API which is specific to 1 series of laptops.
> >>
> >> When we started discussing this I had already seen some versions
> >> of Rajat's "drm/i915 Support for integrated privacy screen" series:
> >>
> >> https://patchwork.freedesktop.org/series/74650/
> >>
> >> Which adds support for integrated privacy screens
> >> as a drm-connector property. Anyone who has been involved
> >> in the backlight brightness control saga we have with
> >> the sysfs backlight class instantly knows/feels that
> >> this is the right way to handle this.
> >>
> >> So now we want to export the Thinkpad lcdshadow
> >> attribute as a drm-connector property.
> >>
> >>
> >> 2. Problem + Possible solutions
> >> -------------------------------
> >>
> >> The problem is that the code to get/set the lcdshadow
> >> setting and also the code to listen for firmware (hardcoded
> >> hotkeys) triggered state changes all lives inside the thinkpad_acpi
> >> driver; and to export the lcdshadow setting as a drm property
> >> we need to access that code (and it is too big to just copy
> >> over).
> >>
> >> One thing which makes this trickier is that all properties must
> >> be attached to the connector before it is registered, we cannot
> >> add it at a later time.
> >>
> >> I see 3 possible solutions here:
> >>
> >> i. Export some symbols from thinkpad_acpi and directly call these
> >> from drm_connector_create_standard_properties and other
> >> drm_connector functions if the thinkpad_acpi module is enabled.
> >> Note this should be done in the core drm_connector functions since
> >> the GPU might be one of i915 / amdgpu / nouveau. I believe that
> >> it is clear that this solution is not very elegant.
> >>
> >> A variant of this would be to have a separate helper module
> >> (probaly a few static inlines in a .h) which exports some hooks for
> >> i915 / amdgpu / nouveau to call this way we at least keep the
> >> ugliness out of the core and keep the module-dep on thinkpad_acpi
> >> limited to the i915 / amdgpu / nouveau modules. This might
> >> actually not be too bad, except that currently the thinkpad_acpi
> >> module refuses to load on non thinkpads...
> >>
> >>
> >> ii. Currently the "privacy-screen" property added by Rajat's
> >> patch-set is an enum with 2 possible values:
> >> "Enabled"
> >> "Disabled"
> >>
> >> We could add a third value "Not Available", which would be the
> >> default and then for internal panels always add the property
> >> so that we avoid the problem that detecting if the laptop has
> >> an internal privacy screen needs to be done before the connector
> >> is registered. Then we can add some hooks which allow an
> >> lcdshadow-driver to register itself against a connector later
> >> (which is non trivial wrt probe order, but lets ignore that for now).
> >>
> >>
> >> iii. We can add a generic framework to allow drivers outside
> >> of the drm-subsys to register something drm_property(ish) specifying
> >> a dev_name() and connector-name to which to attach the property
> >> when that connector gets created on that device.
> >>
> >> This requires the driver registering this property to be fully
> >> loaded before the connector gets registered.
> >
> > iv. What every SoC subsystem does:
> >
> > - lcdshadow drivers register drivers
> > - drm drivers look them up
> > - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> > the entire thing is assembled.
> >
> > That's what we're doing already for other standardized components like
> > drm_bridge or drm_panel, and I think that's also the right approach
> > for backlight and anything else like that. Hand-rolling our own
> > EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> > to real pain. Also, with EPROBE_DEFER we have one standard way of
> > building a driver from component, which spans subsystems and is also
> > the underlying magic that makes stuff like component.c work.
>
> On the SoCs we have devicetree telling us what components there
> are, so we can wait for them to show up. The only way to figure out
> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
> or duplicating a lot of code from thinkpad_acpi. Edit:
> also see below for a possible solution.

Yup it sucks. I think all we can do is have a small acpi match
function (which yes will duplicate some of the thinkpad_acpi driver
logic) to re-create that information and give us a "should we have a
lcdshadow driver for this $pci_device" answer.

This need for an in-kernel source of truth for "which backlight, if
any, do I need" is why the backlight stuff never got fixed. It's a
really hard problem, and doing the table flip and just letting
userspace deal with the mess at least avoids having to face the fact
that the kernel is totally failing here. It's made worse for backlight
because of 20 years of hacked up systems that "work", and we can't
regress any of them.

I really want to avoid that situation for anything new like lcdshadow.

> > Wrt the actual userspace interface, I think the drm core should handle
> > this as much as possible. Same way we let drm core handle a lot of the
> > atomic property stuff, to make sure things are standardized.
>
> Agreed.
>
>
> > So
> >
> > - add an lcdshadow pointer to struct drm_connector
> > - implement the property glue code in drm core completely, at least
> > for the read side
> > - for the write side we might want to have some drm wrappers drivers
> > can call to at the appropriate times to e.g. restore privacy screen
> > settings when the panel gets enabled. In case that's needed.
> >
> > Also one thing that the EPROBE_DEFER stuff forces us to handle
> > correctly is to track these depencies. That's the other nightmare in
> > backlight land, essentially you have no idea of knowing (in userspace)
> > whether the backlight driver you want is actually loaded, resulting in
> > lots of fun. The kernel is the only thing that can know, and for hw
> > that's built-in there's really no excuse to not know. So a model where
> > stuff gets assembled after drm_dev_register() is imo just plain buggy.
> >
> > This means that the lcdshadow subsystem needs to have some idea of
> > whether it needs a driver, so that it can correctly differentiate
> > between EPROBE_DEFER and ENOENT error cases. In the latter the driver
> > should continue loading ofc.
>
> Right, so how would the lcdshadow subsystem do this? The only way
> would be for it to say try and modprobe thinkpad_acpi from its
> core init function (if thinkpad_acpi is enabled).  IOW it is the usual
> x86 mess.  I guess we could have something like this in a theoretical
> to be added lcdshadow subsystem:
>
> /* Add comment explaining why we need this messy stuff here */
> const char * const shadow_providers[] = {
> #ifdef CONFIG_THINKPAD_ACPI_MODULE
>         "thinkpad_acpi",
> #endif
> #ifdef CONFIG_OTHER_MODULE
>         "other",
> #endif
>         NULL
> };
>
> int module_init(void)
> {
>         /* do actual setup of the ?class? */
>
>         for (i = 0; shadow_providers[i]; i++)
>                 request_module(shadow_providers[i]);
>
>         return 0;
> }

Hm I think explicitly loading drivers feels very much not device model
like. Don't these drivers auto-load, matching on acpi functions? I
guess if that doesn't exist, then we'd need to fix that one first :-/
In general no request_module please, that shouldn't be needed either.

The trouble with request_module is also that (afaiui) it doesn't
really work well with parallel module load and all that, for
EPROBE_DEFER to work we do need to be able to answer "should we have a
driver?" independently of whether that driver has loaded already or
not.

> And then simply have the function which gets a lcd_shadow provider
> provide -ENOENT if there are none.
>
> One problem here is that this will work for modules since
> the drm-core will depend on modules from the lcdshadow-core,
> so the lcdshadow-core module will get loaded first and will
> then try to load thinkpad_acpi, which will return with -ENODEV
> from its module_init on non ThinkPads. We could even put the
> request_module loop in some other init_once function so that
> things will also work when the lcdshadow-core is builtin.
>
> But how do we ensure that thinkpad_acpi will get to register
> its lcdshadow before say i915 gets probed if everything is builtin?

EPROBE_DEFER. Everyone hates it, but it does work. It's really kinda
neat magic. The only pain point is that you might need to wire
EPROBE_DEFER through a few layers in i915, but we do have a lot of
that in place already, plus we have solid error-injecting load error
tests in igt. So that part shouldn't be a big deal.

> I guess my SOFTDEP solution has the same issue though. Do you
> know has this is dealt with for kvmgt ?

kvmgt? What do you mean there? kvmgt is just a user of i915-gem, if
you enable it in the config (and module option too iirc) then it works
more like an additional uapi layer, similar to how we handle fbdev
emulation. So totally different scenario, since the main driver is
100% in control of the situation and controls the register/unregister
lifetime cycles completely. There's no indepedent part somewhere else
for kvmgt or fbdev emulation.

Or I'm totally misunderstanding what you mean with this example here.

Cheers, Daniel

>
> Regards,
>
> Hans
>
>
>
> >> 3. Picking a solution
> >> ---------------------
> >>
> >> i. is just ugly, full stop, but also very KISS which still makes
> >> it somewhat appealing. Also i. does not scale if we get other
> >> vendor specific interfaces for interacting with these
> >> privacy screens.
> >>
> >>
> >> ii. is ugly from an userspace API pov, if there is no
> >> "privacy-screen" then we really should not have the property at
> >> all rather then setting it to "Not Available". Still it might be
> >> an acceptable compromise I guess
> >>
> >>
> >> iii. is/was the one I liked, until I started looking at the
> >> drm_connector code and saw that all properties must be attached
> >> before registering the connector, bummer. Then this morning I
> >> remembered that the i915 driver has a similar issue with the
> >> gvt stuff / the kvmgt module. The kvmgt module must be loaded
> >> and fully initialized before the i915 driver loads. This has
> >> been solved with module softdeps.
> >>
> >> I think that we can do the same here having either the
> >> i915+nouveau+amdgpu drivers; or the drm-core have a softdep on
> >> thinkpad_acpi so that it can register the lcdshadow property
> >> with the to-be-written framework for externally managed props
> >> before the internal panels drm-connector gets created.
> >>
> >> This also allows the thinkpad_acpi module_init function to
> >> return -ENODEV on non Thinkpad devices, so that it will
> >> not take up memory, where as with i. we would always need to
> >> have it in memory.
> >>
> >> I'm currently leaning towards iii. combined with using
> >> MODULE_SOFTDEP("pre: thinkpad_acpi") to make sure the thinkpad_acpi
> >> driver can do its thing before the internal display connector gets
> >> created.
> >>
> >> Daniel (and others) does this (iii. + softdeps) sound like
> >> something which might be acceptable (I know it will also
> >> depend on the resulting code implementing this idea) ?
> >>
> >> Any other ideas / suggestions are appreciated here.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
