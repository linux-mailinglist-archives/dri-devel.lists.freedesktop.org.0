Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD234966F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 17:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EEF6EB76;
	Thu, 25 Mar 2021 16:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78B6EB6F;
 Thu, 25 Mar 2021 16:10:14 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so2413728otn.10; 
 Thu, 25 Mar 2021 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtQvyaGKV3kyi9ED0q8K8Gw5xYtZt3rPBFlge3YZ5uM=;
 b=fnr+I9gcZiOjpHijtYEJ3Wf6YMa5aLLfw1P5IMctftdccRxpYXLvencZnuslAvjrbO
 XG3123g+siy7YTZidCnctw2a34i9aVtLKMqYGpq7mO+msJ88k0psGtJzTkGUfUCl9AzX
 yBeH5tAZ9vsBHCLnAvCt93gdEV0csx41BJXjxk4OVvicyxa+mMU7QYdbhttKAHbnHv2R
 ws02NA4QaAW3f3KJTjFlFLzdnuEqpvfrjM7ryP438G9rwEJB1DihBt/Whv0EdWTpOqMy
 3CJiNv5Ie5omoMWVwawnkJl1wUL9qI/uvd6dwhQ+VeI95vzetJEESismcTlo040/cXSq
 OeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtQvyaGKV3kyi9ED0q8K8Gw5xYtZt3rPBFlge3YZ5uM=;
 b=pi4fHVnvxsDuPx5fTohl9jj+hksV2JyjR3SmexuTdwhI7/IBP9Cg5uCHzWuBjkug9v
 2UyTCeLvoKlhhUI9lqCQmbRyMe0i4rVzeCzJRKwSmG8OobbMi+66KshS8KzDeyGv8BL4
 Csz4PfNimlkhY6RtjnzXsW2Xt0BX65jCvf0FpEW9w6dYyBNPdRqQR19SR4azm5HSOUKU
 ua9PaRcn9ryduPvC7WhTmtSmVa4o9SU9ZKIkqGsHOkv0YdPfNZqgv9d8CiuVA2AWoAsq
 Iu+vgBytfSwppsCc7W6NBiy5olf6whVXf92GnotvMXCBf7Josi6CfcKqfu2EbCYcFnBl
 4sIg==
X-Gm-Message-State: AOAM531uvnbjROJQcEtw3QaSHa/Jr/iDHZJtOg+d2U0n7CivoV1kMsjr
 XmWaCjqQeERWhS2gU+iqEdstetUlFOnT2lGmWBL7/a62
X-Google-Smtp-Source: ABdhPJw/8NdWjYjwQ1fJVG8K0nwHbklwnCQDt6ICbmKIC3zHcYXV56FYaW410ZXgFFtajoCSkfkfByhi76gzS6gI9c4=
X-Received: by 2002:a9d:663:: with SMTP id 90mr6007333otn.311.1616688613333;
 Thu, 25 Mar 2021 09:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <1616568475-24509-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1616568475-24509-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Mar 2021 12:10:02 -0400
Message-ID: <CADnq5_PmsaXG86fDYGR3G4j5eeN2LoSzYOOUKwVPKYgwD4pwhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/radeon_pm: Convert sysfs sprintf/snprintf
 family to sysfs_emit
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 2:47 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Fix the following coccicheck warning:
> drivers/gpu//drm/radeon/radeon_pm.c:521:9-17: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:475:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:418:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:363:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:734:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:688:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:704:8-16: WARNING: use scnprintf or
> sprintf
> drivers/gpu//drm/radeon/radeon_pm.c:755:8-16: WARNING: use scnprintf or
> sprintf
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index 1995dad..dd56fcd 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -361,11 +361,10 @@ static ssize_t radeon_get_pm_profile(struct device *dev,
>         struct radeon_device *rdev = ddev->dev_private;
>         int cp = rdev->pm.profile;
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n",
> -                       (cp == PM_PROFILE_AUTO) ? "auto" :
> -                       (cp == PM_PROFILE_LOW) ? "low" :
> -                       (cp == PM_PROFILE_MID) ? "mid" :
> -                       (cp == PM_PROFILE_HIGH) ? "high" : "default");
> +       return sysfs_emit(buf, "%s\n", (cp == PM_PROFILE_AUTO) ? "auto" :
> +                         (cp == PM_PROFILE_LOW) ? "low" :
> +                         (cp == PM_PROFILE_MID) ? "mid" :
> +                         (cp == PM_PROFILE_HIGH) ? "high" : "default");
>  }
>
>  static ssize_t radeon_set_pm_profile(struct device *dev,
> @@ -416,9 +415,8 @@ static ssize_t radeon_get_pm_method(struct device *dev,
>         struct radeon_device *rdev = ddev->dev_private;
>         int pm = rdev->pm.pm_method;
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n",
> -                       (pm == PM_METHOD_DYNPM) ? "dynpm" :
> -                       (pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
> +       return sysfs_emit(buf, "%s\n", (pm == PM_METHOD_DYNPM) ? "dynpm" :
> +                         (pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
>  }
>
>  static ssize_t radeon_set_pm_method(struct device *dev,
> @@ -473,9 +471,9 @@ static ssize_t radeon_get_dpm_state(struct device *dev,
>         struct radeon_device *rdev = ddev->dev_private;
>         enum radeon_pm_state_type pm = rdev->pm.dpm.user_state;
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n",
> -                       (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
> -                       (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
> +       return sysfs_emit(buf, "%s\n",
> +                         (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
> +                         (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
>  }
>
>  static ssize_t radeon_set_dpm_state(struct device *dev,
> @@ -519,11 +517,11 @@ static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
>
>         if  ((rdev->flags & RADEON_IS_PX) &&
>              (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> -               return snprintf(buf, PAGE_SIZE, "off\n");
> +               return sysfs_emit(buf, "off\n");
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n",
> -                       (level == RADEON_DPM_FORCED_LEVEL_AUTO) ? "auto" :
> -                       (level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
> +       return sysfs_emit(buf, "%s\n",
> +                         (level == RADEON_DPM_FORCED_LEVEL_AUTO) ? "auto" :
> +                         (level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
>  }
>
>  static ssize_t radeon_set_dpm_forced_performance_level(struct device *dev,
> @@ -686,7 +684,7 @@ static ssize_t radeon_hwmon_show_temp(struct device *dev,
>         else
>                 temp = 0;
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n", temp);
> +       return sysfs_emit(buf, "%d\n", temp);
>  }
>
>  static ssize_t radeon_hwmon_show_temp_thresh(struct device *dev,
> @@ -702,7 +700,7 @@ static ssize_t radeon_hwmon_show_temp_thresh(struct device *dev,
>         else
>                 temp = rdev->pm.dpm.thermal.max_temp;
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n", temp);
> +       return sysfs_emit(buf, "%d\n", temp);
>  }
>
>  static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, radeon_hwmon_show_temp, NULL, 0);
> @@ -732,7 +730,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
>            for hwmon */
>         sclk *= 10000;
>
> -       return snprintf(buf, PAGE_SIZE, "%u\n", sclk);
> +       return sysfs_emit(buf, "%u\n", sclk);
>  }
>
>  static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
> @@ -753,7 +751,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
>         if (rdev->asic->dpm.get_current_vddc)
>                 vddc = rdev->asic->dpm.get_current_vddc(rdev);
>
> -       return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
> +       return sysfs_emit(buf, "%u\n", vddc);
>  }
>
>  static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
