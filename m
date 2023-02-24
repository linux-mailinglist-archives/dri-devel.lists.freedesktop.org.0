Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8C6A1B51
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 12:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E25C10E5BE;
	Fri, 24 Feb 2023 11:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB910E5CF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 11:20:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d30so12253830eda.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
 b=mIiZeEsUWzPmwXGwXcmoWAfjzZYvzoqU/vkxax57FwmpV3E5k28nSbg82tY2DhJ3QZ
 xtulBn3jmkKp5RridDbhwmQELXZQ48vcYSp6Nj6q8TagLOxlPH0eBy5EVVvOzfeKRWmW
 C+ERb6aIlJU1QWWVWfEU0HKhyWKqDM5B0HkVx2D80p7Qk1haolAv8j3yqLNOUKim9p+c
 ZOG9iWs+KpRAWE6U/jfRpobjSlek692ZsXJUP0LLI0dmak+QJIfiASNRWYcsJjKpF/Lv
 C+D5kJWzOJbWqaF6UEJuXr1+6qoCZqreQnnfaRPRcHwT+xKwx5e882GvbnuRcUrTDH+3
 9XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
 b=PAU7SftIn6IIrtNTpRompISWF1UoNDkvM69fmQvQnCek6dCEUC5g2Y6lJBdJ77QaEc
 paVGviXS5W9hCnbXZx66V5Nswj7rTzW/H4PyaAsDi7N2P2fRGYyHZeVF8YGDCnq501cb
 YG89wibYaBxl1GvhO+a3bUGKkT2E6SXhQYwRTm+GXTfZE3Ia8s4FRRPG4zlJn0IY23pn
 iYycX4SLTfQWyrLC6RTz4SL87XgfwNG++sahmeNGp0WXbZrpNZsr2kyFdlt5VApcr0q7
 e/O4/6UXGvKsiKxJzKiH0erqqEocw0TjhK6SvStY2VxmGhoUJNxbkzq6DOYO3+AQFvbC
 GYUQ==
X-Gm-Message-State: AO0yUKXaxj1QBksZZyn+rVo06xzFBu3k5/rIpQXkljjqmC6hGbDoykoP
 TupN/dVdOdxCiOsahlJbJhM/BQ==
X-Google-Smtp-Source: AK7set8K/SNOhJHO32tZQmCDVnK5BSQ+/EUE74ldpMSsptNS/Vnl5kTCOFqgSob/GlzmFjZqj83ZwA==
X-Received: by 2002:a17:906:f0d3:b0:8af:54d2:36af with SMTP id
 dk19-20020a170906f0d300b008af54d236afmr25060935ejb.76.1677237600869; 
 Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 my22-20020a1709065a5600b008bc2c2134c5sm8165118ejc.216.2023.02.24.03.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Message-ID: <2fb0ba58-c011-7896-9792-005d0ed9ad55@linaro.org>
Date: Fri, 24 Feb 2023 12:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/15] dt-bindings: display/msm/gmu: Add GMU wrapper
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 13:06, Konrad Dybcio wrote:
> GMU wrapper is essentially a register space within the GPU, which
> Linux sees as a dumbed-down regular GMU: there's no clocks,
> interrupts, multiple regs, iommus and OPP. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index ab14e81cb050..021373e686e1 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -19,16 +19,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> -      - const: qcom,adreno-gmu
> +    oneOf:
> +      - items:
> +          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno-gmu
> +      - const: qcom,adreno-gmu-wrapper

Why wrapper is part of this binding then? Usually wrapper means there is
wrapper node with a GMU child (at least this is what we call for all
wrappers of custom IP blocks like USB DWC). Where is the child?


Best regards,
Krzysztof

