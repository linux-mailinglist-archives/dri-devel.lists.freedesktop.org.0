Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60694358061
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151A56EA50;
	Thu,  8 Apr 2021 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1254F6EA50
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:14:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id d191so919709wmd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SVabUpYxndN1LScKEDsT27SUWhIabcV7OkTxb4iccuo=;
 b=DmUbM9hswVfxw+gvjfc51Wv3OMrQ4BT8su2AD6l2o67VoOd94Pl3jt/6IEqcGkHIDk
 LXfLTltM7I+cY7I0Y35crHZDtXJY8BvFhuMI1JZzPOn1wU0p1pNhgDEEOgGMO0pQwB69
 9SBMXapjDm/29QF1s087lhz7Ht8d2VnE1id4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SVabUpYxndN1LScKEDsT27SUWhIabcV7OkTxb4iccuo=;
 b=p6S/EQV72OqxPa5FnzbgQnIQouyofEdccCH6YSmlq2u+0voDJtwvIBPNl7sqh5cBhg
 DV8SddEnGcLsi/4KvSLiyyj4Af7GJogjG4n7YRLseUmX+YDO3zY62K79aDysNXuNVmtT
 IHGOHRAalaBl81bmxn9zYQtcZ5o0gjykmhd9CEaYjSbI0Dt0FR68akOSEfSxuARPLiqD
 S+I5YSnNDmhK748SZEpPhwRWkPtyzxhYviSf4Yc+RZ7017LeL+aquQ2ZWst2j8Y966NS
 YLClIGoTpmdzC8L7pP3c4nFjs+tjB5stOFtW0Y52KzGxsV7m4vGeaCVXw1mflutd9zBA
 6sZw==
X-Gm-Message-State: AOAM530t8cVvhS9qIcGAc0Xy4R0NrM57ZyxNjzeMA3JwaySttPUQE5cB
 ieYWt7Hh65odxHrIE7rKL6lJeA==
X-Google-Smtp-Source: ABdhPJykRXPni68fCevCvIO69q0vJhr1Sv4Y/x1XmMP/9EMSzeyaJ2jDp6GtRlgtaZ5xzqyaZVoKZw==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2415285wmq.65.1617876849566; 
 Thu, 08 Apr 2021 03:14:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b66sm12654388wmb.48.2021.04.08.03.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:14:08 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:14:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YG7XbhSDIRyHzvL2@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
 <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
 <b2d6798f-1f7e-6fd4-eefd-b7bb4f080973@suse.de>
 <1cd551c4-579c-0ce5-d410-fcf2a2c949f6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd551c4-579c-0ce5-d410-fcf2a2c949f6@redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: bluescreen_avenger@verizon.net, Thomas Zimmermann <tzimmermann@suse.de>,
 geert+renesas@glider.be, corbet@lwn.net, airlied@linux.ie,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, broonie@kernel.org,
 kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 10:34:12AM +0200, Hans de Goede wrote:
> Hi,
> =

> On 3/30/21 9:09 AM, Thomas Zimmermann wrote:
> > Hi
> > =

> > Am 29.03.21 um 16:50 schrieb Hans de Goede:
> >> Hi,
> >>
> >> On 3/29/21 2:31 PM, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 25.03.21 um 12:29 schrieb Hans de Goede:
> >>>> Hi,
> >>>>
> >>>> On 3/18/21 11:29 AM, Thomas Zimmermann wrote:
> >>>>> This patchset adds support for simple-framebuffer platform devices =
and
> >>>>> a handover mechanism for native drivers to take-over control of the
> >>>>> hardware.
> >>>>>
> >>>>> The new driver, called simpledrm, binds to a simple-frambuffer plat=
form
> >>>>> device. The kernel's boot code creates such devices for firmware-pr=
ovided
> >>>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or =
boot
> >>>>> loader sets up the framebuffers. Description via device tree is als=
o an
> >>>>> option.
> >>>>>
> >>>>> Simpledrm is small enough to be linked into the kernel. The driver'=
s main
> >>>>> purpose is to provide graphical output during the early phases of t=
he boot
> >>>>> process, before the native DRM drivers are available. Native driver=
s are
> >>>>> typically loaded from an initrd ram disk. Occationally simpledrm ca=
n also
> >>>>> serve as interim solution on graphics hardware without native DRM d=
river.
> >>>>>
> >>>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> >>>>> simplefb, for early-boot graphical output. However fbdev is depreca=
ted and
> >>>>> the drivers do not provide DRM interfaces for modern userspace.
> >>>>>
> >>>>> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
> >>>>>
> >>>>> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
> >>>>> framebuffer's I/O-memory range and provides a callback function to =
be
> >>>>> removed by a native driver. The native driver will remove simpledrm=
 before
