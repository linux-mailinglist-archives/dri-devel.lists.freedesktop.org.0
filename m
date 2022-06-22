Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C623554CF7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5610FCBF;
	Wed, 22 Jun 2022 14:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05010FCBF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:28:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o9so14933761edt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KF2rN6or5HKqUuQgEplVYVKSFo8eqgnFjZPNJQPN7DY=;
 b=wHtAo5TFotLBbcElJtBbyRlvW3Fh6/jVwjWcRSfL74sxvd7rCWnn9WKriUvEaGefY9
 NAoYhzEoSrAAXIVCQ8ubyBS5nW8rY/NzPQQOygi1LLqnhZ9YfrThXn4yeqxAcS/btKXE
 iTOpWZvsCeW+Il067F706l+8m99tSltHYDpniSuZNIRE2orW1WZCAHFD2C3RvhUAZ7I2
 88hhfHDMeN0ORI+QmtZ+EyUM2kr5gguenwyxas9XZrNfWGhKxaJBHQT0/WWU1WhJPQ5a
 nHXis3h+j4Gbh4Ste8bEmc5JRPP7xqX5Uss0t6wJtjksbQI/eBQoLoFnPYaLBrO9gx0K
 2XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KF2rN6or5HKqUuQgEplVYVKSFo8eqgnFjZPNJQPN7DY=;
 b=gqtkjIlnfj/f7KpGmxvFFGjbJXJtFnHQYEZaRszC8nJXEjl0pnn/VBshPzs5Qizfhf
 0xXuJ4fZDKxJsFxiQhU13000sR0560irBUFGVW9NQcuhpV11SRSQHGS36KW8CAtvG1FY
 SwlH8QSDZch3fj1YpE+d0dbFABEobeR3e+jExUE7C2Z1yPookwdPh1Be0ECDtuvDSq7Q
 9D9RBSjkDIvRinPd77PI3Q3ErJM1Cl7bIMVS3nnnXkTVNgszWpjcquo/WJF73cDkm8lo
 ZseIR4vJqrNqT71t74K1/LPTd3Z+z1ZWCOXq3G3JA2uRWUreIVZ6Ymac1J8cXU3wu2sA
 qG0A==
X-Gm-Message-State: AJIora8dfHDIP6sKuAru/heAxz2B1OsUqhPy8vcpyA0+b/gc4DnGGTvL
 KSLDL2dR90KBd5SglUln1FHIUQ==
X-Google-Smtp-Source: AGRyM1v26ha318CN8KJM3KWSrdhQTfAp/GKOeRT0mkhtPFB53FRQRyFwPmVys9k8fqLFOlUe6dJ4xg==
X-Received: by 2002:aa7:c542:0:b0:435:75e:8a7b with SMTP id
 s2-20020aa7c542000000b00435075e8a7bmr4498560edr.108.1655908094665; 
 Wed, 22 Jun 2022 07:28:14 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g36-20020a056402322400b004357f88fcdcsm8130733eda.11.2022.06.22.07.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:28:14 -0700 (PDT)
Message-ID: <767ffc9d-bc36-c627-8245-e46a46e6974d@linaro.org>
Date: Wed, 22 Jun 2022 16:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/13] dt-bindings: Add bindings for Tegra234 Host1x
 and VIC
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 digetx@gmail.com
References: <20220622113733.1710471-1-cyndis@kapsi.fi>
 <20220622113733.1710471-2-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622113733.1710471-2-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 13:37, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update VIC and Host1x bindings for changes in Tegra234.
