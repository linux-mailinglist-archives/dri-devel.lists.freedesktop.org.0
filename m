Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B259F455
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53B9112AAE;
	Wed, 24 Aug 2022 07:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC24D113505;
 Wed, 24 Aug 2022 02:27:43 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d18-20020a9d72d2000000b0063934f06268so4228983otk.0; 
 Tue, 23 Aug 2022 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6SKAn+C8j5jzuLIv9QHI/zynkaPAQ4t72rgE7cIfgz8=;
 b=HAI04rdWwqdtHRf7BJhOCEuUloi5lKB8KI4Otv905umCKByTLU6WPq1csdk0o0LAlf
 FdbTOdemULx1SGhauWZWDuVx2I+Zj9Nue6iJFZVTaYnFkOtwBRqHgEynKMoX5K6mmlLQ
 3cWcGuXFuCFFSaDjyj9u8ffGKjw4E1CnH8nwsUfPlI+d+FPJ4Nx6KGGiHKxh8AsZn9AU
 p31CY8SkG8xyc9AoXb5OFWRUc1VCfuf/A9+aZPhijpyJdeELtVpZgRud4p/LuermZbEw
 YYzati2mub3JPJybfc3Rn7MWHxzzyGZw/6TM38hKVEQTIAmoKZqv47Nav1jbL0TTvhK6
 P7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6SKAn+C8j5jzuLIv9QHI/zynkaPAQ4t72rgE7cIfgz8=;
 b=cR+wA2ycwx1sKuFbP6eESM7ARONuaauNqB6HyMlY0ItIn8wzP0I5WS5lQD6AMFxpj0
 E0WSOBLCpxnq/5ThIPt/mmgULA4LlTC9VHH+HZQn0HZUbdv0/kXUP7n4gQEU8HzalF82
 PVPNV0GF9Ua3woDVxoIuu+Mqp105OXqjjG88B1mw8nXlpOeEGN18vC61NRcWtJeIAs96
 GH1erlHt1bRNqTQm2MItHiytAD235HIONbzUVF50SLbJsLOHPUF9N/Wq6lcepcb04zZm
 ithF6FRqGzmI23L4ZSD672ue+sChJyJ1J16cqe4S6C5+UQgHl25gkHLJ/J+gpcfn+LyB
 wNfg==
X-Gm-Message-State: ACgBeo28uqwSexnhqA0D9Hoz2xtWXcoOfWNUU0mUNvEUHjz4Nqog6dNr
 vlBIEr0L6sonjwHMHb/JNcF3z0L837S+8/4IJqmh6m0a5vQ=
X-Google-Smtp-Source: AA6agR4JV8dPbLYBjigCZKb2mcs27VBmu/wHP7AR6A38eurrq0J2fpcGAUt97ZJANUM7m8046gUJQT/E8eIE1FO5dBU=
X-Received: by 2002:a81:4308:0:b0:33d:a3e1:4bdd with SMTP id
 q8-20020a814308000000b0033da3e14bddmr903156ywa.252.1661307542468; Tue, 23 Aug
 2022 19:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
In-Reply-To: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
From: Yusuf Khan <yusisamerican@gmail.com>
Date: Tue, 23 Aug 2022 21:18:51 -0500
Message-ID: <CAJoG2+8a9edJOx85DqH1oAd97cgY=_SaRT8_qEssjDtuObbA=g@mail.gmail.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ee7ca705e6f34d14"
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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

--000000000000ee7ca705e6f34d14
Content-Type: text/plain; charset="UTF-8"

Sorry for the necro-bump, I hadnt seen this go by

My main concern with this proposal is the phasing out of
/sys/class/backlight/.
Currently on the user(user, not userland) level its easier for me to just
modify
the file and be done with it. xbacklight doesnt tell me when its failed,
brightnessctl doesnt make assumptions about what device is what, and
other brightness setting applications ive seen are much worse than them.
Someone needs to create a userland application thats less inconvenient
than `echo`ing into /sys/class/backlight with a name that human beings can
actually remember before I stop using the sysfs, perhaps "setbrightness"
could be the binary's name? Also I dont think its wise to disable or make it
read only though Kconfig as older apps may depend on it, maybe add a
kernel param that disables the old interface so bigger distros can pressure
app makers into changing the interface? As a big draw for DDC/CI is that
many displays support it as a way to change brightness(even if you arent
doing anything special that would break the old interface) perhaps it could
be an early adopter to that kernel parameter?

