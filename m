Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C086D788A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0554710E8AC;
	Wed,  5 Apr 2023 09:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6B210E31B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 09:38:32 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso112340066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680687510;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eYc5YyJC1z6LkcqM4vlgFMJBwTW39dsZIGpJbBuMlJE=;
 b=bb0/uV9BZrKNowq2t2ph3BDZ5LGL7x7fLFT5z0T0EDuD2wsPSc2L+8V/QtCEp6g7jz
 ux1v/l4a3Q+v9YjbqpZc67EbtzKiRH03lVFMw2Ic03wid1AQ5sWmVYyr5+abhfCNUPPu
 ajCl6EPt0JMBbOZfoVeKueGvS0mJse4MECDjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687510;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eYc5YyJC1z6LkcqM4vlgFMJBwTW39dsZIGpJbBuMlJE=;
 b=cMOSEQnuM2I3VI67NrDBii04QlY5uJRDFt1fkMerHT41jNIa3dFd20p10da+0Gx/Y+
 VsvcWk0d0hAosIqu7LtQc36GfHvnTzu8kFb9Hc3BIVGGA67Oq29Wsq6KcOcFX8s7uz4A
 yAkmzM+u9IH4m45YHyaIw+TMYBnjV6bnM5YZ5VT+lgGIDYQbxWcRFWJE2fGqW9O3BhkS
 QU/M5HTILJAHCbI4y8zN5Ff7lF3N+aebDeh2+Wxn1xVH1E3kn/aVLTgaDYVft3fuQs/+
 wxq78ARe93GDGQmLNRW7vzzPDcg3aOSIRoFh9N2p0nMgPFORvNDU5kE3z2Pj3aVUN4Z2
 4HfQ==
X-Gm-Message-State: AAQBX9fb8gPbeIHTqDRwsVovy1G2xgJKhbMT3D7KEEC3RUvmvMbuFlYg
 Vu3Oi/ic3ISCo+00AJkkZQ1UJw==
X-Google-Smtp-Source: AKy350beGSh2xM4OD7pSN6okuOOrfqmeLOMkEwPfKW30mYQpAzlqvU16fHBf3zyJeYCZWJlKp3lHKA==
X-Received: by 2002:a05:6402:524e:b0:500:3fd0:25a8 with SMTP id
 t14-20020a056402524e00b005003fd025a8mr2216677edd.0.1680687510285; 
 Wed, 05 Apr 2023 02:38:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l22-20020a1709061c5600b00927f6c799e6sm7094637ejg.132.2023.04.05.02.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:38:29 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:38:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Message-ID: <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 11:26:51AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.04.23 um 10:59 schrieb Daniel Vetter:
> > On Wed, Apr 05, 2023 at 10:07:54AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 05.04.23 um 09:49 schrieb Thomas Zimmermann:
> > > > Hi
> > > > 
> > > > Am 04.04.23 um 22:18 schrieb Daniel Vetter:
> > > > > This one nukes all framebuffers, which is a bit much. In reality
> > > > > gma500 is igpu and never shipped with anything discrete, so there should
> > > > > not be any difference.
> > > > > 
> > > > > v2: Unfortunately the framebuffer sits outside of the pci bars for
> > > > > gma500, and so only using the pci helpers won't be enough. Otoh if we
> > > > > only use non-pci helper, then we don't get the vga handling, and
> > > > > subsequent refactoring to untangle these special cases won't work.
> > > > > 
> > > > > It's not pretty, but the simplest fix (since gma500 really is the only
> > > > > quirky pci driver like this we have) is to just have both calls.
> > > > > 
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > > > ---
> > > > >    drivers/gpu/drm/gma500/psb_drv.c | 9 +++++++--
> > > > >    1 file changed, 7 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/gma500/psb_drv.c
> > > > > b/drivers/gpu/drm/gma500/psb_drv.c
> > > > > index 2ce96b1b9c74..f1e0eed8fea4 100644
> > > > > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > > > > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > > > > @@ -422,12 +422,17 @@ static int psb_pci_probe(struct pci_dev *pdev,
> > > > > const struct pci_device_id *ent)
> > > > >        /*
> > > > >         * We cannot yet easily find the framebuffer's location in
> > > > > memory. So
> > > > > -     * remove all framebuffers here.
> > > > > +     * remove all framebuffers here. Note that we still want the
> > > > > pci special
> > > > > +     * handling to kick out vgacon.
> > > > >         *
> > > > >         * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> > > > >         *       might be able to read the framebuffer range from the
> > > > > device.
> > > > >         */
> > > > > -    ret = drm_aperture_remove_framebuffers(true, &driver);
> > > > > +    ret = drm_aperture_remove_framebuffers(false, &driver);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> > > > > &driver);
> > > > 
> > > > This simply isn't it. If you have to work around your own API, it's time
> > > > to rethink the API.
> > > 
> > > Here's a proposal:
> > > 
> > >   1) As you're changing aperture_remove_conflicting_devices() anyway, rename
> > > it to aperture_remove_conflicting_devices_at(), so it's clear that it takes
> > > a memory range.
> > > 
> > >   2) Introduce aperture_remove_conflicting_pci_devices_at(), which takes a
> > > PCI device and a memory range. It should do the is_primary and vgacon stuff,
> > > but kick out the range.
> > > 
> > >   3) Call aperture_remove_conflicting_pci_devices_at() from gma500 with the
> > > full range. Even if we can restructure gma500 to detect the firmware
> > > framebuffer from its registers (there's this TODO item), we'd still need
> > > aperture_remove_conflicting_pci_devices_at() to do something useful with it.
> > > 
> > >   4) With that, aperture_remove_conflicting_devices_at() can drop the primary
> > > argument.
> > > 
> > > Of course, the DRM-related interface should be adapted as well. There's a
> > > bit of overlap in the implementation of both PCI aperture helpers, but the
> > > overall interface is clear.
> > 
> > This essentially just gives us a helper which does the above two
> > open-coded steps but all wrapped up. For gma500 only. Also I really don't
> > think I'm working around the api here, it's gma500 which is special:
> > 
> > - Normal pci devices all have their fw framebuffer within the memory bars,
> >    never outside. So for those the pci version is the right interface.
> > 
> > - If the framebuffer is outside of the pci bar then it's just not really a
> >    pci vga device anymore, but looks a lot more like a SoC design.
> > 
> > gma500 is somehow both at the same time, so it gets two calls. And having
> 
> It's not "both at the same time." It like an SoC that can act as VGA. But
> it's not really a PCI graphics card on its own. Maybe that's just
> nitpicking, though.

