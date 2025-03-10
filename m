Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D5A59070
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1447410E3D9;
	Mon, 10 Mar 2025 09:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtDGjh88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DB510E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:56:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so1297462f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741600598; x=1742205398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vID61GIkIDMW8pPTgroYzl1dfmYmLe/cwdAmJLdVfrc=;
 b=jtDGjh88nzvl46X8viJFp+HHRqODbCzEC9hnwpf9fAevqJHvoG97Sar7KW5a4SilX2
 gWT/aE9LuTA75udYT+9otmDSf+Rs7BWDJ9XzKbcw58oMjakgQti3vb3UDJtQYm/o9EGW
 ugrpVH9Y8hJ6w0IQ5zdO32AQOAJcHaB+nLjsUDEwCS43TKHazS2QBLWSLXJQY4wMhVlW
 g+QZBQ9jDmyMK0QkUeeuZuqvwuaS0eXN9QmUmOZdj5wHNzXRGOVZjWoEq3ezOK2rewa7
 OhV0lDV7+oLri6o50CZn3d5pZ+CYZLJRlBvGJzHmlFv9mh0QpBEBPm60pezTDTReXyzQ
 srCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741600598; x=1742205398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vID61GIkIDMW8pPTgroYzl1dfmYmLe/cwdAmJLdVfrc=;
 b=PUe9YZiIJqW65j24Rm3Rbr3xPDNiVpkAD8dLRnsACCRJTnLPIPPEO1oC89s6ofTpfl
 8NpTNAX3WjuwRSOCaj1ffh+9rs1YCdQToFG9VLmLLGbezfm0VEL4LWpNXD6fKGy/N1U4
 nz1UTznv8znfYPLKU5UQJjTa76myixIdixK5U1FrCR8yGUmZiDyqWZqHu70/qUnkjlm5
 XNjGpnRR//6L3uFkY1nJz71AXDBmWJOCBIbfb/bTxejgtFZ9qIsYRHQ4iziFsua4ckpd
 rmq4ATN5JO0KYcjixiw/cK0oXDtoCFMref8v+TlpmR4Ky+W32cbyb/RxptxosjuRNtFr
 TIoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+8YCPZbAyO/q5Ldv+6PDglZlq1yfdq6e600BG3RbrSFET02ely13dyiYDMGT5Ka7QiGjO7Ne24P8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsfBaeyUnhnhCU3iOj8XAL0yxPnA+5+o5RCLBbsSki5jFqVatc
 YRO+kUt7DpNhvfqH0mdJeeEszTf/Xm5dDUMI+IQDCgDcdqAPyZHX
X-Gm-Gg: ASbGnctfKaljrAJPtDMxmeuDqs7/66poUAv5yT0CL+qg3AIHVvbmfYZyF6thCIdq48h
 clusnllV24rwCFXGhotFjjDsbg26s0Ev3IwG5owjmBvlP1b18aOyH3tMLFejxSvqQBU+Z3BmuJu
 8pgUc89+SkxWuhdhbb1HM9MNhrcZ2LD7nef9rWrazwaMmQ4Wl+f0IMHVzbsbkU+CIra01K5V/cA
 eQIlr8b5XdwUjYbKrhodMLTR0HiJL1c0OSuXTXHPHCGA0wD92GE56SMvNEkvIGrmZ82K7IgAFzC
 MLcBxgrPGPDcDoOIMvEiLD7Bwsm8aYr31hkWhQInnTMsINGaJ0KxsUC33+iaygBpbNLVRfpptg=
 =
X-Google-Smtp-Source: AGHT+IF1YNcz5yu7cikYuEyUTudT7kaZPD/iwTorPAEsnp+8VhcciviAqxqQhGNErUbrhAMDho5OoA==
X-Received: by 2002:a5d:5f89:0:b0:391:253b:4046 with SMTP id
 ffacd0b85a97d-39132d3331bmr9845300f8f.16.1741600597614; 
 Mon, 10 Mar 2025 02:56:37 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce8a493d0sm78351955e9.1.2025.03.10.02.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:56:37 -0700 (PDT)
Message-ID: <3d770f3e-9600-41a0-86c4-84700f7cc8f5@gmail.com>
Date: Mon, 10 Mar 2025 10:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false
 doc"
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org,
 matthew.brost@intel.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250310074414.2129157-1-christian.koenig@amd.com>
 <cb3745c15e5e2c3a2b03e47a56d2e4db555664b5.camel@mailbox.org>
 <37a58172-c2fa-4942-bafa-d96be85cd26f@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <37a58172-c2fa-4942-bafa-d96be85cd26f@igalia.com>
