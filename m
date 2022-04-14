Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C0501D5D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49CD89B49;
	Thu, 14 Apr 2022 21:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7D10E247
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 21:23:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h11so7604283ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VQIdnqaToAeSGi4V4hfwlWUa2yYv1KhMo/84wlTI9mM=;
 b=SqXH32j9vQgeD7fKz53XGDlqOxBaWGIGIl3mdRsppSndrFjmM2rnEZOUh84Q+fUr4b
 wqFKhykSwViGZaybyZp6SaJLlDBH36DNAkUEqEd3gP5atU7Q0HRIAgnw5F+wE8HlxIZQ
 6saNqVtAoh1lTsOKuQm9XTbu7/PMYx2OvPKRpIWsCtA2TA7nM8kmepRkNjKMHozZ6NEx
 dBtmEkAYQzj2+0fpS1kRxT1y99XKdICjn0Bc93d4wyDq7mGeMaTAR34rCgmGdVl4+vDA
 WhV5XAWj5Q4BpYvKBKGm1WH559V4WLdmT7R6romA9ejGpkW8kmioX0lkuF34y4wEGv4I
 NGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VQIdnqaToAeSGi4V4hfwlWUa2yYv1KhMo/84wlTI9mM=;
 b=QL9d/Fc3GjQtwMWQC19gtHIzec2ZfdOT5DqRvDxNPi6r98+ip+7+1piI1mIATh0EXC
 VcO6SrRhWZbrqBV7R+VN+2IdSbrz0vykiIFKep9KH8g+pUBA/zThjugxSqSPEAD8lFPy
 +RV69aZsdw86zvZUmShrOEyR+r8UL9Cbmm/lA5MPxTrFqmXQS/vvMVMWailip8hiQaCD
 w+sEblnkE8wu9IgNzzpAGXPtq87w0RKq3NIkhZ0RL/MTdaNPQ7J5wXHS2SYSF9TDlf66
 K6oERDxUPViFdElA6ukCjwrtuij5Ru1d/jUTaAMxypcEtW+kLAJRUibiohfbcPmHGcW/
 P8eA==
X-Gm-Message-State: AOAM5311CeHtGXPS09vBj4KBM9dxDb/vs+20hfJ31kXziqFqzU6Vl8lL
 JQ7wEncH0Nw2CitQACWGnLZW1g==
X-Google-Smtp-Source: ABdhPJz8jxuXsHCJ+G/fkprknn54Q1j8E7uXYzDfmJDesdXBgFmBraJZoVV9pXyXAc7Goo4XpLFvOA==
X-Received: by 2002:a2e:90d6:0:b0:246:e44:bcf6 with SMTP id
 o22-20020a2e90d6000000b002460e44bcf6mr2590313ljg.501.1649971396661; 
 Thu, 14 Apr 2022 14:23:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a19385e000000b0046d16dbebebsm115076lfj.39.2022.04.14.14.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:23:16 -0700 (PDT)
Message-ID: <a3c87373-1b7e-7b30-3b03-7a87f517b7b3@linaro.org>
Date: Fri, 15 Apr 2022 00:23:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 04/10] drm/msm/gem: Split out inuse helper
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220411215849.297838-1-robdclark@gmail.com>
 <20220411215849.297838-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220411215849.297838-5-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2022 00:58, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Prep for a following patch, where it gets a bit more complicated.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem.c     | 2 +-
>   drivers/gpu/drm/msm/msm_gem.h     | 1 +
>   drivers/gpu/drm/msm/msm_gem_vma.c | 9 +++++++--
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a4f61972667b..f96d1dc72021 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>   				name, comm ? ":" : "", comm ? comm : "",
>   				vma->aspace, vma->iova,
>   				vma->mapped ? "mapped" : "unmapped",
> -				vma->inuse);
> +				msm_gem_vma_inuse(vma));
>   			kfree(comm);
>   		}
>   
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 947ff7d9b471..1b7f0f0b88bf 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -61,6 +61,7 @@ struct msm_gem_vma {
>   int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma, int npages,
>   		u64 range_start, u64 range_end);
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
>   void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma);
>   void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 64906594fc65..dc2ae097805e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
>   	return aspace;
>   }
>   
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
> +{
> +	return !!vma->inuse;
> +}
> +
>   /* Actually unmap memory for the vma */
>   void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
> @@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = vma->node.size << PAGE_SHIFT;
>   
>   	/* Print a message if we try to purge a vma in use */
> -	if (GEM_WARN_ON(vma->inuse > 0))
> +	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
>   		return;
>   
>   	/* Don't do anything if the memory isn't mapped */
> @@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
> +	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
>   		return;
>   
>   	spin_lock(&aspace->lock);


-- 
With best wishes
Dmitry
