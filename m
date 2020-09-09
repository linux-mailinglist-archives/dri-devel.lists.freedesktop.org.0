Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C6262A22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6770F6EAB1;
	Wed,  9 Sep 2020 08:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1766E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599639752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDu4WTB9qWTPV0dbKk/SY2ZW1BVfToU7xoBYtd+G0E0=;
 b=LylHPNbUVvOraa3Zf731/JQR/FSUj9SrOeid+C/MZBQEE8t19IECYNx6xII4KujZ5Dzaqt
 hKLKbyORQuruphyubHDaa6cBTgxK1TSX5+wgNMfCMn09PTGs25T2GLezq6iD5fSKVnlar3
 DE6yx8bvgfIkWwMdcwlWwiS/lQ54GZo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-EJwGpEqeMja9SJBCknc_Qg-1; Wed, 09 Sep 2020 04:22:26 -0400
X-MC-Unique: EJwGpEqeMja9SJBCknc_Qg-1
Received: by mail-qt1-f197.google.com with SMTP id o14so1307312qtq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 01:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDu4WTB9qWTPV0dbKk/SY2ZW1BVfToU7xoBYtd+G0E0=;
 b=e3LGslt8cPOcoYMmQdzcwaacOWH/VW9dyVCHGU7BsomJ9DF5fcaMYhaeonWBQwwcnT
 Q2cbbQaBz30/dkPhVD0gSKpPN0dfYpNGPxf2QbcpJOySUmPohoMd+U0W9haOE/uGqGsZ
 wRJCh82wLEnWBKz3mJhIDN0qHXyg3GdX1aqx1gULiFIcw23DzZRcTUedDWeq5DneEpOO
 kub7lE/v8brtv7b48hjDhpxKZk5xOWAehzkRITaZ07wduEfBZjCYuhf4wEeUifF+C5f2
 DXMHIHa50MKfmjwteaACB/3fHonhqpd6y6vE/prMBClCRbdu52Oc/odO1S2lqEfXoq7C
 L/Ow==
X-Gm-Message-State: AOAM533bXxbK14bIKOudth3k4I5r44yl9kwGsOwxN5kHPScibTATxmC2
 MvKIErovJHQjqqWv5Orl/nvjFNoNYbghQiGTOiOkG6C5m7YQ1Wf/Cd9YGRs3Rtod3YdFSv2L6fg
 VpgVhKEKcUQ1ksBT65/l6mUvxGX+tZVj2fwIaxrrVs+XO
X-Received: by 2002:a05:620a:cd7:: with SMTP id
 b23mr2302254qkj.192.1599639745976; 
 Wed, 09 Sep 2020 01:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL9+uuU8O0pxBu3MC+S7Ux+Tw5qi1GkJwbdWT5j4dzjoEP5JLDsHQrTn6kHBzSuM1M5Ad+8Ztb7gcqD61r7r8=
X-Received: by 2002:a05:620a:cd7:: with SMTP id
 b23mr2302242qkj.192.1599639745631; 
 Wed, 09 Sep 2020 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
