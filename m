Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E92DDC08
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 00:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1CA897BC;
	Thu, 17 Dec 2020 23:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00F897AC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 23:48:25 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id j20so323691otq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cUeEed8ZzwpvVr3mRrzAmmAJs5wxve+4LaT/yq3GFRg=;
 b=jI3RrgYRN8mLFfKtr2lRX4TyovUJ7NpoMtl/mXjll0U4LvZd/BDfDpUASAdFH5BEva
 MDOAhXK01jw0tFSmBTHlioZRjtvbhzIhYt/zxvzJXokjd7PUs+uM12Nl1Ve5yeA/q9qr
 TXGfAXOJ4O3mfZMHH83GuUYPsI3Pups6sTruASAlKPFKeh/uYPY3fwcqbtQzQzP9rr/7
 KDzzgIzv8NOfKFFdoP7s/jMiqxLiuli53vliemYzB9FK7hz7mu7dn7OdJK9T6trffRrX
 I3S3DwgpkcMpP7vRULaplRO+cUuB3ub/YwlUhnyChp/nD1VW+BAsmx2S9xCBdoaSzQwC
 T9uA==
X-Gm-Message-State: AOAM533v0fSXRkIAJrJWqfecXFthRoqpUMalPDwlQH4Iv5IMOHVgLqqB
 /kTJTYSMd3tb31YK6Reykg==
X-Google-Smtp-Source: ABdhPJwCZbPBmCFWsrykYaizDVAKkLs9DZlO30erae8APmwJ/dTUVyq4BOYCuMSpWHWcjyhb7xX+Tw==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr1057597otm.231.1608248904574; 
 Thu, 17 Dec 2020 15:48:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v4sm1539292otk.50.2020.12.17.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 15:48:23 -0800 (PST)
Received: (nullmailer pid 451623 invoked by uid 1000);
 Thu, 17 Dec 2020 23:48:22 -0000
Date: Thu, 17 Dec 2020 17:48:22 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Convert binding to YAML
Message-ID: <20201217234822.GA431595@robh.at.kernel.org>
References: <20201215230603.7796-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215230603.7796-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 01:06:03AM +0200, Laurent Pinchart wrote:
> Convert the Renesas R-Car DU text binding to YAML.
> 

I tend to think this should be split up, but up to you.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use pattern instead of enum for dclkin
> - Update MAINTAINERS
> ---
>  .../bindings/display/renesas,du.txt           | 145 ---
>  .../bindings/display/renesas,du.yaml          | 854 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 855 insertions(+), 146 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml


> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> new file mode 100644
> index 000000000000..f56ef3eed742
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -0,0 +1,854 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,du.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Display Unit (DU)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  These DT bindings describe the Display Unit embedded in the Renesas R-Car
> +  Gen1, R-Car Gen2, R-Car Gen3, RZ/G1 and RZ/G2 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,du-r8a7742 # for RZ/G1H compatible DU
> +      - renesas,du-r8a7743 # for RZ/G1M compatible DU
> +      - renesas,du-r8a7744 # for RZ/G1N compatible DU
> +      - renesas,du-r8a7745 # for RZ/G1E compatible DU
> +      - renesas,du-r8a77470 # for RZ/G1C compatible DU
> +      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
> +      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
> +      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
> +      - renesas,du-r8a774e1 # for RZ/G2H compatible DU
> +      - renesas,du-r8a7779 # for R-Car H1 compatible DU
> +      - renesas,du-r8a7790 # for R-Car H2 compatible DU
> +      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
> +      - renesas,du-r8a7792 # for R-Car V2H compatible DU
> +      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
> +      - renesas,du-r8a7794 # for R-Car E2 compatible DU
> +      - renesas,du-r8a7795 # for R-Car H3 compatible DU
> +      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
> +      - renesas,du-r8a77961 # for R-Car M3-W+ compatible DU
> +      - renesas,du-r8a77965 # for R-Car M3-N compatible DU
> +      - renesas,du-r8a77970 # for R-Car V3M compatible DU
> +      - renesas,du-r8a77980 # for R-Car V3H compatible DU
> +      - renesas,du-r8a77990 # for R-Car E3 compatible DU
> +      - renesas,du-r8a77995 # for R-Car D3 compatible DU
> +
> +  reg:
> +    maxItems: 1
> +
> +  # See compatible-specific constraints below.
> +  clocks: true
> +  clock-names: true
> +  interrupts: true
> +  resets: true
> +  reset-names: true
> +
> +  ports:
> +    type: object
> +    description: |
> +      The connections to the DU output video ports are modeled using the OF
> +      graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +      The number of ports and their assignment are model-dependent. Each port
> +      shall have a single endpoint.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                $ref: /schemas/types.yaml#/definitions/phandle
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false

No need to document more than 'port' nodes if no extra endpoint 
properties.

> +
> +        additionalProperties: false
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +  renesas,cmms:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description:
> +      A list of phandles to the CMM instances present in the SoC, one for each
> +      available DU channel.
> +
> +  renesas,vsps:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description:
> +      A list of phandle and channel index tuples to the VSPs that handle the
> +      memory interfaces for the DU channels. The phandle identifies the VSP
> +      instance that serves the DU channel, and the channel index identifies
> +      the LIF instance in that VSP.

