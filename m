Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585055213B1
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840E410F7F6;
	Tue, 10 May 2022 11:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D593310F7EE;
 Tue, 10 May 2022 11:26:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id j6so32254175ejc.13;
 Tue, 10 May 2022 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5Dz6fmslgJZbgo43sIgjOX0ffE9fDNXTWaLgOoiPMgE=;
 b=PU7z6QupbpDAsFZfSmxlr3nIMsfGkwqwt8GDgX+A+/+nhC7GmW8QvzfmnPQc/aUIjm
 HOVA5XG8scVRCt3NMrwnqBLK/sZALMgj9HN0FoytBMdaciZ3zrxJDLlrF1w3OAT4Opsz
 0QMuJxFTCEtixjzsegdNRiXrZ0DaU0DiVeZbPoNxej4yAHtfBij2uY7IEGasbD5nvaW0
 38USp5Qpc6MDMirpW60sFIh/cXhh2nZBFt+YlYE/oyJDTOHYFLlrfrufZ+AWcr9/ObBF
 WF/XQ2xiQjz+OwQ+fLGEOdBzJvvzZOOwmEMEhMudW50tN0M1rDeCYcmMcOU5zCAj7aSE
 f4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Dz6fmslgJZbgo43sIgjOX0ffE9fDNXTWaLgOoiPMgE=;
 b=Qo4auoWlhQ3LExj+/wgQ87y7P5pPvOfjvKM52euhBWFM6FugTZLXjGzfgyBVCr+a5T
 w7oz6DT4LQjaAAtT2zd7JanPGGp1H7vCxbpjgEHQBmftSNPuZoWinJ62bUDDgRFVEu33
 ZZDtqB2dAcxGWTDgl7/x1dHB1iAw3VB8yyudwYAhdZHhIf9SMS3eX75ng9xD6YorXMEo
 mNFN4DSWAOMzWwpM0h1HBYhO2MHWRbFUnkk2UTv2VUYk3xUO/67wyKEkh2EEV1WEoOnE
 sgVZrLuI+VW2r7Jyy0rLegPIB6jQDGQqbRF1DDrua3vLrMlm2/trNVaZUGOvIjXj5N28
 V6/g==
X-Gm-Message-State: AOAM533blGcf0PrUpg9cajWMCRfudyxscjmF/Ifo+xm5ccwINjg8ucyF
 ekhFuDhoFk/LJ6RfHZuEuuo=
X-Google-Smtp-Source: ABdhPJztU5jk+jtFq95VKCUo79AGsGptAlTTjMEmpVOd5NdPpKMg7gU1YLmV67zXJmk+6gMqmyG3aQ==
X-Received: by 2002:a17:906:4fd5:b0:6f8:5aa9:6f13 with SMTP id
 i21-20020a1709064fd500b006f85aa96f13mr14922093ejw.267.1652181992281; 
 Tue, 10 May 2022 04:26:32 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:616c:3555:9eac:59cc?
 ([2a02:908:1256:79a0:616c:3555:9eac:59cc])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a170907270700b006f3ef214e49sm6071234ejk.175.2022.05.10.04.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 04:26:31 -0700 (PDT)
Message-ID: <ab9f12fc-e482-42ab-cfd2-0a5f3e5d5109@gmail.com>
Date: Tue, 10 May 2022 13:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/amdgpu: Convert to common fdinfo format
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 amd-gfx@lists.freedesktop.org
References: <20220510082315.992296-1-tvrtko.ursulin@linux.intel.com>
 <ddcb244d-dfed-d571-1d54-5e1ed24a03b7@gmail.com>
 <8e197b3d-513c-0ee3-fcd4-e397794f0a79@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <8e197b3d-513c-0ee3-fcd4-e397794f0a79@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.22 um 12:50 schrieb Tvrtko Ursulin:
>
> Hi,
>
> On 10/05/2022 09:48, Christian König wrote:
>> Hi Tvrtko,
>>
>> Am 10.05.22 um 10:23 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Convert fdinfo format to one documented in drm-usage-stats.rst.
>>>
>>> Opens/TODO:
>>>   * Does someone from AMD want to take over this patch?
>>>      (I have no access to amdgpu hardware so won't be able to test
>>>       any hypothetical gputop work.)
>>
>> I can give that a try as soon as it is completed.
>
> And how to motivate someone on your side to pick up the amdgpu work? :)

