Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D0B5A2169
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 09:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3110E634;
	Fri, 26 Aug 2022 07:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6383510E3DD;
 Thu, 25 Aug 2022 21:41:02 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-333a4a5d495so574411067b3.10; 
 Thu, 25 Aug 2022 14:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=O6Ua9HoxOpSTIIWrDVj4QfwdKSRV26nNyBSDT2nPg2A=;
 b=ib8aMbWttBNnuMf3woweau4e/iPPuBYOLPamvwUGG+cHIsZWkxEX+x5l0eqh+zFKAu
 27yNMJACwAsT1QVacvR/GihLTyFMNfbK4vvgxn5lMQCiA0kYoTRCGRh1sHk86ahjx/9Q
 XulRH8cz4+3hyiapZhLd4iin8fDyBean8rddktNq7e1bOjhg1a5x1pxajwiNM4x4KmBp
 eyGzA6COQexW0AG6zqG83mMVXvvIsSFeyAIxGdBwSz4PhjMw0uxp2jJ/TEyg8xwWQla+
 NlM5HIHSM4AAoEXheAWxIKxWCqr/KcjKNt6cVzYbnBxczGtpu5ODMkBa7dTKZXR/vdIW
 qY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=O6Ua9HoxOpSTIIWrDVj4QfwdKSRV26nNyBSDT2nPg2A=;
 b=5GUadObq8CkT/G/5QKPa+quvF3FrJ+YROIJwLmYgK0KPUWoYvvIfyZNtHsUyUi5SDj
 fBzAwfPoZ4vuqYL0MnF/JOdI0qRcJRAhEMU0U430I3hovfWK1z7YbQkpj3qdCletR1IO
 z8pWxAh9p+J5YlAJgiKAU/OioB6i+ksgDa6ZPaeEO3xEcJ7kreKCJAPyCGvBxEhjGnCl
 m6uhm/YWma29XoptnB0G+c6GweKM5msPGVB45FxvG2ENpVDipEpCE7V22gt+lnK1rWaX
 2P/LnL7R3AfWPwkoxhZcXwFpZg2IJVhYP03A0CIolE9vcYQPyeMMeFigq+ewUhbz2hjc
 M4uw==
X-Gm-Message-State: ACgBeo3u9S6H7q1lByGRULEVd2Hv+MQPRrNV+rf8kdOHiBIjcmIo1Vdh
 nWJgeISqHLg1sN1d6TLPmqObrg+ivzVyRbyL7UVYWz+o
X-Google-Smtp-Source: AA6agR7AdW2BCux5Adwd7Cf9boN1HH94XTUbxhV7/t3ksRD1O4wZTOqieskyvhuaV1F0QhCPld9g/a7wm47AgL5bZP8=
X-Received: by 2002:a25:391:0:b0:695:b61c:c87 with SMTP id
 139-20020a250391000000b00695b61c0c87mr5143269ybd.330.1661463661218; 
 Thu, 25 Aug 2022 14:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <CAJoG2+8a9edJOx85DqH1oAd97cgY=_SaRT8_qEssjDtuObbA=g@mail.gmail.com>
 <b03afa5c-8c0c-4b52-1bec-a74f74b24d23@redhat.com>
In-Reply-To: <b03afa5c-8c0c-4b52-1bec-a74f74b24d23@redhat.com>
From: Yusuf Khan <yusisamerican@gmail.com>
Date: Thu, 25 Aug 2022 16:40:50 -0500
Message-ID: <CAJoG2+-_oskWgqttmACAKPJdJym5zv8MQmcnPzob4AaFZKFzwg@mail.gmail.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000055972f05e717a774"
X-Mailman-Approved-At: Fri, 26 Aug 2022 07:05:22 +0000
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000055972f05e717a774
Content-Type: text/plain; charset="UTF-8"

Perhaps the Kconfig modifications could be postponed to stage 2
since for people running distros that suddenly decide to disable
/sys/class/backlight/ it may be impractical for them to recompile
their kernels and such. Also stage 2 should probably take ~2 decades
until it comes into being, for reference fbdev SPECIFIC drivers
were removed from fedora just recently and because of that there
were some issues with some user's systems. I understand it's much
easier to change from the /sys/class/backlight/ interface to the one
you have proposed than to change from fbdev to KMS though.

