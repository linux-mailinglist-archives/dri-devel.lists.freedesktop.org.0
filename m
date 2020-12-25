Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BC2E2AF3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0889C13;
	Fri, 25 Dec 2020 09:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61B9B899B3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 01:44:57 +0000 (UTC)
X-UUID: 3fe67eda2ee749fe854ec1157564efde-20201225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fo9py5p3287KXCitGsy4o408IdeWlYcetEobuoJkHQs=; 
 b=MLWcYQrU451LyU2EG3ZiFX6pgFKX3H+LATYO4gAvl2K/wsL/jGuu7n0xFnKo9dg9n++9tVmMLxL4eMDZOSf2HIzx6w2PIjs8lxUc3+GgdcvjkLHUwK1zOXx7ygxYG8ghGN5TG8V9Mmk/k9vOlqNcHc6+LMXBTapAyiQEbTG/700=;
X-UUID: 3fe67eda2ee749fe854ec1157564efde-20201225
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 53191275; Fri, 25 Dec 2020 09:44:45 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Dec 2020 09:44:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 09:44:43 +0800
Message-ID: <1608860684.7499.18.camel@mhfsdcap03>
Subject: Re: [PATCH v4 10/11] dt-bindings: usb: convert mediatek,mtu3.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 25 Dec 2020 09:44:44 +0800
In-Reply-To: <20201221192628.GA401288@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-10-chunfeng.yun@mediatek.com>
 <20201221192628.GA401288@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EAC887BC963DFC882CB1352C6191668B309F2598A52C5182DC62B08538DAE4672000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-21 at 12:26 -0700, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 05:30:11PM +0800, Chunfeng Yun wrote:
> > Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4:
> >   1. refer to usb-drd.yaml insstead of usb/generic.txt
> >   the following ones suggested by Rob:
> >   2. add the number of phys supported
> >   3. fix indentation of wakeup
> >   4. add examples for port and connector
> > 
> > v3:
> >   1. fix yamllint warning
> >   2. remove pinctrl* properties
> >   3. remove unnecessary '|'
> >   4. drop unused labels in example
> > 
> > v2: new patch
> > ---
> >  .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 -------
> >  .../bindings/usb/mediatek,mtu3.yaml           | 278 ++++++++++++++++++
> >  2 files changed, 278 insertions(+), 108 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> > 
[...]
> > +
> > +  power-domains:
> > +    description: A phandle to USB power domain node to control USB's MTCMOS
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 4
> 
> Don't need maxItems here.
Ok, will remove it, and apply others
> 
> > +    items:
> > +      - description: Controller clock used by normal mode
> > +      - description: Reference clock used by low power mode etc
> > +      - description: Mcu bus clock for register access
> > +      - description: DMA bus clock for data transfer
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      - const: sys_ck  # required, the following ones are optional
> > +      - const: ref_ck
> > +      - const: mcu_ck
> > +      - const: dma_ck
> > +
> > +  phys:
> > +    description: List of all the USB PHYs used
> > +    minItems: 0
> > +    maxItems: 9
> 
> Need to define what each one is.
Ok, will do it
> 
> > +
> > +  vusb33-supply:
> > +    description: Regulator of USB AVDD3.3v
> > +
> > +  vbus-supply:
> > +    deprecated: true
> > +    description: |
> > +      Regulator of USB VBUS5v, needed when supports dual-role mode.
> > +      Particularly, if use an output GPIO to control a VBUS regulator, should
> > +      model it as a regulator. See bindings/regulator/fixed-regulator.yaml
> > +      It's considered valid for compatibility reasons, not allowed for
> > +      new bindings, and put into a usb-connector node.
> > +
> > +  dr_mode:
> > +    enum: [host, peripheral, otg]
> > +    default: otg
> > +
> > +  maximum-speed:
> > +    enum: [super-speed-plus, super-speed, high-speed, full-speed]
> > +
> > +  "#address-cells":
> > +    enum: [1, 2]
> > +
> > +  "#size-cells":
> > +    enum: [1, 2]
> > +
> > +  ranges: true
> > +
> > +  extcon:
> > +    deprecated: true
> > +    description: |
> > +      Phandle to the extcon device detecting the IDDIG/VBUS state, neede
> > +      when supports dual-role mode.
> > +      It's considered valid for compatibility reasons, not allowed for
> > +      new bindings, and use "usb-role-switch" property instead.
> > +
> > +  usb-role-switch:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: Support role switch.
> > +    type: boolean
> > +
> > +  connector:
> > +    $ref: /connector/usb-connector.yaml#
> > +    description:
> > +      Connector for dual role switch, especially for "gpio-usb-b-connector"
> > +    type: object
> > +
> > +  port:
> > +    description:
> > +      Any connector to the data bus of this controller should be modelled
> > +      using the OF graph bindings specified, if the "usb-role-switch"
> > +      property is used. See graph.txt
> > +    type: object
> > +
> > +  enable-manual-drd:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      supports manual dual-role switch via debugfs; usually used when
> > +      receptacle is TYPE-A and also wants to support dual-role mode.
> > +    type: boolean
> > +
> > +  wakeup-source:
> > +    description: enable USB remote wakeup, see power/wakeup-source.txt
> > +    type: boolean
> > +
> > +  mediatek,syscon-wakeup:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +    description:
> > +      A phandle to syscon used to access the register of the USB wakeup glue
> > +      layer between xHCI and SPM, the field should always be 3 cells long.
> > +    items:
> > +      items:
> > +        - description:
> > +            The first cell represents a phandle to syscon
> > +        - description:
> > +            The second cell represents the register base address of the glue
> > +            layer in syscon
> > +        - description:
> > +            The third cell represents the hardware version of the glue layer,
> > +            1 is used by mt8173 etc, 2 is used by mt2712 etc
> > +          enum: [1, 2]
> > +
> > +  mediatek,u3p-dis-msk:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The mask to disable u3ports, bit0 for u3port0,
> > +      bit1 for u3port1, ... etc
> > +
> > +# Required child node when support dual-role
> > +patternProperties:
> > +  "^usb@[0-9a-f]+$":
> > +    type: object
> > +    $ref: /usb/mediatek,mtk-xhci.yaml#
> > +    description:
> > +      The xhci should be added as subnode to mtu3 as shown in the following
> > +      example if the host mode is enabled.
> > +
> > +dependencies:
> > +  connector: [ 'usb-role-switch' ]
> > +  port: [ 'usb-role-switch' ]
> > +  wakeup-source: [ 'mediatek,syscon-wakeup' ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Dual role switch by extcon
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    usb@11271000 {
> > +        compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
> > +        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
> > +        phys = <&phy_port0 PHY_TYPE_USB3>, <&phy_port1 PHY_TYPE_USB2>;
> > +        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> > +        clocks = <&topckgen CLK_TOP_USB30_SEL>;
> > +        clock-names = "sys_ck";
> > +        vusb33-supply = <&mt6397_vusb_reg>;
> > +        vbus-supply = <&usb_p0_vbus>;
> > +        extcon = <&extcon_usb>;
> > +        dr_mode = "otg";
> > +        wakeup-source;
> > +        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        xhci: usb@11270000 {
> > +            compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
> > +            reg = <0x11270000 0x1000>;
> > +            reg-names = "mac";
> > +            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +            power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> > +            clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
> > +            clock-names = "sys_ck", "ref_ck";
> > +            vusb33-supply = <&mt6397_vusb_reg>;
> > +        };
> > +    };
> > +
> > +  # Enable/disable device by an input gpio for VBUS pin
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/power/mt2712-power.h>
> > +
> > +    usb@112c1000 {
> > +        compatible = "mediatek,mt2712-mtu3", "mediatek,mtu3";
> > +        reg = <0x112c1000 0x3000>, <0x112d0700 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_LOW>;
> > +        phys = <&u2port2 PHY_TYPE_USB2>;
> > +        power-domains = <&scpsys MT2712_POWER_DOMAIN_USB2>;
> > +        clocks = <&topckgen CLK_TOP_USB30_SEL>;
> > +        clock-names = "sys_ck";
> > +        dr_mode = "peripheral";
> > +        usb-role-switch;
> > +
> > +        connector {
> > +            compatible = "gpio-usb-b-connector", "usb-b-connector";
> > +            type = "micro";
> > +            vbus-gpios = <&pio 13 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +
> > +  # Dual role switch with type-c
> > +  - |
> > +    usb@11201000 {
> > +        compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
> > +        reg = <0x11201000 0x2e00>, <0x11203e00 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
> > +        phys = <&u2port0 PHY_TYPE_USB2>;
> > +        clocks = <&clk26m>;
> > +        clock-names = "sys_ck";
> > +        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> > +        wakeup-source;
> > +        dr_mode = "otg";
> > +        usb-role-switch;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        host: usb@11200000 {
> > +            compatible = "mediatek,mt8183-xhci", "mediatek,mtk-xhci";
> > +            reg = <0x11200000 0x1000>;
> > +            reg-names = "mac";
> > +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_LOW>;
> > +            clocks = <&clk26m>;
> > +            clock-names = "sys_ck";
> > +        };
> > +
> > +        port {
> > +            usb_role_sw: endpoint {
> > +                remote-endpoint = <&hs_ep>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
