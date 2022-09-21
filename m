Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4B5C048E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 18:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7A210E10E;
	Wed, 21 Sep 2022 16:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45E010E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 16:47:25 +0000 (UTC)
X-UUID: bf5d6c1f19ab4f1a859ed31f237b4d29-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F2F19Vqk4oTeChl6tfimZoIWmEP62hPQK3JzSGtep98=; 
 b=E23Y54WTmCJxlqA2sbjDdjVOBjkFNYOsyc6SGBohpKvB6kBQQTvZNZamFOj/mu10XuYvacBRTO21XWRe3TABiZKHpoW672hyp2CDecSJvwr6QFg8QdgclKjlAtbXcR6v9zXQu5h3mTfG59VAAxjZSqeK9Ijq7B0mKtYVShnO8yc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:decbf236-6c9c-49ab-bf0b-b12fdd3828e0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:a961705e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bf5d6c1f19ab4f1a859ed31f237b4d29-20220922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1851693329; Thu, 22 Sep 2022 00:47:19 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 00:47:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 00:47:17 +0800
Message-ID: <4c9c9ad5b5ab8ce88c28c01832195d196b1ef964.camel@mediatek.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 22 Sep 2022 00:47:17 +0800
In-Reply-To: <29a06da0-ddf5-15eb-ac3d-0bc2e0006ae9@linaro.org>
References: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
 <20220920140145.19973-2-jason-jh.lin@mediatek.com>
 <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
 <8fba20bf37326504b871fb55ce171cd37720a9a0.camel@mediatek.com>
 <29a06da0-ddf5-15eb-ac3d-0bc2e0006ae9@linaro.org>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-09-21 at 08:28 +0200, Krzysztof Kozlowski wrote:
> On 21/09/2022 06:16, Jason-JH Lin wrote:
> > Hi Krzysztof,
> > 
> > Thanks for the reviews.
> > 
> > On Tue, 2022-09-20 at 17:25 +0200, Krzysztof Kozlowski wrote:
> > > On 20/09/2022 16:01, Jason-JH.Lin wrote:
> > > > For previous MediaTek SoCs, such as MT8173, there are 2 display
> > > > HW
> > > > pipelines binding to 1 mmsys with the same power domain, the
> > > > same
> > > > clock driver and the same mediatek-drm driver.
> > > > 
> > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
> > > > binding
> > > > to
> > > > 2 different power domains, different clock drivers and
> > > > different
> > > > mediatek-drm drivers.
> > > > 
> > > > Moreover, Hardware pipeline of VDOSYS0 has these components:
> > > > COLOR,
> > > > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
> > > > Quality)
> > > > and they makes VDOSYS0 supports PQ function while they are not
> > > > including in VDOSYS1.
> > > > 
> > > > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR
> > > > related
> > > > component). It makes VDOSYS1 supports the HDR function while
> > > > it's
> > > > not
> > > > including in VDOSYS0.
> > > > 
> > > > To summarize0:
> > > > Only VDOSYS0 can support PQ adjustment.
> > > > Only VDOSYS1 can support HDR adjustment.
> > > > 
> > > > Therefore, we need to separate these two different mmsys
> > > > hardwares
> > > > to
> > > > 2 different compatibles for MT8195.
> > > > 
> > > > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add
> > > > mt8195
> > > > SoC binding")
> > > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      
> > > > | 4
> > > > ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > index 6ad023eec193..df9184b6772c 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > +++
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > @@ -38,6 +38,10 @@ properties:
> > > >            - const: mediatek,mt7623-mmsys
> > > >            - const: mediatek,mt2701-mmsys
> > > >            - const: syscon
> > > > +      - items:
> > > > +          - const: mediatek,mt8195-vdosys0
> > > > +          - const: mediatek,mt8195-mmsys
> > > > +          - const: syscon
> > > 
> > > and why mediatek,mt8195-mmsys is kept as non-deprecated?
> > 
> > Shouldn't we keep this for fallback compatible?
> 
> I am not talking about it.
> 
> > 
> > I think this items could support the device node like:
> > foo {
> >   compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", 
> > 	       "syscon";
> > }
> > 
> 
> Yes, this one ok.
> 
> > 
> > Or should I change the items like this?
> > - items:
> >     - const: mediatek,mt8195-vdosys0
> >     - enum:
> >         - mediatek,mt8195-mmsys
> >     - const: syscon
> > 
> 
> No, this does not look correct.

OK, I'll keep this one:
- items:
    - const: mediatek,mt8195-vdosys0
    - const: mediatek,mt8195-mmsys
    - const: syscon

Thanks for the reviews.

> 
> I asked why do you keep old mediatek,mt8195-mmsys compatible in the
> same
> place (the alone one), without making it deprecated?

 - items:
          - enum:
              - mediatek,mt2701-mmsys
              - mediatek,mt2712-mmsys
              - mediatek,mt6765-mmsys
              - mediatek,mt6779-mmsys
              - mediatek,mt6797-mmsys
              - mediatek,mt8167-mmsys
              - mediatek,mt8173-mmsys
              - mediatek,mt8183-mmsys
              - mediatek,mt8186-mmsys
              - mediatek,mt8192-mmsys
              - mediatek,mt8195-mmsys
Do you mean this one can be deprecated?
I'm not sure if I should keep this after adding the new item.
If so, I can remove this at the next version.

              - mediatek,mt8365-mmsys
          - const: syscon

Regards,
Jason-JH.Lin

> 
> Best regards,
> Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

