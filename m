Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3A6E0336
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 02:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7DE10E106;
	Thu, 13 Apr 2023 00:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2794010E106
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:27:41 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d7so28031489lfj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 17:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681345659; x=1683937659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDJelgOzNKd6ITIGgjXIICj67KNdoTBJg181sVqgBU0=;
 b=m/7bHy5WjQe/exegf+eGD85VJoeZnRiHbQ1efrRTMD+0NR8lirTZ5VIQ6MtWj3WKc+
 YSP3hlFLxcpuZmHzIyagDc+HDjadKZlng7bCEpdKDCIXA6lzz42HE/Fj1BSEzoO1P5SX
 4xb4ir5ROZye1XoSorEzbvTSTu+6SlE5pd+NLZRIjE1sP/hyKg+ynAm3zqF45BcWXj1J
 KDeona6hyU5dK+VDAG51Fn+Er0L3RbYeEbnBQGCMaMy7lwp59nuy7VW+M3s9zBjCHFQQ
 2BTY4vIkUr+NyGVJowBLCXuzix3EM6F2EZq26HiHQ5ZCAErOdt2LPVywJwN5CddeILn3
 AcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681345659; x=1683937659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDJelgOzNKd6ITIGgjXIICj67KNdoTBJg181sVqgBU0=;
 b=g699iWNJpMGp2e10tdh/JmFneVUZlUDq94TNcA1nDHkMALJusAlHW+CKGFHP+HMRI7
 PQHohJ3fa/KqOwm9GaVJ3Rh32IYwEzpMj6kXM+g3dyEZ1DLIlDg0g/Piu9PBWW5IFkCX
 aEdyoL6CXmhObY41VPTY13zmwE7yYs3ASLIqHjwEoQXXaqyLnClUotXX+MbrEvZ6ztu8
 1l8VX/VC2KFN+NpGvF5xRgbXBGqSBpk6Qyy318+8z9OcDdBxBjTBo5eVMFehetloHbi5
 ZIzchTZHijbGuT+T0oYUiVvG4ggS4v7E+vpQZgpwc7Ms/ItIdWfbKR7gH5PVlgpV5Un/
 8I1w==
X-Gm-Message-State: AAQBX9eoFdj8Kx3L+GRsvJDuxidwP0tR9Z0PkjieotQTrvVc9X2OgzT0
 yzEMExN31z+qjDx+nK0VuVcoSA==
X-Google-Smtp-Source: AKy350Ysb9u40mPkatwspVxrDb/u2LiGsFXwwbrVYnqsfrzuJxMcG5YfMRc64Pkg6YBUWwT7xA1tvQ==
X-Received: by 2002:ac2:562b:0:b0:4e8:3cf8:5d64 with SMTP id
 b11-20020ac2562b000000b004e83cf85d64mr210849lff.37.1681345658878; 
 Wed, 12 Apr 2023 17:27:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q13-20020ac25a0d000000b004eafa060a6fsm45358lfn.145.2023.04.12.17.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 17:27:38 -0700 (PDT)
Message-ID: <c6bad6df-c11e-edab-44d9-4ae4e17199f5@linaro.org>
Date: Thu, 13 Apr 2023 03:27:37 +0300
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
 <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
 <ZDZntP+0wG6+QyHh@phenom.ffwll.local> <ZDaoT44hqnIH4ZX3@intel.com>
 <CAF6AEGtOEwG+Wdh_7Nox8pqmWJ=nMs-GFEqTU42Mf=wOFGKfRQ@mail.gmail.com>
 <CAA8EJpoNc+cD9gSZx09JBiV2PFHO3teryaRqx2Ah+1R6dJbybw@mail.gmail.com>
 <CAF6AEGtK2o6hPwTOhmFM5mncvgrCXL-fx4ukz1TQpRUZMjCV=w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtK2o6hPwTOhmFM5mncvgrCXL-fx4ukz1TQpRUZMjCV=w@mail.gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 23:34, Rob Clark wrote:
