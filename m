Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B221650A8D2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 21:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032A810E99E;
	Thu, 21 Apr 2022 19:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AEA10E99E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 19:10:51 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id j17so5843693pfi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxpsmRn4liX/JkLIzDl29945i+oLukXAiDATd4S+dE4=;
 b=FdmKeMmnH6aM29lCgPyJc+r25j8XDQoGJ3BI8Z52dmKnVskiH7cEIi3wXfk61QXBPQ
 X3h2tFHg/2TYgcYmbBdMNjGnxTiwu8XlsBejBed2H+97sKPgmQK5zu4EJW7mnnu3XtT1
 i7UqnlfB5EXNze4xIy3uQL8f/M7pNFWsR0iPxA2PGvZEEED/Kz/1PdlgUus9GGUHUr+m
 sRX8XdBrmMLuVYuD/LKuoE175U5e9ZB+cd4DnGbNY1SkBGSDAGn4H3rDGko9JlAmS+Ze
 xu4IyoZDVSzrXR0+lq3oNE/LDw/33Fu77hP1Efy8dVqnAIRHYX5mCsiJhfAJZNioJjOA
 cB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxpsmRn4liX/JkLIzDl29945i+oLukXAiDATd4S+dE4=;
 b=Y3/pE3qzMukVi8VS2JXWrGhH6UUkCzMvcRHbYj6l0Q5srQtsifJj2/EneQ+gr2cMn6
 Lbhc6ikxg6IOsdUUh7PUDR3eWlCB2AGL5u5NTLrAqvXEIMATbEBxqoj6XRCdJXunCa8j
 foOWh/W3uGcwMks9O9+X+dg9Klbb9VTozMo6oc0bV3zJMrLGgLz5pvuNu2GrQEJxNNNH
 imelf48tgVyrlLMz6W18qvnwCBhh7Sumo+4GimIJWbmT5kEcs8Sr8NFjVt/JZ37yANIo
 VlFEhvFEkKqdpT/J4oazRmdDLwyS4oCEYmgXHlF5bXws477dla7cRc8VKsyWL4nATAWb
 f3dw==
X-Gm-Message-State: AOAM530Ub4MdQIpp2yxSGCM3+3ngxUQAzu7X+cLe+DCU5DZPCD5OJ5Ks
 dKrsWdReymVHJhrBTI8hTJt0dzG8r4ZKnxnY780=
X-Google-Smtp-Source: ABdhPJxbLqBcFghHruK/H6FCUSgMdMA2sUUg3OCW6i5RM2FuCLs1i1vLLMSmXIcA/HY1gK8oOEHQ2wTwNBCLn64hqVo=
X-Received: by 2002:a63:c22:0:b0:39d:a9ed:ebc6 with SMTP id
 b34-20020a630c22000000b0039da9edebc6mr778347pgl.350.1650568250454; Thu, 21
 Apr 2022 12:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <09cc1d94-d25e-4fbd-bb95-03d0135cf818@suse.de>
 <CADvTj4rvxA3p5858LpQv9NNgxVDNH=_NN=d4+Rce8TiUsgpFsw@mail.gmail.com>
