Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479AB551AC2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 15:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2309510F0CE;
	Mon, 20 Jun 2022 13:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C7010F0BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:32:01 +0000 (UTC)
X-UUID: 520776e5f83d4217a8242e71e31af414-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:3b3bc39f-2687-4e8e-b0ac-b0b02ab73b26, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:0b2e04ea-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
 l,QS:nil,BEC:nil,COL:0
X-UUID: 520776e5f83d4217a8242e71e31af414-20220620
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 103744204; Mon, 20 Jun 2022 21:31:55 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 20 Jun 2022 21:31:53 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 21:31:53 +0800
Message-ID: <b4574843defba94e2abfaac29a9ab7be2555c5ec.camel@mediatek.com>
Subject: Re: FW: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <fparent@baylibre.com>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Date: Mon, 20 Jun 2022 21:32:29 +0800
In-Reply-To: <PS1PR03MB5084CE11996065F4DD6959F9A6B09@PS1PR03MB5084.apcprd03.prod.outlook.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
 <1c53c2c73875cf565b819f67267d0e725d49f3c2.camel@mediatek.com>
 <PS1PR03MB5084CE11996065F4DD6959F9A6B09@PS1PR03MB5084.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Linux-mediatek <linux-mediatek-bounces@lists.infradead.org> On
> Behalf Of CK Hu
> Sent: Friday, June 17, 2022 1:31 PM
> To: Fabien Parent <fparent@baylibre.com>; matthias.bgg@gmail.com;
> Jitao Shi (石记涛) <jitao.shi@mediatek.com>; 
> krzysztof.kozlowski+dt@linaro.org; robh+dt@kernel.org
> Cc: chunkuang.hu@kernel.org; p.zabel@pengutronix.de; airlied@linux.ie
> ; daniel@ffwll.ch; dri-devel@lists.freedesktop.org; 
> linux-mediatek@lists.infradead.org; devicetree@vger.kernel.org; 
> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
> power-domains property
> 
> Hi, Fabien:
> 
> On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> > DPI is part of the display / multimedia block in MediaTek SoCs,
> > and 
> > always have a power-domain (at least in the upstream device-trees).
> > Add the power-domains property to the binding documentation.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6
> > ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > index 77ee1b923991..caf4c88708f4 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > @@ -57,6 +57,9 @@ properties:
> >        Output port node. This port should be connected to the
> > input 
> > port of an
> >        attached HDMI or LVDS encoder chip.
> >  
> > +  power-domains:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -64,6 +67,7 @@ required:
> >    - clocks
> >    - clock-names
> >    - port
> > +  - power-domains
> >  
> >  additionalProperties: false
> >  
> > @@ -71,11 +75,13 @@ examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >      #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> 
> Why do you include mt8183 power header file for mt8173 dpi node?
> 
> Regards,
> CK
> 
> >  
> >      dpi0: dpi@1401d000 {
> >          compatible = "mediatek,mt8173-dpi";
> >          reg = <0x1401d000 0x1000>;
> >          interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> > +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> >               <&mmsys CLK_MM_DPI_ENGINE>,
> >               <&apmixedsys CLK_APMIXED_TVDPLL>;
> 
> 

Hi fparent:

I think CK's suggestion, probably because you included the wrong header
file for power.
Because I did not find the definition of MT8173_POWER_DOMAIN_MM in the
path of dt-bindings/power/mt8183-power.h, it was defined in dt-
bindings/power/mt8173-power.h.
Please discuss if you have different opinions.

Best Regards!
xinlei

