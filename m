Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8AB31E8E3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 12:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A81D6E1BB;
	Thu, 18 Feb 2021 11:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DAB6E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNJytNC3hkNQxzVs1irPHyUYbC2MmMNs9JNbcAzrEgc=; b=PFhvogSz2f4HwmeugR3b/cq7VZ
 SwR7SnTjo2wwZYJN26kiKVBj9FUYcwVRp7EyOkJx6rpR2wZZ/aeD67arYTq2/od/USEUL/3OOt0tm
 iWRGIAyyjrv0vTtgD75mkf01oDR4XErJHAHPWwR9Dv1BFCtKFePzegBzoceQyuZ3iiooNh8G31hD4
 sPp18ssx79DQMoCWFWD5DkmcGGh5WwcehT5xQyG8GzmAEb9HZu71yRuN3ZCIs2DwcychOCgMDU4aE
 YNaQUdvgwVXOPjhxVJdCIWMpdbfJS4mZ+9q59EiGaEmmyCXxnbHysckPjhGMNtXBlHG7eb94s+M57
 5Iaa6H1Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lCh6K-0008Hu-Fs; Thu, 18 Feb 2021 13:04:04 +0200
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
To: Rob Herring <robh@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-2-mperttunen@nvidia.com>
 <20210217214935.GA2804400@robh.at.kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <9f0152cc-ca9a-5b45-df5d-e61a79c87ea4@kapsi.fi>
Date: Thu, 18 Feb 2021 13:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210217214935.GA2804400@robh.at.kernel.org>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/21 11:49 PM, Rob Herring wrote:
> On Sat, Feb 13, 2021 at 12:15:10PM +0200, Mikko Perttunen wrote:
>> Convert the original Host1x bindings to YAML and add new bindings for
>> NVDEC, now in a more appropriate location. The old text bindings
>> for Host1x and engines are still kept at display/tegra/ since they
>> encompass a lot more engines that haven't been converted over yet.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
>>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   3 files changed, 220 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>> new file mode 100644
>> index 000000000000..613c6601f0f1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>> @@ -0,0 +1,129 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra20-host1x.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Host1x
>> +
>> +maintainers:
>> +  - Thierry Reding <treding@gmail.com>
>> +  - Mikko Perttunen <mperttunen@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^host1x@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - const: nvidia,tegra20-host1x
>> +      - const: nvidia,tegra30-host1x
>> +      - const: nvidia,tegra114-host1x
>> +      - const: nvidia,tegra124-host1x
>> +      - items:
>> +          - const: nvidia,tegra132-host1x
>> +          - const: nvidia,tegra124-host1x
>> +      - const: nvidia,tegra210-host1x
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Syncpoint threshold interrupt
>> +      - description: General interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: syncpt
>> +      - const: host1x
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: host1x
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: host1x
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +  - ranges
>> +
>> +additionalProperties:
>> +  type: object
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        anyOf:
>> +          - const: nvidia,tegra186-host1x
>> +          - const: nvidia,tegra194-host1x
> 
> Just use 'enum' instead of 'anyOf' and 'const'.

Yep, will fix.

> 
>> +then:
>> +  properties:
>> +    reg:
>> +      items:
>> +        - description: Hypervisor-accessible register area
>> +        - description: VM-accessible register area
> 
> If you test this, it will fail due to the 'maxItems: 1' above. The main
> section has to pass for all conditions and then if/them schema add
> constraints.

Interesting, I did run the schema check and DTB check but I didn't see 
issues there. In any case, will fix.

> 
>> +    reg-names:
>> +      items:
>> +        - const: hypervisor
>> +        - const: vm
>> +  required:
>> +    - reg-names
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/tegra20-car.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    host1x@50000000 {
>> +        compatible = "nvidia,tegra20-host1x";
>> +        reg = <0x50000000 0x00024000>;
>> +        interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
>> +                      <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
>> +        interrupt-names = "syncpt", "host1x";
>> +        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
>> +        clock-names = "host1x";
>> +        resets = <&tegra_car 28>;
>> +        reset-names = "host1x";
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        ranges = <0x54000000 0x54000000 0x04000000>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> new file mode 100644
>> index 000000000000..9a6334d930c8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Tegra VIC
> 
> I'm left wondering what NVDEC and VIC are?

Accidentally left VIC here. Will fix and add some more description.

FWIW, VIC is Video Image Compositor, and NVDEC is the HW video decoder 
on Tegra systems.

Thanks for reviewing!

Mikko

> 
>> +
>> +maintainers:
>> +  - Thierry Reding <treding@gmail.com>
>> +  - Mikko Perttunen <mperttunen@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^nvdec@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra210-nvdec
>> +      - nvidia,tegra186-nvdec
>> +      - nvidia,tegra194-nvdec
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    items:
>> +      - description: DMA read memory client
>> +      - description: DMA write memory client
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +      - const: write
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/tegra186-clock.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/memory/tegra186-mc.h>
>> +    #include <dt-bindings/power/tegra186-powergate.h>
>> +    #include <dt-bindings/reset/tegra186-reset.h>
>> +
>> +    nvdec@15480000 {
>> +            compatible = "nvidia,tegra186-nvdec";
>> +            reg = <0x15480000 0x40000>;
>> +            clocks = <&bpmp TEGRA186_CLK_NVDEC>;
>> +            clock-names = "nvdec";
>> +            resets = <&bpmp TEGRA186_RESET_NVDEC>;
>> +            reset-names = "nvdec";
>> +
>> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
>> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
>> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
>> +            interconnect-names = "dma-mem", "write";
>> +            iommus = <&smmu TEGRA186_SID_NVDEC>;
>> +    };
>> +
>> +
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8170b40d6236..b892419c6564 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5950,6 +5950,7 @@ L:	linux-tegra@vger.kernel.org
>>   S:	Supported
>>   T:	git git://anongit.freedesktop.org/tegra/linux.git
>>   F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +F:	Documentation/devicetree/bindings/gpu/host1x/
>>   F:	drivers/gpu/drm/tegra/
>>   F:	drivers/gpu/host1x/
>>   F:	include/linux/host1x.h
>> -- 
>> 2.30.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