On Thu, Aug 25, 2022 at 3:27 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Hi Yusuf,
>
> On 8/24/22 04:18, Yusuf Khan wrote:
> > Sorry for the necro-bump, I hadnt seen this go by
>
> No problem.
>
> > My main concern with this proposal is the phasing out of
> /sys/class/backlight/.
> > Currently on the user(user, not userland) level its easier for me to
> just modify
> > the file and be done with it. xbacklight doesnt tell me when its failed,
> > brightnessctl doesnt make assumptions about what device is what, and
> > other brightness setting applications ive seen are much worse than them.
> > Someone needs to create a userland application thats less inconvenient
> > than `echo`ing into /sys/class/backlight with a name that human beings
> can
> > actually remember before I stop using the sysfs, perhaps "setbrightness"
> > could be the binary's name? Also I dont think its wise to disable or
> make it
> > read only though Kconfig as older apps may depend on it, maybe add a
> > kernel param that disables the old interface so bigger distros can
> pressure
> > app makers into changing the interface? As a big draw for DDC/CI is that
> > many displays support it as a way to change brightness(even if you arent
> > doing anything special that would break the old interface) perhaps it
> could
> > be an early adopter to that kernel parameter?
>
> Right, so deprecating the /sys/class/backlight API definitely is the last
> step and probably is years away. As you say hiding / making it read-only
> should probably be a kernel-parameter at first, with maybe a Kconfig
> option to set the default. So the depcration would go like this:
>
> 1. Add:
> A kernel-parameter to allow hiding or read-only-ing the sysfs interface +
> Kconfig to select the default +
> dev_warn_once() when the old API is used
>
> 2. (much later) Drop the Kconfig option and default to hiding/read-only
>
> 3. (even later) Maybe completely remove the sysfs interface?
>
> Note the hiding vs read-only thing is to be decided. ATM I'm rather more
> focused on getting the new API in place then on deprecating the old one :)
>
> Anyways I fully agree that we need to do the deprecation carefully and
> slowly. This is likely going to take multiple years and then some ...
>
> Regards,
>
> Hans
>
>
>
> >
> > On Thu, Apr 7, 2022 at 10:39 AM Hans de Goede <hdegoede@redhat.com
> <mailto:hdegoede@redhat.com>> wrote:
> >
> >     As discussed already several times in the past:
> >      https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/ <
> https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/>
> >
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> <
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> >
> >
> >     The current userspace API for brightness control offered by
> >     /sys/class/backlight devices has various issues, the biggest 2 being:
> >
> >     1. There is no way to map the backlight device to a specific
> >        display-output / panel (1)
> >     2. Controlling the brightness requires root-rights requiring
> >        desktop-environments to use suid-root helpers for this.
> >
> >     As already discussed on various conference's hallway tracks
> >     and as has been proposed on the dri-devel list once before (2),
> >     it seems that there is consensus that the best way to to solve these
> >     2 issues is to add support for controlling a video-output's
> brightness
> >     through properties on the drm_connector.
> >
> >     This RFC outlines my plan to try and actually implement this,
> >     which has 3 phases:
> >
> >
> >     Phase 1: Stop registering multiple /sys/class/backlight devs for a
> single display
> >
>  =================================================================================
> >
> >     On x86 there can be multiple firmware + direct-hw-access methods
> >     for controlling the backlight and in some cases the kernel registers
> >     multiple backlight-devices for a single internal laptop LCD panel:
> >
> >     a) i915 and nouveau unconditionally register their "native"
> backlight dev
> >        even on devices where /sys/class/backlight/acpi_video0 must be
> used
> >        to control the backlight, relying on userspace to prefer the
> "firmware"
> >        acpi_video0 device over "native" devices.
> >     b) amdgpu and nouveau rely on the acpi_video driver initializing
> before
> >        them, which currently causes /sys/class/backlight/acpi_video0 to
> usually
> >        show up and then they register their own native backlight driver
> after
> >        which the drivers/acpi/video_detect.c code unregisters the
> acpi_video0
> >        device. This means that userspace briefly sees 2 devices and the
> >        disappearing of acpi_video0 after a brief time confuses the
> systemd
> >        backlight level save/restore code, see e.g.:
> >        https://bbs.archlinux.org/viewtopic.php?id=269920 <
> https://bbs.archlinux.org/viewtopic.php?id=269920>
> >
> >     I already have a pretty detailed plan to tackle this, which I will
> >     post in a separate RFC email. I plan to start working on this right
> >     away, as it will be good to have this fixed regardless.
> >
> >
> >     Phase 2: Add drm_connector properties mirroring the matching
> backlight device
> >
>  =============================================================================
> >
> >     The plan is to add a drm_connector helper function, which optionally
> takes
> >     a pointer to the backlight device for the GPU's native backlight
> device,
> >     which will then mirror the backlight settings from the backlight
> device
> >     in a set of read/write brightness* properties on the connector.
> >
> >     This function can then be called by GPU drivers for the
> drm_connector for
> >     the internal panel and it will then take care of everything. When
> there
> >     is no native GPU backlight device, or when it should not be used then
> >     (on x86) the helper will use the acpi_video_get_backlight_type() to
> >     determine which backlight-device should be used instead and it will
> find
> >     + mirror that one.
> >
> >
> >     Phase 3: Deprecate /sys/class/backlight uAPI
> >     ============================================
> >
> >     Once most userspace has moved over to using the new drm_connector
> >     brightness props, a Kconfig option can be added to stop exporting
> >     the backlight-devices under /sys/class/backlight. The plan is to
> >     just disable the sysfs interface and keep the existing
> backlight-device
> >     internal kernel abstraction as is, since some abstraction for (non
> GPU
> >     native) backlight devices will be necessary regardless.
> >
> >     An alternative to disabling the sysfs class entirely, would be
> >     to allow setting it to read-only through Kconfig.
> >
> >
> >     What scale to use for the drm_connector bl_brightness property?
> >     ===============================================================
> >
> >     The tricky part of this plan is phase 2 and then esp. defining what
> the
> >     new brightness properties will look like and how they will work.
> >
> >     The biggest challenge here is to decide on a fixed scale for the main
> >     brightness property, say 0-65535, using scaling where the actual hw
> scale
> >     is different, or if this should simply be a 1:1 mirror of the current
> >     backlight interface, with the actual hw scale / brightness_max value
> >     exposed as a drm_connector property.
> >
> >     1:1 advantages / 0-65535 disadvantages
> >     - Userspace will likely move over to the connector-props quite
> slowly and
> >       we can expect various userspace bits, esp. also custom user
> scripts, to
> >       keep using the old uAPI for a long time. Using the 2 APIs are
> intermixed
> >       is fine when using a 1:1 brightness scale mapping. But if we end
> up doing
> >       a scaling round-trip all the time then eventually the brightness
> is going
> >       do drift. This can even happen if the user never changes the
> brightness
> >       when userspace saves it over suspend/resume or reboots.
> >     - Almost all laptops have brightness up/down hotkeys. E.g GNOME
> decides
> >       on a step size for the hotkeys by doing min(brightness_max/20, 1).
> >       Some of the vendor specific backlight fw APIs (e.g. dell-laptop)
> have
> >       only 8 steps. When giving userspace the actual max_brightness
> value, then
> >       this will all work just fine. When hardcode brightness_max to
> 65535 OTOH
> >       then in this case GNOME will still give the user 20 steps where
> only 1
> >       in every 2-3 steps actually changes the brightness which IMHO is
> >       an unacceptably bad user experience.
> >
> >     0-65535 advantages / 1:1 disadvantages
> >     - Without a fixed scale for the brightness property the
> brightness_max
> >       value may change after an userspace application's initial
> enumeration
> >       of the drm_connector. This can happen when neither the native GPU
> nor
> >       the acpi_video backlight devices are present/usable in this case
> >       acpi_video_get_backlight_type() will _assume_ a vendor specific fw
> API
> >       will be used for backlight control and the driver proving the
> "vendor"
> >       backlight device will show up much later and may even never
> show-up,
> >       so waiting for it is not an option. With a fixed 0-65535 scale
> userspace
> >       can just always assume this and the drm_connector backlight props
> helper
> >       code can even cache writes and send it to the actual backlight
> device
> >       when it shows up. With a 1:1 mapping userspace needs to listen for
> >       a uevent and then update the brightness range on such an event.
> >
> >     I believe that the 1:1 mapping advantages out way the disadvantages
> >     here. Also note that current userspace already blindly assumes that
> >     all relevant drivers are loaded before the graphical-environment
> >     starts and all the desktop environments as such already only do
> >     a single scan of /sys/class/backlight when they start. So when
> >     userspace forgets to add code to listen for the uevent when switching
> >     to the new API nothing changes; and with the uevent userspace
> actually
> >     gets a good mechanism to detect backlight drivers loading after
> >     the graphical-environment has already started.
> >
> >     So based on this here is my proposal for a set of new brightness
> >     properties on the drm_connector object. Note these are all prefixed
> with
> >     bl which stands for backlight, which is technically not correct for
> OLED.
> >     But we need a prefix to avoid a name collision with the "brightness"
> >     attribute which is part of the existing TV specific properties and
> IMHO
> >     it is good to have a common prefix to make it clear that these all
> >     belong together.
> >
> >
> >     The drm_connector brightness properties
> >     =======================================
> >
> >     bl_brightness: rw 0-int32_max property controlling the brightness
> setting
> >     of the connected display. The actual maximum of this will be less
> then
> >     int32_max and is given in bl_brightness_max.
> >
> >     bl_brightness_max: ro 0-int32_max property giving the actual maximum
> >     of the display's brightness setting. This will report 0 when
> brightness
> >     control is not available (yet).
> >
> >     bl_brightness_0_is_min_brightness: ro, boolean
> >     When this is set to true then it is safe to set brightness to 0
> >     without worrying that this completely turns the backlight off causing
> >     the screen to become unreadable. When this is false setting
> brightness
> >     to 0 may turn the backlight off, but this is _not_ guaranteed.
> >     This will e.g. be true when directly driving a PWM and the video-BIOS
> >     has provided a minimum (non 0) duty-cycle below which the driver will
> >     never go.
> >
> >     bl_brightness_control_method: ro, enum, possible values:
> >     none:     The GPU driver expects brightness control to be provided
> by another
> >               driver and that driver has not loaded yet.
> >     unknown:  The underlying control mechanism is unknown.
> >     pwm:      The brightness property directly controls the duty-cycle
> of a PWM
> >               output.
> >     firmware: The brightness is controlled through firmware calls.
> >     DDC/CI:   The brightness is controlled through the DDC/CI protocol.
> >     gmux:     The brightness is controlled by the GMUX.
> >     Note this enum may be extended in the future, so other values may
> >     be read, these should be treated as "unknown".
> >
> >     When brightness control becomes available after being reported
> >     as not available before (bl_brightness_control_method=="none")
> >     a uevent with CONNECTOR=<connector-id> and
> >     PROPERTY=<bl_brightness_control_method-id> will be generated
> >     at this point all the properties must be re-read.
> >
> >     When/once brightness control is available then all the read-only
> >     properties are fixed and will never change.
> >
> >     Besides the "none" value for no driver having loaded yet,
> >     the different bl_brightness_control_method values are intended for
> >     (userspace) heuristics for such things as the brightness setting
> >     linearly controlling electrical power or setting perceived
> brightness.
> >
> >     Regards,
> >
> >     Hans
> >
> >
> >     1) The need to be able to map the backlight device to a specific
> display
> >     has become clear once more with the recent proposal to add DDCDI
> support:
> >
> https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/
> <
> https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/
> >
> >
> >     2)
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> <
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> >
> >     Note this proposal included a method for userspace to be able to
> tell the
> >     kernel if the native/acpi_video/vendor backlight device should be
> used,
> >     but this has been solved in the kernel for years now:
> >      https://www.spinics.net/lists/linux-acpi/msg50526.html <
> https://www.spinics.net/lists/linux-acpi/msg50526.html>
> >     An initial implementation of this proposal is available here:
> >      https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight <
> https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight>
> >
>
>

