Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D46EE620
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229AE10E7B4;
	Tue, 25 Apr 2023 16:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E340810E7B2;
 Tue, 25 Apr 2023 16:53:12 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-38e2740958aso2235767b6e.1; 
 Tue, 25 Apr 2023 09:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682441592; x=1685033592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsSaFPoEnp1cGsorTT7ZaH8aG8h2ymJ3AbL8g9oAX2c=;
 b=bFgyuKKiSA38FW5IQvy/mNwWoTrvHd7qlAeNWQLtimLt3FgdXcZ+sVXCI6VhOS4my8
 uFBSndPisouy4do9AfJHK93Gu4A9TIUWyNN3KGzie2iy5nJZ1ZFkjEm0Ta+hpohmk3/9
 zWArBAdygj/QuMmKifEuSEcq+wda0MFLPOYxMqdkZV6fBvKod/h6DuB7wGh+0nNAV1Tc
 vZtD49RSWyTp5m6nh4028C1kRtKoRWLuGWv3TCc28uWPr9Tjs1IdOHkrhUGaR/GUzg9X
 RmFi/ZFc9TZDstC/0cr5SJ5sxYtfcyi57n0nr2czJywC1sQlMhqAvXBKvWdxY7hVXoZV
 QoLA==
X-Gm-Message-State: AAQBX9d4gXF//V4C62vdGt6DRZcoswj66gzU5K7oHb5PZLz53pfyMfwZ
 ZAV4dYZqjabQMKN9KAs4gw==
X-Google-Smtp-Source: AKy350bfrDTwQxvMUyap3y3hJHSKG/gULg481X3pOZQCJmRNZ5VYkfUL4Idx8sx5O25r4MyufQ1RvQ==
X-Received: by 2002:a05:6808:1392:b0:387:14b7:f8e7 with SMTP id
 c18-20020a056808139200b0038714b7f8e7mr10106662oiw.38.1682441591645; 
 Tue, 25 Apr 2023 09:53:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020a056808048900b0038dd5bf922bsm5772958oid.22.2023.04.25.09.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:53:11 -0700 (PDT)
Received: (nullmailer pid 1931342 invoked by uid 1000);
 Tue, 25 Apr 2023 16:53:10 -0000
Date: Tue, 25 Apr 2023 11:53:10 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 03/13] dt-bindings: display/msm: Add SM6350 DPU
Message-ID: <20230425165310.GA1928942-robh@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-3-5def73f50980@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-3-5def73f50980@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 12:31:12AM +0200, Konrad Dybcio wrote:
> Document the SM6350 DPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-dpu.yaml      | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
> new file mode 100644
> index 000000000000..979fcf81afc9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SM6350 target
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sm6350-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set

Drop 'Address offset and size for '

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
