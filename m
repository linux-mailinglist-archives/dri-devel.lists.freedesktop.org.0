Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C05B024C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9F010E561;
	Wed,  7 Sep 2022 11:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CB110E561
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 11:02:04 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id k10so7226808lfm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2ZksrWzCxdsKB9eboZRhKTKOwecPVr614XThFnZuMQY=;
 b=SIo4JRXgobwzKo6dx+BfhDNvQHYrI9/AYfht4q9L8F+4CaGLDRmnqEfj5BGNkFnJmm
 OVJUB/LQj+KrH1zZNEWFcnYE/F3wNw1KodqzDT6pUOwn60hHNmFTqiBXxGxR0d3CPsKu
 UY/aaqqExMFOlgK+bjMsFqrlCbCDBstxETcDpSmatuFLoHauewPR48ZZqiLbrvXoTWST
 0T5Ox0yhRCyzsW1OMStINawkqE7I4n+jFBjqoqxIob5WDuusC9mctkIxOd7oH7YUnd7E
 uMMR+HG4+C2sPvQHY6MQ+7au4+XP1ns3QKzTd20CSNhq4Y2CGU7sUtlsDIbsgq+lWL1+
 +soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2ZksrWzCxdsKB9eboZRhKTKOwecPVr614XThFnZuMQY=;
 b=P32GRUPYquPj+5gAx3Asu1AOeL307ff5WVs9BrkzKOETNEAMJcPNQVfgQJHwgBXTZF
 jPaSx6IqREqygvsAPcd6swJ2mfwFjy9G26uTXepPg05PQ7qtorQcmhtg+lx9wKjnoutC
 udkKK4AssSXHHDmqfoiafqxYuR8kz61o2X4hyC+83aNfDQjBt8+D7ObcidFuBZUEIHqa
 H9BgFhGLGGMe3n/23oYktI8w0C622u+XS0I0nEumXvC64VseozIh90qx2vwpCHATguDX
 WKjTjO4r/rRF2VwI//v6AwYMieu4zI/bWu49NwQv18+xv3oEyORUvnuYT6fsRHQRoPaH
 cjSw==
X-Gm-Message-State: ACgBeo1AP/8FwhuWz0k7lCeyL/H89qV/nV2h/ZqbMyx+2/c4adwKXf9F
 vAQm4s+3UqwnXiTPFTWY7hDMvQ==
X-Google-Smtp-Source: AA6agR6pn15B0Te5FrvBxcTxQWV/My4R3Gt6Azp1JBIecWmKlQYgEcWkG2mc9R779tkRuU44NRWeJw==
X-Received: by 2002:a05:6512:1329:b0:492:e050:b0dc with SMTP id
 x41-20020a056512132900b00492e050b0dcmr1024413lfu.136.1662548523015; 
 Wed, 07 Sep 2022 04:02:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 r7-20020ac25f87000000b00492c017de43sm2402693lfe.127.2022.09.07.04.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 04:02:02 -0700 (PDT)
Message-ID: <d11b17d8-bc36-3a64-3de0-b188eeb5e9ba@linaro.org>
Date: Wed, 7 Sep 2022 13:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <20220906132823.2390953-4-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906132823.2390953-4-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 15:28, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update NVDEC bindings for Tegra234. This new engine version only has
> two memory clients, but now requires three clocks, and as a bigger
> change the engine loads firmware from a secure carveout configured by
> the bootloader.
> 
> For the latter, we need to add a phandle to the memory controller
> to query the location of this carveout, and several other properties
> containing offsets into the firmware inside the carveout. These
> properties are intended to be populated through a device tree overlay
> configured at flashing time, so that the values correspond to the
> flashed NVDEC firmware.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 118 +++++++++++++++---
>  1 file changed, 98 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> index 3cf862976448..27128a195b66 100644
> --- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -24,17 +24,11 @@ properties:
>        - nvidia,tegra210-nvdec
>        - nvidia,tegra186-nvdec
>        - nvidia,tegra194-nvdec
> +      - nvidia,tegra234-nvdec
>  
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    items:
> -      - const: nvdec

Please leave them here with wide constraints (min/maxItems).

> -
>    resets:
>      maxItems: 1
>  
> @@ -50,18 +44,6 @@ properties:
>  
>    dma-coherent: true
>  
> -  interconnects:
> -    items:
> -      - description: DMA read memory client
> -      - description: DMA read 2 memory client
> -      - description: DMA write memory client
> -
> -  interconnect-names:
> -    items:
> -      - const: dma-mem
> -      - const: read-1
> -      - const: write

Please leave them here with wide constraints (min/maxItems).

> -
>    nvidia,host1x-class:
>      description: |
>        Host1x class of the engine, used to specify the targeted engine
> @@ -79,7 +61,103 @@ required:
>    - reset-names
>    - power-domains
>  
> -additionalProperties: false
> +unevaluatedProperties: false

This looks not needed/related.

> +
> +allOf:

Put allOf before additionalProperties:false.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-nvdec
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: NVDEC clock
> +            - description: FUSE clock
> +            - description: TSEC_PKA clock
> +        clock-names:
> +          items:
> +            - const: nvdec
> +            - const: fuse
> +            - const: tsec_pka
> +        interconnects:
> +          items:
> +            - description: DMA read memory client
> +            - description: DMA write memory client
> +        interconnect-names:
> +          items:
> +            - const: dma-mem
> +            - const: write
> +        nvidia,memory-controller:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description:
> +            phandle to the memory controller for determining carveout information.

All fields should be defined in top-level. You can disallow them for
other variants, but if the allOf:if:then gets too big, it's a sign to
split the binding.

> +        nvidia,bl-manifest-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to bootloader manifest from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +        nvidia,bl-code-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to bootloader code section from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +        nvidia,bl-data-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to bootloader data section from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +        nvidia,os-manifest-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to operating system manifest from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +        nvidia,os-code-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to operating system code section from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +        nvidia,os-data-offset:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Offset to operating system data section from beginning of firmware. Typically set as
> +            part of a device tree overlay corresponding to flashed firmware.
> +      required:
> +        - nvidia,memory-controller
> +        - nvidia,bl-manifest-offset
> +        - nvidia,bl-code-offset
> +        - nvidia,bl-data-offset
> +        - nvidia,os-manifest-offset
> +        - nvidia,os-code-offset
> +        - nvidia,os-data-offset

blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:

Best regards,
Krzysztof