On Thu, Apr 7, 2022 at 10:39 AM Hans de Goede <hdegoede@redhat.com> wrote:

> As discussed already several times in the past:
>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>
> The current userspace API for brightness control offered by
> /sys/class/backlight devices has various issues, the biggest 2 being:
>
> 1. There is no way to map the backlight device to a specific
>    display-output / panel (1)
> 2. Controlling the brightness requires root-rights requiring
>    desktop-environments to use suid-root helpers for this.
>
> As already discussed on various conference's hallway tracks
> and as has been proposed on the dri-devel list once before (2),
> it seems that there is consensus that the best way to to solve these
> 2 issues is to add support for controlling a video-output's brightness
> through properties on the drm_connector.
>
> This RFC outlines my plan to try and actually implement this,
> which has 3 phases:
>
>
> Phase 1: Stop registering multiple /sys/class/backlight devs for a single
> display
>
> =================================================================================
>
> On x86 there can be multiple firmware + direct-hw-access methods
> for controlling the backlight and in some cases the kernel registers
> multiple backlight-devices for a single internal laptop LCD panel:
>
> a) i915 and nouveau unconditionally register their "native" backlight dev
>    even on devices where /sys/class/backlight/acpi_video0 must be used
>    to control the backlight, relying on userspace to prefer the "firmware"
>    acpi_video0 device over "native" devices.
> b) amdgpu and nouveau rely on the acpi_video driver initializing before
>    them, which currently causes /sys/class/backlight/acpi_video0 to usually
>    show up and then they register their own native backlight driver after
>    which the drivers/acpi/video_detect.c code unregisters the acpi_video0
>    device. This means that userspace briefly sees 2 devices and the
>    disappearing of acpi_video0 after a brief time confuses the systemd
>    backlight level save/restore code, see e.g.:
>    https://bbs.archlinux.org/viewtopic.php?id=269920
>
> I already have a pretty detailed plan to tackle this, which I will
> post in a separate RFC email. I plan to start working on this right
> away, as it will be good to have this fixed regardless.
>
>
> Phase 2: Add drm_connector properties mirroring the matching backlight
> device
>
> =============================================================================
>
> The plan is to add a drm_connector helper function, which optionally takes
> a pointer to the backlight device for the GPU's native backlight device,
> which will then mirror the backlight settings from the backlight device
> in a set of read/write brightness* properties on the connector.
>
> This function can then be called by GPU drivers for the drm_connector for
> the internal panel and it will then take care of everything. When there
> is no native GPU backlight device, or when it should not be used then
> (on x86) the helper will use the acpi_video_get_backlight_type() to
> determine which backlight-device should be used instead and it will find
> + mirror that one.
>
>
> Phase 3: Deprecate /sys/class/backlight uAPI
> ============================================
>
> Once most userspace has moved over to using the new drm_connector
> brightness props, a Kconfig option can be added to stop exporting
> the backlight-devices under /sys/class/backlight. The plan is to
> just disable the sysfs interface and keep the existing backlight-device
> internal kernel abstraction as is, since some abstraction for (non GPU
> native) backlight devices will be necessary regardless.
>
> An alternative to disabling the sysfs class entirely, would be
> to allow setting it to read-only through Kconfig.
>
>
> What scale to use for the drm_connector bl_brightness property?
> ===============================================================
>
> The tricky part of this plan is phase 2 and then esp. defining what the
> new brightness properties will look like and how they will work.
>
> The biggest challenge here is to decide on a fixed scale for the main
> brightness property, say 0-65535, using scaling where the actual hw scale
> is different, or if this should simply be a 1:1 mirror of the current
> backlight interface, with the actual hw scale / brightness_max value
> exposed as a drm_connector property.
>
> 1:1 advantages / 0-65535 disadvantages
> - Userspace will likely move over to the connector-props quite slowly and
>   we can expect various userspace bits, esp. also custom user scripts, to
>   keep using the old uAPI for a long time. Using the 2 APIs are intermixed
>   is fine when using a 1:1 brightness scale mapping. But if we end up doing
>   a scaling round-trip all the time then eventually the brightness is going
>   do drift. This can even happen if the user never changes the brightness
>   when userspace saves it over suspend/resume or reboots.
> - Almost all laptops have brightness up/down hotkeys. E.g GNOME decides
>   on a step size for the hotkeys by doing min(brightness_max/20, 1).
>   Some of the vendor specific backlight fw APIs (e.g. dell-laptop) have
>   only 8 steps. When giving userspace the actual max_brightness value, then
>   this will all work just fine. When hardcode brightness_max to 65535 OTOH
>   then in this case GNOME will still give the user 20 steps where only 1
>   in every 2-3 steps actually changes the brightness which IMHO is
>   an unacceptably bad user experience.
>
> 0-65535 advantages / 1:1 disadvantages
> - Without a fixed scale for the brightness property the brightness_max
>   value may change after an userspace application's initial enumeration
>   of the drm_connector. This can happen when neither the native GPU nor
>   the acpi_video backlight devices are present/usable in this case
>   acpi_video_get_backlight_type() will _assume_ a vendor specific fw API
>   will be used for backlight control and the driver proving the "vendor"
>   backlight device will show up much later and may even never show-up,
>   so waiting for it is not an option. With a fixed 0-65535 scale userspace
>   can just always assume this and the drm_connector backlight props helper
>   code can even cache writes and send it to the actual backlight device
>   when it shows up. With a 1:1 mapping userspace needs to listen for
>   a uevent and then update the brightness range on such an event.
>
> I believe that the 1:1 mapping advantages out way the disadvantages
> here. Also note that current userspace already blindly assumes that
> all relevant drivers are loaded before the graphical-environment
> starts and all the desktop environments as such already only do
> a single scan of /sys/class/backlight when they start. So when
> userspace forgets to add code to listen for the uevent when switching
> to the new API nothing changes; and with the uevent userspace actually
> gets a good mechanism to detect backlight drivers loading after
> the graphical-environment has already started.
>
> So based on this here is my proposal for a set of new brightness
> properties on the drm_connector object. Note these are all prefixed with
> bl which stands for backlight, which is technically not correct for OLED.
> But we need a prefix to avoid a name collision with the "brightness"
> attribute which is part of the existing TV specific properties and IMHO
> it is good to have a common prefix to make it clear that these all
> belong together.
>
>
> The drm_connector brightness properties
> =======================================
>
> bl_brightness: rw 0-int32_max property controlling the brightness setting
> of the connected display. The actual maximum of this will be less then
> int32_max and is given in bl_brightness_max.
>
> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> of the display's brightness setting. This will report 0 when brightness
> control is not available (yet).
>
> bl_brightness_0_is_min_brightness: ro, boolean
> When this is set to true then it is safe to set brightness to 0
> without worrying that this completely turns the backlight off causing
> the screen to become unreadable. When this is false setting brightness
> to 0 may turn the backlight off, but this is _not_ guaranteed.
> This will e.g. be true when directly driving a PWM and the video-BIOS
> has provided a minimum (non 0) duty-cycle below which the driver will
> never go.
>
> bl_brightness_control_method: ro, enum, possible values:
> none:     The GPU driver expects brightness control to be provided by
> another
>           driver and that driver has not loaded yet.
> unknown:  The underlying control mechanism is unknown.
> pwm:      The brightness property directly controls the duty-cycle of a PWM
>           output.
> firmware: The brightness is controlled through firmware calls.
> DDC/CI:   The brightness is controlled through the DDC/CI protocol.
> gmux:     The brightness is controlled by the GMUX.
> Note this enum may be extended in the future, so other values may
> be read, these should be treated as "unknown".
>
> When brightness control becomes available after being reported
> as not available before (bl_brightness_control_method=="none")
> a uevent with CONNECTOR=<connector-id> and
> PROPERTY=<bl_brightness_control_method-id> will be generated
> at this point all the properties must be re-read.
>
> When/once brightness control is available then all the read-only
> properties are fixed and will never change.
>
> Besides the "none" value for no driver having loaded yet,
> the different bl_brightness_control_method values are intended for
> (userspace) heuristics for such things as the brightness setting
> linearly controlling electrical power or setting perceived brightness.
>
> Regards,
>
> Hans
>
>
> 1) The need to be able to map the backlight device to a specific display
> has become clear once more with the recent proposal to add DDCDI support:
> https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/
>
> 2)
> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> Note this proposal included a method for userspace to be able to tell the
> kernel if the native/acpi_video/vendor backlight device should be used,
> but this has been solved in the kernel for years now:
>  https://www.spinics.net/lists/linux-acpi/msg50526.html
> An initial implementation of this proposal is available here:
>  https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight
>
>

