Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EC940BC6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A510E245;
	Tue, 30 Jul 2024 08:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ccIhWE1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165510E245
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:37:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4281da2cdaeso1252445e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722328622; x=1722933422; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ow+puwHGmdaHZIzL9a6KRIQAYRVfYdGVg0gGFwnnSZU=;
 b=ccIhWE1xQn4SNnX+Z7UPf3/LgvOY69G6DpuFGsBdDYyhE5A4BXn1VJHBXamRjW/qT0
 T/tYqMev2np8LOUnlCNdhKXfcJ74hR0cxf0uc9NVFpR3mvrhuIPi6lvKgV5tfOUlN6Jf
 sXzwKzpWZNB6CYZd5kTHho7qVCRy/G9vmEiRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328622; x=1722933422;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ow+puwHGmdaHZIzL9a6KRIQAYRVfYdGVg0gGFwnnSZU=;
 b=bog5onEf6qCtfy+iLj7zV2WQWvE8qdj8mQgWHKzIpb+mQgZO2o3s+Uiltt+YF6shBf
 3HRsIqC1D2/fGnN1RbMHdHFmVCRRSVw8VtCqwebdkqNh9vCPI3CUhNDwPHqCmwpADng9
 oINDsUU+rR4kbB2wxu0NhPFgwqXJIfMX7ngcA8HhakOyYo2n2/QHIvy6ePdcquau4bGs
 vMffrhZTnfSmztU05TRCK+HZ2kxuFuroTPTlXIlVgMyhptLyfCaMiJk+b88qHcI+J6By
 fbM+F10fNhFs5hvjY8eyu4BK/Ik84E+w3ZoqSgBsYTAYVA1aM5ORKPRhhJ8x/yqHakLT
 zyBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5lKHN8qJfiFi/oOgM0STqgCd1qEnh24ZKeCAScUbjl6wIZYAd6AVaqtQo6fWOHq3FulpKxg0/94c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz/1zD3emqWW0CpdpkJrqTdaV8N52/c84Msfnk29jKxcon4ASb
 z3/+MTofexcUTPerh49z6FIm2Y9E+tjW5azfvNSeU+C2eClAY6tV3uLCVwVAskw=
X-Google-Smtp-Source: AGHT+IG2D99PNLC5nCqjZsFxd8+589Z5Rftq6NtOTm8MY02PJzGoU23DOP8PIklHFmPxK1cm9+n8zA==
X-Received: by 2002:a05:600c:138c:b0:424:8b08:26aa with SMTP id
 5b1f17b1804b1-428054f24c7mr70187995e9.3.1722328622034; 
 Tue, 30 Jul 2024 01:37:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281c701619sm72744275e9.36.2024.07.30.01.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:37:01 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:36:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 jesse.zhang@amd.com, vitaly.prosyak@amd.com
Subject: Re: [PATCH] drm/sched: add optional errno to drm_sched_start()
Message-ID: <ZqimKxfJ947B3tZR@phenom.ffwll.local>
References: <20240726075550.1511-1-christian.koenig@amd.com>
 <ZqOw8URrWjr9RN7A@phenom.ffwll.local>
 <5c634b9f-5b93-4faa-b939-a370ba0d41fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c634b9f-5b93-4faa-b939-a370ba0d41fd@gmail.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 29, 2024 at 08:43:05PM +0200, Christian König wrote:
> Am 26.07.24 um 16:21 schrieb Daniel Vetter:
> > On Fri, Jul 26, 2024 at 09:55:50AM +0200, Christian König wrote:
> > > The current implementation of drm_sched_start uses a hardcoded
> > > -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> > > This results in drm_sched_job_done being called with -ECANCELED for
> > > each job with a NULL parent in the pending list, making it difficult
> > > to distinguish between recovery methods, whether a queue reset or a
> > > full GPU reset was used.
> > > 
> > > To improve this, we first try a soft recovery for timeout jobs and
> > > use the error code -ENODATA. If soft recovery fails, we proceed with
> > > a queue reset, where the error code remains -ENODATA for the job.
> > > Finally, for a full GPU reset, we use error codes -ECANCELED or
> > > -ETIME. This patch adds an error code parameter to drm_sched_start,
> > > allowing us to differentiate between queue reset and GPU reset
> > > failures. This enables user mode and test applications to validate
> > > the expected correctness of the requested operation. After a
> > > successful queue reset, the only way to continue normal operation is
> > > to call drm_sched_job_done with the specific error code -ENODATA.
> > > 
> > > v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain
> > >      and amdgpu_device_unlock_reset_domain to allow user mode to track
> > >      the queue reset status and distinguish between queue reset and
> > >      GPU reset.
> > > v2: Christian suggested using the error codes -ENODATA for queue reset
> > >      and -ECANCELED or -ETIME for GPU reset, returned to
> > >      amdgpu_cs_wait_ioctl.
> > > v3: To meet the requirements, we introduce a new function
> > >      drm_sched_start_ex with an additional parameter to set
> > >      dma_fence_set_error, allowing us to handle the specific error
> > >      codes appropriately and dispose of bad jobs with the selected
> > >      error code depending on whether it was a queue reset or GPU reset.
> > > v4: Alex suggested using a new name, drm_sched_start_with_recovery_error,
> > >      which more accurately describes the function's purpose.
> > >      Additionally, it was recommended to add documentation details
> > >      about the new method.
> > > v5: Fixed declaration of new function drm_sched_start_with_recovery_error.(Alex)
> > > v6 (chk): rebase on upstream changes, cleanup the commit message,
> > >            drop the new function again and update all callers,
> > >            apply the errno also to scheduler fences with hw fences
> > > 
> > > Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> > > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Maybe I'm extremely missing the point, but it's kind hard to be sure
> > without the testcase/mesa side code too, but for gl robustness I don't
> > think this is enough, because you also need to know whether it was your
> > context or someone else that caused the gpu reset. Probably biased, but I
> > think the per-ctx guilty/reset counters is more then right code here. Or
> > something along those lines.
> 
> Exactly that ctx based approach blew up pretty nicely because it doesn't
> match the lifetime of the ctx.
> 
> On the one hand you don't want the ctx to outlive the file descriptor which
> it was created with since it points back to the fd, on the other hand when
> you need it for error handling you need to keep it around until all
> submissions are completed.

Why does the ctx need to point back to the fd? At least with the reset
stats query approach you only ever go from fd to ctx, not the other way
around. Going from ctx to fd is indeed all kinds of enormous fun and
really not great.

I guess the "jobs keep ctx alive" is the age old ctx refcounting fun, and
there's leaks involved if they outlive the fd in bad ways ... :-/

> In the end you have a really nice circle dependency.

Maybe a follow up, so for arb robustness or vk context where we want the
context to die and refuse to accept any more jobs: We can get at that
error somehow? I think that's really the only worry I have with a job
error approach for all this ...

> > If we really want to stuff this into per-job fences then I think we should
> > at least try to document this mess in the sync_file uapi, for a bit of
> > consistency.
> 
> Good point. Going to add some documentation.