> On Wed, Apr 12, 2023 at 1:19 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Wed, 12 Apr 2023 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Wed, Apr 12, 2023 at 5:47 AM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>>>
>>>> On Wed, Apr 12, 2023 at 10:11:32AM +0200, Daniel Vetter wrote:
>>>>> On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
>>>>>> On 11/04/2023 21:28, Rob Clark wrote:
>>>>>>> On Tue, Apr 11, 2023 at 10:36 AM Dmitry Baryshkov
>>>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Tue, Apr 11, 2023 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>>>
>>>>>>>>>> On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
>>>>>>>>>>> On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>>>
>>>>>>>>>>>> Similar motivation to other similar recent attempt[1].  But with an
>>>>>>>>>>>> attempt to have some shared code for this.  As well as documentation.
>>>>>>>>>>>>
>>>>>>>>>>>> It is probably a bit UMA-centric, I guess devices with VRAM might want
>>>>>>>>>>>> some placement stats as well.  But this seems like a reasonable start.
>>>>>>>>>>>>
>>>>>>>>>>>> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
>>>>>>>>>>>> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
>>>>>>>>>>>
>>>>>>>>>>> On a related topic, I'm wondering if it would make sense to report
>>>>>>>>>>> some more global things (temp, freq, etc) via fdinfo?  Some of this,
>>>>>>>>>>> tools like nvtop could get by trawling sysfs or other driver specific
>>>>>>>>>>> ways.  But maybe it makes sense to have these sort of things reported
>>>>>>>>>>> in a standardized way (even though they aren't really per-drm_file)
>>>>>>>>>>
>>>>>>>>>> I think that's a bit much layering violation, we'd essentially have to
>>>>>>>>>> reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
>>>>>>>>>> be in :-)
>>>>>>>>>
>>>>>>>>> I guess this is true for temp (where there are thermal zones with
>>>>>>>>> potentially multiple temp sensors.. but I'm still digging my way thru
>>>>>>>>> the thermal_cooling_device stuff)
>>>>>>>>
>>>>>>>> It is slightly ugly. All thermal zones and cooling devices are virtual
>>>>>>>> devices (so, even no connection to the particular tsens device). One
>>>>>>>> can either enumerate them by checking
>>>>>>>> /sys/class/thermal/thermal_zoneN/type or enumerate them through
>>>>>>>> /sys/class/hwmon. For cooling devices again the only enumeration is
>>>>>>>> through /sys/class/thermal/cooling_deviceN/type.
>>>>>>>>
>>>>>>>> Probably it should be possible to push cooling devices and thermal
>>>>>>>> zones under corresponding providers. However I do not know if there is
>>>>>>>> a good way to correlate cooling device (ideally a part of GPU) to the
>>>>>>>> thermal_zone (which in our case is provided by tsens / temp_alarm
>>>>>>>> rather than GPU itself).
>>>>>>>>
>>>>>>>>>
>>>>>>>>> But what about freq?  I think, esp for cases where some "fw thing" is
>>>>>>>>> controlling the freq we end up needing to use gpu counters to measure
>>>>>>>>> the freq.
>>>>>>>>
>>>>>>>> For the freq it is slightly easier: /sys/class/devfreq/*, devices are
>>>>>>>> registered under proper parent (IOW, GPU). So one can read
>>>>>>>> /sys/class/devfreq/3d00000.gpu/cur_freq or
>>>>>>>> /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.
>>>>>>>>
>>>>>>>> However because of the components usage, there is no link from
>>>>>>>> /sys/class/drm/card0
>>>>>>>> (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0)
>>>>>>>> to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
>>>>>>>>
>>>>>>>> Getting all these items together in a platform-independent way would
>>>>>>>> be definitely an important but complex topic.
>>>>>>>
>>>>>>> But I don't believe any of the pci gpu's use devfreq ;-)
>>>>>>>
>>>>>>> And also, you can't expect the CPU to actually know the freq when fw
>>>>>>> is the one controlling freq.  We can, currently, have a reasonable
>>>>>>> approximation from devfreq but that stops if IFPC is implemented.  And
>>>>>>> other GPUs have even less direct control.  So freq is a thing that I
>>>>>>> don't think we should try to get from "common frameworks"
>>>>>>
>>>>>> I think it might be useful to add another passive devfreq governor type for
>>>>>> external frequencies. This way we can use the same interface to export
>>>>>> non-CPU-controlled frequencies.
>>>>>
>>>>> Yeah this sounds like a decent idea to me too. It might also solve the fun
>>>>> of various pci devices having very non-standard freq controls in sysfs
>>>>> (looking at least at i915 here ...)
>>>>
>>>> I also like the idea of having some common infrastructure for the GPU freq.
>>>>
>>>> hwmon have a good infrastructure, but they are more focused on individual
>>>> monitoring devices and not very welcomed to embedded monitoring and control.
>>>> I still want to check the opportunity to see if at least some freq control
>>>> could be aligned there.
>>>>
>>>> Another thing that complicates that is that there are multiple frequency
>>>> domains and controls with multipliers in Intel GPU that are not very
>>>> standard or easy to integrate.
>>>>
>>>> On a quick glace this devfreq seems neat because it aligns with the cpufreq
>>>> and governors. But again it would be hard to align with the multiple domains
>>>> and controls. But it deserves a look.
>>>>
>>>> I will take a look to both fronts for Xe: hwmon and devfreq. Right now on
>>>> Xe we have a lot less controls than i915, but I can imagine soon there
>>>> will be requirements to make that to grow and I fear that we end up just
>>>> like i915. So I will take a look before that happens.
>>>
>>> So it looks like i915 (dgpu only) and nouveau already use hwmon.. so
>>> maybe this is a good way to expose temp.  Maybe we can wire up some
>>> sort of helper for drivers which use thermal_cooling_device (which can
>>> be composed of multiple sensors) to give back an aggregate temp for
>>> hwmon to report?
>>
>> The thermal_device already registers the hwmon, see below. The
>> question is about linking that hwmon to the drm. Strictly speaking, I
>> don't think that we can reexport it in a clean way.
>>
>> # grep gpu /sys/class/hwmon/hwmon*/name
>> /sys/class/hwmon/hwmon15/name:gpu_top_thermal
>> /sys/class/hwmon/hwmon24/name:gpu_bottom_thermal
> 
> I can't get excited about userspace relying on naming conventions or
> other heuristics like this.  

