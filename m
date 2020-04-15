Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CA1A9EB7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8046E9B5;
	Wed, 15 Apr 2020 12:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BB36E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:01:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f13so18764618wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Dc8oqV9uLUqauSSYcvX4OHx8txOdkWXCCEtEPrADhZM=;
 b=G/yepR960zrXjbotJLCW5FPAMBTedsDdSB/2uSR05hoq7u3eX1nhdBZTtU32+kVnyP
 8q8dfgkMB9psy2j1ERabTktjzG6hnZYANQbyO7i+/JZE02emSzl+bsua+KpNu/5ow8OQ
 kHRdU4fQobtOQ9zRGBdp+8J2ujGa6x5x3+je0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dc8oqV9uLUqauSSYcvX4OHx8txOdkWXCCEtEPrADhZM=;
 b=Scq904hMocp9ovHJ3GlJFm8nt1Ghg97X2o3MnZx1LivRi1xn99FZgaOS7uMcopGB2h
 9QcAgI4RW3ji3gnZoMKjQpj6SQf1DO3I0Mlz0R3ydMywWcENRV2nejtTg/zSJl1qwb7c
 fna2bXMstb3d9rbKwToO23grtulW4yUupZC8pnYZBMHrfeWS3e9mxXINOnYzV76Dxjvz
 TBDL797ouFC0cB/rC9zTPdOv30AHpXRdtSxKh+w2yMvB7TDbs47q9VAv+g4l3pfF/6t+
 W6Eai6UOatp3LweGL0kju63zsQTPTFfUwG6IvMK/F/nyWoYceT4ITByz3Yp8Oe57WDPX
 D9Wg==
X-Gm-Message-State: AGi0PubmLiXhKWFO2lQDWTnnGmvNEjxQbdrA8Bu3OCIFEzURiBaH1mAH
 taevf5vo0bkCwDLgEMz6XkY+RA==
X-Google-Smtp-Source: APiQypKIGF32UZJoNFvfpxHB79Ns9/6k3dEg+MAlwd37gTEHRyrnhoEPyNsokg6weIq3xcRbCZ/u6Q==
X-Received: by 2002:adf:ca0c:: with SMTP id o12mr7993304wrh.306.1586952098409; 
 Wed, 15 Apr 2020 05:01:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w3sm4484057wrc.18.2020.04.15.05.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 05:01:37 -0700 (PDT)
Date: Wed, 15 Apr 2020 14:01:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200415120135.GB3456981@phenom.ffwll.local>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/15/20 12:22 PM, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > 
> > > Hi,
> > > 
> > > On 4/15/20 11:52 AM, Daniel Vetter wrote:
> 
> <snip>
> 
> > > > iv. What every SoC subsystem does:
> > > > 
> > > > - lcdshadow drivers register drivers
> > > > - drm drivers look them up
> > > > - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> > > > the entire thing is assembled.
> > > > 
> > > > That's what we're doing already for other standardized components like
> > > > drm_bridge or drm_panel, and I think that's also the right approach
> > > > for backlight and anything else like that. Hand-rolling our own
> > > > EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> > > > to real pain. Also, with EPROBE_DEFER we have one standard way of
> > > > building a driver from component, which spans subsystems and is also
> > > > the underlying magic that makes stuff like component.c work.
> > > 
> > > On the SoCs we have devicetree telling us what components there
> > > are, so we can wait for them to show up. The only way to figure out
> > > if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
> > > or duplicating a lot of code from thinkpad_acpi. Edit:
> > > also see below for a possible solution.
> > 
> > Yup it sucks. I think all we can do is have a small acpi match
> > function (which yes will duplicate some of the thinkpad_acpi driver
> > logic) to re-create that information and give us a "should we have a
> > lcdshadow driver for this $pci_device" answer.
> 
> Ok, so questions about this solution:
> 
> 1. Where should that match-function live ?
> 
> 2. An acpi_thinkpad derived match-function will only be able to
>    answer if there is an lcdshadow device/driver for the internal
>    panel. It will not be able to tie this info to a certain PCI
>    device. My plan is to pass NULL as dev_name when registering
>    the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
>    skip device-name matching (consider everything a match) for
>    lcdshadow-devices registered with NULL as dev_name.
> 
>    So I guess in this case the mini match function should just
>    ignore the passed in device?

Yeah I think we can't really avoid that. I also expect that we'll need
ACPI and dt versions of this, and driver needs to know which one to call.
Since at least in a dt world the driver knows exactly for which dt node it
needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
more strict.

For the acpi version I'm not even sure we can do more than provide the
struct device * pointer of the gpu. I think if we ever get more than 1
lcdshadow driver on acpi systems we can add more stuff later on, for now
I'd just leave that out.

So maybe

acpi_lcdshadow_get(struct device *dev);

of_lcdshadow_get(struct device_node *np);

And with maybe a future plan to add some kind of enum or whatever to
acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.

