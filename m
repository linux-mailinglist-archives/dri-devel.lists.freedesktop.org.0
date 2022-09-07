Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8035B0DAF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0255810E861;
	Wed,  7 Sep 2022 20:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39810E861;
 Wed,  7 Sep 2022 20:03:37 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so10997279otq.5; 
 Wed, 07 Sep 2022 13:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=HJtpL2X+zo8QGiAz4xLcd6dnwWmk0PxaqMgysL3AVC8=;
 b=10AcWhjBmgmP0ZnxUQsbXXaXvqQnQ/j1McXorfyiH6nLbad3VbXfU/D3EZZCV1LFUp
 8VOlNWMNpB/Fil2B+eO7YjddxdW3jqqvtuiwXYN+B3OTqPi0KYWqwwVfVNTTBk8cbcfk
 +Tka1HC7v7qRqs8xPP7JjykB9Y9LMHAMapQaZT2ioG9Ue+T2TEdg4hHNoR+nnmRYB19m
 FIzXzAIDYSMzHLXS/+LiXwzCeKyUuEfdF4To1yZQ4WCAGuMOVzVzXrrYOvDyv0Uycix5
 6AR6xZDzzNqsjTCxgUQy6G27IBIT1MhpwAs27UGWJjc3YzykQUAyJZ5XvoFcA8P0/mcw
 8Ytg==
X-Gm-Message-State: ACgBeo0cYpsMo4SFCVX+TTJJiLmR81lzvIC+qUCPtM/sY4r/Dqq13Z3+
 M57+xtUbFAdHX42Bjc9NLA==
X-Google-Smtp-Source: AA6agR7IyMO/AfcshwHGYC1fPOTTYCdaa/6reZ0Ew4AMdBfoMVEEfqKL5j7akmLaX8uKO+dYpP2hag==
X-Received: by 2002:a9d:6b15:0:b0:636:deac:5288 with SMTP id
 g21-20020a9d6b15000000b00636deac5288mr2156093otp.236.1662581016595; 
 Wed, 07 Sep 2022 13:03:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z125-20020aca3383000000b00326cb6225f8sm6786337oiz.44.2022.09.07.13.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 13:03:36 -0700 (PDT)
Received: (nullmailer pid 118890 invoked by uid 1000);
 Wed, 07 Sep 2022 20:03:35 -0000
Date: Wed, 7 Sep 2022 15:03:35 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Message-ID: <20220907200335.GA113284-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-6-dmitry.baryshkov@linaro.org>
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

On Thu, Sep 01, 2022 at 01:23:05PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 42 ++--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 52 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 51 ++----------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 51 ++----------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 55 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 116 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> new file mode 100644
> index 000000000000..053c1e889552
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties (common properties)

...MDSS common properties

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    minItems: 1
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> +
> +  ranges: true
> +
> +  interconnects:
> +    minItems: 1
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
> +      - description: Interconnect path specifying the port ids for data bus

Same description twice...

> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: true
> -- 
> 2.35.1
> 
> 
