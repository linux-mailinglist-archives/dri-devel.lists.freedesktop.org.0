Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95BA92366
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5058410E322;
	Thu, 17 Apr 2025 17:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YA5/xeZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DF210E2DD;
 Thu, 17 Apr 2025 17:07:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D164A43C7F;
 Thu, 17 Apr 2025 17:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2DEC4CEE4;
 Thu, 17 Apr 2025 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744909625;
 bh=EFjpkODMkZIdidodBceqMj7D4h17MMcop8/qwhk6s1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YA5/xeZZXHwHkBlSQAWyyZiGi5Av43Isb+49QyyCyBOmjA/8bZ+OtGifWSRgg9403
 6UCX199+mJi69dpjZtn1q/2Tb+Ohz2V0TPakO24AfAXTb4SMc++fhuJcuNZODDQ/zL
 5kJOcfOjRvubVUKHTgSRQ5fa6TVOiKlRPGdecPWtIMcpGeU6F8DshCexgBm0hcYh3P
 ScAfzp1OApuwfk9nqu3xivAzWbqDleTfCBRVNc9z/F74EX/PnKxcxXTQbG4GrYVfy6
 6cr3Jt++dOgVIgbX0IQWV0sTZhWm2MV1hw9HMzbjMmY1CxclR8GD1H5jNYe/prqKK2
 8bzPNyQmtiLLQ==
Date: Thu, 17 Apr 2025 19:07:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAE1NL-OyDbnJfss@cassiopeiae>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
 <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
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

On Thu, Apr 17, 2025 at 05:08:12PM +0100, Tvrtko Ursulin wrote:
> To catch up on why if you could dig out the links to past discussions it
> would be helpful.

I can't look it up currently, sorry. That's why I said Philipp will loop you in
once he's back. :)

> I repeat how there is a lot of attractiveness to reference counting. Already
> mentioned memory leak, s_fence oops, and also not having to clear
> job->entity could be useful for things like tracking per entity submission
> stats (imagine CFS like scheduling, generic scheduling DRM cgroup
> controller). So it would be good for me to hear what pitfalls were
> identified in this space.

<snip>

> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index 6b72278c4b72..ae3152beca14 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > > > > > > *sched)
> > > > > > >     	sched->ready = false;
> > > > > > >     	kfree(sched->sched_rq);
> > > > > > >     	sched->sched_rq = NULL;
> > > > > > > +
> > > > > > > +	if (!list_empty(&sched->pending_list))
> > > > > > > +		dev_err(sched->dev, "%s: Tearing down scheduler
> > > > > > > while jobs are pending!\n",
> > > > > > > +			__func__);
> > > > > 
> > > > > It isn't fair to add this error since it would out of the blue start firing
> > > > > for everyone expect nouveau, no? Regardless if there is a leak or not.
> > > > 
> > > > I think it is pretty fair to warn when detecting a guaranteed bug, no?
> > > > 
> > > > If drm_sched_fini() is call while jobs are still on the pending_list, they won't
> > > > ever be freed, because all workqueues are stopped.
> > > 
> > > Is it a guaranteed bug for drivers are aware of the drm_sched_fini()
> > > limitation and are cleaning up upon themselves?
> > 
> > How could a driver clean up on itself (unless the driver holds its own list of
> > pending jobs)?
> > 
> > Once a job is in flight (i.e. it's on the pending_list) we must guarantee that
> > free_job() is called by the scheduler, which it can't do if we call
> > drm_sched_fini() before the pending_list is empty.
> > 
> > > In other words if you apply the series up to here would it trigger for
> > > nouveau?
> > 
> > No, because nouveau does something very stupid, i.e. replicate the pending_list.
> 
> Ah okay I see it now, it waits for all jobs to finish before calling
> drm_sched_fini(). For some reason I did not think it was doing that given
> the cover letter starts with how that is a big no-no.
> 
> > > Reportedly it triggers for the mock scheduler which also has no
> > > leak.
> > 
> > That sounds impossible. How do you ensure you do *not* leak memory when you tear
> > down the scheduler while it still has pending jobs? Or in other words, who calls
> > free_job() if not the scheduler itself?
> 
> Well the cover letter says it triggers so it is possible. :)

I mean it should be impossible to have jobs on the pending_list when calling
drm_sched_fini(), but not have memory leaks, unless you let the driver do weird
things, such as peeking into implementation details of the scheduler, etc.

> Mock scheduler also tracks the pending jobs itself, but different from
> nouveau it does not wait for jobs to finish and free worker to process them
> all, but having stopped the "hw" backend it cancels them and calls the
> free_job vfunc directly.

That seems very wrong to me. This is exactly what I mean with the driver peeks
into implementation details.

If the API of a component requires to know about and modify internals of the
component, it's pretty much broken and must be fixed.

> Going back to the topic of this series, if we go with a solution along the
> lines of the proposed, I wonder if it would be doable without mandating that
> drivers keep a list parallel to pending_list. Instead have a vfunc DRM
> scheduler would call to cancel job at a time from *its* pending list. It
> would go nicely together with prepare/run/timedout/free.

That's pretty much what this series does, no? With the new callback the driver
is supposed to kill the corresponding fence context, which signals all
associated fences and hence the pending list will clear subsequently.

> Would it allow getting rid of the new state machinery and just cancelling
> and freeing in one go directly from drm_sched_fini()?

Again, I think that's what it does, unless I misunderstand you.
