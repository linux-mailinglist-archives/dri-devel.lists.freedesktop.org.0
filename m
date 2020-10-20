Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE54293570
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 09:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D44A6F422;
	Tue, 20 Oct 2020 07:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D9B66EBFE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 02:33:21 +0000 (UTC)
X-UUID: bf19808b45c44ebf8b92d89939fe21d3-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gmfWcdc5kxyjaWDgNkAQC7M+cmu2N4Yawjob+dXhM8I=; 
 b=blrbvttm7yG+8L7hT0VbC9K2FBwaeIDQFYzZPWSuPKXaAgxjk6Nt7V4Q5fNxq2ODhyUs3h60rF71zZfY4GPVu1hR63B4ZP+8N7qeBlY7zdrScn6Y63bgCxOs2X6OFfnhMsx53CZgDGnyshbT8eYsuo1CcCQiwm+wuwdtJY7Lsh0=;
X-UUID: bf19808b45c44ebf8b92d89939fe21d3-20201020
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2042988616; Tue, 20 Oct 2020 10:33:15 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:33:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:33:12 +0800
Message-ID: <1603161192.29336.141.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:33:12 +0800
In-Reply-To: <20201016170444.GB1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
 <20201016170444.GB1562276@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2D5D0BED2485172574F17153A95E190EF36F32054A8710C7D5248D751DBD63DF2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 20 Oct 2020 07:05:14 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-10-16 at 12:04 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible
> > ---
> >  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
> >  2 files changed, 263 insertions(+), 162 deletions(-)
> >  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > new file mode 100755
> > index 000000000000..56ad8be69095
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > @@ -0,0 +1,263 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek T-PHY Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: |
> > +  The T-PHY controller supports physical layer functionality for a number of
> > +  controllers on MediaTek SoCs, includes USB2.0, USB3.0, PCIe and SATA.
[...]
> > +properties:
> > +  $nodename:
> > +     pattern: "^t-phy@[0-9a-f]+$"
> 
> Wrong indentation. Should be 1 less.
Yes, will fix it
> 
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2701-tphy
> > +              - mediatek,mt7623-tphy
> > +              - mediatek,mt7622-tphy
> > +              - mediatek,mt8516-tphy
> > +          - const: mediatek,generic-tphy-v1
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-tphy
> > +              - mediatek,mt7629-tphy
> > +              - mediatek,mt8183-tphy
> > +          - const: mediatek,generic-tphy-v2
> > +      - const: mediatek,mt2701-u3phy
> > +        deprecated: true
> > +      - const: mediatek,mt2712-u3phy
> > +        deprecated: true
> > +      - const: mediatek,mt8173-u3phy
> > +
> > +  reg:
> > +    description: |
> 
> Don't need '|' if there's no formatting to preserve.
Got it
> 
> > +      Register shared by multiple ports, exclude port's private register.
> > +      It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
> > +      T-PHY V2, such as mt2712.
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +      enum: [1, 2]
> > +
> > +  "#size-cells":
> > +      enum: [1, 2]
> 
> Wrong indent.
Will fix it and check it in other patches
> 
> > +
> > +  # Used with non-empty value if optional 'reg' is not provided.
> > +  # The format of the value is an arbitrary number of triplets of
> > +  # (child-bus-address, parent-bus-address, length).
> > +  ranges: true
> > +
> > +  mediatek,src-ref-clk-mhz:
> > +    description:
> > +      Frequency of reference clock for slew rate calibrate
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 26
> > +
> > +  mediatek,src-coef:
> > +    description:
> > +      Coefficient for slew rate calibrate, depends on SoC process
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 28
> > +
> > +# Required child node:
> > +patternProperties:
> > +  "^usb-phy@[0-9a-f]+$":
> > +    type: object
> > +    description: |
> > +      A sub-node is required for each port the controller provides.
> > +      Address range information including the usual 'reg' property
> > +      is used inside these nodes to describe the controller's topology.
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      clocks:
> > +        minItems: 1
> > +        maxItems: 2
> > +        items:
> > +          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
> > +          - description: Reference clock of analog phy
> > +        description: |
> > +          Uses both clocks if the clock of analog and digital phys are
> > +          separated, otherwise uses "ref" clock only if needed.
> > +
> > +      clock-names:
> > +        minItems: 1
> > +        maxItems: 2
> > +        items:
> > +          - const: ref
> > +          - const: da_ref
> > +
> > +      "#phy-cells":
> > +        const: 1
> > +        description: |
> > +          The cells contain the following arguments.
> > +
> > +          - description: The PHY type
> > +              enum:
> > +                - PHY_TYPE_USB2
> > +                - PHY_TYPE_USB3
> > +                - PHY_TYPE_PCIE
> > +                - PHY_TYPE_SATA
> > +
> > +      #The following optional vendor properties are only for debug or HQA test
> 
> space     ^
Ok, will add it
> 
> > +      mediatek,eye-src:
> > +        description:
> > +          The value of slew rate calibrate (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,eye-vrt:
> > +        description:
> > +          The selection of VRT reference voltage (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,eye-term:
> > +        description:
> > +          The selection of HS_TX TERM reference voltage (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 7
> > +
> > +      mediatek,intr:
> > +        description:
> > +          The selection of internal resistor (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 31
> > +
> > +      mediatek,discth:
> > +        description:
> > +          The selection of disconnect threshold (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 15
> > +
> > +      mediatek,bc12:
> > +        description:
> > +          Specify the flag to enable BC1.2 if support it
> > +        type: boolean
> > +
> > +    required:
> > +      - reg
> > +      - "#phy-cells"
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    susb: usb@11271000 {
> 
> Drop unused labels.
Ok
> 
> > +        compatible = "mediatek,mt8173-mtu3";
> > +        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        phys = <&u2port0 PHY_TYPE_USB2>,
> > +               <&u3port0 PHY_TYPE_USB3>,
> > +               <&u2port1 PHY_TYPE_USB2>;
> > +        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +    };
> > +
> > +    u3phy: t-phy@11290000 {
> > +        compatible = "mediatek,mt8173-u3phy";
> > +        reg = <0x11290000 0x800>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +        status = "okay";
> 
> Don't show status in examples.
Ok, will remove it

Thanks a lot

> 
> > +
> > +        u2port0: usb-phy@11290800 {
> > +            reg = <0x11290800 0x100>;
> > +            clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>, <&clk48m>;
> > +            clock-names = "ref", "da_ref";
> > +            #phy-cells = <1>;
> > +            status = "okay";
> > +        };
[...]
> > 2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