In-Reply-To: <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Sep 2020 10:22:14 +0200
Message-ID: <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
To: Ben Skeggs <skeggsb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
> >
> > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > new gp1xx temperature sensor") added support for reading finer-grain
> > temperatures, but continued to report temperatures in 1 degree Celsius
> > increments via nvkm_therm_temp_get().
> >
> > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > temperatures, which would be inconvenient for other users of the
> > function, a second interface has been added to line up with hwmon's
> > native unit of temperature.
> Hey Jeremy,
>
> Sorry this slipped past me until now.  I'm OK with adding support for
> millidegree temperature reporting, but don't think we need to keep
> both interfaces around and would rather see the existing code
> converted to return millidegrees (even on GPUs that don't support it)
> instead of degrees.
>
> Thanks!
> Ben.
>

just a note as I was trying something like that in the past: we have a
lot of code which fetches the temperature and there are a lot of
places where we would then do a divide by 1000, so having a wrapper
function at least makes sense. If we want to keep the func pointers?
well.. I guess the increased CPU overhead wouldn't be as bad if all
sub classes do this static * 1000 as well either. I just think we
should have both interfaces in subdev/therm.h so we can just keep most
of the current code as is.

> >
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > ---
> >  .../drm/nouveau/include/nvkm/subdev/therm.h   | 18 +++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  4 +--
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 16 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 25 +++++++++++++++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  |  1 +
> >  5 files changed, 60 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > index 62c34f98c930..7b9928dd001c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > @@ -100,6 +100,24 @@ struct nvkm_therm {
> >  };
> >
> >  int nvkm_therm_temp_get(struct nvkm_therm *);
> > +
> > +/**
> > + * nvkm_therm_temp_millidegree_get() - get the temperature in millidegrees
> > + * @therm: The thermal device to read from.
> > + *
> > + * This interface reports temperatures in units of millidegree Celsius to
> > + * align with the hwmon API. Some cards may only be capable of reporting in
> > + * units of Celsius, and those that report finer grain temperatures may not be
> > + * capable of millidegree Celsius accuracy,
> > + *
> > + * For cases where millidegree temperature is too fine-grain, the
> > + * nvkm_therm_temp_get() interface reports temperatures in one degree Celsius
> > + * increments.
> > + *
> > + * Return: The temperature in millidegrees Celsius, or -ENODEV if temperature
> > + *         reporting is not supported.
> > + */
> > +int nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm);
> >  int nvkm_therm_fan_sense(struct nvkm_therm *);
> >  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
> >  void nvkm_therm_clkgate_init(struct nvkm_therm *,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > index 1c3104d20571..e96355f93ce5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> >         case hwmon_temp_input:
> >                 if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> >                         return -EINVAL;
> > -               ret = nvkm_therm_temp_get(therm);
> > -               *val = ret < 0 ? ret : (ret * 1000);
> > +               ret = nvkm_therm_temp_millidegree_get(therm);
> > +               *val = ret;
> >                 break;
> >         case hwmon_temp_max:
> >                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > index 4a4d1e224126..e655b32c78b8 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > @@ -34,6 +34,22 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
> >         return -ENODEV;
> >  }
> >
> > +int
> > +nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm)
> > +{
> > +       int ret = -ENODEV;
> > +
> > +       if (therm->func->temp_millidegree_get)
> > +               return therm->func->temp_millidegree_get(therm);
> > +
> > +       if (therm->func->temp_get) {
> > +               ret = therm->func->temp_get(therm);
> > +               if (ret > 0)
> > +                       ret *= 1000;
> > +       }
> > +       return ret;
> > +}
> > +
> >  static int
> >  nvkm_therm_update_trip(struct nvkm_therm *therm)
> >  {
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > index 9f0dea3f61dc..4c3c2895a3cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > @@ -24,7 +24,7 @@
> >  #include "priv.h"
> >
> >  static int
> > -gp100_temp_get(struct nvkm_therm *therm)
> > +gp100_temp_get_raw(struct nvkm_therm *therm)
> >  {
> >         struct nvkm_device *device = therm->subdev.device;
> >         struct nvkm_subdev *subdev = &therm->subdev;
> > @@ -37,14 +37,35 @@ gp100_temp_get(struct nvkm_therm *therm)
> >
> >         /* device valid */
> >         if (tsensor & 0x20000000)
> > -               return (inttemp >> 8);
> > +               return inttemp;
> >         else
> >                 return -ENODEV;
> >  }
> >
> > +static int
> > +gp100_temp_millidegree_get(struct nvkm_therm *therm)
> > +{
> > +       int raw_temp = gp100_temp_get_raw(therm);
> > +
> > +       if (raw_temp < 0)
> > +               return raw_temp;
> > +       return raw_temp * 1000 >> 8;
> > +}
> > +
> > +static int
> > +gp100_temp_get(struct nvkm_therm *therm)
> > +{
> > +       int raw_temp = gp100_temp_get_raw(therm);
> > +
> > +       if (raw_temp < 0)
> > +               return raw_temp;
> > +       return raw_temp >> 8;
> > +}
> > +
> >  static const struct nvkm_therm_func
> >  gp100_therm = {
> >         .temp_get = gp100_temp_get,
> > +       .temp_millidegree_get = gp100_temp_millidegree_get,
> >         .program_alarms = nvkm_therm_program_alarms_polling,
> >  };
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > index 21659daf1864..a53068b4f0b9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > @@ -92,6 +92,7 @@ struct nvkm_therm_func {
> >         int (*pwm_clock)(struct nvkm_therm *, int line);
> >
> >         int (*temp_get)(struct nvkm_therm *);
> > +       int (*temp_millidegree_get)(struct nvkm_therm *therm);
> >
> >         int (*fan_sense)(struct nvkm_therm *);
> >
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
