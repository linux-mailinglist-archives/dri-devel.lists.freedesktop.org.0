Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C554BB22
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 22:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026610FFEB;
	Tue, 14 Jun 2022 20:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE6D10FB02
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 20:11:49 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id p69so10634471iod.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/XBqejShhBsGHynRMK/NnFFuohdRCp1F64DE0/PIZM=;
 b=qdV9tHgxSwPFU3R89aBQRi3QCwn8pnWB661pOUm8SEIoMBw4yYFrhlZ/ts06jkr2MQ
 v/OCTdJncAbKiKel4j8kQtH2S90xa3CYvUxYtZX+h0A3Dg27jhac97kJkN56qJSbC/ft
 bCB0fT6+daZiBBbfTQjbtIFUci2iiMSw0jFo0zxO2dDSDP5HOFjIL3SW9lJQsl4mciq0
 XOzyW/oHGH7+EA7ANep6qjZsZamPkcDeGxNw6fnpuLCdRqzHSH57icCH0fJOQqlZOgGp
 sf91V1zj9M0eDUkdGem4qK69XoZeqGQPc5ILz2VAgigS13Ymot/JgZZUfvJTXuItEne+
 8xCQ==
X-Gm-Message-State: AOAM533h/6J9mgaqS1OYX3bZ3OwzSjfPhdkF8hUcGuWDrMkaGkXpVlXP
 ITNpeLTcfXb29yhR0faNWE0tp/zHiw==
X-Google-Smtp-Source: ABdhPJxWEsmo+mG/x3kXLODUtDKPZ8ETebE3K2+pKnnHvBgtT4SiuVSTIClpZz5EwzbOKjOIAfOuqA==
X-Received: by 2002:a6b:6a07:0:b0:66a:2e5f:2058 with SMTP id
 x7-20020a6b6a07000000b0066a2e5f2058mr929393iog.72.1655237509097; 
 Tue, 14 Jun 2022 13:11:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a025406000000b00331c8618d2esm5249796jaa.143.2022.06.14.13.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:11:48 -0700 (PDT)
Received: (nullmailer pid 2359572 invoked by uid 1000);
 Tue, 14 Jun 2022 20:11:46 -0000
Date: Tue, 14 Jun 2022 14:11:46 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v9 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <20220614201146.GA2344044-robh@kernel.org>
References: <20220611141421.718743-1-victor.liu@nxp.com>
 <20220611141421.718743-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220611141421.718743-6-victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 11, 2022 at 10:14:12PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp display pixel link.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8->v9:
> * Add 'fsl,dc-id' and 'fsl,dc-stream-id' properties. (Laurent)

Why? Isn't the graph sufficient for determining the connections? That's 
what it is for.

> * Drop Rob's R-b tag.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * No change.
> 
> v5->v6:
> * No change.
> 
> v4->v5:
> * No change.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * Add Rob's R-b tag.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> * Require all four pixel link output ports. (Laurent)
> * Mention pixel link is accessed via SCU firmware. (Rob)
> 
>  .../bridge/fsl,imx8qxp-pixel-link.yaml        | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> new file mode 100644
> index 000000000000..38ecc7926fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Pixel Link
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
> +  asynchronous linkage between pixel sources(display controller or
> +  camera module) and pixel consumers(imaging or displays).
> +  It consists of two distinct functions, a pixel transfer function and a
> +  control interface.  Multiple pixel channels can exist per one control channel.
> +  This binding documentation is only for pixel links whose pixel sources are
> +  display controllers.
> +
> +  The i.MX8qm/qxp Display Pixel Link is accessed via System Controller Unit(SCU)
> +  firmware.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-dc-pixel-link
> +      - fsl,imx8qxp-dc-pixel-link
> +
> +  fsl,dc-id:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      u8 value representing the display controller index that the pixel link
> +      connects to.
> +
> +  fsl,dc-stream-id:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      u8 value representing the display controller stream index that the pixel
> +      link connects to.
> +    enum: [0, 1]
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The pixel link input port node from upstream video source.
> +
> +    patternProperties:
> +      "^port@[1-4]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The pixel link output port node to downstream bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +      - port@3
> +      - port@4
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-dc-pixel-link
> +    then:
> +      properties:
> +        fsl,dc-id:
> +          const: 0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-dc-pixel-link
> +    then:
> +      properties:
> +        fsl,dc-id:
> +          enum: [0, 1]
> +
> +required:
> +  - compatible
> +  - fsl,dc-id
> +  - fsl,dc-stream-id
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dc0-pixel-link0 {
> +        compatible = "fsl,imx8qxp-dc-pixel-link";
> +        fsl,dc-id = /bits/ 8 <0>;
> +        fsl,dc-stream-id = /bits/ 8 <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            /* from dc0 pixel combiner channel0 */
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;

Isn't dc0 and link0 here the same information (if you get the port 
number from the remote end).

Rob
