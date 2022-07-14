Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14E574770
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81F4A376C;
	Thu, 14 Jul 2022 08:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0B97035
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:43:09 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id o1so729506qkg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 01:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AxN0KXqSzVzIHaBApKEyHk1NU3/+nmlgLRu8+vYeWQg=;
 b=pVZvdz+j3Xy5NtE9kgz4wBAkAtwF4St8AAr/Gie72GZcLfJmEe5gWlfUMdEk9MUg/u
 Y0lzU311/gqn87eN7SJfLWcGXaCGeDrkZaO3YyblXjPWp1zo4RQ2qMq9rbjtdgWncq2g
 gfFBtTA0pm1+C0+DUoA3PG8YeJsKmZUgh7/z9jtMvtRCaBCW2JT6sHXSW/DudjZs3yh3
 rZYsMgj5CoElPPDwb8LmBtVad4R5fXc/pwnOGs7Az/jnohZsp6pAWazNQ+sTcZ9qBQ9Q
 RnATDqIkQKlq141Tj8OZZlTL6pOz7FclXW7+5S0jyvBt+uqbNq9iVkuRm82fqOfJ4jTS
 aMiQ==
X-Gm-Message-State: AJIora/hlg6WIo4mHosFZEp6V4qSJG8cctY5ScHZWLE0zY8gsl4Dh3Qf
 3HfIEPrvWHNXYlC/XBOQMRjDRegwW/D12A==
X-Google-Smtp-Source: AGRyM1tFJRBz5KCjsj4YX4gHHoWuObQlVLl0pKS7l6tne7Kv5nMp/r4hW3O2Wcicj2Ugwq8KQpkayw==
X-Received: by 2002:a05:620a:756:b0:6b5:9635:3957 with SMTP id
 i22-20020a05620a075600b006b596353957mr5270514qki.233.1657788188821; 
 Thu, 14 Jul 2022 01:43:08 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 x3-20020ac86b43000000b003196e8eda26sm923752qts.69.2022.07.14.01.43.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 01:43:08 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id p129so2043935yba.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 01:43:08 -0700 (PDT)
X-Received: by 2002:a05:6902:154f:b0:66e:e2d3:ce1 with SMTP id
 r15-20020a056902154f00b0066ee2d30ce1mr6988768ybu.365.1657788187837; Thu, 14
 Jul 2022 01:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
 <20220711114206.sawqdl54ibuxsxp4@houat>
 <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
 <20220711120243.v6lwoynqigle2aot@houat>
 <CAMuHMdXhmf5TudQ6a1PUVV8KXff6JjgMmZOmOWVb2qW6eXF7Ow@mail.gmail.com>
 <20220713093708.jaa3og2fablqr723@houat>
