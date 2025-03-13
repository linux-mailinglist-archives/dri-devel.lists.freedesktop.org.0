Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49726A5F067
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2609D10E146;
	Thu, 13 Mar 2025 10:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sblbzIA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E010E146
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTOvUOOILCLq3/h+qtN6wzq7XZ0Je2GvDOu4mnuPUms=; b=sblbzIA/NBsU1cBy9UUi73FiA0
 evfsjTJVWVAhhXZLBGEUSPxS33ZIxNPktiE+tlnfClhPOURhkeigtnJpKSzdtJ7MkK8B156q0VTky
 KIhTl5QVgvt2aCNpdiA68hAXwhc35GRufPRC1bMC23rbo/CVFmL7DaGbTh0/4Tg79kXib6OdDkK5j
 Z5zcIxpi0KY1eigImjuux8o1Mikl/vgtAYWtcoq6aQZTn3dNdzB8HVbkXjnDIyafTG1n92vgprC1e
 sVKzdgcN1usfZSi3gNqjUCY4kvExP0VG5G+jX2zQ1KjaoNe3BK29d4u5My6l5JzgVOwGcvuN2vhcF
 RxbejwAQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tsfax-0082jm-Sk; Thu, 13 Mar 2025 11:15:25 +0100
Message-ID: <1084cc97-b119-494f-96db-947e9a420556@igalia.com>
Date: Thu, 13 Mar 2025 10:15:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] DRM scheduler kunit tests
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <d92d3b58fa34f4beb957feeb372f9e18237d1c1c.camel@mailbox.org>
 <0f0102cb-8036-4fc6-898e-cd4eab4edfe0@igalia.com>
 <3ce2bdb2cacd9d30bd5de282e227721d838822b8.camel@mailbox.org>
 <f3e52167-eab5-44a7-a769-c861c7f46a8d@igalia.com>
 <750b4501-fd2b-45e9-b563-1e6440216129@igalia.com>
 <91dd26db9b89e58c9c36272b7ac777ed9c6e3c61.camel@mailbox.org>
 <8526f1e1-07d7-4389-8655-482f3c25f641@igalia.com>
 <2b63f2889e77dc884b663dda1a52a3c8012b4e01.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2b63f2889e77dc884b663dda1a52a3c8012b4e01.camel@mailbox.org>
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


