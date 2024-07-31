Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD8943741
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285A10E2A8;
	Wed, 31 Jul 2024 20:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Turke+N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E1510E2A8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:43:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-36841f56cf6so760601f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722458606; x=1723063406; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dbtIzxq68iKu7Lf+VHFt+gs7By2cw/9RG0X5jJY4Z7c=;
 b=Turke+N2CqkNDliUnjBNzwtdLnrTz1xUgJHGP3H99fRZMk6GLljWKuMrk4W+IJeYCt
 2EDiVYv2Kvp/+7kexYjyBFmQy9SzA4DvHMlVUmRB1ksvYQ7D+yKMm5H2uRSg6oyEekQw
 7vyjCN5zc25VmZl2s11XOSItr2oYzSOH04Nb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722458606; x=1723063406;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dbtIzxq68iKu7Lf+VHFt+gs7By2cw/9RG0X5jJY4Z7c=;
 b=faWY/q8jBFOKScwRFIEiWHW2wrS4MgQ5K4pP+VfaQYC91ddHf67JBJnAUnEtJYPpN7
 Ic37ERX2QsYJIdPWx8YHu3VIlrmqzDO0lLGIjhCZv9j3i3K9pa7P+Yfmqkue2mTG844Y
 b9CFda1osw5xo+LZ0YYLn5OdiZI3UBWjx8hCGbWDOL90FonhiKs4XMOE26A1sEkiJkk/
 d3UjJtCnnYmvieZ9sR/5JWzeHW3qbC4sLDTczjTYmJ8T4wrZmRZe9ON1frZR9S/u/jmB
 lRfNuH8dWXy6caxzoK38E/HZJmHTR/nixy2BFfx5fptBzIbWoN1ZNAkdKS6zSIBoI7Q+
 iaMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8kjtwAaocMXlB0d0Q8nm3UtcVkI1Tsjo6fXWZwuxEeblMGy1eDsbeyg18PBDR/cd4PCUaK+QdCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdFsmMv4wolBo/VImbP/dRlslk2OR1uuyZKQomUQFnAPL4dVRy
 sBc8nBcxOe23FraduI/LYmODjYts5Tu7olqT63k0Le1R/z8QFpxU68f5Zk6qbUE=
X-Google-Smtp-Source: AGHT+IEjPcis9ddGUYBY75fHnP67bhyTyKXh9hbclbef/OrwRL6IyWSpucYr7JEWrshd3AcjZbFAOw==
X-Received: by 2002:a5d:5f53:0:b0:368:aa2:2b4e with SMTP id
 ffacd0b85a97d-36baaddca85mr181631f8f.4.1722458605400; 
 Wed, 31 Jul 2024 13:43:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c0338sm18094752f8f.1.2024.07.31.13.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 13:43:24 -0700 (PDT)
Date: Wed, 31 Jul 2024 22:43:22 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 jesse.zhang@amd.com, vitaly.prosyak@amd.com
Subject: Re: [PATCH] drm/sched: add optional errno to drm_sched_start()
Message-ID: <Zqqh6o4asq2FPKsS@phenom.ffwll.local>
References: <20240726075550.1511-1-christian.koenig@amd.com>
 <ZqOw8URrWjr9RN7A@phenom.ffwll.local>
 <5c634b9f-5b93-4faa-b939-a370ba0d41fd@gmail.com>
 <ZqimKxfJ947B3tZR@phenom.ffwll.local>
 <134cd07f-cdaa-426a-9184-e40c31fd6558@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <134cd07f-cdaa-426a-9184-e40c31fd6558@gmail.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Tue, Jul 30, 2024 at 02:06:08PM +0200, Christian König wrote:
> Am 30.07.24 um 10:36 schrieb Daniel Vetter:
> > > In the end you have a really nice circle dependency.
> > Maybe a follow up, so for arb robustness or vk context where we want the
> > context to die and refuse to accept any more jobs: We can get at that
> > error somehow? I think that's really the only worry I have with a job
> > error approach for all this ...
> 
> See drm_sched_entity_error(). The idea is that the driver uses this function
> in two ways:

Ah that's the other piece I missed ...

> 1. In it's prepare callback so that when one submission fails all following
> from the same ctx are marked with an error number as well.
> 
> This is intentionally done in a driver callback so that driver decides if
> they want subsequent submissions to fail or not. That can be helpful for
> example for in kernel paging queues where submissions don't depend on each
> other and a failed submission shouldn't cancel all following.
> 
> For an example see amdgpu_job_prepare_job().
> 
> 2. In it's submission IOCTL to reject new submissions and inform userspace
> that it needs to kick of some error handling.

Would be good to add that to the docs, I think just one sentence in the
drm_sched_start should fish out the errno with drm_sched_entity_error()
would have avoided my confusion.

Plus I think your above text would make a good addition to the kerneldoc
for drm_sched_entity_error() itself.

Cheers, Sima