These 2 properties are about the only thing shared.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - resets
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,du-r8a7779
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 3
> +          items:
> +            - description: Functional clock
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 1
> +          maxItems: 3
> +          items:
> +            - const: du.0
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"

IIRC, with single quotes you just need '\.' instead of '\\.'

> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DPAD 1
> +            # port@2 is TCON, not supported yet
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - interrupts
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a7743
> +              - renesas,du-r8a7744
> +              - renesas,du-r8a7791
> +              - renesas,du-r8a7793
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"
> +
> +        interrupts:
> +          maxItems: 2

What are they?

> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: LVDS 0
> +            # port@2 is TCON, not supported yet
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a7745
> +              - renesas,du-r8a7792
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DPAD 1
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a7794
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DPAD 1
> +            # port@2 is TCON, not supported yet
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a77470
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DPAD 1
> +            port@2:
> +              description: LVDS 0
> +            # port@3 is DVENC, not supported yet
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a7742
> +              - renesas,du-r8a7790
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: Functional clock for DU2
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +            - description: DU_DOTCLKIN2 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.2
> +            - pattern: "^dclkin\\.[012]$"
> +            - pattern: "^dclkin\\.[012]$"
> +            - pattern: "^dclkin\\.[012]$"
> +
> +        interrupts:
> +          maxItems: 3
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: LVDS 0
> +            port@2:
> +              description: LVDS 1
> +            # port@3 is TCON, not supported yet
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a7795
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 8
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: Functional clock for DU2
> +            - description: Functional clock for DU4
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +            - description: DU_DOTCLKIN2 input clock
> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 4
> +          maxItems: 8
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.2
> +            - const: du.3
> +            - pattern: "^dclkin\\.[0123]$"
> +            - pattern: "^dclkin\\.[0123]$"
> +            - pattern: "^dclkin\\.[0123]$"
> +            - pattern: "^dclkin\\.[0123]$"
> +
> +        interrupts:
> +          maxItems: 4
> +
> +        resets:
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.2
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: HDMI 0
> +            port@2:
> +              description: HDMI 1
> +            port@3:
> +              description: LVDS 0
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +            - port@3
> +
> +        renesas,cmms:
> +          minItems: 4
> +
> +        renesas,vsps:
> +          minItems: 4
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a774a1
> +              - renesas,du-r8a7796
> +              - renesas,du-r8a77961
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: Functional clock for DU2
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +            - description: DU_DOTCLKIN2 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.2
> +            - pattern: "^dclkin\\.[012]$"
> +            - pattern: "^dclkin\\.[012]$"
> +            - pattern: "^dclkin\\.[012]$"
> +
> +        interrupts:
> +          maxItems: 3
> +
> +        resets:
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.2
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: HDMI 0
> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a774b1
> +              - renesas,du-r8a774e1
> +              - renesas,du-r8a77965
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: Functional clock for DU3
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          maxItems: 6
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.3
> +            - pattern: "^dclkin\\.[013]$"
> +            - pattern: "^dclkin\\.[013]$"
> +            - pattern: "^dclkin\\.[013]$"
> +
> +        interrupts:
> +          maxItems: 3
> +
> +        resets:
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.3
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: HDMI 0
> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a77970
> +              - renesas,du-r8a77980
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +          items:
> +            - description: Functional clock for DU0
> +            - description: DU_DOTCLKIN0 input clock
> +
> +        clock-names:
> +          minItems: 1
> +          maxItems: 2
> +          items:
> +            - const: du.0
> +            - const: dclkin.0
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: LVDS 0
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          minItems: 1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a774c0
> +              - renesas,du-r8a77990
> +              - renesas,du-r8a77995
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 4
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - pattern: "^dclkin\\.[01]$"
> +            - pattern: "^dclkin\\.[01]$"
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: LVDS 0
> +            port@2:
> +              description: LVDS 1
> +            # port@3 is TCON, not supported yet
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 2
> +
> +        renesas,vsps:
> +          minItems: 2
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
> +additionalProperties: false
> +
> +examples:
> +  # R-Car H3 ES2.0 DU
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display@feb00000 {
> +        compatible = "renesas,du-r8a7795";
> +        reg = <0xfeb00000 0x80000>;
> +        interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 724>,
> +                 <&cpg CPG_MOD 723>,
> +                 <&cpg CPG_MOD 722>,
> +                 <&cpg CPG_MOD 721>;
> +        clock-names = "du.0", "du.1", "du.2", "du.3";
> +        resets = <&cpg 724>, <&cpg 722>;
> +        reset-names = "du.0", "du.2";
> +
> +        renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
> +        renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&adv7123_in>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&dw_hdmi0_in>;
> +                };
> +            };
> +            port@2 {
> +                reg = <2>;
> +                endpoint {
> +                    remote-endpoint = <&dw_hdmi1_in>;
> +                };
> +            };
> +            port@3 {
> +                reg = <3>;
> +                endpoint {
> +                    remote-endpoint = <&lvds0_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b073c41c3a0..22663c2cb3a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5905,7 +5905,7 @@ S:	Supported
>  T:	git git://linuxtv.org/pinchartl/media drm/du/next
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> -F:	Documentation/devicetree/bindings/display/renesas,du.txt
> +F:	Documentation/devicetree/bindings/display/renesas,du.yaml
>  F:	drivers/gpu/drm/rcar-du/
>  F:	drivers/gpu/drm/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
> -- 
> Regards,
> 
> Laurent Pinchart
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
