Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D002D262B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697556E989;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A4F26E8C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 02:05:56 +0000 (UTC)
X-UUID: 8a664c262b164f2bb78d63554f53e19a-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AnfMsxCsqIaWPXAofU2Qh3nt/yEpA1Nncyh3grmr2Hs=; 
 b=a2h/GOb3tMmj4tVWWW0Z8TUR3FBZ3HuPCXErjJgQio5LqJUJMEZR1tVd2u1BuMDPlmDLv2O+NDJZ8PcqVt24FAPKEqv1uNg6UFJa56TTUYvo2315Fqbm9h8UgU9F6hHw+HODvloC9Xj/ab+g8IgGqFF1/2dzNy25Nb0tHM+TMbc=;
X-UUID: 8a664c262b164f2bb78d63554f53e19a-20201208
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1168966895; Tue, 08 Dec 2020 10:00:35 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 10:00:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 10:00:26 +0800
Message-ID: <1607392825.23328.5.camel@mhfsdcap03>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding
 to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 8 Dec 2020 10:00:25 +0800
In-Reply-To: <20201207211920.GA841059@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
 <20201207211920.GA841059@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA25879DABC571C822341F4AC2ABA120CA9AACE0D97F7DEA60AC1AC6A1D432792000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min
 Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-07 at 15:19 -0600, Rob Herring wrote:
> On Wed, Nov 18, 2020 at 04:21:22PM +0800, Chunfeng Yun wrote:
> > Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> > 
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v3: new patch
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         | 18 +---
> >  .../bindings/phy/mediatek,dsi-phy.yaml        | 83 +++++++++++++++++++
> >  2 files changed, 84 insertions(+), 17 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index f06f24d405a5..8238a86686be 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -22,23 +22,7 @@ Required properties:
> >  MIPI TX Configuration Module
> >  ============================
> >  
> > -The MIPI TX configuration module controls the MIPI D-PHY.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-mipi-tx"
> > -- the supported chips are mt2701, 7623, mt8173 and mt8183.
> > -- reg: Physical base address and length of the controller's registers
> > -- clocks: PLL reference clock
> > -- clock-output-names: name of the output clock line to the DSI encoder
> > -- #clock-cells: must be <0>;
> > -- #phy-cells: must be <0>.
> > -
> > -Optional properties:
> > -- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
> > -						   the step is 200.
> > -- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
> > -               unspecified default values shall be used.
> > -- nvmem-cell-names: Should be "calibration-data"
> > +See phy/mediatek,dsi-phy.yaml
> >  
> >  Example:
> >  
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > new file mode 100644
> > index 000000000000..87f8df251ab0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: The MIPI DSI PHY supports up to 4-lane output.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^dsi-phy@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-mipi-tx
> > +      - mediatek,mt7623-mipi-tx
> > +      - mediatek,mt8173-mipi-tx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: PLL reference clock
> > +
> > +  clock-output-names:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  nvmem-cells:
> > +    maxItems: 1
> > +    description: A phandle to the calibration data provided by a nvmem device,
> > +      if unspecified, default values shall be used.
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: calibration-data
> > +
> > +  drive-strength-microamp:
> > +    description: adjust driving current, the step is 200.
> 
> multipleOf: 200
Got it.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Can drop. Standard unit suffixes have a type already.
Ok, thanks a lot

> 
> > +    minimum: 2000
> > +    maximum: 6000
> > +    default: 4600
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-output-names
> > +  - "#phy-cells"
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    dsi-phy@10215000 {
> > +        compatible = "mediatek,mt8173-mipi-tx";
> > +        reg = <0x10215000 0x1000>;
> > +        clocks = <&clk26m>;
> > +        clock-output-names = "mipi_tx0_pll";
> > +        drive-strength-microamp = <4000>;
> > +        nvmem-cells= <&mipi_tx_calibration>;
> > +        nvmem-cell-names = "calibration-data";
> > +        #clock-cells = <0>;
> > +        #phy-cells = <0>;
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
