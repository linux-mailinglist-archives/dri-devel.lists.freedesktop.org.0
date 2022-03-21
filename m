Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E54E3406
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53F710E4CE;
	Mon, 21 Mar 2022 23:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9A10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 23:20:48 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so11498514oti.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=10C1VoEdFPxq2EX61iLyVklfX08g8qkm8o81dxA7EZI=;
 b=D153eYdc+I5+SUsqs48xobFn6pQuwuBr5EV/eKuWElkLX3f/aZo42eViG0y0PLtTUL
 ZPJbYLC0YAl4UtOpgAlyqD9SusQzQefOdffODNjmddtnqWSWIgTCfHLq1xmT0Jzf2ggr
 4dymChaqqutola1wtJ185CgZOpmN27CZq6IQqEXym3VP1/4elTXAEAklXN+b0+8/EHKx
 cp4SLv30dMD1Uul29TqXOVsvZJWaUV4kjKExMkR8uikR+OZ2DtxqtyIjm+xjBhYo4/gg
 X8r12mp1C/+I5SqlnZaTyeBB5bPBDXka+62B/ylW45IsJj4++BkLU8x66WuzBxannB7P
 4OQQ==
X-Gm-Message-State: AOAM532FMgnHTVJ8NCz0OttAMwPxIx1FkPzCLpQeVpZ/vQDOjzjjyWz3
 uLI1sm1vfkyVuT25IZnDtA==
X-Google-Smtp-Source: ABdhPJxzz5DSRkbZsGFiXN+bbpOWqDuNZ9kYHDYWLcSm6D7NbFtZjLzupS5Q2gw7TLtQHsyQXag7nQ==
X-Received: by 2002:a9d:7dd8:0:b0:5b2:29e1:d46a with SMTP id
 k24-20020a9d7dd8000000b005b229e1d46amr8638687otn.106.1647904847839; 
 Mon, 21 Mar 2022 16:20:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05680801ce00b002d97bda386fsm8001690oic.52.2022.03.21.16.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:20:46 -0700 (PDT)
Received: (nullmailer pid 732787 invoked by uid 1000);
 Mon, 21 Mar 2022 23:20:45 -0000
Date: Mon, 21 Mar 2022 18:20:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Message-ID: <YjkITWpbnCmhKaX+@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321162916.1116541-6-15330273260@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
> 

Needs a commit message.

> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>

Same person? Don't need both emails.

> ---
>  .../loongson/loongson,display-controller.yaml | 230 ++++++++++++++++++
>  1 file changed, 230 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> new file mode 100644
> index 000000000000..7be63346289e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> @@ -0,0 +1,230 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
> +
> +maintainers:
> +  - Sui Jingfeng <suijingfeng@loongson.cn>
> +
> +description: |+
> +
> +  Loongson display controllers are simple which require scanout buffers
> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
> +  with a dedicated video RAM which is 64MB or more, precise size can be
> +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
> +  chip.
> +
> +  LSDC has two display pipes, each way has a DVO interface which provide
> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
> +
> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
> +  located at the DC register space. They are used to emulate two way i2c,
> +  One for DVO0, another for DVO1.
> +
> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
> +
> +  LSDC's display pipeline have several components as below description,
> +
> +  The display controller in LS7A1000:
> +     ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^             ^            |_________|
> +    | | | | |    -------|        |             |
> +    | |_| |_|    | i2c0 <--------+-------------+
> +    |            -------|
> +    |   DC IN LS7A1000  |
> +    |  _   _     -------|
> +    | | | | |    | i2c1 <--------+-------------+
> +    | |_| |_|    -------|        |             |             _________
> +    |            -------|        |             |            |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +  Simple usage of LS7A1000 with LS3A4000 CPU:
> +
> +    +------+            +-----------------------------------+
> +    | DDR4 |            |  +-------------------+            |
> +    +------+            |  | PCIe Root complex |   LS7A1000 |
> +       || MC0           |  +--++---------++----+            |
> +  +----------+  HT 3.0  |     ||         ||                 |
> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
> +       || MC1           +---------------|--|----------------+
> +    +------+                            |  |
> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
> +                      +-------+                      +------+
> +
> +  The display controller in LS2K1000/LS2K0500:
> +     ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^              ^           |_________|
> +    | | | | |           |        |              |
> +    | |_| |_|           |     +------+          |
> +    |                   <---->| i2c0 |<---------+
> +    |   DC IN LS2K1000  |     +------+
> +    |  _   _            |     +------+
> +    | | | | |           <---->| i2c1 |----------+
> +    | |_| |_|           |     +------+          |            _________
> +    |            -------|        |              |           |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +properties:
> +  $nodename:
> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - loongson,ls7a1000-dc
> +              - loongson,ls2k1000-dc
> +              - loongson,ls2k0500-dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  i2c-gpio@0:
> +    description: |
> +      Built-in GPIO emulate i2c exported for external display bridge

If you have i2c-gpio, that belongs at the DT top-level, not here.

> +      configuration, onitor detection and edid read back etc, for ls7a1000
> +      only. Its compatible must be lsdc,i2c-gpio-0. The reg property can be

No, there's a defined i2c-gpio compatible already.

> +      used to specify a I2c adapter bus number, if you don't specify one
> +      i2c driver core will dynamically assign a bus number. Please specify

Bus numbers are a linux detail not relevant to DT binding.

> +      it only when its bus number matters. Bus number greater than 6 is safe
> +      because ls7a1000 bridge have 6 hardware I2C controller integrated.
> +
> +  i2c-gpio@1:
> +    description: |
> +      Built-in GPIO emulate i2c exported for external display bridge
> +      configuration, onitor detection and edid read back etc, for ls7a1000
> +      only. Its compatible must be lsdc,i2c-gpio-1.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    bus {
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        #interrupt-cells = <2>;
> +
> +        display-controller@6,1 {
> +            compatible = "loongson,ls7a1000-dc";
> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            i2c-gpio@0 {
> +                compatible = "lsdc,i2c-gpio-0";
> +                reg = <6>;
> +                sda = <0>;
> +                scl = <1>;
> +            };
> +
> +            i2c-gpio@1 {
> +                compatible = "lsdc,i2c-gpio-1";
> +                reg = <7>;
> +                sda = <2>;
> +                scl = <3>;
> +            };
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    endpoint {
> +                            remote-endpoint = <&vga_encoder_in>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    endpoint {
> +                            remote-endpoint = <&dvi_encoder_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    bus {
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        #interrupt-cells = <2>;
> +
> +        display-controller@6,0 {
> +            compatible = "loongson,ls2k1000-dc";
> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    endpoint {
> +                            remote-endpoint = <&panel_in>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    endpoint {
> +                            remote-endpoint = <&hdmi_encoder_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
> 
