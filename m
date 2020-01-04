Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EC1304A9
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 22:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EB889FD9;
	Sat,  4 Jan 2020 21:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6858389FD9
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 21:29:16 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id s15so39432669iln.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2020 13:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=acrY0+kOQM/iuVtgKfbOatR4QIHvs7UJPcpx6jaaklw=;
 b=L08gctlKQoY9fzaUhXLc6kmv9wMi67NPZkL32/7hmChzhAaUQsamViIXt22HaesoO2
 +onKyQNqZzNaWB3k1SEAiDQEN73Uk2ryesMsv0ZoE4j2YnSqd9yUcc50em83oHB9BA3v
 z2SBh9/rQUB5eVabvIHuZwaAZNpgZgwomsyisVZ6UHhaywOFy/5111hJGLA6HfOiJMSx
 gNXgdYdYXBx0zPgPpFlHeFLA6d143A6l8tIjROfYBFKF8pxOPNRTxiD8wMtT3zontfWi
 lSva1o5/fomP7jKdO0jD1yEH+sEWMAgi1catSR3aLEqMbM5mnhtAEU3Op+tt+/5MsdAj
 3ZYQ==
X-Gm-Message-State: APjAAAUqrVcPy5CLEFB+aKQBqtqMqxEurHSez8v2yrHKwm+yJqhpUF1g
 FTfYGaZqnNefL39dOE0+xg4L2e4=
X-Google-Smtp-Source: APXvYqw5jzPXsy4cxiTUn2fS5RV12Fl5upADbOmlfzUeWBfCqS08bbFMkts22ab9yZPx6Xa/1ehDYw==
X-Received: by 2002:a92:c703:: with SMTP id a3mr73929349ilp.63.1578173355298; 
 Sat, 04 Jan 2020 13:29:15 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id e184sm9768963iof.77.2020.01.04.13.29.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 13:29:14 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219b7
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Sat, 04 Jan 2020 14:29:13 -0700
Date: Sat, 4 Jan 2020 14:29:13 -0700
From: Rob Herring <robh@kernel.org>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings in yaml format
Message-ID: <20200104212913.GA12151@bogus>
References: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
 <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 jsarha@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, maxime@cerno.tech, sjakhade@cadence.com,
 mparab@cadence.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 04:16:40PM +0100, Yuti Amonkar wrote:
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 0000000..aed6224
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,109 @@
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP bridge
> +
> +maintainers:
> +  - Swapnil Jakhade <sjakhade@cadence.com>
> +  - Yuti Amonkar <yamonkar@cadence.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8546
> +      - ti,j721e-mhdp8546
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, it's used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
> +          The AUX and PMA registers are mapped to associated phy driver.
> +      - description:
> +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mhdptx
> +      - const: j721e-intg
> +
> +  phys:
> +    description: see the Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +
> +  phy-names:
> +    const: dpphy
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt
> +    properties:
> +       '#address-cells':
> +         const: 1
> +       '#size-cells':
> +         const: 0
> +       port@0:

type: object

> +         description:
> +           input port representing the DP bridge input
> +
> +       port@1:

type: object

> +         description:
> +           output port representing the DP bridge output
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mhdp: dp-bridge@f0fb000000 {
> +        compatible = "cdns,mhdp8546";
> +        reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +              <0xf0 0xfc000000 0x0 0x2000000>;
> +        clocks = <&mhdp_clock>;
> +        phys = <&dp_phy>;
> +        phy-names = "dpphy";
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                     reg = <0>;
> +                     dp_bridge_input: endpoint {
> +                                    remote-endpoint = <&xxx_dpi_output>;
> +                     };
> +              };
> +
> +              port@1 {
> +                     reg = <1>;
> +                     dp_bridge_output: endpoint {
> +                                     remote-endpoint = <&xxx_dp_connector_input>;
> +                     };
> +              };
> +      };
> +    };
> +...
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
