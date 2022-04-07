Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E54F88BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 23:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1B610E00F;
	Thu,  7 Apr 2022 21:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE9610E00F;
 Thu,  7 Apr 2022 21:06:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q129so6959693oif.4;
 Thu, 07 Apr 2022 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BZvbLl9lveluvoi9PRr3C3v3Wkyih341NWaZaUV/Bo=;
 b=KrWNLf1SyFC70Pv8LnCfo8l0aIT/6Ef7tulJRccTE2QmoVahbqoNcGiqyhEsk4k7yw
 TDNsA22yPFmeOWYaiNrdP9UW1hP/zX6jxV9smljuF6sSxleLmRNJ4+GQToWHRx21oGcG
 tBGHu5UsFgimjTIrQfDoN/RHdlydF2bgi8OLysFHSsPBJgUq4y5W6O9E8IMVucTjRyA9
 pMC4rabs1wK3yc0eICFrs+iXaRvw5LuEqJZFU91P7OnpGCJ2EhBX0wQRtDWXq1FD5vGT
 b3G7J9k96xGLWkw4KdRtsbQaVXucCcqBVORLHFjUAMwLZeMk5CuhDyYOjARdJD6MqR7W
 iyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BZvbLl9lveluvoi9PRr3C3v3Wkyih341NWaZaUV/Bo=;
 b=R/LcZ9jEkTmq/9svFYi6d6USkKMxo7Z1NxVD8uEOMUzi7tFGBKH1dQyjoxY0xjHDVn
 jnUomlqbtzY4j/lmGmm3CH7n47qFaHDmD+ZcaBuePzbdTMRGYSdSFCoZtTw2b8/nvmaz
 a6ZJVAdoCU09aNnJYlNTPzX2v5Ah8ePuIXT+bSAyTLsJ+KUEbxJSN59l/KAyjAQn045h
 eev4GhLw9ICu2oMoRISFYkAJ5x/SJSmZpwaevX2iHic7LLQPabOTXn3ixsx5TXmTveBs
 9yTLacOiJqUOyuGpaFdIr3iQ9g5BuvwFZ9Q2j7z3ZPu1kaeD92UrBdpmhxCK2qxHTTyw
 QVig==
X-Gm-Message-State: AOAM531rbmbGsw1Vj6bqj2HnGXGCzgNBHamH8Jhw170fJF94QgYcLc12
 KLFyyn+MujCmDlKsCxQlZw/N+6mPDo/2n19441c=
X-Google-Smtp-Source: ABdhPJz65j/d4w2ROBg5lS9sKaA7h0CDQ1vhrVxNCJYcHfb5x7VABEk/aiNXJacB0B1ZisGuX3Up2dB3/OLCiVsTN9g=
X-Received: by 2002:a05:6808:2390:b0:2f9:c718:80e0 with SMTP id
 bp16-20020a056808239000b002f9c71880e0mr785446oib.253.1649365563227; Thu, 07
 Apr 2022 14:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
In-Reply-To: <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 17:05:52 -0400
Message-ID: <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Simon,
>
> On 4/7/22 18:51, Simon Ser wrote:
> > Very nice plan! Big +1 for the overall approach.
>
> Thanks.
>
> > On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >> The drm_connector brightness properties
> >> =======================================
> >>
> >> bl_brightness: rw 0-int32_max property controlling the brightness setting
> >> of the connected display. The actual maximum of this will be less then
> >> int32_max and is given in bl_brightness_max.
> >
> > Do we need to split this up into two props for sw/hw state? The privacy screen
> > stuff needed this, but you're pretty familiar with that. :)
>
> Luckily that won't be necessary, since the privacy-screen is a security
> feature the firmware/embedded-controller may refuse our requests
> (may temporarily lock-out changes) and/or may make changes without
> us requesting them itself. Neither is really the case with the
> brightness setting of displays.
>
> >> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> >> of the display's brightness setting. This will report 0 when brightness
> >> control is not available (yet).
> >
> > I don't think we actually need that one. Integer KMS props all have a
> > range which can be fetched via drmModeGetProperty. The max can be
> > exposed via this range. Example with the existing alpha prop:
> >
> >     "alpha": range [0, UINT16_MAX] = 65535
>
> Right, I already knew that, which is why I explicitly added a range
> to the props already. The problem is that the range must be set
> before registering the connector and when the backlight driver
> only shows up (much) later during boot then we don't know the
> range when registering the connector. I guess we could "patch-up"
> the range later. But AFAIK that would be a bit of abuse of the
> property API as the range is intended to never change, not
> even after hotplug uevents. At least atm there is no infra
> in the kernel to change the range later.
>
> Which is why I added an explicit bl_brightness_max property
> of which the value gives the actual effective maximum of the
> brightness.
>
> I did consider using the range for this and updating it
> on the fly I think nothing is really preventing us from
> doing so, but it very much feels like abusing the generic
> properties API.
>
> >> bl_brightness_0_is_min_brightness: ro, boolean
> >> When this is set to true then it is safe to set brightness to 0
> >> without worrying that this completely turns the backlight off causing
> >> the screen to become unreadable. When this is false setting brightness
> >> to 0 may turn the backlight off, but this is not guaranteed.
> >> This will e.g. be true when directly driving a PWM and the video-BIOS
> >> has provided a minimum (non 0) duty-cycle below which the driver will
> >> never go.
> >
> > Hm. It's quite unfortunate that it's impossible to have strong guarantees
> > here.
> >
> > Is there any way we can avoid this prop?
>
> Not really, the problem is that we really don't know if 0 is off
> or min-brightness. In the given example where we actually never go
> down to a duty-cycle of 0% because the video BIOS tables tell us
> not to, we can be certain that setting the brightness prop to 0
> will not turn of the backlight, since we then set the duty-cycle
> to the VBT provided minimum. Note the intend here is to only set
> the boolean to true if the VBT provided minimum is _not_ 0, 0
> just means the vendor did not bother to provide a minimum.
>
> Currently e.g. GNOME never goes lower then something like 5%
> of brightness_max to avoid accidentally turning the screen off.
>
> Turning the screen off is quite bad to do on e.g. tablets where
> the GUI is the only way to undo the brightness change and now
> the user can no longer see the GUI.
>
> The idea behind this boolean is to give e.g. GNOME a way to
> know that it is safe to go down to 0% and for it to use
> the entire range.

