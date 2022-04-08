Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B581A4F9918
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977C10F1AF;
	Fri,  8 Apr 2022 15:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B06E10E7FF;
 Fri,  8 Apr 2022 15:11:47 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 c24-20020a9d6c98000000b005e6b7c0a8a8so2834742otr.2; 
 Fri, 08 Apr 2022 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jc7S6uurqrGHp43gAza/JPJJsmjkwXt7apMqd3fJYTY=;
 b=L2W/8L/qAa4L3TsrT/6Kcu11goUyt1Z0/FzWTDfFv1GCnWUOKcO2CHLekmEAC7h4ga
 2Y/iKgsdMA/UayGqamPGfHCYl1gRBqD7QjZYQMqtZe2z/2N3u6KmK/1yIjrE491dOE2n
 XhLv6WiCcVROY5ZFEyuBVMVXnvj7xCe4hpUP0SU7XCm95KGsEOqy6aSTvWJjiUpBJ14R
 2Ai0ZOvwo00QVkM0BRTUozr8VqQcAoJH2Yt/yEkKbKWY0ElKp7dEziEOCGGgn739/OW8
 dwZ+Hv/WCxAAXGx13xQI+/OxamFE0oPCUyOqH83Brl0Db8jFC01XtvsC8StZsFsBt7sE
 ixpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jc7S6uurqrGHp43gAza/JPJJsmjkwXt7apMqd3fJYTY=;
 b=7oFI0VRS871ZUQG31pqP9h66hD+XrnT5h6UTgkPIbBSRhNjoyj681Y/KbSeUfvuid2
 flypahKVHTyWir4nh++HctGrsH6ShTgkrrLPWetHev5o6hgnI8XmzdyeBa2l7DVK/ByG
 H82H2eqgu9zPZnt/5OJP89DYIeaDMrgqcBgXpE0YgVkriQ7Btsh0LehsJ/M4Hzyfw1gM
 7LbY0UF3xV1Pom9E0dp8UsR5kOVYHEhzh2TqvP25jFzUzI8hsUI2nfyWbITsX35vRDjE
 lY4y5snt/hidsWick/kAB6Rh3pVkA5Vuvh6E5aZ992rWRCjvHOvuqVecAneuxJlazdx0
 2n9A==
X-Gm-Message-State: AOAM531kVKXkr0Oa9CNMhUL4hI2pDFeHQMh6O4/r8BDhGA1xQ4ZLoBvh
 b9jvMa1dZ0O8C6ZMIM+4M2fxEZ7p50nnknP6Ss8=
X-Google-Smtp-Source: ABdhPJyn2xUq2oQkejkio7sCS2ailu0uHFpdh2ZmJdaNNS/LwJlurdJjYbyWO6p/COdikNP56p32GIRukD8l+c6ZCIw=
X-Received: by 2002:a9d:4702:0:b0:5cd:481a:148a with SMTP id
 a2-20020a9d4702000000b005cd481a148amr6922747otf.200.1649430706426; Fri, 08
 Apr 2022 08:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
