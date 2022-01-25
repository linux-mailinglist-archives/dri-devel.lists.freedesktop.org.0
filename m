Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40049A77E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 03:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D78E10ECBC;
	Tue, 25 Jan 2022 02:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1D710ECBC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 02:47:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n8so13578333lfq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 18:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
 b=oh0ZGUYdJjwb/WULwnJIpti/MED7HLmMZVHOk9IKD0rr8P1tHXUBsy0GnBK6ZwnYIh
 tJCowFsUgGAVBBYLsw4BFJPAXHTlcoHxc6pkhKCwUUiyLK18hTNYa8EkrIiEUCK30f7+
 e9B86H6+E5jHBxNituWhdgYulf+E1Pmn2NoWGyUzDcZqU09ii/UfH4aWOc4QYjXOagRL
 nIKlAMTUw4RY6LRQmrof23eAD/aSAyNlQuygygGFJf+hwTpZPljRaWoVquCojr6YlrO8
 3vjCDFb1uGUKdCHRnXgGSUZMUGealQRlTR0nNvT522GnnVDptIvCHG88NDdprW0RNcVK
 mqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
 b=1v4C1SpEGImicnL+jFLCmOKZWeobDSYwPl85K7BjCVX/+aNherkGT3mKFtQAYMOOj7
 G20UPs7/UtDwD6ZAiSlMqvBUnKZp2uIZtr6Mz8FGgYSNCgy1c1HuG0rgmFzijvbsW7PA
 iQ/MtB7tRpzAzYEAxS2hnA9PpZcNB6fIU93w+q6kcQA7kO2HsfH9Aig1Ft6GwCd+Be+o
 XGTcG1AbY7HMAggeOGo9JvSkWf6jPBVrb5Q5mUhtwiBH3keFDq466QvhM0MZiUTau5fc
 y8wJhzi3nlVXi/8WBKiIVed+Uta3DmTyIEaMz1yQNZcRLaYBo08XTvJatxLVTsBcI5dJ
 h+Ng==
X-Gm-Message-State: AOAM533nLdozHyfrRT8sVxRdPxpK8V0jdBcevTiZeZ7Vc1X9QvBWBOt1
 arl1uZLgw94SyXN9xWO+c3PGzQ==
X-Google-Smtp-Source: ABdhPJw/HdOl+VUK3mcD6a1INueBqbK59eArLJlh5fV2q6DjMOQxtjwEObG+XzPUSBGydBKpE5XwKw==
X-Received: by 2002:a19:640c:: with SMTP id y12mr5522574lfb.245.1643078861686; 
 Mon, 24 Jan 2022 18:47:41 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u1sm1065629lfc.98.2022.01.24.18.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 18:47:40 -0800 (PST)
Message-ID: <4d9fa340-19fd-ee0f-0244-15ded5e66c67@linaro.org>
Date: Tue, 25 Jan 2022 05:47:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/a6xx: Add missing suspend_count increment
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220113163215.215367-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220113163215.215367-1-robdclark@gmail.com>
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
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2022 19:32, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Fixes: 3ab1c5cc3939 ("drm/msm: Add param for userspace to query suspend count")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 51b83776951b..17cfad6424db 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1560,6 +1560,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   		for (i = 0; i < gpu->nr_rings; i++)
>   			a6xx_gpu->shadow[i] = 0;
>   
> +	gpu->suspend_count++;
> +
>   	return 0;
>   }
>   


-- 
With best wishes
Dmitry
