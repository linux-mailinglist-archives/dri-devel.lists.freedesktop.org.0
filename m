Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0066BD8C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5810E3DF;
	Mon, 16 Jan 2023 12:13:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50910E3E4;
 Mon, 16 Jan 2023 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673871229; x=1705407229;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dI4GVyx8abhG2prM4hLi5Jb7TbmPXD8Wbcovo3mmijQ=;
 b=hOvI8seNJ58tqmrIFCjnLfNMSNzFMFFWoQB9quH5FsWpCBVD1X8Hc9mn
 Rnb8vqfscoe5bFdewyIsl3o1wil55e6wnUCXfbxhuKCfiBxMXR4/tebGK
 it3uHbPzLbARLpfoxxPFh+YnzvjXUtEPKUgqHfZrQaK5KZerI/N1OnFKc
 zQZd+Q94wThQFGqPhLjEfkm6HQGLOQvppHut0lt9SK1Dek1RqMfgb5JA3
 gyZTdMhjUmM9Zv+8I3VjqAuf+Zt0/zxwJHMbgt5YEo8m8gaMBahbw4P27
 en/Ia6QP+wiDXku21e9Uvp35e8zxz5ZBd0z7YBnKlLMMjEnHfdmUXZf+E Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="323150262"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="323150262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:13:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="689465954"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="689465954"
Received: from hgacquin-mobl1.ger.corp.intel.com (HELO [10.213.212.173])
 ([10.213.212.173])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:13:47 -0800
Message-ID: <3ed42f96-8965-7872-709d-2daa6c48dcb9@linux.intel.com>
Date: Mon, 16 Jan 2023 12:13:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
Content-Language: en-US
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
 <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
 <79cd935a-5a7f-b709-ec05-c9cf5801f2dc@intel.com>
 <4acf4db5-97e9-34dc-2b89-517296ce4c3c@linux.intel.com>
 <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
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