--00000000000055972f05e717a774
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps the Kconfig modifications could be postponed =
to stage 2</div><div>since for people running distros that suddenly decide =
to disable</div><div>/sys/class/backlight/ it may be impractical for them t=
o recompile</div><div>their kernels and such. Also stage 2 should probably =
take ~2 decades</div><div>until it comes into being, for reference fbdev SP=
ECIFIC drivers</div><div>were removed from fedora just recently and because=
 of that there</div><div>were some issues with some user&#39;s systems. I u=
nderstand it&#39;s much</div><div>easier to change from the /sys/class/back=
light/ interface to the one</div><div>you have proposed than to change from=
 fbdev to KMS though.<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 3:27 AM Hans de Goed=
e &lt;<a href=3D"mailto:hdegoede@redhat.com">hdegoede@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yusuf,<b=
r>
<br>
On 8/24/22 04:18, Yusuf Khan wrote:<br>
&gt; Sorry for the necro-bump, I hadnt seen this go by<br>
<br>
No problem.<br>
<br>
&gt; My main concern with this proposal is the phasing out of /sys/class/ba=
cklight/.<br>
&gt; Currently on the user(user, not userland) level its easier for me to j=
ust modify<br>
&gt; the file and be done with it. xbacklight doesnt tell me when its faile=
d,<br>
&gt; brightnessctl doesnt make assumptions about what device is what, and<b=
r>
&gt; other brightness setting applications ive seen are much worse than the=
m.<br>
&gt; Someone needs to create a userland application thats less inconvenient=
<br>
&gt; than `echo`ing into /sys/class/backlight with a name that human beings=
 can<br>
