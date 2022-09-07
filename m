Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DA5B0D99
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618610E863;
	Wed,  7 Sep 2022 19:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2C810E863;
 Wed,  7 Sep 2022 19:59:06 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-127dca21a7dso11443845fac.12; 
 Wed, 07 Sep 2022 12:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=vEqVd2k+2TAPs8cnrAp8dbyIOEfZe94ggvuKkbHBjfE=;
 b=B+lCY8Hy1k2yYVFkibb9jjeV2U7vodfSc5Uxza2G7T2KHt4cailaGw5azuJ7bIAPUB
 HDBNLVLj59de+KRXrSsg6hT3kR6KojZQtmZIPEsJPI7GkrmixUJwo08D95wjrki2xMFf
 OeOSZNWCEMSaFQBs0n3wtvbPn20ku6zMATW9UQHWMB+CJpwKx6Beh3qyak49w1vzN75P
 wTgz2O4QwrEr1CK/X0Y6u7qTGfcTscBP318PVPyilRnNvbcqqQVLw+SnKi7s1hnFaNl0
 32qWtxs7d7P0fS0AFZf4Te+VD8+HDwIfI9pQhZ5VxHd87oYj4xeMitzYZGTqmHKbGA08
 lHGA==
X-Gm-Message-State: ACgBeo0PRe7iYLAn7KaPTxi9k/S0mrgCn7b194GfrWskA1/l5yStjNBI
 T3R3FaCuSnyQQjjriBSGrQ==
X-Google-Smtp-Source: AA6agR7v7B3ZgVF/EuigyxD9vJaQk60vlALu+YF0C/uZRmm7ur/lJ+s7NOO5kAzLaxANl0JMB10s/A==
X-Received: by 2002:a05:6870:d209:b0:127:5f0b:e18 with SMTP id
 g9-20020a056870d20900b001275f0b0e18mr69292oac.47.1662580745319; 
 Wed, 07 Sep 2022 12:59:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056870c0ce00b0010e73e252b8sm5936082oad.6.2022.09.07.12.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 12:59:05 -0700 (PDT)
Received: (nullmailer pid 111227 invoked by uid 1000);
 Wed, 07 Sep 2022 19:59:04 -0000
Date: Wed, 7 Sep 2022 14:59:04 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220907195904.GA98468-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 01:23:04PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
>  6 files changed, 64 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..bf5764e9932b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,44 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Common properties for QCom DPU display controller.
> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

Haven't we been over this already?

You have to define 'port' nodes or else anything is allowed in them 
(and endpoint nodes). If you want to define them as pattern, then fine. 
But you must have a ref to graph.yaml#/properties/port.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - operating-points-v2
> +  - ports
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 253665c693e6..0d6743eabd27 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -62,7 +62,10 @@ patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
>      description: Node containing the properties of DPU.
> -    additionalProperties: false
> +    unevaluatedProperties: false
> +
> +    allOf:
> +      - $ref: /schemas/display/msm/dpu-common.yaml#

Don't need allOf here. (and elsewhere)

Rob
