Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F053F3EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 04:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB610E755;
	Tue,  7 Jun 2022 02:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184310E73E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 02:31:27 +0000 (UTC)
X-UUID: 8656a8c9b5ba4510b70bf0e1b5362453-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:3723c212-8544-46a6-be12-41fdc549bbe9, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:70
X-CID-INFO: VERSION:1.1.5, REQID:3723c212-8544-46a6-be12-41fdc549bbe9, OB:0,
 LOB:
 0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:70
X-CID-META: VersionHash:2a19b09, CLOUDID:3ecbdbe4-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:873374f2b283,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: 8656a8c9b5ba4510b70bf0e1b5362453-20220607
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1303853498; Tue, 07 Jun 2022 10:31:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:31:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 10:31:21 +0800
Message-ID: <a86afcd38ce4243f86fddd1647129d64585e56d1.camel@mediatek.com>
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>
Date: Tue, 7 Jun 2022 10:31:21 +0800
In-Reply-To: <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
 <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-25 at 13:55 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DPINTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DPINTF is the sink of the display pipeline that is connected to the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   .../bindings/display/mediatek/mediatek,dpi.yaml     | 13
> > ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > index dd2896a40ff0..6d9f6c11806e 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > @@ -4,16 +4,16 @@
> >   $id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >   $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: mediatek DPI/DPINTF Controller
> >   
> >   maintainers:
> >     - CK Hu <ck.hu@mediatek.com>
> >     - Jitao shi <jitao.shi@mediatek.com>
> >   
> >   description: |
> > -  The Mediatek DPI function block is a sink of the display
> > subsystem and
> > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> > parallel
> > -  output bus.
> > +  The Mediatek DPI and DPINTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >   
> >   properties:
> >     compatible:
> > @@ -23,6 +23,7 @@ properties:
> >         - mediatek,mt8173-dpi
> >         - mediatek,mt8183-dpi
> >         - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpintf
> >   
> >     reg:
> >       maxItems: 1
> > @@ -35,12 +36,14 @@ properties:
> >         - description: Pixel Clock
> >         - description: Engine Clock
> >         - description: DPI PLL
> > +      - description: Optional CK CG Clock
> >   
> >     clock-names:
> >       items:
> >         - const: pixel
> >         - const: engine
> >         - const: pll
> > +      - const: ck_cg
> 
> This is my understanding on how the DisplayPort Interface clocks work
> on 8195:
> 
> The "engine" clock is for the *VPP Engine's DisplayPort ip/block*,
> "pll" is for TVD PLL divider selection
> "pixel" is the gate for the pixel clock to the connected display.
> 
> "ck_cg" is useless, as that's the parent of "pixel" (and will always
> be)... for
> example, on mt8195... check clk/mediatek/clk-mt8195-vdo0.c - the
> CLK_VDO0_DP_INTF0_DP_INTF clock already has CLK_TOP_EDP as its
> parent, hence
> enabling the first will enable the latter.
> 
> That said... you can most probably avoid adding the ck_cg clock, as
> if you try
> to turn that off while it's in use by its children, you'll be only
> decrementing
> a refcount, but no "real action" will ever take place.
> 
> 
> Regards,
> Angelo

Hello Chunfeng and Angelo,

ck_cg is a clock gate, and I try to remove it from drivers but it's
failed to enable dp_intf.

the block diagram is:
1. 26M->CLK_APMIXED_TVDPLL1(pll)->CLK_TOP_EDP(pixel)-
>CLK_VDO0_DP_INTF0_DP_INTF(ck_cg)->dp_intf

2. VDOSYS clock->CLK_VDO0_DP_INTF0(engine)->dp_intf

"engine" and "ck_cg" are all clock gates which control the clock source
input to dp_intf.

Maybe we just need to rename it?
If so, what name do you think we should modify?

BRs,
Bo-Chen

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

