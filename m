Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1FA59479
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A808010E44E;
	Mon, 10 Mar 2025 12:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QFLpOjRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840210E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TTWwFbjIw7OO0CJA55fIYDWwYEscM+zRTnH/oFREfJk=; b=QFLpOjRNT1gb+61+7NyNAx0tXX
 8ROGeXSULbplXDPg5/GLigqqSv3ovxvD50UJ6YXR93wdkWGYGMHOj+4D0lVpngWQMwyiI+aPXoDqq
 vs0bGKqlruhqbYkvINezqNO+kiKRvve5ozv8PPaNdMX3Xrq/FGvPIBLSqxsf3/J2CZTI92dyK0AZV
 W2gyxdVHyYzsZdUG7ucT7i5jBsCc8iwkTqzLtgpQ5ZffmTxTQ4IU+9DiRQ8vC8F9vPYIgCYfoOT3c
 PYVHlXbRfSAjYbCBncXlZOECNVpD5AC8iMkRUf4htLPbTUxe1l43s3GHtFfbh4XBCZdTZhd4HyspS
 OAYZ8RUQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trcFw-006TOU-Bv; Mon, 10 Mar 2025 13:29:22 +0100
Message-ID: <73b37bab-5f52-4d04-a627-d97b5c5ebe7a@igalia.com>
Date: Mon, 10 Mar 2025 12:29:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
 <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
 <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
 <61b4e7342572269b61ed4188dccfb688c3d95d79.camel@mailbox.org>
 <7070a805-653c-4664-b0df-aa9c800e2f05@igalia.com>
 <d3b3a1210009223000e88a60d1215469bf765545.camel@mailbox.org>
 <219fc5e3-759b-4013-8def-673c7946f5e1@igalia.com>
 <4a3e145d48795ceffcacec4a4f1423c7b3b278ff.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4a3e145d48795ceffcacec4a4f1423c7b3b278ff.camel@mailbox.org>
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


