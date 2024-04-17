Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80F8A80C4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD43113399;
	Wed, 17 Apr 2024 10:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="liWBe2/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8A411334B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 09:47:20 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-36b33fc543dso3284975ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713347239; x=1713952039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ict4r5ypgX4ZLZW1vj8MFJgPJ0F+rfvU+nUpd8golnA=;
 b=liWBe2/DDJ/yxVXbunzm6iAhkKBTDKVWQSBfj/j9WVwlyyrNIuEBYWueespT2hQKOJ
 1Nsh4mgYEqhdx0AwL4NQkr8TPTN4OYnsSiT4lWT4Sg54v+PbO2fXtun1nQKjxYSE4tvs
 yCd6vSJ5+kmHJF8R9jZG19kNc8DVOHHor7u8Aqk3INN0LXfKhUkBHLaA8rDHGn1Fl57E
 7+0fy/SMCVXgw9aQ6GV1cJzDE63W2oMBkhZwqGuM7pVRfVZxoeFLJDpco6Nwt9sM5taC
 aSPuuaiLYJzHPQOmSdvcc+OhFpMONTqU3skvJeS8X9RMC8sZYK7vigwONDGbDMSHGJWe
 nC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713347239; x=1713952039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ict4r5ypgX4ZLZW1vj8MFJgPJ0F+rfvU+nUpd8golnA=;
 b=JV+cL2EEvZz9Z9HazkLatXtMWB8t4QNLea0X6zyCQ2PHAH/srjGoNgZacPAm4bbHAI
 NI4ZZ4Yq6ZQoYCj5Xgs5SqmSYt7freZ+cYTJQE9Gw9nshKH+jnPH8tXmgMAMQeUKMnkB
 fXo04z6E1GvrKk+n9XKmwfAjazIHanr/EDWZDmM2sKjGL3C0uQkHYHWz68C01zcKe3UU
 AunwyWVtVCb3O2o4+riRiiq7ExuZkoHvS0CqwKpFKGifJuEV/vm3yNTFDNBSANG/sHV7
 rdk7bx7v0+lZ+x67jbkr/sUfx/ROokNKx/ZT6OH6G2//tUh2eRv1dNEHjqQkkFhlMTE0
 xJSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXequ/O6hRbVDNXE9OD8bt4alCbEgsXVlDD6tPEeE261sNh1F5O6GeEMkzO6E2TgbFX5+qBYZRnLOtjTsFd89GmwTbjdqBkG2smSLXhX2qb
X-Gm-Message-State: AOJu0YyQaFevttNBliQLGdfFPN/5F8XjikPAfDvKGJdFmMJtO2u4C60h
 rWnxpqykE8iyS85gw5aNCSf5UV6s3BSnGblxqyF4mRCE6Uq5jRubUED91iWaUaRjMWMpRmxkyFT
 RyBRq453kgLUpx9H4ZgTSM0n4cvI=
X-Google-Smtp-Source: AGHT+IF5AGfrk5ypIjkqnNezEjQAapQ+NOTRrii8M3/Cuu24ny7p6bK4EerO+xicxGZf3cxseIhwO8fcnQh6K/X155U=
X-Received: by 2002:a92:c24d:0:b0:36b:80d:b90f with SMTP id
 k13-20020a92c24d000000b0036b080db90fmr19949786ilo.26.1713347239013; Wed, 17
 Apr 2024 02:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240415112731.31841-1-patrik.r.jakobsson@gmail.com>
 <e13df911-c91d-491a-97d8-ca0e1cd0eed0@suse.de>
 <CAMeQTsYoNpYiyWbn7YF71QM+6bxsOeKFfV4LFEfGVVvbOJw-Tg@mail.gmail.com>
