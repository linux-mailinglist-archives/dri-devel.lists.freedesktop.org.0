Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7B5BA3B0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 03:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6DC10E34E;
	Fri, 16 Sep 2022 01:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01010E34E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 01:08:53 +0000 (UTC)
X-UUID: 585eb4c119234dc58bab61523952d906-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pxKJ+gbL8/7B+B3rKoAm20e7s3BjFPOR+hbkLzLpVZw=; 
 b=dUJDFZxnhgD0Peniri4oGNPS5LkJOLGcw6shdoW1s2uFKui/bNitAxvsnimQbC0/H1H5lLJ3UICc6tywpPl55kY0Ft5ewS25YPxOkUMjcJDVvmCLMKuHwesyEHDty+NZamwQSEcs8vARHI9gqcZ6NlGqoiN2Kw1epvFUrAbhmhA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:303ef100-f933-4e54-8193-87739730948c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:256d92f6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 585eb4c119234dc58bab61523952d906-20220916
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 162167583; Fri, 16 Sep 2022 09:08:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 09:08:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 09:08:48 +0800
Message-ID: <e00c1115761b292a6525b71dd7283014f2ade896.camel@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 16 Sep 2022 09:08:47 +0800
In-Reply-To: <a8e18b62-f49f-7c99-e046-3ee609e11627@gmail.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-2-jason-jh.lin@mediatek.com>
 <1b739216-8bb1-162b-1af5-24acba7324bf@gmail.com>
 <296155e2a12a474439ba092e73b4bcffbf3d3edc.camel@mediatek.com>
 <a8e18b62-f49f-7c99-e046-3ee609e11627@gmail.com>
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

On Thu, 2022-09-15 at 18:20 +0200, Matthias Brugger wrote:
> Hi Jason,
> 
> On 15/09/2022 03:24, Jason-JH Lin wrote:
> > Hi Matthias,
> > 
> > Thanks for the reviews.
> > 
> > On Wed, 2022-09-14 at 23:24 +0200, Matthias Brugger wrote:
> > > 
> > > On 14/09/2022 20:23, Jason-JH.Lin wrote:
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
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > I'm not sure Krzysztof gave his Acked-by tag.
> > 
> > I'll remove this tag.
> > > 
> > > > ---
> > > >    .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml    
> > > >     |
> > > > 2 ++
> > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > index 6ad023eec193..a53b32c0a608 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > +++
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > @@ -32,6 +32,8 @@ properties:
> > > >                  - mediatek,mt8186-mmsys
> > > >                  - mediatek,mt8192-mmsys
> > > >                  - mediatek,mt8195-mmsys
> > > > +              - mediatek,mt8195-vdosys0
> > > 
> > > As I said in the last submission, we should make mediatek,mt8195-
> > > mmsys as a
> > > fallback of vdosys0. Actually mediatek,mt8195-mmsys is only used
> > > for
> > > the
> > > fallback of vdosys0.
> > 
> > I think adding both vdosys0 and vdosys1 can make the description of
> > this patch clearer.
> > 
> > It's find to me to only add "mediatek,mt8195-vdosys0" in this
> > patch.
> > So I'll remove the "mediatek,mt8195-vdosys1" at the next version.
> > 
> 
> That's not what I wanted to suggest. Up to now in upstream kernel
> compatible 
> mediatek,mt8195-mmsys enables support fro vdosys0. The vdosys1 is not
> yet 
> upstream, so no support.
> If we change the compatible, we should keep mediatek,mt8195-mmsys as
> fallback of 
> "mediatek,mt8195-vdosys0" so that older device tree blobs won't break
> with a 
> newer kernel.
> For "mediatek,mt8195-vdosys1" we do not need a fallback compatible as
> the code 
> never reached upstream, so no breakage expected.
> 
> Hope I explain myself now.
> 
> Regards,
> Matthias
> 

I think I misunderstood your reply to the patch "dt-bindings: arm:
mediatek: mmsys: remove the unused compatible for mt8195", so I merge
it into this patch.

Thanks for your patient explanation.
I will keep the "mediatek,mt8195-
mmsys" in this patch.

Regards,
Jason-JH.Lin

> 
> > Regards,
> > Jason-JH.Lin
> > > 
> > > Regards,
> > > Matthias
> > > 
> > > > +              - mediatek,mt8195-vdosys1
> > > >                  - mediatek,mt8365-mmsys
> > > >              - const: syscon
> > > >          - items:
> > > 
> > > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

