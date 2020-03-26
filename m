Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BE193FEA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 14:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0A36E0F3;
	Thu, 26 Mar 2020 13:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CD16E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 13:39:15 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id l23so5817283otf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wFukWW15LjhcYxnyyQgEVJMiluS1D1UebU3PqciR6c=;
 b=Z9bOoga5Dsf9B7qM+H9BYluIYS9CJlkJidwW66pTirx8dImcAZnujcY18qnMs5QESk
 EMUdZvvpqatKOBCqVfo+Dmk1+HgTfa4uJdTF2gs3pSl0qrF+VNRPp5A6cd2ro1qrUqeb
 6klegKIlgdYuooORzPro8zsCjwJnPm2bzuWZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wFukWW15LjhcYxnyyQgEVJMiluS1D1UebU3PqciR6c=;
 b=K6UFH/QnFE6T1zwoFjGegGVh2P3wDbpa74aOVQP+qz5lbYAGecwqc2fMqa3qCY/z3L
 +1Sw0Uz6nFHSTakfhWODIi7EmF1q72NQL0CKAxGk9Vnh3k7rJCuf+ncBgxEK3ZF0rHGQ
 UyiOmhyf0MBqMUhnK3tuaQQekNI1WGSqZa7N60iIbtPGsyXcug9kEQaV/xk6R0k5tJAm
 AbTFM/IzllNrDsgrH1LG4HLkY6UTC9QJ3sf/RZTTyL1y0y4OGtla2WMu22qpKB09RJPt
 Trz6R9Tyn3F9DjLCwHHeKGEzQOXh5GX712EWMyY+oHgo7vb0HKz55wSiX983GWCi4vhX
 Vmqg==
X-Gm-Message-State: ANhLgQ1xLJqEDSQWEgipPVdxHwTlkMDZuJwyaFeSvP9ssFHS0A6uCLno
 DcUg0BYHtw5dBLXnK7S8WqJcv8ezTecZWCDpT7yXcQ==
X-Google-Smtp-Source: ADFU+vu2s+1yMhU4GRNQWJZu0otaBAkns9ncxkcB7AdTHzNGwa+65xqc9vvC9AsqVjVakENzquklJG5zu1FXEHDe2/o=
X-Received: by 2002:a9d:554d:: with SMTP id h13mr6198795oti.303.1585229954600; 
 Thu, 26 Mar 2020 06:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200325144310.36779-1-hdegoede@redhat.com>
 <20200326112959.GZ2363188@phenom.ffwll.local>
 <8b9d940d-b236-062d-4ac3-c7462090066f@redhat.com>
In-Reply-To: <8b9d940d-b236-062d-4ac3-c7462090066f@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 Mar 2020 14:39:03 +0100
Message-ID: <CAKMK7uHA+uefrWVR42wTss65mq_D4q5odfePm6uj399emkWx8w@mail.gmail.com>
Subject: Re: [PATCH] drm/vboxvideo: Add missing
 remove_conflicting_pci_framebuffers call
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 2:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 3/26/20 12:29 PM, Daniel Vetter wrote:
> > On Wed, Mar 25, 2020 at 03:43:10PM +0100, Hans de Goede wrote:
> >> The vboxvideo driver is missing a call to remove conflicting framebuffers.
> >>
> >> Surprisingly, when using legacy BIOS booting this does not really cause
> >> any issues. But when using UEFI to boot the VM then plymouth will draw
> >> on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
> >> /dev/fb1 as fbdev emulation).
> >>
> >> VirtualBox will actual display the output of both devices (I guess it is
> >> showing whatever was drawn last), this causes weird artifacts because of
> >> pitch issues in the efifb when the VM window is not sized at 1024x768
> >> (the window will resize to its last size once the vboxvideo driver loads,
> >> changing the pitch).
> >>
> >> Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
> >> call fixes this.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >> index 8512d970a09f..261255085918 100644
> >> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >> @@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >>      if (ret)
> >>              goto err_mode_fini;
> >>
> >> +    ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
> >> +    if (ret)
> >> +            goto err_irq_fini;
> >
> > To avoid transient issues this should be done as early as possible,
> > definitely before the drm driver starts to touch the "hw".>
>
> Ok will fix and then push this to drm-misc-next-fixes, thank you.
>
> > With that
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > I do wonder though why the automatic removal of conflicting framebuffers
> > doesn't work, fbdev should already do that from register_framebuffer(),
> > which is called somewhere in drm_fbdev_generic_setup (after a few layers).
> >
> > Did you check why the two framebuffers don't conflict, and why the uefi
> > one doesn't get thrown out?
>
> I did not check, I was not aware that this check was already happening
> in register_framebuffer(). So I just checked and the reason why this
> is not working is because the fbdev emulation done by drm_fbdev_generic_setup
> does not fill in fb_info.apertures->ranges[0] .
>
> So fb_info.apertures->ranges[0].base is left as 0 which does not match
> with the registered efifb's aperture.
>
> We could try to fix this, but that is not entirely trivial, we would
> need to pass the pci_dev pointer down into drm_fb_helper_alloc_fbi()
> then and then like remove_conflicting_pci_framebuffers() does add
> apertures for all IORESOURCE_MEM PCI bars, but that would conflict
> with drivers which do rely on drm_fb_helper_alloc_fbi() currently
> allocating one empty aperture and then actually fill that itself...

You don't need the pci device, because resources are attached to the
struct device directly. So you could just go through all
IORESOURCE_MEM ranges, and add them. And the struct device we always
have through drm_device->dev. This idea just crossed my mind since you
brought up IORESOURCE_MEM, might be good to try that out instead of
having to litter all drivers with explicit removal calls. The explicit
removal is really only for races (vga hw tends to blow up if 2 drivers
touch it, stuff like that), or when there's resources conflicts. Can
you try to look into that?

This generic solution will still not be enough for shmem/cma based
drivers on SoC, but at least it should take care of anything that puts
the framebuffer into some kind of bar or stolen memory region. What
drivers do explicitly for those is just put in the framebuffer base
address. But iirc fbdev core does that already unconditionally.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
