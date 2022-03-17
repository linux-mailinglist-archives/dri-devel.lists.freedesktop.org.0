Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4C4DD036
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393E110E112;
	Thu, 17 Mar 2022 21:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B4910E112
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:31:45 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id h2so7885922pfh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=99oLV584BsvjZjycQfwiE6rz55m8gnsmljrrPlv47w8=;
 b=jhLpWDDoFd0Qds0R3cf2kfE7STh3QZJiOM8xuLWpjl80mCVHEGR2hzgmqfcL/2XKVE
 OKnogajXtNpaxX+dO0iwcSYRPGnftYrd9EMuc3UoGpvgyJoLXmUb7dSoSFVtRqrjDKE2
 87phc20SgyoQ6D4jki+umL36BkUokobry6JSHCEijuFQTCSahmiHzCWwpiWIwEsgwdsC
 fqaQZeiNt7d1mG57CTb/ulnZBBW6L4ZihgzT+OX2JJ4V8DpJZZ4m3vMJLPDZuBYbZa/n
 M6Z+L0G2RZV4V8zQlrImu58X0r/uPKaxsgytTDE+LwEAlAgCsBNPJd5HxbM+JFfnVVS9
 YUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=99oLV584BsvjZjycQfwiE6rz55m8gnsmljrrPlv47w8=;
 b=irHFIpKVg94ovg4ec9Hw28PUeSsP92O6Dh0cYSLjaNnvW8qhI+seBSFgCPRGLLOVK8
 6cyggkZtkK+/ZqF1s0PKrPk8i3Js/PguETEdjJAESzTSxI/y4HIT3v4ni+FQrc0SBIOY
 tz7PrlvBXkrJNMY0JWKP8mA1MOSI3dXSLrvofjkiAwNw6T+Fp12MyUCE408oNyKZ7tRs
 BwdVcQjUMgP6z2jsy4B+C7riBqeoB2XVqdXlNvEbDUw+YsjK9BZB72zN3KQVRQrTmWET
 17Q1EQF/Wj/iuJFwDEOX3WQ/vCU4lsELkWAEiTF9G1f238fd10Yqul8anKyKSZAe/5bR
 qmrg==
X-Gm-Message-State: AOAM531Q2gezQLzuuF/XvLn2cagVvYheXCoGA6nEOFiqDNoiBD7ZPIAc
 CzaZgYHf/CFITvt0jSILe9V8RfqjwidOfQNNh/o=
X-Google-Smtp-Source: ABdhPJz4iP9PQ7MWRqgeGBcXwPy0vQI1ZV2Ezrvrq+/0pKh+OpSj+twyeU7Pwi4VnxAXu94yn59eRLI4aGBs5BzpJ3w=
X-Received: by 2002:a63:1662:0:b0:378:8b0b:1c9 with SMTP id
 34-20020a631662000000b003788b0b01c9mr5432189pgw.537.1647552704893; Thu, 17
 Mar 2022 14:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220317092555.17882-4-patrik.r.jakobsson@gmail.com>
 <a52895db-8c71-4c4f-6771-3d715979a50f@suse.de>