In-Reply-To: <CAMeQTsYoNpYiyWbn7YF71QM+6bxsOeKFfV4LFEfGVVvbOJw-Tg@mail.gmail.com>
From: Enrico Bartky <enrico.bartky@gmail.com>
Date: Wed, 17 Apr 2024 11:47:07 +0200
Message-ID: <CAKh_tsoK=pE0c6Ecr6f_iD=iFc2bkT=-ESEa2ZN0duUZq2a90Q@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove lid code
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008ef802061647bd4b"
X-Mailman-Approved-At: Wed, 17 Apr 2024 10:21:55 +0000
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

--0000000000008ef802061647bd4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for the delay. This patch fixes the crash during boot! (tested
against linux 6.9-rc3)

Greetings

Am Mo., 15. Apr. 2024 um 13:57 Uhr schrieb Patrik Jakobsson <
patrik.r.jakobsson@gmail.com>:

> On Mon, Apr 15, 2024 at 1:45=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de>
> wrote:
> >
> > Hi
> >
> > Am 15.04.24 um 13:27 schrieb Patrik Jakobsson:
> > > Due to a change in the order of initialization, the lid timer got
> > > started before proper setup was made. This resulted in a crash during
> > > boot.
> > >
> > > The lid switch is handled by gma500 through a timer that periodically
> > > polls the opregion for changes. These types of ACPI events shouldn't =
be
> > > handled by the graphics driver so let's get rid of the lid code.  Thi=
s
> > > fixes the crash during boot.
> > >
> > > Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev
> emulation")
> > > Cc: Enrico Bartky <enrico.bartky@gmail.com>
> >
> > The patch deserves a Reported-by: from Enrico.
>
> Enrico, can you test this patch to make sure it works for you as well?
>
> Thanks
> Patrik
>
> >
> > With this fixed:
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Best regards
> > Thomas
> >
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > ---
> > >   drivers/gpu/drm/gma500/Makefile     |  1 -
> > >   drivers/gpu/drm/gma500/psb_device.c |  5 +-
> > >   drivers/gpu/drm/gma500/psb_drv.h    |  9 ----
> > >   drivers/gpu/drm/gma500/psb_lid.c    | 80
> -----------------------------
> > >   4 files changed, 1 insertion(+), 94 deletions(-)
> > >   delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c
> > >
> > > diff --git a/drivers/gpu/drm/gma500/Makefile
> b/drivers/gpu/drm/gma500/Makefile
> > > index 4f302cd5e1a6..58fed80c7392 100644
> > > --- a/drivers/gpu/drm/gma500/Makefile
> > > +++ b/drivers/gpu/drm/gma500/Makefile
> > > @@ -34,7 +34,6 @@ gma500_gfx-y +=3D \
> > >         psb_intel_lvds.o \
> > >         psb_intel_modes.o \
> > >         psb_intel_sdvo.o \
> > > -       psb_lid.o \
> > >         psb_irq.o
> > >
> > >   gma500_gfx-$(CONFIG_ACPI) +=3D  opregion.o
> > > diff --git a/drivers/gpu/drm/gma500/psb_device.c
> b/drivers/gpu/drm/gma500/psb_device.c
> > > index dcfcd7b89d4a..6dece8f0e380 100644
> > > --- a/drivers/gpu/drm/gma500/psb_device.c
> > > +++ b/drivers/gpu/drm/gma500/psb_device.c
> > > @@ -73,8 +73,7 @@ static int psb_backlight_setup(struct drm_device
> *dev)
> > >       }
> > >
> > >       psb_intel_lvds_set_brightness(dev, PSB_MAX_BRIGHTNESS);
> > > -     /* This must occur after the backlight is properly initialised =
*/
> > > -     psb_lid_timer_init(dev_priv);
> > > +
> > >       return 0;
> > >   }
> > >
> > > @@ -259,8 +258,6 @@ static int psb_chip_setup(struct drm_device *dev)
> > >
> > >   static void psb_chip_teardown(struct drm_device *dev)
> > >   {
> > > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > > -     psb_lid_timer_takedown(dev_priv);
> > >       gma_intel_teardown_gmbus(dev);
> > >   }
> > >
> > > diff --git a/drivers/gpu/drm/gma500/psb_drv.h
> b/drivers/gpu/drm/gma500/psb_drv.h
> > > index c5edfa4aa4cc..83c17689c454 100644
> > > --- a/drivers/gpu/drm/gma500/psb_drv.h
> > > +++ b/drivers/gpu/drm/gma500/psb_drv.h
> > > @@ -162,7 +162,6 @@
> > >   #define PSB_NUM_VBLANKS 2
> > >
> > >   #define PSB_WATCHDOG_DELAY (HZ * 2)
> > > -#define PSB_LID_DELAY (HZ / 10)
> > >
> > >   #define PSB_MAX_BRIGHTNESS          100
> > >
> > > @@ -491,11 +490,7 @@ struct drm_psb_private {
> > >       /* Hotplug handling */
> > >       struct work_struct hotplug_work;
> > >
> > > -     /* LID-Switch */
> > > -     spinlock_t lid_lock;
> > > -     struct timer_list lid_timer;
> > >       struct psb_intel_opregion opregion;
> > > -     u32 lid_last_state;
> > >
> > >       /* Watchdog */
> > >       uint32_t apm_reg;
> > > @@ -591,10 +586,6 @@ struct psb_ops {
> > >       int i2c_bus;            /* I2C bus identifier for Moorestown */
> > >   };
> > >
> > > -/* psb_lid.c */
> > > -extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> > > -extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)=
;
> > > -
> > >   /* modesetting */
> > >   extern void psb_modeset_init(struct drm_device *dev);
> > >   extern void psb_modeset_cleanup(struct drm_device *dev);
> > > diff --git a/drivers/gpu/drm/gma500/psb_lid.c
> b/drivers/gpu/drm/gma500/psb_lid.c
> > > deleted file mode 100644
> > > index 58a7fe392636..000000000000
> > > --- a/drivers/gpu/drm/gma500/psb_lid.c
> > > +++ /dev/null
> > > @@ -1,80 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0-only
> > >
> -/***********************************************************************=
***
> > > - * Copyright (c) 2007, Intel Corporation.
> > > - *
> > > - * Authors: Thomas Hellstrom <thomas-at-tungstengraphics-dot-com>
> > > -
> *************************************************************************=
*/
> > > -
> > > -#include <linux/spinlock.h>
> > > -
> > > -#include "psb_drv.h"
> > > -#include "psb_intel_reg.h"
> > > -#include "psb_reg.h"
> > > -
> > > -static void psb_lid_timer_func(struct timer_list *t)
> > > -{
> > > -     struct drm_psb_private *dev_priv =3D from_timer(dev_priv, t,
> lid_timer);
> > > -     struct drm_device *dev =3D (struct drm_device *)&dev_priv->dev;
> > > -     struct timer_list *lid_timer =3D &dev_priv->lid_timer;
> > > -     unsigned long irq_flags;
> > > -     u32 __iomem *lid_state =3D dev_priv->opregion.lid_state;
> > > -     u32 pp_status;
> > > -
> > > -     if (readl(lid_state) =3D=3D dev_priv->lid_last_state)
> > > -             goto lid_timer_schedule;
> > > -
> > > -     if ((readl(lid_state)) & 0x01) {
> > > -             /*lid state is open*/
> > > -             REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
> POWER_TARGET_ON);
> > > -             do {
> > > -                     pp_status =3D REG_READ(PP_STATUS);
> > > -             } while ((pp_status & PP_ON) =3D=3D 0 &&
> > > -                      (pp_status & PP_SEQUENCE_MASK) !=3D 0);
> > > -
> > > -             if (REG_READ(PP_STATUS) & PP_ON) {
> > > -                     /*FIXME: should be backlight level before*/
> > > -                     psb_intel_lvds_set_brightness(dev, 100);
> > > -             } else {
> > > -                     DRM_DEBUG("LVDS panel never powered up");
> > > -                     return;
> > > -             }
> > > -     } else {
> > > -             psb_intel_lvds_set_brightness(dev, 0);
> > > -
> > > -             REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
> ~POWER_TARGET_ON);
> > > -             do {
> > > -                     pp_status =3D REG_READ(PP_STATUS);
> > > -             } while ((pp_status & PP_ON) =3D=3D 0);
> > > -     }
> > > -     dev_priv->lid_last_state =3D  readl(lid_state);
> > > -
> > > -lid_timer_schedule:
> > > -     spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> > > -     if (!timer_pending(lid_timer)) {
> > > -             lid_timer->expires =3D jiffies + PSB_LID_DELAY;
> > > -             add_timer(lid_timer);
> > > -     }
> > > -     spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> > > -}
> > > -
> > > -void psb_lid_timer_init(struct drm_psb_private *dev_priv)
> > > -{
> > > -     struct timer_list *lid_timer =3D &dev_priv->lid_timer;
> > > -     unsigned long irq_flags;
> > > -
> > > -     spin_lock_init(&dev_priv->lid_lock);
> > > -     spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> > > -
> > > -     timer_setup(lid_timer, psb_lid_timer_func, 0);
> > > -
> > > -     lid_timer->expires =3D jiffies + PSB_LID_DELAY;
> > > -
> > > -     add_timer(lid_timer);
> > > -     spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> > > -}
> > > -
> > > -void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)
> > > -{
> > > -     del_timer_sync(&dev_priv->lid_timer);
> > > -}
> > > -
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> >
>

