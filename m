Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190906E7AFE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A148710E9B0;
	Wed, 19 Apr 2023 13:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958DA10E9AD;
 Wed, 19 Apr 2023 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681911367; x=1713447367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zeZTjDQibw6I3gijz6OO3UBRE/HKS8+rB5MTUroK5TA=;
 b=C0le6EkvzkYqTOnn/KkP6mvRbk5EC5GFbdykESugbAYrY8LPjWMLkLlG
 T+GVkcz5CXhVaNOjGrJN90XoubW0idA4/ZeHaddmp1yFAWZjxWXLhPXAF
 1waLO9yRVOP2DzVMH4OkfvfB8Lc+s0PlEeXZNYRREfZoUpFFEYPkmIPGm
 nyCjm03pQeUZhbpdLBSdnIhrfMJ4BoukNb3DJnOoCKMoi7dOlXUmH+VSx
 1NXeiReLA4lN+sB+ZhufwJagPg2nCVQxzYv8PMVC3VSMbPZtI2EUoqdZF
 Okwwj7wcBtNPLvb0rQYGfao6/mLNrAQ0MWs+9GwIxdPiHNol0ziWLYLyu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410677772"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="410677772"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760741137"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760741137"
Received: from halahusx-mobl.ger.corp.intel.com (HELO [10.213.223.36])
 ([10.213.223.36])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:36:02 -0700
Message-ID: <dfabcc1b-52d3-c5ef-3cd3-aad0aa51f960@linux.intel.com>
Date: Wed, 19 Apr 2023 14:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/3] drm/msm: Add comm/cmdline fields
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-4-robdclark@gmail.com>
 <20655be0-65e3-0000-4acd-310ec9cc1d3a@linux.intel.com>
 <CAF6AEGsiNeHc7PuBnBkmwZ22S9dkmGqx70AEPmK8Fdp5J0YVaw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsiNeHc7PuBnBkmwZ22S9dkmGqx70AEPmK8Fdp5J0YVaw@mail.gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/04/2023 15:56, Rob Clark wrote:
