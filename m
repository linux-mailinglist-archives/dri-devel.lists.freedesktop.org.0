Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D528D95F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 06:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8213E6E083;
	Wed, 14 Oct 2020 04:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 14 Oct 2020 04:49:38 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8C5D6E083
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 04:49:38 +0000 (UTC)
X-UUID: 18ebda2e8bf74f3095a7a10152753375-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x91QPLRNfibON85F9Jml+ohJ1lXenPHGO335BQtB9sE=; 
 b=TkmPB3Asx3A3tAuOhtUvOJ/an4GLImdom4xnu2GyuqJibgVxpjk67Gz4xUfdNZ4XWl/1k7Mtql8Xg4u4jnB30Oc8gwKwpl9Q4BoIHYAFCClDVEmxupIAgAF2zYh1HYiTGr5AuSs9VpDFP+b9GrTplju/Apckqqvix0gNfnrVi4U=;
X-UUID: 18ebda2e8bf74f3095a7a10152753375-20201014
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 262329850; Wed, 14 Oct 2020 12:44:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 12:44:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 12:44:30 +0800
Message-ID: <1602650671.27998.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/8] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
From: CK Hu <ck.hu@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Wed, 14 Oct 2020 12:44:31 +0800
In-Reply-To: <20201013085207.17749-4-chunfeng.yun@mediatek.com>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-4-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chunfeng:

On Tue, 2020-10-13 at 16:52 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> index 7b124242b0c5..edac18951a75 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> @@ -50,22 +50,7 @@ Required properties:
>  
>  HDMI PHY
>  ========
> -
> -The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> -output and drives the HDMI pads.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-hdmi-phy"
> -- reg: Physical base address and length of the module's registers
> -- clocks: PLL reference clock
> -- clock-names: must contain "pll_ref"
> -- clock-output-names: must be "hdmitx_dig_cts" on mt8173
> -- #phy-cells: must be <0>
> -- #clock-cells: must be <0>
> -
> -Optional properties:
> -- mediatek,ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
> -- mediatek,ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
> +See phy/mediatek,hdmi-phy.yaml
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> new file mode 100644
> index 000000000000..77df50204606
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>

I think you should remove "CK Hu <ck.hu@mediatek.com>" and add latest
mediatek drm maintainer:

DRM DRIVERS FOR MEDIATEK
M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
M:	Philipp Zabel <p.zabel@pengutronix.de>
L:	dri-devel@lists.freedesktop.org
S:	Supported
F:	Documentation/devicetree/bindings/display/mediatek/
F:	drivers/gpu/drm/mediatek/

Regards,
CK

> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> +  output and drives the HDMI pads.
> +
> +properties:
> +  $nodename:
> +    pattern: "^hdmi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-hdmi-phy
> +      - mediatek,mt8173-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: pll_ref
> +
> +  clock-output-names:
> +    items:
> +      - const: hdmitx_dig_cts
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  mediatek,ibias:
> +    description:
> +      TX DRV bias current for < 1.65Gbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 63
> +    default: 0xa
> +
> +  mediatek,ibias_up:
> +    description:
> +      TX DRV bias current for >= 1.65Gbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 63
> +    default: 0x1c
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-output-names
> +  - "#phy-cells"
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    hdmi_phy: hdmi-phy@10209100 {
> +        compatible = "mediatek,mt8173-hdmi-phy";
> +        reg = <0x10209100 0x24>;
> +        clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
> +        clock-names = "pll_ref";
> +        clock-output-names = "hdmitx_dig_cts";
> +        mediatek,ibias = <0xa>;
> +        mediatek,ibias_up = <0x1c>;
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> +
> +...

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
