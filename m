Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6C477FAC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 22:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8F10E7ED;
	Thu, 16 Dec 2021 21:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEC810E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 21:59:34 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 7so830874oip.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/2SFJZkTm0jd4W3nufd4WDoqYmDsCrg8uI37ginbZxY=;
 b=YDnp8OtHdjQle899tijhg+YD4QAqofYZGnj4BtpB/ITBr8XBUHb7nNOdixEcFrd5Ki
 Z/9DO/rNIxHnjGc8rOE0YNop2uRi/0eTDEc1+Oome7Lw4muKa1m2/5IS26xJ5ZOGkGln
 DiBYK229C2iXa1duS2VHQsxKUsorzp8OmW5kZdGuqhhCml/8slvv4QjVOSiULoUbvBi4
 n8cw5AEjx5guJRdzWk/jJ7HRbtA2T18dkd4qKg65H62Z9Wc7ck0j1fXKRHJD1WHa+rja
 kZIa9D2DIjqPsCLjV6MNlYMmmWiUdG16QLiGZUD9w31bEEtkBldz0lhrm26IwIMaIf2T
 Vr2w==
X-Gm-Message-State: AOAM531pWwVl+xH5xhCH+dGfH6lZvpnLiaY1chcvk2i68NNi9JKi3NWD
 l2Bo863/yOs07fVEwZEaeRt9TPP7kw==
X-Google-Smtp-Source: ABdhPJygoTkHEHf+sgw9HEdDG6ZWZfQAlLICUlsq+NxuLHfc152GQ8ebLLITcnqnYBUTBOb4V8wdvg==
X-Received: by 2002:a05:6808:bc3:: with SMTP id
 o3mr5656564oik.151.1639691973308; 
 Thu, 16 Dec 2021 13:59:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i16sm1220414oig.15.2021.12.16.13.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:59:32 -0800 (PST)
Received: (nullmailer pid 843614 invoked by uid 1000);
 Thu, 16 Dec 2021 21:59:31 -0000
Date: Thu, 16 Dec 2021 15:59:31 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: tegra: Convert to json-schema
Message-ID: <Ybu2wy2mwNmke/od@robh.at.kernel.org>
References: <20211216142012.1479213-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216142012.1479213-1-thierry.reding@gmail.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 03:20:12PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
> 
> This also adds the missing display-hub DT bindings that were not
> previously documented.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Sorry Rob for making you look at this again. However, I think it's much
> cleaner than earlier versions of this because of the split into separate
> YAML files, so hopefully it's not too bad. I've got a couple of DT fixes
> in the Tegra tree that will allow this to successfully validate all of
> these host1x and child nodes.

Mostly looks good. A few things below.

> 
> Note that some of these can possibly be moved into a different directory
> now since they aren't all that display-related, but I'll do that in a
> separate patch to keep this simpler to review.
> 
> Changes in v3:
> - split into separate YAML files for simplicity
> - add display-hub DT bindings
> 
> Changes in v2:
> - use additionalProperties instead of unevaluatedProperties where
>   sufficient
> - drop redundant $ref and add missing maxItems properties
> - drop documentation for standard properties
> - remove status properties from example
> - drop spurious comments
> 
>  .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
>  .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 +++
>  .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 +++++
>  .../display/tegra/nvidia,tegra124-sor.yaml    | 209 ++++++
>  .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
>  .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
>  .../tegra/nvidia,tegra186-display.yaml        | 310 +++++++++
>  .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  46 ++
>  .../display/tegra/nvidia,tegra20-dc.yaml      | 174 +++++
>  .../display/tegra/nvidia,tegra20-dsi.yaml     | 174 +++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     |  57 ++
>  .../display/tegra/nvidia,tegra20-gr2d.yaml    |  58 ++
>  .../display/tegra/nvidia,tegra20-gr3d.yaml    | 109 +++
>  .../display/tegra/nvidia,tegra20-hdmi.yaml    | 116 ++++
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 622 ------------------
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 334 ++++++++++
>  .../display/tegra/nvidia,tegra20-isp.yaml     |  55 ++
>  .../display/tegra/nvidia,tegra20-mpe.yaml     |  58 ++
>  .../display/tegra/nvidia,tegra20-tvo.yaml     |  51 ++
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 151 +++++
>  .../display/tegra/nvidia,tegra210-csi.yaml    |  52 ++
>  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt  |  59 --
>  22 files changed, 2333 insertions(+), 722 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

