Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FC450761
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0AB6E0A1;
	Mon, 15 Nov 2021 14:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F6E6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:43:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636987439; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=7XCMV7JuJ0TbWXeHCYx30uBSDutsKDC797uPkQLu/NE=;
 b=seNibXUxOFev7PPqYBPqOn3Wj+4yjRfDGBZuYH3npAhNWiEWgfbizuL7U0ZTzGixduQ5huCW
 NPrNDZ7oH6KrWDcemWpw7pSZYRaMQmhGJOplGaLqZnSGE64nswC5JKbRLjQXlA9SmBXtZPJp
 HueSGCIlEDquymbVxkD8sfhrZQw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6192722d4db4233966ba7b78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 14:43:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D066C4360D; Mon, 15 Nov 2021 14:43:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.5] (unknown [59.89.226.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 795E8C43460;
 Mon, 15 Nov 2021 14:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 795E8C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <36c9f669-c2d2-8a63-db96-31165caeeffb@codeaurora.org>
Date: Mon, 15 Nov 2021 20:13:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/2] drm/msm: Restore error return on invalid fence
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211111192457.747899-1-robdclark@gmail.com>
 <20211111192457.747899-3-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211111192457.747899-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2021 12:54 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When converting to use an idr to map userspace fence seqno values back
> to a dma_fence, we lost the error return when userspace passes seqno
> that is larger than the last submitted fence.  Restore this check.
> 
> Reported-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note: I will rebase "drm/msm: Handle fence rollover" on top of this,
> to simplify backporting this patch to stable kernels
> 
>   drivers/gpu/drm/msm/msm_drv.c        | 6 ++++++
>   drivers/gpu/drm/msm/msm_gem_submit.c | 1 +
>   drivers/gpu/drm/msm/msm_gpu.h        | 3 +++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index cb14d997c174..56500eb5219e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -967,6 +967,12 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
>   	struct dma_fence *fence;
>   	int ret;
>   
> +	if (fence_id > queue->last_fence) {

But fence_id can wrap around and then this check won't be valid.

-Akhil.

> +		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
> +				      fence_id, queue->last_fence);
> +		return -EINVAL;
> +	}
> +
>   	/*
>   	 * Map submitqueue scoped "seqno" (which is actually an idr key)
>   	 * back to underlying dma-fence
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 151d19e4453c..a38f23be497d 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -911,6 +911,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	drm_sched_entity_push_job(&submit->base, queue->entity);
>   
>   	args->fence = submit->fence_id;
> +	queue->last_fence = submit->fence_id;
>   
>   	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
>   	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index bd4e0024033e..e73a5bb03544 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -376,6 +376,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
>    * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
>    *             by the submitqueue's priority
>    * @faults:    the number of GPU hangs associated with this submitqueue
> + * @last_fence: the sequence number of the last allocated fence (for error
> + *             checking)
>    * @ctx:       the per-drm_file context associated with the submitqueue (ie.
>    *             which set of pgtables do submits jobs associated with the
>    *             submitqueue use)
> @@ -391,6 +393,7 @@ struct msm_gpu_submitqueue {
>   	u32 flags;
>   	u32 ring_nr;
>   	int faults;
> +	uint32_t last_fence;
>   	struct msm_file_private *ctx;
>   	struct list_head node;
>   	struct idr fence_idr;
> 

