Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD366BDF9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32BB10E3F6;
	Mon, 16 Jan 2023 12:38:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DDB10E3F2;
 Mon, 16 Jan 2023 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673872721; x=1705408721;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NrcygZZsujC2TB0z+H5TPQM7UwgaiqA+zDYiAye8r+o=;
 b=jOOVEIHLBbBAhqKaFNummeJQ8aS9O02wu8PQ9nf4H09OvkLU6AnjYvPA
 UnQ97+zybDishvmEJ3qSCAZyT5v/zUjjheunjtk9z46MjtLnvAHjI9OQr
 kxIiyIyTEK+d5IuUpFjNKWeHn84Ciks7nTPA6KTByAfgWJ+9j5Fxt5AQW
 XjLnvYAskNBTnJNxauPuXKgGBhFtnMhy6kPUpONmuqUEAwD594fcjqWXa
 XoRBKhFNvDzqaga2lEgRqVSSPHpz0VwmbKE2cFhs7rhcDpYMyHtv0jmsq
 EOMtK/91/EvVkXt2Fjue3DJSIgu/4u4yPrzo1f+rSscG9SocX2vCZ43XS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="386797724"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="386797724"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:38:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="904317911"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="904317911"
Received: from hgacquin-mobl1.ger.corp.intel.com (HELO [10.213.212.173])
 ([10.213.212.173])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:38:39 -0800
Message-ID: <75379a08-1a87-d3a3-01ee-781c73d40d6f@linux.intel.com>
Date: Mon, 16 Jan 2023 12:38:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
 <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
 <79cd935a-5a7f-b709-ec05-c9cf5801f2dc@intel.com>
 <4acf4db5-97e9-34dc-2b89-517296ce4c3c@linux.intel.com>
 <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
 <0b0f59dc-d50f-f491-ad0c-9030b799830e@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <0b0f59dc-d50f-f491-ad0c-9030b799830e@intel.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/01/2023 21:29, John Harrison wrote:
> On 1/13/2023 09:46, Hellstrom, Thomas wrote:
>> On Fri, 2023-01-13 at 09:51 +0000, Tvrtko Ursulin wrote:
>>> On 12/01/2023 20:40, John Harrison wrote:
>>>> On 1/12/2023 02:01, Tvrtko Ursulin wrote:
>>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:

[snip]

>>>>>> +                 engine->name);
>>>>>> +            rq = NULL;
>>>>>> +        }
>>>>>>        } else {
>>>>>>            /*
>>>>>>             * Getting here with GuC enabled means it is a forced
>>>>>> error
>>>>>> capture
>>>>>> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs
>>>>>> *engine,
>>>>>>                               flags);
>>>>>>            }
>>>>>>        }
>>>>>> -    if (rq)
>>>>>> +    if (rq) {
>>>>>>            rq = i915_request_get_rcu(rq);
>>>>>> +        capture = intel_engine_coredump_add_request(ee, rq,
>>>>>> ATOMIC_MAYFAIL);
>>>>>> +    } else if (ce) {
>>>>>> +        capture = engine_coredump_add_context(ee, ce,
>>>>>> ATOMIC_MAYFAIL);
>>>>>> +    }
>>>>>>    -    if (!rq)
>>>>>> -        goto no_request_capture;
>>>>>> -
>>>>>> -    capture = intel_engine_coredump_add_request(ee, rq,
>>>>>> ATOMIC_MAYFAIL);
>>>>>>        if (!capture) {
>>>>>> -        i915_request_put(rq);
>>>>>> +        if (rq)
>>>>>> +            i915_request_put(rq);
>>>>>>            goto no_request_capture;
>>>>>>        }
>>>>>>        if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>>>>>            intel_guc_capture_get_matching_node(engine->gt, ee,
>>>>>> ce);
>>>>> This step requires non-NULL ce, so if you move it under the "else
>>>>> if
>>>>> (ce)" above then I *think* exit from the function can be
>>>>> consolidated
>>>>> to just:
>>>>>
>>>>> if (capture) {
>>>>>      intel_engine_coredump_add_vma(ee, capture, compress);
>>>>>      if (rq)
>>>>>          i915_request_put(rq);
>>>> Is there any reason the rq ref needs to be held during the add_vma
>>>> call?
>>>> Can it now just be moved earlier to be:
>>>>       if (rq) {
>>>>           rq = i915_request_get_rcu(rq);
>>>>           capture = intel_engine_coredump_add_request(ee, rq,
>>>> ATOMIC_MAYFAIL);
>>>>           i915_request_put(rq);
>>>>       }
>>>>
>>>> The internals of the request object are only touched in the above
>>>> _add_request() code. The later _add_vma() call fiddles around with
>>>> vmas
>>>> that pulled from the request but the capture_vma code inside
>>>> _add_request() has already copied everything, hasn't it? Or rather,
>>>> it
>>>> has grabbed its own private vma resource locks. So there is no
>>>> requirement to keep the request itself around still?
>> That sounds correct. It was some time ago since I worked with this code
>> but when i started IIRC KASAN told me the request along with the whole
>> capture list could disappear under us due to a parallel capture.
>>
>> So the request reference added then might cover a bit too much now that
>> we also hold references on vma resources, which it looks like we do in
>> intel_engine_coredump_add_vma().
> So that means we end up with:
>      rq = intel_context_find_active_request(ce);
>      ...
>      [test stuff like i915_request_started(rq)]
>      ...
>       if (rq) {
>          rq = i915_request_get_rcu(rq);
>          capture = intel_engine_coredump_add_request(ee, rq, 
> ATOMIC_MAYFAIL);
>          i915_request_put(rq);
>      }
> 
> What is special about coredump_add_request() that it needs the request 
> to be extra locked for that call and only that call? If the request can 
> magically vanish after being found then what protects the _started() 
> query? For that matter, what stops the request_get_rcu() itself being 
> called on a pointer that is no longer valid? And if we do actually have 
> sufficient locking in place to prevent that, why doesn't that cover the 
> coredump_add_request() usage?

There is definitely a red flag there with the difference between the if 
and else blocks at the top of capture_engine(). And funnily enough, the 
first block appears to be GuC only. That is not obvious from the code 
and should probably have a comment, or function names made self-documenting.

I guess the special thing about intel_engine_coredump_add_request() is 
that it dereferences the rq. So it is possibly 573ba126aef3 
("drm/i915/guc: Capture error state on context reset") which added a bug 
where rq can be dereferenced with a reference held. Or perhaps with the 
GuC backend there is a guarantee request cannot be retired from 
elsewhere while error capture is examining it.

To unravel the error entry points into error capture, from execlists, 
debugfs, ringbuffer, I don't have the time to remind myself how all that 
works right now. Quite possibly at least some of those run async to the 
GPU so must be safe against parallel request retirement. So I don't know 
if the i915_request_get_rcu safe in all those cases without spending 
some time to refresh my knowledge a bit.

Sounds like the best plan is not to change this too much - just leave 
the scope of reference held as is and ideally eliminate the necessary 
goto labels. AFAIR that should be doable without changing anything real 
and unblock these improvements.

Regards,

Tvrtko
