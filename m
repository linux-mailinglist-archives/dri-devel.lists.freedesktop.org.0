Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3126638BC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F010E0DF;
	Tue, 10 Jan 2023 05:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912D110E537
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:49:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b3so16656996lfv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 21:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wEZQCF7r/hKH3+PuKuaEzx+VX+jWeUSGLdP7kMpvbXk=;
 b=mnMXExPNaUGbHc03oJdZNZQ6xvbloLJpihN+Im7a+alsvj7Gu1N7RgMAcEeq5kRHLz
 XySlHGCIKONS5ikU+ebg6EAbhztICZwdEeJOYarE/aIqE9ixPEU5quxCsVmt3LimRmp+
 nn0U1fcXeUowMEjgBRuRckP8aV6k0+mDQe4VAQ6lshQXPvrGdOKyJFqpHr19f9VvTAgi
 2TFgxrBhYYX4oWbJfMstPdibYHJKFgydedX2dOWG39f/Nvg+k3VBfdYkvwHyqG4BPe6G
 5COmChwVzUjBWDUR5/LiTaBjeY9vPpnEGIzquuB/2D+BB7BIPBCF2fkhWf2396IPHpkX
 P4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wEZQCF7r/hKH3+PuKuaEzx+VX+jWeUSGLdP7kMpvbXk=;
 b=o21pxUNPKGPiqdBTJNWjADc3AlhPLAAAywVwAAbiPZTyPkQf72hvRLqA2Af46YcQhT
 SR8WbPZluJ7abthoBvNkIdb8nlUI4u5iZWhOnPuw3Uy9DWrhgX2ddrT8bbRZiwJqpWvS
 M3RAMRd01xJhv0KTZfyCZMJYm5o+wzHB1WhfOmu/tfKWjN7If9bIdIQxQ2NvlWkEFm+g
 IthPVFe1wC981ydI0P40bYXOyPRScDdUKboMrtZvL6ny2aPdiuu0MTGgjfiSvGcpa3Ed
 gXuiiVQvduAO6h5Fq1X9S1riUhGoOExiKKoQx5AHUPogrb2kXHkJBLOVqsER/QIFJQOr
 MFIQ==
X-Gm-Message-State: AFqh2kpfVT/SZBuawhQVpbV89A80u0WPWjNJWmd+Koiz5ivR1ZoU5zzW
 kAfT8fZdLkgAph6BiJ7yb1ocXg==
X-Google-Smtp-Source: AMrXdXtObN18+uFW0MQGD2/uG7h9Qi5wnyK0DtAuzC9YHGEtGEZhRUnE5aoLscqQo1UoyDffAU2GHA==
X-Received: by 2002:a05:6512:64:b0:4cc:71d2:eff3 with SMTP id
 i4-20020a056512006400b004cc71d2eff3mr3044316lfo.21.1673329738963; 
 Mon, 09 Jan 2023 21:48:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a056512218900b004b57162edfasm1998300lft.117.2023.01.09.21.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 21:48:58 -0800 (PST)
Message-ID: <913f2772-2673-4270-030c-c036984d36c6@linaro.org>
Date: Tue, 10 Jan 2023 07:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 04/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
 <20221223021025.1646636-5-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221223021025.1646636-5-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/12/2022 04:10, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8953-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,msm8998-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> - qcom,qcm2290-dsi-ctrl
> 
> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
> do so.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 26 ++++++++++++++++---
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 6e2fd6e9fa7f0..98d54a7ee28d4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,27 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,apq8064-dsi-ctrl
> +              - qcom,msm8916-dsi-ctrl
> +              - qcom,msm8953-dsi-ctrl
> +              - qcom,msm8974-dsi-ctrl
> +              - qcom,msm8996-dsi-ctrl
> +              - qcom,msm8998-dsi-ctrl
> +              - qcom,qcm2290-dsi-ctrl
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sdm660-dsi-ctrl
> +              - qcom,sdm845-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl

If you would for any reason send v7, could you please also add sm8150 
and sm8[345]50?

> +          - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - enum:
> +              - dsi-ctrl-6g-qcm2290
> +          - const: qcom,mdss-dsi-ctrl
> +        deprecated: true
>   
>     reg:
>       maxItems: 1
> @@ -149,7 +167,7 @@ examples:
>        #include <dt-bindings/power/qcom-rpmpd.h>
>   
>        dsi@ae94000 {
> -           compatible = "qcom,mdss-dsi-ctrl";
> +           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>              reg = <0x0ae94000 0x400>;
>              reg-names = "dsi_ctrl";
>   

-- 
With best wishes
Dmitry

