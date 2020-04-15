Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108F1AB0B3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 20:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3014D882B8;
	Wed, 15 Apr 2020 18:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2BA882B8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:29:17 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id j16so14339663oih.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2VTy/0itM0hRO75LOsUpTVQ0Y7sUfyd7Z9348kSL5o=;
 b=Z2djdCSmL7vZvTxpV7R3/JwvN42KDy69p6ryO9lgYOipz58d7AsWzgKxniMi0GbrXJ
 GpG4MFWtn2GVJFa5dJiDajYE9OX1EL3CRizPsTI/2e3WRNgVUyLHPCr1Q/CiG1yS11TF
 /M/2L2nixpyTq11nXo/mRD5X3w71uCyqayIHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2VTy/0itM0hRO75LOsUpTVQ0Y7sUfyd7Z9348kSL5o=;
 b=VV71IPW4UQXDxgUzAeEAUP99vcBSHPblgt5jD6b6pBk0iHkQnOyDwTB+iyzSzum4an
 c4ze9cfaH7KCZfudis1Toydp5ERcZFHvK+LZ5KHanKxK9lv96KVU7ZUFsRQJ02KK+Sdy
 I8HrydlD9buqCyKXesnotNNm3YJr49X5dRLKc2WHQDeHF4V84g5j02dRt9wIhAQ0qGLj
 SzvA8d+xNiRsDE+TMbqMd/y/MqTe1EOtX0MylRkSAzBMfWenGBe+KBcd/1E1Y1nKy5R+
 Fk1+X2MA3UoQa/tEQaALFNc4FAKhF/2k/jWCKFrgMe6KMfaL7+tEAQLYEQaojEHoWh11
 HL9Q==
X-Gm-Message-State: AGi0PuYbKrEZAHMldH8MROGWJmXuOFvxexDwPAkdaz+gTPuWt6V9KbHz
 3cZJ1RFjB2iJuE0PLdY8Qg8RsIDjgHfLYF0cevYUxw==
X-Google-Smtp-Source: APiQypI4AgyrTfooufpKlvRmumjLohhCoGt4hgBOKDTs1oA2RGCSomp0zuWXunOgZLWdrSwik2ixryveZOj4k6o7eGU=
X-Received: by 2002:aca:b20a:: with SMTP id b10mr378741oif.101.1586975357114; 
 Wed, 15 Apr 2020 11:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
 <20200415120135.GB3456981@phenom.ffwll.local>
 <794191aa-e92d-d44c-f4ff-72fd6c9bf0e7@redhat.com>
 <20200415175423.GJ3456981@phenom.ffwll.local>
 <58012f16-1fce-122b-3818-b18d421ed87e@redhat.com>
In-Reply-To: <58012f16-1fce-122b-3818-b18d421ed87e@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Apr 2020 20:29:05 +0200
Message-ID: <CAKMK7uFcvcMopZPyj2P5RDr+TgVC5LCwdccM6+XAPenP55QKUQ@mail.gmail.com>
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

