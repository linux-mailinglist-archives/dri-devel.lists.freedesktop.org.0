Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770104F3CD0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FC810ED4E;
	Tue,  5 Apr 2022 17:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361C010ED4E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:29:34 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so79080fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hTmLNze/fum3lYDHZs7Sj1aLnDxMurPjlCcI6KAPtQw=;
 b=LbJpKtmNLFfmBBa8hI73mA0q3CBsHxWD5rGAH/a5zDNcSjWuPrutm69VA3/geneB9G
 pP2pvW/JddNsdNKYKSfjHiWncHsb3XxG9GZThdgfhubL/HZ4IB51n2b1YDm90xWG0GfZ
 Nqp2GVyKJQMxrGftECRmUpJYaBDF8o2XFRYtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hTmLNze/fum3lYDHZs7Sj1aLnDxMurPjlCcI6KAPtQw=;
 b=t/ELdc27m75GwTOfA0z4Q2at1LaTDpS3DKb/+iRhuGSbQUnITSwtaqTIzQUs4vwI4h
 wGeCknGE1R8jUQIk1FENBGxnero52JzdNyfEpmQsVukWlfSirUKJclOOXlnkFXKKf/7l
 COss9+eyHGA1BsRi/Kh+H+AtdXFxGO6csWrL9xjakfuShO+JWrqpb4Rc42Bxu/r1vl9T
 ddS2QQMnTig4rily9lNIRpRwLcD6HN0wWFOKH8de+V1Tol6OVeJZK+w7zmvZY+TCqqMb
 bzdxHIpMbapXREDfvd8jv++Oim44ZgHWcfX+TJlVT/a/08I45xkpCofK2cROogSnKJDU
 wnOw==
X-Gm-Message-State: AOAM530c2fZS3MJ/9bMyOGgVQADC8UFWvGY2W4WytxUsvoddjgwTAR8m
 sfa23vRjpHp9p2f5/XhLtJTQstH4vXBSxfnJIPyXog==
X-Google-Smtp-Source: ABdhPJz2hTIFazRR9MY8eLnHVlZ8caoGqxdFkjJVbRqRI2qhGE2WqsCDNkD6KwqVkoKmjggVmMcy5elsAsbz0Y7u4AU=
X-Received: by 2002:a05:6870:ec9e:b0:dd:e1fd:d76c with SMTP id
 eo30-20020a056870ec9e00b000dde1fdd76cmr2156223oab.7.1649179773446; Tue, 05
 Apr 2022 10:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local> <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
 <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
 <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
 <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
 <YkxFHUdm/YeiVY+D@kroah.com> <Ykxqi82sOEd2Zg1K@phenom.ffwll.local>
 <YkxyBt8Zee8qrEbT@kroah.com>
