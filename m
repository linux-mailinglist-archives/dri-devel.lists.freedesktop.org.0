Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC660E6D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 19:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58E110E66B;
	Wed, 26 Oct 2022 17:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B17C10E66D;
 Wed, 26 Oct 2022 17:54:41 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 m5-20020a9d73c5000000b0066738ce4f12so3266096otk.12; 
 Wed, 26 Oct 2022 10:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmbqUT3CmVbU0HzMpVAJyOgaDhVx3i4wGwXhoedlXNs=;
 b=gX5EYFmEKPAY9RYM3az+TEekQif5KQItcwE1QS7SsEQjozCKqEm38Y26O0wp4iK0ve
 k4ojfOViD0mf4NoRPv23vsy6zBQEp11Wesx9Xzgan4QlwfTSUwOIgad/RAxM7PtXzTDn
 Lj+3jvn3CrDPHoAtStptcGc74d4v8IKinXqmikUrrJzwSI5Q31tnSKj0UdsL6LkLKr//
 i851YvtHZojBaNQ6v6xkbmNi2lmU6SX5hCN8sgTomWyAuN3KGl19ZYfVCYMZhMYmNqa3
 BlCfwd+3Qsir1q58VG+srGgQpg4HQbqg7PYuES0PISroqQJOet8bF1jjVNDrWS6x1nxE
 xrqQ==
X-Gm-Message-State: ACrzQf03DrDCNFEfsNkNa3h2yTOWmlFVEA5uPmS3G5omuZrRxchR/QWJ
 corMO4rk5JDCRHid8UtmqQ==
X-Google-Smtp-Source: AMsMyM7u/5xsmyjQ88MnSABwibsj9ORVBkFwkQ3aUNkf/hBMroiSAacuWdQE9wICk8HxIgRsWTUPqg==
X-Received: by 2002:a05:6830:d02:b0:661:9466:dfc3 with SMTP id
 bu2-20020a0568300d0200b006619466dfc3mr22434647otb.333.1666806880150; 
 Wed, 26 Oct 2022 10:54:40 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n44-20020a056870972c00b0011f22e74d5fsm3405812oaq.20.2022.10.26.10.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 10:54:39 -0700 (PDT)
Received: (nullmailer pid 820018 invoked by uid 1000);
 Wed, 26 Oct 2022 17:54:41 -0000
Date: Wed, 26 Oct 2022 12:54:41 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: display/msm: Add binding for
 SC8280XP MDSS
Message-ID: <20221026175441.GA812056-robh@kernel.org>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-2-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026032624.30871-2-quic_bjorande@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 08:26:13PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add binding for the display subsystem and display processing unit in the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v2:
> - Cleaned up description and interconnect definitions
> - Added opp-table
> 
>  .../bindings/display/msm/dpu-sc8280xp.yaml    | 287 ++++++++++++++++++
>  1 file changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml

Doesn't this need to be reworked to match Dmitry's restructuring?

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> new file mode 100644
> index 000000000000..24e7a1562fe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> @@ -0,0 +1,287 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc8280xp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Processing Unit for SC8280XP
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8280xp-mdss
> +
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
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +

> +  "#address-cells": true
> +
> +  "#size-cells": true

enum: [ 1, 2 ]

(Nothing else sets that)

Rob
