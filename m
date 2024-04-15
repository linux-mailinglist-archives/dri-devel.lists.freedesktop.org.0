Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EA98A4E2F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044531124D2;
	Mon, 15 Apr 2024 11:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lhZEbkBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02D1124D2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:57:10 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-617dfcf80aeso35132327b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713182229; x=1713787029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBxYjz6MX/OlZTk+0eLQ8y69qUY69D92qO2/S89tZRs=;
 b=lhZEbkBOtGjoSFfkq2iubUgBKLRr5EkgY/rFray1WGJZwXYTvtefXtcJYAh/BsWP4m
 8IkGPj6VanH1V8ayn6J45+SJ4pXVP5Oct3wDZeW/m+9VIJ8ThGv1RrtdN99jN0jV0Fzr
 d6VPB6dsZt/OBldsKxXuMK98el+ucJiywXHaPMrthdeZD5qkfHxZldg76t7Pugceua/U
 jI+/JuB0iFS/GauZVuji32aYw3bngJRXesf4mT7a8IXLxJDOvQBPD/oI3NLG4b/577Vw
 Bv0f68hsWB2Ol4Jok2irCITW5E4Y99cp6l4gBRCVMhCGWgn9yjoB5LxiyAg3hMnh1IMg
 APGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713182229; x=1713787029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBxYjz6MX/OlZTk+0eLQ8y69qUY69D92qO2/S89tZRs=;
 b=Qbw3XkkueKHer3+55MkPXXIdqeLZ1O/Hu22Z0v7nnxOf7nEoNzhpxzAEnIz2AYmcF1
 peQGAlpj5DF7nx2enVfqQ6im2ZohHpCl01RxvxDEGrztKtV7rKLlw2XmvwGfbdVwD/tM
 gzbbES3gUKcAMrd/wZGICgHuJBL1kncMoAMm3fiG8SA2Ci8ON2+vS7Z7KaeGJim3BnXp
 zpbCvlsVivHD5xdtT5De/V+Lw340fM6/xEiCfvRTr2RcZtKjyAXbU5XPBA4Rg/wZmydV
 jZ1Y82XwMgY/llvA2W5431FQVN9Y+2WNtvHF5yGV4FxexAH2zcDsoME1Q1meFvc2b5+9
 huJw==
X-Gm-Message-State: AOJu0Yzd3CIeJY8wZ8ZPTW8SMoB/0KDOIr9AmSkCGx83CUyU2thVqhp7
 YGbvacYUA9dHkGVjLCy2FX0SGEf91IhNRfg8GSzv0SVlF2koi3S/u1YXKamJm8mTDglYbpxBOJe
 69SBdd3QQyn5xYY4M7MfxTjWePn4=
X-Google-Smtp-Source: AGHT+IGHYyk5NFT+/l7YZbYaZj6arjFa6KZm/YZ5yGNadaiJCglgmBNDrcHIA8zut/ezOrCd8w0Z60DXbFgsBnm8Lc8=
X-Received: by 2002:a05:690c:fd5:b0:611:1e35:e5d8 with SMTP id
 dg21-20020a05690c0fd500b006111e35e5d8mr10096281ywb.32.1713182229489; Mon, 15
 Apr 2024 04:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240415112731.31841-1-patrik.r.jakobsson@gmail.com>
 <e13df911-c91d-491a-97d8-ca0e1cd0eed0@suse.de>
In-Reply-To: <e13df911-c91d-491a-97d8-ca0e1cd0eed0@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 15 Apr 2024 13:56:58 +0200
Message-ID: <CAMeQTsYoNpYiyWbn7YF71QM+6bxsOeKFfV4LFEfGVVvbOJw-Tg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove lid code
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Enrico Bartky <enrico.bartky@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 15, 2024 at 1:45=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 15.04.24 um 13:27 schrieb Patrik Jakobsson:
> > Due to a change in the order of initialization, the lid timer got
> > started before proper setup was made. This resulted in a crash during
> > boot.
> >
> > The lid switch is handled by gma500 through a timer that periodically
> > polls the opregion for changes. These types of ACPI events shouldn't be
> > handled by the graphics driver so let's get rid of the lid code.  This
> > fixes the crash during boot.
> >
> > Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulatio=
n")
> > Cc: Enrico Bartky <enrico.bartky@gmail.com>
>
> The patch deserves a Reported-by: from Enrico.

Enrico, can you test this patch to make sure it works for you as well?

Thanks
Patrik

