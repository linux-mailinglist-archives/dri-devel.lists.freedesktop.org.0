Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5BE80512F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FF410E170;
	Tue,  5 Dec 2023 10:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26710E170;
 Tue,  5 Dec 2023 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701773559; x=1733309559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vl6vHsI/Mxl+rIJoAMryCj5elixsRfihp50NyC9JjX8=;
 b=SFeG9aIa2DQCB0ODOpkwwWNlX2zgAjQhiP4eMrapwgu6Yp49P5QudW7K
 YbetA4KB/SeoT/F5pMFWXKz+NCNFhH1hQPTxS2bUBjozAmtfAB8fvvVH9
 8xHoKpZXhPF0tVEN3RQUZRceMv0sD/3QDD1K6jJpGfM0CCsieNVvmkYfD
 5be1mox8KLe/AQko+pjZRh9dxHTVvMjscgoWqlzbBD64g02qVwembpka9
 tGqp4knyJhFABZZ8M/1wK9+/4CiSYp19572kXxHCNclCw2hCojX60OPt1
 RTCQV1KGe/XqDwe4x+kR0xMtlNnkas5G2ZkEsQoyILxNlj7e7GW4TsAiX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378902491"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="378902491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944219849"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="944219849"
Received: from ctgorman-mobl.ger.corp.intel.com (HELO [10.213.202.242])
 ([10.213.202.242])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:52:37 -0800
Message-ID: <8f3fac46-9ce2-4ef3-bd42-5e3d447eff75@linux.intel.com>
Date: Tue, 5 Dec 2023 10:52:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Reduce log severity on reset
 prepare.
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231201154443.16660-1-nirmoy.das@intel.com>
 <cff13a24-2f7f-4d44-8fd4-a45cbfa1c76e@linux.intel.com>
 <d50cc22d-670a-49e3-92c7-361fdac66fc6@intel.com>
 <ddde1612-bfd1-4892-b915-87034a0a7cb3@linux.intel.com>
 <00a50f66-0268-4f1d-a4d4-baf4dda2b1f6@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <00a50f66-0268-4f1d-a4d4-baf4dda2b1f6@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/12/2023 10:44, Nirmoy Das wrote:
> Hi Tvrtko,
> 
> On 12/5/2023 11:05 AM, Tvrtko Ursulin wrote:
>>
>> On 05/12/2023 08:50, Nirmoy Das wrote:
>>> Hi Tvrtko,
>>>
>>> On 12/5/2023 9:34 AM, Tvrtko Ursulin wrote:
>>>>
>>>> On 01/12/2023 15:44, Nirmoy Das wrote:
>>>>> gen8_engine_reset_prepare() can fail when HW fails to set
>>>>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>>>>> error as driver will retry.
>>>>>
>>>>> Let the caller of gen8_engine_reset_prepare() decide if a
>>>>> failure in gen8_engine_reset_prepare is an error or not.
>>>>
>>>> No complaints per se but I don't see the caller deciding and it is 
>>>> not really reducing log level but converting to trace. So commit 
>>>> message and patch do not align for me which I think should be improved.
>>>
>>>
>>> I meant the return value is checked by the caller, 
>>> gen8_reset_engines(). I will resend with a improved commit message.
>>
>> Ah okay, maybe my bad for not figuring out that possibility. I guess 
>> it might be passable as is, but yes, clearer commit text would be better.
> 
> I sent a v2 already :)
> 
> 
>>
>> Trace is good enough - we are not usually interested in seeing those 
>> as dbg/info/notice?
> 
> 
> Idea is that all the GT related events are recorded in trace and dmesg 
> could be noisy some times.

Although trace does not help on production deployments so we need to be 
sure the fact this timeout is hit is totally un-interesting. I see John 
has some concerns that it may not be so. And I don't have currently a 
view into how frequent they are (timeouts) or which platforms are affected.

Regards,

Tvrtko

> 
> 
> Regards,
> 
> Nirmoy
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Thanks,
>>>
>>> Nirmoy
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> index d5ed904f355d..e6fbc6202c80 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>>>>> intel_engine_cs *engine)
>>>>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>>>>                          700, 0, NULL);
>>>>>       if (ret)
>>>>> -        gt_err(engine->gt,
>>>>> -               "%s reset request timed out: {request: %08x, 
>>>>> RESET_CTL: %08x}\n",
>>>>> -               engine->name, request,
>>>>> -               intel_uncore_read_fw(uncore, reg));
>>>>> +        GT_TRACE(engine->gt,
>>>>> +             "%s reset request timed out: {request: %08x, 
>>>>> RESET_CTL: %08x}\n",
>>>>> +             engine->name, request,
>>>>> +             intel_uncore_read_fw(uncore, reg));
>>>>>         return ret;
>>>>>   }