Sounds good.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > But yeah without the full picture no idea really what we want here.
> > -Sima
> > 
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
> > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
> > >   drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
> > >   drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
> > >   drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
> > >   drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
> > >   drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
> > >   drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
> > >   drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
> > >   include/drm/gpu_scheduler.h                         | 2 +-
> > >   11 files changed, 17 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > index 2320df51c914..18135d8235f9 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
> > >   			if (r)
> > >   				goto out;
> > >   		} else {
> > > -			drm_sched_start(&ring->sched);
> > > +			drm_sched_start(&ring->sched, 0);
> > >   		}
> > >   	}
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index c186fdb198ad..861827deb03f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> > >   			if (!amdgpu_ring_sched_ready(ring))
> > >   				continue;
> > > -			drm_sched_start(&ring->sched);
> > > +			drm_sched_start(&ring->sched, 0);
> > >   		}
> > >   		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
> > > @@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
> > >   		if (!amdgpu_ring_sched_ready(ring))
> > >   			continue;
> > > -		drm_sched_start(&ring->sched);
> > > +		drm_sched_start(&ring->sched, 0);
> > >   	}
> > >   	amdgpu_device_unset_mp1_state(adev);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > index c53641aa146f..2c8666f8ec4a 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
> > >   	drm_sched_resubmit_jobs(&gpu->sched);
> > > -	drm_sched_start(&gpu->sched);
> > > +	drm_sched_start(&gpu->sched, 0);
> > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > >   out_no_timeout:
> > >   	/* restart scheduler after GPU is usable again */
> > > -	drm_sched_start(&gpu->sched);
> > > +	drm_sched_start(&gpu->sched, 0);
> > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > >   }
> > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> > > index 20cb46012082..c4f08432882b 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
> > >   		}
> > >   	}
> > > -	drm_sched_start(&queue->scheduler);
> > > +	drm_sched_start(&queue->scheduler, 0);
> > >   }
> > >   /**
> > > @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
> > >   	}
> > >   	mutex_unlock(&pvr_dev->queues.lock);
> > > -	drm_sched_start(sched);
> > > +	drm_sched_start(sched, 0);
> > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > >   }
> > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > > index 1a944edb6ddc..b40c90e97d7e 100644
> > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
> > >   	lima_pm_idle(ldev);
> > >   	drm_sched_resubmit_jobs(&pipe->base);
> > > -	drm_sched_start(&pipe->base);
> > > +	drm_sched_start(&pipe->base, 0);
> > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > >   }
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index eb6c3f9a01f5..4412f2711fb5 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> > >   	else
> > >   		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
> > > -	drm_sched_start(sched);
> > > +	drm_sched_start(sched, 0);
> > >   	return stat;
> > >   }
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > index df49d37d0e7e..d140800606bf 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
> > >   	/* Restart the schedulers */
> > >   	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > > -		drm_sched_start(&pfdev->js->queue[i].sched);
> > > +		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> > >   	/* Re-enable job interrupts now that everything has been restarted. */
> > >   	job_write(pfdev, JOB_INT_MASK,
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > index d47972806d50..e630cdf47f99 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
> > >   static void panthor_vm_start(struct panthor_vm *vm)
> > >   {
> > > -	drm_sched_start(&vm->sched);
> > > +	drm_sched_start(&vm->sched, 0);
> > >   }
> > >   /**
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index ab53ab486fe6..f093616fe53c 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> > >    * drm_sched_start - recover jobs after a reset
> > >    *
> > >    * @sched: scheduler instance
> > > + * @errno: error to set on the pending fences
> > >    *
> > >    */
> > > -void drm_sched_start(struct drm_gpu_scheduler *sched)
> > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> > >   {
> > >   	struct drm_sched_job *s_job, *tmp;
> > > @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
> > >   		atomic_add(s_job->credits, &sched->credit_count);
> > >   		if (!fence) {
> > > -			drm_sched_job_done(s_job, -ECANCELED);
> > > +			drm_sched_job_done(s_job, errno ?: -ECANCELED);
> > >   			continue;
> > >   		}
> > >   		if (dma_fence_add_callback(fence, &s_job->cb,
> > >   					   drm_sched_job_done_cb))
> > > -			drm_sched_job_done(s_job, fence->error);
> > > +			drm_sched_job_done(s_job, fence->error ?: errno);
> > >   	}
> > >   	drm_sched_start_timeout_unlocked(sched);
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index 42d4f4a2dba2..cac02284cd19 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
> > >   	/* Unblock schedulers and restart their jobs. */
> > >   	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> > > -		drm_sched_start(&v3d->queue[q].sched);
> > > +		drm_sched_start(&v3d->queue[q].sched, 0);
> > >   	}
> > >   	mutex_unlock(&v3d->reset_lock);
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index fe8edb917360..a8d19b10f9b8 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> > >   void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
> > >   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> > >   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > > -void drm_sched_start(struct drm_gpu_scheduler *sched);
> > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
> > >   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> > >   void drm_sched_increase_karma(struct drm_sched_job *bad);
> > >   void drm_sched_reset_karma(struct drm_sched_job *bad);
> > > -- 
> > > 2.34.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