> >>>>> taking over the hardware. The removal is integrated into existing h=
elpers,
> >>>>> so drivers use it automatically.
> >>>>>
> >>>>> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM =
helpers
> >>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. =
During
> >>>>> pageflips, SHMEM buffers are copied into the framebuffer memory, si=
milar
> >>>>> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
> >>>>> regulators. It's based on the simplefb drivers, but has been modifi=
ed for
> >>>>> DRM.
> >>>>
> >>>> Thank you for your work on this, this is very interesting.
> >>>>
> >>>>> I've also been working on fastboot support (i.e., flicker-free boot=
ing).
> >>>>> This requires state-readout from simpledrm via generic interfaces, =
as
> >>>>> outlined in [1]. I do have some prototype code, but it will take a =
while
> >>>>> to get this ready. Simpledrm will then support it.
> >>>>>
> >>>>> I've tested simpledrm with x86 EFI and VESA framebuffers, which bot=
h work
> >>>>> reliably. The fbdev console and Weston work automatically. Xorg req=
uires
> >>>>> manual configuration of the device. Xorgs current modesetting drive=
r does
> >>>>> not work with both, platform and PCI device, for the same physical
> >>>>> hardware. Once configured, X11 works. I looked into X11, but couldn=
't see
> >>>>> an easy way of fixing the problem. With the push towards Wayland+Xw=
ayland
> >>>>> I expect the problem to become a non-issue soon. Additional testing=
 has
> >>>>> been reported at [2].
> >>>>>
> >>>>> One cosmetical issue is that simpledrm's device file is card0 and t=
he
> >>>>> native driver's device file is card1. After simpledrm has been kick=
ed out,
> >>>>> only card1 is left. This does not seem to be a practical problem ho=
wever.
> >>>>>
> >>>>> TODO/IDEAS:
> >>>>>
> >>>>> =A0=A0=A0=A0=A0* provide deferred takeover
> >>>>
> >>>> I'm not sure what you mean with this ?=A0 Currently deferred-takeove=
r is
> >>>> handled in the fbcon code. Current flickerfree boot works like this
> >>>> (assuming a single LCD panel in a laptop):
> >>>>
> >>>> 1. EFI/GOP sets up the framebuffer, draws a vendor logo
> >>>> 2. The bootloader runs in silent mode and does not touch anything gf=
x related
> >>>> 3. kernel boots, with a loglevel of 3 so only CRIT/EMERG messages ar=
e shown
> >>>> 2. efifb loads; and tells fbcon that a framebuffer is now available =
for it to "bind"
> >>>> =A0=A0=A0=A0 to. Since CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=
=3Dy fbcon defers taking over
> >>>> =A0=A0=A0=A0 the console and leaves the dummy-console driver in plac=
e (unless there have already
> >>>> =A0=A0=A0=A0 been kernel messages logged, which there shouldn't beca=
use loglevel=3D3)
> >>>> 3. i915 loads, reads out the hw state compares this to the preferred=
-mode for the
> >>>> =A0=A0=A0=A0 panel which it would set, they match, nothing happens. =
i915 takes ownership
> >>>> =A0=A0=A0=A0 of the scanout-buffer set up by the GOP, but leaves it =
in place.
> >>>> =A0=A0=A0=A0 i915 also removes the efifb /dev/fb0 and installs its o=
wn /dev/fb0 fbdev compat
> >>>> =A0=A0=A0=A0 device, fbcon is notified of this, but is still deferre=
d and leaves the dummy
> >>>> =A0=A0=A0=A0 console driver in place as console driver.
> >>>> 4. Plymouth loads, allocates a new scan-out buffer at the panel's pr=
eferred resolution,
> >>>> =A0=A0=A0=A0 plymouth reads the vendor-logo through the BGRT ACPI in=
terface and fills the
> >>>> =A0=A0=A0=A0 scanout-buffer with the vendor-logo + a spinner. Then p=
lymouth installs the new
> >>>> =A0=A0=A0=A0 scanout-buffer on the crtc, this is done atomically dur=
ing vsync, so the user
> >>>> =A0=A0=A0=A0 sees no changes, other then the spinner appearing
> >>>> =A0=A0=A0=A0 (note the active VT is now in graphical mode)
> >>>> 5. From here on not flickering is a userspace problem
> >>>>
> >>>> AFAICT this should work fine with simplekms too, unless it clears th=
e screen
> >>>> to black when it binds.
> >>>
> >>> I forgot to add the code that clears the screen, but that's the case =
here.
> >>>
> >>> Instead of a plane-disable operation, simpledrm can at best clear the=
 screen. This would happen during the initial mode-config reset IIRC.