In-Reply-To: <CADvTj4rvxA3p5858LpQv9NNgxVDNH=_NN=d4+Rce8TiUsgpFsw@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 21 Apr 2022 21:10:38 +0200
Message-ID: <CAMeQTsZz1TFUepiH_GufrUQaV4sEYOSs8t+4x89meJ9bt6+tbQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 7:48 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Thu, Apr 21, 2022 at 8:20 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 21.04.22 um 14:54 schrieb Patrik Jakobsson:
> > > On Thu, Apr 21, 2022 at 2:47 PM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > >>
> > >> Hello Patrik,
> > >>
> > >> On 4/21/22 14:39, Patrik Jakobsson wrote:
> > >>> On Thu, Apr 21, 2022 at 1:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >>>>
> > >>>> Hi
> > >>>>
> > >>>> Am 09.04.22 um 06:23 schrieb James Hilliard:
> > >>>>> Select the efi framebuffer if efi is enabled.
> > >>>>>
> > >>>>> This appears to be needed for video output to function correctly.
> > >>>>>
> > >>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > >>>>> ---
> > >>>>> Changes v2 -> v3:
> > >>>>>     - select EFI_FB instead of depending on it
> > >>>>> Changes v1 -> v2:
> > >>>>>     - use depends instead of select
> > >>>>> ---
> > >>>>>    drivers/gpu/drm/gma500/Kconfig | 2 ++
> > >>>>>    1 file changed, 2 insertions(+)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> > >>>>> index 0cff20265f97..a422fa84d53b 100644
> > >>>>> --- a/drivers/gpu/drm/gma500/Kconfig
> > >>>>> +++ b/drivers/gpu/drm/gma500/Kconfig
> > >>>>> @@ -2,11 +2,13 @@
> > >>>>>    config DRM_GMA500
> > >>>>>        tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> > >>>>>        depends on DRM && PCI && X86 && MMU
> > >>>>> +     depends on FB
> > >>>>
> > >>>> Why do we need FB here? Framebuffer support should be hidden by DRM's
> > >>>> fbdev helpers.
> > >>>
> > >>> It is not needed but gives him video output since it enables the drm
> > >>> fbdev emulation.
> > >>>
> > >>
> > >> I'm not sure to understand this. Shouldn't depend on DRM_FBDEV_EMULATION then?
> >
> > It has to be selected separately in .config.
> >
> > James, make sure you have DRM_FBDEV_EMULATION enabled in your kernel's
> > .config file if you want a console. however, Weston should work without
> > it.  How do you start weston without a console?
>
> Well it seems to be needed for weston to work over HDMI, I'm running
> weston as a systemd service.
>
> >
> > >
> > > No, it shouldn't depend on any FBDEV stuff since it's not actually
> > > required. It just happens to help in this case since weston + fbdev
> > > backend works but not weston with drm backend (or whatever config
> > > James have set).
> > >
> > >>
> > >>> I looked some more at the logs and it seems weston doesn't work on his
> > >>> system without the fbdev backend. So the question is why weston isn't
> > >>> working without fbdev? Perhaps this is just a Weston configuration
> > >>> issue?
> > >>>
> > >>
> > >> But is weston using the fbdev emulated by DRM or the one registered by
> > >> efifb? I thought that the latter from what was mentioned in this thread.
> > >
> > > It's using drm fbdev emulation with gma500 so EFIFB has nothing to do
> > > with this. I believe it was just simply incorrectly reported. If I'm
> > > correct then "depends on FB" is what makes video output work for
> > > James.
> >
> > There's an fbdev backend for weston, but the provided logs don't look as
> > if it's using this.  Maybe the connector's modes are never probed
> > correctly without fbdev.
> >
> > James, could you provide a logfile for weston? (i.e., 'weston
> > --log=weston.txt').
>
> Here's the log with output working over HDMI(DVI-D-1):
> Date: 2022-04-21 UTC
> [17:43:11.726] weston 10.0.0
>                https://wayland.freedesktop.org
>                Bug reports to:
> https://gitlab.freedesktop.org/wayland/weston/issues/
>                Build: 10.0.0
> [17:43:11.727] Command line: /bin/weston
> --config=/etc/xdg/weston/weston.ini --log=/srv/weston.txt -Swayland-1
> [17:43:11.727] OS: Linux, 5.17.3, #5 SMP PREEMPT Thu Apr 21 11:20:47
> MDT 2022, x86_64
> [17:43:11.727] Flight recorder: enabled
> [17:43:11.727] Using config file '/etc/xdg/weston/weston.ini'
> [17:43:11.727] Output repaint window is 7 ms maximum.
> [17:43:11.727] Loading module '/usr/lib/libweston-10/drm-backend.so'
> [17:43:11.743] initializing drm backend
> [17:43:11.743] Trying logind launcher...
> [17:43:11.743] logind: cannot find systemd session for uid: 0 -61
> [17:43:11.743] logind: cannot setup systemd-logind helper error: (No
> data available), using legacy fallback
> [17:43:11.744] Trying weston_launch launcher...
> [17:43:11.744] could not get launcher fd from env
> [17:43:11.744] Trying direct launcher...
> [17:43:11.748] using /dev/dri/card0
> [17:43:11.748] DRM: does not support atomic modesetting
> [17:43:11.748] DRM: does not support GBM modifiers
> [17:43:11.748] DRM: supports picture aspect ratio
> [17:43:11.765] event2  - Power Button: is tagged by udev as: Keyboard
> [17:43:11.765] event2  - Power Button: device is a keyboard
> [17:43:11.771] event3  - Video Bus: is tagged by udev as: Keyboard
> [17:43:11.772] event3  - Video Bus: device is a keyboard
> [17:43:11.777] event0  - Power Button: is tagged by udev as: Keyboard
> [17:43:11.778] event0  - Power Button: device is a keyboard
> [17:43:11.785] event1  - Sleep Button: is tagged by udev as: Keyboard
> [17:43:11.787] event1  - Sleep Button: device is a keyboard
> [17:43:11.799] event4  - PiKVM Composite KVM Device: is tagged by udev
> as: Keyboard
> [17:43:11.799] event4  - PiKVM Composite KVM Device: device is a keyboard
> [17:43:11.859] event5  - PiKVM Composite KVM Device: is tagged by udev as: Mouse
> [17:43:11.861] event5  - PiKVM Composite KVM Device: device is a pointer
> [17:43:11.891] libinput: configuring device "Power Button".
> [17:43:11.891] libinput: configuring device "Video Bus".
> [17:43:11.891] libinput: configuring device "Power Button".
> [17:43:11.892] libinput: configuring device "Sleep Button".
> [17:43:11.892] libinput: configuring device "PiKVM Composite KVM Device".
> [17:43:11.892] libinput: configuring device "PiKVM Composite KVM Device".
> [17:43:11.892] input device event5 has no enabled output associated
> (none named), skipping calibration for now.
> [17:43:11.907] DRM: head 'VGA-1' updated, connector 37 is disconnected.
> [17:43:11.907] DRM: head 'VGA-1' found, connector 37 is disconnected.
> [17:43:11.912] DRM: head 'LVDS-1' updated, connector 39 is connected,
> EDID make 'unknown', model 'unknown', serial 'unknown'
> [17:43:11.912] DRM: head 'LVDS-1' found, connector 39 is connected,
> EDID make 'unknown', model 'unknown', serial 'unknown'
> [17:43:12.336] DRM: head 'DVI-D-1' updated, connector 41 is connected,
> EDID make 'TSB', model 'Toshiba-H2C', serial '2290649088'
> [17:43:12.336] DRM: head 'DVI-D-1' found, connector 41 is connected,
> EDID make 'TSB', model 'Toshiba-H2C', serial '2290649088'
> [17:43:12.337] DRM: head 'DP-1' updated, connector 43 is disconnected.
> [17:43:12.337] DRM: head 'DP-1' found, connector 43 is disconnected.
> [17:43:12.369] DRM: head 'DVI-D-2' updated, connector 47 is disconnected.
> [17:43:12.369] DRM: head 'DVI-D-2' found, connector 47 is disconnected.
> [17:43:12.425] DRM: head 'DP-2' updated, connector 49 is connected,
> EDID make 'CHR', model '1024x768', serial '880'
> [17:43:12.425] DRM: head 'DP-2' found, connector 49 is connected, EDID
> make 'CHR', model '1024x768', serial '880'
> [17:43:12.426] Registered plugin API 'weston_drm_output_api_v1' of size 24
> [17:43:12.426] Registered plugin API
> 'weston_drm_virtual_output_api_v1' of size 48
> [17:43:12.426] Color manager: no-op
> [17:43:12.426] Output 'DVI-D-1' using color profile: built-in default
> sRGB SDR profile
> [17:43:12.426] DRM: output DVI-D-1 uses shadow framebuffer.
> [17:43:12.426] Output DVI-D-1 (crtc 32) video modes:
>                1280x720@60.0, preferred, current, 74.2 MHz
>                1920x1080@50.0 16:9, 148.5 MHz
>                1920x1080@30.0 16:9, 74.2 MHz
>                1920x1080@25.0 16:9, 74.2 MHz
>                1920x1080@24.0 16:9, 74.2 MHz
>                1280x1024@75.0, 135.0 MHz
>                1440x900@59.9, 106.5 MHz
>                1280x720@60.0 16:9, 74.2 MHz
>                1280x720@59.9 16:9, 74.2 MHz
>                1280x720@50.0 16:9, 74.2 MHz
>                1280x720@30.0 16:9, 74.2 MHz
>                1280x720@25.0 16:9, 74.2 MHz
>                1280x720@24.0 16:9, 59.4 MHz
>                1024x768@70.1, 75.0 MHz
>                1024x768@60.0, 65.0 MHz
>                800x600@75.0, 49.5 MHz
>                800x600@72.2, 50.0 MHz
>                800x600@60.3, 40.0 MHz
>                800x600@56.2, 36.0 MHz
>                720x576@50.0 16:9, 27.0 MHz
>                720x576@50.0 4:3, 27.0 MHz
>                720x480@60.0 4:3, 27.0 MHz
>                720x480@60.0 16:9, 27.0 MHz
>                720x480@59.9, 27.0 MHz
>                720x480@59.9, 27.0 MHz
>                720x480@59.9 16:9, 27.0 MHz
>                720x480@59.9 4:3, 27.0 MHz
>                640x480@75.0, 31.5 MHz
>                640x480@72.8, 31.5 MHz
>                640x480@66.7, 30.2 MHz
>                640x480@60.0 4:3, 25.2 MHz
>                640x480@59.9, 25.2 MHz
>                640x480@59.9 4:3, 25.2 MHz
> [17:43:12.427] associating input device event2 with output DVI-D-1
> (none by udev)
> [17:43:12.427] associating input device event3 with output DVI-D-1
> (none by udev)
> [17:43:12.427] associating input device event0 with output DVI-D-1
> (none by udev)
> [17:43:12.427] associating input device event1 with output DVI-D-1
> (none by udev)
> [17:43:12.427] associating input device event4 with output DVI-D-1
> (none by udev)
> [17:43:12.427] associating input device event5 with output DVI-D-1
> (none by udev)
> [17:43:12.428] Output 'DVI-D-1' enabled with head(s) DVI-D-1
> [17:43:12.428] Compositor capabilities:
>                arbitrary surface rotation: yes
>                screen capture uses y-flip: no
>                cursor planes: yes
>                arbitrary resolutions: no
>                view mask clipping: yes
>                explicit sync: no
>                color operations: no
>                presentation clock: CLOCK_MONOTONIC, id 1
>                presentation clock resolution: 0.000000001 s
> [17:43:12.428] Loading module '/usr/lib/weston/kiosk-shell.so'
> [17:43:12.429] Note: support for the deprecated wl_shell interface is
> disabled. If a legacy client still needs it, it can be re-enabled by
> passing -Ddeprecated-wl-shell=true to Meson when building Weston.
> [17:43:12.429] Loading module '/usr/lib/weston/systemd-notify.so'

Ok, so my assumption that the working config was using westons fbdev
backend was wrong.

Looking further at the kernel logs I can see that in the non-working
case the HDMI connector gets crtc-1 instead of crtc-0. The pipe
selection for the port seems correct. Not sure what is going on.