On 10/03/2025 12:00, Philipp Stanner wrote:
> On Mon, 2025-03-10 at 11:54 +0000, Tvrtko Ursulin wrote:
>>
>> On 10/03/2025 11:11, Philipp Stanner wrote:
>>> On Mon, 2025-03-10 at 09:55 +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 07/03/2025 18:06, Philipp Stanner wrote:
>>>>> On Fri, 2025-03-07 at 16:59 +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 07/03/2025 13:41, Philipp Stanner wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> You forgot to put folks in CC as recipents for the cover
>>>>>>> letter
>>>>>>> :(
>>>>>>>
>>>>>>>
>>>>>>> On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
>>>>>>>> Move some options out into a new debug specific kconfig
>>>>>>>> file
>>>>>>>> in
>>>>>>>> order
>>>>>>>> to
>>>>>>>> make things a bit cleaner.
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>>>
>>>>>>> We all have our individual work flows, so don't take this
>>>>>>> as
>>>>>>> lecturing
>>>>>>> or anything – I just suspect that I was forgotten in the
>>>>>>> cover
>>>>>>> letter
>>>>>>> because you Cc people by hand in the individual patches.
>>>>>>>
>>>>>>> What I do is that I run get_maintainer and then put the
>>>>>>> individuals
>>>>>>> listed there into the --to= field. That sends the entire
>>>>>>> series
>>>>>>> to
>>>>>>> all
>>>>>>> of them.
>>>>>>>
>>>>>>> Only sometimes, when there's a huge list of recipents or
>>>>>>> when
>>>>>>> the
>>>>>>> patches of a series are very independent, I deviate from
>>>>>>> that
>>>>>>> rule.
>>>>>>>
>>>>>>> JFYI
>>>>>>
>>>>>> Notice it was there in v3, I just omitted to paste it this
>>>>>> time.
>>>>>>
>>>>>>> Anyways, we have a bigger problem about the entire series.
>>>>>>> I
>>>>>>> now
>>>>>>> tested
>>>>>>> again with the same setup as yesterday and the faults are
>>>>>>> indeed
>>>>>>> gone,
>>>>>>> so that's good.
>>>>>>>
>>>>>>> But to be sure I then did run kmemleak and got a list of
>>>>>>> leaks
>>>>>>> that
>>>>>>> is
>>>>>>> more than 2000 lines long.
>>>>>>
>>>>>> There is this comment for drm_sched_fini which ends with:
>>>>>>
>>>>>> """
>>>>>> ...
>>>>>>      * This stops submission of new jobs to the hardware
>>>>>> through
>>>>>>      * drm_sched_backend_ops.run_job(). Consequently,
>>>>>> drm_sched_backend_ops.free_job()
>>>>>>      * will not be called for all jobs still in
>>>>>> drm_gpu_scheduler.pending_list.
>>>>>>      * There is no solution for this currently. Thus, it is up
>>>>>> to
>>>>>> the
>>>>>> driver to make
>>>>>>      * sure that:
>>>>>>      *
>>>>>>      *  a) drm_sched_fini() is only called after for all
>>>>>> submitted
>>>>>> jobs
>>>>>>      *     drm_sched_backend_ops.free_job() has been called or
>>>>>> that
>>>>>>      *  b) the jobs for which drm_sched_backend_ops.free_job()
>>>>>> has
>>>>>> not
>>>>>> been
>>>>>> called
>>>>>>      *     after drm_sched_fini() ran are freed manually.
>>>>>>      *
>>>>>>
>>>>>>      * FIXME: Take care of the above problem and prevent this
>>>>>> function
>>>>>> from
>>>>>> leaking
>>>>>>      * the jobs in drm_gpu_scheduler.pending_list under any
>>>>>> circumstances.
>>>>>> """
>>>>>>
>>>>>> I got bitten by that. Keep forgetting how fragile the thing
>>>>>> is..
>>>>>> :(
>>>>>
>>>>> argh damn, those are *all* from the pending_list?!
>>>>
>>>> Right, all leaks I saw were from the
>>>> drm_sched_basic_entity_cleanup
>>>> test. All other tests actually wait for jobs to finish so can't
>>>> hit
>>>> that.
>>>>
>>>> Fix was simply to add a drm_sched_job_cleanup call when unwinding
>>>> unfinished mock scheduler jobs from drm_mock_sched_fini, which
>>>> happens
>>>> before calling drm_sched_fini.
>>>>
>>>> That's pretty much how things are expected to be handled AFAIU.
>>>>
>>>>> OK. Well.
>>>>>
>>>>> Now we've got a philosophical problem:
>>>>>
>>>>> We still have to fix those leaks (I'm still working on it, but
>>>>> my
>>>>> current attempt has failed and I probably fall back to a
>>>>> refcount
>>>>> solution).
>>>>
>>>> You propose to move the responsibility of cleaning up in-flight
>>>> jobs
>>>> to
>>>> the scheduler core?
>>>
>>> The scheduler core is already and has always been responsible for
>>> cleaning up "in-flight jobs". It does so through
>>> backend_ops.free_job(). And we prevent it from cleaning up all jobs
>>> by
>>> cancelling the work items in drm_sched_fini().
>>>
>>> Semantically, the scheduler is the one in charge of the job life
>>> times.
>>>
>>> As of right now, every single driver is effectively forced to
>>> implement
>>> the same logic, but they have implemented it in different ways (Xe
>>> refcounts the scheduler and only calls drm_sched_fini() once refcnt
>>> ==
>>> 0, Nouveau maintains a copy of the pending_list, blocking for it to
>>> become empty before calling drm_sched_fini())
>>
>> Right. And to change it means making ->free_job() for all drivers
>> handle
>> different potential job states, while today it only needs to handle
>> finished jobs. Or adding a new vfunc. Or something. It sounds doable
>> but
>> a lot of work, not least because there is a lot of drivers.
> 
> I know the pain, I'm working on that since ~November.
> 
> I plan to propose a new solution "soon"(tm)

Ack.

>>>>> And to see whether the fix actually fixes the leaks, directly
>>>>> using
>>>>> the
>>>>> kunit tests would be handy.
>>>>>
>>>>> After all, this is what the kunit tests are there for: show
>>>>> what is
>>>>> broken within the scheduler. And those leaks definitely
>>>>> qualify. Or
>>>>> should kunit tests follow the same rules we demand from
>>>>> drivers?
>>>>>
>>>>> I'd like to hear more opinions about that.
>>>>>
>>>>> @Danilo, @Dave, @Sima
>>>>> would it be OK if we add kunit tests for the scheduler to DRM
>>>>> that
>>>>> cause leaks until we can fix them?
>>>>
>>>> It is indeed a bit philosophical. I'd say only if there is a 100%
>>>> agreement that drm_sched_fini should be able to clean up, or
>>>> drive
>>>> cleaning up, all driver state. And if we are prepared to handle a
>>>> permanently failing test from now to some future date when this
>>>> would
>>>> be
>>>> implemented.
>>>>
>>>> I have a similar conundrum with set priority, where I was
>>>> contemplating
>>>> to add a permanently failing test showing how that does not fully
>>>> work,
>>>> and then get improved with my deadline scheduling series.
>>>>
>>>> On the other side of the argument is the past experience of CI
>>>> systems
>>>> generally not coping well with permanently failing test.
>>>> Eventually
>>>> they
>>>> succumb to the pressure to remove them due noisy results.
>>>> Therefore
>>>> other option is to have the mock scheduler adhere to the current
>>>> implementation and only change it once the DRM scheduler rules
>>>> change.
>>>
>>> Can you think of a way, like flags or kconfig options, with which
>>> developers such as you and I could "switch the bugs on" for working
>>> on
>>> those issues?
>>
>> We could do that easily I think. Something like:
>>
>> config DRM_SCHED_KUNIT_TEST_ASPIRATIONAL
>>           bool "Turn on the aspirational mode for DRM scheduler unit
>> tests" if !KUNIT_ALL_TESTS
>>           select DRM_SCHED
>>           depends on DRM && KUNIT && DRM_SCHED_KUNIT_TEST
>>           default KUNIT_ALL_TESTS
>>           help
>>             Choose this option to make the DRM scheduler unit tests
>> test
>> for behaviour which was agreed as a design goal, even if the current
>> implementation can make specific tests fail.
>>
>>             Recommended for driver developers only.
>>
>>             If in doubt, say "N".
> 
> If you can work out something like this, that would be fantastic and
> solve all the aforementioned problems
> 
>>
>> I can skip the job cleanup based on it and also add some validation
>> that
>> the pending list is empty after drm_sched_fini if on.
> 
> Sounds handy. That way the developer doesn't even have to use kmemleak.

Okay I'll add that and respin. Maybe add an unit test for credits while 
at it.

Regards,

Tvrtko

