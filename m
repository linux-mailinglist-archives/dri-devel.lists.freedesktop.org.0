Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A954AFFFD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7972B89F31;
	Wed,  9 Feb 2022 22:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA2589F31
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:17:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i34so6943074lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=T9akMQGOGv0TdBQ+Zhymh6XiC98Y7uCuYr8S0QfufYw=;
 b=So89NUtFvR12bmWOhO2nI5d8soc5b89oiH6ChTJGXB7g1HWfnQxgnN07opHsWJJbDY
 +YcN7dVNKQiiXNQNyqF64SdA5fDsk/RHoHiSAtN+aD7T/RpjjWAAiezNp03ig23l4YWi
 dXoxKgcP5yNxjFunr8JDwDmPnZjzNobzJ90mlchJ+akOWikw7A7mYM62pzQEW1PD10sx
 /j5luWQKYxjGaxpaAxFNNnfI7KLJbBkjz3c1dA/Y4YO+OqpZCSSAWBwhv48NUUCq24bu
 yWq3UtqIkCiHf3ONkQQuUSth6JYjyjgwM7f9sur8i6IjrY6uyLYA4JYlB2zGUH0fMNVK
 o3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9akMQGOGv0TdBQ+Zhymh6XiC98Y7uCuYr8S0QfufYw=;
 b=PBCJRxq5f/oSkk3ZwCsftn2dMWKVrIGheGPCGjx6Dz7h5o3frGpnw72WV4qRx7Nvf2
 qoK/piDYKXsY6W8p6Y/sgzajoqTquJ3TKX2KarD8r720GBFyUNDroOfkhBiwIO5orET2
 +wLa2I3qwLgHUIk5ZwfuR1VcN5TIuE1wmdtIjyBYuqs0XC8h5KoMNAwByE5/5R+u0++b
 Tz0x2oGhAS/i7mRwRQBioW/sCzVl4gwcrIf/jzQrOKWlzSeMxYUMTGUcAh0j19WR/gWI
 c5jPeaUYhQj9ME+O3tN/oc0MaQRerJ6hvs0dls05D47Kcjwv+h/JKW9y1YoroG8cVl7T
 K/Zw==
X-Gm-Message-State: AOAM530H/QkLfPe40vahnZnZVXwUN+0YP7XpoCWHXOAA89+9angpjrsq
 dTn+0smP2auJYbCmRZ7IZwUXWw==
X-Google-Smtp-Source: ABdhPJxW/IKBuQbesqGO3kgP8T+UCOU7nfSM5QCDmtANUvL9RHgmlLxrVB+EsyElYkDADCFQXe+zNw==
X-Received: by 2002:a05:6512:1502:: with SMTP id
 bq2mr3004500lfb.551.1644445038733; 
 Wed, 09 Feb 2022 14:17:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k21sm2527309lfg.252.2022.02.09.14.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:17:18 -0800 (PST)
Message-ID: <6ea0e85e-1ade-f102-86c2-4b71dbc24285@linaro.org>
Date: Thu, 10 Feb 2022 01:17:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: gpu: drm: msm: use div64_u64() instead of do_div()
Content-Language: en-GB
To: Qing Wang <wangqing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2022 11:37, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> do_div() does a 64-by-32 division.
> When the divisor is u64, do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.
> 
> fix do_div.cocci warning:
> do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 2c1049c..aa4617b
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -648,7 +648,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	/* Calculate the clock frequency from the number of CP cycles */
>   	if (elapsed) {
>   		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> -		do_div(clock, elapsed);
> +		div64_u64(clock, elapsed);
>   	}
>   
>   	trace_msm_gpu_submit_retired(submit, elapsed, clock,


-- 
With best wishes
Dmitry
