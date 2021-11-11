Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CF44DAE1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164976EA31;
	Thu, 11 Nov 2021 16:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFFE6EA31
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:58:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636649936; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=Fm+8CbAWSdAcP/8qZCXokIpOIPGShPhL8uLwQhrTmh8=;
 b=QoL/P/IXYL7hRGUXmw8x3Aum2Eg7yTHmHy5PICgWOrG30AI2vf1JcjE4Drmzu+w7J3cy20OS
 AFHeODFEcTIvjQNVrgx5WBEjoTDyQRKNidVkLk5MWcyk3Ywr/VegEaOxJLmz/0OdMsFkzjPI
 IWwOZhakLxG1rZuAv60aspD05xI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618d4bb1c51781f169c7e4ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 16:58:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 867C5C43460; Thu, 11 Nov 2021 16:58:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 158DFC4338F;
 Thu, 11 Nov 2021 16:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 158DFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <ce362bf0-3fac-79d9-41c0-05920cdbbd9e@codeaurora.org>
Date: Thu, 11 Nov 2021 22:28:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 4/5] drm/msm: Handle fence rollover
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211109181117.591148-1-robdclark@gmail.com>
 <20211109181117.591148-5-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211109181117.591148-5-robdclark@gmail.com>
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
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/2021 11:41 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add some helpers for fence comparision, which handle rollover properly,
> and stop open coding fence seqno comparisions.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.h | 12 ++++++++++++
>   drivers/gpu/drm/msm/msm_gpu.c   |  6 +++---
>   drivers/gpu/drm/msm/msm_gpu.h   |  2 +-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 4783db528bcc..17ee3822b423 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -60,4 +60,16 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>   
>   struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
>   
> +static inline bool
> +fence_before(uint32_t a, uint32_t b)
> +{
> +   return (int32_t)(a - b) < 0;

This is good enough when a and b have close values. And that is a good 
assumption for KMD generated seqno.

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.

> +}
> +
> +static inline bool
> +fence_after(uint32_t a, uint32_t b)
> +{
> +   return (int32_t)(a - b) > 0;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 13de1241d595..0f78c2615272 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -172,7 +172,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   
>   	spin_lock_irqsave(&ring->submit_lock, flags);
>   	list_for_each_entry(submit, &ring->submits, node) {
> -		if (submit->seqno > fence)
> +		if (fence_after(submit->seqno, fence))
>   			break;
>   
>   		msm_update_fence(submit->ring->fctx,
> @@ -509,7 +509,7 @@ static void hangcheck_handler(struct timer_list *t)
>   	if (fence != ring->hangcheck_fence) {
>   		/* some progress has been made.. ya! */
>   		ring->hangcheck_fence = fence;
> -	} else if (fence < ring->seqno) {
> +	} else if (fence_before(fence, ring->seqno)) {
>   		/* no progress and not done.. hung! */
>   		ring->hangcheck_fence = fence;
>   		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
> @@ -523,7 +523,7 @@ static void hangcheck_handler(struct timer_list *t)
>   	}
>   
>   	/* if still more pending work, reset the hangcheck timer: */
> -	if (ring->seqno > ring->hangcheck_fence)
> +	if (fence_after(ring->seqno, ring->hangcheck_fence))
>   		hangcheck_timer_reset(gpu);
>   
>   	/* workaround for missing irq: */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0dcc31c27ac3..bd4e0024033e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -258,7 +258,7 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
>   
> -		if (ring->seqno > ring->memptrs->fence)
> +		if (fence_after(ring->seqno, ring->memptrs->fence))
>   			return true;
>   	}
>   
> 

