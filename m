Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5486DE738
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E910E1B6;
	Tue, 11 Apr 2023 22:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9E10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 22:27:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q15so6444681ljp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681252028; x=1683844028;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TpRKqnZMXK6Tv7TCCUc4EiuEiZjiXzT+ajSdnY8AiZU=;
 b=LJT3VzK+eahxSGBqvFDgOxL6xaX/5f0CLONIFUCt9rrOwtxz2yEbAllAs5Tm00Fpyh
 T57duFZCM9B0MKngBZpNTJtrkcnMyFq/HFpJRGJWIAvlbxAgOIyxKcbISZrAFYojBvAL
 bwpRb5wdNhV1aIW8NUgGzRJ0QXBXBJ/xy2JUekeWErvkFJmjI4PgRetfhSH+rdYVLpc4
 P6wLA7VWKGus/1fqMLUN8cPch525olVw9zz22V+Fvc4Kv8fzLMP5J2Vv4hUtiGyeXpPu
 PY1BMqoSYwVOmrdjBRVF5daX9Wj3zv1iGMBqkoi0FXbHYOMXtbMGB46HIjFfIbkCStAo
 vJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681252028; x=1683844028;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TpRKqnZMXK6Tv7TCCUc4EiuEiZjiXzT+ajSdnY8AiZU=;
 b=iZSWReZRFdeIVVS9POynnhdZ8x95X23QZZnlE/POO5Do3tkVfel7pjCGVuPZE3s80q
 UJxzjA6fAPUkytluDmzxCKdrSO1WjUPdwZX4R5E4Xk6OvYNd5C2Ihfi+a4ruyQmF6WsO
 XDyo8xh65wdEJG6gLFMnPICwz/rPTy1j/xHRnw79Kluu4l3OQfafRRWMGX/VDrdB11of
 +GGRQQH2WyPEl34r/opxREZqv80ojT+gQcr9zkBBy7fJE/Hqfdliw/EjVE3iWuFMSVb5
 Xqp3hI91vZCQWPjnbVJcK0FKQnK0ifR1v1klab6z6s0s3IshqMvuqQoPsdM0GWRkLNWQ
 rSlQ==
X-Gm-Message-State: AAQBX9cK9RGMP1H5Rgy/HEo63dk7fjFro7/GzWlYxfiktHEqEC0mE6RL
 u1JnPrCQ/UtF1vvZDc9jPO8/5Q==
X-Google-Smtp-Source: AKy350YLdDzoSbR6E3NXOAVlExyGlg6oaIx4pghrB6Td6eT4E+Zdox2qBV4ZNcPPAxKJdYsG3BRidw==
X-Received: by 2002:a2e:9e55:0:b0:299:c03a:1cf9 with SMTP id
 g21-20020a2e9e55000000b00299c03a1cf9mr3430659ljk.10.1681252028498; 
 Tue, 11 Apr 2023 15:27:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a2e9847000000b002934b5d6a61sm2972876ljj.121.2023.04.11.15.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 15:27:08 -0700 (PDT)
Message-ID: <38ec5a59-bd7f-3c76-ae74-9a5c0560f325@linaro.org>
Date: Wed, 12 Apr 2023 01:27:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <ZDWmOsFL38ox+F5g@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZDWmOsFL38ox+F5g@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 21:26, Daniel Vetter wrote:
> On Tue, Apr 11, 2023 at 08:35:48PM +0300, Dmitry Baryshkov wrote:
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
> 
> There's not even sysfs links to connect the pieces in both ways?

I missed them in the most obvious place:

/sys/class/thermal/thermal_zone1/cdev0 -> ../cooling_device0

So, there is a link from thermal zone to cooling device.

> 
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
> 
> Hm ... do we need to make component more visible in sysfs, with _looooots_
> of links? Atm it's just not even there.

Maybe. Or maybe we should use DPU (the component master and a parent of 
drm/card0) as devfreq parent too.

> 
>> Getting all these items together in a platform-independent way would
>> be definitely an important but complex topic.
> 
> Yeah this sounds like some work. But also sounds like it's all generic
> issues (thermal zones above and component here) that really should be
> fixed at that level?
> 
> Cheers, Daniel
> 
> 
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
> 

-- 
With best wishes
Dmitry

