Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FFF4F97AF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5C110E888;
	Fri,  8 Apr 2022 14:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5AD10E888;
 Fri,  8 Apr 2022 14:08:17 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso9886076fac.0; 
 Fri, 08 Apr 2022 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9NsRA2OE2lZxj+JZboo5je62uhGTP40lrtA8ihJyIg=;
 b=IUMx/ZicFHBAi699ELt7/Nw7ncG1VfFArUUGCtmHZGtLhLxmeo17W7O7+IbsYFH27I
 CHC+1xpSzn5MG2BGK41kasBdc7WTSHESasKhdSRPMbGhfRijdtcTNCEdTL05Rf3EfGKR
 9Ov5vXjKBz+1TS7wLOev8JkGRtxVjJ1XvOxh2ztLKYslFr2PU0qhOPrGR2E2wdxJZw96
 LMKi3Utq4tqCuSu9UVvqahWV7WSaEDjL1es8TEfphcDQtiJrV/KWiyhh+KfcJZIY25Y2
 5EkKTNC80hcUIrZ4XstWfjIrIMdaY5fkWmSGtdAT1y6BhYIs37gBe2IrDrESibaF0ziY
 tmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9NsRA2OE2lZxj+JZboo5je62uhGTP40lrtA8ihJyIg=;
 b=g2q4uCvW37qIhpfry1l7ad4WI38ZaAMBsC0N7cJHj9VnD3gSH8bCRgTE2vDmAPyCJg
 4a4yzqlzGJyQO4L49iq8HrLIjyzhGFOWgUVLXEC2NHhn8F5iDzgm5+Fx41L6BqX71yA5
 SdJ3Bift9CWwj3dl1AMQXh1kB/ytHQZ53oxETwkxO49SEWX2kxIXiQ7cl1Vld8weVx+s
 MgXqlPBapKNYZR+Gy8EcxWuUe/xDhBMKVzzHa3lhtEqiDGfpvlkdhLxYFWcmXR19LfA7
 59fsTqeUr1Bs33mmBC4yjR47w3SbOeucM3O50qLp/ghTgYPB4bIsJukJQ9iEjy/mjrwL
 XgvA==
X-Gm-Message-State: AOAM532ZMr42Iu6BgfxD/V7eAZgxZf24yGxJOzNofxljKhbwMR7vBrY1
 QPn6OoOaVYEqry04+AeRIcNtGprkL4eFw6JKIRJeZHdU
X-Google-Smtp-Source: ABdhPJzN3vkx9XvUKTEbfgQUJu7A2JZ0rKFhKhBMhbeAKVG5taFuaueVcNYaDKNGkPPg1xT8f7Eg4Xx7wx673Z7Aifw=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr8957467oap.253.1649426897019; Fri, 08
 Apr 2022 07:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
