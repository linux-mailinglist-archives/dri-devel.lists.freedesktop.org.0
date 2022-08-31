Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091605A73DF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 04:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843B410E16C;
	Wed, 31 Aug 2022 02:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38C10E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 02:27:23 +0000 (UTC)
X-UUID: ef3624eb1e3b4e1daddfbff4c354c00d-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C6p4nBQpPDfAvJXIWYEc7Z9l/J547e22bjzK44gLW/A=; 
 b=hgEXTbFThencqRiLBIi4TxGU897PbCNKdJiIMOtFMfQIn3IM6U3vIWw7POOe+Nxx7kmP9V5zqIAqZ/7EPnAzjNjw+eeFidTmGxDedciIGhcti6AgQGTpDO11tkWwFF5BKf/HmrvvVgiMSpoJxXxTtVBtutyE720nXt8An9J5bZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:25532c71-3a5c-43a2-a1b8-cad9d282dab2, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:6fdb1ed0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ef3624eb1e3b4e1daddfbff4c354c00d-20220831
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1198349233; Wed, 31 Aug 2022 10:27:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 10:27:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:27:17 +0800
Message-ID: <9aed5d16174773b649460b34c586794019a61169.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 31 Aug 2022 10:27:17 +0800
In-Reply-To: <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
 <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-08-30 at 12:10 +0300, Krzysztof Kozlowski wrote:
> On 30/08/2022 09:39, zheng-yan.chen wrote:
> > mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> > current 9bit-to-10bit gamma-LUT.
> > 
> > This patch thus add constant compatible for mt8195, which means
> > that
> > mt8195 should only use specified mt8195 gamma driver data.
> > 
> > Also, delete related compatible from enum, to ensure that
> > mt8195 will not accidentally get others' gamma driver data and thus
> > cause fatal error.
> > 
> > Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195
> > SoC binding for vdosys0")
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> > ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index a89ea0ea7542..fbd7b9664a78 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -25,11 +25,12 @@ properties:
> >            - const: mediatek,mt8173-disp-gamma
> >        - items:
> >            - const: mediatek,mt8183-disp-gamma
> > +      - items:
> > +          - const: mediatek,mt8195-disp-gamma
> 
> This is one item, so not a list. With all such cases this should be
> dedicated enum.
> 
> Best regards,
> Krzysztof
Hello Krzysztof, 
Thanks for the review,

I will fix it at the next version.

Best Regards,
Zheng-Yan Chen.

