Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B324E22B299
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B7789DD5;
	Thu, 23 Jul 2020 15:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAC189DD5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:33:30 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id s21so4673004ilk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LM6+liSSw+7zYWXhgHdp4eA8X4EaVz+GpXnsgH9vTZo=;
 b=V4iDJsM50dBcjG+xSC4Wd7NTdS7zRCcgZFaElvncgHjOcXWS6HLG0HUuFzlNpqm2a0
 X+SV2OWaHkxeqsf4wpKkFRQFCVuk6FFO0WUqkLzFeItQGN0uHkJP5eBNgkzjlHUOUrTg
 LTukaaBv8hopUaHx1IYi91p9A4qxx1e2oHH24sQbryeDiHluNQftaidUxSJ+4Mp7xlmB
 IzTtWXOLso2q4eABU0bd7zyDXtoegu1a07YN9CrhPY0GFvGMSyzZ/snr9iEzb0iKUXD7
 RwL9W6R+lYZZaStaTRMyc+1esoQCY9RPmp+c0FQAZRkwoezu3Sn7rknYM3bXDySku4GH
 GEiA==
X-Gm-Message-State: AOAM532eVSWkAywLXef09tFknKm6CcoLSATbjO14Fu4Ts3NiQncBgTme
 H7biJ3smujiuHg/y0N6a+Q==
X-Google-Smtp-Source: ABdhPJzOFystWAMI9/98m5QBC9Z743ueo9tJi9nCRp7nGLYtCeMGte3aiYMh2AA43yi48RLZXie/fg==
X-Received: by 2002:a05:6e02:1253:: with SMTP id
 j19mr5586422ilq.145.1595518410158; 
 Thu, 23 Jul 2020 08:33:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j17sm1593887ilq.7.2020.07.23.08.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:33:29 -0700 (PDT)
Received: (nullmailer pid 412465 invoked by uid 1000);
 Thu, 23 Jul 2020 15:33:26 -0000
Date: Thu, 23 Jul 2020 09:33:26 -0600
From: Rob Herring <robh@kernel.org>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings
Message-ID: <20200723153326.GA407329@bogus>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
 <1595403640-12816-2-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595403640-12816-2-git-send-email-sjakhade@cadence.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie, nsekhar@ti.com,
 narmstrong@baylibre.com, jsarha@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 09:40:38AM +0200, Swapnil Jakhade wrote:
> From: Yuti Amonkar <yamonkar@cadence.com>
> 
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml    | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 000000000000..cdf5760d4ec5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
> +          The AUX and PMA registers are not part of this range, they are instead
> +          included in the associated PHY.
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
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  phys:

maxItems: 1

> +    description:
> +      phandle to the DisplayPort PHY.
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          Input port representing the DP bridge input.
> +
> +      port@1:
> +        type: object
> +        description:
> +          Output port representing the DP bridge output.
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-mhdp8546
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2

else:
  properties:
    reg:
      maxItems: 1
    reg-names:
      maxItems: 1

> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - reg-names
> +  - phys
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mhdp: dp-bridge@f0fb000000 {
> +        compatible = "cdns,mhdp8546";
> +        reg = <0xf0 0xfb000000 0x0 0x1000000>;
> +        reg-names = "mhdptx";
> +        clocks = <&mhdp_clock>;
> +        phys = <&dp_phy>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                     reg = <0>;
> +                     dp_bridge_input: endpoint {
> +                        remote-endpoint = <&xxx_dpi_output>;
> +                     };
> +              };
> +
> +              port@1 {
> +                     reg = <1>;
> +                     dp_bridge_output: endpoint {
> +                        remote-endpoint = <&xxx_dp_connector_input>;
> +                     };
> +              };
> +        };
> +    };
> +...
> -- 
> 2.26.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