--000000000000ee7ca705e6f34d14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Sorry for the necro-bump, I hadnt seen th=
is go by<br><br><div>My main concern with this proposal is the phasing out =
of /sys/class/backlight/.</div><div>Currently on the user(user, not userlan=
d) level its easier for me to just modify</div><div>the file and be done wi=
th it. xbacklight doesnt tell me when its failed,</div><div><span class=3D"=
gmail-co4"></span>brightnessctl doesnt make assumptions about what device i=
s what, and</div><div>other brightness setting applications ive seen are mu=
ch worse than them.</div><div>Someone needs to create a userland applicatio=
n thats less inconvenient</div><div>than `echo`ing into /sys/class/backligh=
t with a name that human beings can</div><div>actually remember before I st=
op using the sysfs, perhaps &quot;setbrightness&quot;</div><div>could be th=
e binary&#39;s name? Also I dont think its wise to disable or make it</div>=
<div>read only though Kconfig as older apps may depend on it, maybe add a</=
div><div>kernel param that disables the old interface so bigger distros can=
 pressure</div><div>app makers into changing the interface? As a big draw f=
or DDC/CI is that</div><div>many displays support it as a way to change bri=
ghtness(even if you arent</div><div>doing anything special that would break=
 the old interface) perhaps it could</div><div>be an early adopter to that =
