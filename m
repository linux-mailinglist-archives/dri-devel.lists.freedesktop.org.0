Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9B262610
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 06:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABAB6E950;
	Wed,  9 Sep 2020 04:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9896E94F;
 Wed,  9 Sep 2020 04:06:04 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id q3so884012ybp.7;
 Tue, 08 Sep 2020 21:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5l1eticj7qDEdDrm+OGUOAk8jXt5YDIoOSHNMBDZgrs=;
 b=QKCBOrW+n5uJloRSW/TtfMCk2ECMuKI0/Ix/ZlH1tx5chIYiuGO+fPBqUG39J/laqA
 tT3nj1TNAuEingDRkUbUa8yoGpLSXKacXQFIDkr4DuKukTkqc3r1tCZ6vRrhX76HFZ8R
 GvK4q2OapZQtyohQaPR40jrK6INB98O7Nsvp0yU/p1N7Ccjky2/e8SbNvxHuNTETNvtC
 KvuQZb/CpjTwhdYz0fuV+qXCCX/Zbbz62G6be0r39Le319Ah8pliXMsv+QYG+3PH3zJV
 /Q9+noQh1ZjjhzE2wg2ieli4Xuu9go5nTuYyKG9ox9LELbmLhYpHIZ6J0Y6iIpvB737Z
 dtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5l1eticj7qDEdDrm+OGUOAk8jXt5YDIoOSHNMBDZgrs=;
 b=BxJx9y/oxq3lyvvHVGIGbwtiNOS6cfxxaUzug56elQWnp7rzJ4nVzs4AOdB3iKEOJr
 ly+zlwVaNiA0MR70vlq77yV9YM1K7XWAF40FEn0kF6x1awpfyh7PI+KlFj36F6arUk0O
 4ap7EsIOSQFLkX9NA5nFSINFVwdQnR42gAbSst4Thd/9bYNBza25u9aZrCCwuB5XSfcc
 WoWYR9DjNijT+UbwM/IMyNDgG6Wjb9whHdKRgE5rlE/5yp4u+3sgjv/OnW/+B8GO3mwX
 nScTXBh9YzYNI8Mb1efNTjRthmtJ37tDfIQCLxwYXcSjNTWjN1o83bUEI4Jb10C5gKGe
 lA9Q==
X-Gm-Message-State: AOAM532D6Boj5M9oRT97CBRuALIPhy2rVNioohLLIXMC3svG1CYarXI6
 KHErajYAn4iUDKme3eZWm6MyMgZfb+A0H1FYYOI=
X-Google-Smtp-Source: ABdhPJy9FO00MIL4D9dDFJBguiKSTl16emuFaEgF/hSBMy+cayLwOwEwIBBW7+th3r2A/O5CkHUDdgMCa8tuQni/HeE=
X-Received: by 2002:a25:bc82:: with SMTP id e2mr2918057ybk.435.1599624363612; 
 Tue, 08 Sep 2020 21:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200812204952.1921587-1-jcline@redhat.com>
In-Reply-To: <20200812204952.1921587-1-jcline@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 9 Sep 2020 14:05:52 +1000
Message-ID: <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
To: Jeremy Cline <jcline@redhat.com>
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
>
> Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> new gp1xx temperature sensor") added support for reading finer-grain
> temperatures, but continued to report temperatures in 1 degree Celsius
> increments via nvkm_therm_temp_get().
>
> Rather than altering nvkm_therm_temp_get() to report finer-grain
> temperatures, which would be inconvenient for other users of the
> function, a second interface has been added to line up with hwmon's
> native unit of temperature.
Hey Jeremy,

