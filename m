Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4925891A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6B6E5BB;
	Tue,  1 Sep 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CB86E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:35:45 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 3so134243oih.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bqLgjtRNDTI/SCbsYrw9ssaBt/TftKu39O2QQtBM9Tk=;
 b=w9XTgjGSu41nt9IFeQpEbJjO8J6dMiQcWgbPKtyAAyS9OdjINki2co+sS9dqTcXxwP
 9a50dhJmZZ/pcAKuZZi1bZ5FG47qFmFnjFsnK34WIOJM6sawqS2BxkA+wnfFo/0NO5U7
 T7HJ125TAyC1FH3SF7fLiQaDDx5zDeJAmOcAZKM1DVJi6UnrWGuRpUp+p8SUOQ2fh7+5
 koAKBtid/eWHiFAWyqy49gYwFOUY404kNbsU8ifI+myNLNWaMyjPnehz8klEfrv8vU8c
 HqtvtyCyEHdtd1ZzNRXAF5xnjwtcLtq7Ej9dmL+S5qx1xFf3gOBJIJdNRD441DwhKLQt
 oJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bqLgjtRNDTI/SCbsYrw9ssaBt/TftKu39O2QQtBM9Tk=;
 b=NlE9yYgWTPfTOzk9kTiJdqazw+Kg7YZjujII+pQqf5GTqVyLr45LZf7K1XZxc0d/M1
 JbGHpbCpsF2i9k/dxV+2c9TVhBdnzL8c+/7kckAOLya6v40Nox7pNsbkzRBplKEAEnVS
 pNwoX6y49RT/TjJk62u4P0nIkK3LcpmYNmBEd7FFg++OFyCXwVe5m6Y7buZmQPsjD+Rk
 UACKXZVIAEIqEt22vlhCe4Unu4QZB4hkSfwraPt0PJXA+Ofdv3iO68c/U75Hj92etGsB
 3jJm8tRuamnrp3CA9U6QfOEAb3uKyEpTLWbIE8YA3JakbLo1X9WgwMwM60ZHNZPbcOh7
 nNfA==
X-Gm-Message-State: AOAM5302sCi+8Qixgoc2hMGs0Q4vBHUcXXn6mIX+OVZf8jAMn41MU+Li
 KnJwguwhfKmKPm7vVQMHRJbqqQ==
X-Google-Smtp-Source: ABdhPJxCwPxWpbx9/FQ/pHgMctBc48p1eEulQ2TAksIyKoN3KLenR9QKBzFuscBKV7AaA2Ff800Myg==
X-Received: by 2002:aca:190a:: with SMTP id l10mr117370oii.175.1598938544802; 
 Mon, 31 Aug 2020 22:35:44 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id u28sm20035otj.13.2020.08.31.22.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:35:44 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:35:41 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 19/19] drm/msm: show process names in gem_describe
Message-ID: <20200901053541.GY3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-20-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-20-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, iommu@lists.linux-foundation.org,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> In $debugfs/gem we already show any vma(s) associated with an object.
> Also show process names if the vma's address space is a per-process
> address space.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
