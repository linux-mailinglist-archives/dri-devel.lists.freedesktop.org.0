Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FE5B9238
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 03:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2610E1BE;
	Thu, 15 Sep 2022 01:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018910E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 01:37:55 +0000 (UTC)
X-UUID: 50a4d611035e4c9dbc8292300dcfb242-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Hll8D14Qt08YGxyPP/LHoUI1r1mvl/3LO8G0w9Pypy4=; 
 b=SW7AwRMt03iywCX638DbFqJFe72Bsdqs4YRABETl8FUwO62IHzhfcMP/pJjjfsawpgYEtK9djRulMWClhVvx57fCEbe1R24DDPrD7oRGdtEhNNpRUSXAviMPQ/Jr1HJ2DFpaXiumE0A0GagtPuioD5OxXDRE7EYQ6HFWzr2DUD8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:64aa8fcd-4baf-4823-86ec-3b2949ac0a9c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:601578ec-2856-4fce-b125-09d4c7ebe045,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 50a4d611035e4c9dbc8292300dcfb242-20220915
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1255417790; Thu, 15 Sep 2022 09:37:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 09:37:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Sep 2022 09:37:45 +0800
Message-ID: <f206b9f6c4c61b90306e19c713e2758d471ec037.camel@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: arm: mediatek: mmsys: remove the
 unused compatible for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 15 Sep 2022 09:37:45 +0800
In-Reply-To: <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-6-jason-jh.lin@mediatek.com>
 <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
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

On Wed, 2022-09-14 at 22:45 +0200, Matthias Brugger wrote:
> 
> On 14/09/2022 20:23, Jason-JH.Lin wrote:
> > The compatible properties of mt8195 have changed to
> > mediatek,mt8195-vdosys0
> > and mediatek,mt8195-vdosys1 from mediatek,mt895-mmsys, so remove
> > the unused
> > compatible.
> > 
> > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
> > SoC binding")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  
> > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         |
> > 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index a53b32c0a608..bfbdd30d2092 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -31,7 +31,6 @@ properties:
> >                 - mediatek,mt8183-mmsys
> >                 - mediatek,mt8186-mmsys
> >                 - mediatek,mt8192-mmsys
> > -              - mediatek,mt8195-mmsys
> 
> Should be part of the first patch. As described in the review.

Ok, I'll merge this patch into the first patch.

Regards,
Jason-JH.Lin

> 
> Regards,
> Matthias
> 
> >                 - mediatek,mt8195-vdosys0
> >                 - mediatek,mt8195-vdosys1
> >                 - mediatek,mt8365-mmsys
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