In-Reply-To: <YkxyBt8Zee8qrEbT@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 5 Apr 2022 19:29:22 +0200
Message-ID: <CAKMK7uEWMDZoB_OLLu7desVVPXEAgDiCEjVDJ3FrSeSTBoYtGQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To: Greg KH <gregkh@linuxfoundation.org>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 18:45, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 05, 2022 at 06:12:59PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 05, 2022 at 03:33:17PM +0200, Greg KH wrote:
> > > On Tue, Apr 05, 2022 at 03:24:40PM +0200, Geert Uytterhoeven wrote:
> > > > Hi Daniel,
> > > >
> > > > On Tue, Apr 5, 2022 at 1:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
> > > > > <javierm@redhat.com> wrote:
> > > > > > On 4/5/22 11:24, Daniel Vetter wrote:
> > > > > > > On Tue, 5 Apr 2022 at 11:19, Javier Martinez Canillas
> > > > > > >> This is how I think that work, please let me know if you see something
> > > > > > >> wrong in my logic:
> > > > > > >>
> > > > > > >> 1) A PCI device of OF device is registered for the GPU, this attempt to
> > > > > > >>    match a registered driver but no driver was registered that match yet.
> > > > > > >>
> > > > > > >> 2) The efifb driver is built-in, will be initialized according to the link
> > > > > > >>    order of the objects under drivers/video and the fbdev driver is registered.
> > > > > > >>
> > > > > > >>    There is no platform device or PCI/OF device registered that matches.
> > > > > > >>
> > > > > > >> 3) The DRM driver is built-in, will be initialized according to the link
> > > > > > >>    order of the objects under drivers/gpu and the DRM driver is registered.
> > > > > > >>
> > > > > > >>    This matches the device registered in (1) and the DRM driver probes.
> > > > > > >>
> > > > > > >> 4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
> > > > > > >>    before registering the DRM device.
> > > > > > >>
> > > > > > >>    There are no conflicting drivers or platform device at this point.
> > > > > > >>
> > > > > > >> 5) Latter at some point the drivers/firmware/sysfb.c init function is
> > > > > > >>    executed, and this registers a platform device for the generic fb.
> > > > > > >>
> > > > > > >>    This device matches the efifb driver registered in (2) and the fbdev
> > > > > > >>    driver probes.
> > > > > > >>
> > > > > > >>    Since that happens *after* the DRM driver already matched, probed
> > > > > > >>    and registered the DRM device, that is a bug and what the reverted
> > > > > > >>    patch worked around.
> > > > > > >>
> > > > > > >> So we need to prevent (5) if (1) and (3) already happened. Having a flag
> > > > > > >> set in the fbdev core somewhere when remove_conflicting_framebuffers()
> > > > > > >> is called could be a solution indeed.
> > > > > > >>
> > > > > > >> That is, the fbdev core needs to know that a DRM driver already probed
> > > > > > >> and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE
> > > > > > >>
> > > > > > >> I can attempt to write a patch for that.
> > > > > > >
> > > > > > > Ah yeah that could be an issue. I think the right fix is to replace
> > > > > > > the platform dev unregister with a sysfb_unregister() function in
> > > > > > > sysfb.c, which is synced with a common lock with the sysfb_init
> > > > > > > function and a small boolean. I think I can type that up quickly for
> > > > > > > v3.
> > > > > >
> > > > > > It's more complicated than that since sysfb is just *one* of the several
> > > > > > places where platform devices can be registered for video devices.
> > > > > >
> > > > > > For instance, the vga16fb driver registers its own platform device in
> > > > > > its module_init() function so that can also happen after the conflicting
> > > > > > framebuffers (and associated devices) were removed by a DRM driver probe.
> > > > > >
> > > > > > I tried to minimize the issue for that particular driver with commit:
> > > > > >
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0499f419b76f
> > > > > >
> > > > > > But the point stands, it all boils down to the fact that you have two
> > > > > > different subsystems registering video drivers and they don't know all
> > > > > > about each other to take a proper decision.
> > > > > >
> > > > > > Right now the drm_aperture_remove_conflicting_framebuffers() call signals
> > > > > > in one direction from DRM to fbdev but there isn't a communication in the
> > > > > > other direction, from fbdev to DRM.
> > > > > >
> > > > > > I believe the correct fix would be for the fbdev core to keep a list of
> > > > > > the apertures struct that are passed to remove_conflicting_framebuffers(),
> > > > > > that way it will know what apertures are not available anymore and prevent
> > > > > > to register any fbdev framebuffer that conflicts with one already present.
> > > > >
> > > > > Hm that still feels like reinventing a driver model, badly.
> > > > >
> > > > > I think there's two cleaner solutions:
> > > > > - move all the firmware driver platform_dev into sysfb.c, and then
> > > > > just bind the special cases against that (e.g. offb, vga16fb and all
> > > > > these). Then we'd have one sysfb_try_unregister(struct device *dev)
> > > > > interface that fbmem.c uses.
> > > > > - let fbmem.c call into each of these firmware device providers, which
> > > > > means some loops most likely (like we can't call into vga16fb), so
> > > > > probably need to move that into fbmem.c and it all gets a bit messy.
> > > > >
> > > > > > Let me know if you think that makes sense and I can attempt to write a fix.
> > > > >
> > > > > I still think unregistering the platform_dev properly makes the most
> > > >
> > > > That doesn't sound very driver-model-aware to me. The device is what
> > > > the driver binds to; it does not cease to exist.
> > >
> > > I agree, that sounds odd.
> > >
> > > The device should always stick around (as the bus creates it), it's up
> > > to the driver to bind to the device as needed.
> >
> > The device actually disappears when the real driver takes over.
> >
> > The firmware fb is a special thing which only really exists as long as the
> > firmware is in charge of the display hardware. As soon as a real driver
> > takes over, it stops being a thing.
> >
> > And since a driver without a device is a bit a funny thing, we have been
> > pushing towards a model where the firmware code sets up a platform_device
> > for this fw interface, and the fw driver (efifb, simplefb and others like
> > that) bind against it. And then we started to throw out that
> > platform_device (which unbinds the fw driver and prevents it from ever
> > rebinding), except in the wrong layer so there's a few races.
> >
> > Should we throw out all that code and replace it with something else? What
> > would that be like?
>
> Ah, no, sorry, I didn't know that at all.
>
> That sounds semi-sane, just fix the races by moving the layer elsewhere?

Yeah essentially move it all into drivers/firmware/sysfb.c, for all
drivers, both the registering and the nuking, and warp that into a
local mutex. Currently parts is in there, parts is in fbmem.c, parts
in some of the drivers like vga16fb, and some drivers (iirc only offb)
still don't even have any platform_dev underneath their driver. So
ideally the drivers would all just have their platform_driver probe
functions, and that's it. It does mean though that some of that stuff
needs to be moved to sysfb.c or into the relevant fw code that sets
stuff up.

It'll take some, so really just a direction check before we move
further. You should get cc'ed on the patches (like with the sysfb
stuff) anyway. Sounds roughly right?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
