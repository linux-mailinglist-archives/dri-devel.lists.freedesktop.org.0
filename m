Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3A5E5BE5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36E310E571;
	Thu, 22 Sep 2022 07:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E578210E570
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:10:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so13261825lfu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+UzXS09SHc8/NrA6s9IEtWZ9LL+BrDTcoGV33B1WFWs=;
 b=rldSwPkc246dYUhm7aJnPBpqe6gTN8yppc0aS2NIIHlJTDMx9BtTfru5RVrxqJutrJ
 FPMVJHO5jqCggzEDee2aVYetpt9V8CPXHPbu/wJ5sxTilSXcsA0N9FgY1Mf3aJZevnpE
 TO/SVJN/jgEf0rxNil7Yc5zCc1Wbd5NpwtC1XYPTsQqrB1j+Y/ePE+KVa9t54cNlGOEI
 yKv42dH3/EIWZVsJfI1oXEGEofo0cl6gzlMwiww/n8pIXRPZ7wpE3uNOH2jEYxDm3G6W
 IbjspM99I/oe0fcCRcS9JAxrdtqM/62/QXoHTIU5ej3gx6OGjWDbXPJWVahq0D5HyWKY
 4iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+UzXS09SHc8/NrA6s9IEtWZ9LL+BrDTcoGV33B1WFWs=;
 b=8ISJTeE/3RUr5m0LBEklH2OYWOsz/vEqtaat3RO9Kq5PEEMqsI3Ieae8QWWO5snpsE
 N7puPC0Ss1dGjeEk0UO1JXoYnllrhexC6Ft+MLmoSrvCevvhu0/d3z2bXqYIX9CrVzRq
 4GXhRS+A1ckfZdqWV8EuTYClTBdquHA2SKgEnilLTVPeRe3I2m9xL71D7C9wrWNgFcqB
 RlUaoQ0tz5dvXPBpNgJiEaBJ0kuDqhbRX9K+o3nwR9Yn4q2joRvRa9lo3DQuUA0Wz+YZ
 n5YfVMkaMhO7b7mncjsVcOeersI8ICfTRZ8gNB56vbXRzdXBMZfSauyRzkZ4Ic0ebOpv
 SFKA==
X-Gm-Message-State: ACrzQf0BNk+9JjoG4kjMiYxG4X2lMlG/lTIZpwxlPqkKeH/ldz3VeAYh
 SBynSiaJAW+lj0VqQgfdF2GDPA==
X-Google-Smtp-Source: AMsMyM5F7VkHhJgjVqBB1a1ONBQ5olwuUXN2RSxZX/ri2ZPBesm/WyDGH/ppzmGo8yVAuFQDj4KZmQ==
X-Received: by 2002:a05:6512:3e10:b0:498:f317:e57e with SMTP id
 i16-20020a0565123e1000b00498f317e57emr745349lfv.328.1663830627881; 
 Thu, 22 Sep 2022 00:10:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05651221a300b0048b08e25979sm788559lft.199.2022.09.22.00.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:10:27 -0700 (PDT)
Message-ID: <278583ee-0607-9b4f-56ff-143d47573a47@linaro.org>
Date: Thu, 22 Sep 2022 09:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-13-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-13-dmitry.baryshkov@linaro.org>
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
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8250 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/mdss-common.yaml     |   4 +-
>  .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 ++++++++++++++++
>  .../display/msm/qcom,sm8250-mdss.yaml         | 103 ++++++++++++++++++
>  3 files changed, 197 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index 2a476bd0215e..27d7242657b2 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -27,11 +27,11 @@ properties:
>  
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    interrupts:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
> new file mode 100644
> index 000000000000..9ff8a265c85f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8250-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8250 Display DPU
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#

Same problem as in other bindings.


Best regards,
Krzysztof

