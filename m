Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2275A3DB4B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241F10E192;
	Thu, 20 Feb 2025 13:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bAq+d8G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04FD10E192
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HmLr8tjvLi4nFvUpNKJ/HEAdoe6aExUh0s+6Zn1EAaU=; b=bAq+d8G1AiMmStyjr3krH99GoU
 tdbcpZH9oz5A5wSWVXfFV3c8YSwBiGFkw9SsKd2q0lyDvFLFGun32AKGNzZBHyqDiDLUmjcbpV8xI
 L31kv8SERLPvmGY7f/80LngTYqkB4asu/v0ieGqfLVVcV3flhEsLhY1QfV2DffR3AxVv0JXJbBL7/
 JOpdaofsdR9jMvpG3XCJOXSIU7Vm6UED8G/IJDg0PuPWeTjTDaGdu+2jAnY3k4ct23YE//GKKsG8+
 rRawGp7RZ8Hf4ZJJOf6ArGZY+W+SG5UbV87p4O22aNP+Sqoe0EkAKpsZXhmZ0sAdX93+BZ7prBtxQ
 Wq+F1xoQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tl6bm-00FMoB-GE; Thu, 20 Feb 2025 14:29:00 +0100
Message-ID: <12c53d41-21c4-443d-a572-fd22c3cc56ad@igalia.com>
Date: Thu, 20 Feb 2025 10:28:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/sched: Adjust outdated docu for run_job()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250220112813.87992-4-phasta@kernel.org>
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

Hi Philipp,

On 20/02/25 08:28, Philipp Stanner wrote:
> The documentation for drm_sched_backend_ops.run_job() mentions a certain
> function called drm_sched_job_recovery(). This function does not exist.
> What's actually meant is drm_sched_resubmit_jobs(), which is by now also
> deprecated.
> 
> Remove the mention of the removed function.
> 
> Discourage the behavior of drm_sched_backend_ops.run_job() being called
> multiple times for the same job.

It looks odd to me that this patch removes lines that were added in
patch 1/3. Maybe you could change the patchset order and place this one
as the first.

> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/drm/gpu_scheduler.h | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 916279b5aa00..29e5bda91806 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -421,20 +421,27 @@ struct drm_sched_backend_ops {
>   
>   	/**
>   	 * @run_job: Called to execute the job once all of the dependencies
> -	 * have been resolved. This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> -	 * try it again.
> +	 * have been resolved.
> +	 *
> +	 * The deprecated drm_sched_resubmit_jobs() (called from
> +	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the

I think it would be "@timedout_job".

> +	 * same parameters. Using this is discouraged because it, presumably,
> +	 * violates dma_fence rules.

I believe it would be "struct dma_fence".

> +	 *
> +	 * TODO: Document which fence rules above.
>   	 *
>   	 * @sched_job: the job to run
>   	 *
> -	 * Returns: dma_fence the driver must signal once the hardware has
> -	 *	completed the job ("hardware fence").
> -	 *
>   	 * Note that the scheduler expects to 'inherit' its own reference to
>   	 * this fence from the callback. It does not invoke an extra
>   	 * dma_fence_get() on it. Consequently, this callback must take a
>   	 * reference for the scheduler, and additional ones for the driver's
>   	 * respective needs.

Would it be possible to add a comment that `run_job()` must check if
`s_fence->finished.error` is different than 0? If you increase the karma
of a job and don't check for `s_fence->finished.error`, you might run a
cancelled job.

> +	 *
> +	 * Return:
> +	 * * On success: dma_fence the driver must signal once the hardware has
> +	 * completed the job ("hardware fence").

A suggestion: "the fence that the driver must signal once the hardware
has completed the job".

Best Regards,
- Maíra

> +	 * * On failure: NULL or an ERR_PTR.
>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   

