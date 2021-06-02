Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34326397E42
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 03:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FDE89C1E;
	Wed,  2 Jun 2021 01:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8D89C1E;
 Wed,  2 Jun 2021 01:53:23 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so1139756otg.2; 
 Tue, 01 Jun 2021 18:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=808lPJMNU82vuLNkoBWoEKGDD/4g6v7JuN8FunnyIsk=;
 b=VL8wFpkBPgI4HBcqRUWarcnxOsuRa/i+iLDJxEU2m/kLzWfJRuBiF9vbvP1xY6+KDk
 dF+1W4IIpTAW4x/7W4/XYjXti/JMQXXOwnDS9ZdXLCljddZ41Qu4NUS4pgm0ibHSNLIR
 jsT3MtKtL+QPVaqdevbl3XmnzloUdZPPN58t6jNBchRCAPsNfAZs4AayNzxObTOgvRoT
 afPUNCTB6IKen0P2Q+UmgNL31F0NukXEg0+w1w8YF0fJqTHQmn027HEA7PJWWVIDxaaR
 CiExGVD91Q+ps+Pqyf3su39qSXg0j/nEAImxOWGc36HuE/DFshuAWyrAgbAqXNeZ+WCm
 csCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=808lPJMNU82vuLNkoBWoEKGDD/4g6v7JuN8FunnyIsk=;
 b=QRWiKBoKdq86b4CxaXHNmuPXthPuuEPwhVqIFkj9WwaObq/HhzqXA8R8esm4fHxxgm
 /MBG9tjQkpQ6m/rQfPkm+ab7Phvj4mpHbB4ooj5eP7Z7WSYe+xmlxc2UgVUVOAkVOGVl
 XYOWaUirejXpVD0yzOXoo82EuJNgUaAhlxhGZ1I0UUu7pSvkQu5xijUj/msMj/W2Sy+T
 V4LPWg1OgJdflooThbeu5mDgJ8+99uP3/SeGov/rlzy+GqkZTFuwi+RhMyhEymcsCOYM
 dAcdncak2YGPNgrgQPEa+CZabrYNTophagGqtbjymDUkGGEZlBGbjrgSZBt+bf0M0a5E
 kSHg==
X-Gm-Message-State: AOAM5331dYcFKb8xl2TV6IKvvxXHTXOoMaoNvVDTPpJujBp7Tp3d/rv4
 SNDwJ+zDcu8HXtU82FUUpxRQGTg5aYjS3SU+PKm4cqtj
X-Google-Smtp-Source: ABdhPJz8yiekIq60HpZI8GZkZq5YHICKRQnCgncgu6RV2PrJA7tU6O32SuN5NUgI3LiNfC/UmkuhLRYqjG/iPOCN3jY=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr24871519otl.132.1622598803212; 
 Tue, 01 Jun 2021 18:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210528070217.9204-1-yuehaibing@huawei.com>
In-Reply-To: <20210528070217.9204-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jun 2021 21:53:12 -0400
Message-ID: <CADnq5_M2dSDqafpgEvuaRZRHk1j0=obTyYcYX0GGRGiBzs5eMQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/radeon/radeon_pm: use DEVICE_ATTR_RW macro
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 3:18 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I'm not convinced this really buys us anything other than code churn,
but I don't have a particularly strong opinion of others feel
differently.

Alex


> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 56 ++++++++++++------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index 3861c0b98fcf..edf10cc3947e 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -352,9 +352,8 @@ static void radeon_pm_print_states(struct radeon_device *rdev)
>         }
>  }
>
> -static ssize_t radeon_get_pm_profile(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    char *buf)
> +static ssize_t power_profile_show(struct device *dev,
> +                                 struct device_attribute *attr, char *buf)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -366,10 +365,8 @@ static ssize_t radeon_get_pm_profile(struct device *dev,
>                           (cp == PM_PROFILE_HIGH) ? "high" : "default");
>  }
>
> -static ssize_t radeon_set_pm_profile(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf,
> -                                    size_t count)
> +static ssize_t power_profile_store(struct device *dev, struct device_attribute *attr,
> +                                  const char *buf, size_t count)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -406,9 +403,8 @@ static ssize_t radeon_set_pm_profile(struct device *dev,
>         return count;
>  }
>
> -static ssize_t radeon_get_pm_method(struct device *dev,
> -                                   struct device_attribute *attr,
> -                                   char *buf)
> +static ssize_t power_method_show(struct device *dev,
> +                                struct device_attribute *attr, char *buf)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -418,10 +414,9 @@ static ssize_t radeon_get_pm_method(struct device *dev,
>                           (pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
>  }
>
> -static ssize_t radeon_set_pm_method(struct device *dev,
> -                                   struct device_attribute *attr,
> -                                   const char *buf,
> -                                   size_t count)
> +static ssize_t power_method_store(struct device *dev,
> +                                 struct device_attribute *attr,
> +                                 const char *buf, size_t count)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -462,9 +457,8 @@ static ssize_t radeon_set_pm_method(struct device *dev,
>         return count;
>  }
>
> -static ssize_t radeon_get_dpm_state(struct device *dev,
> -                                   struct device_attribute *attr,
> -                                   char *buf)
> +static ssize_t power_dpm_state_show(struct device *dev,
> +                                   struct device_attribute *attr, char *buf)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -475,10 +469,9 @@ static ssize_t radeon_get_dpm_state(struct device *dev,
>                           (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
>  }
>
> -static ssize_t radeon_set_dpm_state(struct device *dev,
> -                                   struct device_attribute *attr,
> -                                   const char *buf,
> -                                   size_t count)
> +static ssize_t power_dpm_state_store(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    const char *buf, size_t count)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -506,9 +499,9 @@ static ssize_t radeon_set_dpm_state(struct device *dev,
>         return count;
>  }
>
> -static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
> -                                                      struct device_attribute *attr,
> -                                                      char *buf)
> +static ssize_t power_dpm_force_performance_level_show(struct device *dev,
> +                                                     struct device_attribute *attr,
> +                                                     char *buf)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -523,10 +516,9 @@ static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
>                           (level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
>  }
>
> -static ssize_t radeon_set_dpm_forced_performance_level(struct device *dev,
> +static ssize_t power_dpm_force_performance_level_store(struct device *dev,
>                                                        struct device_attribute *attr,
> -                                                      const char *buf,
> -                                                      size_t count)
> +                                                      const char *buf, size_t count)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct radeon_device *rdev = ddev->dev_private;
> @@ -658,12 +650,10 @@ static ssize_t radeon_hwmon_get_pwm1(struct device *dev,
>         return sprintf(buf, "%i\n", speed);
>  }
>
> -static DEVICE_ATTR(power_profile, S_IRUGO | S_IWUSR, radeon_get_pm_profile, radeon_set_pm_profile);
> -static DEVICE_ATTR(power_method, S_IRUGO | S_IWUSR, radeon_get_pm_method, radeon_set_pm_method);
> -static DEVICE_ATTR(power_dpm_state, S_IRUGO | S_IWUSR, radeon_get_dpm_state, radeon_set_dpm_state);
> -static DEVICE_ATTR(power_dpm_force_performance_level, S_IRUGO | S_IWUSR,
> -                  radeon_get_dpm_forced_performance_level,
> -                  radeon_set_dpm_forced_performance_level);
> +static DEVICE_ATTR_RW(power_profile);
> +static DEVICE_ATTR_RW(power_method);
> +static DEVICE_ATTR_RW(power_dpm_state);
> +static DEVICE_ATTR_RW(power_dpm_force_performance_level);
>
>  static ssize_t radeon_hwmon_show_temp(struct device *dev,
>                                       struct device_attribute *attr,
> --
> 2.17.1
>
