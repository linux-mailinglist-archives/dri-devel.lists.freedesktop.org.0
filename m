Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53571549B67
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 20:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CB110F61B;
	Mon, 13 Jun 2022 18:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11110F601
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 18:23:55 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id o6so5790175plg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jaknGp6QjLQVlbSMCEjzkn6n45LwiRsau7/T127wlV8=;
 b=nPmh+wraJp8nvBkw3SlmI5Be4HHQZYtbfLyev+yD2NxdhOVDPwgFLm17vcUVt4IS9g
 wCuagquEVO0ibIMm/vCpZ7to9L9iSA0Ba/NOQIqUlC7RcK5P3K6csR6Or+e3ml4d9bQz
 0pgeNxKZhNadv1g12gAT7mRejP7vTW+m04Lxu4L6NNPr+LXX5rWOt+rL0UVeRUU2fSIW
 AxHjRfSmffN0FT5ZfwX/OoxtQ3Pcm4rLUz0AZptRtWI/ALcuEVRgv+d4ymicBWJzA5oX
 88eSBpM5oO0/5+G8MwWTFLqUokO47otzUVOrq4AWebRDKjE4lWPVGK1HqAN+WcfkJduk
 MSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jaknGp6QjLQVlbSMCEjzkn6n45LwiRsau7/T127wlV8=;
 b=ELvl+mS5tLujJWwxiNmFQ+fkp9lZm4tN4LzGzrBZB3EzDKbmSNEJWPup7DsKfpWkcM
 mt382vildir2gpcw0ZKpCjNX+iwHt5g7t6eW1HRIDc5j2gprgTkRebt7kmo9GEkgcmZp
 ThC5vggM9gLZskce2kVRTBp80LuefWR5QYEZt/dw/GHWJPMrEEobA+3aJH1zsoedN9st
 rWKPJfCFXIEF2FqLow1QSl1px7jzmOJQywyp3/+j3XA9l564x0uKu4wDDmia1rz31qgC
 PTFiC9afcezMCxNA/cZ5FBkFHPFkwRQP8dHk2QbTPPu5uD6QwGutHpKaDEhoeBlczIvt
 6eyQ==
X-Gm-Message-State: AJIora+AEzlzXUtsg728k2WTEk1BqDq7BoT00bsHK6zSZ5qTkVtuEAaV
 BmuYDnEN73h3K+llzGz1o+E9QeP858xJvRY7CWw=
X-Google-Smtp-Source: AGRyM1tv1+VpnLW6qT0qxsrBPcDnF8b7rrTn5p5KDdA1pE8g2oI4ROaI9PKfZ2+IhTtRA3sOuksGLpl/O/+fy6CqfuU=
X-Received: by 2002:a17:903:3015:b0:163:c6a5:dcb with SMTP id
 o21-20020a170903301500b00163c6a50dcbmr424131pla.38.1655144635061; Mon, 13 Jun
 2022 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-2-patrik.r.jakobsson@gmail.com>
 <YqdvDI59JRfsZiut@ravnborg.org>
