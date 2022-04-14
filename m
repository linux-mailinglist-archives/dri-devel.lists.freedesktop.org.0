Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7217501D5B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3150110E21D;
	Thu, 14 Apr 2022 21:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426010E247
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 21:22:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b21so7598076ljf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N4HLGfvB+8+NMPcma6ojtQZuOsbor7W890ru+Wl5k+A=;
 b=Vtu2zM9TgoLp0lFsN8cZ84YFteD6ZDK8uHWYw9y4EpaMfzQIj55ErNEGzbMA6Ij+Nx
 Hdq9rICuROBOdBoBNCwt02Z47zs+QKwjYYvCrZ5VfikSNEbtsrPY7IF0Qn9s2ruKYdSV
 MqMepUNNvdia8syLrys1RUq1FFwoj6hLCpFcDjmpTpuIUP2Hl4f4PNYk/MCTeVj+vvpB
 NFtiuputIq5Kq/D1ogchg8xfjaCT3ieidhvRxZghb7BnQskt1+vS2Q/fz8TwPczcFomr
 csnScCGdu4XkhtyqfP20lKWV18tpTNxLG2Phuis/fHu/fglP2zhDI9YuNbM5dsoy9Y9d
 Yryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N4HLGfvB+8+NMPcma6ojtQZuOsbor7W890ru+Wl5k+A=;
 b=zQ54R40YOqIyXsuNwkLPqUD93aK3yzwgSbGWmq52oXNho7DOPz+b2zWe5jKaA9BC9I
 oryX7vVK/wzQ9C4HcAOeeiSZ/F+Tlb6THwqjx6zqPU0qDjp+zScJ2uM3fSfu9x3MkIoX
 I1WsMoHA1WbFShkKNPhEdupljkELz2FZZn4632/uk9Ae8p5QFbJFXa2+7NAko2bC0l5j
 aU3ca63Ktrmzxdg4x0Fp93ReDpAy4PR8K24GFr1Da9WhXajaSrJa6vt8sEZ6Dw7EdEk3
 Ydwoi8ccrHet9pGoukPxUyvZAEGdg3wZtPhog2XkC+ORgZbO8bebvp1KSpqoXT6rp15p
 9VbA==
X-Gm-Message-State: AOAM533Ob0NH9l7greU+tuK+mSoJlHEQJC8aSEI5ZhC2Hq3yJjrPYC1w
 3nxi9RPClcVQvcHLByhgqBvTKw==
X-Google-Smtp-Source: ABdhPJz3h3GOjyhWlMc5Z/uIaPCL2LUsnN4ZjhJCyjF7rOnkzpRWDzc13CNpIFg3DaMvmP4G15bTeQ==
X-Received: by 2002:a05:651c:508:b0:24b:147b:161c with SMTP id
 o8-20020a05651c050800b0024b147b161cmr2605943ljp.459.1649971371418; 
 Thu, 14 Apr 2022 14:22:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056512330600b0046d11847ccasm112122lfe.227.2022.04.14.14.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:22:50 -0700 (PDT)
Message-ID: <be83952d-d411-d0c8-e05f-ad50a8ba9c0e@linaro.org>
Date: Fri, 15 Apr 2022 00:22:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 03/10] drm/msm/gem: Convert some missed GEM_WARN_ON()s
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220411215849.297838-1-robdclark@gmail.com>
 <20220411215849.297838-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220411215849.297838-4-robdclark@gmail.com>
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
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_vma.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f914ddbaea89..64906594fc65 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -44,7 +44,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = vma->node.size << PAGE_SHIFT;
>   
>   	/* Print a message if we try to purge a vma in use */
> -	if (WARN_ON(vma->inuse > 0))
> +	if (GEM_WARN_ON(vma->inuse > 0))
>   		return;
>   
>   	/* Don't do anything if the memory isn't mapped */
> @@ -61,7 +61,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (!WARN_ON(!vma->iova))
> +	if (!GEM_WARN_ON(!vma->iova))
>   		vma->inuse--;
>   }
>   
> @@ -73,7 +73,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = npages << PAGE_SHIFT;
>   	int ret = 0;
>   
> -	if (WARN_ON(!vma->iova))
> +	if (GEM_WARN_ON(!vma->iova))
>   		return -EINVAL;
>   
>   	/* Increase the usage counter */
> @@ -100,7 +100,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (WARN_ON(vma->inuse > 0 || vma->mapped))
> +	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
>   		return;
>   
>   	spin_lock(&aspace->lock);
> @@ -120,7 +120,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>   {
>   	int ret;
>   
> -	if (WARN_ON(vma->iova))
> +	if (GEM_WARN_ON(vma->iova))
>   		return -EBUSY;
>   
>   	spin_lock(&aspace->lock);


-- 
With best wishes
Dmitry
