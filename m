Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B73D34D6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 08:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A896FA47;
	Fri, 23 Jul 2021 06:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539E6FA48
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 06:52:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627023126; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mhGTziIiW6WOD6A69omTzhtLWQHqYlyKpdcfV+WbaTs=;
 b=ko6pvwP6Gl651otArZs/BwEjNlmNC+FJPJ0W+39vDjTIYqXLt/snvw3New25DYMN4ZWzDwB4
 P5mGCh3ncALskMLg3AVGHBGjrGKq6Qn1UeTCpZthIh0Dn+VbqK2mk5EgCYguByoSC1IeQKyn
 MSbKqC+6UkRQrm7+LLpKYjJgfW4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60fa6715e31d882d183c164c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 06:52:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7FCE7C4338A; Fri, 23 Jul 2021 06:52:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A589FC433D3;
 Fri, 23 Jul 2021 06:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A589FC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 3/3] drm/msm: Devfreq tuning
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210722222145.1759900-1-robdclark@gmail.com>
 <20210722222145.1759900-4-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <f0040cae-94d7-8409-ac9e-8034dd4fd530@codeaurora.org>
Date: Fri, 23 Jul 2021 12:21:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722222145.1759900-4-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/23/2021 3:51 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This adds a few things to try and make frequency scaling better match
> the workload:
> 
> 1) Longer polling interval to avoid whip-lashing between too-high and
>     too-low frequencies in certain workloads, like mobile games which
>     throttle themselves to 30fps.
> 
>     Previously our polling interval was short enough to let things
>     ramp down to minimum freq in the "off" frame, but long enough to
>     not react quickly enough when rendering started on the next frame,
>     leading to uneven frame times.  (Ie. rather than a consistent 33ms
>     it would alternate between 16/33/48ms.)
> 
> 2) Awareness of when the GPU is active vs idle.  Since we know when
>     the GPU is active vs idle, we can clamp the frequency down to the
>     minimum while it is idle.  (If it is idle for long enough, then
>     the autosuspend delay will eventually kick in and power down the
>     GPU.)
> 
>     Since devfreq has no knowledge of powered-but-idle, this takes a
>     small bit of trickery to maintain a "fake" frequency while idle.
>     This, combined with the longer polling period allows devfreq to
>     arrive at a reasonable "active" frequency, while still clamping
>     to minimum freq when idle to reduce power draw.
> 
> 3) Boost.  Because simple_ondemand needs to see a certain threshold
>     of busyness to ramp up, we could end up needing multiple polling
>     cycles before it reacts appropriately on interactive workloads
>     (ex. scrolling a web page after reading for some time), on top
>     of the already lengthened polling interval, when we see a idle
>     to active transition after a period of idle time we boost the
>     frequency that we return to.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c         |  8 +++
>   drivers/gpu/drm/msm/msm_gpu.h         |  9 ++++
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 73 ++++++++++++++++++++++++++-
>   3 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 70d8610b1b73..68d2df590054 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -667,6 +667,10 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	list_del(&submit->node);
>   	spin_unlock(&ring->submit_lock);
>   
> +	/* Update devfreq on transition from active->idle: */
> +	if (atomic_dec_return(&gpu->active_submits) == 0)
This will race with the submit path. To avoid that, this test and the 
msm_devfreq_idle should be under the same lock. Same applies for the 
submit path.

