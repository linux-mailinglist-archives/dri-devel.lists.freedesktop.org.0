Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E47FCD4B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 04:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1310E09A;
	Wed, 29 Nov 2023 03:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FF9310E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 03:13:33 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 54B7D24E29D;
 Wed, 29 Nov 2023 11:13:28 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 11:13:28 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 11:13:27 +0800
Message-ID: <20502c84-c3af-4a60-9f5f-d8cc05743866@starfivetech.com>
Date: Wed, 29 Nov 2023 11:13:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: display: Add yamls for JH7110 display
 system
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-2-keith.zhao@starfivetech.com>
 <cb7395a9-71e8-415e-90d5-866a2aeadf28@linaro.org>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <cb7395a9-71e8-415e-90d5-866a2aeadf28@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang
 Chen <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/10/25 20:50, Krzysztof Kozlowski wrote:
> On 25/10/2023 12:39, Keith Zhao wrote:
>> StarFive SoCs JH7110 display system:
> 
> A nit, subject: drop second/last, redundant "yamls for". The
> "dt-bindings" prefix is already stating that these are bindings, so
> format is fixed.
> 
>> lcd-controller bases verisilicon dc8200 IP,
>> and hdmi bases Innosilicon IP. Add bindings for them.
> 
> Please make it a proper sentences, with proper wrapping.
> 
>> 
>> also update MAINTAINERS for dt-bindings
> 
> Not a sentence, but also not really needed.ok I see.
> 
>> 
>> about this patch, I tested the dtbs_check and dt_binding_check
>> with the result pass.
>> Based on the feedback of the previous version, the corresponding arrangement is made
> 
> Not relevant, so not really suitable for commit msg.
> 
>> 
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>>  .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
>>  .../starfive/starfive,jh7110-dc8200.yaml      | 109 ++++++++++++++++++
>>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  85 ++++++++++++++
>>  MAINTAINERS                                   |   7 ++
>>  4 files changed, 242 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>> new file mode 100644
>> index 000000000..f45b97b08
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Starfive DRM master device
> 
> What is DRM in hardware? I know Digital Rights Management, but then
> subsystem seems wrong. If you mean Linux DRM, then Linux is not a
> hardware, so drop all Linuxisms and describe hardware.
ok , will only keep hardware describe in my next version
> 
> 
>> +
>> +maintainers:
>> +  - Keith Zhao <keith.zhao@starfivetech.com>
>> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
>> +
>> +description:
>> +  The Starfive DRM master device is a virtual device needed to list all
> 
> Virtual device? Then not suitable for bindings, sorry.
> 
>> +  display controller or other display interface nodes that comprise the
>> +  graphics subsystem.
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,display-subsystem
>> +
>> +  ports:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> No, ports is not phandle-array. ports is object, always.
> 
>> +    description:
>> +      Should contain a list of phandles pointing to display interface ports
>> +      of display controller devices. Display controller definitions as defined
>> +      in Documentation/devicetree/bindings/display/starfive/
>> +      starfive,jh7110-dc8200.yaml
> 
> Use standard graph ports, not some own, custom property.
> 
> Anyway, entire binding should be dropped. You do not need it even.
Hi Krzysztof:
Virtual device is not suitable for bindings, matbe I need associate it with the real hardware.
such as the top clocks & reset , irq , etc.
Currently I configure them in another yaml file. Logically speaking, this is more suitable.

Can adding the corresponding hardware description change its fate of being deleted?
 
> 
>> +
>> +required:
>> +  - compatible
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    display-subsystem {
>> +        compatible = "starfive,display-subsystem";
>> +        ports = <&dc_out>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>> new file mode 100644
>> index 000000000..87051cddf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc8200.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive display controller
>> +
>> +description:
>> +  The StarFive SoC uses the display controller based on Verisilicon IP
>> +  to transfer the image data from a video memory buffer to an external
>> +  LCD interface.
>> +
>> +maintainers:
>> +  - Keith Zhao <keith.zhao@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-dc8200
>> +
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description:
>> +          host interface
> 
> In one line.
>  - description: host interface
> 
>> +      - description:
>> +          display physical base address and length.
> 
> Drop redundant parts: base address and length. Everything in reg for
> MMIO would have it...
> 
>> +
>> +  interrupts:
>> +    items:
>> +      - description: The interrupt will be generated when DC finish one frame
>> +
>> +  clocks:
>> +    items:
>> +      - description: Clock for display system noc bus.
>> +      - description: Pixel clock for display channel 0.
>> +      - description: Pixel clock for display channel 1.
>> +      - description: Core clock for display controller.
>> +      - description: Clock for axi bus to access ddr.
>> +      - description: Clock for ahb bus to R/W the phy regs.
>> +      - description: External HDMI pixel clock.
>> +      - description: Parent clock for pixel clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: noc_bus
>> +      - const: channel0
>> +      - const: channel1
>> +      - const: dc_core
>> +      - const: axi_core
>> +      - const: ahb
>> +      - const: hdmi_tx
>> +      - const: dc_parent
>> +
>> +  resets:
>> +    items:
>> +      - description: Reset for axi bus.
>> +      - description: Reset for ahb bus.
>> +      - description: Core reset of display controller.
>> +
>> +  reset-names:
>> +    items:
>> +      - const: axi
>> +      - const: ahb
>> +      - const: core
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    dc8200: lcd-controller@29400000 {
>> +        compatible = "starfive,jh7110-dc8200";
>> +        reg = <0x29400000 0x100>, <0x29400800 0x2000>;
>> +        interrupts = <95>;
>> +        clocks = <&syscrg 60>,
>> +               <&voutcrg 7>,
>> +               <&voutcrg 8>,
>> +               <&voutcrg 4>,
>> +               <&voutcrg 5>,
>> +               <&voutcrg 6>,
>> +               <&hdmitx0_pixelclk>,
>> +               <&voutcrg 1>;
>> +        clock-names = "noc_bus", "channel0", "channel1",
>> +                      "dc_core", "axi_core", "ahb",
>> +                      "hdmi_tx","dc_parent";
>> +        resets = <&voutcrg 0>, <&voutcrg 1>, <&voutcrg 2>;
>> +        reset-names = "axi", "ahb", "core";
>> +        dc_out: port {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            dc_out_hdmi: endpoint@0 {
>> +                reg = <0>;
>> +                remote-endpoint = <&hdmi_in_dc>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>> new file mode 100644
>> index 000000000..f6c473a10
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>> @@ -0,0 +1,85 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno-hdmi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Starfive JH7110 HDMI controller
>> +
>> +description:
>> +  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innosilicon IP
>> +  to generate HDMI signal from its input and transmit the signal to the screen.
>> +
>> +maintainers:
>> +  - Keith Zhao <keith.zhao@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: "starfive,jh7110-inno-hdmi"
> 
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
> 
> Best regards,
> Krzysztof
> 
