Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871975E5BD0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B451E10E3F9;
	Thu, 22 Sep 2022 07:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5484C10E427
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:05:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s10so9842482ljp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Y8T+rgCLvbEN+WeN/wV06ekzw8aNybyo9Cr933g/thc=;
 b=PRwS4EvB12v+rkGdwNVdlMLqAgVT+QiU52+kqqCtnAX4fThsHK1wiNaT2jYDt8pR7K
 DsUuvhKEiWW2nTL68D8Mp8gtKcZ8YPRVCXPREfUbLwp+tcccKIUG8XR7yXba/V2tGbU9
 miVdHY2V1AsbAwXiEQuN9XFYAlZqKS6aj6VmKqh9P1OYNVokSIrG/F2tI/baVgJ7AhaP
 D9wQUOzAdt6RjkyMHZQfy3mm0+lrsPkpuONisuFht0kQk3izosEkS4cwPYcXMRh4tXZs
 WBrKAeVM5Rwc0tFvSyLByRuvV5QSEmxq7hNTif2aJ6WLuK/yI0BdvuCwhws3mXmY2PjC
 9Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Y8T+rgCLvbEN+WeN/wV06ekzw8aNybyo9Cr933g/thc=;
 b=o8NuFdWskJ81b7nZSXAyiRie4agRAAVsfOR+idNC4JEeDVLxUVDnjCMZ6Qmq/7DjlH
 ekzt4ccU31Wcs8HOID/O3osGAjlDfPUFAzCILl8S0KAUJaCxi+FxocYW7+45lw7tKtXa
 gzUot1SXjkbEGkPmePRZytOrHkfMqipnZ6MAmuRaxiyS4r9dEJVi6Y9K3UqKRY800rJL
 mKZh3DtgF6s3lcckYGpI/AvTJn0hRunEAwAIuihsyypeAWReNnuyQEPYH7mqI94rGbhy
 JwuylLdWOjFW0R+QAR7+X0dulZte2LNeV/ubl7CnFU3MBfe5CGi5ucmZNyKizykZiMmo
 1esQ==
X-Gm-Message-State: ACrzQf1LnndIJ0IgvZAy9pt0l4uNx1J0qOWmjV1LW1C3t3rT2Bf9DVaD
 qnZ/Bx5mG+YnDgDSSE+nLaKZRA==
X-Google-Smtp-Source: AMsMyM4vAPpJFJDThr0SWQMffyaNAZzsYUD4b943d8K2YixFXmOh73l/deLZmkGyJnJrbcLPijtecw==
X-Received: by 2002:a05:651c:1546:b0:26c:61c6:d053 with SMTP id
 y6-20020a05651c154600b0026c61c6d053mr603586ljp.218.1663830341671; 
 Thu, 22 Sep 2022 00:05:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 r17-20020a2e8e31000000b0026c687f9f7bsm491417ljk.107.2022.09.22.00.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:05:41 -0700 (PDT)
Message-ID: <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
Date: Thu, 22 Sep 2022 09:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 111 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 200eeace1c71..67791dbc3b5d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -14,20 +14,13 @@ description: |
>    sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>    bindings of MDSS and DPU are mentioned for MSM8998 target.
>  

missing allOf

> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
>  properties:
Best regards,
Krzysztof

