Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733A6D9E11
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D910E34D;
	Thu,  6 Apr 2023 16:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995EB10E34D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:57:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-93abb185e13so19015566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680800257; x=1683392257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bv4rhL5xcdgZ/DhPkAeioKFy6ejC5rjemlHjihYrCEI=;
 b=Aim4yf1rWiVoUhKiq8R7vdL2JzjbQYG35QKxt98vpOypBRIJa7sx4e23v9Eu/e06D5
 OJOdCrcdzPolvE+XVbcRxwyKWjwwko2NI10Km7rQDGGS2Es3yeG8bbMX/9s3U8JBT2sK
 PqBr+VoFJDgSFpfbOgCZiwuSC3F3pIDhns6Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680800257; x=1683392257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bv4rhL5xcdgZ/DhPkAeioKFy6ejC5rjemlHjihYrCEI=;
 b=ee6knhyM+Pa457q2LMNOCRGIFyui+ze4cDqVBqR0gEa8NZ4r4tlCff7kQ0z5ueUWxU
 8KEEFwR7NMFR4Wf2pl7h8CXvBnTc+/ACPPl4I7UF2BZQBzNzqrwijiSY5QfIOq1A/4gy
 oU8cnLCufnGtQDbSOMI8nRP01r5JSELhOsam7pZz19vKjAs+mNtP9y0zxuD3X2X1Y0Km
 vKs9z2hf3nbZ+AOrpA0LzW4TjMwBA5AcuPSYYGPWcfHSSiriiMDHVAp9G78MM9v7s63H
 JBmMybe1tWL3Fjsz0LjZDiPNVo+6FXpTnDnWrfWDbrulJs+2W8f5x1h91HORmglEnc7M
 r42A==
X-Gm-Message-State: AAQBX9fqTcO/rtlVHFrNfvZmqRLXxsIRdPQZd/hSCU+A3GXcEZx4zlmA
 mASum7fywlB43R7stwGX8FGQOw==
X-Google-Smtp-Source: AKy350aCBGFd7e3o5CzUz2rzt+vOc3af4yAcNfQfCdD78xTpUKFPsNFnRAhK5MqoCskcs/eU5iODSg==
X-Received: by 2002:a05:6402:1908:b0:4bb:c3ce:63fc with SMTP id
 e8-20020a056402190800b004bbc3ce63fcmr278589edz.3.1680800256677; 
 Thu, 06 Apr 2023 09:57:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 z95-20020a509e68000000b004c09527d62dsm966332ede.30.2023.04.06.09.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 09:57:36 -0700 (PDT)
Date: Thu, 6 Apr 2023 18:57:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 1/2] accel/ivpu: Add dma fence to command buffers only
Message-ID: <ZC75/q34YnDDsGpB@phenom.ffwll.local>
References: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
 <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 01:36:02PM +0200, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Currently job->done_fence is added to every BO handle within a job. If job
> handle (command buffer) is shared between multiple submits, KMD will add
> the fence in each of them. Then bo_wait_ioctl() executed on command buffer
> will exit only when all jobs containing that handle are done.
> 
> This creates deadlock scenario for user mode driver in case when job handle
> is added as dependency of another job, because bo_wait_ioctl() of first job
> will wait until second job finishes, and second job can not finish before
> first one.
> 
> Having fences added only to job buffer handle allows user space to execute
> bo_wait_ioctl() on the job even if it's handle is submitted with other job.
> 
> Fixes: cd7272215c44 ("accel/ivpu: Add command buffer submission logic")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Uh this is confused on a lot of levels ...

Frist having a new driver which uses the dma_resv/bo implicit fencing for
umd synchronization is not great at all. The modern way of doing is:
- in/out dependencies are handling with drm_syncobj
- userspace waits on the drm_syncobj, not with a driver-private wait ioctl
  on a specific bo

The other issue is that the below starts to fall over once you do dynamic
memory management, for that case you _always_ have to install a fence.

Now fear not, there's a solution here:
- you always install a fence (i.e. revert this patch), but by default is a
  DMA_RESV_USAGE_BOOKKEEP fence. See the kerneldoc for enum dma_resv_usage
  for what that means.
- only for the special job bo you set the DMA_RESV_USAGE_READ flag. You
  want read because really that's what the gpu is doing for the job bo.
- the bo_wait ioctl then waits for write access internally

Should result in the same uapi as your patch here, but without abusing
dma_resv in a way that'll go boom.

Note that userspace can get at the dma_resv READ/WRITE fences through
ioctls on a dma-buf, so which one you pick here is uabi relevant.
bo-as-job-fence is USAGE_READ.

Please take care of this in -next.

Cheers, Daniel

> ---
>  drivers/accel/ivpu/ivpu_job.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 910301fae435..3c6f1e16cf2f 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -461,26 +461,22 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
>  
>  	job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
>  
> -	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
> -					&acquire_ctx);
> +	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
>  	if (ret) {
>  		ivpu_warn(vdev, "Failed to lock reservations: %d\n", ret);
>  		return ret;
>  	}
>  
> -	for (i = 0; i < buf_count; i++) {
> -		ret = dma_resv_reserve_fences(job->bos[i]->base.resv, 1);
> -		if (ret) {
> -			ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
> -			goto unlock_reservations;
> -		}
> +	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	if (ret) {
> +		ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
> +		goto unlock_reservations;
>  	}
>  
> -	for (i = 0; i < buf_count; i++)
> -		dma_resv_add_fence(job->bos[i]->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
> +	dma_resv_add_fence(bo->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
>  
>  unlock_reservations:
> -	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, buf_count, &acquire_ctx);
> +	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
>  
>  	wmb(); /* Flush write combining buffers */
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