Why not just make it policy that 0 is defined as minimum brightness,
not off, and have all drivers conform to that?

Alex

>
> > For instance if we can guarantee that the min level won't turn the screen
> > completely off we could make the range start from 1 instead of 0.
> > Or allow -1 to mean "minimum value, maybe completely off".
>
> Right, the problem is we really don't know and when the range is
> e.g. 0-65535 then something like 1 will almost always still just
> turn the screen completely off. There will be a value of say like
> 150 or some such which is then the actual minimum value to still
> get the backlight to light up at all. The problem is we have
> no clue what the actual minimum is. And if the PWM output does
> not directly drive the LEDs but is used as an input for some
> LED backlight driver chip, that chip itself may have a lookup
> table (which may also take care of doing perceived brightness
> mapping) and may guarantee a minimum backlight even when given
> a 0% duty cycle PWM signal...
>
> This prop is sort of orthogonal to the generic change to
> drm_connector props, so we could also do this later as a follow up
> change. At a minimum when I code this up this should be in its
> own commit(s) I believe.
>
> But I do think having this will be useful for the above
> GNOME example.
>
> >> bl_brightness_control_method: ro, enum, possible values:
> >> none: The GPU driver expects brightness control to be provided by another
> >> driver and that driver has not loaded yet.
> >> unknown: The underlying control mechanism is unknown.
> >> pwm: The brightness property directly controls the duty-cycle of a PWM
> >> output.
> >> firmware: The brightness is controlled through firmware calls.
> >> DDC/CI: The brightness is controlled through the DDC/CI protocol.
> >> gmux: The brightness is controlled by the GMUX.
> >> Note this enum may be extended in the future, so other values may
> >> be read, these should be treated as "unknown".
> >>
> >> When brightness control becomes available after being reported
> >> as not available before (bl_brightness_control_method=="none")
> >> a uevent with CONNECTOR=<connector-id> and
> >>
> >> PROPERTY=<bl_brightness_control_method-id> will be generated
> >>
> >> at this point all the properties must be re-read.
> >>
> >> When/once brightness control is available then all the read-only
> >> properties are fixed and will never change.
> >>
> >> Besides the "none" value for no driver having loaded yet,
> >> the different bl_brightness_control_method values are intended for
> >> (userspace) heuristics for such things as the brightness setting
> >> linearly controlling electrical power or setting perceived brightness.
> >
> > Can you elaborate? I don't know enough about brightness control to
> > understand all of the implications here.
>
> So after sending this email I was already thinking myself that this
> one might not be the best idea. Another shortcoming of the current
> backlight API is that it does not let userspace know if the
> number is a linear control of the time the LEDs are on vs off
> (assuming a LED backlight) or if some component already uses a
> lookup table to make 0-100% be more of a linear scale in the
> human perception, which is very much non linear. See e.g.:
>
> https://www.sciencedirect.com/topics/computer-science/perceived-brightness
>
> "refers to the perceived amount of light coming from self-luminous sources"
> "Perceived brightness is a very nonlinear function of the amount of light emitted by a lamp."
>
> The problem is that at the kernel level we have no idea if
> we are controlling "the amount of light emitted" or
> perceived brightness and it would be sorta nice for userspace
> to know. So the idea here is/was to allow userspace to make some
> educated guess here. E.g. a bl_brightness_control_method of "PWM"
> hints strongly at "the amount of light emitted" (but this is
> not true 100% of the time).  ATM userspace does not do any
> "perceived brightness" curve correction so for the first
> implementation of moving brightness control to drm properties
> I believe it might be better to just park the whole
> bl_brightness_control_method propery idea.
>
> Which would leave the problem of communicating the control_method=="none"
> case but we can just use bl_brightness_max == 0 for that.
>
> Regards,
>
> Hans
>
>
>
