Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA66DE75E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF4410E1DB;
	Tue, 11 Apr 2023 22:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A4410E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 22:36:55 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a3so4549358ljr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681252614; x=1683844614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6u3JzCEIV+MkTX89T9YhCkBiSU08RsEjj68tQ/W7rtw=;
 b=zcWRQi94sRMWvJXpLTR+F+5jTYvF/7sjYpXBd+4gQhy5s3oBJ5AYpWbTOcTZMfGJwW
 CayVvXN7HxPIa5fUD3zb5Mw5B19aBbYFSjoTeG/Et5GEddskS9GoeTSNhhUdAdxKgOaX
 WxStGqboG7FeID9PCTP/UmgSUeT2pVtT0CfkH30HwdYLMbEJlmYPsOs7DnaWyQjQUpmt
 EqeDdLvqcF3ggCpEwhL0uD61Hb+zu1xkSEypQeUqeSBC//6uKs2NsdWHpk3+G8OKHLwa
 q7dZ9l3cpj87LbsBNUl8iKJcOVZcVG88WAmDOhapmV2L77JNNGiJ6KJdFG2UrCKoNwdJ
 IUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681252614; x=1683844614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6u3JzCEIV+MkTX89T9YhCkBiSU08RsEjj68tQ/W7rtw=;
 b=fnmGDqq0XlYAqizXSZLBUCTgtWUOsdWe9ruFu/Y3H3grmb76a7rA3brDawAdFLiBG6
 LrkmHyBjSAN9sA5vYgqdvPJGhvrkp+NoPdM2BBJzAOV4Fld40lYioGdnGzA1UStPFhc5
 5m2BsOHZWn+ajXO0LV0utuGgIdDS8GzKuwgE7YEaLjUzStFEwA7xLY5bOtcMX+1qDKBS
 4zFUk2sRsQiJ+IM0J/LPJxCFNqORhI8rM/Sj0/RB6jKuAtxffl91RQLUZJPbIBejgqct
 E92petMU51T+d2MaIQVY36FuR/SrkNUDA5GWlUnN/qv90tDSrZvSmwiDYgpLwdRS9vK2
 UDWQ==
X-Gm-Message-State: AAQBX9dWoCeBQ3sDRj+UN3dThGSaTmRQFfktFcM+g6+BUcHwTbBWy7z9
 U2XSqrvTc+76+Y+/B33ltDG5vQ==
X-Google-Smtp-Source: AKy350b6jo9+jCqflyoPDAC9ZiVvwGzn/MjSoc0PE/0cHY++8FF77SZJ8YjpeVxar0oYcvj0l2nQHw==
X-Received: by 2002:a05:651c:170c:b0:2a7:6d1d:2815 with SMTP id
 be12-20020a05651c170c00b002a76d1d2815mr145554ljb.14.1681252613695; 
 Tue, 11 Apr 2023 15:36:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a2e2401000000b0029e967c1dfesm2961605ljk.8.2023.04.11.15.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 15:36:53 -0700 (PDT)
Message-ID: <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
Date: Wed, 12 Apr 2023 01:36:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 21:28, Rob Clark wrote:
> On Tue, Apr 11, 2023 at 10:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Tue, Apr 11, 2023 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>
>>>> On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
>>>>> On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>
>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>
>>>>>> Similar motivation to other similar recent attempt[1].  But with an
>>>>>> attempt to have some shared code for this.  As well as documentation.
>>>>>>
>>>>>> It is probably a bit UMA-centric, I guess devices with VRAM might want
>>>>>> some placement stats as well.  But this seems like a reasonable start.
>>>>>>
>>>>>> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
>>>>>> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
>>>>>
>>>>> On a related topic, I'm wondering if it would make sense to report
>>>>> some more global things (temp, freq, etc) via fdinfo?  Some of this,
>>>>> tools like nvtop could get by trawling sysfs or other driver specific
>>>>> ways.  But maybe it makes sense to have these sort of things reported
>>>>> in a standardized way (even though they aren't really per-drm_file)
>>>>
>>>> I think that's a bit much layering violation, we'd essentially have to
>>>> reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
>>>> be in :-)
>>>
>>> I guess this is true for temp (where there are thermal zones with
>>> potentially multiple temp sensors.. but I'm still digging my way thru
>>> the thermal_cooling_device stuff)
>>
>> It is slightly ugly. All thermal zones and cooling devices are virtual
>> devices (so, even no connection to the particular tsens device). One
>> can either enumerate them by checking
>> /sys/class/thermal/thermal_zoneN/type or enumerate them through
>> /sys/class/hwmon. For cooling devices again the only enumeration is
>> through /sys/class/thermal/cooling_deviceN/type.
>>
>> Probably it should be possible to push cooling devices and thermal
>> zones under corresponding providers. However I do not know if there is
>> a good way to correlate cooling device (ideally a part of GPU) to the
>> thermal_zone (which in our case is provided by tsens / temp_alarm
>> rather than GPU itself).
>>
>>>
>>> But what about freq?  I think, esp for cases where some "fw thing" is
>>> controlling the freq we end up needing to use gpu counters to measure
>>> the freq.
>>
>> For the freq it is slightly easier: /sys/class/devfreq/*, devices are
>> registered under proper parent (IOW, GPU). So one can read
>> /sys/class/devfreq/3d00000.gpu/cur_freq or
>> /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.
>>
>> However because of the components usage, there is no link from
>> /sys/class/drm/card0
>> (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0)
>> to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
>>
>> Getting all these items together in a platform-independent way would
>> be definitely an important but complex topic.
> 
> But I don't believe any of the pci gpu's use devfreq ;-)
> 
> And also, you can't expect the CPU to actually know the freq when fw
> is the one controlling freq.  We can, currently, have a reasonable
> approximation from devfreq but that stops if IFPC is implemented.  And
> other GPUs have even less direct control.  So freq is a thing that I
> don't think we should try to get from "common frameworks"

I think it might be useful to add another passive devfreq governor type 
for external frequencies. This way we can use the same interface to 
export non-CPU-controlled frequencies.

> 
> BR,
> -R
> 
>>>
>>>> What might be needed is better glue to go from the fd or fdinfo to the
>>>> right hw device and then crawl around the hwmon in sysfs automatically. I
>>>> would not be surprised at all if we really suck on this, probably more
>>>> likely on SoC than pci gpus where at least everything should be under the
>>>> main pci sysfs device.
>>>
>>> yeah, I *think* userspace would have to look at /proc/device-tree to
>>> find the cooling device(s) associated with the gpu.. at least I don't
>>> see a straightforward way to figure it out just for sysfs
>>>
>>> BR,
>>> -R
>>>
>>>> -Daniel
>>>>
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>
>>>>>> [1] https://patchwork.freedesktop.org/series/112397/
>>>>>>
>>>>>> Rob Clark (2):
>>>>>>    drm: Add fdinfo memory stats
>>>>>>    drm/msm: Add memory stats to fdinfo
>>>>>>
>>>>>>   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
>>>>>>   drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
>>>>>>   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
>>>>>>   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
>>>>>>   include/drm/drm_file.h                | 10 ++++
>>>>>>   5 files changed, 134 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.39.2
>>>>>>
>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch
>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