[...]

> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> new file mode 100644
> index 000000000000..afc283796653
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-sor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra SOR Output Encoder
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The Serial Output Resource (SOR) can be used to drive HDMI, LVDS, eDP
> +  and DP outputs.
> +
> +  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information

Now removed...

> +  regarding the DPAUX pad controller bindings.
> +
> +properties:
> +  $nodename:
> +    pattern: "^sor@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra124-sor
> +          - nvidia,tegra210-sor
> +          - nvidia,tegra210-sor1
> +          - nvidia,tegra186-sor
> +          - nvidia,tegra186-sor1
> +          - nvidia,tegra194-sor
> +
> +      - items:
> +          - const: nvidia,tegra132-sor
> +          - const: nvidia,tegra124-sor
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 5
> +    maxItems: 6
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: sor
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  avdd-io-hdmi-dp-supply:
> +    description: I/O supply for HDMI/DP
> +
> +  vdd-hdmi-dp-pll-supply:
> +    description: PLL supply for HDMI/DP
> +
> +  hdmi-supply:
> +    description: +5.0V HDMI connector supply
> +
> +  # Tegra186 and later
> +  nvidia,interface:
> +    description: index of the SOR interface
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +
> +  nvidia,ddc-i2c-bus:
> +    description: phandle of an I2C controller used for DDC EDID
> +      probing
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  nvidia,hpd-gpio:
> +    description: specifies a GPIO used for hotplug detection
> +    maxItems: 1
> +
> +  nvidia,edid:
> +    description: supplies a binary EDID blob
> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +
> +  nvidia,panel:
> +    description: phandle of a display panel
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  nvidia,xbar-cfg:
> +    description: 5 cells containing the crossbar configuration.
> +      Each lane of the SOR, identified by the cell's index, is
> +      mapped via the crossbar to the pad specified by the cell's
> +      value.
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +
> +  # optional when driving an eDP output
> +  nvidia,dpaux:
> +    description: phandle to a DispayPort AUX interface
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra186-sor
> +              - nvidia,tegra194-sor
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock input for the SOR hardware
> +            - description: SOR output clock
> +            - description: input for the pixel clock
> +            - description: reference clock for the SOR clock
> +            - description: safe reference clock for the SOR clock
> +                during power up
> +            - description: SOR pad output clock
> +
> +        clock-names:
> +          items:
> +            - const: sor
> +            - enum:
> +                - source # deprecated
> +                - out
> +            - const: parent
> +            - const: dp
> +            - const: safe
> +            - const: pad
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock input for the SOR hardware
> +            - description: SOR output clock
> +            - description: input for the pixel clock
> +            - description: reference clock for the SOR clock
> +            - description: safe reference clock for the SOR clock
> +                during power up
> +
> +        clock-names:
> +          items:
> +            - const: sor
> +            - enum:
> +                - source # deprecated
> +                - out
> +            - const: parent
> +            - const: dp
> +            - const: safe
> +
> +  - if:
> +      not:
> +        properties:
> +          contains:
> +            const: nvidia,panel
> +    then:
> +      required:
> +        - hdmi-supply
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - avdd-io-hdmi-dp-supply
> +  - vdd-hdmi-dp-pll-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    sor0: sor@54540000 {
> +        compatible = "nvidia,tegra210-sor";
> +        reg = <0x54540000 0x00040000>;
> +        interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA210_CLK_SOR0>,
> +                 <&tegra_car TEGRA210_CLK_SOR0_OUT>,
> +                 <&tegra_car TEGRA210_CLK_PLL_D_OUT0>,
> +                 <&tegra_car TEGRA210_CLK_PLL_DP>,
> +                 <&tegra_car TEGRA210_CLK_SOR_SAFE>;
> +        clock-names = "sor", "out", "parent", "dp", "safe";
> +        resets = <&tegra_car 182>;
> +        reset-names = "sor";
> +        pinctrl-0 = <&state_dpaux_aux>;
> +        pinctrl-1 = <&state_dpaux_i2c>;
> +        pinctrl-2 = <&state_dpaux_off>;
> +        pinctrl-names = "aux", "i2c", "off";
> +        power-domains = <&pd_sor>;
> +
> +        avdd-io-hdmi-dp-supply = <&avdd_1v05>;
> +        vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
> +        hdmi-supply = <&vdd_hdmi>;
> +
> +        nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +        nvidia,hpd-gpio = <&gpio TEGRA_GPIO(CC, 1) GPIO_ACTIVE_LOW>;
> +    };
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> new file mode 100644
> index 000000000000..37bb5ddc1963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Video Image Composer
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^vic@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra124-vic
> +          - nvidia,tegra210-vic
> +          - nvidia,tegra186-vic
> +          - nvidia,tegra194-vic
> +
> +      - items:
> +          - const: nvidia,tegra132-vic
> +          - const: nvidia,tegra124-vic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock input for the VIC hardware
> +
> +  clock-names:
> +    items:
> +      - const: vic
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: vic
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    description: Description of the interconnect paths for the VIC;
> +      see ../interconnect/interconnect.txt for details.
> +    items:
> +      - description: memory read client for VIC
> +      - description: memory write client for VIC
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  dma-coherent: true
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> new file mode 100644
> index 000000000000..265a60d79d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 (and later) Display Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^display@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra186-dc
> +      - nvidia,tegra194-dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: display controller pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: dc
> +
> +  resets:
> +    items:
> +      - description: display controller reset
> +
> +  reset-names:
> +    items:
> +      - const: dc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    description: Description of the interconnect paths for the
> +      display controller; see ../interconnect/interconnect.txt
> +      for details.
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read-0
> +      - const: read-1
> +
> +  nvidia,outputs:
> +    description: A list of phandles of outputs that this display
> +      controller can drive.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  nvidia,head:
> +    description: The number of the display controller head. This
> +      is used to setup the various types of output to receive
> +      video data from the given head.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - nvidia,outputs
> +  - nvidia,head
> +
> +# see nvidia,tegra186-display.yaml for examples
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> new file mode 100644
> index 000000000000..8c0231345529
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> @@ -0,0 +1,310 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-display.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 (and later) Display Hub
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^display-hub@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra186-display
> +      - nvidia,tegra194-display
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
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
> +  resets:
> +    items:
> +      - description: display hub reset
> +      - description: window group 0 reset
> +      - description: window group 1 reset
> +      - description: window group 2 reset
> +      - description: window group 3 reset
> +      - description: window group 4 reset
> +      - description: window group 5 reset
> +
> +  reset-names:
> +    items:
> +      - const: misc
> +      - const: wgrp0
> +      - const: wgrp1
> +      - const: wgrp2
> +      - const: wgrp3
> +      - const: wgrp4
> +      - const: wgrp5
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ranges:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^display@[0-9a-f]+$":
> +    type: object
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra186-display
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: display core clock
> +            - description: display stream compression clock
> +            - description: display hub clock
> +
> +        clock-names:
> +          items:
> +            - const: disp
> +            - const: dsc
> +            - const: hub
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: display core clock
> +            - description: display hub clock
> +
> +        clock-names:
> +          items:
> +            - const: disp
> +            - const: hub
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    display-hub@15200000 {
> +        compatible = "nvidia,tegra186-display";
> +        reg = <0x15200000 0x00040000>;
> +        resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP1>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP2>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP3>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP4>,
> +                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP5>;
> +        reset-names = "misc", "wgrp0", "wgrp1", "wgrp2",
> +                      "wgrp3", "wgrp4", "wgrp5";
> +        clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_DISP>,
> +                 <&bpmp TEGRA186_CLK_NVDISPLAY_DSC>,
> +                 <&bpmp TEGRA186_CLK_NVDISPLAYHUB>;
> +        clock-names = "disp", "dsc", "hub";
> +        status = "disabled";
> +
> +        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ranges = <0x15200000 0x15200000 0x40000>;
> +
> +        display@15200000 {
> +            compatible = "nvidia,tegra186-dc";
> +            reg = <0x15200000 0x10000>;
> +            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P0>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD0>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
> +
> +            nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
> +            nvidia,head = <0>;
> +        };
> +
> +        display@15210000 {
> +            compatible = "nvidia,tegra186-dc";
> +            reg = <0x15210000 0x10000>;
> +            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P1>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD1>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPB>;
> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
> +
> +            nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
> +            nvidia,head = <1>;
> +        };
> +
> +        display@15220000 {
> +            compatible = "nvidia,tegra186-dc";
> +            reg = <0x15220000 0x10000>;
> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P2>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD2>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPC>;
> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
> +
> +            nvidia,outputs = <&sor0 &sor1>;
> +            nvidia,head = <2>;
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra194-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra194-mc.h>
> +    #include <dt-bindings/power/tegra194-powergate.h>
> +    #include <dt-bindings/reset/tegra194-reset.h>
> +
> +    display-hub@15200000 {
> +        compatible = "nvidia,tegra194-display";
> +        reg = <0x15200000 0x00040000>;
> +        resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP1>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP2>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP3>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP4>,
> +                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP5>;
> +        reset-names = "misc", "wgrp0", "wgrp1", "wgrp2",
> +                      "wgrp3", "wgrp4", "wgrp5";
> +        clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
> +                 <&bpmp TEGRA194_CLK_NVDISPLAYHUB>;
> +        clock-names = "disp", "hub";
> +        status = "disabled";
> +
> +        power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ranges = <0x15200000 0x15200000 0x40000>;
> +
> +        display@15200000 {
> +            compatible = "nvidia,tegra194-dc";
> +            reg = <0x15200000 0x10000>;
> +            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD0>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +
> +            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> +            nvidia,head = <0>;
> +        };
> +
> +        display@15210000 {
> +            compatible = "nvidia,tegra194-dc";
> +            reg = <0x15210000 0x10000>;
> +            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P1>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD1>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +
> +            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> +            nvidia,head = <1>;
> +        };
> +
> +        display@15220000 {
> +            compatible = "nvidia,tegra194-dc";
> +            reg = <0x15220000 0x10000>;
> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P2>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD2>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +
> +            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> +            nvidia,head = <2>;
> +        };
> +
> +        display@15230000 {
> +            compatible = "nvidia,tegra194-dc";
> +            reg = <0x15230000 0x10000>;
> +            interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P3>;
> +            clock-names = "dc";
> +            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD3>;
> +            reset-names = "dc";
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
> +            interconnect-names = "dma-mem", "read-1";
> +
> +            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> +            nvidia,head = <3>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> new file mode 100644
> index 000000000000..4a12710e2a2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-dsi-padctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra MIPI DSI pad controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^padctl@[0-9a-f]+$"
> +
> +  compatible:
> +    const: nvidia,tegra186-dsi-padctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: dsi
> +
> +allOf:
> +  - $ref: "/schemas/reset/reset.yaml"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    padctl@15880000 {
> +        compatible = "nvidia,tegra186-dsi-padctl";
> +        reg = <0x15880000 0x10000>;
> +        resets = <&bpmp TEGRA186_RESET_DSI>;
> +        reset-names = "dsi";
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> new file mode 100644
> index 000000000000..eeffb8d7c597
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Display Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^dc@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra20-dc
> +          - nvidia,tegra30-dc
> +          - nvidia,tegra114-dc
> +          - nvidia,tegra124-dc
> +          - nvidia,tegra210-dc
> +
> +      - items:
> +          - const: nvidia,tegra124-dc
> +          - const: nvidia,tegra132-dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: display controller pixel clock
> +      - description: parent clock # optional
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: dc
> +      - const: parent # optional
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: dc
> +
> +  interconnect-names: true
> +  interconnects: true
> +
> +  iommus:
> +    maxItems: 1
> +
> +  nvidia,head:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of the display controller head. This is used to setup the various
> +      types of output to receive video data from the given head.
> +
> +  nvidia,outputs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: A list of phandles of outputs that this display controller can drive.
> +
> +  rgb:
> +    type: object
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-dc
> +              - nvidia,tegra30-dc
> +              - nvidia,tegra114-dc
> +    then:
> +      properties:
> +        interconnects:
> +          items:
> +            - description: window A memory client
> +            - description: window B memory client
> +            - description: window B memory client (vertical filter)
> +            - description: window C memory client
> +            - description: cursor memory client
> +
> +        interconnect-names:
> +          items:
> +            - const: wina
> +            - const: winb
> +            - const: winb-vfilter
> +            - const: winc
> +            - const: cursor
> +
> +        rgb:
> +          description: Each display controller node has a child node, named "rgb", that represents
> +            the RGB output associated with the controller.
> +          type: object
> +          properties:
> +            nvidia,ddc-i2c-bus:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of an I2C controller used for DDC EDID probing
> +
> +            nvidia,hpd-gpio:
> +              description: specifies a GPIO used for hotplug detection
> +              maxItems: 1
> +
> +            nvidia,edid:
> +              $ref: /schemas/types.yaml#/definitions/uint8-array
> +              description: supplies a binary EDID blob
> +
> +            nvidia,panel:
> +              $ref: /schemas/types.yaml#/definitions/phandle
> +              description: phandle of a display panel
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra124-dc
> +    then:
> +      properties:
> +        interconnects:
> +          minItems: 4
> +          items:
> +            - description: window A memory client
> +            - description: window B memory client
> +            - description: window C memory client
> +            - description: cursor memory client
> +            - description: window D memory client
> +            - description: window T memory client
> +
> +        interconnect-names:
> +          minItems: 4
> +          items:
> +            - const: wina
> +            - const: winb
> +            - const: winc
> +            - const: cursor
> +            - const: wind
> +            - const: wint
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dc@54200000 {
> +        compatible = "nvidia,tegra20-dc";
> +        reg = <0x54200000 0x00040000>;
> +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA20_CLK_DISP1>;
> +        clock-names = "dc";
> +        resets = <&tegra_car 27>;
> +        reset-names = "dc";
> +    };
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> new file mode 100644
> index 000000000000..abab8783db1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Display Serial Interface
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +

Reference dsi-controller.yaml

> +properties:
> +  $nodename:
> +    pattern: "^dsi@[0-9a-f]+$"

and drop this.

> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra20-dsi
> +          - nvidia,tegra30-dsi
> +          - nvidia,tegra114-dsi
> +          - nvidia,tegra124-dsi
> +          - nvidia,tegra210-dsi
> +          - nvidia,tegra186-dsi
> +
> +      - items:
> +          - const: nvidia,tegra132-dsi
> +          - const: nvidia,tegra124-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
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
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: dsi
> +
> +  power-domains:
> +    maxItems: 1
> +

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

and these.

> +
> +  avdd-dsi-csi-supply:
> +    description: phandle of a supply that powers the DSI controller
> +
> +  nvidia,mipi-calibrate:
> +    description: Should contain a phandle and a specifier specifying
> +      which pads are used by this DSI output and need to be
> +      calibrated. See nvidia,tegra114-mipi.yaml for details.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  nvidia,ddc-i2c-bus:
> +    description: phandle of an I2C controller used for DDC EDID
> +      probing
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  nvidia,hpd-gpio:
> +    description: specifies a GPIO used for hotplug detection
> +    maxItems: 1
> +
> +  nvidia,edid:
> +    description: supplies a binary EDID blob
> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +
> +  nvidia,panel:
> +    description: phandle of a display panel
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  nvidia,ganged-mode:
> +    description: contains a phandle to a second DSI controller to
> +      gang up with in order to support up to 8 data lanes
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +

> +patternProperties:
> +  "^panel@[0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg

and this.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-dsi
> +              - nvidia,tegra30-dsi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: DSI module clock
> +            - description: input for the pixel clock
> +
> +        clock-names:
> +          items:
> +            - const: dsi
> +            - const: parent
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: DSI module clock
> +            - description: low-power module clock
> +            - description: input for the pixel clock
> +
> +        clock-names:
> +          items:
> +            - const: dsi
> +            - const: lp
> +            - const: parent
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra186-dsi
> +    then:
> +      required:
> +        - interrupts
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    dsi@15300000 {
> +        compatible = "nvidia,tegra186-dsi";
> +        reg = <0x15300000 0x10000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&bpmp TEGRA186_CLK_DSI>,
> +                 <&bpmp TEGRA186_CLK_DSIA_LP>,
> +                 <&bpmp TEGRA186_CLK_PLLD>;
> +        clock-names = "dsi", "lp", "parent";
> +        resets = <&bpmp TEGRA186_RESET_DSI>;
> +        reset-names = "dsi";
> +
> +        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
> +    };
