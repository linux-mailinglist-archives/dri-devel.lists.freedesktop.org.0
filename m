Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A654E1CF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 15:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312110E0D0;
	Thu, 16 Jun 2022 13:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7F10E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 13:22:24 +0000 (UTC)
X-UUID: 62ab30d1a28548cfb45cbc62c6664582-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:3280e293-eeb6-4f0c-8046-fba97e2c6688, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:b14ad71, CLOUDID:488fc348-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 62ab30d1a28548cfb45cbc62c6664582-20220616
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1138178916; Thu, 16 Jun 2022 21:22:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 21:22:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 21:22:16 +0800
Message-ID: <aeebb6879d62865f8baf037e541c568eb9310f23.camel@mediatek.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 16 Jun 2022 21:22:16 +0800
In-Reply-To: <20220614202336.GA2400714-robh@kernel.org>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-2-rex-bc.chen@mediatek.com>
 <20220614202336.GA2400714-robh@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, msp@baylibre.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, granquet@baylibre.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-14 at 14:23 -0600, Rob Herring wrote:
> On Fri, Jun 10, 2022 at 06:55:13PM +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional
> > difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as
> > an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Fix reviewers' comment]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 101
> > ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > new file mode 100644
> > index 000000000000..10f50a0dcf49
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml*__;Iw!!CTRNKA9wMg0ARbw!yqAl1KhfbHqHN7-5aeqhzqeOVhPU_Z5beko5q-y-s5pcfp1WL5oVGvY5UF4EfWm4PWjc5mjBwyBUMsr_RI45ipbhsw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!yqAl1KhfbHqHN7-5aeqhzqeOVhPU_Z5beko5q-y-s5pcfp1WL5oVGvY5UF4EfWm4PWjc5mjBwyBUMsr_RI5WzYKENQ$
> >  
> > +
> > +title: MediaTek Display Port Controller
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Jitao shi <jitao.shi@mediatek.com>
> > +
> > +description: |
> > +  Device tree bindings for the MediaTek display port and
> > +  embedded display port controller present on some MediaTek SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8195-dp-tx
> > +      - mediatek,mt8195-edp-tx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  nvmem-cells:
> > +    maxItems: 1
> > +    description: efuse data for display port calibration
> > +
> > +  nvmem-cell-names:
> > +    const: dp_calibration_data
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the controller, usually
> > dp_intf
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the controller
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +  max-lanes:
> > +    maxItems: 1
> > +    description: maximum number of lanes supported by the
> > hardware.
> 
> We already have a 'data-lanes' property defined in 
> 'video-interfaces.yaml' that can serve this purpose.
> 

Hello Rob,

Thanks for review.
From the description of video-interfaces.yaml, I think it's not quite
match what we need. We only need this value be one of "1,2,4".

Any other suggestion?

> > +
> > +  max-linkrate:
> > +    maxItems: 1
> > +    description: maximum link rate supported by the hardware and
> > unit is MHz.
> 
> Then use '-mhz' suffix on the property name. Then you don't need a
> type 
> (or maxItems).

OK, I will write like this:

  max-linkrate-mhz:
    enum: [ 1620, 2700, 5400, 8100 ]
    description: maximum link rate supported by the hardware.

BRs,
Bo-Chen