On 13/03/2025 08:34, Philipp Stanner wrote:
> On Wed, 2025-03-12 at 14:33 +0000, Tvrtko Ursulin wrote:
>>
>> On 12/03/2025 13:49, Philipp Stanner wrote:
>>
>> [snip]
>>
>>>>>> There I see a UAF. Do you have an idea what that might be? I
>>>>>> would only
>>>>>> expect memory leaks and the test assertions failing.
>>>>>
>>>>> It is expected all hell to break loose in aspirational mode.
>>>>> There
>>>>> the
>>>>> mock scheduler shutdown relies solely on drm_sched_fini. So all
>>>>> tests
>>>>> which do not fully idle the mock scheduler themselves, whether
>>>>> implicity
>>>>> or explicitly, will explode in various ways.
>>>>
>>>> To clarify I made it like that because that is what I understood
>>>> was
>>>> your vision for drm_sched_fini. That it would be able to clean
>>>> everything up etc.
>>>>
>>>> If you meant something different we need to adjust it. Although
>>>> it
>>>> could
>>>> be done later as well.
>>>
>>> My primary intention was to use those tests to see whether my
>>> memory
>>> leak fix works or not.
>>
>> Okay here I don't know exactly what are you changing and how you are
>> testing to comment.
>>
>>> Thus I'd need something like in v4, where the tests run as intended
>>> but
>>> leak the jobs in the pending_list. Would indeed be neat if they
>>> also
>>> check for list_len(pending_list) so that you don't have to run
>>> kmemleak
>>> manually.
>>>
>>> And since we shouldn't have such leaks in production tests the idea
>>> of
>>> optionally enabling them arose.
>>>
>>> More generally speaking, I think that the tests should behave as we
>>> expect drivers to behave *currently*, while we have the option for
>>> the
>>> tests to purposefully misbehave. In my case this means: just leak
>>> the
>>> jobs and optionally tell about the leaks.
>>>
>>> When used as intended, the scheduler currently AFAIK doesn't have
>>> UAF
>>> or nullptrderefs, so they shouldn't occur in tests that use it as
>>> intended. Now the leaks are special because we never intended them.
>>>
>>> So what surprised me is that, when compared to v4, this v7 here
>>> actually now also has UAF. Besides not cleaning up leaks, what are
>>> you
>>> doing in aspiritional mode?
>>>
>>> Let's talk it through before you invest your time into v8
>>
>> 1)
>>
>> "Normal" mode is fine, do you agree? No leaks, no UAF. Ie. it is
>> exercising the scheduler how drivers are supposed to use it today.
> 
> Yes, it is fine.
> 
>>
>> 2)
>>
>> Aspirational mode I added on your request and you can define how you
>> want it to work.
> 
> My personal intention is simple: have the jobs leaked like in v4,
> without UAF or faults and the like.
> 
>>
>> Lets have a look in drm_mock_sched_fini() and see that it is pretty
>> straightforward. First I'll pre-process and annotate the normal
>> version:
>>
>> void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>> {
>> 	struct drm_mock_sched_job *job, *next;
>> 	struct kunit  *test = sched->test;
>> 	unsigned long flags;
>> 	LIST_HEAD(signal);
>>
>> 	// Stop the scheduler workqueues so nothing further gets
>> scheduled
>> 	drm_sched_wqueue_stop(&sched->base);
>>
>> 	// Idle the mock scheduler in-flight jobs:
>>
>> 	// First move them to a local list so any in parallel
>> "hardware"
>> activity does not see them any more
>>
>> 	spin_lock_irqsave(&sched->lock, flags);
>> 	list_for_each_entry_safe(job, next, &sched->job_list, link)
>> 		list_move_tail(&job->link, &signal);
>> 	spin_unlock_irqrestore(&sched->lock, flags);
>>
>> 	// Now for jobs which "hardware" hasn't processed yet we do:
>> 	//
>> 	// 1. Cancel the completion timer
>> 	// 2. Mark the job as complete (signal the hw fence, wake up
>> waiters)
>> 	// 3. Release the hardware fence (list had a reference)
>> 	// 4. Free the job itself
>>
>> 	list_for_each_entry(job, &signal, link) {
>> 		hrtimer_cancel(&job->timer);
>> 		drm_mock_sched_job_complete(job);
>> 		dma_fence_put(&job->hw_fence);
>> 		drm_sched_job_cleanup(&job->base);
>> 	}
>>
>> 	// Finally drm_sched_fini
>> 	drm_sched_fini(&sched->base);
>> }
>>
>> In aspirational mode it becomes this:
>>
>> void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>> {
>> 	struct kunit  *test = sched->test;
>>
>> 	drm_sched_fini(&sched->base);
>>
>> 	KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
>> 	KUNIT_ASSERT_TRUE(test, list_empty(&sched-
>>> base.pending_list));
>> }
>>
>> So relies on drm_sched_fini to cleanup _everything_. Including the
>> driver (mock scheduler) state. Which is what I understood you wanted.
> 
> Thx for the detailed explanation. _Everything_ seems a lot, though.
> Even in this version, you still stop submission to your entities, don't
> you?
> 
> IOW: is drm_sched_fini(), in aspirational mode, responsible for more
> than preventing the leaks (and for what it is already doing in mainline
> linux)?

Yes it is, it would need to idle and free all driver state. Again, this 
is I understood you wanted to work towards, but as this thread will 
conclude as dropping it for now it doesn't matter.

>> For example drm_sched_basic_entity_cleanup test case will exit (kill
>> the
>> entities and tear down the scheduler) with half of the submitted jobs
>> still in flight. That's one example of what will be caught here by
>> the
>> asserts and also UAF since kunit test will just exit and free up
>> memory
>> regardless.
> 
> Hmm. OK, so kunit does the free. But who does the access?
> drm_sched_fini() still stops all the work items.

In-flight jobs. Completion timers will fire, simulating hardware 
interrupts firing with a real driver.

>> If this isn't what you had in mind you can either a) tell me what you
>> want maybe I can tweak it*, or b) we can drop the aspirational patch
>> for
>> now.
> 
> 
> So, here's the bad news. I had a chat with Danilo yesterday who
> reminded me of the fact that there are testers out there (like the
> Intel bots) which do random kconfigs - so avoiding that with another
> kconfig option does not solve the problem.
> 
> Thus, I think the way to go is to indeed drop aspirational mode and
> whoever works on Schrödinger-Problems (like myself) has to tweak the
> tests locally.
> 
> That's probably even more productive process-wise, otherwise we'd have
> to remove broken aspects of (or the entire) aspirational mode every
> time that we solved a known problem.
> 
> Unless you have a better proposal, let's drop that mode.
> 
> 
> Sorry for the zig-zag, but that wasn't on my / our radar

No worries. Can you review the v7 as is or you want me to send v8? I am 
pretty sure aspirational mode patch is standalone and could be simply 
dropped when merging.

Regards,

Tvrtko

>> *)
>> For example it would be possible to avoid UAFs by moving away from
>> kunit
>> managed allocations and just leak memory. Plus, it would also be
>> required to cancel the timers or so.
>>
>> For running in the VM or UML cases, which I thought were typical, it
>> wouldn't be a benefit, but if you are worried about running on the
>> host
>> kernel and expect no crashes, then that aspect would need to change.
>>
>> Regards,
>>
>> Tvrtko
>>
> 