&gt; actually remember before I stop using the sysfs, perhaps &quot;setbrig=
htness&quot;<br>
&gt; could be the binary&#39;s name? Also I dont think its wise to disable =
or make it<br>
&gt; read only though Kconfig as older apps may depend on it, maybe add a<b=
r>
&gt; kernel param that disables the old interface so bigger distros can pre=
ssure<br>
&gt; app makers into changing the interface? As a big draw for DDC/CI is th=
at<br>
&gt; many displays support it as a way to change brightness(even if you are=
nt<br>
&gt; doing anything special that would break the old interface) perhaps it =
could<br>
&gt; be an early adopter to that kernel parameter?<br>
<br>
Right, so deprecating the /sys/class/backlight API definitely is the last<b=
r>
step and probably is years away. As you say hiding / making it read-only<br=
>
should probably be a kernel-parameter at first, with maybe a Kconfig<br>
option to set the default. So the depcration would go like this:<br>
<br>
1. Add:<br>
A kernel-parameter to allow hiding or read-only-ing the sysfs interface +<b=
r>
Kconfig to select the default +<br>
dev_warn_once() when the old API is used<br>
<br>
2. (much later) Drop the Kconfig option and default to hiding/read-only<br>
<br>
3. (even later) Maybe completely remove the sysfs interface?<br>
<br>
Note the hiding vs read-only thing is to be decided. ATM I&#39;m rather mor=
e<br>
focused on getting the new API in place then on deprecating the old one :)<=
br>
<br>
Anyways I fully agree that we need to do the deprecation carefully and<br>
slowly. This is likely going to take multiple years and then some ...<br>
<br>
Regards,<br>
<br>
Hans<br>
<br>
<br>
<br>
&gt; <br>
&gt; On Thu, Apr 7, 2022 at 10:39 AM Hans de Goede &lt;<a href=3D"mailto:hd=
egoede@redhat.com" target=3D"_blank">hdegoede@redhat.com</a> &lt;mailto:<a =
href=3D"mailto:hdegoede@redhat.com" target=3D"_blank">hdegoede@redhat.com</=
a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As discussed already several times in the past:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://www.x.org/wiki/Events/XDC2=
014/XDC2014GoedeBacklight/" rel=3D"noreferrer" target=3D"_blank">https://ww=
w.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/</a> &lt;<a href=3D"https=
://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBackli=
ght/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://lore.kernel.org/all/4b17ba=
08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c=
6@linux.intel.com/</a> &lt;<a href=3D"https://lore.kernel.org/all/4b17ba08-=
39f3-57dd-5aad-d37d844b02c6@linux.intel.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@li=
nux.intel.com/</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The current userspace API for brightness control of=
fered by<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/class/backlight devices has various issues, th=
e biggest 2 being:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01. There is no way to map the backlight device to a=
 specific<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0display-output / panel (1)<br>
