Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B92582A3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EAB6E362;
	Mon, 31 Aug 2020 20:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6C06E362
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:33:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e17so725131wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAYTQk6BbkYrOeXqh44ptjwEooc25XgGBFDRsDqh1n0=;
 b=nbMUlEhDG8PYIhPXQspzu/AAVJHu4O45MTgG1Am85lYbi+GJGuomcqS1naE9Gbg64f
 Z8Z1gC1ubijkmk47sVzotdhPf1srau229FoklESLU4/kNmTCcWMrd4SMkH0+rv5sTo5i
 vv9iQs/DcyQ/z6lim/eYhZkdJkXAyadRI3GJGOAWsMEthXZeJWhPhfa+2mwQBEjmxTnq
 ExgANqJ76ccN7McDHWZTG7+vJVHuKx1yuUlt8To7P0zG7y/B5KCZ75H0W4qQfgj/waYC
 NmPfSTHodyopscliUIgpOjtt9eLJX0jg7EXhAtFHQb0hylzhJ/zM/I5vEYyIhT3xT8mA
 bH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAYTQk6BbkYrOeXqh44ptjwEooc25XgGBFDRsDqh1n0=;
 b=ZdF2XaO0isc+xWcFMPIRROHvp9rAZjegb11t28SOohGOrmr1QFDS8B5F7ICFSm+vqn
 Tvkfx7kDfKdMoK0Q8cbRAjXGMUoNpXzVsX5kgL33jCdAgbqbH1o3qeLeYUCgYI2iH61j
 zSFMViWNia9BjqGmtKWwf6AmRC5KNmxtZId8ERH5aKwtZo9DMYNCC0T+9DKYUMjmk6fP
 2M5U6rHL39iuKePKx1oI1FOBGjclSeuYJdI2fApuOISaCd5sW2vbx2MoiryZ/IZo18qf
 Fl9NnuVKUvCPi96bkecWumwzezhZvttpd0F3UoFLRtvXp94M/FJ2rHsODboK864u9EVV
 0luA==
X-Gm-Message-State: AOAM530v63bC2nv/7MVZwCMypgAofaD94HiPqueYJUY47Yach1RG2vSx
 3Bv5yeMsaXZ4a19xR0AAc3ShfCUj/YIEZ4mJJZA=
X-Google-Smtp-Source: ABdhPJyxQc/Ty7Nc4zLnanLZDobqg6ed32f7B6utZ4QoP5xytn7bFFfbIS6qq0dilkILgGF6HkFqqpQhDz5t++Rghs4=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr926022wml.73.1598906012260;
 Mon, 31 Aug 2020 13:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <61af3cb4-9bfc-0e61-de9c-4bb15afdd652@gmail.com>
In-Reply-To: <61af3cb4-9bfc-0e61-de9c-4bb15afdd652@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Aug 2020 16:33:21 -0400
Message-ID: <CADnq5_NOUxxTkBLfmZhaDSvOGy51F+HYQKvcHuC+e4U7W6eLNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Add sclk frequency as hwmon sensor
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 30, 2020 at 3:25 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> This patch series adds support for reporting sclk and vddc values for Radeon GPUs, where supported.

This commit message should be specific to this particular patch rather
than the series.  You could probably expose mclk as well.

Alex


>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index 8c5d6fda0d75..05c4196a8212 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -712,6 +712,31 @@ static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, radeon_hwmon_get_pwm1_
>  static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO, radeon_hwmon_get_pwm1_min, NULL, 0);
>  static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO, radeon_hwmon_get_pwm1_max, NULL, 0);
>
> +static ssize_t radeon_hwmon_show_sclk(struct device *dev,
> +                                     struct device_attribute *attr, char *buf)
> +{
> +       struct radeon_device *rdev = dev_get_drvdata(dev);
> +       struct drm_device *ddev = rdev->ddev;
> +       u32 sclk = 0;
> +
> +       /* Can't get clock frequency when the card is off */
> +       if ((rdev->flags & RADEON_IS_PX) &&
> +           (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> +               return -EINVAL;
> +
> +       if (rdev->asic->dpm.get_current_sclk)
> +               sclk = radeon_dpm_get_current_sclk(rdev);
> +
> +       /* Value returned by dpm is in 10 KHz units, need to convert it into Hz
> +          for hwmon */
> +       sclk *= 10000;
> +
> +       return snprintf(buf, PAGE_SIZE, "%u\n", sclk);
> +}
> +
> +static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
> +                         0);
> +
>
>  static struct attribute *hwmon_attributes[] = {
>         &sensor_dev_attr_temp1_input.dev_attr.attr,
> @@ -721,6 +746,7 @@ static struct attribute *hwmon_attributes[] = {
>         &sensor_dev_attr_pwm1_enable.dev_attr.attr,
>         &sensor_dev_attr_pwm1_min.dev_attr.attr,
>         &sensor_dev_attr_pwm1_max.dev_attr.attr,
> +       &sensor_dev_attr_freq1_input.dev_attr.attr,
>         NULL
>  };
>
> @@ -738,7 +764,8 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
>              attr == &sensor_dev_attr_pwm1.dev_attr.attr ||
>              attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
>              attr == &sensor_dev_attr_pwm1_max.dev_attr.attr ||
> -            attr == &sensor_dev_attr_pwm1_min.dev_attr.attr))
> +            attr == &sensor_dev_attr_pwm1_min.dev_attr.attr ||
> +            attr == &sensor_dev_attr_freq1_input.dev_attr.attr))
>                 return 0;
>
>         /* Skip fan attributes if fan is not present */
> --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