On 13/01/2023 17:46, Hellstrom, Thomas wrote:
> On Fri, 2023-01-13 at 09:51 +0000, Tvrtko Ursulin wrote:
>>
>> On 12/01/2023 20:40, John Harrison wrote:
>>> On 1/12/2023 02:01, Tvrtko Ursulin wrote:
>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> There was a report of error captures occurring without any hung
>>>>> context being indicated despite the capture being initiated by
>>>>> a 'hung
>>>>> context notification' from GuC. The problem was not
>>>>> reproducible.
>>>>> However, it is possible to happen if the context in question
>>>>> has no
>>>>> active requests. For example, if the hang was in the context
>>>>> switch
>>>>> itself then the breadcrumb write would have occurred and the
>>>>> KMD would
>>>>> see an idle context.
>>>>>
>>>>> In the interests of attempting to provide as much information
>>>>> as
>>>>> possible about a hang, it seems wise to include the engine info
>>>>> regardless of whether a request was found or not. As opposed to
>>>>> just
>>>>> prentending there was no hang at all.
>>>>>
>>>>> So update the error capture code to always record engine
>>>>> information
>>>>> if an engine is given. Which means updating record_context() to
>>>>> take a
>>>>> context instead of a request (which it only ever used to find
>>>>> the
>>>>> context anyway). And split the request agnostic parts of
>>>>> intel_engine_coredump_add_request() out into a seaprate
>>>>> function.
>>>>>
>>>>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of
>>>>> a null
>>>>> pointer.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> Reviewed-by: Umesh Nerlige Ramappa
>>>>> <umesh.nerlige.ramappa@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/i915_gpu_error.c | 61
>>>>> +++++++++++++++++++--------
>>>>>    1 file changed, 43 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> index 9d5d5a397b64e..bd2cf7d235df0 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> @@ -1370,14 +1370,14 @@ static void
>>>>> engine_record_execlists(struct
>>>>> intel_engine_coredump *ee)
>>>>>    }
>>>>>      static bool record_context(struct i915_gem_context_coredump
>>>>> *e,
>>>>> -               const struct i915_request *rq)
>>>>> +               struct intel_context *ce)
>>>>>    {
>>>>>        struct i915_gem_context *ctx;
>>>>>        struct task_struct *task;
>>>>>        bool simulated;
>>>>>          rcu_read_lock();
>>>>> -    ctx = rcu_dereference(rq->context->gem_context);
>>>>> +    ctx = rcu_dereference(ce->gem_context);
>>>>>        if (ctx && !kref_get_unless_zero(&ctx->ref))
>>>>>            ctx = NULL;
>>>>>        rcu_read_unlock();
>>>>> @@ -1396,8 +1396,8 @@ static bool record_context(struct
>>>>> i915_gem_context_coredump *e,
>>>>>        e->guilty = atomic_read(&ctx->guilty_count);
>>>>>        e->active = atomic_read(&ctx->active_count);
>>>>>    -    e->total_runtime =
>>>>> intel_context_get_total_runtime_ns(rq->context);
>>>>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq-
>>>>>> context);
>>>>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>>>>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>>>>          simulated = i915_gem_context_no_error_capture(ctx);
>>>>>    @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct
>>>>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>>>>        return ee;
>>>>>    }
>>>>>    +static struct intel_engine_capture_vma *
>>>>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>>>>> +                struct intel_context *ce,
>>>>> +                gfp_t gfp)
>>>>> +{
>>>>> +    struct intel_engine_capture_vma *vma = NULL;
>>>>> +
>>>>> +    ee->simulated |= record_context(&ee->context, ce);
>>>>> +    if (ee->simulated)
>>>>> +        return NULL;
>>>>> +
>>>>> +    /*
>>>>> +     * We need to copy these to an anonymous buffer
>>>>> +     * as the simplest method to avoid being overwritten
>>>>> +     * by userspace.
>>>>> +     */
>>>>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>>>>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>>>>> +
>>>>> +    return vma;
>>>>> +}
>>>>> +
>>>>>    struct intel_engine_capture_vma *
>>>>>    intel_engine_coredump_add_request(struct
>>>>> intel_engine_coredump *ee,
>>>>>                      struct i915_request *rq,
>>>>>                      gfp_t gfp)
>>>>>    {
>>>>> -    struct intel_engine_capture_vma *vma = NULL;
>>>>> +    struct intel_engine_capture_vma *vma;
>>>>>    -    ee->simulated |= record_context(&ee->context, rq);
>>>>> -    if (ee->simulated)
>>>>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>>>>> +    if (!vma)
>>>>>            return NULL;
>>>>>          /*
>>>>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct
>>>>> intel_engine_coredump *ee,
>>>>>         */
>>>>>        vma = capture_vma_snapshot(vma, rq->batch_res, gfp,
>>>>> "batch");
>>>>>        vma = capture_user(vma, rq, gfp);
>>>>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>>>>> -    vma = capture_vma(vma, rq->context->state, "HW context",
>>>>> gfp);
>>>>>          ee->rq_head = rq->head;
>>>>>        ee->rq_post = rq->postfix;
>>>>> @@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs
>>>>> *engine,
>>>>>        if (ce) {
>>>>>            intel_engine_clear_hung_context(engine);
>>>>>            rq = intel_context_find_active_request(ce);
>>>>> -        if (!rq || !i915_request_started(rq))
>>>>> -            goto no_request_capture;
>>>>> +        if (rq && !i915_request_started(rq)) {
>>>>> +            drm_info(&engine->gt->i915->drm, "Got hung context
>>>>> on %s
>>>>> with no active request!\n",
>>>>
>>>> Suggest s/active/started/ since we have both i915_request_active
>>>> and
>>>> i915_request_started, so to align the terminology.
>>> The message text was based on the intent of the activity not the
>>> naming
>>> of some internal helper function. Can change it if you really want
>>> but
>>> "with no started request" just reads like bad English to me. Plus
>>> it
>>> gets removed in the next patch anyway...
>>>
>>>
>>>>
>>>>> +                 engine->name);
>>>>> +            rq = NULL;
>>>>> +        }
>>>>>        } else {
>>>>>            /*
>>>>>             * Getting here with GuC enabled means it is a forced
>>>>> error
>>>>> capture
>>>>> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs
>>>>> *engine,
>>>>>                               flags);
>>>>>            }
>>>>>        }
>>>>> -    if (rq)
>>>>> +    if (rq) {
>>>>>            rq = i915_request_get_rcu(rq);
>>>>> +        capture = intel_engine_coredump_add_request(ee, rq,
>>>>> ATOMIC_MAYFAIL);
>>>>> +    } else if (ce) {
>>>>> +        capture = engine_coredump_add_context(ee, ce,
>>>>> ATOMIC_MAYFAIL);
>>>>> +    }
>>>>>    -    if (!rq)
>>>>> -        goto no_request_capture;
>>>>> -
>>>>> -    capture = intel_engine_coredump_add_request(ee, rq,
>>>>> ATOMIC_MAYFAIL);
>>>>>        if (!capture) {
>>>>> -        i915_request_put(rq);
>>>>> +        if (rq)
>>>>> +            i915_request_put(rq);
>>>>>            goto no_request_capture;
>>>>>        }
>>>>>        if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>>>>            intel_guc_capture_get_matching_node(engine->gt, ee,
>>>>> ce);
>>>>
>>>> This step requires non-NULL ce, so if you move it under the "else
>>>> if
>>>> (ce)" above then I *think* exit from the function can be
>>>> consolidated
>>>> to just:
>>>>
>>>> if (capture) {
>>>>      intel_engine_coredump_add_vma(ee, capture, compress);
>>>>      if (rq)
>>>>          i915_request_put(rq);
>>> Is there any reason the rq ref needs to be held during the add_vma
>>> call?
>>> Can it now just be moved earlier to be:
>>>       if (rq) {
>>>           rq = i915_request_get_rcu(rq);
>>>           capture = intel_engine_coredump_add_request(ee, rq,
>>> ATOMIC_MAYFAIL);
>>>           i915_request_put(rq);
>>>       }
>>>
>>> The internals of the request object are only touched in the above
>>> _add_request() code. The later _add_vma() call fiddles around with
>>> vmas
>>> that pulled from the request but the capture_vma code inside
>>> _add_request() has already copied everything, hasn't it? Or rather,
>>> it
>>> has grabbed its own private vma resource locks. So there is no
>>> requirement to keep the request itself around still?
> 
> That sounds correct. It was some time ago since I worked with this code
> but when i started IIRC KASAN told me the request along with the whole
> capture list could disappear under us due to a parallel capture.
> 
> So the request reference added then might cover a bit too much now that
> we also hold references on vma resources, which it looks like we do in
> intel_engine_coredump_add_vma().

If you are not sure maybe just should leave the reference covering as it 
does? I don't think there is any harm in covering too much. Whether or 
not it is immediately released after the call to 
intel_engine_coredump_add_request(), or at the exit of capture_engine() 
I mean, we can skip that clean up if in doubt.

> Another thing which is crappy with the current error capture code is
> that the request capture list needs to be freed with the request and
> not when the request signals (We can't block request signalling in the
> capture code to keep the capture list around). There might be many
> signaled requests hanging around in non-pruned dma_resv objects and
> thus many unused capture lists with many unused vma resources. :/

This last part sounds vaguely familiar - is it really a problem with the 
error capture code and it wasn't some other refactoring which removed 
the pruning of signaled fences from dma_resv?

Regards,

Tvrtko

> 
> /Thomas
> 
> 
>>
>> Don't know.. it is a question if changes from 60dc43d1190d
>> ("drm/i915:
>> Use struct vma_resource instead of struct vma_snapshot") removed the
>> need for holding the rq reference that "long" I guess? Adding Thomas
>> and
>> Matt to perhaps comment.
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>> John.
>>>
>>>
>>>> } else {
>>>>      kfree(ee);
>>>>      ee = NULL;
>>>> }
>>>>
>>>> return ee;
>>>>
>>>> No "if (rq) i915_request_put()" twice, and goto label can be
>>>> completely removed.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>          intel_engine_coredump_add_vma(ee, capture, compress);
>>>>> -    i915_request_put(rq);
>>>>> +    if (rq)
>>>>> +        i915_request_put(rq);
>>>>>          return ee;
>>>
> 