-Akhil
> +		msm_devfreq_idle(gpu);
> +
>   	msm_gem_submit_put(submit);
>   }
>   
> @@ -747,6 +751,10 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	list_add_tail(&submit->node, &ring->submits);
>   	spin_unlock(&ring->submit_lock);
>   
> +	/* Update devfreq on transition from idle->active: */
> +	if (atomic_inc_return(&gpu->active_submits) == 1)
> +		msm_devfreq_active(gpu);
> +
>   	gpu->funcs->submit(gpu, submit);
>   	priv->lastctx = submit->queue->ctx;
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ada15e28f251..e14edda3d778 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -84,6 +84,10 @@ struct msm_gpu_devfreq {
>   	struct devfreq *devfreq;
>   	u64 busy_cycles;
>   	ktime_t time;
> +
> +	/* Time and freq of last transition to idle: */
> +	ktime_t idle_time;
> +	unsigned long idle_freq;
>   };
>   
>   struct msm_gpu {
> @@ -115,6 +119,9 @@ struct msm_gpu {
>   	 */
>   	struct list_head active_list;
>   
> +	/* number of in-flight submits: */
> +	atomic_t active_submits;
> +
>   	/* does gpu need hw_init? */
>   	bool needs_hw_init;
>   
> @@ -384,6 +391,8 @@ void msm_devfreq_init(struct msm_gpu *gpu);
>   void msm_devfreq_cleanup(struct msm_gpu *gpu);
>   void msm_devfreq_resume(struct msm_gpu *gpu);
>   void msm_devfreq_suspend(struct msm_gpu *gpu);
> +void msm_devfreq_active(struct msm_gpu *gpu);
> +void msm_devfreq_idle(struct msm_gpu *gpu);
>   
>   int msm_gpu_hw_init(struct msm_gpu *gpu);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e24a97be624..0a1ee20296a2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -22,6 +22,15 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   
>   	opp = devfreq_recommended_opp(dev, freq, flags);
>   
> +	/*
> +	 * If the GPU is idle, devfreq is not aware, so just ignore
> +	 * it's requests
> +	 */
> +	if (gpu->devfreq.idle_freq) {
> +		gpu->devfreq.idle_freq = *freq;
> +		return 0;
> +	}
> +
>   	if (IS_ERR(opp))
>   		return PTR_ERR(opp);
>   
> @@ -39,6 +48,9 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   
>   static unsigned long get_freq(struct msm_gpu *gpu)
>   {
> +	if (gpu->devfreq.idle_freq)
> +		return gpu->devfreq.idle_freq;
> +
>   	if (gpu->funcs->gpu_get_freq)
>   		return gpu->funcs->gpu_get_freq(gpu);
>   
> @@ -69,7 +81,8 @@ static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>   }
>   
>   static struct devfreq_dev_profile msm_devfreq_profile = {
> -	.polling_ms = 10,
> +	.timer = DEVFREQ_TIMER_DELAYED,
> +	.polling_ms = 50,
>   	.target = msm_devfreq_target,
>   	.get_dev_status = msm_devfreq_get_dev_status,
>   	.get_cur_freq = msm_devfreq_get_cur_freq,
> @@ -130,3 +143,61 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
>   {
>   	devfreq_suspend_device(gpu->devfreq.devfreq);
>   }
> +
> +void msm_devfreq_active(struct msm_gpu *gpu)
> +{
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +	struct devfreq_dev_status status;
> +	unsigned int idle_time;
> +	unsigned long target_freq = df->idle_freq;
> +
> +	/*
> +	 * Hold devfreq lock to synchronize with get_dev_status()/
> +	 * target() callbacks
> +	 */
> +	mutex_lock(&df->devfreq->lock);
> +
> +	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
> +
> +	/*
> +	 * If we've been idle for a significant fraction of a polling
> +	 * interval, then we won't meet the threshold of busyness for
> +	 * the governor to ramp up the freq.. so give some boost
> +	 */
> +	if (idle_time > msm_devfreq_profile.polling_ms/2) {
> +		target_freq *= 2;
> +	}
> +
> +	df->idle_freq = 0;
> +
> +	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
> +
> +	/*
> +	 * Reset the polling interval so we aren't inconsistent
> +	 * about freq vs busy/total cycles
> +	 */
> +	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
> +
> +	mutex_unlock(&df->devfreq->lock);
> +}
> +
> +void msm_devfreq_idle(struct msm_gpu *gpu)
> +{
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +	unsigned long idle_freq, target_freq = 0;
> +
> +	/*
> +	 * Hold devfreq lock to synchronize with get_dev_status()/
> +	 * target() callbacks
> +	 */
> +	mutex_lock(&df->devfreq->lock);
> +
> +	idle_freq = get_freq(gpu);
> +
> +	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
> +
> +	df->idle_time = ktime_get();
> +	df->idle_freq = idle_freq;
> +
> +	mutex_unlock(&df->devfreq->lock);
> +}
> 

