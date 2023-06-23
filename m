Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DE73BF6D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E610E6A9;
	Fri, 23 Jun 2023 20:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341A10E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:22:22 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1CD083F6B1;
 Fri, 23 Jun 2023 22:22:19 +0200 (CEST)
Date: Fri, 23 Jun 2023 22:22:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
Message-ID: <yvwepixjjl32j5vwo2kb47omds7mdhz4ed5byrvbc6pdwhmqie@6s3mursejom7>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-1-733ed383f6b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-1-733ed383f6b6@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-23 14:32:53, Neil Armstrong wrote:
> Document the optional displayport controller subnode of the SM8350 MDSS.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> index 79a226e4cc6a..f2cbeb435f1b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> @@ -52,6 +52,12 @@ patternProperties:
>        compatible:
>          const: qcom,sm8350-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      properties:
> 
> -- 
> 2.34.1
> 
