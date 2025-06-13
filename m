Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA6AD8530
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53E10E8F5;
	Fri, 13 Jun 2025 08:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MV4Fv5M3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66A10E8F5;
 Fri, 13 Jun 2025 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QBdWSHHMs+Rc6JHilzBYHadfgLs7ubNXQatg96UB80s=; b=MV4Fv5M38fYoOF10UcITDsEyqe
 NdDcMSl6+VwCCH+RC2u6roSFnqy1hyu30tsKXdBwcwnqnBpSPi6HoGK/HyUJfwY53l73P/cftlen+
 cXUnGzZF0HHboh4sFwkfoVwFjhOZ5aPrFGKhKb7TLKcaeVyat4dcOmsSUoqLsYcXvAg19PUUyMcJA
 8PzSjd84xBmLcaoiaKOwYRlB6/1tLnh6o98rHahS/v2Iv9gi8rA2Jo6prSPUWQRZH+123YELAuEGD
 eept9KzhAxnM1sjX1quYfdbZTU5lJVD4BnCihYjadqMKDSzYskXF8A3DIp25FO6DCgAwz8TIsycM1
 XMJwBORg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPzMq-002vZR-KN; Fri, 13 Jun 2025 10:02:28 +0200
Message-ID: <3663ab48-6ac6-4903-aa08-f93c7b71ebf2@igalia.com>
Date: Fri, 13 Jun 2025 09:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
To: Yiwei Zhang <zzyiwei@google.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Juston Li <justonli@chromium.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
 <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
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


On 12/06/2025 19:53, Yiwei Zhang wrote:
> On Thu, Jun 12, 2025 at 11:02 AM Lucas De Marchi
> <lucas.demarchi@intel.com> wrote:
>>
>> On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 12/06/2025 06:40, Lucas De Marchi wrote:
>>>> On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>>>>> Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
>>>>> memory usage.
>>>>>
>>>>> These are required by VSR on Android 12+ for reporting GPU driver memory
>>>>> allocations.
>>>>>
>>>>> v3:
>>>>> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>>>>>   per-driver Kconfig (Lucas)
>>>>>
>>>>> v2:
>>>>> - Use u64 as preferred by checkpatch (Tvrtko)
>>>>> - Fix errors in comments/Kconfig description (Tvrtko)
>>>>> - drop redundant "CONFIG" in Kconfig
>>>>>
>>>>> Signed-off-by: Juston Li <justonli@chromium.org>
>>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>>>>> drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>>>>> 2 files changed, 63 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 4e39188a021ab..89a3d23e3b800 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -19,6 +19,8 @@
>>>>>
>>>>> #include <kunit/static_stub.h>
>>>>>
>>>>> +#include <trace/events/gpu_mem.h>
>>>>> +
>>>>> #include "xe_device.h"
>>>>> #include "xe_dma_buf.h"
>>>>> #include "xe_drm_client.h"
>>>>> @@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct
>>>>> xe_device *xe, struct ttm_tt *tt)
>>>>>         xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>>>>> }
>>>>>
>>>>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>>>>> +static void update_global_total_pages(struct ttm_device *ttm_dev,
>>>>> long num_pages)
>>>>> +{
>>>>> +    struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>>>>> +    u64 global_total_pages =
>>>>> +        atomic64_add_return(num_pages, &xe->global_total_pages);
>>>>> +
>>>>> +    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>>>>> +}
>>>>> +
>>>>> +static void update_process_mem(struct drm_file *file, ssize_t size)
>>>>> +{
>>>>> +    struct xe_file *xef = to_xe_file(file);
>>>>> +    u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>>>>> +
>>>>> +    rcu_read_lock(); /* Locks file->pid! */
>>>>> +    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
>>>>> process_mem);
>>>>
>>>> Isn't the first arg supposed to be the gpu id? Doesn't this become
>>>> invalid when I have e.g. LNL + BMG and the trace is enabled?
>>>
>>> Good point.
>>>
>>> u32 gpu_id does not seem possible to map to anything useful.
>>
>> maybe minor_id? although I'm not sure if the intention is to share this
>> outside drm as seems the case.
> 
> Yes, that was for render minor in the case of drm.

Or to keep the field as integer we can use dev->primary->index, which 
would then correlate with the /sys/class/drm/card%u, in case it needs to 
be mapped back.

There is prior art in various drivers to use either dev_name or 
dev->primary->index, but for this one it is probably easier to stick 
with the integer so both msm can keep passing the zero and we don't have 
to think about Android userspace forward/backward compatibility.

Regards,

Tvrtko

> 
>>
>>>
>>> Shall we replace it with a string obtained from dev_name(struct device
>>> *) ? As only Android parses them I think we can get still away with
>>> changing the tracepoints ABI.
>>
>> works for me too. Is Android actually parsing it or just ignoring?
>> Because afaics it's always 0 in msm.
> 
> Android has used it as part of the bpf map key:
> https://cs.android.com/android/platform/superproject/main/+/main:frameworks/native/services/gpuservice/bpfprogs/gpuMem.c
> 
>>
>> Lucas De Marchi

