Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205166AAB55
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 17:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA8610E10D;
	Sat,  4 Mar 2023 16:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2762110E10D
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 16:59:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so5697617wmb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 08:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677949161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3hZJhaTdSbx5SAhlYomj5DCnJLkk+FlTPENqwit04iA=;
 b=Ob9YQEeDG9Lk1DPv8btDYIE1+l7NEf98lMpzM/BO4BvhE4XH9Y89bn6qyWd8JvqF9B
 972C5kQZwBeBlSrzfQDUE3EYOc0SE6XzEFy1UqRw1XTVo2UysqVYu+q78ws2jrCShla4
 d9neSojbjmt9sjZFtXtphO/TqQ79g/5ha5DQQ4LL1lMKTATOi3Ej+236zd7MB6+qt4BC
 u7O1dvYiOYXIyLcQrunWfHmIdonwdGKHed4CISK5u9KqUyzfMCBycIdIk8rPvYSp90P0
 GtDXiEJGmGYAgsMwucGldlmNVSHRzzKwAWeTJdWJuE3FmyoHx9SNvO0E/362glqRvW7P
 fXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677949161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3hZJhaTdSbx5SAhlYomj5DCnJLkk+FlTPENqwit04iA=;
 b=djPDjcNJlDDZa6xfPKUggv37enFH/lq7RLCvmCRoAzhWv2cw9EQzAPwjqnyKg4u+RQ
 PU6oDRWmPdTyCmK5hyWNxfPByXl2hjnfi19O7cLGxb3T7CMQTai0lTWxYAB23pwjxLzw
 2jG7UuSP6IIsO/r4/Eq8tj+YUCFpGWpGZ4khJ5bIuvLFk9qjLafjqsflErCOVOxaf8zM
 bAcDGB9PPRgsZOVOVYUKwG/r5qmxvUsyRSVzlukFslpKFJ2Z/UjU+nJpXX0hrQXC3je7
 vKo6f5eLSSMUzVYTHNaPBWOhiRa7MersDAjiVi6alvlKJy6p8uIah1zmrOTnJPtOrru/
 zh6w==
X-Gm-Message-State: AO0yUKWZ7a8FVGkP691WdWhOcXHom2PcWZqdr5x9H84HVKPIgOOwmdWZ
 mBsGOWCkXFzKXURIMcHyFPx7tA==
X-Google-Smtp-Source: AK7set/VhU5XG+hFSJa255qEqLLewO2xktt/9Ut9f03wFAXIAXZFmNkbR/mXXoQwXvv1qPzbJ+c2og==
X-Received: by 2002:a05:600c:190b:b0:3ea:e7f6:f8f9 with SMTP id
 j11-20020a05600c190b00b003eae7f6f8f9mr4939505wmq.19.1677949161497; 
 Sat, 04 Mar 2023 08:59:21 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm5555843wme.25.2023.03.04.08.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 08:59:21 -0800 (PST)
Message-ID: <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
Date: Sat, 4 Mar 2023 16:59:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2023 15:55, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index f195530ae964..d534451c8f7f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -35,7 +35,7 @@ properties:
>         - items:
>             - enum:
>                 - qcom,dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl
> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>           deprecated: true
>   
>     reg:
> 

This change would make compatible = "qcom,dsi-ctrl-6g-qcm2290", 
"qcom,mdss-dsi-ctrl"; break though

Take this example, I'm going to use 8916 because its easy.

If we apply your change to dsi-controller-main.yaml

diff --git 
a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 
b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dace..e93c16431f0a1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -34,7 +34,7 @@ properties:
        - items:
            - enum:
                - dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl
          deprecated: true

    reg:

and then make 8916 == compatible = "qcom,dsi-ctrl-6g-qcm2290", 
"qcom,mdss-dsi-ctrl";

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi 
b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0733c2f4f3798..7332b5f66a09d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1094,7 +1094,7 @@ mdp5_intf1_out: endpoint {
                         };

                         dsi0: dsi@1a98000 {
-                               compatible = "qcom,msm8916-dsi-ctrl",
+                               compatible = "dsi-ctrl-6g-qcm2290",
                                              "qcom,mdss-dsi-ctrl";
                                 reg = <0x01a98000 0x25c>;
                                 reg-names = "dsi_ctrl";

arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: dsi@1a98000: compatible: 
'oneOf' conditional failed, one must be fixed:
	['dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl'] is too long


so compatible = "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"; is now 
invalid, not deprecated.

This change also makes compatible = "qcom,dsi-ctrl-6g-qcm2290" or 
compatible = "qcom,mdss-dsi-ctrl" standalone valid compatible which is 
again not what we want.

- enum:
     - qcom,dsi-ctrl-6g-qcm2290
     - qcom,mdss-dsi-ctrl

means either "qcom,dsi-ctrl-6g-qcm2290" or "qcom,mdss-dsi-ctrl" are 
valid compat strings...

As an example if you apply your change and then change the msm8916.dtsi 
to the below

diff --git 
a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 
b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dace..e93c16431f0a1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -34,7 +34,7 @@ properties:
        - items:
            - enum:
                - dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl
          deprecated: true

    reg:
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi 
b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0733c2f4f3798..829fbe05b5713 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
                         };

                         dsi0: dsi@1a98000 {
-                               compatible = "qcom,msm8916-dsi-ctrl",
-                                            "qcom,mdss-dsi-ctrl";
+                               compatible = "qcom,mdss-dsi-ctrl";
                                 reg = <0x01a98000 0x25c>;
                                 reg-names = "dsi_ctrl";

Then test it with

make O=$BUILDDIR DT_DOC_CHECKER=$DT_DOC_CHECKER 
DT_EXTRACT_EX=$DT_EXTRACT_EX DT_MK_SCHEMA=$DT_MK_SCHEMA 
DT_CHECKER=$DT_CHECKER CHECKER_FLAGS=-W=1 CHECK_DTBS=y qcom/apq8016-sbc.dtb

you'll see no error. However if you just do this

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi 
b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0733c2f4f3798..829fbe05b5713 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
                         };

                         dsi0: dsi@1a98000 {
-                               compatible = "qcom,msm8916-dsi-ctrl",
-                                            "qcom,mdss-dsi-ctrl";
+                               compatible = "qcom,mdss-dsi-ctrl";
                                 reg = <0x01a98000 0x25c>;
                                 reg-names = "dsi_ctrl";


and run the same test you get

apq8016-sbc.dtb: dsi@1a98000: compatible: 'oneOf' conditional failed, 
one must be fixed:
	['qcom,mdss-dsi-ctrl'] is too short
	'qcom,mdss-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 
'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 
'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 
'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 
'qcom,sdm845-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 
'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']

---
bod
