Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3F6D779D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF910E0AA;
	Wed,  5 Apr 2023 08:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE910E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:59:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-502208f7cb3so30551a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680685192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3RxdsHUGlz72mqBAPhCRIDVuLK/DwmpKu0XLa+O9S98=;
 b=Z/x1jGBcX+WJpStgzbxYvgFNA7nFaRyIlAVD5b0Tuz8aHwCzFBiAe3AnD9Gy7Lfel2
 QSgab9JQvWbnJbTee+I2k2KuJ+dPKjCwJ/hNUg5d8qXz0waw4Eg36hdLRzm/EHN2r/3H
 P+Aqyx9jYwaIhOqWVy1mAY3LoWoXY3Ovlo7aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680685192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3RxdsHUGlz72mqBAPhCRIDVuLK/DwmpKu0XLa+O9S98=;
 b=hP5fspP9V8d4D7yJCjtQJDoEQ7vlVDAgrJ1WIGZrgv5YJcmUPP1Jdxlyu/ZSlSm/+R
 l4FmObzONP8lL+fcLOA7nkQn4788O2RUNKXlK0r/SoflIF+h8qwkmxE/2HcVw7JNYmN3
 wM8QXLHLcnt51aVtFKXN3zCYPl/rBaG0VB9hNjnQWLZFq8o1MJnGx6d06f1/JXA6y2M7
 G6IqoS+UmthnfmgSmbHwp2IpHxi1E5/+92/FwP8Bw8FLanptv+aEXpSUiBupAyF4xv8s
 tX5uq4tP1ID69YdUirn6tH2UJUl47cWvK/bpt5wsjvh1/cBwAdayBDaiWZxhmMpHVBUi
 CPGw==
X-Gm-Message-State: AAQBX9fnCVRFdLcHHZSpshP2sbGaj85pxpgPMksQrY/02VTiy3qjWtLC
 +wDjczMMYN/eJ6tu5nNoD1RLRQ==
X-Google-Smtp-Source: AKy350YFj+AiVfZacvTla/2NA1bYuejQy386+iWeGzJng6g2ZbETcy8ks7Yub0SthjW68XrbKrD4CA==
X-Received: by 2002:a17:906:2d7:b0:949:148d:82c0 with SMTP id
 23-20020a17090602d700b00949148d82c0mr1191417ejk.6.1680685192524; 
 Wed, 05 Apr 2023 01:59:52 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 gw22-20020a170906f15600b0093debb9990esm7061995ejb.212.2023.04.05.01.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:59:52 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:59:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Message-ID: <ZC04hoHywz0ySzAW@phenom.ffwll.local>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
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

On Wed, Apr 05, 2023 at 10:07:54AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.04.23 um 09:49 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 04.04.23 um 22:18 schrieb Daniel Vetter:
> > > This one nukes all framebuffers, which is a bit much. In reality
> > > gma500 is igpu and never shipped with anything discrete, so there should
> > > not be any difference.
> > > 
> > > v2: Unfortunately the framebuffer sits outside of the pci bars for
> > > gma500, and so only using the pci helpers won't be enough. Otoh if we
> > > only use non-pci helper, then we don't get the vga handling, and
> > > subsequent refactoring to untangle these special cases won't work.
> > > 
> > > It's not pretty, but the simplest fix (since gma500 really is the only
> > > quirky pci driver like this we have) is to just have both calls.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > ---
> > >   drivers/gpu/drm/gma500/psb_drv.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/gma500/psb_drv.c
> > > b/drivers/gpu/drm/gma500/psb_drv.c
> > > index 2ce96b1b9c74..f1e0eed8fea4 100644
> > > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > > @@ -422,12 +422,17 @@ static int psb_pci_probe(struct pci_dev *pdev,
> > > const struct pci_device_id *ent)
> > >       /*
> > >        * We cannot yet easily find the framebuffer's location in
> > > memory. So
> > > -     * remove all framebuffers here.
> > > +     * remove all framebuffers here. Note that we still want the
> > > pci special
> > > +     * handling to kick out vgacon.
> > >        *
> > >        * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> > >        *       might be able to read the framebuffer range from the
> > > device.
> > >        */
> > > -    ret = drm_aperture_remove_framebuffers(true, &driver);
> > > +    ret = drm_aperture_remove_framebuffers(false, &driver);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> > > &driver);
> > 
> > This simply isn't it. If you have to work around your own API, it's time
> > to rethink the API.
> 
> Here's a proposal:
> 
>  1) As you're changing aperture_remove_conflicting_devices() anyway, rename
> it to aperture_remove_conflicting_devices_at(), so it's clear that it takes
> a memory range.
> 
>  2) Introduce aperture_remove_conflicting_pci_devices_at(), which takes a
> PCI device and a memory range. It should do the is_primary and vgacon stuff,
> but kick out the range.
> 
>  3) Call aperture_remove_conflicting_pci_devices_at() from gma500 with the
> full range. Even if we can restructure gma500 to detect the firmware
> framebuffer from its registers (there's this TODO item), we'd still need
> aperture_remove_conflicting_pci_devices_at() to do something useful with it.
> 
>  4) With that, aperture_remove_conflicting_devices_at() can drop the primary
> argument.
> 
> Of course, the DRM-related interface should be adapted as well. There's a
> bit of overlap in the implementation of both PCI aperture helpers, but the
> overall interface is clear.

This essentially just gives us a helper which does the above two
open-coded steps but all wrapped up. For gma500 only. Also I really don't
think I'm working around the api here, it's gma500 which is special:

- Normal pci devices all have their fw framebuffer within the memory bars,
  never outside. So for those the pci version is the right interface.

- If the framebuffer is outside of the pci bar then it's just not really a
  pci vga device anymore, but looks a lot more like a SoC design.

gma500 is somehow both at the same time, so it gets two calls. And having
both calls explicitly I think is better, because it highlights the dual
nature of gma500 of being both a pci vga devices and a SoC embedded
device. Trying to make a wrapper to hide this dual nature just so we have
a single call still seems worse to me. Aside from it's just boilerplate
for no gain.

Frankly at that point I think it would be clearer to call the gma500
function remove_conflicting_gma500 or something like that. Or at least
remove_conflicting_pci_and_separate_range_at.

This is imo similar to the hypothetical case of a SoC chip which also
happens to decode legacy vga, without being a pci device. We could add a
new interface function which just nukes the vga stuff (without the pci
device tie-in, maybe with some code sharing internally in aperture.c), and
then that driver does 2 calls: 1. nuke aperture range 2. nuke vga stuff.
And sure if you have a lot of those maybe you could make a helper to safe
a few lines of code, but semantically it's still two different things
your're removing.

Or another case: A pci device with 2 subfunctions, each a gpu device. This
happened with dual-head gpus 20 years ago because windows 2000 insisted
that each crtc needs its own pci function. You'd just call the pci removal
twice for that too (except not relevant because bios fw never figured out
how to enable both heads, so just nuking the first one is good enough).

iow, I don't understand why you think this is the wrong api. There's no
rule that a driver must be able remove all conflicting fw drivers in a
single call, if it's two things we need to nuke it can be two calls.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
