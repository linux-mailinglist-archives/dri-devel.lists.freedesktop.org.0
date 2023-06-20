Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8973730F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AF10E308;
	Tue, 20 Jun 2023 17:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6510E308
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:40:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so2902417e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687282841; x=1689874841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqAZNQk7Z69YOwb0M82rDabEev5i0RfMRmDQpnJ2T2k=;
 b=p/oYYTa+njNZ8YxPjsVGh3kzhKXu2dfQOzkL+VXETO9VyeJIh2yDg1XLZHJNa1zr95
 RDea42DywaJjCsZ4Ebw8fskxYOp0we6rRu7HKh0BDs94t0VdEDg3sE0J0E9oDSVvnPm9
 mRLtLVZiJYVVE9GUnad3awtQYqou1P8Ovo+tJJjH8ybzxh0MhIccpABciGHfPyNeljBy
 pGtyW6Xs/9moRpqpSY+YYPIDYlsvpT/O44pJHzGtViSDHvP46inYHH/jj/4D08Svrtl+
 j48xXm22jPKAaPk8bc/XqAHJoD70MXSqq0+HlrgNVAS9TnOifVd8yobGB8mE0+2N8mGm
 eRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282841; x=1689874841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqAZNQk7Z69YOwb0M82rDabEev5i0RfMRmDQpnJ2T2k=;
 b=Yy3CvYYCfjO7fjwrX1BvjW893st3UQuSxRXUUO79ORru4vxX9E1wUMxvxDqpHn6JSS
 BuNhFXG8seKiF5uvGoma4LkR3oLlAXNwht9WFigEsUZs+bMEApM5r67HVEy3IuTQd0Oh
 w+53FqXACbCZa2gUmOTB3+gxFLN/Wvkvmdx+63oCfsvQ55DnCU8kJMK7675/ol7TYyHD
 qFSnQlkcmEkj5aGGYf+ChHb3fhwUVJJRcfaOpYBZLPWbe7iAfJl3SrdPzWlL29+z71kQ
 jWfMKZxzOFwYR7tIlnGAF/r1DSmUZsFPYcZMNLizC1Wmrn7cYTtebh2Xx4mcbv3t7G8W
 useA==
X-Gm-Message-State: AC+VfDyaNfO2t5/go0DvGIMGh0t9avqtG3mINroSYaoEtuoZsRurssgj
 bTpvAWpvikifgmNUefuNfYBKZg==
X-Google-Smtp-Source: ACHHUZ4Mkz/tejUG8wsYLqpASgat6I12ValXWs3lcWJQuEUxr5KtZ43SFyTWMbguvw69zgCEm6NX5A==
X-Received: by 2002:ac2:5f9a:0:b0:4f6:2f97:7f8b with SMTP id
 r26-20020ac25f9a000000b004f62f977f8bmr6644997lfe.1.1687282841247; 
 Tue, 20 Jun 2023 10:40:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac254aa000000b004f20d0ebe50sm440511lfk.94.2023.06.20.10.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 10:40:40 -0700 (PDT)
Message-ID: <254e633f-1cc4-0eac-d6d9-365f78433227@linaro.org>
Date: Tue, 20 Jun 2023 20:40:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/a3xx: Pass the revision information
Content-Language: en-GB
To: Fabio Estevam <festevam@gmail.com>, robdclark@gmail.com
References: <20230620173305.896438-1-festevam@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620173305.896438-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2023 20:33, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Commit cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
> before being set") exposes the need of setting the GPU revision fields
> prior to using the adreno_is_xxx() functions.
> 
> Pass the GPU revision information to avoid run-time warning.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

I'll take a glance later. Generic comment, you missed freedreno@, so 
these patches will not pop up in our patch tracker. Also could you 
please use git send-email passing all patches to the command, so that 
they are threaded?

> ---
> Build-tested only.
> 
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index c86b377f6f0d..fc23810d7684 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -530,6 +530,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>   	struct msm_gpu *gpu;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct platform_device *pdev = priv->gpu_pdev;
> +	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct adreno_info *info;
>   	struct icc_path *ocmem_icc_path;
>   	struct icc_path *icc_path;
>   	int ret;
> @@ -558,6 +560,25 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>   	if (ret)
>   		goto fail;
>   
> +	/*
> +	 * We need to know the platform type before calling into adreno_gpu_init
> +	 * so that the hw_apriv flag can be correctly set. Snoop into the info
> +	 * and grab the revision number
> +	 */
> +	info = adreno_info(config->rev);
> +	if (!info) {
> +		ret = -EINVAL;
> +		goto fail;
> +	}
> +
> +	/* Assign these early so that we can use the is_aXYZ helpers */
> +	/* Numeric revision IDs (e.g. 630) */
> +	adreno_gpu->revn = info->revn;
> +	/* New-style ADRENO_REV()-only */
> +	adreno_gpu->rev = info->rev;
> +	/* Quirk data */
> +	adreno_gpu->info = info;

This looks like a boilerplate being added to all aYxx drivers (and then 
these fields are also set in adreno_gpu_init()). Can we remove 
duplication somehow?

> +
>   	/* if needed, allocate gmem: */
>   	if (adreno_is_a330(adreno_gpu)) {
>   		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,

-- 
With best wishes
Dmitry

