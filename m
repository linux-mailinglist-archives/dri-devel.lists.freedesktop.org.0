Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6588A59065
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF70F10E3D8;
	Mon, 10 Mar 2025 09:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kdgYj/aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109D610E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRj3/ISKfDo3VaVRj9Wq0neneEFtj2p+5GVtrNlIDTA=; b=kdgYj/aAt1yiYC+dsEmaZKTwoV
 +53n0gSkmqXrNFEzl8u4VPqXvaIZm9g6FCB644gBFBet6U1jwunFIRt2eOdvT86BqdfD2Lnc7b/uO
 lseB7x9cEeXnVJD1zxUO4m9i5SVMK63IUIAlekw8j+sCJwtHhLvrnZaaxNDNiKT3pD70bSL3h1AgH
 WDvwnab5Gq5KXTPlSuLnhwLOi6wPqo/Cxu6g7w0X2TqUIoUUa9fCG0R5KJrexVWLkCcFed/UhtI/p
 b4FDGMVrn2wmVGCY/B7KiuY0TRMyPDXWA0Lmb0KHU29VmHt+Ep86yG6/2gO2I8jn4/PMFHde8JA0+
 RJzcEC/Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trZrE-006QMn-1m; Mon, 10 Mar 2025 10:55:41 +0100
Message-ID: <7070a805-653c-4664-b0df-aa9c800e2f05@igalia.com>
Date: Mon, 10 Mar 2025 09:55:40 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <61b4e7342572269b61ed4188dccfb688c3d95d79.camel@mailbox.org>
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


On 07/03/2025 18:06, Philipp Stanner wrote:
> On Fri, 2025-03-07 at 16:59 +0000, Tvrtko Ursulin wrote:
>>
>> On 07/03/2025 13:41, Philipp Stanner wrote:
>>> Hi,
>>>
>>> You forgot to put folks in CC as recipents for the cover letter :(
>>>
>>>
>>> On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
>>>> Move some options out into a new debug specific kconfig file in
>>>> order
>>>> to
>>>> make things a bit cleaner.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>
>>> We all have our individual work flows, so don't take this as
>>> lecturing
>>> or anything – I just suspect that I was forgotten in the cover
>>> letter
>>> because you Cc people by hand in the individual patches.
>>>
>>> What I do is that I run get_maintainer and then put the individuals
>>> listed there into the --to= field. That sends the entire series to
>>> all
>>> of them.
>>>
>>> Only sometimes, when there's a huge list of recipents or when the
>>> patches of a series are very independent, I deviate from that rule.
>>>
>>> JFYI
>>
>> Notice it was there in v3, I just omitted to paste it this time.
>>
>>> Anyways, we have a bigger problem about the entire series. I now
>>> tested
>>> again with the same setup as yesterday and the faults are indeed
>>> gone,
>>> so that's good.
>>>
>>> But to be sure I then did run kmemleak and got a list of leaks that
>>> is
>>> more than 2000 lines long.
>>
>> There is this comment for drm_sched_fini which ends with:
>>
>> """
>> ...
>>    * This stops submission of new jobs to the hardware through
>>    * drm_sched_backend_ops.run_job(). Consequently,
>> drm_sched_backend_ops.free_job()
>>    * will not be called for all jobs still in
>> drm_gpu_scheduler.pending_list.
>>    * There is no solution for this currently. Thus, it is up to the
>> driver to make
>>    * sure that:
>>    *
>>    *  a) drm_sched_fini() is only called after for all submitted jobs
>>    *     drm_sched_backend_ops.free_job() has been called or that
>>    *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>> been
>> called
>>    *     after drm_sched_fini() ran are freed manually.
>>    *
>>
>>    * FIXME: Take care of the above problem and prevent this function
>> from
>> leaking
>>    * the jobs in drm_gpu_scheduler.pending_list under any
>> circumstances.
>> """
>>
>> I got bitten by that. Keep forgetting how fragile the thing is.. :(
> 
> argh damn, those are *all* from the pending_list?!

Right, all leaks I saw were from the drm_sched_basic_entity_cleanup 
test. All other tests actually wait for jobs to finish so can't hit that.

Fix was simply to add a drm_sched_job_cleanup call when unwinding 
unfinished mock scheduler jobs from drm_mock_sched_fini, which happens 
before calling drm_sched_fini.

That's pretty much how things are expected to be handled AFAIU.

> OK. Well.
> 
> Now we've got a philosophical problem:
> 
> We still have to fix those leaks (I'm still working on it, but my
> current attempt has failed and I probably fall back to a refcount
> solution).

You propose to move the responsibility of cleaning up in-flight jobs to 
the scheduler core?

> And to see whether the fix actually fixes the leaks, directly using the
> kunit tests would be handy.
> 
> After all, this is what the kunit tests are there for: show what is
> broken within the scheduler. And those leaks definitely qualify. Or
> should kunit tests follow the same rules we demand from drivers?
> 
> I'd like to hear more opinions about that.
> 
> @Danilo, @Dave, @Sima
> would it be OK if we add kunit tests for the scheduler to DRM that
> cause leaks until we can fix them?

It is indeed a bit philosophical. I'd say only if there is a 100% 
agreement that drm_sched_fini should be able to clean up, or drive 
cleaning up, all driver state. And if we are prepared to handle a 
permanently failing test from now to some future date when this would be 
implemented.

I have a similar conundrum with set priority, where I was contemplating 
to add a permanently failing test showing how that does not fully work, 
and then get improved with my deadline scheduling series.

On the other side of the argument is the past experience of CI systems 
generally not coping well with permanently failing test. Eventually they 
succumb to the pressure to remove them due noisy results. Therefore 
other option is to have the mock scheduler adhere to the current 
implementation and only change it once the DRM scheduler rules change.

Regards,

Tvrtko

