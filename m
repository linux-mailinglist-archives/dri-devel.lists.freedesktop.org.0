Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9D39F236
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FF6EB58;
	Tue,  8 Jun 2021 09:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54076EB58
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:23:13 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r17so10667980oic.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zl2n/CpT8A2joCvlCo8DdAzWIqcqVzhPIjQOL/Z8xDU=;
 b=HyAZO55JlxnfmrTksFmP+9vBjAVNQvnGOk8tin8xqt+t3LYe00RyycNhRzqqgx3LPp
 GTBsgqXz7g3ukTRaSYE8jcOXJwNdxogtCD8ZgA4IHTjDfOLnBkYY5PGmlzzx+rODNXwl
 P0sdjjOHAXKc4E2tBKYUrxcjzdSRaQg/4SW4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zl2n/CpT8A2joCvlCo8DdAzWIqcqVzhPIjQOL/Z8xDU=;
 b=UPEuq194f41DKIVIXL3RhKPzYMRIELRdrmXXkR1tr2UZtBR3zJiRwrHu81LKOdLxHm
 znA/edFVVpm0fQR/LT21euV6S1FeO5AaPK5ntcNIBQRnoAH/7wHTg3Tfx5rsRayy2198
 C9xxpKQcTKL0Wu/U0W1uwUMPTMNbxAT0H+S4BNNhn+9nZVd9SwlyqzcRl/MukWEsx8pY
 ol8YqT8x7cAD8CZLTw0xJyhnsDrwHa6v4PHKaIhvT8Cmd9gXxwlQUOkaaJBjDhcXqMF0
 +ztF1zRSXK6RcyDcRWoMuq19xGDedkyjCuDyEPJeOpCHnNC0mg6wMo9uBsqTTNCbrP2f
 OB9g==
X-Gm-Message-State: AOAM532fBrDveCo4N0VMg82KlBThi6cPkaFrmLeAl8vPTNnFKlx4GqwM
 kcOY8/vMtlTxmmzhZ/tmFIABp/dG7IuvHT5tekTp0basHt8=
X-Google-Smtp-Source: ABdhPJyrwRyrETx2ci3it5IejP4A0mVEn0AaZRvsaejtGRXw+mJgDm0s6IgQbNfHeI/NTKeUUBUt/0zbDN5c9XVtyN8=
X-Received: by 2002:aca:530f:: with SMTP id h15mr2197053oib.128.1623144193021; 
 Tue, 08 Jun 2021 02:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
In-Reply-To: <YL8198Rj9lBlfoQE@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 8 Jun 2021 11:23:02 +0200
Message-ID: <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 11:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jun 08, 2021 at 11:03:01AM +0200, Thomas Zimmermann wrote:
> > Replace the IRQ check in VBLANK ioctls with a check for vblank
> > support. IRQs might be enabled wthout vblanking being supported.
>
> Nah, or if they are, that's a broken driver. irq_enabled here really only
> means vblank_irq_enabled (maybe we should rename it). I'd like to
> understand the motivation here a bit better to make sure we'r not just
> papering over a driver bug.
>
> Also as-is this breaks legacy drivers, which do enable/disable irqs at
> runtime with the legacy IRQ_CONTROL ioctl, so we can't just throw this
> out. Hence this cleanup here is only ok for non-legacy drivers.
>
> Finally if you do this cleanup I think we should go through drivers and
> drop the irq_enabled = true settings that are littered around. For that
> cleanup I think this patch makes sense.

I forgot to add: We already do this check that you're adding here
because later on we validate the provided crtc index against
dev->num_crtcs. vblank support is confusing because it lives both in a
kms and legacy driver world.
-Daniel

> > This change also removes the DRM framework's only dependency on
> > IRQ state for non-legacy drivers.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_irq.c    | 10 +++-------
> >  drivers/gpu/drm/drm_vblank.c |  6 +++---
> >  2 files changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> > index c3bd664ea733..1d7785721323 100644
> > --- a/drivers/gpu/drm/drm_irq.c
> > +++ b/drivers/gpu/drm/drm_irq.c
> > @@ -74,10 +74,8 @@
> >   * only supports devices with a single interrupt on the main device stored in
> >   * &drm_device.dev and set as the device paramter in drm_dev_alloc().
> >   *
> > - * These IRQ helpers are strictly optional. Drivers which roll their own only
> > - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> > - * interrupts are working. Since these helpers don't automatically clean up the
> > - * requested interrupt like e.g. devm_request_irq() they're not really
> > + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> > + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
> >   * recommended.
> >   */
> >
> > @@ -91,9 +89,7 @@
> >   * and after the installation.
> >   *
> >   * This is the simplified helper interface provided for drivers with no special
> > - * needs. Drivers which need to install interrupt handlers for multiple
> > - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> > - * that vblank interrupts are available.
> > + * needs.
> >   *
> >   * @irq must match the interrupt number that would be passed to request_irq(),
> >   * if called directly instead of using this helper function.
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 3417e1ac7918..165286fef478 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -1748,7 +1748,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> >       unsigned int pipe_index;
> >       unsigned int flags, pipe, high_pipe;
> >
> > -     if (!dev->irq_enabled)
> > +     if (!drm_dev_has_vblank(dev))
> >               return -EOPNOTSUPP;
> >
> >       if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > @@ -2023,7 +2023,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
> >       if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >               return -EOPNOTSUPP;
> >
> > -     if (!dev->irq_enabled)
> > +     if (!drm_dev_has_vblank(dev))
> >               return -EOPNOTSUPP;
> >
> >       crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> > @@ -2082,7 +2082,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
> >       if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >               return -EOPNOTSUPP;
> >
> > -     if (!dev->irq_enabled)
> > +     if (!drm_dev_has_vblank(dev))
> >               return -EOPNOTSUPP;
> >
> >       crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
