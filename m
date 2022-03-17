Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A133E4DC4E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DD210E568;
	Thu, 17 Mar 2022 11:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701810E568
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:35:19 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so5219455pjl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmhrdrwvhZGkS4pJWY9HTwbXZn5LfEicOtWQD3VYP0A=;
 b=GDB5z9UeDLHYkiVbYNq3epFqbuVZiOc4EVQnt4z0fYRvNpJsVcYkV9I1gB4uoYhsp2
 gs3WroruXOiIYIho6CahaecHSWxv117Qr9tEAqa7lJC92BgyKRrwgPNT8LvF+9IUEJeM
 5JP62Hp4Twpm1ahjArfv0xGfb3yPsXA0zp9l4wO4DTzBr/iuWdmBF4zsL8cOefmZX4nY
 HxnKlKLMUCoEa1WqkL0f7yeyoaH2qRPO69KZ0go9KCqPO1WdaziD42H0voBWLEOd5xfi
 45c3G4EXtJWJB4LAJ9ZjKw72KMxF7vnEm9qSb1bbcjkBE4mEbCJvHt6vXJvC/0H4LMr5
 vyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmhrdrwvhZGkS4pJWY9HTwbXZn5LfEicOtWQD3VYP0A=;
 b=QbAkFrxCZeeUvmXQ9l3tx2BMrOmqi7ond0p7nu9dZnB3kBE6Db50z7/WPv8UTCatd2
 SMeLgQsIijVIpyv+aY5+9MoyFZL5LYh7ox5M4Ps2aFwCIC2SzPnNM6V/w2Mkag8x0tAt
 8N3pLxylnYOfehC1hel7qzCwES3qzL+9mmyDBGMtn9DH7vGz+aA/kSzumkmHz948qq9b
 8f3ZD6lQOM6y/W4lpPFTnS5NbuUgItCHez+qJUg2EJOqtbbDvqJosS8EwJaM7ja0MVJg
 7lnghzD4C7cA00F9T4umN4KNJTnG+ldDXFYCthQ1VWSf5KDgtE/DHBPRFLdgWL950Bdd
 hgIQ==
X-Gm-Message-State: AOAM533ZrWBmEYWKiUuqu2TuxHPmBQwxXqcjXm1tO8JoFDgOHeMWze9S
 TpUksJ1amgIeHpgeR38bstTo626MXow/hOCTyow=
X-Google-Smtp-Source: ABdhPJyLcvCh6I2eHsXxxbzS8a5VeSxEEDSE9O3Us8AQcf8GfNYoniBkkuxVw9PgT5A8VSg+DjKIUBQiO6xjoP6kuCo=
X-Received: by 2002:a17:90b:1c8a:b0:1c3:22be:fe31 with SMTP id
 oo10-20020a17090b1c8a00b001c322befe31mr15375640pjb.195.1647516918656; Thu, 17
 Mar 2022 04:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220317092555.17882-4-patrik.r.jakobsson@gmail.com>
 <YjMVSFkxdojBjFbP@phenom.ffwll.local>
In-Reply-To: <YjMVSFkxdojBjFbP@phenom.ffwll.local>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 17 Mar 2022 12:35:07 +0100
Message-ID: <CAMeQTsaN=WK9mV=n5nwYZbxsP=_pEmKcZ_qAqn+8=RUR3gMLmA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/gma500: Cosmetic cleanup of irq code
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 12:02 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Mar 17, 2022 at 10:25:55AM +0100, Patrik Jakobsson wrote:
> > Use the gma_ prefix instead of psb_ since the code is common for all
> > chips. Various coding style fixes. Removal of unused code. Removal of
> > duplicate function declarations.
>
> I didn't really find the above removal things, was that from an old commit
> message before you split those changes out?

I was thinking about the removal of mid_pipe_vsync() (unused code) and
the psb_irq declarations in psb_drv.h (duplicate function
declarations). Perhaps I should've split this up in several patches.

>
> Aside from that nit on the commit message on all 4 patches (btw you're
> threading is somehow broken in this series):

I have a new gitconfig on this machine. It's likely misconfigured with
--no-thread or something like that.

