Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C37246DCE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 19:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0F089D44;
	Mon, 17 Aug 2020 17:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1859C89E03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:14:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597684487; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SwKYrRggeH5jHtgd4TNoplzKAYDNI0Gdz3xVzc6qu6k=;
 b=iR/3qea/l3BVjnMLkXsug9r7tKNsgT2t7TC7C7MrnXO5hoqQZuhCU2LD1cAXC3B0wYsKQjkK
 eHDhZWzgi9sR2ojYMV4NfuzLwBapeUz4jkclA1tnhUbNqvyM2SunTNwzjA1ZS79JphQwTVBP
 /l5d2Rt3SVIK1Ay+ghzGhDI+dq8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f3abae0c85a1092b0ff4608 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 17:14:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8020C4339C; Mon, 17 Aug 2020 17:14:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A427C433CB;
 Mon, 17 Aug 2020 17:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A427C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 11:14:01 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 19/19] drm/msm: show process names in
 gem_describe
Message-ID: <20200817171401.GB7438@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-20-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-20-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 iommu@lists.linux-foundation.org, Sibi Sankar <sibis@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 07:41:14PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In $debugfs/gem we already show any vma(s) associated with an object.
> Also show process names if the vma's address space is a per-process
> address space.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c     |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c     | 25 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_gem.h     |  5 +++++
>  drivers/gpu/drm/msm/msm_gem_vma.c |  1 +
>  drivers/gpu/drm/msm/msm_gpu.c     |  8 +++++---
>  drivers/gpu/drm/msm/msm_gpu.h     |  2 +-
>  6 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8e70d220bba8..8d5c4f98c332 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
> -	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
> +	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
>  	file->driver_priv = ctx;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 3cb7aeb93fd3..76a6c5271e57 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -842,11 +842,28 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>  
>  		seq_puts(m, "      vmas:");
>  
> -		list_for_each_entry(vma, &msm_obj->vmas, list)
> -			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
> -				vma->aspace != NULL ? vma->aspace->name : NULL,
> -				vma->iova, vma->mapped ? "mapped" : "unmapped",
> +		list_for_each_entry(vma, &msm_obj->vmas, list) {
> +			const char *name, *comm;
> +			if (vma->aspace) {
> +				struct msm_gem_address_space *aspace = vma->aspace;
> +				struct task_struct *task =
> +					get_pid_task(aspace->pid, PIDTYPE_PID);
> +				if (task) {
> +					comm = kstrdup(task->comm, GFP_KERNEL);
> +				} else {
> +					comm = NULL;
> +				}
> +				name = aspace->name;
> +			} else {
> +				name = comm = NULL;
> +			}
> +			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
> +				name, comm ? ":" : "", comm ? comm : "",
> +				vma->aspace, vma->iova,
> +				vma->mapped ? "mapped" : "unmapped",
>  				vma->inuse);
> +			kfree(comm);
> +		}
>  
>  		seq_puts(m, "\n");
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 9c573c4269cb..7b1c7a5f8eef 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -24,6 +24,11 @@ struct msm_gem_address_space {
>  	spinlock_t lock; /* Protects drm_mm node allocation/removal */
>  	struct msm_mmu *mmu;
>  	struct kref kref;
> +
> +	/* For address spaces associated with a specific process, this
> +	 * will be non-NULL:
> +	 */
> +	struct pid *pid;
>  };
>  
>  struct msm_gem_vma {
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 29cc1305cf37..80a8a266d68f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -17,6 +17,7 @@ msm_gem_address_space_destroy(struct kref *kref)
>  	drm_mm_takedown(&aspace->mm);
>  	if (aspace->mmu)
>  		aspace->mmu->funcs->destroy(aspace->mmu);
> +	put_pid(aspace->pid);
>  	kfree(aspace);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 951850804d77..ac8961187a73 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -825,10 +825,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  
>  /* Return a new address space for a msm_drm_private instance */
>  struct msm_gem_address_space *
> -msm_gpu_create_private_address_space(struct msm_gpu *gpu)
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
>  {
>  	struct msm_gem_address_space *aspace = NULL;
> -
>  	if (!gpu)
>  		return NULL;
>  
> @@ -836,8 +835,11 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu)
>  	 * If the target doesn't support private address spaces then return
>  	 * the global one
>  	 */
> -	if (gpu->funcs->create_private_address_space)
> +	if (gpu->funcs->create_private_address_space) {
>  		aspace = gpu->funcs->create_private_address_space(gpu);
> +		if (!IS_ERR(aspace))
> +			aspace->pid = get_pid(task_pid(task));
> +	}
>  
>  	if (IS_ERR_OR_NULL(aspace))
>  		aspace = msm_gem_address_space_get(gpu->aspace);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 4052a18e18c2..59f26bd0fe42 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -298,7 +298,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		const char *name, struct msm_gpu_config *config);
>  
>  struct msm_gem_address_space *
> -msm_gpu_create_private_address_space(struct msm_gpu *gpu);
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
>  
>  void msm_gpu_cleanup(struct msm_gpu *gpu);
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