> >>
> >> Hmm, clearing the screen without any (atomic) modesets being initiated=
 by either
> >> an in kernel drm-client or userspace seems wrong, this is certainly di=
fferent from
> >> what the i915 driver does. The way I see it either a drm client provid=
es a new
> >> framebuffer in which case you copy that over the old contents, effecti=
vely clearing
> >> it. Or a drm-client gets a handle and draws to the current fb directly=
, in which
> >> case it is the clients responsibility to clear it itself first.
> >>
> >> IOW I believe that simpledrm should not clear the screen itself at all.
> > =

> > I do as well. And when I boot with simpledrm + native driver it's flick=
er-free from what I can tell. But drm_mode_config_reset() is supposed to re=
set HW and software state. There could be some corner case where we'd have =
to clear the screen. For now, it should be fine.
> =

> Sounds good, thanks.

To clarify: Atomic assumes that the sw state always matches hw state, even
at boot-up. Most drivers use drm_mode_config_reset to achieve that, which
forces everything to off. But that breaks flicker-free boot.

To avoid that i915 (and it's the only driver doing so) has fairly
elaborate state-readout code, to make sure we do faithfully preserve the
full boot-up display state. This is anything but trivial to implement.

For simpledrm it's a bit simple, since state recover boils down to reading
out the fb and putting it into the new one, since there's not even
provisions (afaiui) for simpledrm to enable/disable the output physically.

So i915 is the exception here allowing flicker-free boot, not the rule.
-Daniel

> > BTW if you have the time I'd appreciate your review of the patchset.
> =

> Sorry, but I'm burried under a whole pile of other work. So although I wo=
uld like to help it is better to say no.
> =

> Regards,
> =

> Hans
> =

> =

> =

> =

> =

> >>> But we need to keep the display content stored in a framebuffer, so r=
ead-out helpers are required. There are more users of these read-out helper=
s. Adding them at some point probably makes sense.
> >>>
> >>> Other drivers might also want to read the initial config from simpled=
rm via read-out helpers. I think only i915 currently supports something lik=
e that ATM.
> >>>
> >>> Best regards
> >>> Thomas
> >>>
> >>>>
> >>>> An addition to the above sequence, if at any time either the kernel =
or userspace
> >>>> prints a message to the console; and at that time a fbdev is registe=
red then fbcon
> >>>> will takeover as the console driver from the dummy driver and it wil=
l start drawing
> >>>> to the registered fbdev (1), destroying the framebuffer contents. Al=
so if any messages
> >>>> where printend while no fbdev was registered, then fbcon will takeov=
er the console
> >>>> as soon as a fbdev gets registered.
> >>>>
> >>>> So since we already have deferred-takeover in the fbcon code, I wond=
er what you
> >>>> mean when you are talking about "provide deferred takeover" for simp=
lekms?
> >>>>
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>
> >>>> 1) Except when the VT has been switched to GFX mode when this happen=
s, then fbcon
> >>>> will delay using the fbdev until the VT is switched back to text mod=
e.
> >>>>
> >>>>
> >>>> p.s.
> >>>>
> >>>> This has the interesting side effect then when logging into a deskto=
p GUI session:
> >>>> kernel -> plymouth -> gdm -> GNOME user session
> >>>>
> >>>> There never is any output to the text-console and fbcon never takes-=
over, so on
> >>>> many Laptops running say Fedora workstation the fbcon code is actual=
ly unused
> >>>> until the user manually switches to another virtual-console to log i=
n in
> >>>> text-mode:
> >>>>
> >>>> [hans@x1 ~]$ dmesg | grep -E 'fbcon|Console:|Truecolor'
> >>>> [=A0=A0=A0 0.258904] Console: colour dummy device 80x25
> >>>> [=A0=A0=A0 1.274726] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16=
:8:0
> >>>> [=A0=A0=A0 1.274768] fbcon: Deferring console take-over
> >>>> [=A0=A0=A0 2.540894] fbcon: i915drmfb (fb0) is primary device
> >>>> [=A0=A0=A0 2.540896] fbcon: Deferring console take-over
> >>>> [hans@x1 ~]$ uptime
> >>>> =A0=A0 12:29:39 up=A0 4:19,=A0 1 user,=A0 load average: 0.58, 0.75, =
0.81
> >>>>
> >>>> Look mom no fbcon
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>> =A0=A0=A0=A0=A0* provide bootsplash DRM client
> >>>>> =A0=A0=A0=A0=A0* make simplekms usable with ARM-EFI fbs
> >>>>>
> >>>>> v2:
> >>>>> =A0=A0=A0=A0=A0* rename to simpledrm, aperture helpers
> >>>>> =A0=A0=A0=A0=A0* reorganized patches
> >>>>> =A0=A0=A0=A0=A0* use hotplug helpers for removal (Daniel)
> >>>>> =A0=A0=A0=A0=A0* added DT match tables (Rob)
> >>>>> =A0=A0=A0=A0=A0* use shadow-plane helpers
> >>>>> =A0=A0=A0=A0=A0* lots of minor cleanups
> >>>>>
> >>>>> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W=
5Ra8CxPvJ=3D9BwmvfU-O0gg@mail.gmail.com/
> >>>>> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/
> >>>>>
> >>>>> Thomas Zimmermann (10):
> >>>>> =A0=A0=A0 drm/format-helper: Pass destination pitch to drm_fb_memcp=
y_dstclip()
> >>>>> =A0=A0=A0 drm/format-helper: Add blitter functions
> >>>>> =A0=A0=A0 drm/aperture: Move fbdev conflict helpers into drm_apertu=
re.h
> >>>>> =A0=A0=A0 drm/aperture: Add infrastructure for aperture ownership
> >>>>> =A0=A0=A0 drm: Add simpledrm driver
> >>>>> =A0=A0=A0 drm/simpledrm: Add fbdev emulation
> >>>>> =A0=A0=A0 drm/simpledrm: Initialize framebuffer data from device-tr=
ee node
> >>>>> =A0=A0=A0 drm/simpledrm: Acquire clocks from DT device node
> >>>>> =A0=A0=A0 drm/simpledrm: Acquire regulators from DT device node
> >>>>> =A0=A0=A0 drm/simpledrm: Acquire memory aperture for framebuffer
> >>>>>
> >>>>> =A0=A0 Documentation/gpu/drm-internals.rst=A0=A0=A0 |=A0 12 +
> >>>>> =A0=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 7 +
> >>>>> =A0=A0 drivers/gpu/drm/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 7 +
> >>>>> =A0=A0 drivers/gpu/drm/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 1 +
> >>>>> =A0=A0 drivers/gpu/drm/drm_aperture.c=A0=A0=A0=A0=A0=A0=A0=A0 | 287=
 ++++++++
