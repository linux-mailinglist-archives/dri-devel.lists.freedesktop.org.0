Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B9984462
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062CC10E190;
	Tue, 24 Sep 2024 11:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XehuSMoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF0410E190
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:18:29 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso685224366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727176708; x=1727781508; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBEch0azTOLB+K5PImcfayyDDLkhHgJGTF9Ms6rW8VM=;
 b=XehuSMozDn234mPY7E6ThpkVghqASeojjmOBwW02j6mhH9cZMUHRCT6222iM3ZEcU3
 aYgO6OLGW86aYB4ANj80g+eOR6ZQ7pZjdo47hQ2rcRSnnFSMjbZi/T2vm+uyauVpOCi9
 0vj5D2XbL9duiKGKzHTk7S4rcuVczeOtlX1YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727176708; x=1727781508;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OBEch0azTOLB+K5PImcfayyDDLkhHgJGTF9Ms6rW8VM=;
 b=MHIvy2cQTT8Luv9tIEPPGvNXerJuLHnjJ32mQSQUKrvIQw0ntMr6DozxfxDJN+IZNc
 GbsSZaDW1zxipFOGJ/mmiKriqcEysSKz3JY+2WrTtgYm6hDX8pNzwerMQFCzrKha80kk
 OQYRpblICCo3SNS7wJXKunsGYkQh9UYK8ucRvw6fwZ5CPbrgEn8w32JwcXOVgPk0dKnT
 C5ipcekvPwiVLmFZb+FpkCzQuL9NXE90n84UeRXhvnrPOb+WSVG72/AyQR0YRVRpDexa
 Auy7lk2OYtRm57N3d0qMeAgUyUS074xJ9PnvJfWhuv2WdX3PMZckoGE1lLpUiaoOOmFu
 koIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuUdBX8+F5s+uXLXVMLfJzaHSjUx061e61lywr/rNG5YFY21Zu+QBBwjRXHETaEJRvRVyB7jzoQsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOpKH+pc1XBzb5kmN6QjQ0CGrS6hovj8Jj1y5DzZ8m8qeV9DR1
 4F/lgDa9B8yASkDaOoHCioXmqzAcPbRoQ3rn4cg3huJAreC3A7i4q/9A+6fimsE=
X-Google-Smtp-Source: AGHT+IHCEWkujl5DVylgZ6xnA6wMko7KEwHKfluVapn56x+/XaI4xw6gHEeLlUWd6riN2D6QjflJLw==
X-Received: by 2002:a17:907:2687:b0:a8d:5f69:c854 with SMTP id
 a640c23a62f3a-a90d56df97fmr1216987566b.24.1727176707649; 
 Tue, 24 Sep 2024 04:18:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7860sm72659966b.149.2024.09.24.04.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:18:26 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:18:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Philipp Stanner <pstanner@redhat.com>, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Message-ID: <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian König wrote:
> Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
> > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > On Wed, 2024-09-18 at 15:39 +0200, Christian König wrote:
> > > > > Tearing down the scheduler with jobs still on the pending list
> > > > > can
> > > > > lead to use after free issues. Add a warning if drivers try to
> > > > > destroy a scheduler which still has work pushed to the HW.
> > > > Did you have time yet to look into my proposed waitque-solution?
> > > I don't remember seeing anything. What have I missed?
> > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
> 
> Mhm, I didn't got that in my inbox for some reason.
> 
> Interesting approach, I'm just not sure if we can or should wait in
> drm_sched_fini().
> 
> Probably better to make that a separate function, something like
> drm_sched_flush() or similar.

Yeah I don't think we should smash this into drm_sched_fini
unconditionally. I think conceptually there's about three cases:

- Ringbuffer schedules. Probably want everything as-is, because
  drm_sched_fini is called long after all the entities are gone in
  drm_device cleanup.

- fw scheduler hardware with preemption support. There we probably want to
  nuke the context by setting the tdr timeout to zero (or maybe just as
  long as context preemption takes to be efficient), and relying on the
  normal gpu reset flow to handle things. drm_sched_entity_flush kinda
  does this, except not really and it's a lot more focused on the
  ringbuffer context. So maybe we want a new drm_sched_entity_kill.

  For this case calling drm_sched_fini() after the 1:1 entity is gone
  should not find any linger jobs, it would actually be a bug somewhere if
  there's a job lingering. Maybe a sanity check that there's not just no
  jobs lingering, but also no entity left would be good here?