--0000000000008ef802061647bd4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>sorry for the delay. This patch fixes the crash=
 during boot! (tested against linux 6.9-rc3)<br><br>Greetings<br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Mo., 15=
. Apr. 2024 um 13:57=C2=A0Uhr schrieb Patrik Jakobsson &lt;<a href=3D"mailt=
o:patrik.r.jakobsson@gmail.com">patrik.r.jakobsson@gmail.com</a>&gt;:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Apr 15, 2024 =
at 1:45=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse=
.de" target=3D"_blank">tzimmermann@suse.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; Am 15.04.24 um 13:27 schrieb Patrik Jakobsson:<br>
&gt; &gt; Due to a change in the order of initialization, the lid timer got=
<br>
&gt; &gt; started before proper setup was made. This resulted in a crash du=
ring<br>
&gt; &gt; boot.<br>
&gt; &gt;<br>
&gt; &gt; The lid switch is handled by gma500 through a timer that periodic=
ally<br>
&gt; &gt; polls the opregion for changes. These types of ACPI events should=
n&#39;t be<br>
&gt; &gt; handled by the graphics driver so let&#39;s get rid of the lid co=
de.=C2=A0 This<br>
&gt; &gt; fixes the crash during boot.<br>
&gt; &gt;<br>
&gt; &gt; Fixes: 8f1aaccb04b7 (&quot;drm/gma500: Implement client-based fbd=
ev emulation&quot;)<br>
&gt; &gt; Cc: Enrico Bartky &lt;<a href=3D"mailto:enrico.bartky@gmail.com" =
target=3D"_blank">enrico.bartky@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The patch deserves a Reported-by: from Enrico.<br>
<br>
Enrico, can you test this patch to make sure it works for you as well?<br>
<br>
Thanks<br>
Patrik<br>
<br>
&gt;<br>
&gt; With this fixed:<br>
&gt;<br>
&gt; Reviewed-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.=
de" target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt;<br>
&gt; Best regards<br>
&gt; Thomas<br>
&gt;<br>
&gt; &gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" =
target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt; &gt; Signed-off-by: Patrik Jakobsson &lt;<a href=3D"mailto:patrik.r.ja=
kobsson@gmail.com" target=3D"_blank">patrik.r.jakobsson@gmail.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/gma500/Makefile=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 -<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/gma500/psb_device.c |=C2=A0 5 +-<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/gma500/psb_drv.h=C2=A0 =C2=A0 |=C2=A0=
 9 ----<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/gma500/psb_lid.c=C2=A0 =C2=A0 | 80 --=
