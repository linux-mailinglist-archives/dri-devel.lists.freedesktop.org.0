Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9CB4F3C85
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 18:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90D110EACA;
	Tue,  5 Apr 2022 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6510EACC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 16:13:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso1985903wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=j/6AMeSlOUOklImXXq0k1qDNIpWDz1k0LAxbI2CUBOc=;
 b=FyaCCuuFy9tOl30wxr6e96Z3cFL7OrVt/8eP0fwts2VMuhkb/CLSu1/fprs7Mj7Bcm
 JOXo02HlIwiYQh1e997f+MdWcecZ+If13hmlFh6awBHakX3Z4zR1KO/F4NbB+j0/Qvkg
 UlV1l7HYJS86X268Ec6D0VUkAh6CvGABxjw9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=j/6AMeSlOUOklImXXq0k1qDNIpWDz1k0LAxbI2CUBOc=;
 b=phbYRlMYM5iIzqVw1qmGyL2Mf5x6xH/0h8kYlsjrWEHHcOf0qK4WMtFVTtbbfE7mN0
 jhUnovvkQQ+bmCIQVWwy0TKnCYQXMs2xO7Swmbzqe6tyzLotTfNPGJFiDrKddRWh24iO
 GVdvor8Sw+RUYZf9rOcJMVtXTMef/4JT1CljhECgUd1i0e2qAXyu2txiwLQcAX+nv9fb
 2DFkGdkO9y3siZMn7LjduZH7N+34yxc4gxrjHNQAfN88raFBDSf8rJW8no/4myAWqpZR
 STSIig3b5PerGrnxGg3fQBgioTrRSE7vAkaQBDH+K1iIinQhg8ulZOCuUz5lHz7ywzd/
 6+Gw==
X-Gm-Message-State: AOAM533sb1/k/Hu5d1dWQvRb+BcCHDWJS3dUCgRbGnQDXZu1BuyP+jOj
 O7ifFIEuF8R3HTWAYtX3cLwB9Q==
X-Google-Smtp-Source: ABdhPJyTSMKxjq/kxlxpLkNeNaut64OQCKi4vDYixf1wKouhmg08rIvbjri2RGMzH4UqWc57UcO3oA==
X-Received: by 2002:a05:600c:1f14:b0:38c:946f:6812 with SMTP id
 bd20-20020a05600c1f1400b0038c946f6812mr3766945wmb.192.1649175182404; 
 Tue, 05 Apr 2022 09:13:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056000144f00b002057eac999fsm12857768wrx.76.2022.04.05.09.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 09:13:01 -0700 (PDT)
Date: Tue, 5 Apr 2022 18:12:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
Message-ID: <Ykxqi82sOEd2Zg1K@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Peter Jones <pjones@redhat.com>
References: <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local>
 <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
 <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
 <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
 <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
 <YkxFHUdm/YeiVY+D@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkxFHUdm/YeiVY+D@kroah.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ilya Trukhanov <lahvuun@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 05, 2022 at 03:33:17PM +0200, Greg KH wrote:
