Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C3E39F6EE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 14:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F746E17A;
	Tue,  8 Jun 2021 12:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776236E17A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 12:39:14 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so6532807otk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 05:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B3w41yn4ovq3vWn8MObnEUAF7QRne3HQDNRnzfKoeBI=;
 b=i5snG8fCLgkxR6pNuuVHmnpNQRoXUI4Z/mrs8m5+HY+DFjBDiAnKBkB0tKojPE96CR
 DAwbjVgGJxSMKqqbkd0jO9o7Zj+eN45EXR1hefOnPXXS88N4WgV211dA/qRgZMTtYfEj
 k8w31O6k0yVxUiEgFcEMuiislGtUZRn3K+nMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B3w41yn4ovq3vWn8MObnEUAF7QRne3HQDNRnzfKoeBI=;
 b=ahhUbNwrB0j+yLPCp665kBopeEE1lOnTNH72Ck2B9h8SVMiVzgAAv02KB5V6bSI3T+
 wIEmVpWNISOKb+yHMsc9ETCeIBpskZ9SZpORViAsFKdLtbwGYvYq+wO7CkIeAusFtZsu
 cmLLgXw/CFWTiu0Yl8teP0JGbG3t6Rz6xyAEIU+b72G55GP69xJv+N8pXcoF2Rd5Hjcl
 nfTTByHIPkCUtBLheA7uxXykzlW0LxSiHdXhA/8xryp1a3bsaqjalhEZwfJHsYSYmmx6
 ZbRhkPhyShzexjOTH6IZ+eoAmtynitq5gyXzvuPagoqknLkktO235I1bJJ501d8Y5QCJ
 fdTw==
X-Gm-Message-State: AOAM531VbysoE1zdZxUmYIsLcuduiqBDxWHt++mlMazd6Wz6r9g2vFBc
 1pRB8Trqz5GmnxDH7M1I4YqwdjDht6c71wrj//Fumg==
X-Google-Smtp-Source: ABdhPJzJY+7YoI+X+6XVJQHBa41OYX7xWiROBdJRIGdtOVkaNCsZ+yZEgLYvVaBrooQcgCUR/JfSdVGmJw+1Wyw1djA=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr17872805otq.303.1623155952552; 
 Tue, 08 Jun 2021 05:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
 <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
 <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
In-Reply-To: <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 8 Jun 2021 14:39:00 +0200
Message-ID: <CAKMK7uHVO+fW3Bt=Oag-AMCqfAM-MNKERkKm6KAKqysVcWuRuA@mail.gmail.com>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 1:07 PM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi
>
> Am 08.06.21 um 11:23 schrieb Daniel Vetter:
> > On Tue, Jun 8, 2021 at 11:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Tue, Jun 08, 2021 at 11:03:01AM +0200, Thomas Zimmermann wrote:
> >>> Replace the IRQ check in VBLANK ioctls with a check for vblank
> >>> support. IRQs might be enabled wthout vblanking being supported.
> >>
> >> Nah, or if they are, that's a broken driver. irq_enabled here really o=
nly
> >> means vblank_irq_enabled (maybe we should rename it). I'd like to
> >> understand the motivation here a bit better to make sure we'r not just
> >> papering over a driver bug.
>
> It's not about a driver bug.
>
> For using simpledrm early during boot, at least some parts of DRM need
> to be built into the kernel binary. I'm looking for ways to reduce the
> size of the DRM-core objects. One low-hanging fruit is all the HW
> mid-layers that are present in DRM. Moving them behind CONFIG_DRM_LEGACY
> reduces the size of the binary for most of us. Few build with UMS support=
.

Uh, I'd like to see the full picture for that one first. Both total
amounts of bytes saved vs. gpu completely modularized (including all
the fbdev/con stuff), and what this does to simpledrm. If we end up
with duplicated code just to shave off a few bytes from the overal
beast, then I'm not sure that's worth it.

Bunch more comments on this discussion here below.

> The IRQ code is the final HW mid-layer that is still present. I have a
> patchset that pushes drm_irq_install() et al into KMS drivers and moves
> drm_irq.o behind CONFIG_DRM_LEGACY. But now all KMS drivers have to
> maintain the irq_enabled flag, even though it's not used by most of
> them. And in the DRM core (sans legacy) only these 3 VBLANK ioctls
> depend on it.
>
> The patch attemps to replace the core's dependency, so that KMS drivers
> don't have to maintain irq_enabled. Most can then use plain
> request_irq()/free_irq().

drm_driver->irq_enabled has nothing to do with request_irq/free_irq
for modern drivers.

> VBLANK support is already test-able by calling the rsp function. Or
> there's per-CRTC state IIRC. If there really is a need for an additional
> global flag, it should be enabled via drm_vblank_init(), but not
> drm_irq_install().

Yes, for modern drivers. Not for legacy drivers.

Also drivers shouldn't maint the drm_device->irq_enabled flag at all,
that's only done for legacy drivers. So if the enable/disable the irq
over suspend/resume then if we go with the full split between kms and
legacy driver paths, then for kms drivers they should _not_ update
irq_enabled.

