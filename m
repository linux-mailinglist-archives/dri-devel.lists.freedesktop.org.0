Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6726F9793
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C81910E131;
	Sun,  7 May 2023 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E910E131
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 08:19:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-965e93f915aso413462366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683447557; x=1686039557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmspFl/qcrUH5DUFKPFejz2sbTyU5nmTsYvZW5M2EaQ=;
 b=IIB3tnM8iSk7+xLeoUFp6dbaAhKrnsZxTyDQTCE+XEzeYtpSAVNL36PF4++K0wmSzJ
 GnIqJJzw0bnxIsDHk6hT+NlyQGf+sapJGylBIUXJUdJO0DZeH1s2iEDBKBHQTsUyCokg
 N+sc6dFjeilgxW3KC/FAVa58V4ILCKQC8AFKshQ6h5whWceVlAc7iEVS+Mq7Fo00hlU5
 qtu9n7bmmKhfln8OB5myFlbUcUdLLyLt2HMJzIpMWegQfLBN+A70yeqwTAZGcKknoFvO
 TnUZdEUkELul9W/Pl8KtMmsFBMfV7KPK4Nka+HFDtJH4Y3aH+23vASb/huPAJKEqgeOD
 UpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683447557; x=1686039557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmspFl/qcrUH5DUFKPFejz2sbTyU5nmTsYvZW5M2EaQ=;
 b=P3tGN+H7tf7FDocL/L3Vc9FGCm++BpxNIWRPcU8Uyi02lJlySgd3klhb1RZhR1HkE8
 jTXUIMg4QLHcEeUVX0GcpOe3vtuZswmFzgr8kc3GXhOhBka+XuLYnkiNjZ4FALd4UGfm
 6V0MKJJoW9Hn9vY4bd+TJsVoEFcL7UWpAnGX6D/KBXhGRNDtkyD/yFJjDbir/NDTNsau
 TnByTyeF84T6ilRg8MCxqPpCA9ceRKlRCzuY+gsK4BaMPZQZO2xmkqf8ajbeKPTPRdLY
 AJeiY52tyeUipYFaK3iet41LevshKpQxRWRb+XMfnFUqt/61ZeAWQH6F+4jN/Zxdk2BS
 OGCA==
X-Gm-Message-State: AC+VfDziH9M5CcRp5RFDSGdhk0XlZGKjjY4H1iigveh3A0vjQmHrKLVd
 sVWsAVVk7pQrWiQc5UFiJJrY4A==
X-Google-Smtp-Source: ACHHUZ7VKQzOW+S0ssTzMGK+ru9aMnpaJYX1bc4BHHGSsy+EFj9PX/kcenbTWjQXmlp0f8u2kphtKw==
X-Received: by 2002:a17:907:c1e:b0:94a:4107:3975 with SMTP id
 ga30-20020a1709070c1e00b0094a41073975mr5824210ejc.76.1683447557500; 
 Sun, 07 May 2023 01:19:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a?
 ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
 by smtp.gmail.com with ESMTPSA id
 oy10-20020a170907104a00b00965f76318b1sm2590673ejb.201.2023.05.07.01.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 01:19:16 -0700 (PDT)
Message-ID: <80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org>
Date: Sun, 7 May 2023 10:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 04/12] dt-bindings: display/msm: Add SM6350 MDSS
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
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

On 05/05/2023 23:40, Konrad Dybcio wrote:
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

Drop items

> +      - const: qcom,sm6350-mdss
> +

The Rob's bot warning can be ignored - it seems patch #1 was not applied.


Best regards,
Krzysztof

