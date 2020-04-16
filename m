Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84CB1AB85E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF976EAC9;
	Thu, 16 Apr 2020 06:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29B06EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:46:49 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z17so2229841oto.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Prfn2xqGFCnpOcpIXASVabulsXcyGFxKao7ALBB/ft4=;
 b=OmYP9GMnvIwb9lE9us43UDu/ONmTPfGr2UFJXQkZvaLXyjdRtt1p9+IHAtsSjujuuG
 AHXvtrADoeAcpkdM/VjyiFt4MxkU8/gEUCKTWTMK8tHcmjs8zWsrkmuzfHcvji7Hff1m
 iePpRKmZW258QZrXWv7OXSLsKzZvoo7vnHjVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Prfn2xqGFCnpOcpIXASVabulsXcyGFxKao7ALBB/ft4=;
 b=tGmde4S+Uuy0oDm55slMXCS3gY3aAHen/1po71cGGQ48R0mAWyK+ne9dQG5mB02UpY
 ZfJRzDCU5sHZav+by0avETRPaMEfZLgogIvNEkamymXSKxWNjk94KYhAhsJ4uZ/KdYHG
 ZyT6LqQEQKJMjgjSzVnQ47td/xfBxeDreJo7BMG/enWr9gLO961AoAX9G5ft7K20tUsq
 75CaaVxDGdLjkNQcJbWHW81Dt4Gl3qFfoYZ0MtOv9PUKPs9Dy/RreMbx8kom+h5Ndxe8
 fvV20FQG9Y/IBUuHArH72G6zY+4TAnk/zQjBHenuSSZ3qUtGSsGdM+3qBahxvuCvtKoz
 MoDA==
X-Gm-Message-State: AGi0PuYpOCEulFiF3oldtthECo0s73HJd4QW3cnZ+hvF+HGnpetmAquG
 sw60/lKfzeX/IGEVpRr+08b/Qo9L/3h42cnVtpYAmA==
X-Google-Smtp-Source: APiQypI9Ogz9am9s9i1SD8YTJA5Oe8vW3SXXdXScvsnxwsaDyC1+7STpz3tb3R7lqX6X1nodbTtkVbBDBPoMtoq9W04=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr26697874ota.281.1587019608926; 
 Wed, 15 Apr 2020 23:46:48 -0700 (PDT)
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
 <CAKMK7uFcvcMopZPyj2P5RDr+TgVC5LCwdccM6+XAPenP55QKUQ@mail.gmail.com>
 <61bb8500-64c5-9381-fdd9-8dba4d4e290c@redhat.com>
In-Reply-To: <61bb8500-64c5-9381-fdd9-8dba4d4e290c@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 Apr 2020 08:46:37 +0200
Message-ID: <CAKMK7uF6mVWm5YmBvjV3SB1Uer29-q0Y8kgRLMk3rbVn87eg3w@mail.gmail.com>
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