In-Reply-To: <20220713093708.jaa3og2fablqr723@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Jul 2022 10:42:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGmxo6B2EWbygi1ncKe9SBTDvyzPSw1f32P_+TMot36Q@mail.gmail.com>
Message-ID: <CAMuHMdWGmxo6B2EWbygi1ncKe9SBTDvyzPSw1f32P_+TMot36Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Jul 13, 2022 at 11:37 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Mon, Jul 11, 2022 at 02:08:06PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 11, 2022 at 2:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Mon, Jul 11, 2022 at 01:59:28PM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Jul 11, 2022 at 1:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> > > > > > Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > > > > > > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> > > > > > > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > > > > > > The mode parsing code recognizes named modes only if they are explicitly
> > > > > > > > > listed in the internal whitelist, which is currently limited to "NTSC"
> > > > > > > > > and "PAL".
> > > > > > > > >
> > > > > > > > > Provide a mechanism for drivers to override this list to support custom
> > > > > > > > > mode names.
> > > > > > > > >
> > > > > > > > > Ideally, this list should just come from the driver's actual list of
> > > > > > > > > modes, but connector->probed_modes is not yet populated at the time of
> > > > > > > > > parsing.
> > > > > > > >
> > > > > > > > I've looked for code that uses these names, couldn't find any. How is this
> > > > > > > > being used in practice? For example, if I say "PAL" on the command line, is
> > > > > > > > there DRM code that fills in the PAL mode parameters?
> > > > > > >
> > > > > > > We have some code to deal with this in sun4i:
> > > > > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_tv.c#L292
> > > > > > >
> > > > > > > It's a bit off topic, but for TV standards, I'm still not sure what the
> > > > > > > best course of action is. There's several interactions that make this a
> > > > > > > bit troublesome:
> > > > > > >
> > > > > > >    * Some TV standards differ by their mode (ie, PAL vs NSTC), but some
> > > > > > >      other differ by parameters that are not part of drm_display_mode
> > > > > > >      (NTSC vs NSTC-J where the only difference is the black and blanking
> > > > > > >      signal levels for example).
> > > > > > >
> > > > > > >    * The mode names allow to provide a fairly convenient way to add that
> > > > > > >      extra information, but the userspace is free to create its own mode
> > > > > > >      and might omit the mode name entirely.
> > > > > > >
> > > > > > > So in the code above, if the name has been preserved we match by name,
> > > > > > > but we fall back to matching by mode if it hasn't been, which in this
> > > > > > > case means that we have no way to differentiate between NTSC, NTSC-J,
> > > > > > > PAL-M in this case.
> > > > > > >
> > > > > > > We have some patches downstream for the RaspberryPi that has the TV
> > > > > > > standard as a property. There's a few extra logic required for the
> > > > > > > userspace (like setting the PAL property, with the NTSC mode) so I'm not
> > > > > > > sure it's preferable.
> > > > > > >
> > > > > > > Or we could do something like a property to try that standard, and
> > > > > > > another that reports the one we actually chose.
> > > > > > >
> > > > > > > > And another question I have is whether this whitelist belongs into the
> > > > > > > > driver at all. Standard modes exist independent from drivers or hardware.
> > > > > > > > Shouldn't there simply be a global list of all possible mode names? Drivers
> > > > > > > > would filter out the unsupported modes anyway.
> > > > > > >
> > > > > > > We should totally do something like that, yeah
> > > > > >
> > > > > > That sun code already looks like sometihng the DRM core/helpers should be
> > > > > > doing. And if we want to support named modes well, there's a long list of
> > > > > > modes in Wikipedia.
> > > > > >
> > > > > > https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Vector_Video_Standards2.svg
> > > > >
> > > > > Yeah, and NTSC is missing :)
> > > >
> > > > And that diagram is about the "digital" variant of PAL.
> > > > If you go the analog route, the only fixed parts are vfreq/hfreq,
> > > > number of lines, and synchronization. Other parameters like overscan
> > > > can vary.  The actual dot clock can vary wildly: while there is an
> > > > upper limit due to bandwidth limitations, you can come up with an
> > > > almost infinite number of video modes that can be called PAL, which
> > > > is one of the reasons why I don't want hardware-specific variants to
> > > > end up in a global video mode database.
> > >
> > > Do you have an example of what that would look like?
> >
> > You mean a PAL mode that does not use 768x576?
>
> I meant what the almost infinite number of video modes that can be
> called PAL and would have to be defined in drivers
>
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/amifb.c#n834
>
> But that works :)
>
> I don't see what really is troublesome if we go with the mode + property
> setup here.
>
> We can deal easily with the interlaced vs non-interlaced variants
> already with DRM_MODE_FLAG_INTERLACE, and the ff variants can be dealt
> with DRM_MODE_FLAG_DBLCLK.

Sure. Interlace and doublescan are the easy parts.
(actually "ff" is not PAL, but a 31 kHz mode with the same resolution of
 the corresponding PAL mode).


> We still need something to differentiate between, say, PAL-M and NTSC-J
> where the differences are between things not exposed by the mode itself
> (black and blanking levels differ from NSTC for NTSC-J, and the color
> carrier frequency is PAL's for PAL-M)
>
> Am I missing something?
>
> > (TAG_HIRES is replaced by the actual dot clock at runtime, as it
> >  depends on the crystal present on the mainboard).
>
> If we have the crystal frequency in the kernel somehow, we could filter
> them out from the driver (or fill them in) depending on that frequency.
>
> I still think the mode + property is the way to go, possibly with some
> generic component that would take the mode name from the command line
> and create that initial state depending on the value for backward
> compatibility.
>
> What do you think?

The difficulty is the wild variety of resolutions supported by devices
that can be connected to a standard (legacy) analog PAL TV or monitor,
and thus are all called "PAL".  These range from 160x228 (Atari 2600)
over 176x184 (VIC-20), 256x192 (e.g. ZX Spectrum), 320x200 (Atari ST),
640x256/512i (Amiga) (I'm not saying we should support old 8-bit
machines, though ;-)
A longer list can be found at [1].  Most of the resolutions lower
than 0.3 Mpixels can be shown on a TV.

IMHO, only the modes backed by digital standards of PAL (and NTSC [2])
should be in a common mode database.  The rest is to be detained
to the individual drivers, as they are highly driver-specific, and
unlikely to be used with more than one driver or hardware platform.

[1] https://en.wikipedia.org/wiki/List_of_common_resolutions
[2] https://en.wikipedia.org/wiki/List_of_common_resolutions#Digital_Standards

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
