Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E062BEE197
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F63D10E152;
	Sun, 19 Oct 2025 09:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uS+5M1Qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D674010E152;
 Sun, 19 Oct 2025 09:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 604B2481A8;
 Sun, 19 Oct 2025 09:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D906C4CEE7;
 Sun, 19 Oct 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760865190;
 bh=cS2664aPb+EmVIid19f3kzZfKdifj4f7Pzq4bzCqEdI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uS+5M1QeR6d0fvKMMVJIx4KJo8wpoKJWjEP6AmnxDbiGlCrSTU11/k2Xt1MzDI1CK
 eKc5gp/lPLJa0Y/1ZETKYLIoUvDCQmWt7yfXNIMAILV5tZ14r9RE6Ib5QH9ey+3uG4
 76PPa4/5QZqnbZDNOFK/E4mQRdAAWiU3jFJdoGzCpfzpZysDE7uveTFtZ6ty3BYlYx
 S7IVioorvHJr6rW1iA0lsKVHo3QVgNUxWkBccNxLh8r9w1w6brpuvRZ7gG4i0CaHO+
 W98jlBDe0OcYrCT5f/QN7WwKxFkQRwr84n245Wk5cGktQhSxqcWBKJYR4ghVOywqaP
 bUP6EGKN1hFQg==
Message-ID: <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
Date: Sun, 19 Oct 2025 11:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/10/2025 19:08, Akhil P Oommen wrote:
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> support. Compared to GMU, it doesn't manage GPU clock, voltage
> scaling, bw voting or any other functionalities. All it does is detect
> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> it doesn't require iommu.
> 
> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> schema.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>  1 file changed, 79 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -26,6 +26,9 @@ properties:
>        - items:
>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>            - const: qcom,adreno-gmu
> +      - items:
> +          - const: qcom,adreno-rgmu-612.0
> +          - const: qcom,adreno-rgmu
>        - const: qcom,adreno-gmu-wrapper
>  
>    reg:
> @@ -45,24 +48,30 @@ properties:
>      maxItems: 7
>  
>    interrupts:
> -    items:
> -      - description: GMU HFI interrupt
> -      - description: GMU interrupt


Both stay, just explain what is the first interrupt. You should not drop
descriptions here. Look at every other binding - of course except that
terrible Adreno GPU which is anti-example.

> +    minItems: 2
> +    maxItems: 2
>  
>    interrupt-names:
> -    items:
> -      - const: hfi
> -      - const: gmu
> +    oneOf:
> +      - items:
> +          - const: hfi
> +            description: GMU HFI interrupt

No, descriptions never go to xxx-names, but to xxx.

> +          - const: gmu
> +            description: GMU interrupt
> +      - items:
> +          - const: oob
> +            description: GMU OOB interrupt
> +          - const: gmu
> +            description: GMU interrupt
> +
>  
>    power-domains:
> -    items:
> -      - description: CX power domain
> -      - description: GX power domain
> +    minItems: 2
> +    maxItems: 3

No.

>  
>    power-domain-names:
> -    items:
> -      - const: cx
> -      - const: gx
> +    minItems: 2
> +    maxItems: 3


No. Why?

>  
>    iommus:
>      maxItems: 1
> @@ -86,6 +95,44 @@ required:
>  additionalProperties: false
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-rgmu-612.0
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Core RGMU registers
> +        reg-names:
> +          items:
> +            - const: gmu
> +        clocks:
> +          items:
> +            - description: GMU clock
> +            - description: GPU CX clock
> +            - description: GPU AXI clock
> +            - description: GPU MEMNOC clock
> +            - description: GPU SMMU vote clock
> +        clock-names:
> +          items:
> +            - const: gmu
> +            - const: cxo
> +            - const: axi
> +            - const: memnoc
> +            - const: smmu_vote
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: GX power domain
> +            - description: VDD_CX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: gx
> +            - const: vdd_cx

This does not make even sense. Why did you remove the the common list
from  power-domain-names?

> +
>    - if:
>        properties:
>          compatible:
> @@ -313,13 +360,26 @@ allOf:
>            items:
>              - const: gmu
>      else:
> -      required:
> -        - clocks
> -        - clock-names
> -        - interrupts
> -        - interrupt-names
> -        - iommus
> -        - operating-points-v2
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: qcom,adreno-rgmu
> +      then:
> +        required:
> +          - clocks
> +          - clock-names
> +          - interrupts
> +          - interrupt-names
> +          - operating-points-v2
> +      else:

No. Don't nest multiple ifs.

> +        required:
> +          - clocks
> +          - clock-names
> +          - interrupts
> +          - interrupt-names
> +          - iommus
> +          - operating-points-v2
>  
>  examples:
>    - |
> 


Best regards,
Krzysztof