> On Tue, Apr 05, 2022 at 03:24:40PM +0200, Geert Uytterhoeven wrote:
> > Hi Daniel,
> > 
> > On Tue, Apr 5, 2022 at 1:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > > > On 4/5/22 11:24, Daniel Vetter wrote:
> > > > > On Tue, 5 Apr 2022 at 11:19, Javier Martinez Canillas
> > > > >> This is how I think that work, please let me know if you see something
> > > > >> wrong in my logic:
> > > > >>
> > > > >> 1) A PCI device of OF device is registered for the GPU, this attempt to
> > > > >>    match a registered driver but no driver was registered that match yet.
> > > > >>
> > > > >> 2) The efifb driver is built-in, will be initialized according to the link
> > > > >>    order of the objects under drivers/video and the fbdev driver is registered.
> > > > >>
> > > > >>    There is no platform device or PCI/OF device registered that matches.
> > > > >>
> > > > >> 3) The DRM driver is built-in, will be initialized according to the link
> > > > >>    order of the objects under drivers/gpu and the DRM driver is registered.
> > > > >>
> > > > >>    This matches the device registered in (1) and the DRM driver probes.
> > > > >>
> > > > >> 4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
> > > > >>    before registering the DRM device.
> > > > >>
> > > > >>    There are no conflicting drivers or platform device at this point.
> > > > >>
> > > > >> 5) Latter at some point the drivers/firmware/sysfb.c init function is
> > > > >>    executed, and this registers a platform device for the generic fb.
> > > > >>
> > > > >>    This device matches the efifb driver registered in (2) and the fbdev
> > > > >>    driver probes.
> > > > >>
> > > > >>    Since that happens *after* the DRM driver already matched, probed
> > > > >>    and registered the DRM device, that is a bug and what the reverted
> > > > >>    patch worked around.
> > > > >>
> > > > >> So we need to prevent (5) if (1) and (3) already happened. Having a flag
> > > > >> set in the fbdev core somewhere when remove_conflicting_framebuffers()
> > > > >> is called could be a solution indeed.
> > > > >>
> > > > >> That is, the fbdev core needs to know that a DRM driver already probed
> > > > >> and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE
> > > > >>
> > > > >> I can attempt to write a patch for that.
> > > > >
> > > > > Ah yeah that could be an issue. I think the right fix is to replace
> > > > > the platform dev unregister with a sysfb_unregister() function in
> > > > > sysfb.c, which is synced with a common lock with the sysfb_init
> > > > > function and a small boolean. I think I can type that up quickly for
> > > > > v3.
> > > >
> > > > It's more complicated than that since sysfb is just *one* of the several
> > > > places where platform devices can be registered for video devices.
> > > >
> > > > For instance, the vga16fb driver registers its own platform device in
> > > > its module_init() function so that can also happen after the conflicting
> > > > framebuffers (and associated devices) were removed by a DRM driver probe.
> > > >
> > > > I tried to minimize the issue for that particular driver with commit:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0499f419b76f
> > > >
> > > > But the point stands, it all boils down to the fact that you have two
> > > > different subsystems registering video drivers and they don't know all
> > > > about each other to take a proper decision.
> > > >
> > > > Right now the drm_aperture_remove_conflicting_framebuffers() call signals
> > > > in one direction from DRM to fbdev but there isn't a communication in the
> > > > other direction, from fbdev to DRM.
> > > >
> > > > I believe the correct fix would be for the fbdev core to keep a list of
> > > > the apertures struct that are passed to remove_conflicting_framebuffers(),
> > > > that way it will know what apertures are not available anymore and prevent
> > > > to register any fbdev framebuffer that conflicts with one already present.
> > >
> > > Hm that still feels like reinventing a driver model, badly.
> > >
> > > I think there's two cleaner solutions:
> > > - move all the firmware driver platform_dev into sysfb.c, and then
> > > just bind the special cases against that (e.g. offb, vga16fb and all
> > > these). Then we'd have one sysfb_try_unregister(struct device *dev)
> > > interface that fbmem.c uses.
> > > - let fbmem.c call into each of these firmware device providers, which
> > > means some loops most likely (like we can't call into vga16fb), so
> > > probably need to move that into fbmem.c and it all gets a bit messy.
> > >
> > > > Let me know if you think that makes sense and I can attempt to write a fix.
> > >
> > > I still think unregistering the platform_dev properly makes the most
> > 
> > That doesn't sound very driver-model-aware to me. The device is what
> > the driver binds to; it does not cease to exist.
> 
> I agree, that sounds odd.
> 
> The device should always stick around (as the bus creates it), it's up
> to the driver to bind to the device as needed.

The device actually disappears when the real driver takes over.

The firmware fb is a special thing which only really exists as long as the
firmware is in charge of the display hardware. As soon as a real driver
takes over, it stops being a thing.

And since a driver without a device is a bit a funny thing, we have been
pushing towards a model where the firmware code sets up a platform_device
for this fw interface, and the fw driver (efifb, simplefb and others like
that) bind against it. And then we started to throw out that
platform_device (which unbinds the fw driver and prevents it from ever
rebinding), except in the wrong layer so there's a few races.

Should we throw out all that code and replace it with something else? What
would that be like?

Note that the fw side generally has not much clue which real device on
some bus it corresponds to, that part is done through a bunch of magic
tricks. Some of them are simply "I'm taking over a display, pls through
out all fw drivers just to be sure".

> > > sense, and feels like the most proper linux device model solution
> > > instead of hacks on top - if the firmware fb is unuseable because a
> > > native driver has taken over, we should nuke that. And also the
> > > firmware fb driver would then just bind to that platform_dev if it
> > > exists, and only if it exists. Also I think it should be the
> > > responsibility of whichever piece of code that registers these
> > > platform devices to ensure that platform_dev actually still exists.
> > > That's why I think pushing all that code into sysfb.c is probably the
> > > cleanest solution.
> > 
> > Can't you unbind the generic driver first, and bind the specific driver
> > afterwards? Alike writing to sysfs unbind/driver_override/bind,
> > but from code?
> 
> That too feels odd, what is so special about the fbdev code that the
> normal driver functions do not work for them?  It shouldn't matter if
> multiple subsystems register video devices, why can't we handle more
> than one fb device?

The specific driver binds to a completely different device (this one is
more real), and sometimes has not much clue about what exactly the
fw/legacy driver is doing.

The special thing is that in fbdev we have "drivers" which are extremely
thin shims around the fw driver, which has done all the real display setup
for us. I don't think any other subsystem bothers with this, e.g. input
just tells the fw to get lost and never tries to use the fw input support
(stuff like the old horrors of emulating usb kbd as a ps/2 device and
things like that which fw tended to do). Only with display drivers do we
have this world where fairly often a fw driver is loaded first, and then
quite a bit later in the boot process, the real driver loads. It's a bit
like early serial console perhaps, to reduce the gap between when the
kernel loads and when the real display driver is ready.

Cheers, Daniel


> 
> thanks,
> 
> greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