Well if we could get more of my TTM/DRM patches reviewed I could have 
same free time to do this :)

>>>   * What are the semantics of AMD engine utilisation reported in 
>>> percents?
>>
>> To be honest I haven't understood why we are using percents here 
>> either, that is not something the kernel should mess with.
>>
>>>      * Can it align with what i915 does (same what msm will do) or need
>>>        to document the alternative in the specification document? Both
>>>        option are workable with instantaneous percent only needing 
>>> support
>>>        to be added to vendor agnostic gputop.
>>
>> I would prefer to just change to the ns format i915 and msm will be 
>> using, that makes much more sense from my experience.
>>
>> As far as I know we haven't released any publicly available userspace 
>> using the existing AMD specific format. So that should still be 
>> possible.
>
> If amdgpu could export accumulated time context spent on engines that 
> would indeed be perfect. It would make the gputop I sketched out most 
> probably just work, as it did for Rob on msm.
>
> In which case, apart from the admgpu work, it would just be a matter 
> of me tidying that tool a bit and re-sending out for review.

Could you push this to some repository on fdo and send me a link? Going 
to pick up this patch here and give it a try, shouldn't be more than a 
day of work.

>
>>>   * Can amdgpu expose drm-client-id? Without it gputop will not work.
>>
>> How is that determined on i915 ? Does struct drm_file has that 
>> somewhere?
>
> It should correspond 1:1 with drm_file, since the purpose is to enable 
> gputop distinguish between unique open file descriptors (aka clients).

Ah! We do have a 64bit counter for that already because of technical needs.

>
> In theory it could be just a hash value of a struct drm_file pointer 
> but that could confuse userspace if the struct gets reused within a 
> single userspace sampling period.
>
> Because of that I track it in i915 separately since I wanted to have 
> an incrementing cyclic property to it - so that when a fd is closed 
> and new opened there is no practical chance they would have the same 
> drm-client-id.
>
>>> * drm-engine-capacity - does the concept translate etc.
>>
>> I don't think we are going to need that.
>
> Okay, that one is optional for cases when there is more than one 
> engine of a type/class shown under a single entry in fdinfo. So when 
> gputop translates accumulated time into percentages it can do the 
> right thing. Code can already handle it not being present and assume one.

Yeah, we have that case for a couple of things. The GFX, SDMA and 
multimedia engines all have different queues which needs to be accounted 
together as far as I can see.

E.g. we have video decode and video encode as two separate rings, but 
essentially they use the same engine.

