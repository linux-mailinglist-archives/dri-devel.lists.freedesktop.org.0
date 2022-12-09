Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC3647F59
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CCA10E503;
	Fri,  9 Dec 2022 08:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725E10E503
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:36:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b3so5951727lfv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 00:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ATYGxO1sTs91TaW6maJCLm8Gd+RaeReYPdI6Fodf9A=;
 b=meqQp03LMgWNDbw+pdJT8X6utDkTAoQX3VUWHpaEWCZLzMA9tlO51nB4hpMjiyF9a0
 mk0izmVu1XI2V7M7NX/khO7jJBA8k5Hec/liN9hhR6rD/5wALwI3tH5OBeHFEDI8AAHE
 UJeXWrDF7jqaEZSjBBHJ8MTIHswbX2i6oHcbwBvTmS3zgxFBzmIn41aN17jr3jgZaI37
 ZCrWPw1k4G7A6BfdSsMvttNl4opRMDGtCvMGirt0PyXA6lojZ64rd9pux3koxuthZKoH
 SAlKMQhypVrPwrNxiixYQgkdsuGKq0mml3DxKRPGIiEeyhhZfJBtTOfn5S6j7/nhjhz1
 17oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ATYGxO1sTs91TaW6maJCLm8Gd+RaeReYPdI6Fodf9A=;
 b=AinQxpophJRViiSjmM7ZpqmRYxSukfd5XgwjxY89fEkaSTgNbkHGz7ZkWOUuy93Q2j
 6xKT6fvmPXXuwAbm36g0b6KIvJSuW9LywrjJi4vZBiWLBIEcBV6XwRjXa0FbglulPbRO
 nuPiBbDliem8+lPdxr3iowo0Jmgi1cK45rH2l9Kl/LXqXt7r/gOTjfDGEqUkr6xOQdd4
 sfH854Nh74EKXO8W5ni8DGh5pOOgAuiq2FIxNKFY7uMWqh8gSpSSMduRJtLaYh8oxsXZ
 CCWQVuUguATyiekulfLGjxU82CHYZ56PYQUHl5nFyLqm2cdgs/ONliyG6mXodbwrSGyn
 eL4g==
X-Gm-Message-State: ANoB5pnGnr/zTDTO7A94fDN+u1fi7wII6L6oxUlE2X8MgNWJPmyEbauK
 Yy4owVtyuA6MqOUupFRZa/z/h4bq1v7xhSjutao=
X-Google-Smtp-Source: AA0mqf4Wq5sWCL3W0p5uvCPmZ9iCdkhJiLBNbXL7CWZj6BZMyk2uRE0dU6cQIbi8tnWtpcvM5VQ6fQ==
X-Received: by 2002:a05:6512:10ca:b0:4a4:68b7:e71a with SMTP id
 k10-20020a05651210ca00b004a468b7e71amr1733526lfg.4.1670574994825; 
 Fri, 09 Dec 2022 00:36:34 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a056512070f00b004b40c2fccfdsm168627lfs.59.2022.12.09.00.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:36:34 -0800 (PST)
Message-ID: <806ca75b-99a6-237d-a5d0-70e67348e183@linaro.org>
Date: Fri, 9 Dec 2022 09:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm: add SoC-specific compats
 to qcom,mdp5.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
 <20221208005458.328196-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208005458.328196-3-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 01:54, Dmitry Baryshkov wrote:
> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
> distinguishing between various platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdp5.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index cbcbe8b47e9b..a7a97a4c46b4 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -16,7 +16,24 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: qcom,mdp5
> +    oneOf:
> +      - const: qcom,mdp5
> +        deprecated: true
> +      - items:
> +          - enum:
> +            # msm8998 should either use old single-string compat or new

There is no msm8998 in the list, so what is "new". I propose to use the
new, bu tyou need to add it below.

> +            # qcom,msm8998-dpu
> +              - qcom,apq8084-mdp5
> +              - qcom,msm8916-mdp5
> +              - qcom,msm8917-mdp5
> +              - qcom,msm8953-mdp5
> +              - qcom,msm8974-mdp5
> +              - qcom,msm8976-mdp5
> +              - qcom,msm8994-mdp5
> +              - qcom,msm8996-mdp5
> +              - qcom,sdm630-mdp5
> +              - qcom,sdm660-mdp5
> +          - const: qcom,mdp5
>  
>    reg:
>      maxItems: 1

Best regards,
Krzysztof

