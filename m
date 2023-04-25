Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D66EE647
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 19:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F40C10E2EB;
	Tue, 25 Apr 2023 17:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D7A10E0AE;
 Tue, 25 Apr 2023 17:03:22 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-18e26c08349so3332059fac.0; 
 Tue, 25 Apr 2023 10:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442202; x=1685034202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZDfXI7hMbqGi7E82l8vWt9jneZ/T4Uui2TLcBQz+KM=;
 b=c3+edCJCof7Y73VgpJEKPyP7Qbi406dKWuZaphQ1/imhzUI8gwAxbjKCdC1nxumTf3
 qsdhAroOolZRE/o5xa/zKVPXrO8c7DnsUX5b/j0Wd1X7n64VRq0xkSgHpXWv2B3YiblM
 bhMUZR7daUGGfYs7HuALw4Gwii6c+hwArl5ENzAQFv5hA3z/N7nSswK65qpxHn3MA37g
 MLw/yx8qww6n3b7K0nwQ5GwTV5kqQZUdO6319D8Oj0reT/CbfU01xeU8i5OdzIZzWQeb
 rEcqvPh1BAcO+BufRoV7cHhYHdL7uOzp40jmpDhyHuP7YxjDnoPLAdSFSxBLZqBakHfU
 /VOg==
X-Gm-Message-State: AAQBX9cxh6mIKIHwPL+SuD4WBUPGdW1tpsPrtGhWSLrEDQSOZRZZ6Vpj
 SWubNMY/ArsGk9ntJ55xMQ==
X-Google-Smtp-Source: AKy350Yul7/EEVvrMD/ABdCsLr9ode6pBn2tmtKnE0Rjjz8gJcwSoneSAZlS17HOt1THyFiTOOIaeQ==
X-Received: by 2002:a05:6870:63a4:b0:17e:6eaa:945f with SMTP id
 t36-20020a05687063a400b0017e6eaa945fmr12199364oap.8.1682442201994; 
 Tue, 25 Apr 2023 10:03:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b1-20020a056870b24100b0018045663fc5sm5678632oam.48.2023.04.25.10.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:03:21 -0700 (PDT)
Received: (nullmailer pid 1948453 invoked by uid 1000);
 Tue, 25 Apr 2023 17:03:20 -0000
Date: Tue, 25 Apr 2023 12:03:20 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 03/13] dt-bindings: display/msm: Add SM6350 DPU
Message-ID: <20230425170320.GA1931576-robh@kernel.org>
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
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display axi clock
> +      - description: Display ahb clock
> +      - description: Display rot clock
> +      - description: Display lut clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: rot
> +      - const: lut
> +      - const: core
> +      - const: vsync

Is there some reason the clocks are in different order? They appear to 
be the same minus the 'throttle' clock. Is there really no 'throttle' 
clock? Maybe this platform just tied it to one of the same clocks in the 
above?

I really hate the mess that is clocks. We have the same or related 
blocks with just totally different names and order. The result is 
if/then schemas or separate schemas like this. Neither option is great, 
but at least the if/then schemas provides some motivation to not have 
pointless variations like this. </rant>

As it seems the only difference between these 2 bindings is 1 extra 
clock, can't they be shared?

Rob