> >>>>> =A0=A0 drivers/gpu/drm/drm_format_helper.c=A0=A0=A0 |=A0 96 ++-
> >>>>> =A0=A0 drivers/gpu/drm/mgag200/mgag200_mode.c |=A0=A0 2 +-
> >>>>> =A0=A0 drivers/gpu/drm/tiny/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 17 +
> >>>>> =A0=A0 drivers/gpu/drm/tiny/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 1 +
> >>>>> =A0=A0 drivers/gpu/drm/tiny/cirrus.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 2 +-
> >>>>> =A0=A0 drivers/gpu/drm/tiny/simpledrm.c=A0=A0=A0=A0=A0=A0 | 932 +++=
++++++++++++++++++++++
> >>>>> =A0=A0 include/drm/drm_aperture.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 96 +++
> >>>>> =A0=A0 include/drm/drm_fb_helper.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 56 +-
> >>>>> =A0=A0 include/drm/drm_format_helper.h=A0=A0=A0=A0=A0=A0=A0 |=A0 10=
 +-
> >>>>> =A0=A0 14 files changed, 1466 insertions(+), 60 deletions(-)
> >>>>> =A0=A0 create mode 100644 drivers/gpu/drm/drm_aperture.c
> >>>>> =A0=A0 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
> >>>>> =A0=A0 create mode 100644 include/drm/drm_aperture.h
> >>>>>
> >>>>> --=A0
> >>>>> 2.30.1
> >>>>>
> >>>>
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