> 
> Cheers,
> Christian.
> 
> > 
> > > > If we really want to stuff this into per-job fences then I think we should
> > > > at least try to document this mess in the sync_file uapi, for a bit of
> > > > consistency.
> > > Good point. Going to add some documentation.
> > Sounds good.
> > 
> > Cheers, Sima
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > But yeah without the full picture no idea really what we want here.
> > > > -Sima
> > > > 
> > > > > ---
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
> > > > >    drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
> > > > >    drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
> > > > >    drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
> > > > >    drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
> > > > >    drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
> > > > >    drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
> > > > >    drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
> > > > >    drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
> > > > >    include/drm/gpu_scheduler.h                         | 2 +-
> > > > >    11 files changed, 17 insertions(+), 16 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > > index 2320df51c914..18135d8235f9 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > > @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
> > > > >    			if (r)
> > > > >    				goto out;
> > > > >    		} else {
> > > > > -			drm_sched_start(&ring->sched);
> > > > > +			drm_sched_start(&ring->sched, 0);
> > > > >    		}
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > index c186fdb198ad..861827deb03f 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> > > > >    			if (!amdgpu_ring_sched_ready(ring))
> > > > >    				continue;
> > > > > -			drm_sched_start(&ring->sched);
> > > > > +			drm_sched_start(&ring->sched, 0);
> > > > >    		}
> > > > >    		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
> > > > > @@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
> > > > >    		if (!amdgpu_ring_sched_ready(ring))
> > > > >    			continue;
> > > > > -		drm_sched_start(&ring->sched);
> > > > > +		drm_sched_start(&ring->sched, 0);
> > > > >    	}
> > > > >    	amdgpu_device_unset_mp1_state(adev);
> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > index c53641aa146f..2c8666f8ec4a 100644
> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > @@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
> > > > >    	drm_sched_resubmit_jobs(&gpu->sched);
> > > > > -	drm_sched_start(&gpu->sched);
> > > > > +	drm_sched_start(&gpu->sched, 0);
> > > > >    	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > >    out_no_timeout:
> > > > >    	/* restart scheduler after GPU is usable again */
> > > > > -	drm_sched_start(&gpu->sched);
> > > > > +	drm_sched_start(&gpu->sched, 0);
> > > > >    	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > > index 20cb46012082..c4f08432882b 100644
> > > > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > > @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
> > > > >    		}
> > > > >    	}
> > > > > -	drm_sched_start(&queue->scheduler);
> > > > > +	drm_sched_start(&queue->scheduler, 0);
> > > > >    }
> > > > >    /**
> > > > > @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
> > > > >    	}
> > > > >    	mutex_unlock(&pvr_dev->queues.lock);
> > > > > -	drm_sched_start(sched);
> > > > > +	drm_sched_start(sched, 0);
> > > > >    	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > > > > index 1a944edb6ddc..b40c90e97d7e 100644
> > > > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > > > @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
> > > > >    	lima_pm_idle(ldev);
> > > > >    	drm_sched_resubmit_jobs(&pipe->base);
> > > > > -	drm_sched_start(&pipe->base);
> > > > > +	drm_sched_start(&pipe->base, 0);
> > > > >    	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > index eb6c3f9a01f5..4412f2711fb5 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> > > > >    	else
> > > > >    		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
> > > > > -	drm_sched_start(sched);
> > > > > +	drm_sched_start(sched, 0);
> > > > >    	return stat;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > index df49d37d0e7e..d140800606bf 100644
> > > > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
> > > > >    	/* Restart the schedulers */
> > > > >    	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > > > > -		drm_sched_start(&pfdev->js->queue[i].sched);
> > > > > +		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> > > > >    	/* Re-enable job interrupts now that everything has been restarted. */
> > > > >    	job_write(pfdev, JOB_INT_MASK,
> > > > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > > index d47972806d50..e630cdf47f99 100644
> > > > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > > @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
> > > > >    static void panthor_vm_start(struct panthor_vm *vm)
> > > > >    {
> > > > > -	drm_sched_start(&vm->sched);
> > > > > +	drm_sched_start(&vm->sched, 0);
> > > > >    }
> > > > >    /**
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index ab53ab486fe6..f093616fe53c 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> > > > >     * drm_sched_start - recover jobs after a reset
> > > > >     *
> > > > >     * @sched: scheduler instance
> > > > > + * @errno: error to set on the pending fences
> > > > >     *
> > > > >     */
> > > > > -void drm_sched_start(struct drm_gpu_scheduler *sched)
> > > > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> > > > >    {
> > > > >    	struct drm_sched_job *s_job, *tmp;
> > > > > @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
> > > > >    		atomic_add(s_job->credits, &sched->credit_count);
> > > > >    		if (!fence) {
> > > > > -			drm_sched_job_done(s_job, -ECANCELED);
> > > > > +			drm_sched_job_done(s_job, errno ?: -ECANCELED);
> > > > >    			continue;
> > > > >    		}
> > > > >    		if (dma_fence_add_callback(fence, &s_job->cb,
> > > > >    					   drm_sched_job_done_cb))
> > > > > -			drm_sched_job_done(s_job, fence->error);
> > > > > +			drm_sched_job_done(s_job, fence->error ?: errno);
> > > > >    	}
> > > > >    	drm_sched_start_timeout_unlocked(sched);
> > > > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > > > > index 42d4f4a2dba2..cac02284cd19 100644
> > > > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > > > @@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
> > > > >    	/* Unblock schedulers and restart their jobs. */
> > > > >    	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> > > > > -		drm_sched_start(&v3d->queue[q].sched);
> > > > > +		drm_sched_start(&v3d->queue[q].sched, 0);
> > > > >    	}
> > > > >    	mutex_unlock(&v3d->reset_lock);
> > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > index fe8edb917360..a8d19b10f9b8 100644
> > > > > --- a/include/drm/gpu_scheduler.h
> > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > > > > -void drm_sched_start(struct drm_gpu_scheduler *sched);
> > > > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
> > > > >    void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_increase_karma(struct drm_sched_job *bad);
> > > > >    void drm_sched_reset_karma(struct drm_sched_job *bad);
> > > > > -- 
> > > > > 2.34.1
> > > > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
