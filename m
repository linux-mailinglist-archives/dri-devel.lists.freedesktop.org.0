Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C6A077F9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF2510EDE0;
	Thu,  9 Jan 2025 13:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="xmWMGqN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF1810EDE0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:44:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso9837965e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736430277; x=1737035077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ypYU+D7GLRSD5sI3qSNi4VvY56rGppry2QtFbqjX3IY=;
 b=xmWMGqN65EpR8VySaNfiWWKXhcFxShUGXQDhDSb2xVHaPMTeIXc5x5Ln5p67ClV18x
 WjIZuPj4DfS7Gi57up3R1G4i9sqd2P4+yN6vJKuPVAfK58J0qf5tnmLiKARnJxWbjMSU
 vmP8WW9SGZjHp2Fdecc4Nx7ryysXRN24prcS1pBUkCjhUiRZKBNBPpP0YwuPvOWIYa3t
 5UQ6MKiP5pqHLv6adxq+1tl9pTPYj4u6dg5ESYsBhJTHMtFHBvxLStJo20QgJqZAXc8V
 BbecHDsD3GBX4i3rUUXpRju0lONq6Fp45GtqHpr8JnQi9AasEP1elDUrukQAL9cePmtA
 37IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736430277; x=1737035077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypYU+D7GLRSD5sI3qSNi4VvY56rGppry2QtFbqjX3IY=;
 b=bbOJ4MStNwSd+VKw0UHU+T7cJx+IuhybbXEHzaLnBFczWFEh6L9ZjToIghcgwTMq2k
 ND+sZW7KJPhzVflEHs7RrvhZ964F26y+P5mcjdZIscD446+0+JMu1Y0AmWAlmUrIzcrz
 tjJQtPIHjiU+cdZUfjGtbAfpyK3hrALHu3YQZ3EF/sB+xdykIWI8/KwFs45A5MfRKzyi
 HPSQ5PkYYy8k7MY/N43HubW+8OwJgQu9OxF8e4Eu7c3Cgvhxz9+J0a0aElgCM4VYKQuu
 zMq73GdYa+/sgbdvz16B3UZTRl7dZPWQHaQfGx4+gbo19PY8VGNJk8OPVsyCTX1LSyCT
 6NYA==
X-Gm-Message-State: AOJu0Ywol3CSq95bkgHcC8SoMIxxKbVoJYEfedoqpMVrLCVDw1kAAWAd
 xCGm1jSTVCoOKHSJdSqYr3bkSIqKkaEsB6q5Nfs5hWBHCRv93TX5wT3u4ikPM4w=
X-Gm-Gg: ASbGncuZ9hsER5p9Jxm/Iei9T+68G3stVYa/AB6T/f+foFXYeYZJs6N1VcQajWPzUqc
 +f8OKP/icjRe8rVmzThncimZndtX2rzSodsIdo7hQCDyRK78ww7f79pwLa5DjvvDxzVPTTKPep5
 CWRxXywzmzOB8dRZDDjs+Xn/ZcQXmxyKGeAtEV8j0qm5M7Wc7mNGS2TEPesQ1RKIy/lFywW51Zk
 olMTmGU7H5Mky/0v1i95/Ija8jvSd2aH2ExlMmbOX7WGBnA9kg6l9sSc0Wmdqs3O3MSzH7T
X-Google-Smtp-Source: AGHT+IHYbRf/Xl1/HTWTTR0PbnhOKbUOwUNQEA9pSDIcGL1byIReR1tFyEabtoI22iqUyeZZOPtzbA==
X-Received: by 2002:a5d:6da6:0:b0:385:f527:be6d with SMTP id
 ffacd0b85a97d-38a8730fabamr5715141f8f.36.1736430277448; 
 Thu, 09 Jan 2025 05:44:37 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38325esm1865623f8f.27.2025.01.09.05.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:44:37 -0800 (PST)
Message-ID: <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
Date: Thu, 9 Jan 2025 13:44:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
To: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250109133710.39404-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 09/01/2025 13:37, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
> 
> This is relatively subtle and prone to misunderstandings.
> 
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.
> 
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use
> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
> 
> Improve the explanatory comment for that decrement.
> 
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
> 
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>   include/drm/gpu_scheduler.h            | 19 +++++++++++++++----
>   2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..5f46c01eb01e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	drm_sched_fence_scheduled(s_fence, fence);
>   
>   	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>   		r = dma_fence_add_callback(fence, &sched_job->cb,
>   					   drm_sched_job_done_cb);
>   		if (r == -ENOENT)
>   			drm_sched_job_done(sched_job, fence->error);
>   		else if (r)
>   			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by
> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */
> +		dma_fence_put(fence);
>   	} else {
>   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>   				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..d5cd2a78f27c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
>   					 struct drm_sched_entity *s_entity);
>   
>   	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must take a
> +	 * reference for the scheduler, and additional ones for the driver's
> +	 * respective needs.

Another thing which would be really good to document here is what other 
things run_job can return apart from the fence.

For instance amdgpu can return an ERR_PTR but I haven't looked into 
other drivers.

Regards,

Tvrtko

>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   
