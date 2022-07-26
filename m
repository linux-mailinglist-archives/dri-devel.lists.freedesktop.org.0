Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E6580F5E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 10:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCDE10ED56;
	Tue, 26 Jul 2022 08:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5CE10ED56
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 08:46:45 +0000 (UTC)
X-UUID: 63514b995795457cac9035d883ae8191-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:c2016e17-6c6a-4d78-baec-69e09740b5c2, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:70
X-CID-INFO: VERSION:1.1.8, REQID:c2016e17-6c6a-4d78-baec-69e09740b5c2, OB:0,
 LOB:
 0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:70
X-CID-META: VersionHash:0f94e32, CLOUDID:ac460dee-db04-4499-9fdf-04ef44b9468c,
 C
 OID:cd19d327659d,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 63514b995795457cac9035d883ae8191-20220726
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 284345635; Tue, 26 Jul 2022 16:46:41 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 16:46:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 16:46:40 +0800
Message-ID: <38f785af2815e45d175f02d9970e3401e700a645.camel@mediatek.com>
Subject: Re: [PATCH v14 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Tue, 26 Jul 2022 16:46:40 +0800
In-Reply-To: <ef407d8767d12d240280f1c9d9fdd8ba9d3e5632.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-2-rex-bc.chen@mediatek.com>
 <0e1d4cef6b7e72813300eb9be5650066166ac763.camel@mediatek.com>
 <ef407d8767d12d240280f1c9d9fdd8ba9d3e5632.camel@mediatek.com>
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

On Tue, 2022-07-26 at 14:18 +0800, Rex-BC Chen wrote:
> On Wed, 2022-07-13 at 15:56 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This controller is present on several mediatek hardware.
> > > Currently
> > > mt8195 and mt8395 have this controller without a functional
> > > difference,
> > > so only one compatible field is added.
> > > 
> > > The controller can have two forms, as a normal display port and
> > > as
> > > an
> > > embedded display port.
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dp.yaml         | 115
> > > ++++++++++++++++++
> > >  1 file changed, 115 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > > ml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > new file mode 100644
> > > index 000000000000..e2d6cb314297
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > @@ -0,0 +1,115 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek Display Port Controller
> > > +
> > > +maintainers:
> > > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the MediaTek display port TX (DP) and
> > > +  embedded display port TX (eDP) controller present on some
> > > MediaTek
> > > SoCs.
> > > +  MediaTek DP and eDP are different hardwares and they have
> > > different
> > > +  base address for registers, so we need two different
> > > compatibles
> > > to
> > > +  separate them.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8195-dp-tx
> > > +      - mediatek,mt8195-edp-tx
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  nvmem-cells:
> > > +    maxItems: 1
> > > +    description: efuse data for display port calibration
> > > +
> > > +  nvmem-cell-names:
> > > +    const: dp_calibration_data
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Input endpoint of the controller, usually
> > > dp_intf
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: Output endpoint of the controller
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +            properties:
> > > +              data-lanes:
> > > +                description: |
> > > +                  number of lanes supported by the hardware.
> > > +                  The possible values:
> > > +                  0       - For 1 lane enabled in IP.
> > > +                  0 1     - For 2 lanes enabled in IP.
> > > +                  0 1 2 3 - For 4 lanes enabled in IP.
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +  max-linkrate-mhz:
> > > +    enum: [ 1620, 2700, 5400, 8100 ]
> > > +    description: maximum link rate supported by the hardware.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - ports
> > > +  - max-linkrate-mhz
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/power/mt8195-power.h>
> > > +    dp_tx@1c600000 {
> > > +        compatible = "mediatek,mt8195-dp-tx";
> > > +        reg = <0x1c600000 0x8000>;
> > > +        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> > > +        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        max-linkrate-mhz = <8100>;
> > 
> > Why dp-tx has no clock property? I think this device should work
> > with
> > a
> > clock.
> > 
> > Regards,
> > CK
> > 
> 
> Hello CK,
> 
> We just need to enable the power domain of dp.
> The clock of dp is generated by itself and we are not using the
> global
> pll to generate clocks.

Add this to description because this is not trivial.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +                dptx_in: endpoint {
> > > +                    remote-endpoint = <&dp_intf0_out>;
> > > +                };
> > > +            };
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                dptx_out: endpoint {
> > > +                    data-lanes = <0 1 2 3>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > 
> > 
> 
> 