In-Reply-To: <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 11:11:35 -0400
Message-ID: <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/8/22 16:08, Alex Deucher wrote:
> > On Fri, Apr 8, 2022 at 4:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
> >>> On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> Hi Simon,
> >>>>
> >>>> On 4/7/22 18:51, Simon Ser wrote:
> >>>>> Very nice plan! Big +1 for the overall approach.
> >>>>
> >>>> Thanks.
> >>>>
> >>>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>
> >>>>>> The drm_connector brightness properties
> >>>>>> =======================================
> >>>>>>
> >>>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
> >>>>>> of the connected display. The actual maximum of this will be less then
> >>>>>> int32_max and is given in bl_brightness_max.
> >>>>>
> >>>>> Do we need to split this up into two props for sw/hw state? The privacy screen
> >>>>> stuff needed this, but you're pretty familiar with that. :)
> >>>>
> >>>> Luckily that won't be necessary, since the privacy-screen is a security
> >>>> feature the firmware/embedded-controller may refuse our requests
> >>>> (may temporarily lock-out changes) and/or may make changes without
> >>>> us requesting them itself. Neither is really the case with the
> >>>> brightness setting of displays.
> >>>>
> >>>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> >>>>>> of the display's brightness setting. This will report 0 when brightness
> >>>>>> control is not available (yet).
> >>>>>
> >>>>> I don't think we actually need that one. Integer KMS props all have a
> >>>>> range which can be fetched via drmModeGetProperty. The max can be
> >>>>> exposed via this range. Example with the existing alpha prop:
> >>>>>
> >>>>>     "alpha": range [0, UINT16_MAX] = 65535
> >>>>
> >>>> Right, I already knew that, which is why I explicitly added a range
> >>>> to the props already. The problem is that the range must be set
> >>>> before registering the connector and when the backlight driver
> >>>> only shows up (much) later during boot then we don't know the
> >>>> range when registering the connector. I guess we could "patch-up"
> >>>> the range later. But AFAIK that would be a bit of abuse of the
> >>>> property API as the range is intended to never change, not
> >>>> even after hotplug uevents. At least atm there is no infra
> >>>> in the kernel to change the range later.
> >>>>
> >>>> Which is why I added an explicit bl_brightness_max property
> >>>> of which the value gives the actual effective maximum of the
> >>>> brightness.
> >>
> >> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
> >> brightness control later on then we just perpetuate the nonsense we have
> >> right now, forever.
> >>
> >> Imo we should support two kinds of drivers:
> >>
> >> - drivers which are non-crap, and make sure their backlight driver is
> >>   loaded before they register the drm_device (or at least the
> >>   drm_connector). For those we want the drm_connector->backlight pointer
> >>   to bit static over the lifetime of the connector, and then we can also
> >>   set up the brightness range correctly.
> >>
> >> - funny drivers which implement the glorious fallback dance which
> >>   libbacklight implements currently in userspace. Imo for these drivers we
> >>   should have a libbacklight_heuristics_backlight, which normalizes or
> >>   whatever, and is also ways there. And then internally handles the
> >>   fallback mess to the "right" backlight driver.
> >>
> >> We might have some gaps on acpi systems to make sure the drm driver can
> >> wait for the backlight driver to show up, but that's about it.
> >>
> >> Hotplugging random pieces later on is really not how drivers work nowadays
> >> with deferred probe and component framework and all that.
> >>
> >>>> I did consider using the range for this and updating it
> >>>> on the fly I think nothing is really preventing us from
> >>>> doing so, but it very much feels like abusing the generic
> >>>> properties API.
> >>>>
> >>>>>> bl_brightness_0_is_min_brightness: ro, boolean
> >>>>>> When this is set to true then it is safe to set brightness to 0
> >>>>>> without worrying that this completely turns the backlight off causing
> >>>>>> the screen to become unreadable. When this is false setting brightness
> >>>>>> to 0 may turn the backlight off, but this is not guaranteed.
> >>>>>> This will e.g. be true when directly driving a PWM and the video-BIOS
> >>>>>> has provided a minimum (non 0) duty-cycle below which the driver will
> >>>>>> never go.
> >>>>>
> >>>>> Hm. It's quite unfortunate that it's impossible to have strong guarantees
> >>>>> here.
> >>>>>
> >>>>> Is there any way we can avoid this prop?
> >>>>
> >>>> Not really, the problem is that we really don't know if 0 is off
> >>>> or min-brightness. In the given example where we actually never go
> >>>> down to a duty-cycle of 0% because the video BIOS tables tell us
> >>>> not to, we can be certain that setting the brightness prop to 0
> >>>> will not turn of the backlight, since we then set the duty-cycle
> >>>> to the VBT provided minimum. Note the intend here is to only set
> >>>> the boolean to true if the VBT provided minimum is _not_ 0, 0
> >>>> just means the vendor did not bother to provide a minimum.
> >>>>
> >>>> Currently e.g. GNOME never goes lower then something like 5%
> >>>> of brightness_max to avoid accidentally turning the screen off.
> >>>>
> >>>> Turning the screen off is quite bad to do on e.g. tablets where
> >>>> the GUI is the only way to undo the brightness change and now
> >>>> the user can no longer see the GUI.
> >>>>
> >>>> The idea behind this boolean is to give e.g. GNOME a way to
> >>>> know that it is safe to go down to 0% and for it to use
> >>>> the entire range.
> >>>
> >>> Why not just make it policy that 0 is defined as minimum brightness,
> >>> not off, and have all drivers conform to that?
> >>
> >> Because the backlight subsystem isn't as consistent on this, and it's been
> >> an epic source of confusion since forever.
> >>
> >> What's worse, there's both userspace out there which assumes brightness =
> >> 0 is a really fast dpms off _and_ userspace that assumes that brightness =
> >> 0 is the lowest setting. Of course on different sets of machines.
> >>
> >> So yeah we're screwed. I have no idea how to get out of this.
> >
> > Yes, but this is a new API.  So can't we do better?  Sure the old
> > backlight interface is broken, but why carry around clunky workarounds
> > for new interfaces?
>
> Right we certainly need to define the behavior of the new API
> clearly, so that userspace does not misuse / misinterpret it.
>
> The intend is for brightness=0 to mean minimum brightness
> to still be able to see what is on the screen. But the problem
> is that in many cases the GPU driver directly controls a PWM
> output, no minimum PWM value is given in the video BIOS tables
> and actually setting the PWM to 0% dutycycle turns off the
> screen.

Sure.  So have the GPU driver map 0 to some valid minimum if that is
the case or might be the case.  If bugs come up, we can add quirks in
the GPU drivers.

>
> So we can only promise a best-effort to make brightness=0
> mean minimum brightness, combined with documenting that it
> may turn off the backlight and that userspace _must_ never
> depend on it turning off the backlight.
>
> Also note that setting a direct PWM output to duty-cycle 0%
> does not guarantee that the backlight goes off, this may be
> an input for a special backlight LED driver IC like the
> TI LP855x series which can have an internal lookup
> table causing it to actually output a minimum brightness
> when its PWM input is at 0% dutycycle.  So this is a case
> where we just don't get enough info from the fw/hw to be able
> to offer the guarantees which we would like to guarantee.

So set it to a level we can guarantee can call it 0.  If we have the
flag we are just punting on the problem in my opinion.  The kernel
driver would seem to have a better idea what is a valid minimum than
some arbitrary userspace application.  Plus then if we need a
workaround for what is the minimum valid brightness, we can fix it one
place rather than letting every application try and fix it.

Alex


>
> Regards,
>
> Hans
>
>
>
>
>
