Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE8752B50
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 22:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5710E0A9;
	Thu, 13 Jul 2023 20:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7010E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 20:03:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso1400646e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689278598; x=1689883398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yvt8Ku6KDe29tpizQm23o+O9+z8bar+cVRkERkmQ91w=;
 b=FIEiEaFZqrXW8g8YQ8JN5/m9jV8Rn+IH6+81QIfMP6OXn6Yx3ig8G05Rc2TzTjM92V
 QFyWvhupVc7i04q4dWNiplHx7Q54ZZ/p4Z4dTusHG2IpEOi6l1NkpfxgsTi6rwyQzD8n
 ZOC4c3xWeMOxZIeWojRjqw8OBPKWgl2fwPLd3RbgzlKjxxn5AGLn6dPVbCsBCTmJ3Rlm
 KPkU95S9zJR0wNt0nB+MgZSVuuEnUR/P3bGoZeVBJ9aeve2Juk38x177QueyngiiE4ST
 WdJInwrH3RsE3yoZvv0N4Pdg88osODnbFo9cvLG61hQfRW8CZlCBL3T4Aj9TXIDQV4Uq
 A3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689278598; x=1689883398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yvt8Ku6KDe29tpizQm23o+O9+z8bar+cVRkERkmQ91w=;
 b=T4rDD46E+LmRYRYqOSg0hgUJ+LzBOvS3cKiC4gh8T/TFdcW1sm5+eqabLm9gPnkMRJ
 jbqOMAQqBoB+Nx/bAZPgJov0F2QBiIQzzqzEq95ojE1BK9bEJMtLxprChBhMwWwKKEXT
 RZmj/YhGWxFxTZ9k98Ri28KN2OFNbdrNxbqg6An9SxHPLOdo+6hk+Ymchk/CBdPfnx0q
 AvnwLCrlYvf5I+7WIjlZY20Wbw4oOND/498msigI4V67P+BLGiX4glwCmuuGZrwe6hYF
 TSMMPdzeLEsXfWKy3fQ1bor03sg7umOrRauqq1np2nCUsrSIZIKSyiDVGQQ5Cxa9pRl4
 w/2g==
X-Gm-Message-State: ABy/qLZdf1DrT+V+NSQxbYLF8CP1A99hzcvZ/fsqCEB/+yZQnoYYbqkf
 t5CwN1FCE9O+TERCbVVTLUcP1g==
X-Google-Smtp-Source: APBJJlHvFT4NkzYf8AiTu0gZdv5cunOm8vlcbun9kkFFQ7/GyRaJ58yCVi/nDi7GsigvUUQbiZlZ0g==
X-Received: by 2002:a05:6512:398a:b0:4f9:5582:a7d3 with SMTP id
 j10-20020a056512398a00b004f95582a7d3mr218898lfu.22.1689278598227; 
 Thu, 13 Jul 2023 13:03:18 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x7-20020ac259c7000000b004f84b36a24fsm1227265lfn.51.2023.07.13.13.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 13:03:17 -0700 (PDT)
Message-ID: <a7aa6e21-6f79-0029-5034-db368239980a@linaro.org>
Date: Thu, 13 Jul 2023 23:03:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm: Fix hw_fence error path cleanup
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230712222523.7404-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712222523.7404-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/07/2023 01:25, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In an error path where the submit is free'd without the job being run,
> the hw_fence pointer is simply a kzalloc'd block of memory.  In this
> case we should just kfree() it, rather than trying to decrement it's
> reference count.  Fortunately we can tell that this is the case by
> checking for a zero refcount, since if the job was run, the submit would
> be holding a reference to the hw_fence.
> 
> Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.c      |  6 ++++++
>   drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 96599ec3eb78..1a5d4f1c8b42 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -191,6 +191,12 @@ msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
>   
>   	f->fctx = fctx;
>   
> +	/*
> +	 * Until this point, the fence was just some pre-allocated memory,
> +	 * no-one should have taken a reference to it yet.
> +	 */
> +	WARN_ON(kref_read(&fence->refcount));

It this really correct to return a refcounted object with 0 refcount 
(I'm looking at submit_create() / msm_fence_alloc() )? Maybe it would be 
better to move dma_fence_get() to msm_fence_alloc() ? But don't 
immediately see, which one should be moved.

> +
>   	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
>   		       fctx->context, ++fctx->last_fence);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3f1aa4de3b87..9d66498cdc04 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -86,7 +86,19 @@ void __msm_gem_submit_destroy(struct kref *kref)
>   	}
>   
>   	dma_fence_put(submit->user_fence);
> -	dma_fence_put(submit->hw_fence);
> +
> +	/*
> +	 * If the submit is freed before msm_job_run(), then hw_fence is
> +	 * just some pre-allocated memory, not a reference counted fence.
> +	 * Once the job runs and the hw_fence is initialized, it will
> +	 * have a refcount of at least one, since the submit holds a ref
> +	 * to the hw_fence.
> +	 */
> +	if (kref_read(&submit->hw_fence->refcount) == 0) {
> +		kfree(submit->hw_fence);
> +	} else {
> +		dma_fence_put(submit->hw_fence);
> +	}
>   
>   	put_pid(submit->pid);
>   	msm_submitqueue_put(submit->queue);

-- 
With best wishes
Dmitry

