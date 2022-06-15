Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045454D09A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8D310EFD1;
	Wed, 15 Jun 2022 18:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5EF10EFEB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:03:28 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u9so11163590oiv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Qb6SH0xrSj5MIpKwdT6FqdKu87C2nKyg2Uc3Hml8l4=;
 b=lM8MaIY7gRbog/stSQ7OZbHFt9vsgzGYtaBd7ciHQARVx1bSstLXQ3oVOw/kTrxXVy
 4opS8pQhCeKkZQ85OWcxUlswPcaXHm18fIOG/2zbPhbE6IXshQ4iEzW396qsIJ3I7vnP
 B2NyL7UK2/QYWDSSUSm4KLMbp/u0Q95Q6aMSWirIUZiSdubCj5v39Nl4FSqbzvslZNWB
 SjI3+G6iW52KVn7011LUEUo2opM5rxVJqu2Df7a1sCC5KR6ehAlP1xQEqPruBeIlrZrV
 WozfDL0m1on1rO/6qrrtwRa4oBGcOmxOWfWod1VV4ZEi0Uwi7vw61/RtmbtPRHKXZ9dM
 G5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Qb6SH0xrSj5MIpKwdT6FqdKu87C2nKyg2Uc3Hml8l4=;
 b=fqoYW9GluhF9K8t3dBPP59t17JPENOtavkafGZqvL+WlL2jzCze2AJTZQZcE96RieE
 lHXWW5fi186uDM7Ian/l+PYM6YTQldjlnbIbfWXE2mcF+Qza93BdeF8s63DJBLvtGnsg
 Uhtk0Kh0gRflJQEVeZVREFFgVuTLCfL8vSfrd0SOBna25LzGV1kiwKiFl+eeYKoJX043
 k3zMa9xp8QKBfUkhfR8TbojjTFPD+VrFQo2hvNJgmP6V0yBu9heiVCvGHKM9pJLVtj72
 n0Ih0sFWeX5dNyeiU18VsLlBnii+DuQ1l/fIW6YpuxC3O7EC4MufmL4ZNwERBgILs+zM
 6CZw==
X-Gm-Message-State: AJIora8MB58nN9vHX1/Y+ExYJ1cCrN+aaK/RRQ9JGZrQlkXyb6E3Cgq5
 pvpLR98ch/QKel8Ec1y2qxx+GQ==
X-Google-Smtp-Source: AGRyM1s8OK4QQHb2guTL4MKG5AjsOikS3K57eEMiVVG8213w6pDI4w7HT7jws03bW4C/+i0WaMFNwA==
X-Received: by 2002:aca:ebcd:0:b0:32e:d6c3:5978 with SMTP id
 j196-20020acaebcd000000b0032ed6c35978mr475048oih.224.1655316207110; 
 Wed, 15 Jun 2022 11:03:27 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 el40-20020a056870f6a800b000f32c6b6871sm7624745oab.10.2022.06.15.11.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 11:03:26 -0700 (PDT)
Message-ID: <9ff7adc6-570f-8089-c93d-b10fcafc02b6@kali.org>
Date: Wed, 15 Jun 2022 13:03:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] drm/msm: Don't overwrite hw fence in hw_init
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220615150107.2969593-1-robdclark@gmail.com>
 <20220615150107.2969593-2-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220615150107.2969593-2-robdclark@gmail.com>
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/15/22 10:01 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Prior to the last commit, this could result in setting the GPU
> written fence value back to an older value, if we had missed
> updating completed_fence prior to suspend.  This was mostly
> harmless as the GPU would eventually overwrite it again with
> the correct value.  But we should just not do this.  Instead
> just leave a sanity check that the fence looks plausible (in
> case the GPU scribbled on memory).
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++++---
>   drivers/gpu/drm/msm/msm_gpu.c           |  2 +-
>   2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index e1aef4875e2f..dd044d557c7c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -498,10 +498,15 @@ int adreno_hw_init(struct msm_gpu *gpu)
>   
>   		ring->cur = ring->start;
>   		ring->next = ring->start;
> -
> -		/* reset completed fence seqno: */
> -		ring->memptrs->fence = ring->fctx->completed_fence;
>   		ring->memptrs->rptr = 0;
> +
> +		/* Detect and clean up an impossible fence, ie. if GPU managed
> +		 * to scribble something invalid, we don't want that to confuse
> +		 * us into mistakingly believing that submits have completed.
> +		 */
> +		if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
> +			ring->memptrs->fence = ring->fctx->last_fence;
> +		}
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index b61078f0cd0f..8c00f9187c03 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -430,7 +430,7 @@ static void recover_worker(struct kthread_work *work)
>   		 * one more to clear the faulting submit
>   		 */
>   		if (ring == cur_ring)
> -			fence++;
> +			ring->memptrs->fence = ++fence;
>   
>   		msm_update_fence(ring->fctx, fence);
>   	}

Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