&gt;=C2=A0 =C2=A0 =C2=A02. Controlling the brightness requires root-rights =
requiring<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0desktop-environments to use suid-root =
helpers for this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As already discussed on various conference&#39;s ha=
llway tracks<br>
&gt;=C2=A0 =C2=A0 =C2=A0and as has been proposed on the dri-devel list once=
 before (2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0it seems that there is consensus that the best way =
to to solve these<br>
&gt;=C2=A0 =C2=A0 =C2=A02 issues is to add support for controlling a video-=
output&#39;s brightness<br>
&gt;=C2=A0 =C2=A0 =C2=A0through properties on the drm_connector.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This RFC outlines my plan to try and actually imple=
ment this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which has 3 phases:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phase 1: Stop registering multiple /sys/class/backl=
ight devs for a single display<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On x86 there can be multiple firmware + direct-hw-a=
ccess methods<br>
&gt;=C2=A0 =C2=A0 =C2=A0for controlling the backlight and in some cases the=
 kernel registers<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiple backlight-devices for a single internal la=
ptop LCD panel:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0a) i915 and nouveau unconditionally register their =
&quot;native&quot; backlight dev<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0even on devices where /sys/class/backl=
ight/acpi_video0 must be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0to control the backlight, relying on u=
serspace to prefer the &quot;firmware&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0acpi_video0 device over &quot;native&q=
uot; devices.<br>
&gt;=C2=A0 =C2=A0 =C2=A0b) amdgpu and nouveau rely on the acpi_video driver=
 initializing before<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0them, which currently causes /sys/clas=
