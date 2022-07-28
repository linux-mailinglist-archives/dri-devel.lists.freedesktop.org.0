Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F1583B5F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 11:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AF79356F;
	Thu, 28 Jul 2022 09:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808B38B33B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 09:39:27 +0000 (UTC)
X-UUID: 1348953cf6a04774a6e9172ff09187fb-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:00ce714b-e383-4642-a363-25a7bf4720fc, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:50
X-CID-INFO: VERSION:1.1.8, REQID:00ce714b-e383-4642-a363-25a7bf4720fc, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:50
X-CID-META: VersionHash:0f94e32, CLOUDID:2c4e93d0-841b-4e95-ad42-8f86e18f54fc,
 C
 OID:f0ccf6249fe2,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1348953cf6a04774a6e9172ff09187fb-20220728
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2114459139; Thu, 28 Jul 2022 17:39:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 17:39:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 17:39:19 +0800
Message-ID: <3dd233ff2c5a69078c9b5eb3f0263d16da128647.camel@mediatek.com>
Subject: Re: [PATCH v15 01/11] dt-bindings: mediatek,dp: Add Display Port
 binding
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Date: Thu, 28 Jul 2022 17:39:19 +0800
In-Reply-To: <aaa6b5d0-20e8-146f-ba37-8784dbfd6072@linaro.org>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-2-rex-bc.chen@mediatek.com>
 <aaa6b5d0-20e8-146f-ba37-8784dbfd6072@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-27 at 09:23 +0200, Krzysztof Kozlowski wrote:
> On 27/07/2022 06:50, Bo-Chen Chen wrote:
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
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 117
> > ++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > new file mode 100644
> > index 000000000000..fd68c6c08df3
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > @@ -0,0 +1,117 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml*__;Iw!!CTRNKA9wMg0ARbw!wfsojIGZI_UYOhzgZxHy9ndUMC78GcAtJV-oZkD4DNXz0NE58uCHPE_MRZIyljEjrpwP$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wfsojIGZI_UYOhzgZxHy9ndUMC78GcAtJV-oZkD4DNXz0NE58uCHPE_MRZIylldgseRE$
> >  
> > +
> > +title: MediaTek Display Port Controller
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Jitao shi <jitao.shi@mediatek.com>
> > +
> > +description: |
> > +  Device tree bindings for the MediaTek display port TX (DP) and
> > +  embedded display port TX (eDP) controller present on some
> > MediaTek SoCs.
> 
> Drop entire sentence and just describe the hardware.
> 
> > +  We just need to enable the power domain of DP. The clock of DP
> > is
> > +  generated by itself and we are not using other PLL to generate
> > clocks.
> > +  MediaTek DP and eDP are different hardwares and there are some
> > features
> > +  which are not supported for eDP. For example, audio is not
> > supported for
> > +  eDP. Therefore, we need to use two different compatibles to
> > describe them.
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
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Output endpoint of the controller
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +            properties:
> > +              data-lanes:
> > +                description: |
> > +                  number of lanes supported by the hardware.
> > +                  The possible values:
> > +                  0       - For 1 lane enabled in IP.
> > +                  0 1     - For 2 lanes enabled in IP.
> > +                  0 1 2 3 - For 4 lanes enabled in IP.
> > +                minItems: 1
> > +                maxItems: 4
> > +            required:
> > +              - data-lanes
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +  max-linkrate-mhz:
> > +    enum: [ 1620, 2700, 5400, 8100 ]
> > +    description: maximum link rate supported by the hardware.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +  - max-linkrate-mhz
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    dp_tx@1c600000 {
> 
> No underscores in node names, so just "dp".
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review.
I will modify these in next version.

BRs,
Bo-Chen

