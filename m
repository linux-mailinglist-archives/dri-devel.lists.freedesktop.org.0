Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3701941DE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 15:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9736E8D6;
	Thu, 26 Mar 2020 14:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80CB6E8D6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 14:47:36 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 22so6077874otf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21sA9g1ah5YLHz3mrqgNVqbfCXay7GQgiRwVQtiYC70=;
 b=gw0ozJAwXL7dWCwf+DZU8mnSeaOyUdVv20niwYUA5WCnzbqdtc998xkKcVgSPDw0vs
 roRmttCdqB5mhB+QSolV50Xi1p0VSEZwZ/H/6Ii/BOu2kwMaGzdkEv3ElYAmzwYRv1xv
 Ht6xpz0rRBLs2EkCbPmrc1fo6yla9ii5Ob1aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21sA9g1ah5YLHz3mrqgNVqbfCXay7GQgiRwVQtiYC70=;
 b=ZelgEnuenIxzr2VBnloODztpA9imom5Bp/Zzn00MH9SmLhL3VmzW37CIagfq7gIpDY
 A0HYGL7hNtd+Lo2nQSFxK2b3qukPrttjnXWwtriiaViMJ6PcPAYfOJb3zktsbpwOnN5W
 BGkw+J+4DvOpLm4EGH/FAaTm8CqI05mVaokVd30OGUHf53uIKDXL2sdnkMKpJ73AHO/3
 WNM/mf8p7yvlGWMReHdsjoeR6hYer6tPSnKbuVxbgTGz/6SeTtllOz3yd0wN8AHTi/Bz
 MweQoZCsbxb0r1IfoxmmS5AFQlmhmFdyqhazMCU7/XmcMbfnLaeLP/zmaHYwEBNbYrov
 Tl4Q==
X-Gm-Message-State: ANhLgQ3boYOpgQDIF5zR7pbXajmUTT3LBXhHG3Q+BBqVs0dN5J1wDYz+
 O5PiPkuTnYXaSFTIPxkiFLcdEFrPPn1tC4nf0ITmNw==
X-Google-Smtp-Source: ADFU+vtzF4d38kls+GUWIuw6zEGbhJbRvmvcdyHO0/worOdG+9qtq9Bde25mS0Iv7StNPomoMLwQndgwIGhL4x9M3H0=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr6762206ota.281.1585234055848; 
 Thu, 26 Mar 2020 07:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200325144310.36779-1-hdegoede@redhat.com>
 <20200326112959.GZ2363188@phenom.ffwll.local>
 <8b9d940d-b236-062d-4ac3-c7462090066f@redhat.com>
 <CAKMK7uHA+uefrWVR42wTss65mq_D4q5odfePm6uj399emkWx8w@mail.gmail.com>
 <8fbfde07-be1e-c8c8-2ff4-c7b64c3f150d@redhat.com>
In-Reply-To: <8fbfde07-be1e-c8c8-2ff4-c7b64c3f150d@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 Mar 2020 15:47:24 +0100
Message-ID: <CAKMK7uFk_o2PURDVGWdN+LPkg4bDunotEvvG=voF7ee-2cCq2w@mail.gmail.com>
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

On Thu, Mar 26, 2020 at 3:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 3/26/20 2:39 PM, Daniel Vetter wrote:
> > On Thu, Mar 26, 2020 at 2:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 3/26/20 12:29 PM, Daniel Vetter wrote:
> >>> On Wed, Mar 25, 2020 at 03:43:10PM +0100, Hans de Goede wrote:
> >>>> The vboxvideo driver is missing a call to remove conflicting framebuffers.
> >>>>
> >>>> Surprisingly, when using legacy BIOS booting this does not really cause
> >>>> any issues. But when using UEFI to boot the VM then plymouth will draw
> >>>> on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
> >>>> /dev/fb1 as fbdev emulation).
> >>>>
> >>>> VirtualBox will actual display the output of both devices (I guess it is
> >>>> showing whatever was drawn last), this causes weird artifacts because of
> >>>> pitch issues in the efifb when the VM window is not sized at 1024x768
> >>>> (the window will resize to its last size once the vboxvideo driver loads,
> >>>> changing the pitch).
> >>>>
> >>>> Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
> >>>> call fixes this.
> >>>>
> >>>> Cc: stable@vger.kernel.org
> >>>> Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>>    drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >>>> index 8512d970a09f..261255085918 100644
> >>>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> >>>> @@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >>>>       if (ret)
> >>>>               goto err_mode_fini;
> >>>>
> >>>> +    ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
> >>>> +    if (ret)
> >>>> +            goto err_irq_fini;
> >>>
> >>> To avoid transient issues this should be done as early as possible,
> >>> definitely before the drm driver starts to touch the "hw".>
> >>
> >> Ok will fix and then push this to drm-misc-next-fixes, thank you.
> >>
> >>> With that
> >>>
> >>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>
> >>> I do wonder though why the automatic removal of conflicting framebuffers
> >>> doesn't work, fbdev should already do that from register_framebuffer(),
> >>> which is called somewhere in drm_fbdev_generic_setup (after a few layers).
> >>>
> >>> Did you check why the two framebuffers don't conflict, and why the uefi
> >>> one doesn't get thrown out?
> >>
> >> I did not check, I was not aware that this check was already happening
> >> in register_framebuffer(). So I just checked and the reason why this
> >> is not working is because the fbdev emulation done by drm_fbdev_generic_setup
> >> does not fill in fb_info.apertures->ranges[0] .
> >>
> >> So fb_info.apertures->ranges[0].base is left as 0 which does not match
> >> with the registered efifb's aperture.
> >>
> >> We could try to fix this, but that is not entirely trivial, we would
> >> need to pass the pci_dev pointer down into drm_fb_helper_alloc_fbi()
> >> then and then like remove_conflicting_pci_framebuffers() does add
> >> apertures for all IORESOURCE_MEM PCI bars, but that would conflict
> >> with drivers which do rely on drm_fb_helper_alloc_fbi() currently
> >> allocating one empty aperture and then actually fill that itself...
> >
> > You don't need the pci device, because resources are attached to the
> > struct device directly. So you could just go through all
> > IORESOURCE_MEM ranges, and add them. And the struct device we always
> > have through drm_device->dev. This idea just crossed my mind since you
> > brought up IORESOURCE_MEM, might be good to try that out instead of
> > having to litter all drivers with explicit removal calls. The explicit
> > removal is really only for races (vga hw tends to blow up if 2 drivers
> > touch it, stuff like that), or when there's resources conflicts. Can
> > you try to look into that?
>
> Interesting idea, but I'm afraid that my plate is quite full with a lot of
> more urgent things atm, so I really do not have time for this, sorry.

Hm can you capture this idea in a todo then instead? I don't really
like the idea of everyone having to add bogus
remove_conflicting_framebuffer calls just because the generic fbdev
helper falls short of expectations. Kinda not happy to land the
vboxvideo patch since it's just a hack to work around a helper bug.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
