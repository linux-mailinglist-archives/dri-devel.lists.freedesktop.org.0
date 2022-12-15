Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C964DCCE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 15:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B6910E0BB;
	Thu, 15 Dec 2022 14:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3879410E0BB;
 Thu, 15 Dec 2022 14:19:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e13so27234841edj.7;
 Thu, 15 Dec 2022 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cBQj9jBKLCqeFFkhSPkBgbsPvUUVxvlpmvVujeZcMVo=;
 b=BmtyYHtFs4XV4sd6Mi7VEXXxhLVsI+WMOwOlASH7zAb148BpIQ00m5fpR3OwLg73Rg
 1Jnp+Dk1hMFPGdSpufTfb3S/3nZZDSNTIc2iNNGGc071uG88BuQmt7Yf92xIS3kMf9nE
 EZQaiYfrgVx6QnoSBA9zTlw7OzMnVhbEkWURTrfEC1dHMtMQp0HcHHgWxpcjrR7GGew4
 9JrNSAdPI4NS9Q1klza1ZUK6aMAIAWhKwCRuccSEjVL2dFKuIn/S/2n2L/PvkFbz+ooA
 qs3qv90pldsA9MuOg0Venz2c6uQ+wL/K673xWJywb5+bOQLSiGOMjEFUGZeOwuuP9UWr
 KO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cBQj9jBKLCqeFFkhSPkBgbsPvUUVxvlpmvVujeZcMVo=;
 b=6n3BJwII+kc5+H+bxOERffEsjyzzeLMxs5dd70lmv/jlZWlYOaKbqmciid/5aNUvKS
 xVtyLE8XsgQ4rAaH1myIUF+RTRw80IDwkI2IcDO2nR6UPnz4Qp0Q67JKZWDq4tHZFuo/
 372doFx+HGc+qjdUpyHoDdyn3K5Oe6tB2yaJX6KfBVkmyJdhfqQx2slEahCkxlyHH7rm
 o1GEddttzRm1n+NVuc2dFKNwHFRMqiCVmnSV3gfMYHUNvC3G/Rmfv9b848g+DJju9+Or
 CB8iDBZMU6YsKDdGiYBZLdgq5kAIASnZvu66pE3C2hqstjVwAfu2qMBZDdwlZsr86+uH
 hn4w==
X-Gm-Message-State: ANoB5pkRWrOmQNoPLoLLtzxnBqSLigyE25uXlBC7ZKXEiKCese4vFI21
 XEwKn1gOoFzi+5abVQngYEnyP7yF+mk=
X-Google-Smtp-Source: AA0mqf6+RVANxMVf1nkwk15dGhutpVuAJjdO2z51JHNs0gyi9pf/wPb44IxIx9h7CXwAWibxaDyf+w==
X-Received: by 2002:a05:6402:eaa:b0:462:c7ed:7b41 with SMTP id
 h42-20020a0564020eaa00b00462c7ed7b41mr22697120eda.21.1671113997664; 
 Thu, 15 Dec 2022 06:19:57 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 w14-20020a056402070e00b00463a83ce063sm7346026edx.96.2022.12.15.06.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 06:19:57 -0800 (PST)
Message-ID: <0169e3dd-c705-175d-9045-2baf0cbabb78@gmail.com>
Date: Thu, 15 Dec 2022 15:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] drm/qxl: stop using ttm_bo_wait
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-6-christian.koenig@amd.com>
In-Reply-To: <20221125102137.1801-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.22 um 11:21 schrieb Christian König:
> TTM is just wrapping core DMA functionality here, remove the mid-layer.
> No functional change.

Any objections to this guys?

I'm basically just following a suggestion from Daniel here and it 
already triggered a discussion about the timeout for i915.

Thanks,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/qxl/qxl_cmd.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
> index 63aa96a69752..281edab518cd 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -579,7 +579,7 @@ void qxl_surface_evict(struct qxl_device *qdev, struct qxl_bo *surf, bool do_upd
>   
>   static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, bool stall)
>   {
> -	int ret;
> +	long ret;
>   
>   	ret = qxl_bo_reserve(surf);
>   	if (ret)
> @@ -588,7 +588,19 @@ static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, bool stal
>   	if (stall)
>   		mutex_unlock(&qdev->surf_evict_mutex);
>   
> -	ret = ttm_bo_wait(&surf->tbo, true, !stall);
> +	if (stall) {
> +		ret = dma_resv_wait_timeout(surf->tbo.base.resv,
> +					    DMA_RESV_USAGE_BOOKKEEP, true,
> +					    15 * HZ);
> +		if (ret > 0)
> +			ret = 0;
> +		else if (ret == 0)
> +			ret = -EBUSY;
> +	} else {
> +		ret = dma_resv_test_signaled(surf->tbo.base.resv,
> +					     DMA_RESV_USAGE_BOOKKEEP);
> +		ret = ret ? -EBUSY : 0;
> +	}
>   
>   	if (stall)
>   		mutex_lock(&qdev->surf_evict_mutex);