Content-Type: text/plain; charset=UTF-8
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

Am 10.03.25 um 10:30 schrieb Tvrtko Ursulin:
>
> On 10/03/2025 08:41, Philipp Stanner wrote:
>> On Mon, 2025-03-10 at 08:44 +0100, Christian König wrote:
>>> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.
>>>
>>> Sorry for the delayed response, I only stumbled over this now while
>>> going
>>> over old mails and then re-thinking my reviewed by for this change.
>>>
>>> The function drm_sched_job_arm() is indeed the point of no return.
>>
>> So would you say that the comment in the function's body,
>> "drm_sched_job_arm() has been called" actually means / should mean "job
>> had been submitted with drm_sched_entity_push_job()"?

Yes, probably. The problem is simply that we need to guarantee correct order of signaling for the dma_fence.

Otherwise functions like dma_fence_is_later()/dma_fence_later() start to blow up and we run into potential use after free problems.

>>
>>> The
>>> background is that it is nearly impossible for the driver to
>>> correctly
>>> retract the fence and signal it in the order enforced by the
>>> dma_fence
>>> framework.
>>>
>>> The code in drm_sched_job_cleanup() is for the purpose to cleanup
>>> after
>>> the job was armed through drm_sched_job_arm() *and* processed by the
>>> scheduler.
>>>
>>> The correct approach for error handling in this situation is to set
>>> the
>>> error on the fences and then push to the entity anyway.
>>
>> You expect the driver to set an error on scheduled and finished fence?

Ideally we would avoid that as well. In general drivers should be coded so that after calling drm_sched_job_arm() nothing can go wrong any more.

Setting an error on either the scheduler or the finished fence is basically just the last resort if we can't really avoid any error handling.

>> I think this would be very likely to explode. AFAICS the scheduler code
>> has no awareness for anyone else having touched those fences.

Yeah that is probably not well handled today.

>>
>> If at all, if this is really a problem, we should tell the driver that
>> it must enforce that there will be no failure between
>> drm_sched_job_arm() and drm_sched_job_entity_push_job(). That's how
>> Nouveau does it.
>
> On top of Philipp's questions - I just want to raise that amdgpu_cs_submit then also needs explaining. I always take amdgpu as kind of almost reference, since that is where scheduler originated from. And in there there is definitely the path of drm_sched_job_cleanup() called after drm_sched_job_arm() when adding gang dependencies fails.

Oh shit, yeah that doesn't work correctly at all. The user pages handling is completely broken as well.

Thanks for pointing that out.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Let's set our understanding straight before reverting. What
>> drm_sched_job_arm() does is:
>>
>>     1. Pick scheduler, rq and priority for the job
>>     2. Atomically increment the job_id_count and assign to job
>>     3. Call drm_sched_fence_init() and therefore:
>>     4. Set the fence's scheduler
>>     5. Set the fences seq nr atomically
>>     6. Initialize scheduled and finished fence
>>
>> What of the above precisely is the problem?
>>
>> You say the driver cannot "correctly retract the fence and signal it in
>> the order enforced by the dma_fence framework". You mean that the
>> finished_fences have to be signalled in an order only the scheduler
>> knows? I assume you're referring to set dependencies?
>>
>> P.
>>
>>> We can certainly
>>> improve the documentation, but removing the warning is clearly not a
>>> good
>>> idea.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
>>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 53e6aec37b46..4d4219fbe49d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>>    * Cleans up the resources allocated with drm_sched_job_init().
>>>    *
>>>    * Drivers should call this from their error unwind code if @job is
>>> aborted
>>> - * before it was submitted to an entity with
>>> drm_sched_entity_push_job().
>>> + * before drm_sched_job_arm() is called.
>>>    *
>>> - * Since calling drm_sched_job_arm() causes the job's fences to be
>>> initialized,
>>> - * it is up to the driver to ensure that fences that were exposed to
>>> external
>>> - * parties get signaled. drm_sched_job_cleanup() does not ensure
>>> this.
>>> - *
>>> - * This function must also be called in &struct
>>> drm_sched_backend_ops.free_job
>>> + * After that point of no return @job is committed to be executed by
>>> the
>>> + * scheduler, and this function should be called from the
>>> + * &drm_sched_backend_ops.free_job callback.
>>>    */
>>>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>   {
>>> @@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
>>> *job)
>>>    /* drm_sched_job_arm() has been called */
>>>    dma_fence_put(&job->s_fence->finished);
>>>    } else {
>>> - /* aborted job before arming */
>>> + /* aborted job before committing to run it */
>>>    drm_sched_fence_free(job->s_fence);
>>>    }
>>>   
>>
>