s/backlight/acpi_video0 to usually<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0show up and then they register their o=
wn native backlight driver after<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0which the drivers/acpi/video_detect.c =
code unregisters the acpi_video0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0device. This means that userspace brie=
fly sees 2 devices and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0disappearing of acpi_video0 after a br=
ief time confuses the systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0backlight level save/restore code, see=
 e.g.:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0<a href=3D"https://bbs.archlinux.org/v=
iewtopic.php?id=3D269920" rel=3D"noreferrer" target=3D"_blank">https://bbs.=
archlinux.org/viewtopic.php?id=3D269920</a> &lt;<a href=3D"https://bbs.arch=
linux.org/viewtopic.php?id=3D269920" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bbs.archlinux.org/viewtopic.php?id=3D269920</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I already have a pretty detailed plan to tackle thi=
s, which I will<br>
&gt;=C2=A0 =C2=A0 =C2=A0post in a separate RFC email. I plan to start worki=
ng on this right<br>
&gt;=C2=A0 =C2=A0 =C2=A0away, as it will be good to have this fixed regardl=
ess.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phase 2: Add drm_connector properties mirroring the=
 matching backlight device<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The plan is to add a drm_connector helper function,=
 which optionally takes<br>
&gt;=C2=A0 =C2=A0 =C2=A0a pointer to the backlight device for the GPU&#39;s=
 native backlight device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which will then mirror the backlight settings from =
the backlight device<br>
&gt;=C2=A0 =C2=A0 =C2=A0in a set of read/write brightness* properties on th=
e connector.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This function can then be called by GPU drivers for=
 the drm_connector for<br>
&gt;=C2=A0 =C2=A0 =C2=A0the internal panel and it will then take care of ev=
erything. When there<br>
&gt;=C2=A0 =C2=A0 =C2=A0is no native GPU backlight device, or when it shoul=
d not be used then<br>
&gt;=C2=A0 =C2=A0 =C2=A0(on x86) the helper will use the acpi_video_get_bac=
klight_type() to<br>
&gt;=C2=A0 =C2=A0 =C2=A0determine which backlight-device should be used ins=
tead and it will find<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ mirror that one.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phase 3: Deprecate /sys/class/backlight uAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Once most userspace has moved over to using the new=
 drm_connector<br>
&gt;=C2=A0 =C2=A0 =C2=A0brightness props, a Kconfig option can be added to =
stop exporting<br>
&gt;=C2=A0 =C2=A0 =C2=A0the backlight-devices under /sys/class/backlight. T=
he plan is to<br>
&gt;=C2=A0 =C2=A0 =C2=A0just disable the sysfs interface and keep the exist=
ing backlight-device<br>
&gt;=C2=A0 =C2=A0 =C2=A0internal kernel abstraction as is, since some abstr=
action for (non GPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0native) backlight devices will be necessary regardl=
ess.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0An alternative to disabling the sysfs class entirel=
y, would be<br>
&gt;=C2=A0 =C2=A0 =C2=A0to allow setting it to read-only through Kconfig.<b=
r>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What scale to use for the drm_connector bl_brightne=
ss property?<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The tricky part of this plan is phase 2 and then es=
p. defining what the<br>
&gt;=C2=A0 =C2=A0 =C2=A0new brightness properties will look like and how th=
ey will work.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The biggest challenge here is to decide on a fixed =
scale for the main<br>
&gt;=C2=A0 =C2=A0 =C2=A0brightness property, say 0-65535, using scaling whe=
re the actual hw scale<br>
&gt;=C2=A0 =C2=A0 =C2=A0is different, or if this should simply be a 1:1 mir=
ror of the current<br>
&gt;=C2=A0 =C2=A0 =C2=A0backlight interface, with the actual hw scale / bri=
ghtness_max value<br>
&gt;=C2=A0 =C2=A0 =C2=A0exposed as a drm_connector property.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01:1 advantages / 0-65535 disadvantages<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Userspace will likely move over to the connector-=
props quite slowly and<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 we can expect various userspace bits, esp. a=
lso custom user scripts, to<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 keep using the old uAPI for a long time. Usi=
ng the 2 APIs are intermixed<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 is fine when using a 1:1 brightness scale ma=
pping. But if we end up doing<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 a scaling round-trip all the time then event=
ually the brightness is going<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 do drift. This can even happen if the user n=
ever changes the brightness<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 when userspace saves it over suspend/resume =
or reboots.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Almost all laptops have brightness up/down hotkey=
s. E.g GNOME decides<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 on a step size for the hotkeys by doing min(=
brightness_max/20, 1).<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Some of the vendor specific backlight fw API=
s (e.g. dell-laptop) have<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 only 8 steps. When giving userspace the actu=
al max_brightness value, then<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 this will all work just fine. When hardcode =
brightness_max to 65535 OTOH<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 then in this case GNOME will still give the =
user 20 steps where only 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 in every 2-3 steps actually changes the brig=
htness which IMHO is<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 an unacceptably bad user experience.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A00-65535 advantages / 1:1 disadvantages<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Without a fixed scale for the brightness property=
 the brightness_max<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 value may change after an userspace applicat=
