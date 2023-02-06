Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE468BA43
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97710E36B;
	Mon,  6 Feb 2023 10:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9014710E36B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:33:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10416083wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxcbcYd9yM82GRoEiNqLK6kFAvDnYbetYCZ2WHY7tl0=;
 b=oOCz+x6xMtkHfCn/UFoxpvWOBqVNrzoSaCRBvDP9ng3efAm12zRu+1g8vQc9nLYS2o
 SnlRlRqBV9eYnTp+HtlaNFnMvcmf1i4rHputHf4hdYb9Tfn0se5xQ+BNvSenuCGbiIjN
 2i19dexf8lUESiJZQYX8G5Cg5YVRyG/X6liEmp5Fl/WHI7e4TOzDz11S8iQrxU5Lozwl
 9fpCaOZTnVq8gDGoc1hhdT26/6SoyRxjoJZZYm5tf5QZablCt2VTrUhOLodL0QKAVSqS
 c+539e5leueCdsl92RhlquIGJxEUASESTsfbN5nH2n3A4jq/DAtAdQiESNoGoIUUsSAw
 1xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxcbcYd9yM82GRoEiNqLK6kFAvDnYbetYCZ2WHY7tl0=;
 b=t+rcGr1VxsEA1QP3VfpdpdSGZ79sj6mOmVM1G3LvTiQn8ucudZmf1jhohzgczwboGm
 zQ7yW1KScwQA8DasqRbj14BGXZP+gElKZeJAKXHStCpGGy/XbPl9kTwq4QYaPVmmWkIy
 jZvHJNIlP78eUracXXu3mzRNd0EsHZuY2LUBfK/uTzDNglWDjP8CNYxdO5xq1apQN7r8
 Tkc6PaNRWbnfU9brz8VRl2NnquL9yqFMapc4HkAizwYxMdVj2HubC+SO6NGaTt4PezjS
 SeZDHsKmC7x7mtm9lMes0IwM2G+C/7C9tGsNwc/aiMws3/vfj1ViSJ/KJP7yb8jFQewn
 GL7g==
X-Gm-Message-State: AO0yUKU3YuWj4td6wmdWORfGWapq9iyZOQxufWfGgC/WuFmjrmZvs4Ha
 itWI7XNQb1I+UFk8Yc6Gk1Hs+A==
X-Google-Smtp-Source: AK7set/vDvn10a+fQdAU96ODN7IXb+vtLvWxhVPv8Zvs8cIL0xewS3e+HPO0gyTVmaYVvrbsaOQTSQ==
X-Received: by 2002:a05:600c:3c96:b0:3da:516:19ed with SMTP id
 bg22-20020a05600c3c9600b003da051619edmr18037107wmb.29.1675679604943; 
 Mon, 06 Feb 2023 02:33:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003d9aa76dc6asm16715024wms.0.2023.02.06.02.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:33:24 -0800 (PST)
Message-ID: <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
Date: Mon, 6 Feb 2023 11:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 11:17, Neil Armstrong wrote:
> The SM8450 & SM350 shares the same DT TX IP version, use the
> SM8350 compatible as fallback for SM8450.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 0e8d8df686dc..98bae326e655 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -25,6 +25,10 @@ properties:
>        - qcom,sc8280xp-edp
>        - qcom,sdm845-dp
>        - qcom,sm8350-dp
> +      - items:
> +          - enum:
> +            - qcom,sm8450-dp

Indentation looks wrong here. Testing should fail, did you test it?

Best regards,
Krzysztof

