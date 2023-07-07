Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5336374A7F8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634DF10E138;
	Fri,  7 Jul 2023 00:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657B10E4D6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 00:04:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so1887908e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688688283; x=1691280283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V1XmK8k89NVYCgvz7DmgyjojdN9jXju1+8dOgTl5G8c=;
 b=bCH7XRZIayiwGnSpAdV1Auo2YV3MmCYJvGXdcaAcvi9VIp3YJHwsbrj1ouGnd2toBc
 Q/6VgYnMh857JZwCSo42n+EcmzbJLXF7sCLLeOrUPHnfRSf9+85RTfb0knat0eytA2L0
 H8YX/3ZNmKOaXtKL8mc8GydihPzeJeESgtzyDaeEIDszpVd2ycDoI/siweNyoVGvBWbF
 nV1BfpNxBbO/Y9SmdI+LM601gxJ7l08+nhbLurF7VGoeG2Z4kg//TKZ7gkdSsaJJLt6A
 O+VvJs9vm9U08eKvRywxb+foN+0Xk2Sq0z1bbFWETRX1+OnpjSGg/pO0OWjf+zaw2rLT
 QaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688688283; x=1691280283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1XmK8k89NVYCgvz7DmgyjojdN9jXju1+8dOgTl5G8c=;
 b=NbeyCKNYM8gcDMvs8vUlWBgCOBrWPa5oHY/m3V4TKpiHWSXrbG7wvGCfeYtfSQI4ID
 aUTUfQ515/2rv4rWBF4eIjvyaqmLy0T+XhxxU957Hn3gU5eA0pLmPR1pbH8HiF1tFKAc
 Im83LF7EZkyghq4BBJ6x63mOoH6yZBMnSNdu4JgKPkG5F25PQfAlKRSzzNLAKLOIhKVO
 pPr+dMI/yUxWKuHUtqo/3veRrKUC6TtBZBtQ7OX1qqStqZMS8YaqouG+1z7U8fvuIj01
 qy8zaZiMHE2nCJKNQbiIPxseT1pDNKOuSgeh16XYgvgSkheU0pQ2RAraCeSi2l6DUqhD
 3FJw==
X-Gm-Message-State: ABy/qLbv9mFyct3vUYBpW+xsQVgsHnchj+9IL9CU1jWkFhbxyEi5z/Hr
 MKycMOyIK9hJfNKRASVzuqQ85g==
X-Google-Smtp-Source: APBJJlHrIIN2WmGvmgpD2lw/ToHst6Jq4jWo+RJr0yvutKBSvwJxdtc4Nym3gDEODN88xdyljzYX0g==
X-Received: by 2002:a05:6512:615:b0:4fa:d522:a38e with SMTP id
 b21-20020a056512061500b004fad522a38emr2638798lfe.35.1688688282911; 
 Thu, 06 Jul 2023 17:04:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q27-20020ac2511b000000b004f76684329esm442975lfb.234.2023.07.06.17.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 17:04:42 -0700 (PDT)
Message-ID: <7ac6bbad-2d87-0c42-f243-82cde7181e61@linaro.org>
Date: Fri, 7 Jul 2023 03:04:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 01/12] drm/msm/adreno: Remove GPU name
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-2-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> No real need to have marketing names in the kernel.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 24 ----------------------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 13 +++++-------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 -
>   3 files changed, 5 insertions(+), 33 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

