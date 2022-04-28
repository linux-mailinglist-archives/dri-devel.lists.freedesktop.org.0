Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1F512979
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 04:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46A810E1AE;
	Thu, 28 Apr 2022 02:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B91410E1AE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 02:25:35 +0000 (UTC)
X-UUID: 6ee58a627b334415909218f2746fced3-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:13d7d03c-07b8-4389-b047-271ab6f8cf3e, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:6c44f82e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6ee58a627b334415909218f2746fced3-20220428
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1069416685; Thu, 28 Apr 2022 10:25:28 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 10:25:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 10:25:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 10:25:26 +0800
Message-ID: <030e693e5fb231f7e53884da813da1391c71ecc8.camel@mediatek.com>
Subject: Re: [PATCH v17 03/21] dt-bindings: mediatek: add ethdr definition
 for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <wim@linux-watchdog.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Thu, 28 Apr 2022 10:25:26 +0800
In-Reply-To: <b699a15ae2e810e20d7c388bc347f57d0a951513.camel@pengutronix.de>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-4-nancy.lin@mediatek.com>
 <b699a15ae2e810e20d7c388bc347f57d0a951513.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thanks for the review.

On Mon, 2022-04-25 at 11:54 +0200, Philipp Zabel wrote:
> Hi Nancy,
> 
> On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,ethdr.yaml      | 158
> > ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> > aml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > new file mode 100644
> > index 000000000000..e8303c28a361
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml*__;Iw!!CTRNKA9wMg0ARbw!zcXKSpPDpWKl7v-NJE7CCYQtbPpEYQazXsfVX8MAZeNc0RwE7UdQucLql2QskJLk$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zcXKSpPDpWKl7v-NJE7CCYQtbPpEYQazXsfVX8MAZeNc0RwE7UdQucLql2fDD2NQ$
> >  
> > +
> > +title: Mediatek Ethdr Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +description: |
> > +  ETHDR is designed for HDR video and graphics conversion in the
> > external display path.
> > +  It handles multiple HDR input types and performs tone mapping,
> > color space/color
> > +  format conversion, and then combine different layers, output the
> > required HDR or
> > +  SDR signal to the subsequent display path. This engine is
> > composed of two video
> > +  frontends, two graphic frontends, one video backend and a mixer.
> > ETHDR has two
> > +  DMA function blocks, DS and ADL. These two function blocks read
> > the pre-programmed
> > +  registers from DRAM and set them to HW in the v-blanking period.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-disp-ethdr
> > +  reg:
> > +    maxItems: 7
> > +  reg-names:
> > +    items:
> > +      - const: mixer
> > +      - const: vdo_fe0
> > +      - const: vdo_fe1
> > +      - const: gfx_fe0
> > +      - const: gfx_fe1
> > +      - const: vdo_be
> > +      - const: adl_ds
> > +  interrupts:
> > +    minItems: 1
> > +  iommus:
> > +    description: The compatible property is DMA function blocks.
> > +      Should point to the respective IOMMU block with master port
> > as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > +      details.
> > +    minItems: 1
> > +    maxItems: 2
> > +  clocks:
> > +    items:
> > +      - description: mixer clock
> > +      - description: video frontend 0 clock
> > +      - description: video frontend 1 clock
> > +      - description: graphic frontend 0 clock
> > +      - description: graphic frontend 1 clock
> > +      - description: video backend clock
> > +      - description: autodownload and menuload clock
> > +      - description: video frontend 0 async clock
> > +      - description: video frontend 1 async clock
> > +      - description: graphic frontend 0 async clock
> > +      - description: graphic frontend 1 async clock
> > +      - description: video backend async clock
> > +      - description: ethdr top clock
> > +  clock-names:
> > +    items:
> > +      - const: mixer
> > +      - const: vdo_fe0
> > +      - const: vdo_fe1
> > +      - const: gfx_fe0
> > +      - const: gfx_fe1
> > +      - const: vdo_be
> > +      - const: adl_ds
> > +      - const: vdo_fe0_async
> > +      - const: vdo_fe1_async
> > +      - const: gfx_fe0_async
> > +      - const: gfx_fe1_async
> > +      - const: vdo_be_async
> > +      - const: ethdr_top
> > +  power-domains:
> > +    maxItems: 1
> > +  resets:
> > +    maxItems: 5
> 
> Please add a reset-names property and name these resets.
> 
> regards
> Philipp

OK, I will fix it in the next revision.

Regards,
Nancy