> On Tue, Apr 18, 2023 at 1:53 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 17/04/2023 21:12, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Normally this would be the same information that can be obtained in
>>> other ways.  But in some cases the process opening the drm fd is merely
>>> a sort of proxy for the actual process using the GPU.  This is the case
>>> for guest VM processes using the GPU via virglrenderer, in which case
>>> the msm native-context renderer in virglrenderer overrides the comm/
>>> cmdline to be the guest process's values.
>>>
>>> Exposing this via fdinfo allows tools like gputop to show something more
>>> meaningful than just a bunch of "pcivirtio-gpu" users.
>>
>> You also later expanded with:
>>
>> """
>> I should have also mentioned, in the VM/proxy scenario we have a
>> single process with separate drm_file's for each guest VM process.  So
>> it isn't an option to just change the proxy process's name to match
>> the client.
>> """
>>
>> So how does that work - this single process temporarily changes it's
>> name for each drm fd it opens and creates a context or it is actually in
>> the native context protocol?
> 
> It is part of the protocol, the mesa driver in the VM sends[1] this
> info to the native-context "shim" in host userspace which uses the
> SET_PARAM ioctl to pass this to the kernel.  In the host userspace
> there is just a single process (you see the host PID below) but it
> does a separate open() of the drm dev for each guest process (so that
> they each have their own GPU address space for isolation):
> 
> DRM minor 128
>      PID    MEM ACTIV              NAME                    gpu
>      5297  200M   82M com.mojang.minecr |██████████████▏                        |
>      1859  199M    0B            chrome |█▉                                     |
>      5297   64M    9M    surfaceflinger |                                       |
>      5297   12M    0B org.chromium.arc. |                                       |
>      5297   12M    0B com.android.syste |                                       |
>      5297   12M    0B org.chromium.arc. |                                       |
>      5297   26M    0B com.google.androi |                                       |
>      5297   65M    0B     system_server |                                       |
> 
> 
> [1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/drm/msm/msm_proto.h#L326
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/drm/msm/msm_renderer.c#L1050
> 
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    Documentation/gpu/drm-usage-stats.rst |  8 ++++++++
>>>    drivers/gpu/drm/msm/msm_gpu.c         | 14 ++++++++++++++
>>>    2 files changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>> index 8e00d53231e0..bc90bed455e3 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -148,6 +148,14 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
>>>    time active without considering what frequency the engine is operating as a
>>>    percentage of it's maximum frequency.
>>>
>>> +- drm-comm: <valstr>
>>> +
>>> +Returns the clients executable path.
>>
>> Full path and not just current->comm? In this case probably give it a
>> more descriptive name here.
>>
>> drm-client-executable
>> drm-client-command-line
>>
>> So we stay in the drm-client- namespace?
>>
>> Or if the former is absolute path could one key be enough for both?
>>
>> drm-client-command-line: /path/to/executable --arguments
> 
> comm and cmdline can be different. Android seems to change the comm to
> the apk name, for example (and w/ the zygote stuff cmdline isn't
> really a thing)
> 
> I guess it could be drm-client-comm and drm-client-cmdline?  Although
> comm/cmdline aren't the best names, they are just following what the
> kernel calls them elsewhere.

I wasn't sure what do you plan to do given mention of a path under the 
drm-comm description. If it is a path then comm would be misleading, 
since comm as defined in procfs is not a path, I don't think so at 
least. Which is why I was suggesting executable. But if you remove the 
mention of a path from rst and rather refer to processes' comm value I 
think that is then okay.

>>> +
>>> +- drm-cmdline: <valstr>
>>> +
>>> +Returns the clients cmdline.
>>
>> I think drm-usage-stats.rst text should provide some more text with
>> these two. To precisely define their content and outline the use case
>> under which driver authors may want to add them, and fdinfo consumer
>> therefore expect to see them. Just so everything is completely clear and
>> people do not start adding them for drivers which do not support native
>> context (or like).
> 
> I really was just piggy-backing on existing comm/cmdline.. but I'll
> try to write up something better.
> 
> I think it maybe should not be limited just to native context.. for
> ex. if the browser did somehow manage to create different displays
> associated with different drm_file instances (I guess it would have to
> use gbm to do this?) it would be nice to see browser tab names.

Would be cool yes.

My thinking behind why we maybe do not want to blanket add them is 
because for common case is it the same information which can be obtained 
from procfs. Like in igt_drm_clients.c I get the pid and comm from 
/proc/$pid/stat. So I was thinking it is only interesting to add to 
fdinfo for drivers where it could differ by the explicit override like 
you have with native context.

It can be added once there is a GL/whatever extension which would allow 
it? (I am not familiar with how browsers manage rendering contexts so 
maybe I am missing something.)

>> But on the overall it sounds reasonable to me - it would be really cool
>> to not just see pcivirtio-gpu as you say. Even if the standard virtiogpu
>> use case (not native context) could show real users.
> 
> For vrend/virgl, we'd first need to solve the issue that there is just
> a single drm_file for all guest processes.  But really, just don't use
> virgl.  (I mean, like seriously, would you put a gl driver in the
> kernel?  Vrend has access to all guest memory, so this is essentially
> what you have with virgl.  This is just not a sane thing to do.) The
> only "valid" reason for not doing native-context is if you don't have
> the src code for your UMD to be able to modify it to talk
> native-context to virtgpu in the guest. ;-)

I am just observing the current state of things on an Intel based 
Chromebook. :) Presumably the custom name for a context would be 
passable via the virtio-gpu protocol or something?

Regards,

Tvrtko

> 
> BR,
> -R
> 
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>    Implementation Details
>>>    ======================
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index f0f4f845c32d..1150dcbf28aa 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -148,12 +148,26 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>>>        return 0;
>>>    }
>>>
>>> +static void get_comm_cmdline(struct msm_file_private *ctx, char **comm, char **cmd);
>>> +
>>>    void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
>>>                         struct drm_printer *p)
>>>    {
>>> +     char *comm, *cmdline;
>>> +
>>> +     get_comm_cmdline(ctx, &comm, &cmdline);
>>> +
>>>        drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
>>>        drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
>>>        drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
>>> +
>>> +     if (comm)
>>> +             drm_printf(p, "drm-comm:\t%s\n", comm);
>>> +     if (cmdline)
>>> +             drm_printf(p, "drm-cmdline:\t%s\n", cmdline);
>>> +
>>> +     kfree(comm);
>>> +     kfree(cmdline);
>>>    }
>>>
>>>    int msm_gpu_hw_init(struct msm_gpu *gpu)