Sorry this slipped past me until now.  I'm OK with adding support for
millidegree temperature reporting, but don't think we need to keep
both interfaces around and would rather see the existing code
converted to return millidegrees (even on GPUs that don't support it)
instead of degrees.

Thanks!
Ben.

>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
>  .../drm/nouveau/include/nvkm/subdev/therm.h   | 18 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  4 +--
>  .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 16 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 25 +++++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  |  1 +
>  5 files changed, 60 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> index 62c34f98c930..7b9928dd001c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> @@ -100,6 +100,24 @@ struct nvkm_therm {
>  };
>
>  int nvkm_therm_temp_get(struct nvkm_therm *);
> +
> +/**
> + * nvkm_therm_temp_millidegree_get() - get the temperature in millidegrees
> + * @therm: The thermal device to read from.
> + *
> + * This interface reports temperatures in units of millidegree Celsius to
> + * align with the hwmon API. Some cards may only be capable of reporting in
> + * units of Celsius, and those that report finer grain temperatures may not be
> + * capable of millidegree Celsius accuracy,
> + *
> + * For cases where millidegree temperature is too fine-grain, the
> + * nvkm_therm_temp_get() interface reports temperatures in one degree Celsius
> + * increments.
> + *
> + * Return: The temperature in millidegrees Celsius, or -ENODEV if temperature
> + *         reporting is not supported.
> + */
> +int nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm);
>  int nvkm_therm_fan_sense(struct nvkm_therm *);
>  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
>  void nvkm_therm_clkgate_init(struct nvkm_therm *,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 1c3104d20571..e96355f93ce5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
>         case hwmon_temp_input:
>                 if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
>                         return -EINVAL;
> -               ret = nvkm_therm_temp_get(therm);
> -               *val = ret < 0 ? ret : (ret * 1000);
> +               ret = nvkm_therm_temp_millidegree_get(therm);
> +               *val = ret;
>                 break;
>         case hwmon_temp_max:
>                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> index 4a4d1e224126..e655b32c78b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> @@ -34,6 +34,22 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
>         return -ENODEV;
>  }
>
> +int
> +nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm)
> +{
> +       int ret = -ENODEV;
> +
> +       if (therm->func->temp_millidegree_get)
> +               return therm->func->temp_millidegree_get(therm);
> +
> +       if (therm->func->temp_get) {
> +               ret = therm->func->temp_get(therm);
> +               if (ret > 0)
> +                       ret *= 1000;
> +       }
> +       return ret;
> +}
> +
>  static int
>  nvkm_therm_update_trip(struct nvkm_therm *therm)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> index 9f0dea3f61dc..4c3c2895a3cb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> @@ -24,7 +24,7 @@
>  #include "priv.h"
>
>  static int
> -gp100_temp_get(struct nvkm_therm *therm)
> +gp100_temp_get_raw(struct nvkm_therm *therm)
>  {
>         struct nvkm_device *device = therm->subdev.device;
>         struct nvkm_subdev *subdev = &therm->subdev;
> @@ -37,14 +37,35 @@ gp100_temp_get(struct nvkm_therm *therm)
>
>         /* device valid */
>         if (tsensor & 0x20000000)
> -               return (inttemp >> 8);
> +               return inttemp;
>         else
>                 return -ENODEV;
>  }
>
> +static int
> +gp100_temp_millidegree_get(struct nvkm_therm *therm)
> +{
> +       int raw_temp = gp100_temp_get_raw(therm);
> +
> +       if (raw_temp < 0)
> +               return raw_temp;
> +       return raw_temp * 1000 >> 8;
> +}
> +
> +static int
> +gp100_temp_get(struct nvkm_therm *therm)
> +{
> +       int raw_temp = gp100_temp_get_raw(therm);
> +
> +       if (raw_temp < 0)
> +               return raw_temp;
> +       return raw_temp >> 8;
> +}
> +
>  static const struct nvkm_therm_func
>  gp100_therm = {
>         .temp_get = gp100_temp_get,
> +       .temp_millidegree_get = gp100_temp_millidegree_get,
>         .program_alarms = nvkm_therm_program_alarms_polling,
>  };
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> index 21659daf1864..a53068b4f0b9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> @@ -92,6 +92,7 @@ struct nvkm_therm_func {
>         int (*pwm_clock)(struct nvkm_therm *, int line);
>
>         int (*temp_get)(struct nvkm_therm *);
> +       int (*temp_millidegree_get)(struct nvkm_therm *therm);
>
>         int (*fan_sense)(struct nvkm_therm *);
>
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