In-Reply-To: <YqdvDI59JRfsZiut@ravnborg.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 13 Jun 2022 20:23:43 +0200
Message-ID: <CAMeQTsa1DbDQLBOEQQyNBQzf-YOJVhbQS2ikPAsVavm_JXy5Eg@mail.gmail.com>
Subject: Re: [PATCH 01/19] drm/gma500: Unify *_lvds_get_max_backlight()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 7:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Patrick.
>
> On Mon, Jun 13, 2022 at 02:34:18PM +0200, Patrik Jakobsson wrote:
> > These functions mostly do the same thing so unify them into one. All
> > unified lvds code will live in gma_lvds.c.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> > +/*
> > + * Returns the maximum level of the backlight duty cycle field.
> > + */
>
> I find this function quite un-readable.
>
> > +u32 gma_lvds_get_max_backlight(struct drm_device *dev)
> > +{
> > +     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > +     u32 retval;
> > +
> > +     if (gma_power_begin(dev, false)) {
> > +             retval =3D ((REG_READ(BLC_PWM_CTL) &
> > +                       BACKLIGHT_MODULATION_FREQ_MASK) >>
> > +                       BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> > +
> > +             gma_power_end(dev);
> > +     } else
> > +             retval =3D ((dev_priv->regs.saveBLC_PWM_CTL &
> > +                       BACKLIGHT_MODULATION_FREQ_MASK) >>
> > +                       BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> > +
> > +     return retval;
> > +}
>
> Maybe like this - which should be the same functionality:
>
> u32 gma_lvds_get_max_backlight(struct drm_device *dev)
> {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
>         u32 pwmctl;
>
>         if (gma_power_begin(dev, false)) {
>                 pwmctl =3D REG_READ(BLC_PWM_CTL);
>                 gma_power_end(dev);
>         } else {
>                 pwmctl =3D dev_priv->regs.saveBLC_PWM_CTL;
>         }
>
>         pwmctl =3D pwmctl & BACKLIGHT_MODULATION_FREQ_MASK;
>         return  (pwmctl >> BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> }
>
> this is more or less the same as in psb_intel_lvds_get_max_backlight().
>
> With or without this change the patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Hi Sam,
Thanks for having a look.

I've intentionally tried to change as little as possible from the
version I copied so that any functional change is easy to spot and the
series becomes easy to review. Would it be ok if I do cleanups as a
followup series?

-Patrik

>
> >> +
> > +
> > diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500=
/gma_lvds.h
> > new file mode 100644
> > index 000000000000..2a9ce8ee3fa7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/gma500/gma_lvds.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +/*
> > + * Copyright =C2=A9 2006-2011 Intel Corporation
> > + */
> > +
> > +#ifndef _GMA_LVDS_H
> > +#define _GMA_LVDS_H
> > +
> > +u32 gma_lvds_get_max_backlight(struct drm_device *dev);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/g=
ma500/oaktrail_lvds.c
> > index 9c9ebf8e29c4..4913baca7ae2 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > @@ -20,6 +20,7 @@
> >  #include "psb_drv.h"
> >  #include "psb_intel_drv.h"
> >  #include "psb_intel_reg.h"
> > +#include "gma_lvds.h"
> >
> >  /* The max/min PWM frequency in BPCR[31:17] - */
> >  /* The smallest number is 1 (not 0) that can fit in the
> > @@ -170,25 +171,6 @@ static void oaktrail_lvds_prepare(struct drm_encod=
er *encoder)
> >       gma_power_end(dev);
> >  }
> >
> > -static u32 oaktrail_lvds_get_max_backlight(struct drm_device *dev)
> > -{
> > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > -     u32 ret;
> > -
> > -     if (gma_power_begin(dev, false)) {
> > -             ret =3D ((REG_READ(BLC_PWM_CTL) &
> > -                       BACKLIGHT_MODULATION_FREQ_MASK) >>
> > -                       BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> > -
> > -             gma_power_end(dev);
> > -     } else
> > -             ret =3D ((dev_priv->regs.saveBLC_PWM_CTL &
> > -                       BACKLIGHT_MODULATION_FREQ_MASK) >>
> > -                       BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> > -
> > -     return ret;
> > -}
> > -
> >  static void oaktrail_lvds_commit(struct drm_encoder *encoder)
> >  {
> >       struct drm_device *dev =3D encoder->dev;
> > @@ -197,8 +179,7 @@ static void oaktrail_lvds_commit(struct drm_encoder=
 *encoder)
> >       struct psb_intel_mode_device *mode_dev =3D &dev_priv->mode_dev;
> >
> >       if (mode_dev->backlight_duty_cycle =3D=3D 0)
> > -             mode_dev->backlight_duty_cycle =3D
> > -                                     oaktrail_lvds_get_max_backlight(d=
ev);
> > +             mode_dev->backlight_duty_cycle =3D gma_lvds_get_max_backl=
ight(dev);
> >       oaktrail_lvds_set_power(dev, gma_encoder, true);
> >  }
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/=
gma500/psb_intel_lvds.c
> > index 7ee6c8ce103b..371c202a15ce 100644
> > --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> > +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> > @@ -18,6 +18,7 @@
> >  #include "psb_drv.h"
> >  #include "psb_intel_drv.h"
> >  #include "psb_intel_reg.h"
> > +#include "gma_lvds.h"
> >
> >  /*
> >   * LVDS I2C backlight control macros
> > @@ -52,32 +53,6 @@ struct psb_intel_lvds_priv {
> >       struct gma_i2c_chan *i2c_bus;
> >  };
> >
> > -
> > -/*
> > - * Returns the maximum level of the backlight duty cycle field.
> > - */
> > -static u32 psb_intel_lvds_get_max_backlight(struct drm_device *dev)
> > -{
> > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > -     u32 ret;
> > -
> > -     if (gma_power_begin(dev, false)) {
> > -             ret =3D REG_READ(BLC_PWM_CTL);
> > -             gma_power_end(dev);
> > -     } else /* Powered off, use the saved value */
> > -             ret =3D dev_priv->regs.saveBLC_PWM_CTL;
> > -
> > -     /* Top 15bits hold the frequency mask */
> > -     ret =3D (ret &  BACKLIGHT_MODULATION_FREQ_MASK) >>
> > -                                     BACKLIGHT_MODULATION_FREQ_SHIFT;
> > -
> > -        ret *=3D 2;    /* Return a 16bit range as needed for setting *=
/
> > -        if (ret =3D=3D 0)
> > -                dev_err(dev->dev, "BL bug: Reg %08x save %08X\n",
> > -                        REG_READ(BLC_PWM_CTL), dev_priv->regs.saveBLC_=
PWM_CTL);
> > -     return ret;
> > -}
> > -
> >  /*
> >   * Set LVDS backlight level by I2C command
> >   *
> > @@ -131,7 +106,7 @@ static int psb_lvds_pwm_set_brightness(struct drm_d=
evice *dev, int level)
> >       u32 max_pwm_blc;
> >       u32 blc_pwm_duty_cycle;
> >
> > -     max_pwm_blc =3D psb_intel_lvds_get_max_backlight(dev);
> > +     max_pwm_blc =3D gma_lvds_get_max_backlight(dev);
> >
> >       /*BLC_PWM_CTL Should be initiated while backlight device init*/
> >       BUG_ON(max_pwm_blc =3D=3D 0);
> > @@ -176,7 +151,7 @@ void psb_intel_lvds_set_brightness(struct drm_devic=
e *dev, int level)
> >  /*
> >   * Sets the backlight level.
> >   *
> > - * level: backlight level, from 0 to psb_intel_lvds_get_max_backlight(=
).
> > + * level: backlight level, from 0 to gma_lvds_get_max_backlight().
> >   */
> >  static void psb_intel_lvds_set_backlight(struct drm_device *dev, int l=
evel)
> >  {
> > @@ -275,8 +250,7 @@ static void psb_intel_lvds_save(struct drm_connecto=
r *connector)
> >        * just make it full brightness
> >        */
> >       if (dev_priv->backlight_duty_cycle =3D=3D 0)
> > -             dev_priv->backlight_duty_cycle =3D
> > -             psb_intel_lvds_get_max_backlight(dev);
> > +             dev_priv->backlight_duty_cycle =3D gma_lvds_get_max_backl=
ight(dev);
> >
> >       dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
> >                       lvds_priv->savePP_ON,
> > @@ -445,7 +419,7 @@ static void psb_intel_lvds_commit(struct drm_encode=
r *encoder)
> >
> >       if (mode_dev->backlight_duty_cycle =3D=3D 0)
> >               mode_dev->backlight_duty_cycle =3D
> > -                 psb_intel_lvds_get_max_backlight(dev);
> > +                 gma_lvds_get_max_backlight(dev);
> >
> >       psb_intel_lvds_set_power(dev, true);
> >  }
> > --
> > 2.36.1
