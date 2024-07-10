Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D892CFD1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 12:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19510E2BE;
	Wed, 10 Jul 2024 10:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="vrnhN/lG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314AA10E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:52:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so24815315e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1720608745; x=1721213545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7OTwFD+y8BLpQUOHFtOxwqpYjiL54IPOC+Fv6GtnwNA=;
 b=vrnhN/lGb2iAoXnFUh/BNlxLQp0O0rRoHIO5ja5mM3wWI4mCPhhpGxxP10xF6ueCVN
 9Q5TRB1daLm1IWHpW2WJFxjutUmIjaLF+P1g0hxhmt/Yk22mXwCl8LidCvfOp+5PFQs0
 FGOo8F6S60IiC7ZykbGsprDLC0F/U3tOY0KkqqCXMwnvhnLTMnF93L0bBp6eKNQfq91+
 XenkUpvBOjVmNqBWhWl9Ay3xS90gvLUbQCYwYT7GEuxjUlyU34qP30QQyv/N44hYLoAb
 T/8oVHO3wZZI3TiTjk6hTmh9GMHs1Urxi+prfA2wNKD+LkQPyRJiT90nQbEXK+X+cLm6
 NQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720608745; x=1721213545;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7OTwFD+y8BLpQUOHFtOxwqpYjiL54IPOC+Fv6GtnwNA=;
 b=fTuubkFofPlhQuKF7ThVyptaA2i4nv1sb4UwVhAQR5CD2ZP/Lf/ETwWwhmTdN3fSZ2
 O5ro8TRra2rR5yR+XIMq07wkmFZaeNyMN0KpAInSlSnuRy8rZJ2pgIGgHz7TzlMhoVc3
 dg+V5ywCmqZF0/357Im/iOgP+Ew91p7v2U5Roac1RX85sShqJBHZE1JVw/5pbJGmYAYp
 Dz4uCJrqpSkkhqyjqLtGmAIg5SusdnCmUOghXdUDIQhg8Ir3LPg3V7RwZQ69ZP5zwyKy
 7FzgXaiyQROD2Ygunrnj5zoc7VUhGrfrjUOzGts46jouwNJ06BSd+qNO69JdAvt1LsET
 tLUg==
X-Gm-Message-State: AOJu0YwJbXqlNgZwKvcRsMrJzUTH0u4b4Ik8M5Rnj1KL2cInTQvNlJCw
 SVetPpeUtgE+OCF1Kb0Xyliba1As/73IZ+FtkkvScnH5SrdVymAbT2yBhplc5Mo=
X-Google-Smtp-Source: AGHT+IHLdpVm8qLCHnMBImFFXSR3vZfYQOMKFUuVgSNrJAzj9CMoxZNTowxhQqOFT4crIo5haRW+Bw==
X-Received: by 2002:a05:600c:22cb:b0:426:6220:cb57 with SMTP id
 5b1f17b1804b1-426708f1ef6mr35241465e9.25.1720608745401; 
 Wed, 10 Jul 2024 03:52:25 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fc9desm247799075e9.45.2024.07.10.03.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:52:25 -0700 (PDT)
Message-ID: <c0f5c187-38d9-40ce-b5b7-ae466584d24a@ursulin.net>
Date: Wed, 10 Jul 2024 11:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 chris.p.wilson@linux.intel.com, nirmoy.das@intel.com,
 janusz.krzysztofik@linux.intel.com, stable@vger.kernel.org
References: <20240709125302.861319-1-nitin.r.gote@intel.com>
 <51d17145-39bd-4ba5-a703-10725a1d3bc1@ursulin.net>
Content-Language: en-GB
In-Reply-To: <51d17145-39bd-4ba5-a703-10725a1d3bc1@ursulin.net>
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


On 09/07/2024 15:02, Tvrtko Ursulin wrote:
> 
> On 09/07/2024 13:53, Nitin Gote wrote:
>> We're seeing a GPU HANG issue on a CHV platform, which was caused by
>> bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries 
>> for gen8").
>>
>> Gen8 platform has only timeslice and doesn't support a preemption 
>> mechanism
>> as engines do not have a preemption timer and doesn't send an irq if the
>> preemption timeout expires. So, add a fix to not consider preemption
>> during dequeuing for gen8 platforms.
>>
>> Also move can_preemt() above need_preempt() function to resolve implicit
>> declaration of function ‘can_preempt' error and make can_preempt()
>> function param as const to resolve error: passing argument 1 of
>> ‘can_preempt’ discards ‘const’ qualifier from the pointer target type.
>>
>> Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption 
>> boundaries for gen8")
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
>> Suggested-by: Andi Shyti <andi.shyti@intel.com>
>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> CC: <stable@vger.kernel.org> # v5.2+
>> ---
>>   .../drm/i915/gt/intel_execlists_submission.c  | 24 ++++++++++++-------
>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 21829439e686..30631cc690f2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -294,11 +294,26 @@ static int virtual_prio(const struct 
>> intel_engine_execlists *el)
>>       return rb ? rb_entry(rb, struct ve_node, rb)->prio : INT_MIN;
>>   }
>> +static bool can_preempt(const struct intel_engine_cs *engine)
>> +{
>> +    if (GRAPHICS_VER(engine->i915) > 8)
>> +        return true;
>> +
>> +    if (IS_CHERRYVIEW(engine->i915) || IS_BROADWELL(engine->i915))
>> +        return false;
>> +
>> +    /* GPGPU on bdw requires extra w/a; not implemented */
>> +    return engine->class != RENDER_CLASS;
> 
> Aren't BDW and CHV the only Gen8 platforms, in which case this function 
> can be simplifies as:
> 
> ...
> {
>      return GRAPHICS_VER(engine->i915) > 8;
> }
> 
> ?
> 
>> +}
>> +
>>   static bool need_preempt(const struct intel_engine_cs *engine,
>>                const struct i915_request *rq)
>>   {
>>       int last_prio;
>> +    if ((GRAPHICS_VER(engine->i915) <= 8) && can_preempt(engine))
> 
> The GRAPHICS_VER check here looks redundant with the one inside 
> can_preempt().

One more thing - I think gen8_emit_bb_start() becomes dead code after 
this and can be removed.

Regards,

Tvrtko

>> +        return false;
>> +
>>       if (!intel_engine_has_semaphores(engine))
>>           return false;
>> @@ -3313,15 +3328,6 @@ static void remove_from_engine(struct 
>> i915_request *rq)
>>       i915_request_notify_execute_cb_imm(rq);
>>   }
>> -static bool can_preempt(struct intel_engine_cs *engine)
>> -{
>> -    if (GRAPHICS_VER(engine->i915) > 8)
>> -        return true;
>> -
>> -    /* GPGPU on bdw requires extra w/a; not implemented */
>> -    return engine->class != RENDER_CLASS;
>> -}
>> -
>>   static void kick_execlists(const struct i915_request *rq, int prio)
>>   {
>>       struct intel_engine_cs *engine = rq->engine;
