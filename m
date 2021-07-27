Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AC3D7EEC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731A6E452;
	Tue, 27 Jul 2021 20:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE146E452
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:11:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l17so264007ljn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y+K40mFFV/ei9G5K8b7BdAkN1qwtBpRi8uDtKqosQ18=;
 b=SnSX+bXTD7zMfAM9ndnjbj7EIUckOlEdKEjulAoasK6O5z5rDDWXHJcHnB/MnQW/eF
 frEQ3uH4T1b4H0Ix9lzIBtvCPQTxyYqNqMAClFCG9Yg/Ly4WCZ6/gATnQDR/d53pROE9
 WaFqBE1ZsISO79uymky+aLogjUtZDc94PPUlgLdWBepAhbommIZWwjQ/Q/Yue6FU5C0w
 D0baySJuB0sFQ3LrKEmorKWBTp0Xvtrebzg4dAE06mZnzGjFS+Qs3gcOPhlvUTFiyvAr
 Sg0vjHzJ9ESwf6xgTZNIyuXwIUBsbyYNG+DdRlcCDie4FdvsHzN+rttO7KH6Tdsc1jgL
 eicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y+K40mFFV/ei9G5K8b7BdAkN1qwtBpRi8uDtKqosQ18=;
 b=T5y/sWPV73H/1SQbLGE12Q12JER5V/pMGCEPb/mK/hSCl4II/1Fv+LoqMsrG1sA1Kj
 gWUDVpvv5CCmUlV6I9TiqwqpBl1yPWNTQtGPVAGkE+jHKrJ/U1clB90umMJFX5hWwtj4
 VEW/3XnK67Ff0Y+s2SR/3YY4n+mOUDC1Ok8g1Vg3NhAtu20aingzVLeCCQZXBxf4Mv1l
 l7uFaXliVtMNtpc3aqwRKX9lTuGsI+1vmg3tBqrrrinZHf0aKb9wcPOcJxnTGMjuABf6
 W32t8ax/dZ+S5dxNNFsrmx66n5csXVTXuNlH0hSj9nIKMtCFeCKY4kw1kcfzFCXB8drO
 Dn1g==
X-Gm-Message-State: AOAM533JfmHWw3D/hOzftCh46w9EmZbKMOkL+pgpxHQ9wXPDxcqPJC1K
 dqHzg5a3VVlnmaLqUL+5uw0IfQ==
X-Google-Smtp-Source: ABdhPJyS/Ff7CGi1er9V6ecbR8FKgsuSjzqzA7zO6o0yP12DYxkn7JCFiAZTsuDvwoycwrwWDny7gg==
X-Received: by 2002:a05:651c:211d:: with SMTP id
 a29mr16600876ljq.78.1627416714252; 
 Tue, 27 Jul 2021 13:11:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a7sm376732lfr.203.2021.07.27.13.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 13:11:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] drm/msm: Split out get_freq() helper
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210726144653.2180096-1-robdclark@gmail.com>
 <20210726144653.2180096-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ba388984-3fb1-ae8c-1382-119847981ba8@linaro.org>
Date: Tue, 27 Jul 2021 23:11:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726144653.2180096-3-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2021 17:46, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In the next patch, it grows a bit more, so lets not duplicate the logic
> in multiple places.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 3bcea0baddab..2e24a97be624 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -37,17 +37,21 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	return 0;
>   }
>   
> +static unsigned long get_freq(struct msm_gpu *gpu)
> +{
> +	if (gpu->funcs->gpu_get_freq)
> +		return gpu->funcs->gpu_get_freq(gpu);
> +
> +	return clk_get_rate(gpu->core_clk);
> +}
> +
>   static int msm_devfreq_get_dev_status(struct device *dev,
>   		struct devfreq_dev_status *status)
>   {
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	ktime_t time;
>   
> -	if (gpu->funcs->gpu_get_freq)
> -		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		status->current_frequency = clk_get_rate(gpu->core_clk);
> -
> +	status->current_frequency = get_freq(gpu);
>   	status->busy_time = gpu->funcs->gpu_busy(gpu);
>   
>   	time = ktime_get();
> @@ -59,12 +63,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
>   
>   static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>   {
> -	struct msm_gpu *gpu = dev_to_gpu(dev);
> -
> -	if (gpu->funcs->gpu_get_freq)
> -		*freq = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		*freq = clk_get_rate(gpu->core_clk);
> +	*freq = get_freq(dev_to_gpu(dev));
>   
>   	return 0;
>   }
> 


-- 
With best wishes
Dmitry
