Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4C398141
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 08:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8E6EB61;
	Wed,  2 Jun 2021 06:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1B46EB61;
 Wed,  2 Jun 2021 06:41:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id c11so1200264ljd.6;
 Tue, 01 Jun 2021 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=R9/y5IYzZfRPi/Fhac+yR1YulSNV9LadEvMh90LaCeo=;
 b=fNktISO3ADDDsqDFNCHQNvS3oGdIRn90B+HEZhYWQIOATUmuiqRmBFT/MYEXvpeILU
 4C+xjCwTKEj9/is8jhqvBxyfJtuRVUEvzhRGsilHbsXkyaGn8Lu9EuCxobg+OhaqOpGX
 lWhUWqJo/fubku/juKeHOhh/KbKp8HBlRYJcaj8QzvCC3SFQcvkGSBmMyt/KEBu+ulaP
 ggV4lU2XPaz1kzNDBxYkfIYRtiZLbvC8G1Am5Q2YHOU+pB9g9LTdC5Ht8nYAxrP9QFXk
 Nt6dHOjNKPseUN/43FwZag3PUV8JuU8QfTxiNZEdmhWh/M6Ogz/dswY4Z5dgsl6Zh93G
 R84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R9/y5IYzZfRPi/Fhac+yR1YulSNV9LadEvMh90LaCeo=;
 b=GV91xw3j4gJpB7nLck042nPBwJ6V6euchWg+DzgK+PMcR35aJxipR1FoaQjjZsl4kK
 wmCjVZByyL9vlRMpuN+Tb2rJEgLXc7zXk5Wdk5bxvXsTH2l8S4LUtu1Dre9GRBtEs1e/
 jMx65tEH28G9VYtJPqUuUOMGj3arqn3EW1jIrXAr+0tA/WIF6jMxJWdsNKLZGcu7OTXE
 QzsOO1TQoOFgwhQBKyX+wbgn4+qVJQGwbftpW0NRwGoVl9nPlSERetnUN487yVo3disz
 Hu1YpIXaTCaIPiIy4MSVUmFQw8jfokRfdauQR92tfpzT+s9RSgaPWdXi3W64vRGwGF9G
 kx0w==
X-Gm-Message-State: AOAM5331pkwAy+z05cQ5kaeUG58AMR5Frv9zWkeQyDgY9PsnI+DI4b6z
 kkRP3k1bWsU/L8G2Qfm675E=
X-Google-Smtp-Source: ABdhPJzIYkFbmi5Oc3PCYAwJ8UX0rROeI+UMxIzbiDuMK1nt2p50i5/fIbdVxXEjQoGuBZlJZMSTzg==
X-Received: by 2002:a2e:9182:: with SMTP id f2mr12972872ljg.223.1622616093901; 
 Tue, 01 Jun 2021 23:41:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id q7sm581480ljm.109.2021.06.01.23.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 23:41:33 -0700 (PDT)
Subject: Re: [PATCH -next] drm/radeon/radeon_pm: use DEVICE_ATTR_RW macro
To: Alex Deucher <alexdeucher@gmail.com>, YueHaibing <yuehaibing@huawei.com>
References: <20210528070217.9204-1-yuehaibing@huawei.com>
 <CADnq5_M2dSDqafpgEvuaRZRHk1j0=obTyYcYX0GGRGiBzs5eMQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <39b4c939-9f40-3e44-13d8-f98b01808d05@gmail.com>
Date: Wed, 2 Jun 2021 08:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_M2dSDqafpgEvuaRZRHk1j0=obTyYcYX0GGRGiBzs5eMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 03:53 schrieb Alex Deucher:
> On Fri, May 28, 2021 at 3:18 AM YueHaibing <yuehaibing@huawei.com> wrote:
>> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
>> which makes the code a bit shorter and easier to read.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> I'm not convinced this really buys us anything other than code churn,
> but I don't have a particularly strong opinion of others feel
> differently.

I agree, especially dropping the amdgpu prefix from the functions 
doesn't sound like something we want.

Christian.

