Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E17A0556D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744BE10E137;
	Wed,  8 Jan 2025 08:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DQjRw+tE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D5B10E137
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736325256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUCNfIATTCft11P5a3cKgFd10UqFxNRZN61+ZQzVkjs=;
 b=DQjRw+tE0Ox4zGETcBcOvEgyAEj0o0MGZGfeJxMLggC9gU7ITtlUPjjtZFnz9/WnoOBveP
 bBxa0ro0TTWb48o+sts0MV5/BcooSnBGMINKp8MsO7lCjT+fiCZxWtMGPfeKP1fduJo9Vy
 EngYUer3nGP8BO0ElKV93N7RsRUX9+Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-3rVfYekrNVy2jgYvnlVc0w-1; Wed, 08 Jan 2025 03:34:15 -0500
X-MC-Unique: 3rVfYekrNVy2jgYvnlVc0w-1
X-Mimecast-MFC-AGG-ID: 3rVfYekrNVy2jgYvnlVc0w
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so3959071f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 00:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736325254; x=1736930054;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUCNfIATTCft11P5a3cKgFd10UqFxNRZN61+ZQzVkjs=;
 b=KOemVgWurFYrVD+oeRijKKwiMu1CDylXw669XBOw6RUzIRjIM2MUS7oFsGiPOYSnnc
 T8zm3jRuFCeJzE3N0QvP0QaZ2xtq5axd/upSjN5nUMmmgWFMAwaAdTn608MPkake3kGM
 ESkQ9ygbO9IyYuO1HCQ2MfqhZee0glcyhyVnoe79eRHjjaJsSW+Hw/Eds8cP5qhOFttr
 eQdbjl9mpY+0AaejNWnXq5zPzLQntODENkwZb5kiiOIYO5KnroqgKK6D/68fnenLeceV
 Je5maEjYV8kq6vLaEPrxV/c9xL+30trZt4QHJ0R6Pnh8ZpJtq+BnN/J78uqZZMv7cTBS
 tJHg==
X-Gm-Message-State: AOJu0YzK+CgbbgBHA6SBuhvaYSViksRSpsoXzSvycxveseO0s3Sbi9pH
 fT/h/B7i3/cOlmn1y5WNvoNr7V90jGz7YiVicnltg8L/7ny7b2pXXRhsaqBwAbS1KDI7CjWBbzu
 L8RcPB/apQLmZSFA3YB4sLBCyEjP0TiWLZ/8YdI0Xz1l/Idto0tz7UVa1Di++ptelxw==
X-Gm-Gg: ASbGncsQywFr42jY/eqLYGm5sygHl4Az/FGzWZOVFl57h57h5XkKun4xlQqd1mF2WiQ
 8ovw0Gut1jBs45Izzg56ziNnOBGpw6jsrVLUM+TZEbnSv7DHi3lseshmk2duovgKUOAhXToDvsS
 Ye3SLjvfkv1hik0Cio9wSySVtURsnIG49gKoeYd4UeTxU28ujGuyR+Zb7LHDpSYhp6tA3WyMM+9
 6Iq6lNVWRIW9Ng3rhZGtOGi8A2KcimGU12xqwtRX7ReVg==
X-Received: by 2002:a05:6000:144d:b0:38a:615b:9ec0 with SMTP id
 ffacd0b85a97d-38a873122edmr1308354f8f.54.1736325253988; 
 Wed, 08 Jan 2025 00:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyHcjppTJtVQxI7hismTNaCjQxyM2yu2MViYbBdFavwbNmUGHOSFIgNjec+ugsZICTr8zGXA==
X-Received: by 2002:a05:6000:144d:b0:38a:615b:9ec0 with SMTP id
 ffacd0b85a97d-38a873122edmr1308312f8f.54.1736325253370; 
 Wed, 08 Jan 2025 00:34:13 -0800 (PST)
Received: from pollux ([2a00:79c0:618:8300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc24aasm12838435e9.16.2025.01.08.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:34:12 -0800 (PST)
Date: Wed, 8 Jan 2025 09:34:11 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC 01/14] drm/sched: Delete unused update_job_credits
Message-ID: <Z344gwtwvqdXW1N_@pollux>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-2-tursulin@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20241230165259.95855-2-tursulin@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TdfLKq7-USIf1EadrS-97thegxme5D8SIgKCxGNLGfo_1736325254
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Mon, Dec 30, 2024 at 04:52:46PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> No driver is using the update_job_credits() schduler vfunc
> so lets remove it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

(+ Boris)

AFAIR the panthor folks asked for this. I assume they never actually ended up
using it? Unless they plan to use it,

Acked-by: Danilo Krummrich <dakr@kernel.org>

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
>  include/drm/gpu_scheduler.h            | 13 -------------
>  2 files changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74c..1734c17aeea5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -64,12 +64,6 @@
>   * credit limit, the job won't be executed. Instead, the scheduler will wait
>   * until the credit count has decreased enough to not overflow its credit limit.
>   * This implies waiting for previously executed jobs.
> - *
> - * Optionally, drivers may register a callback (update_job_credits) provided by
> - * struct drm_sched_backend_ops to update the job's credits dynamically. The
> - * scheduler executes this callback every time the scheduler considers a job for
> - * execution and subsequently checks whether the job fits the scheduler's credit
> - * limit.
>   */
>  
>  #include <linux/wait.h>
> @@ -133,13 +127,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>  	if (!s_job)
>  		return false;
>  
> -	if (sched->ops->update_job_credits) {
> -		s_job->credits = sched->ops->update_job_credits(s_job);
> -
> -		drm_WARN(sched, !s_job->credits,
> -			 "Jobs with zero credits bypass job-flow control.\n");
> -	}
> -
>  	/* If a job exceeds the credit limit, truncate it to the credit limit
>  	 * itself to guarantee forward progress.
>  	 */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..e2e6af8849c6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -476,19 +476,6 @@ struct drm_sched_backend_ops {
>           * and it's time to clean it up.
>  	 */
>  	void (*free_job)(struct drm_sched_job *sched_job);
> -
> -	/**
> -	 * @update_job_credits: Called when the scheduler is considering this
> -	 * job for execution.
> -	 *
> -	 * This callback returns the number of credits the job would take if
> -	 * pushed to the hardware. Drivers may use this to dynamically update
> -	 * the job's credit count. For instance, deduct the number of credits
> -	 * for already signalled native fences.
> -	 *
> -	 * This callback is optional.
> -	 */
> -	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>  };
>  
>  /**
> -- 
> 2.47.1
> 

