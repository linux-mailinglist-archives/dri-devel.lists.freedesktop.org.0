Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A752FB271ED
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 00:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E03110E0B5;
	Thu, 14 Aug 2025 22:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DzwUkoTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596C10E0B5;
 Thu, 14 Aug 2025 22:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4019B44F52;
 Thu, 14 Aug 2025 22:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1540C4CEF1;
 Thu, 14 Aug 2025 22:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755211574;
 bh=eVKCvuZBdo7sTzDK9mufFyxVjNlpGmchq+d/D5GmycM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DzwUkoTqwUMyNSWMdTnnC7kDdMAhoIBXxmxUvHpoKQ3lHJzR15QCFXYIkslS5771z
 np5vqUeJLkSaucizKdOw+Qodlq6CX3ORVE1aeEDNZuZHAijeEhJGuUiJBXaPbAznRx
 d3fPFHHjU8QmSiNrXeQ/yNn0dcLrAI+skVOImTGRxtwDMqHsyoOLLC7uhUVsHP+85M
 bShH9tgKuPo1B+Xh4owWq1mKrO8fDgq7LEcHJHTYMehJZrFM0ntCtZo2FoH5nPUbFq
 aWNUrZM2aw8YNuIW1VxjCFifU+QIbhfxh/EzqiwMFaApPX/RYxntHnC6rsP1gEgYfb
 /Zdp9OI2Pw16w==
Date: Thu, 14 Aug 2025 17:46:13 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <20250814224613.GA4052689-robh@kernel.org>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
 <20250809-dp_mst_bindings-v5-5-b185fe574f38@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-dp_mst_bindings-v5-5-b185fe574f38@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 09, 2025 at 12:16:19PM +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller. Expand
> corresponding clock bindings for these platforms and fix example
> schema files to follow updated bindings.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 72 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++-
>  5 files changed, 108 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 352824c245224d7b5e096770684795625fc9f146..0122592a3ef5fcfe5a5ff8364b2cb6540a37a8ab 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -58,20 +58,28 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
> +      - description: Display Port stream 2 Pixel clock
> +      - description: Display Port stream 3 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
> +      - const: stream_2_pixel
> +      - const: stream_3_pixel
>  
>    phys:
>      maxItems: 1
> @@ -187,6 +195,68 @@ allOf:
>          required:
>            - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc7280-edp
> +              - qcom,sc8180x-edp
> +              - qcom,sc8280xp-edp
> +              - qcom,sm6350-dp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                # some of SA8775P DP controllers support 4 streams MST,
> +                # others just 2 streams MST
> +                - qcom,sa8775p-dp
> +      then:
> +        oneOf:
> +          - properties:
> +              clocks:
> +                minItems: 8
> +                maxItems: 8
> +          - properties:
> +              clocks:
> +                minItems: 6
> +                maxItems: 6

I don't really care if we catch someone putting in 7 clocks. So just 
do:

clocks:
  minItems: 6
  maxItems: 8

> +      else:
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  # on these platforms some DP controllers support 2 streams
> +                  # MST, others are SST only
> +                  - qcom,sc8280xp-dp
> +                  - qcom,x1e80100-dp
> +        then:
> +          oneOf:
> +            - properties:
> +                clocks:
> +                  minItems: 6
> +                  maxItems: 6
> +            - properties:
> +                clocks:
> +                  minItems: 5
> +                  maxItems: 5

And here you really didn't need the oneOf.

> +        else:
> +          properties:
> +            clocks:
> +              minItems: 6
> +              maxItems: 6
> +
> +
>  additionalProperties: false
>  
>  examples:
