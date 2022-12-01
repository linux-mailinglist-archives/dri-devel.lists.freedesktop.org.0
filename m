Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C954363F8A2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 20:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10AA10E158;
	Thu,  1 Dec 2022 19:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2E010E06E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 19:54:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p8so4127783lfu.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 11:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OGig0j87TfPUBjEzV2O5bgbpVQ79iR8UjUhrIXzIKPE=;
 b=MA73zwlsy0FYvPwpcf4ysOfjDfkrADv8s2v3gyglmKUYAXMhhR2n46V6vr+elDNupc
 EBd9cnPMxjA/mcXwJlNmc4nE760c3551+hS+/iVFbojEKhICUYejhlNYefkeFYO3l0xc
 ZQejn0DtDLZYuvZETgdhYO7SzzBgL2c3//unuOBxqIRCHqq3CFRYUlFYLaDHHjeXnU/a
 cBwQlUZKl/ZFO6H8in4pnPv/AEWsj2hTOpFFq8mvIid9DpmohI4OWvjguvF1cjOIn6f8
 wRcGvTDNO/1WHqj902PHUCsmbr6u5fjQ34URQrt05ThnG6lP5bFGVFhyL+JM95JFD6Yx
 gRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OGig0j87TfPUBjEzV2O5bgbpVQ79iR8UjUhrIXzIKPE=;
 b=Ma9FUCnGhSlOg9LwyST2NPRbKMmFaEbD782JTuNyrIFX5GBPo2dUmDKlA2xqrVslvm
 KM2XB+ZDPAD2mPffOyPF+KZOnorrgtCBgdBFA1qsEbkFeP+GFmUQ5qaCcSDsiuJJIknQ
 iIP7SFi8Wq3+1BmNcviQmrFnc+P+K7QnTaw9NZs/dv45b+P18MQL/WYzRUYfdAlrztT6
 Cn/Cj03/0wiWKvgbyJpetniOvyweCPinVOODWkaOdSG7Jiuc/EyIqy9ALBhDz3vH1bAR
 2ZaAUldvN7aynLsqEOKchr+frqjR4Xl/H5vv8vhiuyP2LeTU5TEq29Qa/kH9zpc8e4rV
 A+9g==
X-Gm-Message-State: ANoB5pluyXJGNzhdFHXQXVtU+14hwgJotbk5D/xuLRgt9nGzk+W55bIG
 f9p+HlbvIdFo3NVIW8FUTM/P6w==
X-Google-Smtp-Source: AA0mqf5ku+EWJ6b5KPQcvTvxQ1Dz0O0+WykmdO2w66c7UgoB4xHtoQxQBKEk3ZN1g+TpW/1iBeNQsw==
X-Received: by 2002:ac2:5e2c:0:b0:4a2:243a:ef6e with SMTP id
 o12-20020ac25e2c000000b004a2243aef6emr18652028lfg.454.1669924491618; 
 Thu, 01 Dec 2022 11:54:51 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004b1a5086485sm757030lfq.2.2022.12.01.11.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 11:54:51 -0800 (PST)
Message-ID: <19e78a06-2f3d-92af-1988-b22dc3ffc84e@linaro.org>
Date: Thu, 1 Dec 2022 21:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display: msm: Rename mdss node name
 in example
Content-Language: en-GB
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221130200950.144618-2-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 22:09, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name into display-subystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We will pick this into msm-fixes during the next cycle.

> ---
>   .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
>   .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index d6f043a4b08d..4795e13c7b59 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -72,7 +72,7 @@ examples:
>       #include <dt-bindings/interconnect/qcom,qcm2290.h>
>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
> -    mdss@5e00000 {
> +    display-subsystem@5e00000 {
>           #address-cells = <1>;
>           #size-cells = <1>;
>           compatible = "qcom,qcm2290-mdss";
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> index a86d7f53fa84..886858ef6700 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -62,7 +62,7 @@ examples:
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
> -    mdss@5e00000 {
> +    display-subsystem@5e00000 {
>           #address-cells = <1>;
>           #size-cells = <1>;
>           compatible = "qcom,sm6115-mdss";

-- 
With best wishes
Dmitry