In-Reply-To: <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 10:08:05 -0400
Message-ID: <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 4:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
> > On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > > Hi Simon,
> > >
> > > On 4/7/22 18:51, Simon Ser wrote:
> > > > Very nice plan! Big +1 for the overall approach.
> > >
> > > Thanks.
> > >
> > > > On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
> > > >
> > > >> The drm_connector brightness properties
> > > >> =======================================
> > > >>
> > > >> bl_brightness: rw 0-int32_max property controlling the brightness setting
> > > >> of the connected display. The actual maximum of this will be less then
> > > >> int32_max and is given in bl_brightness_max.
> > > >
> > > > Do we need to split this up into two props for sw/hw state? The privacy screen
> > > > stuff needed this, but you're pretty familiar with that. :)
> > >
> > > Luckily that won't be necessary, since the privacy-screen is a security
> > > feature the firmware/embedded-controller may refuse our requests
> > > (may temporarily lock-out changes) and/or may make changes without
> > > us requesting them itself. Neither is really the case with the
> > > brightness setting of displays.
> > >
> > > >> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> > > >> of the display's brightness setting. This will report 0 when brightness
> > > >> control is not available (yet).
> > > >
> > > > I don't think we actually need that one. Integer KMS props all have a
> > > > range which can be fetched via drmModeGetProperty. The max can be
> > > > exposed via this range. Example with the existing alpha prop:
> > > >
> > > >     "alpha": range [0, UINT16_MAX] = 65535
> > >
> > > Right, I already knew that, which is why I explicitly added a range
> > > to the props already. The problem is that the range must be set
> > > before registering the connector and when the backlight driver
> > > only shows up (much) later during boot then we don't know the
> > > range when registering the connector. I guess we could "patch-up"
> > > the range later. But AFAIK that would be a bit of abuse of the
> > > property API as the range is intended to never change, not
> > > even after hotplug uevents. At least atm there is no infra
> > > in the kernel to change the range later.
> > >
> > > Which is why I added an explicit bl_brightness_max property
> > > of which the value gives the actual effective maximum of the
> > > brightness.
>
> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
> brightness control later on then we just perpetuate the nonsense we have
> right now, forever.
>
> Imo we should support two kinds of drivers:
>
> - drivers which are non-crap, and make sure their backlight driver is
>   loaded before they register the drm_device (or at least the
>   drm_connector). For those we want the drm_connector->backlight pointer
>   to bit static over the lifetime of the connector, and then we can also
>   set up the brightness range correctly.
>
> - funny drivers which implement the glorious fallback dance which
>   libbacklight implements currently in userspace. Imo for these drivers we
>   should have a libbacklight_heuristics_backlight, which normalizes or
>   whatever, and is also ways there. And then internally handles the
>   fallback mess to the "right" backlight driver.
>
> We might have some gaps on acpi systems to make sure the drm driver can
> wait for the backlight driver to show up, but that's about it.
>
> Hotplugging random pieces later on is really not how drivers work nowadays
> with deferred probe and component framework and all that.
>
> > > I did consider using the range for this and updating it
> > > on the fly I think nothing is really preventing us from
> > > doing so, but it very much feels like abusing the generic
> > > properties API.
> > >
> > > >> bl_brightness_0_is_min_brightness: ro, boolean
> > > >> When this is set to true then it is safe to set brightness to 0
> > > >> without worrying that this completely turns the backlight off causing
> > > >> the screen to become unreadable. When this is false setting brightness
> > > >> to 0 may turn the backlight off, but this is not guaranteed.
> > > >> This will e.g. be true when directly driving a PWM and the video-BIOS
> > > >> has provided a minimum (non 0) duty-cycle below which the driver will
> > > >> never go.
> > > >
> > > > Hm. It's quite unfortunate that it's impossible to have strong guarantees
> > > > here.
> > > >
> > > > Is there any way we can avoid this prop?
> > >
> > > Not really, the problem is that we really don't know if 0 is off
> > > or min-brightness. In the given example where we actually never go
> > > down to a duty-cycle of 0% because the video BIOS tables tell us
> > > not to, we can be certain that setting the brightness prop to 0
> > > will not turn of the backlight, since we then set the duty-cycle
> > > to the VBT provided minimum. Note the intend here is to only set
> > > the boolean to true if the VBT provided minimum is _not_ 0, 0
> > > just means the vendor did not bother to provide a minimum.
> > >
> > > Currently e.g. GNOME never goes lower then something like 5%
> > > of brightness_max to avoid accidentally turning the screen off.
> > >
> > > Turning the screen off is quite bad to do on e.g. tablets where
> > > the GUI is the only way to undo the brightness change and now
> > > the user can no longer see the GUI.
> > >
> > > The idea behind this boolean is to give e.g. GNOME a way to
> > > know that it is safe to go down to 0% and for it to use
> > > the entire range.
> >
> > Why not just make it policy that 0 is defined as minimum brightness,
> > not off, and have all drivers conform to that?
>
> Because the backlight subsystem isn't as consistent on this, and it's been
> an epic source of confusion since forever.
>
> What's worse, there's both userspace out there which assumes brightness =
> 0 is a really fast dpms off _and_ userspace that assumes that brightness =
> 0 is the lowest setting. Of course on different sets of machines.
>
> So yeah we're screwed. I have no idea how to get out of this.

Yes, but this is a new API.  So can't we do better?  Sure the old
backlight interface is broken, but why carry around clunky workarounds
for new interfaces?

Alex

