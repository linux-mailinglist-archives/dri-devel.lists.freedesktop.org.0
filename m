Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF76B95B8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF3C10E7D3;
	Tue, 14 Mar 2023 13:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AC310E7CE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 13:13:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6B2F4203B0;
 Tue, 14 Mar 2023 14:13:11 +0100 (CET)
Date: Tue, 14 Mar 2023 14:13:10 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
Message-ID: <20230314131310.2yjzxfe4bqfuku3m@SoMainline.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-9-54b4898189cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v4-9-54b4898189cb@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-14 13:13:47, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Example is nice and tidy now, thanks!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 94f4cdf88c95..d534451c8f7f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -25,6 +25,7 @@ properties:
>                - qcom,sc7280-dsi-ctrl
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,sm6115-dsi-ctrl
>                - qcom,sm8150-dsi-ctrl
>                - qcom,sm8250-dsi-ctrl
>                - qcom,sm8350-dsi-ctrl
> @@ -351,6 +352,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,sm6115-dsi-ctrl
>      then:
>        properties:
>          clocks:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> index 2491cb100b33..b9f83088f370 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -40,7 +40,13 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,dsi-ctrl-6g-qcm2290
> +        oneOf:
> +          - items:
> +              - const: qcom,sm6115-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl
> +          - description: Old binding, please don't use
> +            deprecated: true
> +            const: qcom,dsi-ctrl-6g-qcm2290
>  
>    "^phy@[0-9a-f]+$":
>      type: object
> @@ -114,7 +120,7 @@ examples:
>          };
>  
>          dsi@5e94000 {
> -            compatible = "qcom,dsi-ctrl-6g-qcm2290";
> +            compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>              reg = <0x05e94000 0x400>;
>              reg-names = "dsi_ctrl";
>  
> 
> -- 
> 2.39.2
> 