kernel parameter?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Apr 7, 2022 at 10:39 AM Hans de Goede &l=
t;<a href=3D"mailto:hdegoede@redhat.com">hdegoede@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">As discussed al=
ready several times in the past:<br>
=C2=A0<a href=3D"https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBackligh=
t/" rel=3D"noreferrer" target=3D"_blank">https://www.x.org/wiki/Events/XDC2=
014/XDC2014GoedeBacklight/</a><br>
=C2=A0<a href=3D"https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d84=
4b02c6@linux.intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/</a><br=
>
<br>
The current userspace API for brightness control offered by<br>
/sys/class/backlight devices has various issues, the biggest 2 being:<br>
<br>
1. There is no way to map the backlight device to a specific<br>
=C2=A0 =C2=A0display-output / panel (1)<br>
2. Controlling the brightness requires root-rights requiring<br>
=C2=A0 =C2=A0desktop-environments to use suid-root helpers for this.<br>
<br>
As already discussed on various conference&#39;s hallway tracks<br>
and as has been proposed on the dri-devel list once before (2),<br>
it seems that there is consensus that the best way to to solve these<br>
2 issues is to add support for controlling a video-output&#39;s brightness<=
br>
through properties on the drm_connector.<br>
<br>
This RFC outlines my plan to try and actually implement this,<br>
which has 3 phases:<br>
<br>
<br>
Phase 1: Stop registering multiple /sys/class/backlight devs for a single d=
isplay<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
<br>
On x86 there can be multiple firmware + direct-hw-access methods<br>
for controlling the backlight and in some cases the kernel registers<br>
multiple backlight-devices for a single internal laptop LCD panel:<br>
<br>
a) i915 and nouveau unconditionally register their &quot;native&quot; backl=
ight dev<br>
=C2=A0 =C2=A0even on devices where /sys/class/backlight/acpi_video0 must be=
 used<br>