We might also want a low-level lcdshadow_get() which only returns ENOENT
when the driver isn't there, and which leaves "do we really need one?" to
higher levels to answer.

I'd also lean towards putting lcdshadow headers/interfaces into
drivers/gpu, similar to how backlight (well that one is in drivers/video
for historical reasons) with driver implementations all over.

> > This need for an in-kernel source of truth for "which backlight, if
> > any, do I need" is why the backlight stuff never got fixed. It's a
> > really hard problem, and doing the table flip and just letting
> > userspace deal with the mess at least avoids having to face the fact
> > that the kernel is totally failing here. It's made worse for backlight
> > because of 20 years of hacked up systems that "work", and we can't
> > regress any of them.
> 
> Right, as discussed during last plumbers Christian Kellner and I
> have written a plan to slowly resolve this. Unfortunately Christian
> has not found the time to work on this yet.

Yeah, this is hopefully going to be really nice for acpi systems. DT stuff
is hopefully simpler to fix since at least the discovery part is already
all there, just not formalized.

Also given that this has been hurting for years I wouldn't worry about a
few months here and there.
-Daniel

> > I really want to avoid that situation for anything new like lcdshadow.
> 
> Ack.
> 
> > > > Wrt the actual userspace interface, I think the drm core should handle
> > > > this as much as possible. Same way we let drm core handle a lot of the
> > > > atomic property stuff, to make sure things are standardized.
> > > 
> > > Agreed.
> > > 
> > > 
> > > > So
> > > > 
> > > > - add an lcdshadow pointer to struct drm_connector
> > > > - implement the property glue code in drm core completely, at least
> > > > for the read side
> > > > - for the write side we might want to have some drm wrappers drivers
> > > > can call to at the appropriate times to e.g. restore privacy screen
> > > > settings when the panel gets enabled. In case that's needed.
> > > > 
> > > > Also one thing that the EPROBE_DEFER stuff forces us to handle
> > > > correctly is to track these depencies. That's the other nightmare in
> > > > backlight land, essentially you have no idea of knowing (in userspace)
> > > > whether the backlight driver you want is actually loaded, resulting in
> > > > lots of fun. The kernel is the only thing that can know, and for hw
> > > > that's built-in there's really no excuse to not know. So a model where
> > > > stuff gets assembled after drm_dev_register() is imo just plain buggy.
> > > > 
> > > > This means that the lcdshadow subsystem needs to have some idea of
> > > > whether it needs a driver, so that it can correctly differentiate
> > > > between EPROBE_DEFER and ENOENT error cases. In the latter the driver
> > > > should continue loading ofc.
> > > 
> > > Right, so how would the lcdshadow subsystem do this? The only way
> > > would be for it to say try and modprobe thinkpad_acpi from its
> > > core init function (if thinkpad_acpi is enabled).  IOW it is the usual
> > > x86 mess.  I guess we could have something like this in a theoretical
> > > to be added lcdshadow subsystem:
> > > 
> > > /* Add comment explaining why we need this messy stuff here */
> > > const char * const shadow_providers[] = {
> > > #ifdef CONFIG_THINKPAD_ACPI_MODULE
> > >          "thinkpad_acpi",
> > > #endif
> > > #ifdef CONFIG_OTHER_MODULE
> > >          "other",
> > > #endif
> > >          NULL
> > > };
> > > 
> > > int module_init(void)
> > > {
> > >          /* do actual setup of the ?class? */
> > > 
> > >          for (i = 0; shadow_providers[i]; i++)
> > >                  request_module(shadow_providers[i]);
> > > 
> > >          return 0;
> > > }
> > 
> > Hm I think explicitly loading drivers feels very much not device model
> > like. Don't these drivers auto-load, matching on acpi functions?
> 
> thinkpad_acpi does autoload based on a number of ACPI device-ids,
> the idea behind the above request_module is to avoid the need
> to have the acpi-match function you mentioned above.
> 
> Basically what would happen is e.g. :
> 
> 1. i915 loads, calls lcdshadow_get(dev, "eDP-1");
> 2. if this is the first lcdshadow_get() call then
>    the lcdshadow core will do the request_module calls,
>    allowing any of these modules to get loaded + probed and
>    call e.g. lcdshadow_register(&mylcdshadowdev, <gfx-adapter-dev-name>, "eDP-1");
> 3. After the request modules the lcdshadow_get() will walk over
>    the list of registered devices, including the ones just registered
>    by the request_module calls and then hopefully find a match
> 
> So by doing the request-module calls before checking for
> a matching lcdshadow dev, we avoid the need of having some of
> the knowledge currently abstracted away in the thinkpad_acpi driver
> duplicated inside the drm code somewhere.
> 
> > I guess if that doesn't exist, then we'd need to fix that one first :-/
> > In general no request_module please, that shouldn't be needed either.
> > 
> > The trouble with request_module is also that (afaiui) it doesn't
> > really work well with parallel module load and all that, for
> > EPROBE_DEFER to work we do need to be able to answer "should we have a
> > driver?" independently of whether that driver has loaded already or
> > not.
> 
> The idea here is to avoid using EPROBE_DEFER (on x86 at least)
> and either directly return the lcdshadow_dev or ENOENT. Also
> see below.
> 
> > > And then simply have the function which gets a lcd_shadow provider
> > > provide -ENOENT if there are none.
> > > 
> > > One problem here is that this will work for modules since
> > > the drm-core will depend on modules from the lcdshadow-core,
> > > so the lcdshadow-core module will get loaded first and will
> > > then try to load thinkpad_acpi, which will return with -ENODEV
> > > from its module_init on non ThinkPads. We could even put the
> > > request_module loop in some other init_once function so that
> > > things will also work when the lcdshadow-core is builtin.
> > > 
> > > But how do we ensure that thinkpad_acpi will get to register
> > > its lcdshadow before say i915 gets probed if everything is builtin?
> > 
> > EPROBE_DEFER. Everyone hates it, but it does work. It's really kinda
> > neat magic. The only pain point is that you might need to wire
> > EPROBE_DEFER through a few layers in i915, but we do have a lot of
> > that in place already,
> 
> AFAIK we do not have any EPROBE_DEFER handling in i915 in place at
> all! There are _0_ checks for an EPROBE_DEFER return in all of the i915
> code. We actually have a similar problem with backlight control when
> controlled by an external PWM controller such as the PWM controller
> of the Crystal Cove PMIC found on some BYT/CHT drivers or the
> PWM controller found in the LPSS bits of BYT/CHT SoCs.
> 
> Since again we lack a clear hardware model like device tree,
> we use lookup tables for the (external) PWM controllers on x86,
> see the pwm_add_table calls in drivers/acpi/acpi_lpss.c
> and drivers/mfd/intel_soc_pmic_core.c and the pwm_get call
> in the i915 code simply continues on its happy way without
> backlight control if the pwm_get fails, rather then dealing
> with -EPROBE_DEFER. I looked into untangling this back then
> but the i915 code really is not ready to unroll everything
> it has done already once we are probing connectors.
> 
> I actually "fixed" the PWM issue by:
> 
> 1. Adding a module-name field to the PWM lookup table
> registered by the pwm_add_table calls.
> 
> 2. Have the PWM core call request_module on that module_name
> if it finds a match in the registered lookup_table (which
> get registered early on), but the matching pwm_dev has not
> been registered yet.
> 
> So I agree with you that ideally i915 would handle EPROBE_DEFER
> but atm AFAIK it really does not handle that at all and
> we are pretty far away from getting to a point where it
> does handle that.
> 
> Assuming we are going to add some device/model specific
> lcdshadow knowledge inside the lcdshadow core as you
> suggested with your "small acpi match function" above,
> we could do something similar to what the vga_switcheroo
> code is doing for this and have a lcdshadow_defer_probe()
> helper and call that really early in i915_pci_probe(),
> which currently already has this for the vgaswitcheroo case:
> 
>         if (vga_switcheroo_client_probe_defer(pdev))
>                 return -EPROBE_DEFER;
> 
> The reason why I suggested the request_module approach
> is because as said it will allow lcdshadow_get()
> to return either a device or -ENOENT and never -EPROBE_DEFER
> and currently none of the i915 code, nor the nouveau code
> nor the amdgpu code has any EPROBE_DEFER checks. They all
> assume that once there probe function is called they can
> continue on forward without unrolling and exiting from
> probe with EPROBE_DEFER ever. I agree that that is somewhat
> of a bad assumption now a days but fixing that is going to
> be massive undertakig and I'm afraid that trying to deal
> with it will lead to many many regressions.
> 
> So I would rather work around it by using request_module.
> 
> > plus we have solid error-injecting load error
> > tests in igt. So that part shouldn't be a big deal.
> > 
> > > I guess my SOFTDEP solution has the same issue though. Do you
> > > know has this is dealt with for kvmgt ?
> > 
> > kvmgt? What do you mean there? kvmgt is just a user of i915-gem, if
> > you enable it in the config (and module option too iirc) then it works
> > more like an additional uapi layer, similar to how we handle fbdev
> > emulation. So totally different scenario, since the main driver is
> > 100% in control of the situation and controls the register/unregister
> > lifetime cycles completely. There's no indepedent part somewhere else
> > for kvmgt or fbdev emulation.
> > 
> > Or I'm totally misunderstanding what you mean with this example here.
> 
> The i915 driver used to have a:
> 
> MODULE_SOFTDEP("pre: kvmgt")
> 
> But it seems that that has been replaced with some mechanism
> or maybe the need for kvmgt to be loaded first has been removed/
> 
> Regards,
> 
> Hans
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
