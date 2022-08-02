Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A758779D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 09:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005702B038;
	Tue,  2 Aug 2022 07:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA592B018
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 07:14:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z20so7555742ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 00:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VO7iKisYqXn9gq//Drvzc4IU8FHAbNWbiNlXqoODgOM=;
 b=BHY9W6lthh/+SlYcXhzf70uhuZagL1J/CwBCzUmFuyXKE0AnmUk3pZJ5BbF7yrgkkz
 4+UKPB7g/1kcN0oJ+P3369aGQq9DXdsqJCtcyvKpib8uWCA3rw/EznQmChAS18o7r2+G
 cSSHN2xMb7QaroRC3i39Sv9zoEQQBqFhDM/sAJ1Isf4UqXHEPiE4pcCywtmDIXwugaa1
 pn0vdICsjDOqAiZzdUe8cczXT3mzcme7KmNwtVrKJB3EKwt15P3OZkfj+Pe7ciNZD1mx
 fC61YXxXrpsD3UibIQTCA/AfZ+y2Nf4bM12NrWSaEEpo3hI4u+g9AefaHxvN1jGXHBRh
 xljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VO7iKisYqXn9gq//Drvzc4IU8FHAbNWbiNlXqoODgOM=;
 b=2SpV8RWXJm4KZa/4VZcIDd9N5amxM8uGZ+97QSDqTFl7IPbRoqdvW4I3I0wmc+euNX
 8IHpJpDxjlVBUyHXfDPzgB7j0Hm1boZAlCnpK9FMlGMYd+xOEuIU6xjZd5zOwzE4+WAm
 nBniwvdr2HJi5BugDupauw3+HpyyUTezsYF7FKt6bCOtn9K2DtNcTaNWxbwZ2PMgW9Ga
 QYfB2QoVjiJfF5WCefqxV3HUEkrFOG+jRnkrzFiu9AKuMmrVviEmGDTg19bFdrr+A3kb
 OZLc+vsUnG3bdoM7HfA8Oo6CpdldljB/SmZ+vD+DQR+G6v7gCpL/h6eWHWzCvkOkBFmy
 GJdA==
X-Gm-Message-State: ACgBeo0IkP3IrosQDtCPbkjRk1upQimiZ5oat6DaHLJoWJZ807fPrjSq
 hssFvOOmZev5PuEL2sdzPQtlfA==
X-Google-Smtp-Source: AA6agR6/Jmi2axMFmM5dshEATFksCp6XfsK+VigG+KH8Rzfsrr0wC0UgMCu/xHtn///Lcw2NpmrIKA==
X-Received: by 2002:a2e:90c2:0:b0:25e:5d60:14b with SMTP id
 o2-20020a2e90c2000000b0025e5d60014bmr382110ljg.24.1659424450278; 
 Tue, 02 Aug 2022 00:14:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a2ebe13000000b0025e2b567434sm1801513ljq.9.2022.08.02.00.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:14:09 -0700 (PDT)
Message-ID: <8715e07f-9d58-1ae3-9a3a-25828b545905@linaro.org>
Date: Tue, 2 Aug 2022 10:14:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/8] drm/msm/a6xx: Ensure CX collapse during gpu
 recovery
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730150952.v3.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220730150952.v3.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/07/2022 12:40, Akhil P Oommen wrote:
> Because there could be transient votes from other drivers/tz/hyp which
> may keep the cx gdsc enabled, we should poll until cx gdsc collapses.
> We can use the reset framework to poll for cx gdsc collapse from gpucc
> clk driver.
> 
> This feature requires support from the platform's gpucc driver.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> Changes in v3:
> - Use reset interface from gpucc driver to poll for cx gdsc collapse
>    https://patchwork.freedesktop.org/series/106860/
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>   drivers/gpu/drm/msm/msm_gpu.c         | 4 ++++
>   drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1b049c5..721d5e6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/devfreq.h>
> +#include <linux/reset.h>
>   #include <linux/soc/qcom/llcc-qcom.h>
>   
>   #define GPU_PAS_ID 13
> @@ -1224,6 +1225,9 @@ static void a6xx_recover(struct msm_gpu *gpu)
>   	/* And the final one from recover worker */
>   	pm_runtime_put_sync(&gpu->pdev->dev);
>   
> +	/* Call into gpucc driver to poll for cx gdsc collapse */
> +	reset_control_reset(gpu->cx_collapse);

Do we have a race between the last pm_runtime_put_sync(), this polling 
and other voters removing their votes beforehand?

> +
>   	pm_runtime_use_autosuspend(&gpu->pdev->dev);
>   
>   	if (active_submits)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 07e55a6..4a57627 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -14,6 +14,7 @@
>   #include <generated/utsrelease.h>
>   #include <linux/string_helpers.h>
>   #include <linux/devcoredump.h>
> +#include <linux/reset.h>
>   #include <linux/sched/task.h>
>   
>   /*
> @@ -903,6 +904,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	if (IS_ERR(gpu->gpu_cx))
>   		gpu->gpu_cx = NULL;
>   
> +	gpu->cx_collapse = devm_reset_control_get_optional(&pdev->dev,
> +			"cx_collapse");
> +
>   	gpu->pdev = pdev;
>   	platform_set_drvdata(pdev, &gpu->adreno_smmu);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6def008..ab59fd2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -13,6 +13,7 @@
>   #include <linux/interconnect.h>
>   #include <linux/pm_opp.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>   
>   #include "msm_drv.h"
>   #include "msm_fence.h"
> @@ -268,6 +269,9 @@ struct msm_gpu {
>   	bool hw_apriv;
>   
>   	struct thermal_cooling_device *cooling;
> +
> +	/* To poll for cx gdsc collapse during gpu recovery */
> +	struct reset_control *cx_collapse;
>   };
>   
>   static inline struct msm_gpu *dev_to_gpu(struct device *dev)


-- 
With best wishes
Dmitry
