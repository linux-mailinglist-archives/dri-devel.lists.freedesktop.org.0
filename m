Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2F26ACF3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C2F6E8F5;
	Tue, 15 Sep 2020 19:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644F6E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 19:05:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so4470949wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E2e1+IODRnN/nOrdLV+Wwn4qSUNHevh+7qWrVjTS4VM=;
 b=NxQSjBjPU+wL/H47uC2QlUAW75mtsOO6v9YjGkl0nX1NuC5uNh5SLBGduqLXij45DA
 X6s/cKp0kvP7pn9vcYJRL2aoOAE6V0dmaFagZinefhyUSdwmrypilrbARO4YJbMmM6N8
 SfI02Vpkc+zxiaoNoALC10d4iLNA3HF9kUUCAHLVWS9o4hDal6PdUMzo/i0ha0FX+oQ+
 2YVCBxZX9RrpJ0n5GV9vv+dKLZAXesfCirs/lkgIWIPoKjnY6s2CFXZIcJf9ZM72XeF6
 bOvMEPXkeJ4HHZLKZoMlAMnOcJa0Il0vQpfD5nfm+0Ft23ph4k/CoAnsIKQmHt/NoujG
 h5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E2e1+IODRnN/nOrdLV+Wwn4qSUNHevh+7qWrVjTS4VM=;
 b=qn5QDb0znDlqehSOf4FBwmr1A1y9LSuGTVjMF1+VbT8/turA3srHRDVxCw9eLAktEJ
 1eEE/i986iCAs96jmO/tlGs+W3P/Aa4p928zX2if7x58nf5VrL36JzzifsV3NQKl0TgY
 Aq3zHiUg5cubADWEcDhGT/O5oD55iVNr7R8tTXYtOPGi8jvn3TxAvgpKTMRLMNdk1TFP
 gaEKFU04ulUPS4NoceyuPjM9hitHmYzxUpQ+lIBXSr37joDHAVna3nLi2WUhd2RrQiWg
 u6ZpzDFVS09AJcgVb2/dsLT+PtlaOtx2J78h4MQ3Zg8F2IH230vx3xfJE51vgMQ3e/Xv
 Px0w==
X-Gm-Message-State: AOAM531r8tXtYc/htG6BnapHy1lDRXUePp3Jw00Y66mrohBOMPFjnG61
 NNuxf5BV61J6vVxhIV1/KHgr1T6cDi8rb9tz0TU=
X-Google-Smtp-Source: ABdhPJzrUjo7BiTMDd856rSIdJ/wN7sz8TvNg7bfGR2460NiDxG1qQZqq5y9s6Tb6xGZoAnKMAwZDSC4KJpacz0eacw=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr22619965wro.362.1600196724794; 
 Tue, 15 Sep 2020 12:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <88e558db-d6f4-01bb-205c-34e473e4f9c3@gmail.com>
In-Reply-To: <88e558db-d6f4-01bb-205c-34e473e4f9c3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:05:14 -0400
Message-ID: <CADnq5_PvZHpKjiEknHCUq_Okmz62e=9ahUWNOLEChVPx6hhN4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/radeon: Add sclk frequency as hwmon sensor
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

Applied.  Thanks!

Alex

On Wed, Sep 9, 2020 at 7:04 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> This patch adds support for reporting sclk values for Radeon GPUs, where supported.
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