=C2=A0 =C2=A0to control the backlight, relying on userspace to prefer the &=
quot;firmware&quot;<br>
=C2=A0 =C2=A0acpi_video0 device over &quot;native&quot; devices.<br>
b) amdgpu and nouveau rely on the acpi_video driver initializing before<br>
=C2=A0 =C2=A0them, which currently causes /sys/class/backlight/acpi_video0 =
to usually<br>
=C2=A0 =C2=A0show up and then they register their own native backlight driv=
er after<br>
=C2=A0 =C2=A0which the drivers/acpi/video_detect.c code unregisters the acp=
i_video0<br>
=C2=A0 =C2=A0device. This means that userspace briefly sees 2 devices and t=
he<br>
=C2=A0 =C2=A0disappearing of acpi_video0 after a brief time confuses the sy=
stemd<br>
=C2=A0 =C2=A0backlight level save/restore code, see e.g.:<br>
=C2=A0 =C2=A0<a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D269920=
" rel=3D"noreferrer" target=3D"_blank">https://bbs.archlinux.org/viewtopic.=
php?id=3D269920</a><br>
<br>
I already have a pretty detailed plan to tackle this, which I will<br>
post in a separate RFC email. I plan to start working on this right<br>
away, as it will be good to have this fixed regardless.<br>
<br>
<br>
Phase 2: Add drm_connector properties mirroring the matching backlight devi=
ce<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
<br>
The plan is to add a drm_connector helper function, which optionally takes<=
br>
a pointer to the backlight device for the GPU&#39;s native backlight device=
,<br>
which will then mirror the backlight settings from the backlight device<br>
in a set of read/write brightness* properties on the connector.<br>
<br>
This function can then be called by GPU drivers for the drm_connector for<b=
r>
the internal panel and it will then take care of everything. When there<br>
is no native GPU backlight device, or when it should not be used then<br>
(on x86) the helper will use the acpi_video_get_backlight_type() to<br>
determine which backlight-device should be used instead and it will find<br=
>
+ mirror that one.<br>
<br>
<br>
Phase 3: Deprecate /sys/class/backlight uAPI<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Once most userspace has moved over to using the new drm_connector<br>
brightness props, a Kconfig option can be added to stop exporting<br>
the backlight-devices under /sys/class/backlight. The plan is to<br>
just disable the sysfs interface and keep the existing backlight-device<br>
internal kernel abstraction as is, since some abstraction for (non GPU<br>
native) backlight devices will be necessary regardless.<br>
<br>
An alternative to disabling the sysfs class entirely, would be<br>
to allow setting it to read-only through Kconfig.<br>
<br>
<br>
What scale to use for the drm_connector bl_brightness property?<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
The tricky part of this plan is phase 2 and then esp. defining what the<br>
new brightness properties will look like and how they will work.<br>
<br>
The biggest challenge here is to decide on a fixed scale for the main<br>
brightness property, say 0-65535, using scaling where the actual hw scale<b=
r>
is different, or if this should simply be a 1:1 mirror of the current<br>
backlight interface, with the actual hw scale / brightness_max value<br>
exposed as a drm_connector property.<br>
<br>
1:1 advantages / 0-65535 disadvantages<br>
- Userspace will likely move over to the connector-props quite slowly and<b=
r>
=C2=A0 we can expect various userspace bits, esp. also custom user scripts,=
 to<br>
=C2=A0 keep using the old uAPI for a long time. Using the 2 APIs are interm=
ixed<br>
=C2=A0 is fine when using a 1:1 brightness scale mapping. But if we end up =
doing<br>
=C2=A0 a scaling round-trip all the time then eventually the brightness is =
going<br>
=C2=A0 do drift. This can even happen if the user never changes the brightn=
ess<br>
=C2=A0 when userspace saves it over suspend/resume or reboots.<br>
- Almost all laptops have brightness up/down hotkeys. E.g GNOME decides<br>
=C2=A0 on a step size for the hotkeys by doing min(brightness_max/20, 1).<b=
r>
=C2=A0 Some of the vendor specific backlight fw APIs (e.g. dell-laptop) hav=
e<br>
=C2=A0 only 8 steps. When giving userspace the actual max_brightness value,=
 then<br>
=C2=A0 this will all work just fine. When hardcode brightness_max to 65535 =
OTOH<br>
=C2=A0 then in this case GNOME will still give the user 20 steps where only=
 1<br>