On Wed, Apr 15, 2020 at 8:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/15/20 7:54 PM, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 03:02:53PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 4/15/20 2:01 PM, Daniel Vetter wrote:
> >>> On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 4/15/20 12:22 PM, Daniel Vetter wrote:
> >>>>> On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 4/15/20 11:52 AM, Daniel Vetter wrote:
> >>>>
> >>>> <snip>
> >>>>
> >>>>>>> iv. What every SoC subsystem does:
> >>>>>>>
> >>>>>>> - lcdshadow drivers register drivers
> >>>>>>> - drm drivers look them up
> >>>>>>> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> >>>>>>> the entire thing is assembled.
> >>>>>>>
> >>>>>>> That's what we're doing already for other standardized components like
> >>>>>>> drm_bridge or drm_panel, and I think that's also the right approach
> >>>>>>> for backlight and anything else like that. Hand-rolling our own
> >>>>>>> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> >>>>>>> to real pain. Also, with EPROBE_DEFER we have one standard way of
> >>>>>>> building a driver from component, which spans subsystems and is also
> >>>>>>> the underlying magic that makes stuff like component.c work.
> >>>>>>
> >>>>>> On the SoCs we have devicetree telling us what components there
> >>>>>> are, so we can wait for them to show up. The only way to figure out
> >>>>>> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
> >>>>>> or duplicating a lot of code from thinkpad_acpi. Edit:
> >>>>>> also see below for a possible solution.
> >>>>>
> >>>>> Yup it sucks. I think all we can do is have a small acpi match
> >>>>> function (which yes will duplicate some of the thinkpad_acpi driver
> >>>>> logic) to re-create that information and give us a "should we have a
> >>>>> lcdshadow driver for this $pci_device" answer.
> >>>>
> >>>> Ok, so questions about this solution:
> >>>>
> >>>> 1. Where should that match-function live ?
> >>>>
> >>>> 2. An acpi_thinkpad derived match-function will only be able to
> >>>>      answer if there is an lcdshadow device/driver for the internal
> >>>>      panel. It will not be able to tie this info to a certain PCI
> >>>>      device. My plan is to pass NULL as dev_name when registering
> >>>>      the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
> >>>>      skip device-name matching (consider everything a match) for
> >>>>      lcdshadow-devices registered with NULL as dev_name.
> >>>>
> >>>>      So I guess in this case the mini match function should just
> >>>>      ignore the passed in device?
> >>>
> >>> Yeah I think we can't really avoid that. I also expect that we'll need
> >>> ACPI and dt versions of this, and driver needs to know which one to call.
> >>> Since at least in a dt world the driver knows exactly for which dt node it
> >>> needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
> >>> more strict.
> >>>
> >>> For the acpi version I'm not even sure we can do more than provide the
> >>> struct device * pointer of the gpu. I think if we ever get more than 1
> >>> lcdshadow driver on acpi systems we can add more stuff later on, for now
> >>> I'd just leave that out.
> >>>
> >>> So maybe
> >>>
> >>> acpi_lcdshadow_get(struct device *dev);
> >>>
> >>> of_lcdshadow_get(struct device_node *np);
> >>>
> >>> And with maybe a future plan to add some kind of enum or whatever to
> >>> acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
> >>> an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.
> >>
> >> Ok, note I plan to only implement the acpi version for now, I do
> >> expect some non ACPI/x86 devices to show up with his feature
> >> eventually but I believe it is best to implement this once
> >> those actually show up. Esp. since this will also involve adding
> >> some devicetree bindings for this.
> >
> > ofc, just wanted to lay out the entire thing. The DT version needs some
> > good bikeshed on the dt schema first anyway (so that the helper can decode
> > that directly).
> >
> >>> We might also want a low-level lcdshadow_get() which only returns ENOENT
> >>> when the driver isn't there, and which leaves "do we really need one?" to
> >>> higher levels to answer.
> >>
> >> Right, so my latest idea on that is indeed a high-level lcdshadow_get()
> >> which takes a struct device * and a connector-name and which never
> >> returns EPROBE_DEFER.
> >>
> >> As for leaving things to the higher levels to answer, as explained
> >> in my other follow-up email I think that we should probably add a
> >> lcdshadow_probe_defer() helper for this and call that early on
> >> in the PCI-driver probe functions for the 3 major x86 GPU drivers.
> >> Does that sound ok to you?
> >
> > Uh ... not pretty. There's still a lifetime problem that strictly speaking
> > there's nothing stopping the other driver from getting unloaded between
> > your _probe_defer and the subsequent _get. I think fixing this properly
> > (and screaming a bit at the error code, oh well) is better.
>
> I would really like to separate the discussion and the work
> on getting the 3 major x86 GPU drivers ready to deal with EPROBE_DEFER
> from the lcdshadow discussion and work.  I expect getting these
> 3 drivers ready for EPROBE_DEFER is going to be a major undertaking
> and I would like avoid introducing this significant scope creep
> to the lcdshadow discussion, because it simply is a too big undertaking
> to undertake without us getting a significant amount of manpower
> specifically for this from somewhere.
>
> Note I do agree with you that getting these 3 drivers ready
> for EPROBE_DEFER handling is a worthwhile undertaking, but
> it simply will take too much extra time and as such IMHO it
> really is out of scope for the lcdshadow stuff.
> I expect the amount of work (esp. also dealing with testing
> and regressions) for the EPROBE_DEFER project by itself
> to be a lot *more* work then the actual lcdshadow project.
>
> So going with the assumption/decision that adding proper
> EPROBE_DEFER handling to these 3 drivers is out of scope,
> I believe that adding a lcdshadow_probe_defer() helper is
> an ok solution/workaround for now.
>
> As for your case of the other driver getting unloaded in between
> the check and use of it, that can only happen by explicit user
> action and in that case the worst thing what will happen
> is the "privacy-screen" property missing from the connector,
> which in that case is more or less exactly what the user
> asked for.