ion&#39;s initial enumeration<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 of the drm_connector. This can happen when n=
either the native GPU nor<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 the acpi_video backlight devices are present=
/usable in this case<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 acpi_video_get_backlight_type() will _assume=
_ a vendor specific fw API<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 will be used for backlight control and the d=
river proving the &quot;vendor&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 backlight device will show up much later and=
 may even never show-up,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 so waiting for it is not an option. With a f=
ixed 0-65535 scale userspace<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 can just always assume this and the drm_conn=
ector backlight props helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 code can even cache writes and send it to th=
e actual backlight device<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 when it shows up. With a 1:1 mapping userspa=
ce needs to listen for<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 a uevent and then update the brightness rang=
e on such an event.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I believe that the 1:1 mapping advantages out way t=
he disadvantages<br>
&gt;=C2=A0 =C2=A0 =C2=A0here. Also note that current userspace already blin=
dly assumes that<br>
&gt;=C2=A0 =C2=A0 =C2=A0all relevant drivers are loaded before the graphica=
l-environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0starts and all the desktop environments as such alr=
eady only do<br>
&gt;=C2=A0 =C2=A0 =C2=A0a single scan of /sys/class/backlight when they sta=
rt. So when<br>
&gt;=C2=A0 =C2=A0 =C2=A0userspace forgets to add code to listen for the uev=
ent when switching<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the new API nothing changes; and with the uevent=
 userspace actually<br>
&gt;=C2=A0 =C2=A0 =C2=A0gets a good mechanism to detect backlight drivers l=
oading after<br>
&gt;=C2=A0 =C2=A0 =C2=A0the graphical-environment has already started.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So based on this here is my proposal for a set of n=
ew brightness<br>
&gt;=C2=A0 =C2=A0 =C2=A0properties on the drm_connector object. Note these =
are all prefixed with<br>
&gt;=C2=A0 =C2=A0 =C2=A0bl which stands for backlight, which is technically=
 not correct for OLED.<br>
&gt;=C2=A0 =C2=A0 =C2=A0But we need a prefix to avoid a name collision with=
 the &quot;brightness&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0attribute which is part of the existing TV specific=
 properties and IMHO<br>
&gt;=C2=A0 =C2=A0 =C2=A0it is good to have a common prefix to make it clear=
 that these all<br>
&gt;=C2=A0 =C2=A0 =C2=A0belong together.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The drm_connector brightness properties<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0bl_brightness: rw 0-int32_max property controlling =
the brightness setting<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the connected display. The actual maximum of thi=
s will be less then<br>
&gt;=C2=A0 =C2=A0 =C2=A0int32_max and is given in bl_brightness_max.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0bl_brightness_max: ro 0-int32_max property giving t=
he actual maximum<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the display&#39;s brightness setting. This will =
report 0 when brightness<br>
&gt;=C2=A0 =C2=A0 =C2=A0control is not available (yet).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0bl_brightness_0_is_min_brightness: ro, boolean<br>
&gt;=C2=A0 =C2=A0 =C2=A0When this is set to true then it is safe to set bri=
ghtness to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0without worrying that this completely turns the bac=
klight off causing<br>
&gt;=C2=A0 =C2=A0 =C2=A0the screen to become unreadable. When this is false=
 setting brightness<br>
