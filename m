Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9484254D097
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E1210EEDD;
	Wed, 15 Jun 2022 18:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C7A10EEDD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:03:07 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-fe32122311so17498399fac.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t06Whp8J1p63OOXUI0W1zpEYnP4NO86mmZ4mk1dCZBM=;
 b=YvcDqM7MBtAzPErRZDMbs6OrvTj+QYa+beHr6a1/MPFMs36i4IHHwhi/HrIonOHZ5B
 hAUWJL3EbN6PE/e8P4Z81X6QJIsNKjUjHq19oEJRFL71hOOBmhYR+56JNNHhAWSN505e
 Nz/TMvVRs9UNYU48UyVN9DOAZQ90/tRCME+jo9JP1s89FnySs++DfspxfIqCKmzeGvQ+
 c3/JaoohIEjh16DUNRuaWmdkgUVAZYJ+3hmyBoaLBWEni6QCiIzg8W7Ps3Moz17GYXDX
 hORteutp7s4Wt1czjZDn+3iZMk9sBrTpR6ZxA5go2qgomPRSoP5I2UfKO3mLRTKU1mBQ
 UUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t06Whp8J1p63OOXUI0W1zpEYnP4NO86mmZ4mk1dCZBM=;
 b=7/0EJKR/RS/NWXfAqd0CCacUg6oQBUXhDJB7PxoEWSqWDJxKA7m+aV3qET0x4v5a1z
 9ApemTO1JN2U8YXHJMwyJ+jkKNIt6l46HOc6S7aTdN5q8KEdxafAslmI+8gsBX9ev4D7
 /PXYSl9U5wDDJ6EKeKns8Z8S7igMldpven4H0qLHHgR3ZkJQVoJ5JHQ7iNUmyDMjBP3O
 Cx5ORxmkkV9tLMkP9wrWGSoHEsoUMTvwE9jNYJFmcExJ/PDichBU4sQgxGOjGs/Oba14
 COa1o46895hUo6hGv/DKGAEz+ecEdpYr//ip6we9f5eSntQWWiYroBPg17lB8bjF6ItL
 LrjA==
X-Gm-Message-State: AJIora97z2pO4LAKQKI0wywIqxOhnNXXfx1vzqQdpLNQDvSodBJ10BJd
 NFbdrOjAqykVrO05FP5dt1QA5A==
X-Google-Smtp-Source: AGRyM1tzJ8Etjk9NLHG0a4rnjXGH2j3pVNbLOrclTtBfeP2QVF6H/r8tCJsVdlCCmanAzxOmg7ofJw==
X-Received: by 2002:a05:6870:73cc:b0:f5:ff37:ab8e with SMTP id
 a12-20020a05687073cc00b000f5ff37ab8emr6016895oan.153.1655316186084; 
 Wed, 15 Jun 2022 11:03:06 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056830232f00b0060c030fae2asm6385436otg.54.2022.06.15.11.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 11:03:05 -0700 (PDT)
Message-ID: <0eb804a6-050e-5f69-48bb-27a8c41da108@kali.org>
Date: Wed, 15 Jun 2022 13:03:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drm/msm: Drop update_fences()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220615150107.2969593-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220615150107.2969593-1-robdclark@gmail.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/15/22 10:01 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> I noticed while looking at some traces, that we could miss calls to
> msm_update_fence(), as the irq could have raced with retire_submits()
> which could have already popped the last submit on a ring out of the
> queue of in-flight submits.  But walking the list of submits in the
> irq handler isn't really needed, as dma_fence_is_signaled() will dtrt.
> So lets just drop it entirely.
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 22 ++--------------------
>   1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index e59a757578df..b61078f0cd0f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -176,24 +176,6 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
>   	return ret;
>   }
>   
> -static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> -		uint32_t fence)
> -{
> -	struct msm_gem_submit *submit;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ring->submit_lock, flags);
> -	list_for_each_entry(submit, &ring->submits, node) {
> -		if (fence_after(submit->seqno, fence))
> -			break;
> -
> -		msm_update_fence(submit->ring->fctx,
> -			submit->hw_fence->seqno);
> -		dma_fence_signal(submit->hw_fence);
> -	}
> -	spin_unlock_irqrestore(&ring->submit_lock, flags);
> -}
> -
>   #ifdef CONFIG_DEV_COREDUMP
>   static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>   		size_t count, void *data, size_t datalen)
> @@ -450,7 +432,7 @@ static void recover_worker(struct kthread_work *work)
>   		if (ring == cur_ring)
>   			fence++;
>   
> -		update_fences(gpu, ring, fence);
> +		msm_update_fence(ring->fctx, fence);
>   	}
>   
>   	if (msm_gpu_active(gpu)) {
> @@ -753,7 +735,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
>   	int i;
>   
>   	for (i = 0; i < gpu->nr_rings; i++)
> -		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
> +		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
>   
>   	kthread_queue_work(gpu->worker, &gpu->retire_work);
>   	update_sw_cntrs(gpu);


Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