Thanks for the review.

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >  drivers/gpu/drm/gma500/gma_display.c |  8 +--
> >  drivers/gpu/drm/gma500/opregion.c    |  5 +-
> >  drivers/gpu/drm/gma500/power.c       | 10 +--
> >  drivers/gpu/drm/gma500/psb_drv.c     |  2 +-
> >  drivers/gpu/drm/gma500/psb_drv.h     | 11 ----
> >  drivers/gpu/drm/gma500/psb_irq.c     | 94 +++++++++++-----------------
> >  drivers/gpu/drm/gma500/psb_irq.h     | 19 +++---
> >  7 files changed, 57 insertions(+), 92 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> > index 931ffb192fc4..1d7964c339f4 100644
> > --- a/drivers/gpu/drm/gma500/gma_display.c
> > +++ b/drivers/gpu/drm/gma500/gma_display.c
> > @@ -17,7 +17,7 @@
> >  #include "framebuffer.h"
> >  #include "gem.h"
> >  #include "gma_display.h"
> > -#include "psb_drv.h"
> > +#include "psb_irq.h"
> >  #include "psb_intel_drv.h"
> >  #include "psb_intel_reg.h"
> >
> > @@ -572,9 +572,9 @@ const struct drm_crtc_funcs gma_crtc_funcs = {
> >       .set_config = gma_crtc_set_config,
> >       .destroy = gma_crtc_destroy,
> >       .page_flip = gma_crtc_page_flip,
> > -     .enable_vblank = psb_enable_vblank,
> > -     .disable_vblank = psb_disable_vblank,
> > -     .get_vblank_counter = psb_get_vblank_counter,
> > +     .enable_vblank = gma_enable_vblank,
> > +     .disable_vblank = gma_disable_vblank,
> > +     .get_vblank_counter = gma_get_vblank_counter,
> >  };
> >
> >  /*
> > diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
> > index fef04ff8c3a9..dc494df71a48 100644
> > --- a/drivers/gpu/drm/gma500/opregion.c
> > +++ b/drivers/gpu/drm/gma500/opregion.c
> > @@ -23,6 +23,7 @@
> >   */
> >  #include <linux/acpi.h>
> >  #include "psb_drv.h"
> > +#include "psb_irq.h"
> >  #include "psb_intel_reg.h"
> >
> >  #define PCI_ASLE 0xe4
> > @@ -217,8 +218,8 @@ void psb_intel_opregion_enable_asle(struct drm_device *dev)
> >       if (asle && system_opregion ) {
> >               /* Don't do this on Medfield or other non PC like devices, they
> >                  use the bit for something different altogether */
> > -             psb_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_ENABLE);
> > -             psb_enable_pipestat(dev_priv, 1, PIPE_LEGACY_BLC_EVENT_ENABLE);
> > +             gma_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_ENABLE);
> > +             gma_enable_pipestat(dev_priv, 1, PIPE_LEGACY_BLC_EVENT_ENABLE);
> >
> >               asle->tche = ASLE_ALS_EN | ASLE_BLC_EN | ASLE_PFIT_EN
> >                                                               | ASLE_PFMB_EN;
> > diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> > index 6f917cfef65b..b91de6d36e41 100644
> > --- a/drivers/gpu/drm/gma500/power.c
> > +++ b/drivers/gpu/drm/gma500/power.c
> > @@ -201,7 +201,7 @@ int gma_power_suspend(struct device *_dev)
> >                       dev_err(dev->dev, "GPU hardware busy, cannot suspend\n");
> >                       return -EBUSY;
> >               }
> > -             psb_irq_uninstall(dev);
> > +             gma_irq_uninstall(dev);
> >               gma_suspend_display(dev);
> >               gma_suspend_pci(pdev);
> >       }
> > @@ -223,8 +223,8 @@ int gma_power_resume(struct device *_dev)
> >       mutex_lock(&power_mutex);
> >       gma_resume_pci(pdev);
> >       gma_resume_display(pdev);
> > -     psb_irq_preinstall(dev);
> > -     psb_irq_postinstall(dev);
> > +     gma_irq_preinstall(dev);
> > +     gma_irq_postinstall(dev);
> >       mutex_unlock(&power_mutex);
> >       return 0;
> >  }
> > @@ -270,8 +270,8 @@ bool gma_power_begin(struct drm_device *dev, bool force_on)
> >       /* Ok power up needed */
> >       ret = gma_resume_pci(pdev);
> >       if (ret == 0) {
> > -             psb_irq_preinstall(dev);
> > -             psb_irq_postinstall(dev);
> > +             gma_irq_preinstall(dev);
> > +             gma_irq_postinstall(dev);
> >               pm_runtime_get(dev->dev);
> >               dev_priv->display_count++;
> >               spin_unlock_irqrestore(&power_ctrl_lock, flags);
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> > index e30b58184156..82d51e9821ad 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -380,7 +380,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >       PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >
> > -     psb_irq_install(dev, pdev->irq);
> > +     gma_irq_install(dev, pdev->irq);
> >
> >       dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> > index aed167af13c5..0ddfec1a0851 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.h
> > +++ b/drivers/gpu/drm/gma500/psb_drv.h
> > @@ -609,17 +609,6 @@ struct psb_ops {
> >       int i2c_bus;            /* I2C bus identifier for Moorestown */
> >  };
> >
> > -/* psb_irq.c */
> > -extern int psb_enable_vblank(struct drm_crtc *crtc);
> > -extern void psb_disable_vblank(struct drm_crtc *crtc);
> > -void
> > -psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
> > -
> > -void
> > -psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
> > -
> > -extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
> > -
> >  /* psb_lid.c */
> >  extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> >  extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> > index ccf402007beb..2e8ded532930 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.c
> > +++ b/drivers/gpu/drm/gma500/psb_irq.c
> > @@ -21,8 +21,7 @@
> >   * inline functions
> >   */
> >
> > -static inline u32
> > -psb_pipestat(int pipe)
> > +static inline u32 gma_pipestat(int pipe)
> >  {
> >       if (pipe == 0)
> >               return PIPEASTAT;
> > @@ -33,8 +32,7 @@ psb_pipestat(int pipe)
> >       BUG();
> >  }
> >
> > -static inline u32
> > -mid_pipe_event(int pipe)
> > +static inline u32 gma_pipe_event(int pipe)
> >  {
> >       if (pipe == 0)
> >               return _PSB_PIPEA_EVENT_FLAG;
> > @@ -45,20 +43,7 @@ mid_pipe_event(int pipe)
> >       BUG();
> >  }
> >
> > -static inline u32
> > -mid_pipe_vsync(int pipe)
> > -{
> > -     if (pipe == 0)
> > -             return _PSB_VSYNC_PIPEA_FLAG;
> > -     if (pipe == 1)
> > -             return _PSB_VSYNC_PIPEB_FLAG;
> > -     if (pipe == 2)
> > -             return _MDFLD_PIPEC_VBLANK_FLAG;
> > -     BUG();
> > -}
> > -
> > -static inline u32
> > -mid_pipeconf(int pipe)
> > +static inline u32 gma_pipeconf(int pipe)
> >  {
> >       if (pipe == 0)
> >               return PIPEACONF;
> > @@ -69,11 +54,10 @@ mid_pipeconf(int pipe)
> >       BUG();
> >  }
> >
> > -void
> > -psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> > +void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> >  {
> >       if ((dev_priv->pipestat[pipe] & mask) != mask) {
> > -             u32 reg = psb_pipestat(pipe);
> > +             u32 reg = gma_pipestat(pipe);
> >               dev_priv->pipestat[pipe] |= mask;
> >               /* Enable the interrupt, clear any pending status */
> >               if (gma_power_begin(&dev_priv->dev, false)) {
> > @@ -86,11 +70,10 @@ psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> >       }
> >  }
> >
> > -void
> > -psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> > +void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> >  {
> >       if ((dev_priv->pipestat[pipe] & mask) != 0) {
> > -             u32 reg = psb_pipestat(pipe);
> > +             u32 reg = gma_pipestat(pipe);
> >               dev_priv->pipestat[pipe] &= ~mask;
> >               if (gma_power_begin(&dev_priv->dev, false)) {
> >                       u32 writeVal = PSB_RVDC32(reg);
> > @@ -105,12 +88,12 @@ psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
> >  /*
> >   * Display controller interrupt handler for pipe event.
> >   */
> > -static void mid_pipe_event_handler(struct drm_device *dev, int pipe)
> > +static void gma_pipe_event_handler(struct drm_device *dev, int pipe)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >
> >       uint32_t pipe_stat_val = 0;
> > -     uint32_t pipe_stat_reg = psb_pipestat(pipe);
> > +     uint32_t pipe_stat_reg = gma_pipestat(pipe);
> >       uint32_t pipe_enable = dev_priv->pipestat[pipe];
> >       uint32_t pipe_status = dev_priv->pipestat[pipe] >> 16;
> >       uint32_t pipe_clear;
> > @@ -160,22 +143,22 @@ static void mid_pipe_event_handler(struct drm_device *dev, int pipe)
> >  /*
> >   * Display controller interrupt handler.
> >   */
> > -static void psb_vdc_interrupt(struct drm_device *dev, uint32_t vdc_stat)
> > +static void gma_vdc_interrupt(struct drm_device *dev, uint32_t vdc_stat)
> >  {
> >       if (vdc_stat & _PSB_IRQ_ASLE)
> >               psb_intel_opregion_asle_intr(dev);
> >
> >       if (vdc_stat & _PSB_VSYNC_PIPEA_FLAG)
> > -             mid_pipe_event_handler(dev, 0);
> > +             gma_pipe_event_handler(dev, 0);
> >
> >       if (vdc_stat & _PSB_VSYNC_PIPEB_FLAG)
> > -             mid_pipe_event_handler(dev, 1);
> > +             gma_pipe_event_handler(dev, 1);
> >  }
> >
> >  /*
> >   * SGX interrupt handler
> >   */
> > -static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
> > +static void gma_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       u32 val, addr;
> > @@ -222,7 +205,7 @@ static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
> >       PSB_RSGX32(PSB_CR_EVENT_HOST_CLEAR2);
> >  }
> >
> > -static irqreturn_t psb_irq_handler(int irq, void *arg)
> > +static irqreturn_t gma_irq_handler(int irq, void *arg)
> >  {
> >       struct drm_device *dev = arg;
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> > @@ -246,14 +229,14 @@ static irqreturn_t psb_irq_handler(int irq, void *arg)
> >       spin_unlock(&dev_priv->irqmask_lock);
> >
> >       if (dsp_int && gma_power_is_on(dev)) {
> > -             psb_vdc_interrupt(dev, vdc_stat);
> > +             gma_vdc_interrupt(dev, vdc_stat);
> >               handled = 1;
> >       }
> >
> >       if (sgx_int) {
> >               sgx_stat_1 = PSB_RSGX32(PSB_CR_EVENT_STATUS);
> >               sgx_stat_2 = PSB_RSGX32(PSB_CR_EVENT_STATUS2);
> > -             psb_sgx_interrupt(dev, sgx_stat_1, sgx_stat_2);
> > +             gma_sgx_interrupt(dev, sgx_stat_1, sgx_stat_2);
> >               handled = 1;
> >       }
> >
> > @@ -274,7 +257,7 @@ static irqreturn_t psb_irq_handler(int irq, void *arg)
> >       return IRQ_HANDLED;
> >  }
> >
> > -void psb_irq_preinstall(struct drm_device *dev)
> > +void gma_irq_preinstall(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       unsigned long irqflags;
> > @@ -303,7 +286,7 @@ void psb_irq_preinstall(struct drm_device *dev)
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >  }
> >
> > -void psb_irq_postinstall(struct drm_device *dev)
> > +void gma_irq_postinstall(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       unsigned long irqflags;
> > @@ -322,9 +305,9 @@ void psb_irq_postinstall(struct drm_device *dev)
> >
> >       for (i = 0; i < dev->num_crtcs; ++i) {
> >               if (dev->vblank[i].enabled)
> > -                     psb_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> > +                     gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> >               else
> > -                     psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> > +                     gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> >       }
> >
> >       if (dev_priv->ops->hotplug_enable)
> > @@ -333,26 +316,26 @@ void psb_irq_postinstall(struct drm_device *dev)
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >  }
> >
> > -int psb_irq_install(struct drm_device *dev, unsigned int irq)
> > +int gma_irq_install(struct drm_device *dev, unsigned int irq)
> >  {
> >       int ret;
> >
> >       if (irq == IRQ_NOTCONNECTED)
> >               return -ENOTCONN;
> >
> > -     psb_irq_preinstall(dev);
> > +     gma_irq_preinstall(dev);
> >
> >       /* PCI devices require shared interrupts. */
> > -     ret = request_irq(irq, psb_irq_handler, IRQF_SHARED, dev->driver->name, dev);
> > +     ret = request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
> >       if (ret)
> >               return ret;
> >
> > -     psb_irq_postinstall(dev);
> > +     gma_irq_postinstall(dev);
> >
> >       return 0;
> >  }
> >
> > -void psb_irq_uninstall(struct drm_device *dev)
> > +void gma_irq_uninstall(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       struct pci_dev *pdev = to_pci_dev(dev->dev);
> > @@ -368,7 +351,7 @@ void psb_irq_uninstall(struct drm_device *dev)
> >
> >       for (i = 0; i < dev->num_crtcs; ++i) {
> >               if (dev->vblank[i].enabled)
> > -                     psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> > +                     gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> >       }
> >
> >       dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |
> > @@ -388,17 +371,14 @@ void psb_irq_uninstall(struct drm_device *dev)
> >       free_irq(pdev->irq, dev);
> >  }
> >
> > -/*
> > - * It is used to enable VBLANK interrupt
> > - */
> > -int psb_enable_vblank(struct drm_crtc *crtc)
> > +int gma_enable_vblank(struct drm_crtc *crtc)
> >  {
> >       struct drm_device *dev = crtc->dev;
> >       unsigned int pipe = crtc->index;
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       unsigned long irqflags;
> >       uint32_t reg_val = 0;
> > -     uint32_t pipeconf_reg = mid_pipeconf(pipe);
> > +     uint32_t pipeconf_reg = gma_pipeconf(pipe);
> >
> >       if (gma_power_begin(dev, false)) {
> >               reg_val = REG_READ(pipeconf_reg);
> > @@ -417,17 +397,14 @@ int psb_enable_vblank(struct drm_crtc *crtc)
> >
> >       PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> >       PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> > -     psb_enable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE);
> > +     gma_enable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE);
> >
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >
> >       return 0;
> >  }
> >
> > -/*
> > - * It is used to disable VBLANK interrupt
> > - */
> > -void psb_disable_vblank(struct drm_crtc *crtc)
> > +void gma_disable_vblank(struct drm_crtc *crtc)
> >  {
> >       struct drm_device *dev = crtc->dev;
> >       unsigned int pipe = crtc->index;
> > @@ -443,7 +420,7 @@ void psb_disable_vblank(struct drm_crtc *crtc)
> >
> >       PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> >       PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> > -     psb_disable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE);
> > +     gma_disable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE);
> >
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >  }
> > @@ -451,7 +428,7 @@ void psb_disable_vblank(struct drm_crtc *crtc)
> >  /* Called from drm generic code, passed a 'crtc', which
> >   * we use as a pipe index
> >   */
> > -u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> > +u32 gma_get_vblank_counter(struct drm_crtc *crtc)
> >  {
> >       struct drm_device *dev = crtc->dev;
> >       unsigned int pipe = crtc->index;
> > @@ -486,8 +463,8 @@ u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> >
> >       if (!(reg_val & PIPEACONF_ENABLE)) {
> >               dev_err(dev->dev, "trying to get vblank count for disabled pipe %u\n",
> > -                                                             pipe);
> > -             goto psb_get_vblank_counter_exit;
> > +                     pipe);
> > +             goto err_gma_power_end;
> >       }
> >
> >       /*
> > @@ -506,8 +483,7 @@ u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> >
> >       count = (high1 << 8) | low;
> >
> > -psb_get_vblank_counter_exit:
> > -
> > +err_gma_power_end:
> >       gma_power_end(dev);
> >
> >       return count;
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
> > index a97cb49393d8..c22878914f5b 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.h
> > +++ b/drivers/gpu/drm/gma500/psb_irq.h
> > @@ -15,16 +15,15 @@
> >  struct drm_crtc;
> >  struct drm_device;
> >
> > -bool sysirq_init(struct drm_device *dev);
> > -void sysirq_uninit(struct drm_device *dev);
> > +void gma_irq_preinstall(struct drm_device *dev);
> > +void gma_irq_postinstall(struct drm_device *dev);
> > +int  gma_irq_install(struct drm_device *dev, unsigned int irq);
> > +void gma_irq_uninstall(struct drm_device *dev);
> >
> > -void psb_irq_preinstall(struct drm_device *dev);
> > -void psb_irq_postinstall(struct drm_device *dev);
> > -int  psb_irq_install(struct drm_device *dev, unsigned int irq);
> > -void psb_irq_uninstall(struct drm_device *dev);
> > -
> > -int  psb_enable_vblank(struct drm_crtc *crtc);
> > -void psb_disable_vblank(struct drm_crtc *crtc);
> > -u32  psb_get_vblank_counter(struct drm_crtc *crtc);
> > +int  gma_enable_vblank(struct drm_crtc *crtc);
> > +void gma_disable_vblank(struct drm_crtc *crtc);
> > +u32  gma_get_vblank_counter(struct drm_crtc *crtc);
> > +void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
> > +void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
> >
> >  #endif /* _PSB_IRQ_H_ */
> > --
> > 2.35.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