For i915 we've had patches, for mei-hdcp integration. Until it became
clear that the mei subsystem is bonkers, and handles suspend/resume by
unloading! drivers.

Which forced i915 to unload and broke the world :-/

So at least for i915 the work should be done already, and just amount
to updating the patches Ram already had. No ideas about the other 2.

What I don't really want is an interface with races. So if fixing the
other drivers is too much work, what we could do is roughly:

- in the top-level probe function to an acpi_lcdshadow_get. This might
fail with EPROBE_DEFER.
- this gives us a dangling reference, but we can drop that one when we
exit the top-level probe function (both on success and on error cases)
- the 2nd acpi_lcdshadow_get call deep down should always succeed at
that point (since the top level holds a reference), so you could wrap
that in a WARNING(IS_ERR_PTR()). Ok that's a lie, if we concurrently
unload then the 2nd call still fails (the reference can never prevent
a hotunbind in the linux kernel device model), so this is exactly as
buggy as your version, so still needs a comment about that.

Adding a acpi_lcdshadow_probe_defer() function otoh just gives people
the impression that that's actually a correct way of doing this.

Then it's up to the driver maintainers whether they're ok with the
above hack of a fake reference, or not. As I said, I think for i915 it
should be fairly ok to just roll it out, but maybe the patches don't
apply at all anymore.

btw to make everything work you also need to set up a device_link
between the lcdshadow device (and it's driver, that's the more
important thing) and the gpu device. That device link will make sure
that
- suspend/resume is done in the right order
- driver load/unload is done in the right order, i.e. unloading of the
lcdshadow driver will automatically force an unbind of the gpu driver
first.

With that all the get/put will do is just refcount the final kfree of
the driver structure.

Cheers, Daniel

> >>> I'd also lean towards putting lcdshadow headers/interfaces into
> >>> drivers/gpu,
> >>
> >> Ack, I think we should even make this drm specific and prefix it with
> >> drm_ so that we get drm_lcdshadow_foo as functions, just to make
> >> clear that this is maintained together with the other drm bits.
> >
> > I want to avoid the impression that I'm on an evil plan to take over the
> > entire world, but personally very happy with a drm_ prefix for this.
>
> Hehe, ok.
>
> >> But my question about "where should this live" was mainly about
> >> the light weight match helpers you suggested to use to figure out
> >> if the device supports lcdshadow at all (and we thus should wait
> >> for a driver) or not. E.g. I can see us adding a:
> >>
> >> drivers/gpu/drm/drm_lcdshadow.c
> >>
> >> file for the core bits and then maybe a:
> >>
> >> drivers/gpu/drm/drm_lcdshadow_detect.c
> >>
> >> file with the light weight match helpers, with each helper
> >> wrapped in #if IS_ENABLED(CONFIG_THINKPAD_ACPI), etc. ?
> >
> > I'd expect it's all going to be so tiny that separate file wont make much
> > sense. Thus far we're simply adding the 1-2 of_ helpers to the
> > corresponding file, with an #ifdef CONFIG_OF around them. It's ok enough.
>
> Ok, lets start with one file for now, we can always split it later.
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
