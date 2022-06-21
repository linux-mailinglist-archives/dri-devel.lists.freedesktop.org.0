Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E0552BF8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58178112527;
	Tue, 21 Jun 2022 07:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA751124ED;
 Tue, 21 Jun 2022 07:28:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id eo8so18186287edb.0;
 Tue, 21 Jun 2022 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v9OWSc/IL/MlZcyVZMqkh/2HGAIIdogj+t9Sf7CQJ80=;
 b=AddhKpiJt2kYNCfZMlsEQwaWpoRJFhYy2yvPJxFf6RCNCHZ3jy7RCUOJKRkI7veRGt
 kPdcFJHPDXDSB5iohQ6oWyMpf7seyUFklwZ/f5CmdZ5nCMpOvNGuICwnzjPpp98TUwkv
 L1sLvEx/pMAgpNVsY8yBWZyUMlCBkGktxQ0h9knPOanurYtgVmMsl4cghyJSZpr50h2B
 0fjt1hlEOdDb4UsPb0rdH8afboj2LbWKbeSn8csbJvmMOqVSWo6Us044odg0egT8eSj2
 tfib0Wo2Wrh04dLHFBOkKi0aEYaVew1PjC9eSNaGuiXn1tTVwCfhlTgOSDxlj7xCIqcq
 1WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v9OWSc/IL/MlZcyVZMqkh/2HGAIIdogj+t9Sf7CQJ80=;
 b=8G17qI9g5dGA02iS8YPMf1lvw+iQD2FcnC4J8nwtKYR2kB2ZQ6ME0Llwu5PRwKT9dQ
 I2jyPfQylhZUSgwqNqFHTV5qITKBp3fA04h6zG5Snj3ym78ci9W3G4tVjHTsZeL1FijD
 g1NpI5FU5qRoATLXNjZHZzHeUY7+BDmFk6ZqP8R0Na5HB94O+g0U9BxH6P5QZSkwwxjt
 7ZQDWzLkpE0ZCUpo70YlFqvjO93GBeu9ne9PBo//nOH85x6bGYmIGfex/T5XRhbAwBzG
 uJ83eFUNTi9LydI1FR7NHSHDh8yY0uXhuLkMIaoaoXYdwqSaNDSImgRShMyElVbxCKaI
 zLyw==
X-Gm-Message-State: AJIora+9AMXCXQODCD6ioKoZUUL5W2kHCsi9fHE4VNBJNsNBhpqZLApn
 Z0jtdq/UXkRYFrt8nV9+fxA=
X-Google-Smtp-Source: AGRyM1sLR8k6KyuTJJrg9/G+OMvz8FSMkYT6SWfsEwetBQaYeSg2j0iX03bFz3fKZn0iaKy6nJC2yg==
X-Received: by 2002:a05:6402:4309:b0:42f:9ff8:3f11 with SMTP id
 m9-20020a056402430900b0042f9ff83f11mr33711697edc.67.1655796506782; 
 Tue, 21 Jun 2022 00:28:26 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 qa39-20020a17090786a700b007030c97ae62sm7019710ejc.191.2022.06.21.00.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:28:26 -0700 (PDT)
Message-ID: <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
Date: Tue, 21 Jun 2022 09:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm
 scheduler change.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-6-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220620220302.86389-6-andrey.grodzovsky@amd.com>
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
> Align refcount behaviour for amdgpu_job embedded HW fence with
> classic pointer style HW fences by increasing refcount each
> time emit is called so amdgpu code doesn't need to make workarounds
> using amdgpu_job.job_run_counter to keep the HW fence refcount balanced.

Could we now also remove job_run_counter?

Christian.

>
> Also since in the previous patch we resumed setting s_fence->parent to NULL
> in drm_sched_stop switch to directly checking if job->hw_fence is
> signaled to short circuit reset if already signed.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 ++++++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>   4 files changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 513c57f839d8..447bd92c4856 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
>   		goto err_ib_sched;
>   	}
>   
> +	/* Drop the initial kref_init count (see drm_sched_main as example) */
> +	dma_fence_put(f);
>   	ret = dma_fence_wait(f, false);
>   
>   err_ib_sched:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c99541685804..f9718119834f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5009,16 +5009,28 @@ static void amdgpu_device_recheck_guilty_jobs(
>   
>   		/* clear job's guilty and depend the folowing step to decide the real one */
>   		drm_sched_reset_karma(s_job);
> -		/* for the real bad job, it will be resubmitted twice, adding a dma_fence_get
> -		 * to make sure fence is balanced */
> -		dma_fence_get(s_job->s_fence->parent);
>   		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>   
> +		if (!s_job->s_fence->parent) {
> +			DRM_WARN("Failed to get a HW fence for job!");
> +			continue;
> +		}
> +
>   		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
>   		if (ret == 0) { /* timeout */
>   			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
>   						ring->sched.name, s_job->id);
>   
> +
> +			/* Clear this failed job from fence array */
> +			amdgpu_fence_driver_clear_job_fences(ring);
> +
> +			/* Since the job won't signal and we go for
> +			 * another resubmit drop this parent pointer
> +			 */
> +			dma_fence_put(s_job->s_fence->parent);
> +			s_job->s_fence->parent = NULL;
> +
>   			/* set guilty */
>   			drm_sched_increase_karma(s_job);
>   retry:
> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>   
>   		/* got the hw fence, signal finished fence */
>   		atomic_dec(ring->sched.score);
> -		dma_fence_put(s_job->s_fence->parent);
>   		dma_fence_get(&s_job->s_fence->finished);
>   		dma_fence_signal(&s_job->s_fence->finished);
>   		dma_fence_put(&s_job->s_fence->finished);
> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   	 *
>   	 * job->base holds a reference to parent fence
>   	 */
> -	if (job && job->base.s_fence->parent &&
> -	    dma_fence_is_signaled(job->base.s_fence->parent)) {
> +	if (job && (job->hw_fence.ops != NULL) &&
> +	    dma_fence_is_signaled(&job->hw_fence)) {
>   		job_signaled = true;
>   		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
>   		goto skip_hw_reset;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index d6d54ba4c185..9bd4e18212fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   	if (job && job->job_run_counter) {
>   		/* reinit seq for resubmitted jobs */
>   		fence->seqno = seq;
> +		/* TO be inline with external fence creation and other drivers */
> +		dma_fence_get(fence);
>   	} else {
> -		if (job)
> +		if (job) {
>   			dma_fence_init(fence, &amdgpu_job_fence_ops,
>   				       &ring->fence_drv.lock,
>   				       adev->fence_context + ring->idx, seq);
> +			/* Against remove in amdgpu_job_{free, free_cb} */
> +			dma_fence_get(fence);
> +		}
>   		else
>   			dma_fence_init(fence, &amdgpu_fence_ops,
>   				       &ring->fence_drv.lock,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 58568fdde2d0..638e1d600258 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -267,10 +267,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
>   			DRM_ERROR("Error scheduling IBs (%d)\n", r);
>   	}
>   
> -	if (!job->job_run_counter)
> -		dma_fence_get(fence);
> -	else if (finished->error < 0)
> -		dma_fence_put(&job->hw_fence);
>   	job->job_run_counter++;
>   	amdgpu_job_free_resources(job);
>   