> >> Also as-is this breaks legacy drivers, which do enable/disable irqs at
> >> runtime with the legacy IRQ_CONTROL ioctl, so we can't just throw this
> >> out. Hence this cleanup here is only ok for non-legacy drivers.
>
> That only affects drm_wait_vblank_ioctl(). We could have make the test a
> bit more fancy to only test this field for legacy drivers.

Yeah that's needed in there.

> >> Finally if you do this cleanup I think we should go through drivers an=
d
> >> drop the irq_enabled =3D true settings that are littered around. For t=
hat
> >> cleanup I think this patch makes sense.
>
> As I said, it was the initial plan. For a quick grepping, drivers appear
> to use irq_enabled mostly redundantly to the core. For the few drivers
> that might need irq_enabled, we could duplicate it in the local device
> structure.

I only see 3 cases
- legacy drivers
- kms drivers which set it to get around these tests
- radeon (amdgpu is just copypasta from radeon), which probably carry
this purely for hysterical reasons back from the days when radeon.ko
could run in both legacy or in kms mode with a cmdline option.

There's some more drivers that use it because they don't trust the irq
cleanup, I'd also leave them as-is.

Legacy drivers you can ignore, radeon/amd probably to big a fish to
fry to clean up the confusione&mess, everyone else you should be able
to just delete all the lines that set irq_enabled to something. With
that (but not yet your full plan to make drm_irq.c optional) and the
fixed version of this patch (i.e. not breaking legacy drivers) I think
this here makes sense as a cleanup.
-Daniel

>
> Best regards
> Thomas
>
> >
> > I forgot to add: We already do this check that you're adding here
> > because later on we validate the provided crtc index against
> > dev->num_crtcs. vblank support is confusing because it lives both in a
> > kms and legacy driver world.
> > -Daniel
> >
> >>> This change also removes the DRM framework's only dependency on
> >>> IRQ state for non-legacy drivers.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>   drivers/gpu/drm/drm_irq.c    | 10 +++-------
> >>>   drivers/gpu/drm/drm_vblank.c |  6 +++---
> >>>   2 files changed, 6 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> >>> index c3bd664ea733..1d7785721323 100644
> >>> --- a/drivers/gpu/drm/drm_irq.c
> >>> +++ b/drivers/gpu/drm/drm_irq.c
> >>> @@ -74,10 +74,8 @@
> >>>    * only supports devices with a single interrupt on the main device=
 stored in
> >>>    * &drm_device.dev and set as the device paramter in drm_dev_alloc(=
).
> >>>    *
> >>> - * These IRQ helpers are strictly optional. Drivers which roll their=
 own only
> >>> - * need to set &drm_device.irq_enabled to signal the DRM core that v=
blank
> >>> - * interrupts are working. Since these helpers don't automatically c=
lean up the
> >>> - * requested interrupt like e.g. devm_request_irq() they're not real=
ly
> >>> + * These IRQ helpers are strictly optional. Since these helpers don'=
t automatically
> >>> + * clean up the requested interrupt like e.g. devm_request_irq() the=
y're not really
> >>>    * recommended.
> >>>    */
> >>>
> >>> @@ -91,9 +89,7 @@
> >>>    * and after the installation.
> >>>    *
> >>>    * This is the simplified helper interface provided for drivers wit=
h no special
> >>> - * needs. Drivers which need to install interrupt handlers for multi=
ple
> >>> - * interrupts must instead set &drm_device.irq_enabled to signal the=
 DRM core
> >>> - * that vblank interrupts are available.
> >>> + * needs.
> >>>    *
> >>>    * @irq must match the interrupt number that would be passed to req=
uest_irq(),
> >>>    * if called directly instead of using this helper function.
> >>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblan=
k.c
> >>> index 3417e1ac7918..165286fef478 100644
> >>> --- a/drivers/gpu/drm/drm_vblank.c
> >>> +++ b/drivers/gpu/drm/drm_vblank.c
> >>> @@ -1748,7 +1748,7 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
> >>>        unsigned int pipe_index;
> >>>        unsigned int flags, pipe, high_pipe;
> >>>
> >>> -     if (!dev->irq_enabled)
> >>> +     if (!drm_dev_has_vblank(dev))
> >>>                return -EOPNOTSUPP;
> >>>
> >>>        if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> >>> @@ -2023,7 +2023,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_devi=
ce *dev, void *data,
> >>>        if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >>>                return -EOPNOTSUPP;
> >>>
> >>> -     if (!dev->irq_enabled)
> >>> +     if (!drm_dev_has_vblank(dev))
> >>>                return -EOPNOTSUPP;
> >>>
> >>>        crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> >>> @@ -2082,7 +2082,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_de=
vice *dev, void *data,
> >>>        if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >>>                return -EOPNOTSUPP;
> >>>
> >>> -     if (!dev->irq_enabled)
> >>> +     if (!drm_dev_has_vblank(dev))
> >>>                return -EOPNOTSUPP;
> >>>
> >>>        crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
> >>> --
> >>> 2.31.1
> >>>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
