Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBB26DE22
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967886EC2F;
	Thu, 17 Sep 2020 14:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CC46EC2F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600352648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ml0kHH4CMkoKqMqMwUKhcZZ6yDjvrVU9fMVDa9lTgjk=;
 b=S4oXw/FfyEm6dSzy7LkpxaNm/rMEOZQ5as87aQvzuwf5TrFAahtAHum6DDGV1FF2y6HOvy
 3XzxxmNKqM62OEU2KpkHQN44Md0GNco+pGb5FDxZdcOLUr3gM/9YFRWE/UHOmFyU3cOOjM
 W6dH3WUzQUW90AMMJ/1FdNdrN2oD/gM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-vRObuBRtNzS2LxwuELXdVA-1; Thu, 17 Sep 2020 10:24:07 -0400
X-MC-Unique: vRObuBRtNzS2LxwuELXdVA-1
Received: by mail-qk1-f197.google.com with SMTP id 196so1620992qkn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ml0kHH4CMkoKqMqMwUKhcZZ6yDjvrVU9fMVDa9lTgjk=;
 b=O6q1Rtp5KLI/lpg38qvI9ZwABLODviEBHDwHLgpmnAa//wz9usulycQmIiORDkGSmp
 DuCiE6rKPtl136UO7RVW7KOB9bmDCwl0AJ1OsCqzFFGUC8RECThB9RvdIAEr/Ek/h8E+
 QBGChDFV38jZozRmkVXYiJXkn4INYnMB7dFCE0KsFS59hTAQMIddEgQGGlNEzDtiurnZ
 NCHrHf4ovl0uoNuvlVmaH+kkowKT6XJ5jn1UCOw2bJmgPXzNfSrP8qfRE3f6KU+L5wuU
 HLjtaGH3qm7Jrr0DG9v7s3T04Qdm9zuwfdYzj0gSD3iKC9A3iwdwdlEEMV6NmsgfwL0n
 oVNQ==
X-Gm-Message-State: AOAM531hJn9a+Du7xG0H/g/iWrq51KV6LVJ7K/T9RbICz9VloamxIQjP
 7MO3Ab14jN8Bk5cZQOQXaJvKnMKXREs3PviAYGFc3T7KwlsLVsisRnXgCDLx8nZABArpjpCeasU
 kb9ox5J/EeyMFuGR/FQAJ2G8a6V50a+SA6fCxLCg1dzyj
X-Received: by 2002:ac8:615d:: with SMTP id d29mr15516613qtm.286.1600352645094; 
 Thu, 17 Sep 2020 07:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycSa9wpZ6pOY3zilSn50X39RIxa6rIMjQoAUK5mmu8Ahbui5FrWTMJUPK3eSfXwKjSNIQ4ljwMxY4122EwA7c=
X-Received: by 2002:ac8:615d:: with SMTP id d29mr15516555qtm.286.1600352644372; 
 Thu, 17 Sep 2020 07:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200812204952.1921587-1-jcline@redhat.com>
 <20200916194711.999602-1-jcline@redhat.com>
 <20200916194711.999602-2-jcline@redhat.com>
 <CACO55tueUdL0Jp15keCUpFzBuSM8gimkth7VUZxhnaijHOXKxw@mail.gmail.com>
 <CACO55tuKO61iQQEmrFwct2NDxgbgqMYBnrvtXaDQRu95dZfk6A@mail.gmail.com>
 <20200917141113.GA750296@dev.jcline.org>
In-Reply-To: <20200917141113.GA750296@dev.jcline.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2020 16:23:53 +0200
Message-ID: <CACO55tuqtMBOQAt1=W1pN9DbE6EnMqM-gwz=1dSqhf+yu1QuNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: return temperatures in temp_get() via
 parameter