On Wed, Apr 15, 2020 at 9:50 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/15/20 8:29 PM, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 8:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 4/15/20 7:54 PM, Daniel Vetter wrote:
> >>> On Wed, Apr 15, 2020 at 03:02:53PM +0200, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 4/15/20 2:01 PM, Daniel Vetter wrote:
> >>>>> On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 4/15/20 12:22 PM, Daniel Vetter wrote:
> >>>>>>> On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> On 4/15/20 11:52 AM, Daniel Vetter wrote:
> >>>>>>
> >>>>>> <snip>
> >>>>>>
> >>>>>>>>> iv. What every SoC subsystem does:
> >>>>>>>>>
> >>>>>>>>> - lcdshadow drivers register drivers
> >>>>>>>>> - drm drivers look them up
> >>>>>>>>> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> >>>>>>>>> the entire thing is assembled.
> >>>>>>>>>
> >>>>>>>>> That's what we're doing already for other standardized components like
> >>>>>>>>> drm_bridge or drm_panel, and I think that's also the right approach
> >>>>>>>>> for backlight and anything else like that. Hand-rolling our own
> >>>>>>>>> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> >>>>>>>>> to real pain. Also, with EPROBE_DEFER we have one standard way of
> >>>>>>>>> building a driver from component, which spans subsystems and is also
> >>>>>>>>> the underlying magic that makes stuff like component.c work.
> >>>>>>>>
> >>>>>>>> On the SoCs we have devicetree telling us what components there
> >>>>>>>> are, so we can wait for them to show up. The only way to figure out
> >>>>>>>> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
> >>>>>>>> or duplicating a lot of code from thinkpad_acpi. Edit:
> >>>>>>>> also see below for a possible solution.
> >>>>>>>
> >>>>>>> Yup it sucks. I think all we can do is have a small acpi match
> >>>>>>> function (which yes will duplicate some of the thinkpad_acpi driver
> >>>>>>> logic) to re-create that information and give us a "should we have a
> >>>>>>> lcdshadow driver for this $pci_device" answer.
> >>>>>>
> >>>>>> Ok, so questions about this solution:
> >>>>>>
> >>>>>> 1. Where should that match-function live ?
> >>>>>>
> >>>>>> 2. An acpi_thinkpad derived match-function will only be able to
> >>>>>>       answer if there is an lcdshadow device/driver for the internal
> >>>>>>       panel. It will not be able to tie this info to a certain PCI
> >>>>>>       device. My plan is to pass NULL as dev_name when registering
> >>>>>>       the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
> >>>>>>       skip device-name matching (consider everything a match) for
> >>>>>>       lcdshadow-devices registered with NULL as dev_name.
> >>>>>>
> >>>>>>       So I guess in this case the mini match function should just
> >>>>>>       ignore the passed in device?
> >>>>>
> >>>>> Yeah I think we can't really avoid that. I also expect that we'll need
> >>>>> ACPI and dt versions of this, and driver needs to know which one to call.
> >>>>> Since at least in a dt world the driver knows exactly for which dt node it
> >>>>> needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
> >>>>> more strict.
> >>>>>
> >>>>> For the acpi version I'm not even sure we can do more than provide the
> >>>>> struct device * pointer of the gpu. I think if we ever get more than 1
> >>>>> lcdshadow driver on acpi systems we can add more stuff later on, for now
> >>>>> I'd just leave that out.
> >>>>>
> >>>>> So maybe
> >>>>>
> >>>>> acpi_lcdshadow_get(struct device *dev);
> >>>>>
> >>>>> of_lcdshadow_get(struct device_node *np);
> >>>>>
> >>>>> And with maybe a future plan to add some kind of enum or whatever to
> >>>>> acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
> >>>>> an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.
> >>>>
> >>>> Ok, note I plan to only implement the acpi version for now, I do
> >>>> expect some non ACPI/x86 devices to show up with his feature
> >>>> eventually but I believe it is best to implement this once
> >>>> those actually show up. Esp. since this will also involve adding
> >>>> some devicetree bindings for this.
> >>>
> >>> ofc, just wanted to lay out the entire thing. The DT version needs some
> >>> good bikeshed on the dt schema first anyway (so that the helper can decode
> >>> that directly).
> >>>
> >>>>> We might also want a low-level lcdshadow_get() which only returns ENOENT
> >>>>> when the driver isn't there, and which leaves "do we really need one?" to
> >>>>> higher levels to answer.
> >>>>
> >>>> Right, so my latest idea on that is indeed a high-level lcdshadow_get()
> >>>> which takes a struct device * and a connector-name and which never
> >>>> returns EPROBE_DEFER.
> >>>>
> >>>> As for leaving things to the higher levels to answer, as explained
> >>>> in my other follow-up email I think that we should probably add a
> >>>> lcdshadow_probe_defer() helper for this and call that early on
> >>>> in the PCI-driver probe functions for the 3 major x86 GPU drivers.
> >>>> Does that sound ok to you?
> >>>
> >>> Uh ... not pretty. There's still a lifetime problem that strictly speaking
> >>> there's nothing stopping the other driver from getting unloaded between
> >>> your _probe_defer and the subsequent _get. I think fixing this properly
> >>> (and screaming a bit at the error code, oh well) is better.
> >>
> >> I would really like to separate the discussion and the work
> >> on getting the 3 major x86 GPU drivers ready to deal with EPROBE_DEFER
> >> from the lcdshadow discussion and work.  I expect getting these
> >> 3 drivers ready for EPROBE_DEFER is going to be a major undertaking
> >> and I would like avoid introducing this significant scope creep
> >> to the lcdshadow discussion, because it simply is a too big undertaking
> >> to undertake without us getting a significant amount of manpower
> >> specifically for this from somewhere.
> >>
> >> Note I do agree with you that getting these 3 drivers ready
> >> for EPROBE_DEFER handling is a worthwhile undertaking, but
> >> it simply will take too much extra time and as such IMHO it
> >> really is out of scope for the lcdshadow stuff.
> >> I expect the amount of work (esp. also dealing with testing
> >> and regressions) for the EPROBE_DEFER project by itself
> >> to be a lot *more* work then the actual lcdshadow project.
> >>
> >> So going with the assumption/decision that adding proper
> >> EPROBE_DEFER handling to these 3 drivers is out of scope,
> >> I believe that adding a lcdshadow_probe_defer() helper is
> >> an ok solution/workaround for now.
> >>
> >> As for your case of the other driver getting unloaded in between
> >> the check and use of it, that can only happen by explicit user
> >> action and in that case the worst thing what will happen
> >> is the "privacy-screen" property missing from the connector,
> >> which in that case is more or less exactly what the user
> >> asked for.
> >
> > For i915 we've had patches, for mei-hdcp integration. Until it became
> > clear that the mei subsystem is bonkers, and handles suspend/resume by
> > unloading! drivers.
> >
> > Which forced i915 to unload and broke the world :-/
> >
> > So at least for i915 the work should be done already, and just amount
> > to updating the patches Ram already had. No ideas about the other 2.
>
> Ok.
>
> > What I don't really want is an interface with races. So if fixing the
> > other drivers is too much work, what we could do is roughly:
> >
> > - in the top-level probe function to an acpi_lcdshadow_get. This might
> > fail with EPROBE_DEFER.
> > - this gives us a dangling reference, but we can drop that one when we
> > exit the top-level probe function (both on success and on error cases)
> > - the 2nd acpi_lcdshadow_get call deep down should always succeed at
> > that point (since the top level holds a reference), so you could wrap
> > that in a WARNING(IS_ERR_PTR()). Ok that's a lie, if we concurrently
> > unload then the 2nd call still fails (the reference can never prevent
> > a hotunbind in the linux kernel device model), so this is exactly as
> > buggy as your version, so still needs a comment about that.
> >
> > Adding a acpi_lcdshadow_probe_defer() function otoh just gives people
> > the impression that that's actually a correct way of doing this.
> >
> > Then it's up to the driver maintainers whether they're ok with the
> > above hack of a fake reference, or not. As I said, I think for i915 it
> > should be fairly ok to just roll it out, but maybe the patches don't
> > apply at all anymore.
>
> Ok trying to taking a ref early on and handling EPROBE_DEFER
> at that first attempt to take a ref works for me. So lets go with
> that. I will try to whip up a v1 patch-set for this, ETA aprox.
> 1-2 weeks I guess.
>
> > btw to make everything work you also need to set up a device_link
> > between the lcdshadow device (and it's driver, that's the more
> > important thing) and the gpu device. That device link will make sure
> > that
> > - suspend/resume is done in the right order
> > - driver load/unload is done in the right order, i.e. unloading of the
> > lcdshadow driver will automatically force an unbind of the gpu driver
> > first.
>
> That is an interesting idea, but that does assume that their
> is an actual struct device which the code handling the lcdshadow
> binds to, which in case of thinkpad_acpi is not really the case.
>
> Anyways passing in a parent device when registering a lcdshadow_dev
> seems like a good idea and we can do the device_link thing if the parent
> is non NULL.

For device_link to work, it needs to be the struct device the actual
driver is bound to. Otherwise the suspend/resume functions dont do
anything. No idea how this acpi stuff works, if it doesn't work like a
driver then we're a bit screwed perhaps ...

Anyway I guess for lcdshadow it's not that important, since not much
to suspend/resume. For backlight this will matter more I guess.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
