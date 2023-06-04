Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5372191D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 20:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9210E0AE;
	Sun,  4 Jun 2023 18:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0366610E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 18:04:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51480d3e161so5934965a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 11:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685901898; x=1688493898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ihBL6TJ8C6mU92dx3ETVIyIXq8wWv0W19OQrtjTVS6E=;
 b=FI30/lnyqGkqjoM7lJFPYMooptVi/7DeeM1KS/E0KPhdJXv8U4Eow239gWj/7KQwc+
 /V02myVs6yai/PTWZ4tQHmE+oXtxhX/cb4AVwYcQC4+6KvkTKclOH4chqPK78JOhhSjk
 O1bW0TsyxsAPdLAaE0FwspvFT84WXU2OEHSZkWrNXa4DolOdbGqinLMfbpGTLuNJgIk4
 8Q+iGmfaMAuoLpO76CTFxPzJGtJ4VTmDGFIw5uVp9e41q0z56jjWnQNBf2Te8K/OKO+n
 hzjArDemAds0fl9w5QcqedUGh6NfUTl90unSsFR4mMr+Axl1lcDhJBrIXd3HWWrI7Vvj
 yqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685901898; x=1688493898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihBL6TJ8C6mU92dx3ETVIyIXq8wWv0W19OQrtjTVS6E=;
 b=WhwgdoDBYIS9oe9DchvS5rIBkVSHJGXgJIqbA5Tn7oTjeZUOtafvu2LAVDFMJfheHe
 UcYgf6Pzh4LCG6LnGE6ElCnCbkE727cXxJITVLi9T/UybM152FE5JFMh5ckDiJKX1kR9
 ud7pYsnzT7MkmsVcMLQV208jNPaxJ9qwKDzw18ObMGBJO9M8kf1V35vD6EiHT6Wmx+xr
 Snxb0sZr0cI0JuAWbSThrwFLLxriDcMjprAtLCUAtXzrLki7iltH4qUbOQSkm0J9TAqD
 dSNODk0Gj4kQz8/3knWGk5mXkP312HLFf3u1z0kiv+OMOiTKcC5wn6DkorAYUFfjKpPk
 9PFA==
X-Gm-Message-State: AC+VfDynzRTNinQghmlfpNgoI6hOGGfPKc1WLKn8tlzzh/QZf1purrlf
 +VI61j79ZQagzByzIUYSFK5H9Q==
X-Google-Smtp-Source: ACHHUZ4+vFM/nr8fGvYX+DNeO5lxMdAF0enwX9IrUSUB6khhTQ6PAinPxZOCuZMqppzelTPW9qs6IQ==
X-Received: by 2002:a17:907:9444:b0:974:391f:ed7d with SMTP id
 dl4-20020a170907944400b00974391fed7dmr4950469ejc.49.1685901898018; 
 Sun, 04 Jun 2023 11:04:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a170906924800b00977cc473b41sm1356087ejx.142.2023.06.04.11.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 11:04:57 -0700 (PDT)
Message-ID: <3fe03b31-0cab-82cf-cbdb-766fdf34c44d@linaro.org>
Date: Sun, 4 Jun 2023 20:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 04/12] dt-bindings: display/msm: Add SM6350 MDSS
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-4-998b4d2f7dd1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-4-998b4d2f7dd1@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 09:46, Konrad Dybcio wrote:
> Document the SM6350 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> new file mode 100644
> index 000000000000..6674040d2172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> @@ -0,0 +1,214 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Display MDSS
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description:
> +  SM6350 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> +  like DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items. It's just const.


> +      - const: qcom,sm6350-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AXI clock from gcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2

Are you sure you have two interconnects? Example is missing them.



Best regards,
Krzysztof

