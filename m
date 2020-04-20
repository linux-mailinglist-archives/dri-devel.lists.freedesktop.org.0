Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707A1B1860
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 23:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634A56E856;
	Mon, 20 Apr 2020 21:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0D26E856
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:24:53 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 72so3034362otu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/PYRUd145uwywq6C1mfwPkvq46x3zUYySJRsVBrwgD0=;
 b=WvpVVZFevjEN+Ph5ke4E0YqpGlBZrXn5EeoS4tPIqjo3LkDnFNWtjxqm+JTHadnyeF
 UKoes+GuWRrN5rE5RujCA2FMc24ZIzPgf0wl9J+/MdtGWSZs4AG6h8XN2TWLV1LU+Z1k
 iXcA8SdRMujFYXFmt1J3QQQilvoLaWB4mG6JCg9JFYOxdLKq8yN4EyIELe764IJysag9
 GNP0IDW9lkNuY61cQRD7TDrf2+cTFjUccwfUrtU23eSqDCATSZu3dYQIs4LzKe/Bq1dw
 TkwvWpmUy2Lso0vFQipP6FOPsT9ZhO2VjF/50I9d4j2ObKiaFkwku+L62mNyae56lL8q
 ZYwg==
X-Gm-Message-State: AGi0Pua8mqLQNr68CUIBlrFFbzw1tcv8/OQlegHmIzbQ3qVQ50THHD2s
 i48v40oF3WLTxm4PUNRh9A==
X-Google-Smtp-Source: APiQypKHGZeotSvJnLU+HKhQIe9WZ4T519yDeefcTOMv5aOAD9cDz6Px0Xs8V3iP/9aejEJL9YmFXQ==
X-Received: by 2002:a9d:72c2:: with SMTP id d2mr11805918otk.260.1587417891893; 
 Mon, 20 Apr 2020 14:24:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q206sm172423oib.2.2020.04.20.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:24:51 -0700 (PDT)
Received: (nullmailer pid 6994 invoked by uid 1000);
 Mon, 20 Apr 2020 21:24:50 -0000
Date: Mon, 20 Apr 2020 16:24:50 -0500
From: Rob Herring <robh@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200420212450.GA16835@bogus>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:29:29AM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.

You're going to need to base this on top of Laurent's conversion of 
dw_hdmi.txt to schema.

> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../display/bridge/snps,arc-dw-hdmi.yaml      | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> new file mode 100644
> index 000000000000..9b2fdfecd5b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,arc-dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI 2.0 TX encoder driver

Bindings are for h/w blocks, not drivers.

> +
> +maintainers:
> +  - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
> +  with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.

Sounds like 2 blocks?

> +
> +  These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> +  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> +  with the following device-specific properties.
> +
> +properties:
> +  compatible:
> +    const: snps,arc-dw-hdmi-hsdk
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Memory mapped base address and length of the DWC HDMI TX registers.

Can drop.

> +
> +  clocks:
> +    items:
> +      - description: The bus clock for AHB / APB
> +      - description: The internal register configuration clock
> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Reference to the DWC HDMI TX interrupt

Can drop.

> +
> +  reg-io-width:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 4]
> +        description: |
> +          Width of the registers specified by the reg property. The
> +          value is expressed in bytes and must be equal to 1 or 4 if specified.
> +          The register width defaults to 1 if the property is not present.

default: 1

The description is pretty much a plain text version of the constraints, 
so all but the first sentence can be dropped.

> +
> +  ports:
> +    type: object
> +    description: |
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

Can drop. That's all 'ports'.

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: |
> +          Video input endpoints of the controller.
> +          Usually it is associated with ARC PGU.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller. HDMI connector.
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi@10000 {
> +        compatible = "snps,arc-dw-hdmi-hsdk";
> +        reg = <0x10000 0x10000>;
> +        reg-io-width = <4>;
> +        interrupts = <14>;
> +        clocks = <&apbclk>, <&hdmi_pix_clk>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                hdmi_enc_input: endpoint {
> +                    remote-endpoint = <&pgu_output>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                hdmi_enc_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +    hdmi-out {
> +        port {
> +            hdmi_con: endpoint {
> +                remote-endpoint = <&hdmi_enc_out>;
> +            };
> +        };
> +    };
> +
> +    pgu {
> +        port_o: port {
> +            pgu_output: endpoint {
> +                remote-endpoint = <&hdmi_enc_input>;
> +            };
> +        };
> +    };
> -- 
> 2.21.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
