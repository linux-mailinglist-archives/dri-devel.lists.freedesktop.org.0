Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D775A6AAB9D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 18:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050D210E192;
	Sat,  4 Mar 2023 17:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA99510E208
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 17:35:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t11so7570852lfr.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677951312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5cGIGfaKnV4ImrpMxvDZ1++j8rm0c6ZjdLL2mec+aYM=;
 b=pREuQlkuzlsqGVy+AGymhpoeyQ/z9dVN7YilVHwkceqZdxfqvRCONBxh+yu1olT6o6
 uuySEsVvWvmya5yghdLf0/ov9UZk1VNevHpJQYkUhKg4asS/P8sOnubagsh4LiGpG+pd
 Qn1towt1rjb7TMRlBnojV/O5v+1SMTOdrFCOoOmZo8+Iehs3uL2ykeZxXXkA6CKGt1PL
 1gYpBnAAwyxiJmmM8sEAz/dkIY3qvJobfGenpLYpcOA+JDI4FewLo3cMVcB2btTLf8LB
 kH1vE2Uwzo9zGv5mrCc2vBZ9Okq+wajR67OToZ36sj3voVe/2Gfd5bEnfKXPXXjfitRs
 SQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677951312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5cGIGfaKnV4ImrpMxvDZ1++j8rm0c6ZjdLL2mec+aYM=;
 b=auQ1qUtIuJXEcOTeXQJ002c11aZIBIRKfkoRufq3GkQSoD/gCY8kIr6pXRNc5lDovc
 l3yqxd5DHR3ARx6nk/ldmWYGuIUnVFgLUhZ7uaJl27ylhoXmw3aewTZqksMwsB3cCTSC
 06qTsqRsCTd12Mlo6IOUk9Nw7mivb1idwX3Bypfah3RhLPZdN2J5VMPlnX6JyQGkf3eM
 ugsPZKM2/Rb2JGS4WeQiX8n/oF6vLNkaQ4sOAIQFYo633F44zXwdbeCt5jYU0MY98kT5
 0CqTTo9XCYJ4g+aasyQaOKzJ5xTxPjwsym9XYzbaNSqiQ6ZO1O8dysg2f/o32sJiGZfl
 mkMQ==
X-Gm-Message-State: AO0yUKVSSCCEthjNFDr0tfc8+Wn2Bg2Ytj/eqpzUNiggiAP+Ob69xOx/
 UzyIx+KCNP7D4vtWekwAPAHI9g==
X-Google-Smtp-Source: AK7set/tZ+XAh8rRaAdl+rxHK6YbFTCOSJ9ZQ5Mi4DYVu1z8O6QtCFA2zpHPXKX5rjCGuBFdFjZVxA==
X-Received: by 2002:ac2:53a5:0:b0:4cb:4371:f14d with SMTP id
 j5-20020ac253a5000000b004cb4371f14dmr1604588lfh.17.1677951311841; 
 Sat, 04 Mar 2023 09:35:11 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a19f00c000000b004d2199ea23dsm891982lfc.0.2023.03.04.09.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 09:35:11 -0800 (PST)
Message-ID: <30798bd2-5805-45e6-92d2-a9df6fb52600@linaro.org>
Date: Sat, 4 Mar 2023 18:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated compatible
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
 <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4.03.2023 17:59, Bryan O'Donoghue wrote:
> On 04/03/2023 15:55, Konrad Dybcio wrote:
>> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
>> alone. This however didn't quite work out and the property became
>> undocumented instead of deprecated. Fix that.
>>
>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index f195530ae964..d534451c8f7f 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -35,7 +35,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - qcom,dsi-ctrl-6g-qcm2290
>> -          - const: qcom,mdss-dsi-ctrl
>> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>>           deprecated: true
>>       reg:
>>
> 
> This change would make compatible = "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"; break though
Intended, they were never supposed to go together, as at the time
before this patchset (and its stated dependency) the fallback
would not be sufficient, the driver wouldn't even probe.

> 
> Take this example, I'm going to use 8916 because its easy.
> 
> If we apply your change to dsi-controller-main.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index e75a3efe4dace..e93c16431f0a1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -34,7 +34,7 @@ properties:
>        - items:
>            - enum:
>                - dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl
> +              - qcom,mdss-dsi-ctrl
>          deprecated: true
> 
>    reg:
> 
> and then make 8916 == compatible = "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl";
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0733c2f4f3798..7332b5f66a09d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1094,7 +1094,7 @@ mdp5_intf1_out: endpoint {
>                         };
> 
>                         dsi0: dsi@1a98000 {
> -                               compatible = "qcom,msm8916-dsi-ctrl",
> +                               compatible = "dsi-ctrl-6g-qcm2290",
>                                              "qcom,mdss-dsi-ctrl";
>                                 reg = <0x01a98000 0x25c>;
>                                 reg-names = "dsi_ctrl";
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: dsi@1a98000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl'] is too long
> 
> 
> so compatible = "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"; is now invalid, not deprecated.
Intended

> 
> This change also makes compatible = "qcom,dsi-ctrl-6g-qcm2290" or compatible = "qcom,mdss-dsi-ctrl" standalone valid compatible which is again not what we want.
-ish, it's marked as deprecated but it is valid.

> 
> - enum:
>     - qcom,dsi-ctrl-6g-qcm2290
>     - qcom,mdss-dsi-ctrl
> 
> means either "qcom,dsi-ctrl-6g-qcm2290" or "qcom,mdss-dsi-ctrl" are valid compat strings...
Correct

> 
> As an example if you apply your change and then change the msm8916.dtsi to the below
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index e75a3efe4dace..e93c16431f0a1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -34,7 +34,7 @@ properties:
>        - items:
>            - enum:
>                - dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl
> +              - qcom,mdss-dsi-ctrl
>          deprecated: true
> 
>    reg:
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0733c2f4f3798..829fbe05b5713 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
>                         };
> 
>                         dsi0: dsi@1a98000 {
> -                               compatible = "qcom,msm8916-dsi-ctrl",
> -                                            "qcom,mdss-dsi-ctrl";
> +                               compatible = "qcom,mdss-dsi-ctrl";
>                                 reg = <0x01a98000 0x25c>;
>                                 reg-names = "dsi_ctrl";
> 
> Then test it with
> 
> make O=$BUILDDIR DT_DOC_CHECKER=$DT_DOC_CHECKER DT_EXTRACT_EX=$DT_EXTRACT_EX DT_MK_SCHEMA=$DT_MK_SCHEMA DT_CHECKER=$DT_CHECKER CHECKER_FLAGS=-W=1 CHECK_DTBS=y qcom/apq8016-sbc.dtb
(sidenote: you can just do

make ARCH=.. OUT=.. CHECK_DTBS=y qcom/apq8016-sbc.dtb

the tools are picked up automatically by Kbuild)

> 
> you'll see no error. However if you just do this
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0733c2f4f3798..829fbe05b5713 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
>                         };
> 
>                         dsi0: dsi@1a98000 {
> -                               compatible = "qcom,msm8916-dsi-ctrl",
> -                                            "qcom,mdss-dsi-ctrl";
> +                               compatible = "qcom,mdss-dsi-ctrl";
>                                 reg = <0x01a98000 0x25c>;
>                                 reg-names = "dsi_ctrl";
> 
> 
> and run the same test you get
Yes, correct. It's valid but it's deprecated, so the bindings are
sane. Keep in mind there's an ABI-like aspect to this.

Konrad
> 
> apq8016-sbc.dtb: dsi@1a98000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['qcom,mdss-dsi-ctrl'] is too short
>     'qcom,mdss-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
> 
> ---
> bod