> 
> Namely,
> - New compatible strings
> - Sharded syncpoint interrupts
> - Optional reset.
> 
> Also, fix the order of descriptions for VM/hypervisor
> register apertures -- while the reg-names specification
> was correct, the descriptions for these were switched.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Add back 'required' for resets/reset-names on older SoCs
> * Simplified reg descriptions
> * Updated commit message
> ---
>  .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 110 +++++++++++++++---
>  2 files changed, 95 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> index 37bb5ddc1963..7200095ef19e 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> @@ -21,6 +21,7 @@ properties:
>            - nvidia,tegra210-vic
>            - nvidia,tegra186-vic
>            - nvidia,tegra194-vic
> +          - nvidia,tegra234-vic
>  
>        - items:
>            - const: nvidia,tegra132-vic
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 0adeb03b9e3a..5fe25e0a8d48 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -24,6 +24,7 @@ properties:
>            - nvidia,tegra210-host1x
>            - nvidia,tegra186-host1x
>            - nvidia,tegra194-host1x
> +          - nvidia,tegra234-host1x
>  
>        - items:
>            - const: nvidia,tegra132-host1x
> @@ -31,23 +32,19 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    reg-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    interrupts:
> -    items:
> -      - description: host1x syncpoint interrupt
> -      - description: host1x general interrupt
>      minItems: 1
> +    maxItems: 9
>  
>    interrupt-names:
> -    items:
> -      - const: syncpt
> -      - const: host1x
>      minItems: 1
> +    maxItems: 9
>  
>    '#address-cells':
>      description: The number of cells used to represent physical base addresses
> @@ -110,13 +107,35 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - resets
> -  - reset-names
>  
>  additionalProperties:
>    type: object
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-host1x
> +              - nvidia,tegra30-host1x
> +              - nvidia,tegra114-host1x
> +              - nvidia,tegra124-host1x
> +              - nvidia,tegra210-host1x
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt
> +            - const: host1x
> +      required:
> +        - resets
> +        - reset-names
>    - if:
>        properties:
>          compatible:
> @@ -133,10 +152,8 @@ allOf:
>  
>          reg:
>            items:
> -            - description: physical base address and length of the register
> -                region assigned to the VM
> -            - description: physical base address and length of the register
> -                region used by the hypervisor
> +            - description: region used by the hypervisor
> +            - description: region assigned to the virtual machine
>  
>          resets:
>            maxItems: 1
> @@ -144,6 +161,67 @@ allOf:
>          reset-names:
>            maxItems: 1
>  
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt
> +            - const: host1x
> +
> +        iommu-map:
> +          description: Specification of stream IDs available for memory context device
> +            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
> +            usable stream IDs.
> +
> +      required:
> +        - reg-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-host1x
> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: common
> +            - const: hypervisor
> +            - const: vm
> +
> +        reg:
> +          items:
> +            - description: region used by host1x server
> +            - description: region used by the hypervisor
> +            - description: region assigned to the virtual machine
> +
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt 0
> +            - description: host1x syncpoint interrupt 1
> +            - description: host1x syncpoint interrupt 2
> +            - description: host1x syncpoint interrupt 3
> +            - description: host1x syncpoint interrupt 4
> +            - description: host1x syncpoint interrupt 5
> +            - description: host1x syncpoint interrupt 6
> +            - description: host1x syncpoint interrupt 7
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt0
> +            - const: syncpt1
> +            - const: syncpt2
> +            - const: syncpt3
> +            - const: syncpt4
> +            - const: syncpt5
> +            - const: syncpt6
> +            - const: syncpt7
> +            - const: host1x
> +
>          iommu-map:
>            description: Specification of stream IDs available for memory context device
>              use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
> @@ -160,8 +238,8 @@ examples:
>      host1x@50000000 {
>          compatible = "nvidia,tegra20-host1x";
>          reg = <0x50000000 0x00024000>;
> -        interrupts = <0 65 0x04   /* mpcore syncpt */
> -                      0 67 0x04>; /* mpcore general */
> +        interrupts = <0 65 0x04>, /* mpcore syncpt */
> +                     <0 67 0x04>; /* mpcore general */

Split this part to separate patch.

Rest looks good but because of dependency cannot be tested by automation.

>          interrupt-names = "syncpt", "host1x";
>          clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
>          clock-names = "host1x";


Best regards,
Krzysztof