As you can guess, me neither. We are not in 2.4 world anymore.

> Also, userspace's view of the world is
> very much that there is a "gpu card", not a collection of parts.
> (Windows seems to have the same view of the world.)  So we have the
> component framework to assemble the various parts together into the
> "device" that userspace expects to deal with.  We need to do something
> similar for exposing temp and freq.

I think we are lookin for something close to device links. We need to 
create a userspace-visible link from one device to another across device 
hierarchy. Current device_link API is tied to suspend/resume, but the 
overall idea seems to be close enough (in my opinion).

> 
>> # ls /sys/class/hwmon/hwmon15/ -l
>> lrwxrwxrwx    1 root     root             0 Jan 26 08:14 device ->
>> ../../thermal_zone15
>> -r--r--r--    1 root     root          4096 Jan 26 08:14 name
>> drwxr-xr-x    2 root     root             0 Jan 26 08:15 power
>> lrwxrwxrwx    1 root     root             0 Jan 26 08:12 subsystem ->
>> ../../../../../class/hwmon
>> -r--r--r--    1 root     root          4096 Jan 26 08:14 temp1_input
>> -rw-r--r--    1 root     root          4096 Jan 26 08:12 uevent
>>
>>> Freq could possibly be added to hwmon (ie. seems like a reasonable
>>> attribute to add).  Devfreq might also be an option but on arm it
>>> isn't necessarily associated with the drm device, whereas we could
>>> associate the hwmon with the drm device to make it easier for
>>> userspace to find.
>>
>> Possibly we can register a virtual 'passive' devfreq being driven by
>> another active devfreq device.
> 
> That's all fine and good, but it has the same problem that existing
> hwmon's associated with the cooling-device have..
> 
> BR,
> -R
> 
>>>
>>> BR,
>>> -R
>>>
>>>>>
>>>>> I guess it would minimally be a good idea if we could document this, or
>>>>> maybe have a reference implementation in nvtop or whatever the cool thing
>>>>> is rn.
>>>>> -Daniel
>>>>>
>>>>>>
>>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>>>
>>>>>>>>>
>>>>>>>>>> What might be needed is better glue to go from the fd or fdinfo to the
>>>>>>>>>> right hw device and then crawl around the hwmon in sysfs automatically. I
>>>>>>>>>> would not be surprised at all if we really suck on this, probably more
>>>>>>>>>> likely on SoC than pci gpus where at least everything should be under the
>>>>>>>>>> main pci sysfs device.
>>>>>>>>>
>>>>>>>>> yeah, I *think* userspace would have to look at /proc/device-tree to
>>>>>>>>> find the cooling device(s) associated with the gpu.. at least I don't
>>>>>>>>> see a straightforward way to figure it out just for sysfs
>>>>>>>>>
>>>>>>>>> BR,
>>>>>>>>> -R
>>>>>>>>>
>>>>>>>>>> -Daniel
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> BR,
>>>>>>>>>>> -R
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> [1] https://patchwork.freedesktop.org/series/112397/
>>>>>>>>>>>>
>>>>>>>>>>>> Rob Clark (2):
>>>>>>>>>>>>     drm: Add fdinfo memory stats
>>>>>>>>>>>>     drm/msm: Add memory stats to fdinfo
>>>>>>>>>>>>
>>>>>>>>>>>>    Documentation/gpu/drm-usage-stats.rst | 21 +++++++
>>>>>>>>>>>>    drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
>>>>>>>>>>>>    drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
>>>>>>>>>>>>    drivers/gpu/drm/msm/msm_gpu.c         |  2 -
>>>>>>>>>>>>    include/drm/drm_file.h                | 10 ++++
>>>>>>>>>>>>    5 files changed, 134 insertions(+), 3 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> --
>>>>>>>>>>>> 2.39.2
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> Daniel Vetter
>>>>>>>>>> Software Engineer, Intel Corporation
>>>>>>>>>> http://blog.ffwll.ch
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> With best wishes
>>>>>>>> Dmitry
>>>>>>
>>>>>> --
>>>>>> With best wishes
>>>>>> Dmitry
>>>>>>
>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