=C2=A0 in every 2-3 steps actually changes the brightness which IMHO is<br>
=C2=A0 an unacceptably bad user experience.<br>
<br>
0-65535 advantages / 1:1 disadvantages<br>
- Without a fixed scale for the brightness property the brightness_max<br>
=C2=A0 value may change after an userspace application&#39;s initial enumer=
ation<br>
=C2=A0 of the drm_connector. This can happen when neither the native GPU no=
r<br>
=C2=A0 the acpi_video backlight devices are present/usable in this case<br>
=C2=A0 acpi_video_get_backlight_type() will _assume_ a vendor specific fw A=
PI<br>
=C2=A0 will be used for backlight control and the driver proving the &quot;=
vendor&quot;<br>
=C2=A0 backlight device will show up much later and may even never show-up,=
<br>
=C2=A0 so waiting for it is not an option. With a fixed 0-65535 scale users=
pace<br>
=C2=A0 can just always assume this and the drm_connector backlight props he=
lper<br>
=C2=A0 code can even cache writes and send it to the actual backlight devic=
e<br>
=C2=A0 when it shows up. With a 1:1 mapping userspace needs to listen for<b=
r>
=C2=A0 a uevent and then update the brightness range on such an event.<br>
<br>
I believe that the 1:1 mapping advantages out way the disadvantages<br>
here. Also note that current userspace already blindly assumes that<br>
all relevant drivers are loaded before the graphical-environment<br>
starts and all the desktop environments as such already only do<br>
a single scan of /sys/class/backlight when they start. So when<br>
userspace forgets to add code to listen for the uevent when switching<br>
to the new API nothing changes; and with the uevent userspace actually<br>
gets a good mechanism to detect backlight drivers loading after<br>
the graphical-environment has already started.<br>
<br>
So based on this here is my proposal for a set of new brightness<br>
properties on the drm_connector object. Note these are all prefixed with<br=
>
bl which stands for backlight, which is technically not correct for OLED.<b=
r>
But we need a prefix to avoid a name collision with the &quot;brightness&qu=
ot;<br>
attribute which is part of the existing TV specific properties and IMHO<br>
it is good to have a common prefix to make it clear that these all<br>
belong together.<br>
<br>
<br>
The drm_connector brightness properties<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
bl_brightness: rw 0-int32_max property controlling the brightness setting<b=
r>
of the connected display. The actual maximum of this will be less then<br>
int32_max and is given in bl_brightness_max.<br>
<br>
bl_brightness_max: ro 0-int32_max property giving the actual maximum<br>
of the display&#39;s brightness setting. This will report 0 when brightness=
<br>
control is not available (yet).<br>
<br>
bl_brightness_0_is_min_brightness: ro, boolean<br>
When this is set to true then it is safe to set brightness to 0<br>
without worrying that this completely turns the backlight off causing<br>
the screen to become unreadable. When this is false setting brightness<br>
to 0 may turn the backlight off, but this is _not_ guaranteed.<br>
This will e.g. be true when directly driving a PWM and the video-BIOS<br>
has provided a minimum (non 0) duty-cycle below which the driver will<br>
never go.<br>
<br>
bl_brightness_control_method: ro, enum, possible values:<br>
none:=C2=A0 =C2=A0 =C2=A0The GPU driver expects brightness control to be pr=
ovided by another<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver and that driver has not loaded ye=
t.<br>
unknown:=C2=A0 The underlying control mechanism is unknown.<br>
pwm:=C2=A0 =C2=A0 =C2=A0 The brightness property directly controls the duty=
-cycle of a PWM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output.<br>
firmware: The brightness is controlled through firmware calls.<br>
DDC/CI:=C2=A0 =C2=A0The brightness is controlled through the DDC/CI protoco=
l.<br>
gmux:=C2=A0 =C2=A0 =C2=A0The brightness is controlled by the GMUX.<br>
Note this enum may be extended in the future, so other values may<br>
be read, these should be treated as &quot;unknown&quot;.<br>
<br>
When brightness control becomes available after being reported<br>
as not available before (bl_brightness_control_method=3D=3D&quot;none&quot;=
)<br>
a uevent with CONNECTOR=3D&lt;connector-id&gt; and<br>
PROPERTY=3D&lt;bl_brightness_control_method-id&gt; will be generated<br>
at this point all the properties must be re-read.<br>
<br>
When/once brightness control is available then all the read-only<br>
properties are fixed and will never change.<br>
<br>
Besides the &quot;none&quot; value for no driver having loaded yet,<br>
the different bl_brightness_control_method values are intended for<br>
(userspace) heuristics for such things as the brightness setting<br>
linearly controlling electrical power or setting perceived brightness.<br>
<br>
Regards,<br>
<br>
Hans<br>
<br>
<br>
1) The need to be able to map the backlight device to a specific display<br=
>
has become clear once more with the recent proposal to add DDCDI support:<b=
r>
<a href=3D"https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican=
@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/l=
kml/20220403230850.2986-1-yusisamerican@gmail.com/</a><br>
<br>
2) <a href=3D"https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b0=
2c6@linux.intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/</a><br>
Note this proposal included a method for userspace to be able to tell the<b=
r>
kernel if the native/acpi_video/vendor backlight device should be used,<br>
but this has been solved in the kernel for years now:<br>
=C2=A0<a href=3D"https://www.spinics.net/lists/linux-acpi/msg50526.html" re=
l=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-acpi=
/msg50526.html</a><br>
An initial implementation of this proposal is available here:<br>
=C2=A0<a href=3D"https://cgit.freedesktop.org/~mperes/linux/log/?h=3Dbackli=
ght" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/~mpe=
res/linux/log/?h=3Dbacklight</a><br>
<br>
</blockquote></div></div>

--000000000000ee7ca705e6f34d14--
