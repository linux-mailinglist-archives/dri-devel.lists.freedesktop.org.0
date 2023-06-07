Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958872732C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7283A10E577;
	Wed,  7 Jun 2023 23:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481810E576
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:39:09 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b1b8593263so60475181fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686181148; x=1688773148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XONB9T8Mj7o/MLrEwoJSSBYj969JG7tPSlspH2W5BIw=;
 b=GTSY7qEdobWh7LkTRnOAImvPKZUJQfgOgETcJ+tk6DI5sF/chuwr6uFDqqlVN23O2W
 //yo7tNg480hQs0zkZINMpSZx3sk/T3RykwcV+TsgCqjcm6lxUr7OIiZgxIFpwSR5GDM
 4G0wg5Ie0zBjwOhgMcBHNt5pPR8zWZkXbyFtqUc4AfJayZmsCu3RwDeCa8spwMuwj3kd
 l7IFXSZtuqtnQi6PcQ7vFnWwXhpYhZaVzrLSjtc6apATcNyaMuyKL3dvg8eSImkt7HNR
 s3HuH1jxWmY/bYrPhnN5PoHhxg9HXsMayW/9mjwSHTu08V8Fjpsb3fvDLgVQ95kyqjtA
 HJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181148; x=1688773148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XONB9T8Mj7o/MLrEwoJSSBYj969JG7tPSlspH2W5BIw=;
 b=LSQDd6W0uuq/8lNXDglJyfhzCdoJG72xh84y9CFSx8+i0kMrH9II1WWPupjEJDWJE+
 A7+LBKcjeJKleWNdsWIpnpm7NfxYWrBj1blhT8EdSbBrTAXSQKaZ+1O6unGthIbv4Jhn
 ltJnbUnEHL8D30T3cSrr50Vi5YRS0iLPtXCe/AgXRm3W1Ef5IO11CdSHHv8PmG0ST8aZ
 iuszu1P0lQKMSix8fQhVIBVMiLP9VHCjvAyhIr3BQVeZ+4NDk4D5bzAZlnbAGW8/ExTo
 IG7yQbv+uET7xW0061Eg5rSIhbAzKwXYV+8ZkvnLpCPRc4AhM5bN6ByXQmYNlqaCmSf9
 d/HA==
X-Gm-Message-State: AC+VfDz4VAzXFu6NU+kwfuE5wEUAHNIG6P6lkEc+ndX+oIbpVqBZyki4
 JGeLJuzWDnZ6W6S6SZ+U2ojmkQ==
X-Google-Smtp-Source: ACHHUZ5Ti07xNp1+TYebI62vHoSL/r5taUDlEmn3ZQRy27Ik7N84bpsPjsq4VfKfSjqdaopI0zXg+A==
X-Received: by 2002:a2e:730c:0:b0:2a7:7100:ff5a with SMTP id
 o12-20020a2e730c000000b002a77100ff5amr2976356ljc.6.1686181147775; 
 Wed, 07 Jun 2023 16:39:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b002b1b92910c8sm346ljg.86.2023.06.07.16.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:39:07 -0700 (PDT)
Message-ID: <e70b266b-85bb-f23f-dac8-47702a2aaf37@linaro.org>
Date: Thu, 8 Jun 2023 02:39:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 00/12] SM63(50|75) DPU support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 15:43, Konrad Dybcio wrote:

[skipped the changelog]

> ---
> Konrad Dybcio (12):
>        dt-bindings: display/msm: dsi-controller-main: Add SM6350
>        dt-bindings: display/msm: dsi-controller-main: Add SM6375
>        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
>        dt-bindings: display/msm: Add SM6350 MDSS
>        dt-bindings: display/msm: Add SM6375 MDSS
>        drm/msm/dpu: Add SM6350 support
>        drm/msm: mdss: Add SM6350 support
>        drm/msm/dpu: Add SM6375 support
>        drm/msm: mdss: Add SM6375 support

Will, we have finally picked up the display related patches. Could you 
please pick up the IOMMU patches if they look fine to you.

>        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
>        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
>        iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> 
>   .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
>   .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 213 ++++++++++++++++++++
>   .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 215 +++++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 +++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 139 +++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>   drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
>   11 files changed, 790 insertions(+), 3 deletions(-)
> ---
> base-commit: 6db29e14f4fb7bce9eb5290288e71b05c2b0d118
> change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26
> 
> Best regards,

-- 
With best wishes
Dmitry