>
> With this fixed:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Best regards
> Thomas
>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >   drivers/gpu/drm/gma500/Makefile     |  1 -
> >   drivers/gpu/drm/gma500/psb_device.c |  5 +-
> >   drivers/gpu/drm/gma500/psb_drv.h    |  9 ----
> >   drivers/gpu/drm/gma500/psb_lid.c    | 80 ----------------------------=
-
> >   4 files changed, 1 insertion(+), 94 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c
> >
> > diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/M=
akefile
> > index 4f302cd5e1a6..58fed80c7392 100644
> > --- a/drivers/gpu/drm/gma500/Makefile
> > +++ b/drivers/gpu/drm/gma500/Makefile
> > @@ -34,7 +34,6 @@ gma500_gfx-y +=3D \
> >         psb_intel_lvds.o \
> >         psb_intel_modes.o \
> >         psb_intel_sdvo.o \
> > -       psb_lid.o \
> >         psb_irq.o
> >
> >   gma500_gfx-$(CONFIG_ACPI) +=3D  opregion.o
> > diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma5=
00/psb_device.c
> > index dcfcd7b89d4a..6dece8f0e380 100644
> > --- a/drivers/gpu/drm/gma500/psb_device.c
> > +++ b/drivers/gpu/drm/gma500/psb_device.c
> > @@ -73,8 +73,7 @@ static int psb_backlight_setup(struct drm_device *dev=
)
> >       }
> >
> >       psb_intel_lvds_set_brightness(dev, PSB_MAX_BRIGHTNESS);
> > -     /* This must occur after the backlight is properly initialised */
> > -     psb_lid_timer_init(dev_priv);
> > +
> >       return 0;
> >   }
> >
> > @@ -259,8 +258,6 @@ static int psb_chip_setup(struct drm_device *dev)
> >
> >   static void psb_chip_teardown(struct drm_device *dev)
> >   {
> > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > -     psb_lid_timer_takedown(dev_priv);
> >       gma_intel_teardown_gmbus(dev);
> >   }
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/=
psb_drv.h
> > index c5edfa4aa4cc..83c17689c454 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.h
> > +++ b/drivers/gpu/drm/gma500/psb_drv.h
> > @@ -162,7 +162,6 @@
> >   #define PSB_NUM_VBLANKS 2
> >
> >   #define PSB_WATCHDOG_DELAY (HZ * 2)
> > -#define PSB_LID_DELAY (HZ / 10)
> >
> >   #define PSB_MAX_BRIGHTNESS          100
> >
> > @@ -491,11 +490,7 @@ struct drm_psb_private {
> >       /* Hotplug handling */
> >       struct work_struct hotplug_work;
> >
> > -     /* LID-Switch */
> > -     spinlock_t lid_lock;
> > -     struct timer_list lid_timer;
> >       struct psb_intel_opregion opregion;
> > -     u32 lid_last_state;
> >
> >       /* Watchdog */
> >       uint32_t apm_reg;
> > @@ -591,10 +586,6 @@ struct psb_ops {
> >       int i2c_bus;            /* I2C bus identifier for Moorestown */
> >   };
> >
> > -/* psb_lid.c */
> > -extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> > -extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
> > -
> >   /* modesetting */
> >   extern void psb_modeset_init(struct drm_device *dev);
> >   extern void psb_modeset_cleanup(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/=
psb_lid.c
> > deleted file mode 100644
> > index 58a7fe392636..000000000000
> > --- a/drivers/gpu/drm/gma500/psb_lid.c
> > +++ /dev/null
> > @@ -1,80 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> > -/*********************************************************************=
*****
> > - * Copyright (c) 2007, Intel Corporation.
> > - *
> > - * Authors: Thomas Hellstrom <thomas-at-tungstengraphics-dot-com>
> > - *********************************************************************=
*****/
> > -
> > -#include <linux/spinlock.h>
> > -
> > -#include "psb_drv.h"
> > -#include "psb_intel_reg.h"
> > -#include "psb_reg.h"
> > -
> > -static void psb_lid_timer_func(struct timer_list *t)
> > -{
> > -     struct drm_psb_private *dev_priv =3D from_timer(dev_priv, t, lid_=
timer);
> > -     struct drm_device *dev =3D (struct drm_device *)&dev_priv->dev;
> > -     struct timer_list *lid_timer =3D &dev_priv->lid_timer;
> > -     unsigned long irq_flags;
> > -     u32 __iomem *lid_state =3D dev_priv->opregion.lid_state;
> > -     u32 pp_status;
> > -
> > -     if (readl(lid_state) =3D=3D dev_priv->lid_last_state)
> > -             goto lid_timer_schedule;
> > -
> > -     if ((readl(lid_state)) & 0x01) {
> > -             /*lid state is open*/
> > -             REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET=
_ON);
> > -             do {
> > -                     pp_status =3D REG_READ(PP_STATUS);
> > -             } while ((pp_status & PP_ON) =3D=3D 0 &&
> > -                      (pp_status & PP_SEQUENCE_MASK) !=3D 0);
> > -
> > -             if (REG_READ(PP_STATUS) & PP_ON) {
> > -                     /*FIXME: should be backlight level before*/
> > -                     psb_intel_lvds_set_brightness(dev, 100);
> > -             } else {
> > -                     DRM_DEBUG("LVDS panel never powered up");
> > -                     return;
> > -             }
> > -     } else {
> > -             psb_intel_lvds_set_brightness(dev, 0);
> > -
> > -             REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) & ~POWER_TARGE=
T_ON);
> > -             do {
> > -                     pp_status =3D REG_READ(PP_STATUS);
> > -             } while ((pp_status & PP_ON) =3D=3D 0);
> > -     }
> > -     dev_priv->lid_last_state =3D  readl(lid_state);
> > -
> > -lid_timer_schedule:
> > -     spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> > -     if (!timer_pending(lid_timer)) {
> > -             lid_timer->expires =3D jiffies + PSB_LID_DELAY;
> > -             add_timer(lid_timer);
> > -     }
> > -     spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> > -}
> > -
> > -void psb_lid_timer_init(struct drm_psb_private *dev_priv)
> > -{
> > -     struct timer_list *lid_timer =3D &dev_priv->lid_timer;
> > -     unsigned long irq_flags;
> > -
> > -     spin_lock_init(&dev_priv->lid_lock);
> > -     spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> > -
> > -     timer_setup(lid_timer, psb_lid_timer_func, 0);
> > -
> > -     lid_timer->expires =3D jiffies + PSB_LID_DELAY;
> > -
> > -     add_timer(lid_timer);
> > -     spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> > -}
> > -
> > -void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)
> > -{
> > -     del_timer_sync(&dev_priv->lid_timer);
> > -}
> > -
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
