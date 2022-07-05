Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B75669B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9910F187;
	Tue,  5 Jul 2022 11:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D1010E00E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 09:40:37 +0000 (UTC)
X-UUID: d2e20cb4e6c34366ad4679a71e2a69ec-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:572a4e06-ad7c-44da-a7d4-6316e1908059, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:0f94e32, CLOUDID:89dca6d6-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: d2e20cb4e6c34366ad4679a71e2a69ec-20220705
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1436059415; Tue, 05 Jul 2022 17:40:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 17:40:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 17:40:27 +0800
Message-ID: <d8b6f7d9b79608c9a533042f714869219ad067be.camel@mediatek.com>
Subject: Re: [PATCH v13 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 5 Jul 2022 17:40:27 +0800
In-Reply-To: <20220701202914.GA1457156-robh@kernel.org>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-2-rex-bc.chen@mediatek.com>
 <20220701202914.GA1457156-robh@kernel.org>
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
 tzimmermann@suse.de, liangxu.xu@mediatek.com, msp@baylibre.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 granquet@baylibre.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-07-01 at 14:29 -0600, Rob Herring wrote:
> On Fri, Jul 01, 2022 at 02:27:59PM +0800, Bo-Chen Chen wrote:
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
> 
> I'm sure you answered this before, but I'll keep asking until the 
> information is contained within this patch. Otherwise, I won't
> remember. 
> Is there a h/w difference in the 2 blocks? Different registers? Why 
> can't you just look at what the output is connected to?
> 

Hello Rob,

Thanks for your review.
Yes, it's two different hw for edp and dp and they have different
registers base address.
I will add this information in next version.

> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 108
> > ++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > new file mode 100644
> > index 000000000000..26047fc65e7d
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml*__;Iw!!CTRNKA9wMg0ARbw!0rhwy9BSTdon0PvJuF9KabbkL9STTTnUEnTBbW_pQD_ZJP7Ziu6lhepb8fUWCnoLWHAXfmmVC6-qsI6YUpPv_qzirg$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0rhwy9BSTdon0PvJuF9KabbkL9STTTnUEnTBbW_pQD_ZJP7Ziu6lhepb8fUWCnoLWHAXfmmVC6-qsI6YUpOIsTMz8Q$
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
> > +  data-lanes:
> 
> This is not where data-lanes belongs. It goes in port@1 endpoint.
> Look 
> at other users.
> 

Do you mean I need to put "data-lanes" inside port?

BRs,
Bo-Chen
> > +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-
> > lanes
> 
> Generally, not how references look in DT bindings.
> 
> > +    description: |
> > +      number of lanes supported by the hardware.
> > +      The possible values:
> > +      0       - For 1 lane enabled in IP.
> > +      0 1     - For 2 lanes enabled in IP.
> > +      0 1 2 3 - For 4 lanes enabled in IP.
> > +    minItems: 1
> > +    maxItems: 4
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
> > +  - data-lanes
> > +  - max-linkrate-mhz
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    dp_tx@1c600000 {
> > +        compatible = "mediatek,mt8195-dp-tx";
> > +        reg = <0x1c600000 0x8000>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> > +        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        data-lanes = <0 1 2 3>;
> > +        max-linkrate-mhz = <8100>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                edp_in: endpoint {
> > +                    remote-endpoint = <&dp_intf0_out>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg = <1>;
> > +                edp_out: endpoint {
> > +                    remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.18.0
> > 
> > 