---------------------------<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 1 insertion(+), 94 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c<b=
r>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gm=
a500/Makefile<br>
&gt; &gt; index 4f302cd5e1a6..58fed80c7392 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/gma500/Makefile<br>
&gt; &gt; +++ b/drivers/gpu/drm/gma500/Makefile<br>
&gt; &gt; @@ -34,7 +34,6 @@ gma500_gfx-y +=3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psb_intel_lvds.o \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psb_intel_modes.o \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psb_intel_sdvo.o \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0psb_lid.o \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psb_irq.o<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0gma500_gfx-$(CONFIG_ACPI) +=3D=C2=A0 opregion.o<br>
&gt; &gt; diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/dr=
m/gma500/psb_device.c<br>
&gt; &gt; index dcfcd7b89d4a..6dece8f0e380 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/gma500/psb_device.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/gma500/psb_device.c<br>
&gt; &gt; @@ -73,8 +73,7 @@ static int psb_backlight_setup(struct drm_devic=
e *dev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0psb_intel_lvds_set_brightness(dev, PSB_=
MAX_BRIGHTNESS);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* This must occur after the backlight is pr=
operly initialised */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0psb_lid_timer_init(dev_priv);<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; @@ -259,8 +258,6 @@ static int psb_chip_setup(struct drm_device *=
dev)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static void psb_chip_teardown(struct drm_device *dev)=
<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_psb_private *dev_priv =3D to_drm_=
psb_private(dev);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0psb_lid_timer_takedown(dev_priv);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gma_intel_teardown_gmbus(dev);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/g=
ma500/psb_drv.h<br>
&gt; &gt; index c5edfa4aa4cc..83c17689c454 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/gma500/psb_drv.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/gma500/psb_drv.h<br>
&gt; &gt; @@ -162,7 +162,6 @@<br>
&gt; &gt;=C2=A0 =C2=A0#define PSB_NUM_VBLANKS 2<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define PSB_WATCHDOG_DELAY (HZ * 2)<br>
&gt; &gt; -#define PSB_LID_DELAY (HZ / 10)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define PSB_MAX_BRIGHTNESS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 100<br>
&gt; &gt;<br>
&gt; &gt; @@ -491,11 +490,7 @@ struct drm_psb_private {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Hotplug handling */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct hotplug_work;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* LID-Switch */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spinlock_t lid_lock;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct timer_list lid_timer;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct psb_intel_opregion opregion;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0u32 lid_last_state;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Watchdog */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t apm_reg;<br>
&gt; &gt; @@ -591,10 +586,6 @@ struct psb_ops {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i2c_bus;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* I2C bus identifier for Moorestown */<br>
&gt; &gt;=C2=A0 =C2=A0};<br>
&gt; &gt;<br>
&gt; &gt; -/* psb_lid.c */<br>
&gt; &gt; -extern void psb_lid_timer_init(struct drm_psb_private *dev_priv)=
;<br>
&gt; &gt; -extern void psb_lid_timer_takedown(struct drm_psb_private *dev_p=
riv);<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0/* modesetting */<br>
&gt; &gt;=C2=A0 =C2=A0extern void psb_modeset_init(struct drm_device *dev);=
<br>
&gt; &gt;=C2=A0 =C2=A0extern void psb_modeset_cleanup(struct drm_device *de=
v);<br>
&gt; &gt; diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/g=
ma500/psb_lid.c<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 58a7fe392636..000000000000<br>
&gt; &gt; --- a/drivers/gpu/drm/gma500/psb_lid.c<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,80 +0,0 @@<br>
&gt; &gt; -// SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt; -/***************************************************************=
***********<br>
&gt; &gt; - * Copyright (c) 2007, Intel Corporation.<br>
&gt; &gt; - *<br>
&gt; &gt; - * Authors: Thomas Hellstrom &lt;thomas-at-tungstengraphics-dot-=
com&gt;<br>
&gt; &gt; - ***************************************************************=
***********/<br>
&gt; &gt; -<br>
&gt; &gt; -#include &lt;linux/spinlock.h&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -#include &quot;psb_drv.h&quot;<br>
&gt; &gt; -#include &quot;psb_intel_reg.h&quot;<br>
&gt; &gt; -#include &quot;psb_reg.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -static void psb_lid_timer_func(struct timer_list *t)<br>
&gt; &gt; -{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_psb_private *dev_priv =3D from_ti=
mer(dev_priv, t, lid_timer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D (struct drm_devic=
e *)&amp;dev_priv-&gt;dev;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct timer_list *lid_timer =3D &amp;dev_pr=
iv-&gt;lid_timer;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned long irq_flags;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0u32 __iomem *lid_state =3D dev_priv-&gt;opre=
gion.lid_state;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0u32 pp_status;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (readl(lid_state) =3D=3D dev_priv-&gt;lid=
_last_state)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto lid_timer_s=
chedule;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if ((readl(lid_state)) &amp; 0x01) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*lid state is o=
pen*/<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_WRITE(PP_CON=
TROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pp_status =3D REG_READ(PP_STATUS);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((pp_sta=
tus &amp; PP_ON) =3D=3D 0 &amp;&amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (pp_status &amp; PP_SEQUENCE_MASK) !=3D 0);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (REG_READ(PP_=
STATUS) &amp; PP_ON) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/*FIXME: should be backlight level before*/<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0psb_intel_lvds_set_brightness(dev, 100);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_DEBUG(&quot;LVDS panel never powered up&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psb_intel_lvds_s=
et_brightness(dev, 0);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_WRITE(PP_CON=
TROL, REG_READ(PP_CONTROL) &amp; ~POWER_TARGET_ON);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pp_status =3D REG_READ(PP_STATUS);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((pp_sta=
tus &amp; PP_ON) =3D=3D 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0dev_priv-&gt;lid_last_state =3D=C2=A0 readl(=
lid_state);<br>
&gt; &gt; -<br>
&gt; &gt; -lid_timer_schedule:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;dev_priv-&gt;lid_lock=
, irq_flags);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!timer_pending(lid_timer)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lid_timer-&gt;ex=
pires =3D jiffies + PSB_LID_DELAY;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_timer(lid_ti=
mer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;dev_priv-&gt;lid=
_lock, irq_flags);<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -void psb_lid_timer_init(struct drm_psb_private *dev_priv)<br>
&gt; &gt; -{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct timer_list *lid_timer =3D &amp;dev_pr=
iv-&gt;lid_timer;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned long irq_flags;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;dev_priv-&gt;lid_lock);<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;dev_priv-&gt;lid_lock=
, irq_flags);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0timer_setup(lid_timer, psb_lid_timer_func, 0=
);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0lid_timer-&gt;expires =3D jiffies + PSB_LID_=
DELAY;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0add_timer(lid_timer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;dev_priv-&gt;lid=
_lock, irq_flags);<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)<br=
>
&gt; &gt; -{<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0del_timer_sync(&amp;dev_priv-&gt;lid_timer);=
<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt;<br>
&gt; --<br>
&gt; --<br>
&gt; Thomas Zimmermann<br>
&gt; Graphics Driver Developer<br>
&gt; SUSE Software Solutions Germany GmbH<br>
&gt; Frankenstrasse 146, 90461 Nuernberg, Germany<br>
&gt; GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
&gt; HRB 36809 (AG Nuernberg)<br>
&gt;<br>
</blockquote></div>

--0000000000008ef802061647bd4b--
