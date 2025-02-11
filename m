Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027AA30BAB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 13:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027DA10E6A9;
	Tue, 11 Feb 2025 12:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A2tm53U6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A210E0BA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 12:24:35 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 427246DF;
 Tue, 11 Feb 2025 13:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739276597;
 bh=aGGqaZpPT+rSRVg/YC1WMx6qAqamenr0rL8vhcsCp9Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A2tm53U6uEztHjfcUA4HiRR4P2uUPvC4T2Zko9Msc4gE7wb2dcXiRraf8D5STe6jd
 qYiznSDMAGB5j2o85dWdGdMFHlTWTccFOGL3NLBIzSRM/p5vl5NmvbnMUaePKpH+dy
 vyISVN12AktnT6N9Z2RittVg0RJqUHkE5yWk24WE=
Message-ID: <16db8f3d-04a2-408a-964f-4cf9478229b4@ideasonboard.com>
Date: Tue, 11 Feb 2025 14:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>
References: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
 <20250209160925.380348-3-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250209160925.380348-3-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 09/02/2025 18:09, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The OLDI transmitters (TXes) do not have registers of their own, and are
> dependent on the source video-ports (VPs) from the DSS to provide
> configuration data. This hardware doesn't directly sit on the internal
> bus of the SoC, but does so via the DSS. Hence, the OLDI TXes are
> supposed to be child nodes under the DSS, and not independent devices.
> 
> Two of the OLDI TXes can function in tandem to output dual-link OLDI
> output, or cloned single-link outputs. In these cases, one OLDI will be
> the primary OLDI, and the other one, a companion. The following diagram
> represents such a configuration.
> 
> +-----+-----+         +-------+
> |     |     |         |       |
> |     | VP1 +----+--->+ OLDI0 |  (Primary - may need companion)
> |     |     |    |    |       |
> | DSS +-----+    |    +-------+
> |     |     |    |
> |     | VP2 |    |    +-------+
> |     |     |    |    |       |
> +-----+-----+    +--->+ OLDI1 |  (Companion OLDI)
>                        |       |
>                        +-------+
> 
> The DSS in AM625 SoC has a configuration like the one above. The AM625
> DSS VP1 (port@0) can connect and control 2 OLDI TXes, to use them in
> dual-link or cloned single-link OLDI modes. It is only the VP1 that can
> connect to either OLDI TXes for the AM625 DSS, and not the VP2.
> 
> Alternatively, on some future TI SoCs, along with the above
> configuration, the OLDI TX can _also_ connect to separate video sources,
> making them work entirely independent of each other. In this case,
> neither of the OLDIs are "companion" or "secondary" OLDIs, and nor do
> they require one. They both are independent and primary OLDIs. The
> following diagram represents such a configuration.
> 
> +-----+-----+               +-------+
> |     |     |               |       |
> |     | VP1 +--+----------->+ OLDI0 |  (Primary - may need companion)
> |     |     |  |            |       |
> |     +-----+  |            +-------+
> |     |     |  |
> |     | VP2 |  |
> |     |     |  |
> | DSS +-----+  |   +---+    +-------+
> |     |     |  +-->+ M |    |       |
> |     | VP3 +----->+ U +--->+ OLDI1 |  (Companion or Primary)
> |     |     |      | X |    |       |
> |     +-----+      +---+    +-------+
> |     |     |
> |     | VP4 |
> |     |     |
> +-----+-----+
> 
> Note that depending on the mux configuration, the OLDIs can either be
> working together in tandem - sourced by VP1, OR, they could be working
> independently sourced by VP1 and VP3 respectively.
> The idea is to support all the configurations with this OLDI TX schema.
> 
> The OLDI functionality is further supported by a system-control module,
> which contains a few registers to control OLDI IO power and other
> electrical characteristics of the IO lanes.
> 
> Add devicetree binding schema for the OLDI TXes to support various
> configurations, and extend their support to the AM625 DSS.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>   .../bindings/display/ti/ti,am625-oldi.yaml    |  88 ++++++++++
>   .../bindings/display/ti/ti,am65x-dss.yaml     | 154 ++++++++++++++++++
>   MAINTAINERS                                   |   1 +
>   3 files changed, 243 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> new file mode 100644
> index 000000000000..42a80a512660
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments AM625 OLDI Transmitter
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +  - Aradhya Bhatia <aradhya.bhatia@linux.dev>
> +
> +description:
> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
> +  pixel data transmission between host and flat panel display over LVDS (Low
> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
> +  padded and un-padded 18-bit RGB bus formats as input.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: serial clock input for the OLDI transmitters
> +
> +  clock-names:
> +    const: serial
> +
> +  ti,companion-oldi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to companion OLDI transmitter. This property is mandatory for the
> +      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
> +      mode or in clone mode. This property should point to the secondary OLDI
> +      TX.
> +
> +  ti,secondary-oldi:
> +    type: boolean
> +    description:
> +      Boolean property to mark the OLDI transmitter as the secondary one, when the
> +      OLDI hardware is expected to run as a companion HW, in cases of dual-lvds
> +      mode or clone mode. The primary OLDI hardware is responsible for all the
> +      hardware configuration.

I think these work, but I'm wondering if we would ever need to check 
something from the main oldi from the secondary oldi. In that case 
"crossed phandles" would be better, i.e. something like:

(in the first oldi:)
ti,slave-oldi = <phandle-to-second-oldi>

(in the second oldi:)
ti,master-oldi = <phandle-to-first-oldi>

Then again, if we ever need that, even with these bindings the driver 
could find the first oldi, but needs to go via the dss's node.

So, just a thought.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> +  ti,oldi-io-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
> +      control MMR region. These registers are required to toggle the I/O lane
> +      power, and control its electrical characteristics.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel RGB input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: LVDS output port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +allOf:
> +  - if:
> +      required:
> +        - ti,secondary-oldi
> +    then:
> +      properties:
> +        ti,companion-oldi: false
> +
> +required:
> +  - reg
> +  - clocks
> +  - clock-names
> +  - ti,oldi-io-ctrl
> +  - ports
> +
> +additionalProperties: false
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 399d68986326..a82c525631ea 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -91,6 +91,24 @@ properties:
>             For AM625 DSS, the internal DPI output port node from video
>             port 1.
>             For AM62A7 DSS, the port is tied off inside the SoC.
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description:
> +              For AM625 DSS, VP Connection to OLDI0.
> +              For AM65X DSS, OLDI output from the SoC.
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description:
> +              For AM625 DSS, VP Connection to OLDI1.
> +
> +        anyOf:
> +          - required:
> +              - endpoint
> +          - required:
> +              - endpoint@0
> +              - endpoint@1
>   
>         port@1:
>           $ref: /schemas/graph.yaml#/properties/port
> @@ -112,6 +130,25 @@ properties:
>         Input memory (from main memory to dispc) bandwidth limit in
>         bytes per second
>   
> +  oldi-transmitters:
> +    description:
> +      Child node under the DSS, to describe all the OLDI transmitters connected
> +      to the DSS videoports.
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      '^oldi@[0-1]$':
> +        $ref: ti,am625-oldi.yaml#
> +        description: OLDI transmitters connected to the DSS VPs
> +
>   allOf:
>     - if:
>         properties:
> @@ -120,10 +157,25 @@ allOf:
>               const: ti,am62a7-dss
>       then:
>         properties:
> +        oldi-transmitters: false
>           ports:
>             properties:
>               port@0: false
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am65x-dss
> +    then:
> +      properties:
> +        oldi-transmitters: false
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint@1: false
> +
>   required:
>     - compatible
>     - reg
> @@ -171,3 +223,105 @@ examples:
>               };
>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        dss1: dss@30200000 {
> +            compatible = "ti,am625-dss";
> +            reg = <0x00 0x30200000 0x00 0x1000>, /* common */
> +                  <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
> +                  <0x00 0x30206000 0x00 0x1000>, /* vid */
> +                  <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
> +                  <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
> +                  <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
> +                  <0x00 0x3020b000 0x00 0x1000>, /* vp2 */
> +                  <0x00 0x30201000 0x00 0x1000>; /* common1 */
> +            reg-names = "common", "vidl1", "vid",
> +                        "ovr1", "ovr2", "vp1", "vp2", "common1";
> +            power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
> +            clocks =        <&k3_clks 186 6>,
> +                            <&vp1_clock>,
> +                            <&k3_clks 186 2>;
> +            clock-names = "fck", "vp1", "vp2";
> +            interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +            oldi-transmitters {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                oldi0: oldi@0 {
> +                    reg = <0>;
> +                    clocks = <&k3_clks 186 0>;
> +                    clock-names = "serial";
> +                    ti,companion-oldi = <&oldi1>;
> +                    ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            oldi0_in: endpoint {
> +                                remote-endpoint = <&dpi0_out0>;
> +                            };
> +                        };
> +                        port@1 {
> +                            reg = <1>;
> +                            oldi0_out: endpoint {
> +                                remote-endpoint = <&panel_in0>;
> +                            };
> +                        };
> +                    };
> +                };
> +                oldi1: oldi@1 {
> +                    reg = <1>;
> +                    clocks = <&k3_clks 186 0>;
> +                    clock-names = "serial";
> +                    ti,secondary-oldi;
> +                    ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            oldi1_in: endpoint {
> +                                remote-endpoint = <&dpi0_out1>;
> +                            };
> +                        };
> +                        port@1 {
> +                            reg = <1>;
> +                            oldi1_out: endpoint {
> +                                remote-endpoint = <&panel_in1>;
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +                    dpi0_out0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&oldi0_in>;
> +                    };
> +                    dpi0_out1: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&oldi1_in>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    dpi1_out: endpoint {
> +                        remote-endpoint = <&hdmi_bridge>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fa7c5728f1e..88fa2d9435b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7816,6 +7816,7 @@ M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>   F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>   F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>   F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