&gt;=C2=A0 =C2=A0 =C2=A0to 0 may turn the backlight off, but this is _not_ =
guaranteed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This will e.g. be true when directly driving a PWM =
and the video-BIOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0has provided a minimum (non 0) duty-cycle below whi=
ch the driver will<br>
&gt;=C2=A0 =C2=A0 =C2=A0never go.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0bl_brightness_control_method: ro, enum, possible va=
lues:<br>
&gt;=C2=A0 =C2=A0 =C2=A0none:=C2=A0 =C2=A0 =C2=A0The GPU driver expects bri=
ghtness control to be provided by another<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver and that =
driver has not loaded yet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0unknown:=C2=A0 The underlying control mechanism is =
unknown.<br>
&gt;=C2=A0 =C2=A0 =C2=A0pwm:=C2=A0 =C2=A0 =C2=A0 The brightness property di=
rectly controls the duty-cycle of a PWM<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0firmware: The brightness is controlled through firm=
ware calls.<br>
&gt;=C2=A0 =C2=A0 =C2=A0DDC/CI:=C2=A0 =C2=A0The brightness is controlled th=
rough the DDC/CI protocol.<br>
&gt;=C2=A0 =C2=A0 =C2=A0gmux:=C2=A0 =C2=A0 =C2=A0The brightness is controll=
ed by the GMUX.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Note this enum may be extended in the future, so ot=
her values may<br>
&gt;=C2=A0 =C2=A0 =C2=A0be read, these should be treated as &quot;unknown&q=
uot;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When brightness control becomes available after bei=
ng reported<br>
&gt;=C2=A0 =C2=A0 =C2=A0as not available before (bl_brightness_control_meth=
od=3D=3D&quot;none&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0a uevent with CONNECTOR=3D&lt;connector-id&gt; and<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0PROPERTY=3D&lt;bl_brightness_control_method-id&gt; =
will be generated<br>
&gt;=C2=A0 =C2=A0 =C2=A0at this point all the properties must be re-read.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When/once brightness control is available then all =
the read-only<br>
&gt;=C2=A0 =C2=A0 =C2=A0properties are fixed and will never change.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Besides the &quot;none&quot; value for no driver ha=
ving loaded yet,<br>
&gt;=C2=A0 =C2=A0 =C2=A0the different bl_brightness_control_method values a=
re intended for<br>
&gt;=C2=A0 =C2=A0 =C2=A0(userspace) heuristics for such things as the brigh=
tness setting<br>
&gt;=C2=A0 =C2=A0 =C2=A0linearly controlling electrical power or setting pe=
rceived brightness.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hans<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01) The need to be able to map the backlight device =
to a specific display<br>
&gt;=C2=A0 =C2=A0 =C2=A0has become clear once more with the recent proposal=
 to add DDCDI support:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/lkml/20220403230=
850.2986-1-yusisamerican@gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/<=
/a> &lt;<a href=3D"https://lore.kernel.org/lkml/20220403230850.2986-1-yusis=
american@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02) <a href=3D"https://lore.kernel.org/all/4b17ba08-=
39f3-57dd-5aad-d37d844b02c6@linux.intel.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@li=
nux.intel.com/</a> &lt;<a href=3D"https://lore.kernel.org/all/4b17ba08-39f3=
-57dd-5aad-d37d844b02c6@linux.intel.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.=
intel.com/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Note this proposal included a method for userspace =
to be able to tell the<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel if the native/acpi_video/vendor backlight de=
vice should be used,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but this has been solved in the kernel for years no=
w:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://www.spinics.net/lists/linu=
x-acpi/msg50526.html" rel=3D"noreferrer" target=3D"_blank">https://www.spin=
ics.net/lists/linux-acpi/msg50526.html</a> &lt;<a href=3D"https://www.spini=
cs.net/lists/linux-acpi/msg50526.html" rel=3D"noreferrer" target=3D"_blank"=
>https://www.spinics.net/lists/linux-acpi/msg50526.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0An initial implementation of this proposal is avail=
able here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://cgit.freedesktop.org/~mper=
es/linux/log/?h=3Dbacklight" rel=3D"noreferrer" target=3D"_blank">https://c=
git.freedesktop.org/~mperes/linux/log/?h=3Dbacklight</a> &lt;<a href=3D"htt=
ps://cgit.freedesktop.org/~mperes/linux/log/?h=3Dbacklight" rel=3D"noreferr=
er" target=3D"_blank">https://cgit.freedesktop.org/~mperes/linux/log/?h=3Db=
acklight</a>&gt;<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000055972f05e717a774--
