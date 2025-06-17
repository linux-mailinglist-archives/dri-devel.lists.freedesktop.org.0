Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A3ADCE38
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2810E6FE;
	Tue, 17 Jun 2025 13:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gKvAnqHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A9F10E6FE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 13:51:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso51699195e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750168296; x=1750773096; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLXhTtOfStKj2eC1LsdyW0wCGCB6laJXoX9t5eau+jI=;
 b=gKvAnqHSYOrfV6PK50WsV4rng3U573CFYVti/Y+pmHoSFQRfK6vO4PQFCtEZgaUAGM
 UhpOKVg6b0MDwG1dVvcWduWSMOeWgQCpU/3HBS8NVx2o4K02MWas4/7MHT17atEtzKT8
 vrN6r621YqivYvl0oYZriZolNNOGeQaDmOPyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750168296; x=1750773096;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLXhTtOfStKj2eC1LsdyW0wCGCB6laJXoX9t5eau+jI=;
 b=Flmc6n9fkEnck60Ae7/B6R6xvag6t++rEct17snGUP7aaX3aIaOvv1kzmIdkVT0g6T
 S1zkKGorZZIj+UBeitBl8Sq0/oPjOButgRuEgmxVS+fmkvw5LkIbcfsGA4mmRK9XKkM0
 7WYVMLXRdqRvlAPqq+aCHoAA4qS5joRtRRYfaknh/J1CVBvMJyA98OvgmRR/JzO4YpXa
 TNDh6ld6Kd1qTnRxJVmt2XeW4413d1Nifgyw2g5F8ApgeLFXAZFy/VBRmSyg3EZrphpZ
 NgaP/kdudutptAobO2gVFkip2UmhTkYP0gtR/ojuQ3S5CkWhHaGiGkI1/Xmb3HgNbUBO
 exiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsOCE6NntJha3avAhzeaTrzYwFiKdYp7rgQ+Dc5Nl6YMQQhpR/WOZtf85w7uXaUcGg26xz19lRpzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDyhblaxrrjIa1iXmTNHFoteU9/Kbc1EUeAiiKpWEXYEaEW2B3
 bA23iC5yk8bJQ4FkPvw4Rj8Epr+1nZ1QEdKNeFujxDokLxPggdjOyJss1Azhf4E6C5Y=
X-Gm-Gg: ASbGncsGCjXImaShH/hZWeGHFBz4jG0AGQTnIuOGM0156FYkwAjQ93vmCoQPC+QxtX4
 nT0JlXC5wDbdJ3rwX+uJkxD8l3kgiwRyrnd8+UsS2IznTq3IpU7tdy2KIOC1T9nzFfmtMO1170t
 wuexns577ujjMDp1LIZS62kBeOgzhWzEtp+jz7rsKZTqXLPDnel33yYhGZGBzg7qLTDfSIeYFFd
 xdHSqMPn/JRFg1ocflc6LaMdkWdK2LHx25ULV9R+T9fAHhOdalK/IsZPVzpnKkiqS6FQVnqit2r
 I4xp68fDaAwMBLryCYM5aa6O65PRJ2G9DkQ7KvXkeSnNDlEUtruRnJbRwO2MORJyC2H+9ZuBJzS
 +qpXjyIYP
X-Google-Smtp-Source: AGHT+IEDx6P5Ycl1fIaLGR9RgPbJefLoQic5m5rNUrSSRipnf+hsWSeOMCWcv3wmed2lXFj2gNwIRg==
X-Received: by 2002:a05:6000:2382:b0:3a5:2ef8:34f0 with SMTP id
 ffacd0b85a97d-3a57237dba4mr10699489f8f.22.1750168295960; 
 Tue, 17 Jun 2025 06:51:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54e71sm13873326f8f.1.2025.06.17.06.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 06:51:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:51:33 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFFy5aG1eOeMU44S@phenom.ffwll.local>