In-Reply-To: <a52895db-8c71-4c4f-6771-3d715979a50f@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 17 Mar 2022 22:31:33 +0100
Message-ID: <CAMeQTsaL4FEmVAzbHgpzcz4V-wFMZ=Li+jCBtLVc1ApPjau57g@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/gma500: Cosmetic cleanup of irq code
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 8:57 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Patrik
>
> Am 17.03.22 um 10:25 schrieb Patrik Jakobsson:
> > Use the gma_ prefix instead of psb_ since the code is common for all
> > chips. Various coding style fixes. Removal of unused code. Removal of
> > duplicate function declarations.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >   drivers/gpu/drm/gma500/gma_display.c |  8 +--
> >   drivers/gpu/drm/gma500/opregion.c    |  5 +-
> >   drivers/gpu/drm/gma500/power.c       | 10 +--
> >   drivers/gpu/drm/gma500/psb_drv.c     |  2 +-
> >   drivers/gpu/drm/gma500/psb_drv.h     | 11 ----
> >   drivers/gpu/drm/gma500/psb_irq.c     | 94 +++++++++++----------------=
-
> >   drivers/gpu/drm/gma500/psb_irq.h     | 19 +++---
> >   7 files changed, 57 insertions(+), 92 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma=
500/gma_display.c
> > index 931ffb192fc4..1d7964c339f4 100644
> > --- a/drivers/gpu/drm/gma500/gma_display.c
> > +++ b/drivers/gpu/drm/gma500/gma_display.c
> > @@ -17,7 +17,7 @@
> >   #include "framebuffer.h"
> >   #include "gem.h"
> >   #include "gma_display.h"
> > -#include "psb_drv.h"
> > +#include "psb_irq.h"
> >   #include "psb_intel_drv.h"
> >   #include "psb_intel_reg.h"
> >
> > @@ -572,9 +572,9 @@ const struct drm_crtc_funcs gma_crtc_funcs =3D {
> >       .set_config =3D gma_crtc_set_config,
> >       .destroy =3D gma_crtc_destroy,
> >       .page_flip =3D gma_crtc_page_flip,
> > -     .enable_vblank =3D psb_enable_vblank,
> > -     .disable_vblank =3D psb_disable_vblank,
> > -     .get_vblank_counter =3D psb_get_vblank_counter,
> > +     .enable_vblank =3D gma_enable_vblank,
> > +     .disable_vblank =3D gma_disable_vblank,
> > +     .get_vblank_counter =3D gma_get_vblank_counter,
>
> I'd prefix these functions with gma_crtc_ to align their naming with the
> others. They are CRTC functions, after all.

Yes, that makes sense. I'll send a follow-up patch.

>
> Apart from that,
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Best regards
> Thomas
>
> >   };
> >
> >   /*
> > diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500=
/opregion.c
> > index fef04ff8c3a9..dc494df71a48 100644
> > --- a/drivers/gpu/drm/gma500/opregion.c
> > +++ b/drivers/gpu/drm/gma500/opregion.c
> > @@ -23,6 +23,7 @@
> >    */
> >   #include <linux/acpi.h>
> >   #include "psb_drv.h"
> > +#include "psb_irq.h"
> >   #include "psb_intel_reg.h"
> >
> >   #define PCI_ASLE 0xe4
> > @@ -217,8 +218,8 @@ void psb_intel_opregion_enable_asle(struct drm_devi=
ce *dev)
> >       if (asle && system_opregion ) {
> >               /* Don't do this on Medfield or other non PC like devices=
, they
> >                  use the bit for something different altogether */
> > -             psb_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_EN=
ABLE);
> > -             psb_enable_pipestat(dev_priv, 1, PIPE_LEGACY_BLC_EVENT_EN=
ABLE);
> > +             gma_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_EN=
ABLE);
> > +             gma_enable_pipestat(dev_priv, 1, PIPE_LEGACY_BLC_EVENT_EN=
ABLE);
> >
> >               asle->tche =3D ASLE_ALS_EN | ASLE_BLC_EN | ASLE_PFIT_EN
> >                                                               | ASLE_PF=
MB_EN;
> > diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/po=
wer.c
> > index 6f917cfef65b..b91de6d36e41 100644
> > --- a/drivers/gpu/drm/gma500/power.c
> > +++ b/drivers/gpu/drm/gma500/power.c
> > @@ -201,7 +201,7 @@ int gma_power_suspend(struct device *_dev)
> >                       dev_err(dev->dev, "GPU hardware busy, cannot susp=
end\n");
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
> >   }
> > @@ -270,8 +270,8 @@ bool gma_power_begin(struct drm_device *dev, bool f=
orce_on)
> >       /* Ok power up needed */
> >       ret =3D gma_resume_pci(pdev);
> >       if (ret =3D=3D 0) {
> > -             psb_irq_preinstall(dev);
> > -             psb_irq_postinstall(dev);
> > +             gma_irq_preinstall(dev);
> > +             gma_irq_postinstall(dev);
> >               pm_runtime_get(dev->dev);
> >               dev_priv->display_count++;
> >               spin_unlock_irqrestore(&power_ctrl_lock, flags);
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/=
psb_drv.c
> > index e30b58184156..82d51e9821ad 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -380,7 +380,7 @@ static int psb_driver_load(struct drm_device *dev, =
unsigned long flags)
> >       PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >
> > -     psb_irq_install(dev, pdev->irq);
> > +     gma_irq_install(dev, pdev->irq);
> >
> >       dev->max_vblank_count =3D 0xffffff; /* only 24 bits of frame coun=
t */
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/=
psb_drv.h
> > index aed167af13c5..0ddfec1a0851 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.h
> > +++ b/drivers/gpu/drm/gma500/psb_drv.h
> > @@ -609,17 +609,6 @@ struct psb_ops {
> >       int i2c_bus;            /* I2C bus identifier for Moorestown */
> >   };
> >
> > -/* psb_irq.c */
> > -extern int psb_enable_vblank(struct drm_crtc *crtc);
> > -extern void psb_disable_vblank(struct drm_crtc *crtc);
> > -void
> > -psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 ma=
sk);
> > -
> > -void
> > -psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 m=
ask);
> > -
> > -extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
> > -
> >   /* psb_lid.c */
> >   extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> >   extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/=
psb_irq.c
> > index ccf402007beb..2e8ded532930 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.c
> > +++ b/drivers/gpu/drm/gma500/psb_irq.c
> > @@ -21,8 +21,7 @@
> >    * inline functions
> >    */
> >
> > -static inline u32
> > -psb_pipestat(int pipe)
> > +static inline u32 gma_pipestat(int pipe)
> >   {
> >       if (pipe =3D=3D 0)
> >               return PIPEASTAT;
> > @@ -33,8 +32,7 @@ psb_pipestat(int pipe)
> >       BUG();
> >   }
> >
> > -static inline u32
> > -mid_pipe_event(int pipe)
> > +static inline u32 gma_pipe_event(int pipe)
> >   {
> >       if (pipe =3D=3D 0)
> >               return _PSB_PIPEA_EVENT_FLAG;
> > @@ -45,20 +43,7 @@ mid_pipe_event(int pipe)
> >       BUG();
> >   }
> >
> > -static inline u32
> > -mid_pipe_vsync(int pipe)
> > -{
> > -     if (pipe =3D=3D 0)
> > -             return _PSB_VSYNC_PIPEA_FLAG;
> > -     if (pipe =3D=3D 1)
> > -             return _PSB_VSYNC_PIPEB_FLAG;
> > -     if (pipe =3D=3D 2)
> > -             return _MDFLD_PIPEC_VBLANK_FLAG;
> > -     BUG();
> > -}
> > -
> > -static inline u32
> > -mid_pipeconf(int pipe)
> > +static inline u32 gma_pipeconf(int pipe)
> >   {
> >       if (pipe =3D=3D 0)
> >               return PIPEACONF;
> > @@ -69,11 +54,10 @@ mid_pipeconf(int pipe)
> >       BUG();
> >   }
> >
> > -void
> > -psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 ma=
sk)
> > +void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u=
32 mask)
> >   {
> >       if ((dev_priv->pipestat[pipe] & mask) !=3D mask) {
> > -             u32 reg =3D psb_pipestat(pipe);
> > +             u32 reg =3D gma_pipestat(pipe);
> >               dev_priv->pipestat[pipe] |=3D mask;
> >               /* Enable the interrupt, clear any pending status */
> >               if (gma_power_begin(&dev_priv->dev, false)) {
> > @@ -86,11 +70,10 @@ psb_enable_pipestat(struct drm_psb_private *dev_pri=
v, int pipe, u32 mask)
> >       }
> >   }
> >
> > -void
> > -psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 m=
ask)
> > +void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, =
u32 mask)
> >   {
> >       if ((dev_priv->pipestat[pipe] & mask) !=3D 0) {
> > -             u32 reg =3D psb_pipestat(pipe);
> > +             u32 reg =3D gma_pipestat(pipe);
> >               dev_priv->pipestat[pipe] &=3D ~mask;
> >               if (gma_power_begin(&dev_priv->dev, false)) {
> >                       u32 writeVal =3D PSB_RVDC32(reg);
> > @@ -105,12 +88,12 @@ psb_disable_pipestat(struct drm_psb_private *dev_p=
riv, int pipe, u32 mask)
> >   /*
> >    * Display controller interrupt handler for pipe event.
> >    */
> > -static void mid_pipe_event_handler(struct drm_device *dev, int pipe)
> > +static void gma_pipe_event_handler(struct drm_device *dev, int pipe)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >
> >       uint32_t pipe_stat_val =3D 0;
> > -     uint32_t pipe_stat_reg =3D psb_pipestat(pipe);
> > +     uint32_t pipe_stat_reg =3D gma_pipestat(pipe);
> >       uint32_t pipe_enable =3D dev_priv->pipestat[pipe];
> >       uint32_t pipe_status =3D dev_priv->pipestat[pipe] >> 16;
> >       uint32_t pipe_clear;
> > @@ -160,22 +143,22 @@ static void mid_pipe_event_handler(struct drm_dev=
ice *dev, int pipe)
> >   /*
> >    * Display controller interrupt handler.
> >    */
> > -static void psb_vdc_interrupt(struct drm_device *dev, uint32_t vdc_sta=
t)
> > +static void gma_vdc_interrupt(struct drm_device *dev, uint32_t vdc_sta=
t)
> >   {
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
> >   }
> >
> >   /*
> >    * SGX interrupt handler
> >    */
> > -static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 =
stat_2)
> > +static void gma_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 =
stat_2)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >       u32 val, addr;
> > @@ -222,7 +205,7 @@ static void psb_sgx_interrupt(struct drm_device *de=
v, u32 stat_1, u32 stat_2)
> >       PSB_RSGX32(PSB_CR_EVENT_HOST_CLEAR2);
> >   }
> >
> > -static irqreturn_t psb_irq_handler(int irq, void *arg)
> > +static irqreturn_t gma_irq_handler(int irq, void *arg)
> >   {
> >       struct drm_device *dev =3D arg;
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > @@ -246,14 +229,14 @@ static irqreturn_t psb_irq_handler(int irq, void =
*arg)
> >       spin_unlock(&dev_priv->irqmask_lock);
> >
> >       if (dsp_int && gma_power_is_on(dev)) {
> > -             psb_vdc_interrupt(dev, vdc_stat);
> > +             gma_vdc_interrupt(dev, vdc_stat);
> >               handled =3D 1;
> >       }
> >
> >       if (sgx_int) {
> >               sgx_stat_1 =3D PSB_RSGX32(PSB_CR_EVENT_STATUS);
> >               sgx_stat_2 =3D PSB_RSGX32(PSB_CR_EVENT_STATUS2);
> > -             psb_sgx_interrupt(dev, sgx_stat_1, sgx_stat_2);
> > +             gma_sgx_interrupt(dev, sgx_stat_1, sgx_stat_2);
> >               handled =3D 1;
> >       }
> >
> > @@ -274,7 +257,7 @@ static irqreturn_t psb_irq_handler(int irq, void *a=
rg)
> >       return IRQ_HANDLED;
> >   }
> >
> > -void psb_irq_preinstall(struct drm_device *dev)
> > +void gma_irq_preinstall(struct drm_device *dev)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >       unsigned long irqflags;
> > @@ -303,7 +286,7 @@ void psb_irq_preinstall(struct drm_device *dev)
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >   }
> >
> > -void psb_irq_postinstall(struct drm_device *dev)
> > +void gma_irq_postinstall(struct drm_device *dev)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >       unsigned long irqflags;
> > @@ -322,9 +305,9 @@ void psb_irq_postinstall(struct drm_device *dev)
> >
> >       for (i =3D 0; i < dev->num_crtcs; ++i) {
> >               if (dev->vblank[i].enabled)
> > -                     psb_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTE=
RRUPT_ENABLE);
> > +                     gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTE=
RRUPT_ENABLE);
> >               else
> > -                     psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> > +                     gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> >       }
> >
> >       if (dev_priv->ops->hotplug_enable)
> > @@ -333,26 +316,26 @@ void psb_irq_postinstall(struct drm_device *dev)
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >   }
> >
> > -int psb_irq_install(struct drm_device *dev, unsigned int irq)
> > +int gma_irq_install(struct drm_device *dev, unsigned int irq)
> >   {
> >       int ret;
> >
> >       if (irq =3D=3D IRQ_NOTCONNECTED)
> >               return -ENOTCONN;
> >
> > -     psb_irq_preinstall(dev);
> > +     gma_irq_preinstall(dev);
> >
> >       /* PCI devices require shared interrupts. */
> > -     ret =3D request_irq(irq, psb_irq_handler, IRQF_SHARED, dev->drive=
r->name, dev);
> > +     ret =3D request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->drive=
r->name, dev);
> >       if (ret)
> >               return ret;
> >
> > -     psb_irq_postinstall(dev);
> > +     gma_irq_postinstall(dev);
> >
> >       return 0;
> >   }
> >
> > -void psb_irq_uninstall(struct drm_device *dev)
> > +void gma_irq_uninstall(struct drm_device *dev)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > @@ -368,7 +351,7 @@ void psb_irq_uninstall(struct drm_device *dev)
> >
> >       for (i =3D 0; i < dev->num_crtcs; ++i) {
> >               if (dev->vblank[i].enabled)
> > -                     psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> > +                     gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> >       }
> >
> >       dev_priv->vdc_irq_mask &=3D _PSB_IRQ_SGX_FLAG |
> > @@ -388,17 +371,14 @@ void psb_irq_uninstall(struct drm_device *dev)
> >       free_irq(pdev->irq, dev);
> >   }
> >
> > -/*
> > - * It is used to enable VBLANK interrupt
> > - */
> > -int psb_enable_vblank(struct drm_crtc *crtc)
> > +int gma_enable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >       unsigned long irqflags;
> >       uint32_t reg_val =3D 0;
> > -     uint32_t pipeconf_reg =3D mid_pipeconf(pipe);
> > +     uint32_t pipeconf_reg =3D gma_pipeconf(pipe);
> >
> >       if (gma_power_begin(dev, false)) {
> >               reg_val =3D REG_READ(pipeconf_reg);
> > @@ -417,17 +397,14 @@ int psb_enable_vblank(struct drm_crtc *crtc)
> >
> >       PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> >       PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> > -     psb_enable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE)=
;
> > +     gma_enable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE)=
;
> >
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >
> >       return 0;
> >   }
> >
> > -/*
> > - * It is used to disable VBLANK interrupt
> > - */
> > -void psb_disable_vblank(struct drm_crtc *crtc)
> > +void gma_disable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> > @@ -443,7 +420,7 @@ void psb_disable_vblank(struct drm_crtc *crtc)
> >
> >       PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> >       PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> > -     psb_disable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE=
);
> > +     gma_disable_pipestat(dev_priv, pipe, PIPE_VBLANK_INTERRUPT_ENABLE=
);
> >
> >       spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >   }
> > @@ -451,7 +428,7 @@ void psb_disable_vblank(struct drm_crtc *crtc)
> >   /* Called from drm generic code, passed a 'crtc', which
> >    * we use as a pipe index
> >    */
> > -u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> > +u32 gma_get_vblank_counter(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> > @@ -486,8 +463,8 @@ u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> >
> >       if (!(reg_val & PIPEACONF_ENABLE)) {
> >               dev_err(dev->dev, "trying to get vblank count for disable=
d pipe %u\n",
> > -                                                             pipe);
> > -             goto psb_get_vblank_counter_exit;
> > +                     pipe);
> > +             goto err_gma_power_end;
> >       }
> >
> >       /*
> > @@ -506,8 +483,7 @@ u32 psb_get_vblank_counter(struct drm_crtc *crtc)
> >
> >       count =3D (high1 << 8) | low;
> >
> > -psb_get_vblank_counter_exit:
> > -
> > +err_gma_power_end:
> >       gma_power_end(dev);
> >
> >       return count;
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/=
psb_irq.h
> > index a97cb49393d8..c22878914f5b 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.h
> > +++ b/drivers/gpu/drm/gma500/psb_irq.h
> > @@ -15,16 +15,15 @@
> >   struct drm_crtc;
> >   struct drm_device;
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
> > +void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u=
32 mask);
> > +void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, =
u32 mask);
> >
> >   #endif /* _PSB_IRQ_H_ */
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
