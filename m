Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD81631B62D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B56A6E145;
	Mon, 15 Feb 2021 09:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B946E145
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:09:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id r5so2294698wmp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8G3QphKfOFczB+D0N4OlfKG924tFkriMk1+3T1mIU78=;
 b=RrQFugPtCt3rhZ+JWow2KVzbPc63WDEwY+PD1dhjftd47FJ8vFo9fYK2u3hQ6s2FVV
 La17AYjjj+r7N8L8D1edmoKq0XeddIUy/XXAhWYImpxdFBDl9+Brvu8LOL9S49P1Rtrb
 VwyqznfUCXTbfwM0/MtC5OkwooCgO+GoTu3SbrqKDA4vRVWpdgFppZ3NfI5dkvfXbues
 j3YeHbQwoftn97Ri6av0yihjA7GK/kJkekiOCoSStEYNBeRXH6o4GXJqbRLRTVSKvUNU
 WL0dbwzPyH9BHIFbUWu/4c8zIEub3EY2yvcAbtG/wDSyi8vm+Sp9IguMtBE5GVm4CVXX
 N4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8G3QphKfOFczB+D0N4OlfKG924tFkriMk1+3T1mIU78=;
 b=jo2M9UKMwxnWF+ydPQMcK6yYkTNL3aCYBNg2N5PIj+5BrJSla8O5MBG+6q0Tei0jK9
 Q7Fzpx6LUN80AFkcShrj8ve6w9N0hYXDkc8g6//oXgVaVP1dOiuf908UnHS4xggD0/Pw
 3YH36WSRYaHIgJsZ1LZKIWdiKLMhgKfGUIQiaZ+HY3GWGfNnWdBhiCrqatspFtkWh3Em
 nu3dPvDyQvujHy8opAcnlDNpf37CYEZKRywcH0S8eGd/sZ6/IZueOhgMN7X3Y4hEt3i/
 UdxlhVwn/HV/jItR92pOleUpPhSklwAjsOk3/r873yGM2Cy0lT1K90TRX6vi8GSE/FfN
 AIGg==
X-Gm-Message-State: AOAM533N6fsb/c31Yab/YvYroTQaOTzFoSwNjMSWeVW/47Luum+l+jvL
 FT331aXr0iDp5s30Aw7ABOiXXU+gUE8irxN9
X-Google-Smtp-Source: ABdhPJwm2rjoyjm6TMRBfO2QKrQJjfOLkOZLRtc0xaJkdgiYPyj8VkjIxfERkkTW62Gb3eqHbnyBNA==
X-Received: by 2002:a05:600c:35cc:: with SMTP id
 r12mr13240055wmq.158.1613380146980; 
 Mon, 15 Feb 2021 01:09:06 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:3627:e500:c425:5f5c?
 ([2a01:e0a:90c:e290:3627:e500:c425:5f5c])
 by smtp.gmail.com with ESMTPSA id f7sm22494626wre.78.2021.02.15.01.09.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 01:09:06 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
To: dri-devel@lists.freedesktop.org
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-2-mperttunen@nvidia.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6515c7dc-0a33-2403-a4c5-34a641bc1a14@baylibre.com>
Date: Mon, 15 Feb 2021 10:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213101512.3275069-2-mperttunen@nvidia.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2021 11:15, Mikko Perttunen wrote:
> Convert the original Host1x bindings to YAML and add new bindings for
> NVDEC, now in a more appropriate location. The old text bindings
> for Host1x and engines are still kept at display/tegra/ since they
> encompass a lot more engines that haven't been converted over yet.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> new file mode 100644
> index 000000000000..613c6601f0f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra20-host1x.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Host1x
> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^host1x@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra20-host1x
> +      - const: nvidia,tegra30-host1x
> +      - const: nvidia,tegra114-host1x
> +      - const: nvidia,tegra124-host1x
> +      - items:
> +          - const: nvidia,tegra132-host1x
> +          - const: nvidia,tegra124-host1x
> +      - const: nvidia,tegra210-host1x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Syncpoint threshold interrupt
> +      - description: General interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: syncpt
> +      - const: host1x
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: host1x
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: host1x
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +
> +additionalProperties:
> +  type: object
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        anyOf:
> +          - const: nvidia,tegra186-host1x
> +          - const: nvidia,tegra194-host1x
> +then:
> +  properties:
> +    reg:
> +      items:
> +        - description: Hypervisor-accessible register area
> +        - description: VM-accessible register area
> +    reg-names:
> +      items:
> +        - const: hypervisor
> +        - const: vm
> +  required:
> +    - reg-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    host1x@50000000 {
> +        compatible = "nvidia,tegra20-host1x";
> +        reg = <0x50000000 0x00024000>;
> +        interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
> +                      <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
> +        interrupt-names = "syncpt", "host1x";
> +        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
> +        clock-names = "host1x";
> +        resets = <&tegra_car 28>;
> +        reset-names = "host1x";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ranges = <0x54000000 0x54000000 0x04000000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..9a6334d930c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra VIC

-----------------------------------------------/\ Should be NVDEC ?

Neil

> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^nvdec@[0-9a-f]*$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra210-nvdec
> +      - nvidia,tegra186-nvdec
> +      - nvidia,tegra194-nvdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nvdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: DMA read memory client
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +      - const: write
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    nvdec@15480000 {
> +            compatible = "nvidia,tegra186-nvdec";
> +            reg = <0x15480000 0x40000>;
> +            clocks = <&bpmp TEGRA186_CLK_NVDEC>;
> +            clock-names = "nvdec";
> +            resets = <&bpmp TEGRA186_RESET_NVDEC>;
> +            reset-names = "nvdec";
> +
> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
> +            interconnect-names = "dma-mem", "write";
> +            iommus = <&smmu TEGRA186_SID_NVDEC>;
> +    };
> +
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8170b40d6236..b892419c6564 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5950,6 +5950,7 @@ L:	linux-tegra@vger.kernel.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/tegra/linux.git
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +F:	Documentation/devicetree/bindings/gpu/host1x/
>  F:	drivers/gpu/drm/tegra/
>  F:	drivers/gpu/host1x/
>  F:	include/linux/host1x.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