Need to think about how to represent that.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: David M Nieto <David.Nieto@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   Documentation/gpu/amdgpu/usage-stats.rst   | 28 
>>> ++++++++++++++++++++++
>>>   Documentation/gpu/drm-usage-stats.rst      |  7 +++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 18 ++++++++++----
>>>   3 files changed, 47 insertions(+), 6 deletions(-)
>>>   create mode 100644 Documentation/gpu/amdgpu/usage-stats.rst
>>>
>>> diff --git a/Documentation/gpu/amdgpu/usage-stats.rst 
>>> b/Documentation/gpu/amdgpu/usage-stats.rst
>>> new file mode 100644
>>> index 000000000000..8be5009bd1a9
>>> --- /dev/null
>>> +++ b/Documentation/gpu/amdgpu/usage-stats.rst
>>> @@ -0,0 +1,28 @@
>>> +.. _amdgpu-usage-stats:
>>> +
>>> +============================================
>>> +AMDGPU DRM client usage stats implementation
>>> +============================================
>>> +
>>> +The amdgpu driver implements the DRM client usage stats 
>>> specification as
>>> +documented in :ref:`drm-client-usage-stats`.
>>> +
>>> +Example of the output showing the implemented key value pairs and 
>>> entirety of
>>> +the currenly possible format options:
>>> +
>>> +::
>>> +
>>> +      pos:    0
>>> +      flags:  0100002
>>> +      mnt_id: 21
>>> +      drm-driver: amdgpu
>>> +      drm-pdev:   0000:03:00.0
>>> +      drm-memory-vram: 0 KiB
>>> +      drm-memory-gtt: 0 KiB
>>> +      drm-memory-cpu: 0 KiB
>>> +      drm-engine-...: 0 %
>>> +                 ...
>>> +
>>> +Possible `drm-memory-` key names are: `vram`, `gtt`, `cpu`.
>>> +
>>> +Possible `drm-engine-` key names are: ``.
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>> b/Documentation/gpu/drm-usage-stats.rst
>>> index 6c9f166a8d6f..2d0ff6f2cc74 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -69,7 +69,7 @@ scope of each device, in which case `drm-pdev` 
>>> shall be present as well.
>>>   Userspace should make sure to not double account any usage 
>>> statistics by using
>>>   the above described criteria in order to associate data to 
>>> individual clients.
>>> -- drm-engine-<str>: <uint> ns
>>> +- drm-engine-<str>: <uint> [ns|%]
>>>   GPUs usually contain multiple execution engines. Each shall be 
>>> given a stable
>>>   and unique name (str), with possible values documented in the 
>>> driver specific
>>> @@ -84,6 +84,9 @@ larger value within a reasonable period. Upon 
>>> observing a value lower than what
>>>   was previously read, userspace is expected to stay with that 
>>> larger previous
>>>   value until a monotonic update is seen.
>>> +Where time unit is given as a percentage...[AMD folks to fill the 
>>> semantics
>>> +and interpretation of that]...
>>> +
>>>   - drm-engine-capacity-<str>: <uint>
>>>   Engine identifier string must be the same as the one specified in the
>>> @@ -110,3 +113,5 @@ Driver specific implementations
>>>   ===============================
>>>   :ref:`i915-usage-stats`
>>> +
>>> +:ref:`amdgpu-usage-stats`
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> index 5a6857c44bb6..8cbae61f1b3b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> @@ -32,6 +32,7 @@
>>>   #include <drm/amdgpu_drm.h>
>>>   #include <drm/drm_debugfs.h>
>>> +#include <drm/drm_drv.h>
>>>   #include "amdgpu.h"
>>>   #include "amdgpu_vm.h"
>>> @@ -83,11 +84,18 @@ void amdgpu_show_fdinfo(struct seq_file *m, 
>>> struct file *f)
>>>       amdgpu_bo_unreserve(root);
>>>       amdgpu_bo_unref(&root);
>>> -    seq_printf(m, "pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, 
>>> bus,
>>> +    /*
>>> +     * 
>>> ******************************************************************
>>> +     * For text output format description please see 
>>> drm-usage-stats.rst!
>>> +     * 
>>> ******************************************************************
>>> +     */
>>> +
>>> +    seq_printf(m, "drm-driver:\t%s\n", 
>>> file->minor->dev->driver->name);
>>> +    seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", 
>>> domain, bus,
>>>               dev, fn, fpriv->vm.pasid);
>>> -    seq_printf(m, "vram mem:\t%llu kB\n", vram_mem/1024UL);
>>> -    seq_printf(m, "gtt mem:\t%llu kB\n", gtt_mem/1024UL);
>>> -    seq_printf(m, "cpu mem:\t%llu kB\n", cpu_mem/1024UL);
>>> +    seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
>>> +    seq_printf(m, "drm-memory-gtt:\t%llu KiB\n", gtt_mem/1024UL);
>>> +    seq_printf(m, "drm-memory-cpu:\t%llu KiB\n", cpu_mem/1024UL);
>>>       for (i = 0; i < AMDGPU_HW_IP_NUM; i++) {
>>>           uint32_t count = amdgpu_ctx_num_entities[i];
>>>           int idx = 0;
>>> @@ -103,7 +111,7 @@ void amdgpu_show_fdinfo(struct seq_file *m, 
>>> struct file *f)
>>>               perc = div64_u64(10000 * total, min);
>>>               frac = perc % 100;
>>> -            seq_printf(m, "%s%d:\t%d.%d%%\n",
>>> +            seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
>>>                       amdgpu_ip_name[i],
>>>                       idx, perc/100, frac);
>>>           }
>>

