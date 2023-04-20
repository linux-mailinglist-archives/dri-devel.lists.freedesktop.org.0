Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231856E9F6E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1071010ED2C;
	Thu, 20 Apr 2023 22:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E110ED2C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:53:31 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a7ac89b82dso9405581fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682031210; x=1684623210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ce6pEJrw7tqRyJLpRXEMezCTvjoqYpZMZdtSajGXN44=;
 b=MGA9BTGcZSHJD93go1tZ1QFmm9UrulMAvOf0fPOaovFyX0EOx1H82mcZMav6ut4ZXJ
 0V67IyZNL5GsuqlC6Bxy+tSuYrKo1hxncDM+v+/b52Lxk5OxR96CYqQpt7XcNEROkBgD
 9PNIk0Vorf7sw17NSGEafM1pHxmOpNtyx7WSLuJ+9h3LFGVDVFE61bpnSDfhtAsscg8n
 CYRTHnfkzIJhN+KouINMyhVLGgL5Gexa6N7twQEJz/erAZEkqQJTiOEUYJgzo927Gxpy
 I4Q+19IucjS6a7posiNkBhQPWvTZkpe9ZeoXqY8ZdgeO1Q34URW75kN+0I41yCDhpVFP
 g63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031210; x=1684623210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ce6pEJrw7tqRyJLpRXEMezCTvjoqYpZMZdtSajGXN44=;
 b=OfzQtHpugMBnMI34fuj4CnaPGyW5ptYk44JnVM5luRs1iMARfQ0Ssq551tQJDX0H3j
 DBmGZhIq1VdRlWO7XhkvvufbNdXwvMy/xSu6b9AWjpvvfi3wRwG2lC8D9kdZentd588g
 W701FNsdGST+D6n0Ig6DwijCpc8miL1/OOs+wEHWkRSVOir6lci6hxyDacvMeFUs+Ejh
 MEWhyX+iCYGIXbznmYm3MEylQT6WVPxgB+RdB4j94F3dPAI5d9dqbwaOwMExjpJm1w9S
 GoL42PNH7pcnIaUK5by0vCzT25pJgfnNryEOPdEGi+nGUIdkSD67TauX1JN14d8WCJET
 T5Bg==
X-Gm-Message-State: AAQBX9dMheB6ibWm53jj3zRJ6mmAaYWu5eY4y9vb3ZQAanxirCaP6p3B
 AP8qKGh8KOroC4PDKKC+YR9INw==
X-Google-Smtp-Source: AKy350bXwN5/7I7NtUsVNrh54eMPV97x8iBZbGocpm0fxXv6U5ipcBlanUTMeI6LZC1Gi7c8T8HacQ==
X-Received: by 2002:a2e:82c3:0:b0:299:ac65:781d with SMTP id
 n3-20020a2e82c3000000b00299ac65781dmr130137ljh.10.1682031209877; 
 Thu, 20 Apr 2023 15:53:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05651c014700b002a9ec7c0b4csm407820ljd.10.2023.04.20.15.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:53:29 -0700 (PDT)
Message-ID: <edb8368e-4157-bb0c-f16e-e3605c405322@linaro.org>
Date: Fri, 21 Apr 2023 01:53:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 13/13] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-13-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-13-5def73f50980@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> It got broken at some point, fix it up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

This should probably come before patches 11 and 12.

> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 2daaa600ac75..e64c737724c4 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -251,12 +251,12 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ .compatible = "qcom,sc7280-mss-pil" },
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sc8280xp-mdss" },
> -	{ .compatible = "qcom,sm8150-mdss" },
> -	{ .compatible = "qcom,sm8250-mdss" },
>   	{ .compatible = "qcom,sdm845-mdss" },
>   	{ .compatible = "qcom,sdm845-mss-pil" },
>   	{ .compatible = "qcom,sm6350-mdss" },
>   	{ .compatible = "qcom,sm6375-mdss" },
> +	{ .compatible = "qcom,sm8150-mdss" },
> +	{ .compatible = "qcom,sm8250-mdss" },
>   	{ }
>   };
>   
> 

-- 
With best wishes
Dmitry

