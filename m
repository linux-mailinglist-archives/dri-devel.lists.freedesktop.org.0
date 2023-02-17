Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2FE69B48D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93A10E191;
	Fri, 17 Feb 2023 21:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3910E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:19:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d28so3192626lfv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kPa4zpKK9LMhVGjvMfR207w96ZbhPR+KevF5Kn6aqmE=;
 b=uKHb9GXrSgVAJfC4sLtp+TmdgFeeR9kYhPn7U6jZ6Z3ZzeLYVy05ogltF0Voigkf8n
 dTap3IwJ+ZOWZujr/WjR0tO83QDVH+d+DiKhqZYHOkBlMdLG0DYF4T0tUZ2d9Y+ysbWl
 F4hXQ2halCA+tjFyw3ioGxJJP+gBWxYNIzM2VcdO3HB/NzkYaHp6q4mATyhANatjB9zm
 mPbo2fi1KFi3MkFHs6j4Iq3+iSlO+vUfZywbRbdPZ2SPZtDD/ckG+X6VO9f+oxnesjBB
 WKQ3MWL4BACdLpZX6bLH7VVXqiYM+Vw6dArsGpdtJ1d6qnyrXlH5h9ehl2ppY8danPX8
 OOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPa4zpKK9LMhVGjvMfR207w96ZbhPR+KevF5Kn6aqmE=;
 b=Q21WorMh8lrcvW7pd4HS0y9Z1oeX7wSgajfZaqfmoRVQPOgPaCua/+Pq420VHePPkq
 u7w5yvqnQStXc2TNZt6W9eG/blzsvHV9sBgIskuDk3AL4v3I/iKQbN6Db6EsiMwjiteU
 peOUL1Ai/ybukBkWc0o8mBcPu6k+iHEcPw8VmjCjGZa9heAJNMCrMBttELozW1rB7Y8u
 o4dTRuXEGpZivhkr/zuMBXIsbA75dRk+7G9vnQ8mMFp+rf2MNKEmOJfqVR4l4QKg0YYH
 ZtLZpL2UlI+CU2MzheXT9m9kH3QrPprzJcfPLnBZk8MI6l4is0q0CjlrkiW9WVwEvQgE
 gbDQ==
X-Gm-Message-State: AO0yUKVwCt4wLY2pV9ACTUOELnaDK/hf7VJJVVAIhgNTMaGaDq7V0ZYX
 uftTaVObNNTiPlRmUloLCTTN8g==
X-Google-Smtp-Source: AK7set8ANGwm2kcIXjfTUhgay6r6hLONjkhUR4qB3WgVOAUNlj1S9WRNkRSndrQkmSrLevDlX4GipQ==
X-Received: by 2002:a05:6512:3ca9:b0:4da:f379:9f60 with SMTP id
 h41-20020a0565123ca900b004daf3799f60mr2572847lfv.33.1676668797721; 
 Fri, 17 Feb 2023 13:19:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l27-20020ac2555b000000b004cc9ddce3adsm779134lfk.82.2023.02.17.13.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:19:57 -0800 (PST)
Message-ID: <26baf35c-cc96-3911-95bc-c675123fcc49@linaro.org>
Date: Fri, 17 Feb 2023 23:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 11/14] drm/msm/a6xx: Enable optional icc voting from
 OPP tables
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-12-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-12-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
> for us. This is however not the case for the other GPUs. Add the
> dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
> bus voting as part of power level setting.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d6b38bfdb3b4..b08ed127f8c4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2338,5 +2338,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>   				a6xx_fault_handler);
>   
> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return gpu;
>   }

-- 
With best wishes
Dmitry