To: Jeremy Cline <jcline@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 4:11 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> On Wed, Sep 16, 2020 at 10:03:22PM +0200, Karol Herbst wrote:
> > On Wed, Sep 16, 2020 at 10:01 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Wed, Sep 16, 2020 at 9:47 PM Jeremy Cline <jcline@redhat.com> wrote:
> > > >
> > > > The temp_get() function currently returns negative error numbers or a
> > > > temperature. However, the thermal sensors can (in theory) measure
> > > > negative temperatures. Some implementations of temp_get() correctly
> > > > clamp negative temperature readings to 0 so that users do not mistake
> > > > them for errors, but some, like gp100_temp_get(), do not.
> > > >
> > > > Rather than relying on implementations remembering to clamp values,
> > > > dedicate the function return value to error codes and accept a pointer
> > > > to an integer where the temperature reading should be stored.
> > > >
> > > > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > > > ---
> > > >  .../drm/nouveau/include/nvkm/subdev/therm.h   |  2 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 12 ++++++------
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 19 ++++++++++++++-----
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/g84.c   | 11 ++++++-----
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 11 ++++++-----
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/nv40.c  |  9 +++------
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/nv50.c  |  9 +++------
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  | 17 +++++++++++++++--
> > > >  .../gpu/drm/nouveau/nvkm/subdev/therm/temp.c  | 12 ++++++++----
> > > >  9 files changed, 62 insertions(+), 40 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > > > index 62c34f98c930..bfe9779216fc 100644
> > > > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > > > @@ -99,7 +99,7 @@ struct nvkm_therm {
> > > >         bool clkgating_enabled;
> > > >  };
> > > >
> > > > -int nvkm_therm_temp_get(struct nvkm_therm *);
> > > > +int nvkm_therm_temp_get(struct nvkm_therm *therm, int *temp);
> > > >  int nvkm_therm_fan_sense(struct nvkm_therm *);
> > > >  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
> > > >  void nvkm_therm_clkgate_init(struct nvkm_therm *,
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > > index 1c3104d20571..aff6aa296678 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > > @@ -325,7 +325,7 @@ nouveau_temp_is_visible(const void *data, u32 attr, int channel)
> > > >         struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > >         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > >
> > > > -       if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
> > > > +       if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm, NULL) < 0)
> > > >                 return 0;
> > > >
> > > >         switch (attr) {
> > > > @@ -419,7 +419,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> > > >         struct drm_device *drm_dev = dev_get_drvdata(dev);
> > > >         struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > >         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > > -       int ret;
> > > > +       int ret = 0, temp;
> > > >
> > > >         if (!therm || !therm->attr_get)
> > > >                 return -EOPNOTSUPP;
> > > > @@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> > > >         case hwmon_temp_input:
> > > >                 if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> > > >                         return -EINVAL;
> > > > -               ret = nvkm_therm_temp_get(therm);
> > > > -               *val = ret < 0 ? ret : (ret * 1000);
> > > > +               ret = nvkm_therm_temp_get(therm, &temp);
> > > > +               *val = temp * 1000;
> > > >                 break;
> > > >         case hwmon_temp_max:
> > > >                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> > > > @@ -459,7 +459,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> > > >                 return -EOPNOTSUPP;
> > > >         }
> > > >
> > > > -       return 0;
> > > > +       return ret;
> > > >  }
> > > >
> > > >  static int
> > > > @@ -735,7 +735,7 @@ nouveau_hwmon_init(struct drm_device *dev)
> > > >         hwmon->dev = dev;
> > > >
> > > >         if (therm && therm->attr_get && therm->attr_set) {
> > > > -               if (nvkm_therm_temp_get(therm) >= 0)
> > > > +               if (nvkm_therm_temp_get(therm, NULL) >= 0)
> > > >                         special_groups[i++] = &temp1_auto_point_sensor_group;
> > > >                 if (therm->fan_get && therm->fan_get(therm) >= 0)
> > > >                         special_groups[i++] = &pwm_fan_sensor_group;
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > > > index 4a4d1e224126..e7ffea1512e6 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > > > @@ -27,10 +27,15 @@
> > > >  #include <subdev/pmu.h>
> > > >
> > > >  int
> > > > -nvkm_therm_temp_get(struct nvkm_therm *therm)
> > > > +nvkm_therm_temp_get(struct nvkm_therm *therm, int *temp)
> > > >  {
> > > > +       int ignored_reading;
> > > > +
> > > > +       if (temp == NULL)
> > > > +               temp = &ignored_reading;
> > > > +
> > > >         if (therm->func->temp_get)
> > > > -               return therm->func->temp_get(therm);
> > > > +               return therm->func->temp_get(therm, temp);
> > > >         return -ENODEV;
> > > >  }
> > > >
> > > > @@ -40,9 +45,11 @@ nvkm_therm_update_trip(struct nvkm_therm *therm)
> > > >         struct nvbios_therm_trip_point *trip = therm->fan->bios.trip,
> > > >                                        *cur_trip = NULL,
> > > >                                        *last_trip = therm->last_trip;
> > > > -       u8  temp = therm->func->temp_get(therm);
> > > > +       int temp;
> > > >         u16 duty, i;
> > > >
> > > > +       WARN_ON(nvkm_therm_temp_get(therm, &temp) < 0);
> > > > +
> > >
> > > I think adding WARN_ONs like this is fine, I am just not sure how much
> > > our code is actually protected against the GPU being runtime
> > > suspended... so on laptops this could trigger some warnings.. might
> > > even be just because nouveau_pmops_runtime_suspend and the hwmon API
> > > race here, even though it's quite unlikely that the hwmon thread
> > > stalls enough so it survives the entire suspend path. But in theory
> > > that could be causing random errors getting reported.
> > >
> >
> > Actually, we never set the status to DRM_SWITCH_POWER_CHANGING, so I
> > guess this race is indeed real. I thought we did that, but maybe
> > that's because I never send out the patch to use them.
> >
>
> Yeah, so my thinking was that since before there was no error handling
> it would show whether or not it's a real problem, but it sounds like it
> is so I think it'd be better to handle that.
>

yeah.. I guess that issue existed before already although I think we
treated negative values special enough so it never showed? mhh..
anyway, I think we want to set the power state to _CHANGING anyway and
I can send out a patch for that. The other part is to make sure that
the suspend paths are stopping all the relevant kworkers which I'd
assume they do anyway.

> I see nvkm_therm_update() is checking to make sure the duty is positive.
> Should it always be safe to skip setting the fan in cases where the
> temperature isn't readable? If so we can just return the error here.
>

I think the fan workers should be stopped once the GPU runtime
suspends, but I am not 100% on this, so we might want to check up on
that.

> > > >         /* look for the trip point corresponding to the current temperature */
> > > >         cur_trip = NULL;
> > > >         for (i = 0; i < therm->fan->bios.nr_fan_trip; i++) {
> > > > @@ -70,9 +77,11 @@ static int
> > > >  nvkm_therm_compute_linear_duty(struct nvkm_therm *therm, u8 linear_min_temp,
> > > >                                 u8 linear_max_temp)
> > > >  {
> > > > -       u8  temp = therm->func->temp_get(therm);
> > > > +       int temp;
> > > >         u16 duty;
> > > >
> > > > +       WARN_ON(nvkm_therm_temp_get(therm, &temp) < 0);
> > > > +
> > > >         /* handle the non-linear part first */
> > > >         if (temp < linear_min_temp)
> > > >                 return therm->fan->bios.min_duty;
> > > > @@ -200,7 +209,7 @@ nvkm_therm_fan_mode(struct nvkm_therm *therm, int mode)
> > > >         /* do not allow automatic fan management if the thermal sensor is
> > > >          * not available */
> > > >         if (mode == NVKM_THERM_CTRL_AUTO &&
> > > > -           therm->func->temp_get(therm) < 0)
> > > > +           nvkm_therm_temp_get(therm, NULL) < 0)
> > > >                 return -EINVAL;
> > > >
> > > >         if (therm->mode == mode)
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c
> > > > index 96f8da40ac82..e2f891d5c7ba 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c
> > > > @@ -27,14 +27,15 @@
> > > >  #include <subdev/fuse.h>
> > > >
> > > >  int
> > > > -g84_temp_get(struct nvkm_therm *therm)
> > > > +g84_temp_get(struct nvkm_therm *therm, int *temp)
> > > >  {
> > > >         struct nvkm_device *device = therm->subdev.device;
> > > >
> > > > -       if (nvkm_fuse_read(device->fuse, 0x1a8) == 1)
> > > > -               return nvkm_rd32(device, 0x20400);
> > > > -       else
> > > > +       if (nvkm_fuse_read(device->fuse, 0x1a8) != 1)
> > > >                 return -ENODEV;
> > > > +
> > > > +       *temp = nvkm_rd32(device, 0x20400);
> > > > +       return 0;
> > > >  }
> > > >
> > > >  void
> > > > @@ -115,7 +116,7 @@ g84_therm_threshold_hyst_emulation(struct nvkm_therm *therm,
> > > >         }
> > > >
> > > >         /* fix the state (in case someone reprogrammed the alarms) */
> > > > -       cur = therm->func->temp_get(therm);
> > > > +       WARN_ON(nvkm_therm_temp_get(therm, &cur) < 0);
> > > >         if (new_state == NVKM_THERM_THRS_LOWER && cur > thrs->temp)
> > > >                 new_state = NVKM_THERM_THRS_HIGHER;
> > > >         else if (new_state == NVKM_THERM_THRS_HIGHER &&
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > > > index 9f0dea3f61dc..4c32e4f21bec 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > > > @@ -24,7 +24,7 @@
> > > >  #include "priv.h"
> > > >
> > > >  static int
> > > > -gp100_temp_get(struct nvkm_therm *therm)
> > > > +gp100_temp_get(struct nvkm_therm *therm, int *temp)
> > > >  {
> > > >         struct nvkm_device *device = therm->subdev.device;
> > > >         struct nvkm_subdev *subdev = &therm->subdev;
> > > > @@ -35,11 +35,12 @@ gp100_temp_get(struct nvkm_therm *therm)
> > > >         if (tsensor & 0x40000000)
> > > >                 nvkm_trace(subdev, "reading temperature from SHADOWed sensor\n");
> > > >
> > > > -       /* device valid */
> > > > -       if (tsensor & 0x20000000)
> > > > -               return (inttemp >> 8);
> > > > -       else
> > > > +       /* device invalid */
> > > > +       if (!(tsensor & 0x20000000))
> > > >                 return -ENODEV;
> > > > +
> > > > +       *temp = inttemp >> 8;
> > > > +       return 0;
> > > >  }
> > > >
> > > >  static const struct nvkm_therm_func
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
> > > > index 2c92ffb5f9d0..9753ad4bee4a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
> > > > @@ -70,7 +70,7 @@ nv40_sensor_setup(struct nvkm_therm *therm)
> > > >  }
> > > >
> > > >  static int
> > > > -nv40_temp_get(struct nvkm_therm *therm)
> > > > +nv40_temp_get(struct nvkm_therm *therm, int *temp)
> > > >  {
> > > >         struct nvkm_device *device = therm->subdev.device;
> > > >         struct nvbios_therm_sensor *sensor = &therm->bios_sensor;
> > > > @@ -95,11 +95,8 @@ nv40_temp_get(struct nvkm_therm *therm)
> > > >         core_temp = core_temp + sensor->offset_num / sensor->offset_den;
> > > >         core_temp = core_temp + sensor->offset_constant - 8;
> > > >
> > > > -       /* reserve negative temperatures for errors */
> > > > -       if (core_temp < 0)
> > > > -               core_temp = 0;
> > > > -
> > > > -       return core_temp;
> > > > +       *temp = core_temp;
> > > > +       return 0;
> > > >  }
> > > >
> > > >  static int
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> > > > index 9b57b433d4cf..38fa6777c129 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> > > > @@ -126,7 +126,7 @@ nv50_sensor_setup(struct nvkm_therm *therm)
> > > >  }
> > > >
> > > >  static int
> > > > -nv50_temp_get(struct nvkm_therm *therm)
> > > > +nv50_temp_get(struct nvkm_therm *therm, int *temp)
> > > >  {
> > > >         struct nvkm_device *device = therm->subdev.device;
> > > >         struct nvbios_therm_sensor *sensor = &therm->bios_sensor;
> > > > @@ -143,11 +143,8 @@ nv50_temp_get(struct nvkm_therm *therm)
> > > >         core_temp = core_temp + sensor->offset_num / sensor->offset_den;
> > > >         core_temp = core_temp + sensor->offset_constant - 8;
> > > >
> > > > -       /* reserve negative temperatures for errors */
> > > > -       if (core_temp < 0)
> > > > -               core_temp = 0;
> > > > -
> > > > -       return core_temp;
> > > > +       *temp = core_temp;
> > > > +       return 0;
> > > >  }
> > > >
> > > >  static void
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > > > index 21659daf1864..04607d8b1755 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > > > @@ -91,7 +91,15 @@ struct nvkm_therm_func {
> > > >         int (*pwm_set)(struct nvkm_therm *, int line, u32, u32);
> > > >         int (*pwm_clock)(struct nvkm_therm *, int line);
> > > >
> > > > -       int (*temp_get)(struct nvkm_therm *);
> > > > +       /**
> > > > +        * @temp_get: Get the temperature reading from a thermal device
> > > > +        *
> > > > +        * @therm: The thermal device instance.
> > > > +        * @temp: A pointer to write the temperature reading to.
> > > > +        *
> > > > +        * Returns: Zero on success, or a negative error code on failure.
> > > > +        */
> > > > +       int (*temp_get)(struct nvkm_therm *therm, int *temp);
> > > >
> > > >         int (*fan_sense)(struct nvkm_therm *);
> > > >
> > > > @@ -110,7 +118,12 @@ int  nv50_fan_pwm_get(struct nvkm_therm *, int, u32 *, u32 *);
> > > >  int  nv50_fan_pwm_set(struct nvkm_therm *, int, u32, u32);
> > > >  int  nv50_fan_pwm_clock(struct nvkm_therm *, int);
> > > >
> > > > -int  g84_temp_get(struct nvkm_therm *);
> > > > +/**
> > > > + * g84_temp_get() - An implementation of the &struct nvkm_therm_func temp_get()
> > > > + * @therm: The thermal device instance.
> > > > + * @temp: A pointer to write the temperature reading to.
> > > > + */
> > > > +int  g84_temp_get(struct nvkm_therm *therm, int *temp);
> > > >  void g84_sensor_setup(struct nvkm_therm *);
> > > >  void g84_therm_fini(struct nvkm_therm *);
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > > > index ddb2b2c600ca..1e8803901abc 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > > > @@ -86,7 +86,9 @@ nvkm_therm_sensor_event(struct nvkm_therm *therm, enum nvkm_therm_thrs thrs,
> > > >         static const char * const thresholds[] = {
> > > >                 "fanboost", "downclock", "critical", "shutdown"
> > > >         };
> > > > -       int temperature = therm->func->temp_get(therm);
> > > > +       int temperature;
> > > > +
> > > > +       WARN_ON(nvkm_therm_temp_get(therm, &temperature) < 0);
> > > >
> > > >         if (thrs < 0 || thrs > 3)
> > > >                 return;
> > > > @@ -140,7 +142,9 @@ nvkm_therm_threshold_hyst_polling(struct nvkm_therm *therm,
> > > >  {
> > > >         enum nvkm_therm_thrs_direction direction;
> > > >         enum nvkm_therm_thrs_state prev_state, new_state;
> > > > -       int temp = therm->func->temp_get(therm);
> > > > +       int temp;
> > > > +
> > > > +       WARN_ON(nvkm_therm_temp_get(therm, &temp) < 0);
> > > >
> > > >         prev_state = nvkm_therm_sensor_get_threshold_state(therm, thrs_name);
> > > >
> > > > @@ -185,7 +189,7 @@ alarm_timer_callback(struct nvkm_alarm *alarm)
> > > >         spin_unlock_irqrestore(&therm->sensor.alarm_program_lock, flags);
> > > >
> > > >         /* schedule the next poll in one second */
> > > > -       if (therm->func->temp_get(therm) >= 0)
> > > > +       if (nvkm_therm_temp_get(therm, NULL) >= 0)
> > > >                 nvkm_timer_alarm(tmr, 1000000000ULL, alarm);
> > > >  }
> > > >
> > > > @@ -229,7 +233,7 @@ nvkm_therm_sensor_preinit(struct nvkm_therm *therm)
> > > >  {
> > > >         const char *sensor_avail = "yes";
> > > >
> > > > -       if (therm->func->temp_get(therm) < 0)
> > > > +       if (nvkm_therm_temp_get(therm, NULL) < 0)
> > > >                 sensor_avail = "no";
> > > >
> > > >         nvkm_debug(&therm->subdev, "internal sensor: %s\n", sensor_avail);
> > > > --
> > > > 2.26.2
> > > >
> >
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