Mail-Followup-To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250612144953.111829-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612144953.111829-2-phasta@kernel.org>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> struct drm_sched_init_args provides the possibility of letting the
> scheduler use user-controlled workqueues, instead of the scheduler
> creating its own workqueues. It's currently not documented who would
> want to use that.
> 
> Not sharing the submit_wq between driver and scheduler has the advantage
> of no negative intereference between them being able to occur (e.g.,
> MMU notifier callbacks waiting for fences to get signaled).
> 
> Add a new docu section for concurrency in drm/sched.
> 
> Discourage the usage of own workqueues in the documentation. Document
> when using them can make sense. Warn about pitfalls.
> 
> Co-authored-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Add new docu section for concurrency in the scheduler. (Sima)
>   - Document what an ordered workqueue passed to the scheduler can be
>     useful for. (Christian, Sima)
>   - Warn more detailed about potential deadlocks. (Danilo)
> ---
>  include/drm/gpu_scheduler.h | 54 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 81dcbfc8c223..00c528e62485 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -21,6 +21,49 @@
>   *
>   */
>  
> +/**
> + * DOC: Concurrency in drm/sched

You need to explicitly pull this into the .rst files somewhere suitable,
otherwise it wont show up in the docs. With that please also check that
the hyperlinks all work.

> + *
> + * The DRM GPU Scheduler interacts with drivers through the callbacks defined in
> + * &struct drm_sched_backend_ops. These callbacks can be invoked by the scheduler
> + * at any point in time if not stated otherwise explicitly in the callback
> + * documentation.
> + *
> + * For most use cases, passing the recommended default parameters in &struct
> + * drm_sched_init_args is sufficient. There are some special circumstances,
> + * though:
> + *
> + * For timeout handling, it makes a lot of sense for drivers with HARDWARE
> + * scheduling to have the timeouts (e.g., for different hardware rings) occur
> + * sequentially, for example to allow for detecting which job timedout first
> + * and, therefore, caused the hang. Thereby, it is determined which &struct
> + * drm_sched_entity has to be killed and which entities' jobs must be
> + * resubmitted after a GPU reset.
> + *
> + * This can be achieved by passing an ordered workqueue in &struct
> + * drm_sched_init_args.timeout_wq. Also take a look at the documentation of
> + * &struct drm_sched_backend_ops.timedout_job.

So the main use-case for this is when the reset domain is bigger than a
single engine, and you don't want to deal with the mess of inventing your
own synchronization primitives.

I'm not exactly clear what hardware scheduling scenario you're thinking of
here that needs an ordered timeout queue that's shared across instances.

Note that an ordered timeout queue for a single scheduler is fairly
pointless, because we only ever have one pending timeout handler (at least
I thought that's how it works).

> + * Furthermore, for drivers with hardware that supports FIRMWARE scheduling,

I'm not sure you need a firmware scheduler to make this useful, just that
firmware scheduler submit rings tend to be one case where this is a good
locking design. I'd put this at the end as a concrete example instead and
explain why (you already have a single submit ringbuffer, parallelism in
the kernel doesn't serve a point aside from making locking more complex).

> + * the driver design can be simplified a bit by providing one ordered workqueue
> + * for both &struct drm_sched_init_args.timeout_wq and
> + * &struct drm_sched_init_args.submit_wq. Reason being that firmware schedulers
> + * should always have one scheduler instance per firmware runqueue and one
> + * entity per scheduler instance. If that scheduler instance then shares one
> + * ordered workqueue with the driver, locking can be very lightweight or
> + * dropped alltogether.
> + *
> + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> + * least one of them does not execute operations that may block on dma_fences
> + * that potentially make progress through this scheduler instance. Otherwise,
> + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> + * can only make progress through this schduler instance), while the
> + * scheduler's queued work waits for at least one of the max_active tasks to
> + * finish. Thus, this can result in a deadlock.

Uh if you have an ordered wq you deadlock with just one misuse. I'd just
explain that the wq must provide sufficient forward-progress guarantees
for the scheduler, specifically that it's on the dma_fence signalling
critical path and leave the concrete examples for people to figure out
when the design a specific locking scheme.

> + */
> +
>  #ifndef _DRM_GPU_SCHEDULER_H_
>  #define _DRM_GPU_SCHEDULER_H_
>  
> @@ -499,7 +542,7 @@ struct drm_sched_backend_ops {
>  	 * timeout handlers of different schedulers. One way to achieve this
>  	 * synchronization is to create an ordered workqueue (using
>  	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> -	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * in &struct drm_sched_init_args.timeout_wq. This will guarantee
>  	 * that timeout handlers are executed sequentially.
>  	 *
>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> @@ -590,14 +633,19 @@ struct drm_gpu_scheduler {
>   *
>   * @ops: backend operations provided by the driver
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> - *	       allocated and used.
> + *	       allocated and used. It is recommended to pass NULL unless there
> + *	       is a good reason not to. For details, see &DOC: Concurrency in
> + *	       drm/sched.

Does this really link?

>   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
>   *	     as there's usually one run-queue per priority, but may be less.
>   * @credit_limit: the number of credits this scheduler can hold from all jobs
>   * @hang_limit: number of times to allow a job to hang before dropping it.
>   *		This mechanism is DEPRECATED. Set it to 0.
>   * @timeout: timeout value in jiffies for submitted jobs.
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used. An ordered workqueue could be passed to achieve timeout
> + *		synchronization. See &DOC: Concurreny in drm/sched and &struct

Same question about linking ...

Might just put a note in the text section below about concurrency design
questions instead of trying to squeeze these in here.

Cheers, Sima

> + *		drm_sched_backend_ops.timedout_job.
>   * @score: score atomic shared with other schedulers. May be NULL.
>   * @name: name (typically the driver's name). Used for debugging
>   * @dev: associated device. Used for debugging
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