I don't see why it can't be a pci vga card. There is no requirement that a
pci vga card must be also a non-vga card with real non-vga framebuffer. We
don't have a hole lot of them really.

> > both calls explicitly I think is better, because it highlights the dual
> > nature of gma500 of being both a pci vga devices and a SoC embedded
> > device. Trying to make a wrapper to hide this dual nature just so we have
> > a single call still seems worse to me. Aside from it's just boilerplate
> > for no gain.
> > 
> > Frankly at that point I think it would be clearer to call the gma500
> > function remove_conflicting_gma500 or something like that. Or at least
> > remove_conflicting_pci_and_separate_range_at.
> 
> Yes. If you don't want a new _pci_devices_at() aperture helper, please
> duplicate the _pci_devices() helper within gma500 (with its sysfb and vgacon
> handling). Then let it take the gma500 memory range where the generic _pci()
> helper iterates over PCI BARs.
> 
> This would mark gma500 as special, while clearly communicating what's going
> on.

The thing is, pci is self-describing. We don't need to open code every
variant in every driver, the pci code can figure out in a generic way
whether vga needs to be nuked or not. That's the entire point of this
refactoring.

Also note that we nuke all bars, and on most pci cards that will include a
bunch of mmio bars which will never ever hold a framebuffer. And the old
per-driver open-coded version ensured that we only nuked the pci bar that
could potentially contain the framebuffer.

Why is gma500 special and it needs to be the only pci driver where we
intentionally filter out all the bars that wont ever contain a
framebuffer? If this is your argument, the entire series is toast, not
just the gma500 part.

> > This is imo similar to the hypothetical case of a SoC chip which also
> > happens to decode legacy vga, without being a pci device. We could add a
> > new interface function which just nukes the vga stuff (without the pci
> > device tie-in, maybe with some code sharing internally in aperture.c), and
> > then that driver does 2 calls: 1. nuke aperture range 2. nuke vga stuff.
> > And sure if you have a lot of those maybe you could make a helper to safe
> > a few lines of code, but semantically it's still two different things
> > your're removing.
> > 
> > Or another case: A pci device with 2 subfunctions, each a gpu device. This
> > happened with dual-head gpus 20 years ago because windows 2000 insisted
> > that each crtc needs its own pci function. You'd just call the pci removal
> > twice for that too (except not relevant because bios fw never figured out
> > how to enable both heads, so just nuking the first one is good enough).
> > 
> > iow, I don't understand why you think this is the wrong api. There's no
> > rule that a driver must be able remove all conflicting fw drivers in a
> > single call, if it's two things we need to nuke it can be two calls.
> 
> Your stated goal is to simplify the aperture interface and make it harder to
> misuse. But the reasoning behind the new code in gma500 is not
> understandable without following the discussion closely or without knowing
> the hardware. Remember that your first iteration of this patch actually got
> it wrong, because gma500 is different. So there should be one aperture call
> here that does the right thing for gma500.

I didn't know about the dual-nature of gma500. Which is why I added a
comment to explain what's going on, since at first glance it just looked
like someone didn't bother to implement the open-coded pci conflicting
driver removal correctly. It's by far not the only driver that was sloppy,
a bunch did not compute the primary flag correctly at least. Maybe I
overlooked some really funny special case there too?

Also I think my goal fits, because if we'd have had the newly proposed
helpers, then gma500 would have needed to have the two calls + comments
from the start. Which would have helped me to realize that this is indeed
intentionally special and not accidentally buggy.

As-is, without the obvious special case in code or some comment or digging
around elsewhere it just looks buggy.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
