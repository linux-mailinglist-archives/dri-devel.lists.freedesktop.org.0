Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FF2582DA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D066E517;
	Mon, 31 Aug 2020 20:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D509F6E517
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:39:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a17so6377593wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEXwK/AYtk5NMeAkbvpfYjdsr3rAulnvGiGDRk6YFJs=;
 b=Gdeao9s2T/5RN8bc3b0JyZa36z6ET/IRAJ0eUXFhEpK1DQwNpTcbnzx6ng+krwkKon
 lrlCxMheYH7m969ETkmTNQSd5pKU6uTICYaZ9G5Mi5eiHco5TDMGspJcMpdTkST43QjK
 xAO9Kkh6UcEz9YHFkTfEx6H57M35qzxw0STyD7Z2WtrjivCCHNE/82vTykivemhXT2Rb
 ImB9qTsrH7uSXHWikR5wbHsn05EOM6cxExlKScm01All/ju0wqcJ5mblPTXuE4xI0UTC
 8dNCPMrHIODVZDMr5KZ4wELRujdt5wkmDniUyacUqXBW5JBTZ/HGGPMgjf66bTsBXNn7
 Y8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEXwK/AYtk5NMeAkbvpfYjdsr3rAulnvGiGDRk6YFJs=;
 b=L1mKjMwO0/gL7ei7dbWsN22es+datmU47uFh19vzoE/jo8qJaSVtRGrCwvKs3Z3hQA
 L2hbqOWvXgoSM8QgdLe8HVgP9h0vKGOx186RSS2BkZ42Yxhz7VWifjNhmEpbEH7wuNqz
 vOzIaqkMMYEGEvL1BJkqQYcv+lrTyiQ/5YlSR5uvVIL3nMBaH994dSNDXNghZwNGE5cp
 mO2zsMQ43WvnqPs/gN8AXb89aS/jfhbw0oPS7U8wwc5vscd9JhGb83jyR7xS4OiY86Ib
 IsCbFWCmgcI/u0jssnPr/WIB0VKclj9VUCHDFVtVBbZ7MNLlKcCj9ehqkyIml+KvXizK
 239w==
X-Gm-Message-State: AOAM5303eRvejrC3dleHmLkklOcim2fx8p3cXog7tUQtrezfOYn78uI/
 ubNrJQczb5gw/dL0ZjDzTchJBCqUMl32gNxT2LY=
X-Google-Smtp-Source: ABdhPJzcSzL6nhZZ5nKoYzOjYchtPt8j66uH9Z138zOa7H3Cl0BnUHbSehrkjL8JRGx0ZfwDM6n9CeOqH+1JAfEHenQ=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr3316361wrs.419.1598906372521; 
 Mon, 31 Aug 2020 13:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <a310a773-b708-e927-b80d-fbcbb97a3b5e@gmail.com>
In-Reply-To: <a310a773-b708-e927-b80d-fbcbb97a3b5e@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Aug 2020 16:39:21 -0400
Message-ID: <CADnq5_P=zfcbSyHUKhx=0ZVSujei-FDWD2mk_n=i--4w-qH16Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: Add vddc hwmon sensor
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

On Sun, Aug 30, 2020 at 3:26 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>

Please add a commit message.  Also, split this into 2-3 patches:
1. add the new dpm callback
2. add the sumo implementation of the new callback (could be combined with 1)
3. expose the voltage via hwmon

For the last patch, you probably also want to adjust
hwmon_attributes_visible() to hide the voltage on asics which don't
have the callback.

Thanks!

Alex

> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> ---
>  drivers/gpu/drm/radeon/radeon.h      |  1 +
>  drivers/gpu/drm/radeon/radeon_asic.c |  1 +
>  drivers/gpu/drm/radeon/radeon_asic.h |  1 +
>  drivers/gpu/drm/radeon/radeon_pm.c   | 21 +++++++++++++++++++++
>  drivers/gpu/drm/radeon/sumo_dpm.c    | 20 ++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 30e32adc1fc6..ec82f22e503a 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1992,6 +1992,7 @@ struct radeon_asic {
>                 int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
>                 u32 (*get_current_sclk)(struct radeon_device *rdev);
>                 u32 (*get_current_mclk)(struct radeon_device *rdev);
> +               u16 (*get_current_vddc)(struct radeon_device *rdev);
>         } dpm;
>         /* pageflipping */
>         struct {
> diff --git a/drivers/gpu/drm/radeon/radeon_asic.c b/drivers/gpu/drm/radeon/radeon_asic.c
> index 495700d16fc9..8becbe09af2f 100644
> --- a/drivers/gpu/drm/radeon/radeon_asic.c
> +++ b/drivers/gpu/drm/radeon/radeon_asic.c
> @@ -1513,6 +1513,7 @@ static struct radeon_asic sumo_asic = {
>                 .force_performance_level = &sumo_dpm_force_performance_level,
>                 .get_current_sclk = &sumo_dpm_get_current_sclk,
>                 .get_current_mclk = &sumo_dpm_get_current_mclk,
> +               .get_current_vddc = &sumo_dpm_get_current_vddc,
>         },
>         .pflip = {
>                 .page_flip = &evergreen_page_flip,
> diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeon/radeon_asic.h
> index a74fa18cd27b..24644daead53 100644
> --- a/drivers/gpu/drm/radeon/radeon_asic.h
> +++ b/drivers/gpu/drm/radeon/radeon_asic.h
> @@ -596,6 +596,7 @@ int sumo_dpm_force_performance_level(struct radeon_device *rdev,
>                                      enum radeon_dpm_forced_level level);
>  u32 sumo_dpm_get_current_sclk(struct radeon_device *rdev);
>  u32 sumo_dpm_get_current_mclk(struct radeon_device *rdev);
> +u16 sumo_dpm_get_current_vddc(struct radeon_device *rdev);
>
>  /*
>   * cayman
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index 05c4196a8212..f02386a0d988 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -737,6 +737,26 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
>  static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
>                           0);
>
> +static ssize_t radeon_hwmon_show_vddc(struct device *dev,
> +                                     struct device_attribute *attr, char *buf)
> +{
> +       struct radeon_device *rdev = dev_get_drvdata(dev);
> +       struct drm_device *ddev = rdev->ddev;
> +       u16 vddc = 0;
> +
> +       /* Can't get vddc when the card is off */
> +       if ((rdev->flags & RADEON_IS_PX) &&
> +               (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> +               return -EINVAL;
> +
> +       if (rdev->asic->dpm.get_current_vddc)
> +               vddc = rdev->asic->dpm.get_current_vddc(rdev);
> +
> +       return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
> +}
> +
> +static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
> +                         0);
>
>  static struct attribute *hwmon_attributes[] = {
>         &sensor_dev_attr_temp1_input.dev_attr.attr,
> @@ -747,6 +767,7 @@ static struct attribute *hwmon_attributes[] = {
>         &sensor_dev_attr_pwm1_min.dev_attr.attr,
>         &sensor_dev_attr_pwm1_max.dev_attr.attr,
>         &sensor_dev_attr_freq1_input.dev_attr.attr,
> +       &sensor_dev_attr_in0_input.dev_attr.attr,
>         NULL
>  };
>
> diff --git a/drivers/gpu/drm/radeon/sumo_dpm.c b/drivers/gpu/drm/radeon/sumo_dpm.c
> index b95d5d390caf..f74f381af05f 100644
> --- a/drivers/gpu/drm/radeon/sumo_dpm.c
> +++ b/drivers/gpu/drm/radeon/sumo_dpm.c
> @@ -1865,6 +1865,26 @@ u32 sumo_dpm_get_current_mclk(struct radeon_device *rdev)
>         return pi->sys_info.bootup_uma_clk;
>  }
>
> +u16 sumo_dpm_get_current_vddc(struct radeon_device *rdev)
> +{
> +       struct sumo_power_info *pi = sumo_get_pi(rdev);
> +       struct radeon_ps *rps = &pi->current_rps;
> +       struct sumo_ps *ps = sumo_get_ps(rps);
> +       struct sumo_pl *pl;
> +       u32 current_index =
> +               (RREG32(TARGET_AND_CURRENT_PROFILE_INDEX) & CURR_INDEX_MASK) >>
> +               CURR_INDEX_SHIFT;
> +
> +       if (current_index == BOOST_DPM_LEVEL) {
> +               pl = &pi->boost_pl;
> +       } else if (current_index >= ps->num_levels) {
> +               return 0;
> +       } else {
> +               pl = &ps->levels[current_index];
> +       }
> +       return sumo_convert_voltage_index_to_value(rdev, pl->vddc_index);
> +}
> +
>  void sumo_dpm_fini(struct radeon_device *rdev)
>  {
>         int i;
> --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
