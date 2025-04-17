Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AAA91F62
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4140610E2A2;
	Thu, 17 Apr 2025 14:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UwnBzE7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6210E2A2;
 Thu, 17 Apr 2025 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SrHLvNcniYohE8XO+5XRKCxxfp6aOiTWHwmdhysUG3Y=; b=UwnBzE7k6TePTiVU0Uf1b110ys
 mASwtReo6tJ3z9BNQAM6v1eddR8ss2JGtr8qZoWHBlsHRFavqSR46ZiW/+4AMKnmlFlvubvUigBSf
 pzF3klYWXB0Sg4RVBANpVJsUDZ5Cy3R3lsvC/womdbtnlMb4+CBW9nMLvJo+9dgFID/JwjDawHmy3
 QudsRAp/K0UkziM5EgXe97F6AuDSBcwicBsxNCA9N6TaX7zUrTZmdrdLbD2Go5gk2RpHhyFq2IBYb
 30OZpf2mWLliXXM60WJrxbCXMr06oJsIzSR0g9ICWlz0o+Boq26kcH4DBOn2c9w5Hh0vVdBTsSt1/
 pzx296AQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5Q6f-000qCP-Ta; Thu, 17 Apr 2025 16:20:45 +0200
Message-ID: <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
Date: Thu, 17 Apr 2025 15:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aADv4ivXZoJpEA7k@pollux>
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


On 17/04/2025 13:11, Danilo Krummrich wrote:
> On Thu, Apr 17, 2025 at 12:27:29PM +0100, Tvrtko Ursulin wrote:
>>
>> On 17/04/2025 08:45, Philipp Stanner wrote:
>>> On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
>>
>> Problem exactly is that jobs can outlive the entities and the scheduler,
>> while some userspace may have a dma fence reference to the job via sync
>> file. This new callback would not solve it for xe, but if everything
>> required was reference counted it would.
> 
> I think you're mixing up the job and the dma_fence here, if a job outlives the
> scheduler, it clearly is a bug, always has been.
> 
> AFAIK, Xe reference counts it's driver specific job structures *and* the driver
> specific scheduler structure, such that drm_sched_fini() won't be called before
> all jobs have finished.

Yes, sorry, dma fence. But it is not enough to postpone drm_sched_fini 
until the job is not finished. Problem is exported dma fence holds the 
pointer to drm_sched_fence (and so oopses in 
drm_sched_fence_get_timeline_name on fence->sched->name) *after* job had 
finished and driver was free to tear everything down.

That is what the "fini callback" wouldn't solve but reference counting 
would.

I don't see that any other driver which can export a fence couldn't 
suffer from the same problem, and even if I agree this maybe isn't 
strictly a scheduler problem, I cannot see it solvable without involving 
the scheduler, and in any other way than reference counting. And if 
reference counting could solve both problems then it feels attractive.

> The reference counting solution, however, potentially creates subsequent
> lifetime problems, which I think have been discussed already in a different
> thread already. Philipp can probably link in the corresponding discussion.

I don't doubt it causes problems but maybe there will be no other way 
than to tackle them.

>> On the design level it feels like it adds too much state machine and makes
>> things hard to follow/maintain. It would be nice to find a solutiuon where
>> we end up with less state machine and not more.
> 
> Multiple solutions have been discussed already, e.g. just wait for the pending
> list to be empty, reference count the scheduler for every pending job. Those all
> had significant downsides, which I don't see with this proposal.
> 
> I'm all for better ideas though -- what do you propose?

I think we need to brainstorm both issues and see if there is a solution 
which solves them both, with bonus points for being elegant.

Use after free is IMO even a worse problem so if reference counting is 
the only way then lets try that. But I will wait for those links to 
catch up on the past discussions.

>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 6b72278c4b72..ae3152beca14 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
>>>> *sched)
>>>>    	sched->ready = false;
>>>>    	kfree(sched->sched_rq);
>>>>    	sched->sched_rq = NULL;
>>>> +
>>>> +	if (!list_empty(&sched->pending_list))
>>>> +		dev_err(sched->dev, "%s: Tearing down scheduler
>>>> while jobs are pending!\n",
>>>> +			__func__);
>>
>> It isn't fair to add this error since it would out of the blue start firing
>> for everyone expect nouveau, no? Regardless if there is a leak or not.
> 
> I think it is pretty fair to warn when detecting a guaranteed bug, no?
> 
> If drm_sched_fini() is call while jobs are still on the pending_list, they won't
> ever be freed, because all workqueues are stopped.

Is it a guaranteed bug for drivers are aware of the drm_sched_fini() 
limitation and are cleaning up upon themselves?

In other words if you apply the series up to here would it trigger for 
nouveau? Reportedly it triggers for the mock scheduler which also has no 
leak.

Also, I asked in my initial reply if we have a list of which of the 
current drivers suffer from memory leaks. Is it all or some etc.

Regards,

Tvrtko

