Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673344DAB1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81A6EA48;
	Thu, 11 Nov 2021 16:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EC46EA48
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:44:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636649110; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=//ebf0pTl7FqUfYkQSfNfcnD3tef4Up1ihIo7rYioHA=;
 b=MAmHeyljprudi8HY1AwdHgE1HZ7ctM05LbX50elWTk19PhVbgXhfPB29hsLnL8iXQVcXjOIe
 VyvH89/E7CpfQ1TnzoPMuqAbbZFHAnzvn7qV6sBLuXKXjCaS6C6q6+az5kULzLfEWyTfTCuW
 YJOc0V5dy2Gds/6QIlza03fxgd8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 618d487c332b6b6db49818ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 16:44:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C26F0C4361A; Thu, 11 Nov 2021 16:44:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 74C4DC4338F;
 Thu, 11 Nov 2021 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 74C4DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <1aa5b508-d225-1dbc-63ab-0958ac94c18a@codeaurora.org>
Date: Thu, 11 Nov 2021 22:14:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/5] drm/msm: Drop priv->lastctx
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211109181117.591148-1-robdclark@gmail.com>
 <20211109181117.591148-3-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211109181117.591148-3-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/2021 11:41 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> cur_ctx_seqno already does the same thing, but handles the edge cases
> where a refcnt'd context can live after lastclose.  So let's not have
> two ways to do the same thing.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c |  3 +--
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  3 +--
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  3 +--
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  8 +++-----
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  9 +++------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 10 ----------
>   drivers/gpu/drm/msm/msm_drv.c         |  6 ------
>   drivers/gpu/drm/msm/msm_drv.h         |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.h         | 11 +++++++++++
>   10 files changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index bdc989183c64..22e8295a5e2b 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -12,7 +12,6 @@ static bool a2xx_idle(struct msm_gpu *gpu);
>   
>   static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct msm_ringbuffer *ring = submit->ring;
>   	unsigned int i;
>   
> @@ -23,7 +22,7 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>   			/* ignore if there has not been a ctx switch: */
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 8fb847c174ff..2e481e2692ba 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -30,7 +30,6 @@ static bool a3xx_idle(struct msm_gpu *gpu);
>   
>   static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct msm_ringbuffer *ring = submit->ring;
>   	unsigned int i;
>   
> @@ -41,7 +40,7 @@ static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>   			/* ignore if there has not been a ctx switch: */
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index a96ee79cc5e0..c5524d6e8705 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -24,7 +24,6 @@ static bool a4xx_idle(struct msm_gpu *gpu);
>   
>   static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct msm_ringbuffer *ring = submit->ring;
>   	unsigned int i;
>   
> @@ -35,7 +34,7 @@ static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>   			/* ignore if there has not been a ctx switch: */
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 5e2750eb3810..6163990a4d09 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -65,7 +65,6 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   
>   static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct msm_ringbuffer *ring = submit->ring;
>   	struct msm_gem_object *obj;
>   	uint32_t *ptr, dwords;
> @@ -76,7 +75,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>   		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> @@ -126,12 +125,11 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct msm_ringbuffer *ring = submit->ring;
>   	unsigned int i, ibs = 0;
>   
>   	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
> -		priv->lastctx = NULL;
> +		gpu->cur_ctx_seqno = 0;
>   		a5xx_submit_in_rb(gpu, submit);
>   		return;
>   	}
> @@ -166,7 +164,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 33da25b81615..3d2da81cb2c9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>   	u32 asid;
>   	u64 memptr = rbmemptr(ring, ttbr0);
>   
> -	if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
> +	if (ctx->seqno == a6xx_gpu->base.base.cur_ctx_seqno)
>   		return;
>   
>   	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> @@ -138,14 +138,11 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>   
>   	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
>   	OUT_RING(ring, 0x31);
> -
> -	a6xx_gpu->cur_ctx_seqno = ctx->seqno;
>   }
>   
>   static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
>   	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
> -	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   	struct msm_ringbuffer *ring = submit->ring;
> @@ -177,7 +174,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>   			break;
>   		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == submit->queue->ctx)
> +			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
>   				break;
>   			fallthrough;
>   		case MSM_SUBMIT_CMD_BUF:
> @@ -1081,7 +1078,7 @@ static int hw_init(struct msm_gpu *gpu)
>   	/* Always come up on rb 0 */
>   	a6xx_gpu->cur_ring = gpu->rb[0];
>   
> -	a6xx_gpu->cur_ctx_seqno = 0;
> +	gpu->cur_ctx_seqno = 0;
>   
>   	/* Enable the SQE_to start the CP engine */
>   	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 8e5527c881b1..86e0a7c3fe6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -20,16 +20,6 @@ struct a6xx_gpu {
>   
>   	struct msm_ringbuffer *cur_ring;
>   
> -	/**
> -	 * cur_ctx_seqno:
> -	 *
> -	 * The ctx->seqno value of the context with current pgtables
> -	 * installed.  Tracked by seqno rather than pointer value to
> -	 * avoid dangling pointers, and cases where a ctx can be freed
> -	 * and a new one created with the same address.
> -	 */
> -	int cur_ctx_seqno;
> -
>   	struct a6xx_gmu gmu;
>   
>   	struct drm_gem_object *shadow_bo;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d498dd..73e827641024 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -752,14 +752,8 @@ static void context_close(struct msm_file_private *ctx)
>   
>   static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>   {
> -	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_file_private *ctx = file->driver_priv;
>   
> -	mutex_lock(&dev->struct_mutex);
> -	if (ctx == priv->lastctx)
> -		priv->lastctx = NULL;
> -	mutex_unlock(&dev->struct_mutex);
> -
>   	context_close(ctx);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 69952b239384..2943c21d9aac 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -164,7 +164,7 @@ struct msm_drm_private {
>   
>   	/* when we have more than one 'msm_gpu' these need to be an array: */
>   	struct msm_gpu *gpu;
> -	struct msm_file_private *lastctx;
> +
>   	/* gpu is only set on open(), but we need this info earlier */
>   	bool is_a2xx;
>   	bool has_cached_coherent;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 2c46cd968ac4..3dfc58e6498f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -763,7 +763,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	mutex_unlock(&gpu->active_lock);
>   
>   	gpu->funcs->submit(gpu, submit);
> -	priv->lastctx = submit->queue->ctx;
> +	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>   
>   	hangcheck_timer_reset(gpu);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 59870095ea41..623ee416c568 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -144,6 +144,17 @@ struct msm_gpu {
>   	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
>   	int nr_rings;
>   
> +	/**
> +	 * cur_ctx_seqno:
> +	 *
> +	 * The ctx->seqno value of the last context to submit rendering,
> +	 * and the one with current pgtables installed (for generations
> +	 * that support per-context pgtables).  Tracked by seqno rather
> +	 * than pointer value to avoid dangling pointers, and cases where
> +	 * a ctx can be freed and a new one created with the same address.
> +	 */
> +	int cur_ctx_seqno;
> +
>   	/*
>   	 * List of GEM active objects on this gpu.  Protected by
>   	 * msm_drm_private::mm_lock
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.