- fw scheduler without preemption support. There we kinda need the
  drm_sched_flush, except blocking in fops->close is not great. So instead
  I think the following is better:
  1. drm_sched_entity_stopped, which only stops new submissions (for
  paranoia) but doesn't tear down the entity
  2. drm_dev_get
  3. launch a worker which does a) drm_sched_flush (or
  drm_sched_entity_flush or whatever we call it) b) drm_sched_entity_fini
  + drm_sched_fini c) drm_dev_put

  Note that semantically this implements the refcount in the other path
  from Phillip:

  https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
  
  Except it doesn't impose refcount on everyone else who doesn't need it,
  and it doesn't even impose refcounting on drivers that do need it
  because we use drm_sched_flush and a worker to achieve the same.

Essentially helper functions for the common use-cases instead of trying to
solve them all by putting drm_sched_flush as a potentially very blocking
function into drm_sched_fini.


> > > > > When there are still entities with jobs the situation is even
> > > > > worse
> > > > > since the dma_fences for those jobs can never signal we can just
> > > > > choose between potentially locking up core memory management and
> > > > > random memory corruption. When drivers really mess it up that
> > > > > well
> > > > > let them run into a BUG_ON().
> > > > > 
> > > > > Signed-off-by: Christian König<christian.koenig@amd.com>
> > > > > ---
> > > > >    drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
> > > > >    1 file changed, 18 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
> > > > > drm_gpu_scheduler
> > > > > *sched)
> > > > I agree with Sima that it should first be documented in the
> > > > function's
> > > > docstring what the user is expected to have done before calling the
> > > > function.
> > > Good point, going to update the documentation as well.
> > Cool thing, thx.
> > Would be great if everything (not totally trivial) necessary to be done
> > before _fini() is mentioned.
> > 
> > One could also think about providing a hint at how the driver can do
> > that. AFAICS the only way for the driver to ensure that is to maintain
> > its own, separate list of submitted jobs.
> 
> Even with a duplicated pending list it's actually currently impossible to do
> this fully cleanly.
> 
> The problem is that the dma_fence object gives no guarantee when callbacks
> are processed, e.g. they can be both processed from interrupt context as
> well as from a CPU which called dma_fence_is_signaled().
> 
> So when a driver (or drm_sched_fini) waits for the last submitted fence it
> actually can be that the drm_sched object still needs to do some processing.
> See the hack in amdgpu_vm_tlb_seq() for more background on the problem.

So I thought this should be fairly easy because of the sched hw/public
fence split: If we wait for both all jobs to finish and for all the sched
work/tdr work to finish, and we make sure there's no entity existing
that's not yet stopped we should catch them all? Or at least I think it's
a bug if any other code even tries to touch the hw fence.

If you have any other driver code which relies on the rcu freeing then I
think that's just a separate concern and we can ignore that here since the
fences themselves will till get rcu-delay freed even if drm_sched_fini has
finished.
-Sima

> 
> Regards,
> Christian.
> 
> > 
> > P.
> > 
> > > Thanks,
> > > Christian.
> > > 
> > > > P.
> > > > 
> > > > >    	drm_sched_wqueue_stop(sched);
> > > > > +	/*
> > > > > +	 * Tearing down the scheduler wile there are still
> > > > > unprocessed jobs can
> > > > > +	 * lead to use after free issues in the scheduler fence.
> > > > > +	 */
> > > > > +	WARN_ON(!list_empty(&sched->pending_list));
> > > > > +
> > > > >    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > > > > i++)
> > > > > {
> > > > >    		struct drm_sched_rq *rq = sched->sched_rq[i];
> > > > >    		spin_lock(&rq->lock);
> > > > > -		list_for_each_entry(s_entity, &rq->entities,
> > > > > list)
> > > > > +		list_for_each_entry(s_entity, &rq->entities,
> > > > > list) {
> > > > > +			/*
> > > > > +			 * The justification for this BUG_ON()
> > > > > is
> > > > > that tearing
> > > > > +			 * down the scheduler while jobs are
> > > > > pending
> > > > > leaves
> > > > > +			 * dma_fences unsignaled. Since we have
> > > > > dependencies
> > > > > +			 * from the core memory management to
> > > > > eventually signal
> > > > > +			 * dma_fences this can trivially lead to
> > > > > a
> > > > > system wide
> > > > > +			 * stop because of a locked up memory
> > > > > management.
> > > > > +			 */
> > > > > +			BUG_ON(spsc_queue_count(&s_entity-
> > > > > > job_queue));
> > > > > +
> > > > >    			/*
> > > > >    			 * Prevents reinsertion and marks
> > > > > job_queue
> > > > > as idle,
> > > > >    			 * it will removed from rq in
> > > > > drm_sched_entity_fini
> > > > >    			 * eventually
> > > > >    			 */
> > > > >    			s_entity->stopped = true;
> > > > > +		}
> > > > >    		spin_unlock(&rq->lock);
> > > > >    		kfree(sched->sched_rq[i]);
> > > > >    	}

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