>
> Alex
>
>
>> ---
>>   drivers/gpu/drm/radeon/radeon_pm.c | 56 ++++++++++++------------------
>>   1 file changed, 23 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
>> index 3861c0b98fcf..edf10cc3947e 100644
>> --- a/drivers/gpu/drm/radeon/radeon_pm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
>> @@ -352,9 +352,8 @@ static void radeon_pm_print_states(struct radeon_device *rdev)
>>          }
>>   }
>>
>> -static ssize_t radeon_get_pm_profile(struct device *dev,
>> -                                    struct device_attribute *attr,
>> -                                    char *buf)
>> +static ssize_t power_profile_show(struct device *dev,
>> +                                 struct device_attribute *attr, char *buf)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -366,10 +365,8 @@ static ssize_t radeon_get_pm_profile(struct device *dev,
>>                            (cp == PM_PROFILE_HIGH) ? "high" : "default");
>>   }
>>
>> -static ssize_t radeon_set_pm_profile(struct device *dev,
>> -                                    struct device_attribute *attr,
>> -                                    const char *buf,
>> -                                    size_t count)
>> +static ssize_t power_profile_store(struct device *dev, struct device_attribute *attr,
>> +                                  const char *buf, size_t count)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -406,9 +403,8 @@ static ssize_t radeon_set_pm_profile(struct device *dev,
>>          return count;
>>   }
>>
>> -static ssize_t radeon_get_pm_method(struct device *dev,
>> -                                   struct device_attribute *attr,
>> -                                   char *buf)
>> +static ssize_t power_method_show(struct device *dev,
>> +                                struct device_attribute *attr, char *buf)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -418,10 +414,9 @@ static ssize_t radeon_get_pm_method(struct device *dev,
>>                            (pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
>>   }
>>
>> -static ssize_t radeon_set_pm_method(struct device *dev,
>> -                                   struct device_attribute *attr,
>> -                                   const char *buf,
>> -                                   size_t count)
>> +static ssize_t power_method_store(struct device *dev,
>> +                                 struct device_attribute *attr,
>> +                                 const char *buf, size_t count)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -462,9 +457,8 @@ static ssize_t radeon_set_pm_method(struct device *dev,
>>          return count;
>>   }
>>
>> -static ssize_t radeon_get_dpm_state(struct device *dev,
>> -                                   struct device_attribute *attr,
>> -                                   char *buf)
>> +static ssize_t power_dpm_state_show(struct device *dev,
>> +                                   struct device_attribute *attr, char *buf)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -475,10 +469,9 @@ static ssize_t radeon_get_dpm_state(struct device *dev,
>>                            (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
>>   }
>>
>> -static ssize_t radeon_set_dpm_state(struct device *dev,
>> -                                   struct device_attribute *attr,
>> -                                   const char *buf,
>> -                                   size_t count)
>> +static ssize_t power_dpm_state_store(struct device *dev,
>> +                                    struct device_attribute *attr,
>> +                                    const char *buf, size_t count)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -506,9 +499,9 @@ static ssize_t radeon_set_dpm_state(struct device *dev,
>>          return count;
>>   }
>>
>> -static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
>> -                                                      struct device_attribute *attr,
>> -                                                      char *buf)
>> +static ssize_t power_dpm_force_performance_level_show(struct device *dev,
>> +                                                     struct device_attribute *attr,
>> +                                                     char *buf)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -523,10 +516,9 @@ static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
>>                            (level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
>>   }
>>
>> -static ssize_t radeon_set_dpm_forced_performance_level(struct device *dev,
>> +static ssize_t power_dpm_force_performance_level_store(struct device *dev,
>>                                                         struct device_attribute *attr,
>> -                                                      const char *buf,
>> -                                                      size_t count)
>> +                                                      const char *buf, size_t count)
>>   {
>>          struct drm_device *ddev = dev_get_drvdata(dev);
>>          struct radeon_device *rdev = ddev->dev_private;
>> @@ -658,12 +650,10 @@ static ssize_t radeon_hwmon_get_pwm1(struct device *dev,
>>          return sprintf(buf, "%i\n", speed);
>>   }
>>
>> -static DEVICE_ATTR(power_profile, S_IRUGO | S_IWUSR, radeon_get_pm_profile, radeon_set_pm_profile);
>> -static DEVICE_ATTR(power_method, S_IRUGO | S_IWUSR, radeon_get_pm_method, radeon_set_pm_method);
>> -static DEVICE_ATTR(power_dpm_state, S_IRUGO | S_IWUSR, radeon_get_dpm_state, radeon_set_dpm_state);
>> -static DEVICE_ATTR(power_dpm_force_performance_level, S_IRUGO | S_IWUSR,
>> -                  radeon_get_dpm_forced_performance_level,
>> -                  radeon_set_dpm_forced_performance_level);
>> +static DEVICE_ATTR_RW(power_profile);
>> +static DEVICE_ATTR_RW(power_method);
>> +static DEVICE_ATTR_RW(power_dpm_state);
>> +static DEVICE_ATTR_RW(power_dpm_force_performance_level);
>>
>>   static ssize_t radeon_hwmon_show_temp(struct device *dev,
>>                                        struct device_attribute *attr,
>> --
>> 2.17.1
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