> -Daniel
>
> >
> > Alex
> >
> > >
> > > > For instance if we can guarantee that the min level won't turn the screen
> > > > completely off we could make the range start from 1 instead of 0.
> > > > Or allow -1 to mean "minimum value, maybe completely off".
> > >
> > > Right, the problem is we really don't know and when the range is
> > > e.g. 0-65535 then something like 1 will almost always still just
> > > turn the screen completely off. There will be a value of say like
> > > 150 or some such which is then the actual minimum value to still
> > > get the backlight to light up at all. The problem is we have
> > > no clue what the actual minimum is. And if the PWM output does
> > > not directly drive the LEDs but is used as an input for some
> > > LED backlight driver chip, that chip itself may have a lookup
> > > table (which may also take care of doing perceived brightness
> > > mapping) and may guarantee a minimum backlight even when given
> > > a 0% duty cycle PWM signal...
> > >
> > > This prop is sort of orthogonal to the generic change to
> > > drm_connector props, so we could also do this later as a follow up
> > > change. At a minimum when I code this up this should be in its
> > > own commit(s) I believe.
> > >
> > > But I do think having this will be useful for the above
> > > GNOME example.
> > >
> > > >> bl_brightness_control_method: ro, enum, possible values:
> > > >> none: The GPU driver expects brightness control to be provided by another
> > > >> driver and that driver has not loaded yet.
> > > >> unknown: The underlying control mechanism is unknown.
> > > >> pwm: The brightness property directly controls the duty-cycle of a PWM
> > > >> output.
> > > >> firmware: The brightness is controlled through firmware calls.
> > > >> DDC/CI: The brightness is controlled through the DDC/CI protocol.
> > > >> gmux: The brightness is controlled by the GMUX.
> > > >> Note this enum may be extended in the future, so other values may
> > > >> be read, these should be treated as "unknown".
> > > >>
> > > >> When brightness control becomes available after being reported
> > > >> as not available before (bl_brightness_control_method=="none")
> > > >> a uevent with CONNECTOR=<connector-id> and
> > > >>
> > > >> PROPERTY=<bl_brightness_control_method-id> will be generated
> > > >>
> > > >> at this point all the properties must be re-read.
> > > >>
> > > >> When/once brightness control is available then all the read-only
> > > >> properties are fixed and will never change.
> > > >>
> > > >> Besides the "none" value for no driver having loaded yet,
> > > >> the different bl_brightness_control_method values are intended for
> > > >> (userspace) heuristics for such things as the brightness setting
> > > >> linearly controlling electrical power or setting perceived brightness.
> > > >
> > > > Can you elaborate? I don't know enough about brightness control to
> > > > understand all of the implications here.
> > >
> > > So after sending this email I was already thinking myself that this
> > > one might not be the best idea. Another shortcoming of the current
> > > backlight API is that it does not let userspace know if the
> > > number is a linear control of the time the LEDs are on vs off
> > > (assuming a LED backlight) or if some component already uses a
> > > lookup table to make 0-100% be more of a linear scale in the
> > > human perception, which is very much non linear. See e.g.:
> > >
> > > https://www.sciencedirect.com/topics/computer-science/perceived-brightness
> > >
> > > "refers to the perceived amount of light coming from self-luminous sources"
> > > "Perceived brightness is a very nonlinear function of the amount of light emitted by a lamp."
> > >
> > > The problem is that at the kernel level we have no idea if
> > > we are controlling "the amount of light emitted" or
> > > perceived brightness and it would be sorta nice for userspace
> > > to know. So the idea here is/was to allow userspace to make some
> > > educated guess here. E.g. a bl_brightness_control_method of "PWM"
> > > hints strongly at "the amount of light emitted" (but this is
> > > not true 100% of the time).  ATM userspace does not do any
> > > "perceived brightness" curve correction so for the first
> > > implementation of moving brightness control to drm properties
> > > I believe it might be better to just park the whole
> > > bl_brightness_control_method propery idea.
> > >
> > > Which would leave the problem of communicating the control_method=="none"
> > > case but we can just use bl_brightness_max == 0 for that.
> > >
> > > Regards,
> > >
> > > Hans
> > >
> > >
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
