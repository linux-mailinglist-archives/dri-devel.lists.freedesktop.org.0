Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AA74A787
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 01:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71D010E043;
	Thu,  6 Jul 2023 23:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580F10E043
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 23:23:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f766777605so1887829e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688685778; x=1691277778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pAuD422yaocz6mSARxaXOG2X28jLXqDNZRoVPwDpGMY=;
 b=TTeNoPbzsWFiyCSt7IL6eQva8/rL1Yo0KvsZzQpGjoMPaOs1RlTnpm2HN2ZZqgNxXM
 85pYvZCJEzLuBpuakEANQafLFxpO/CfVgZz1tnURFOMs7JlZMdjhyKWCWWUcZV3jPawm
 oXv2Do0SbLRWhKFh415PsL7MCnjnx+TbFMogWPbBKUEuJk1Wpn7gUiUDAtTc/0zrGVeE
 K82uvun29lPGibc6h2GqoB8vns6tP98rfCTpukk1xLfU/0pHZZ8DJnvPQnseqUA1PN+i
 WLmlbj9JWaVmNx9u9y+uqBIS0XphkpXDFw9Btsj5hK8tKsVh6oArkdO5C8sFk/lJW13b
 ungA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688685778; x=1691277778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pAuD422yaocz6mSARxaXOG2X28jLXqDNZRoVPwDpGMY=;
 b=EsqhzNvQPUGMyqh414ZxMX4EMk4r711AnXQTSm4eStkV5I6TyE3sjcWd2ms4ErjHVI
 EaKvBdxvQ0jd3wdmbKfYwZ+F69Xnq99rP9Inf7BXAP1bCZRqIt4nfoYItlp+w+YvXtD6
 3gSQOwyd0oOkn4W79mACvw9ynspxeiGqTcMoY8EA6WuiwIFCcMXFOtD5jfmjjxEikH+U
 3ZpcYPk/ZDR+sE2gq1RnIJFsoHSBaXWJ5O/jbIkv7U+F8i1oiXotIFHGW2YjQvAaNrEZ
 1z0fkGAP0f/ovd3F2N2O5vrkJFGRj+Tv9Rzx6rNDuuvu+RDV8aFAHWkeRgt4AZB7bTrA
 C3OQ==
X-Gm-Message-State: ABy/qLaBskeR77URdUyhCM65Y5Jo7gGpHoX75tdhUWtTHOY1HhsN3kcB
 Xx6P+QoOA2pH/qASVELqRRt1tA==
X-Google-Smtp-Source: APBJJlHgRITQqgW3eggtfi7HM9//NWQO+t35mgaEAcrsW0HuzMOhHot7qRbzlhg7cZglYX3WYFkO9g==
X-Received: by 2002:a05:6512:252b:b0:4fb:8cc0:57e3 with SMTP id
 be43-20020a056512252b00b004fb8cc057e3mr2753017lfb.62.1688685778115; 
 Thu, 06 Jul 2023 16:22:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac244c2000000b004fbbd81856asm437654lfm.143.2023.07.06.16.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:22:57 -0700 (PDT)
Message-ID: <97693b20-f374-db81-47b0-e77802dfe3a6@linaro.org>
Date: Fri, 7 Jul 2023 01:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/12] drm/msm/adreno: Remove redundant gmem size param
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-3-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Even in the ocmem case, the allocated ocmem buffer size should match the
> requested size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

> +
> +	WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem);
I believe this should be an error condition. If the sizes are mismatched,
best case scenario you get suboptimal perf and worst case scenario your
system explodes.

Very nice cleanup though!

Konrad
>  
>  	return 0;
>  }
> @@ -1097,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = adreno_info(config->rev);
> -	adreno_gpu->gmem = adreno_gpu->info->gmem;
>  	adreno_gpu->revn = adreno_gpu->info->revn;
>  	adreno_gpu->rev = *rev;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6830c3776c2d..aaf09c642dc6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -77,7 +77,6 @@ struct adreno_gpu {
>  	struct msm_gpu base;
>  	struct adreno_rev rev;
>  	const struct adreno_info *info;
> -	uint32_t gmem;  /* actual gmem size */
>  	uint32_t revn;  /* numeric revision name */
>  	uint16_t speedbin;
>  	const struct adreno_gpu_funcs *funcs;
