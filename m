Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09E5ADF70
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012AA10E564;
	Tue,  6 Sep 2022 06:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B31510E54E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 02:32:24 +0000 (UTC)
X-UUID: 8e35192a87a243c2a988e77da9329084-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lLZfor8VBXyAk27TpjkWmLUUJBncHtHiCzkOPODLj50=; 
 b=kzfporl388g0UA+79REkS7ycBXjJtxz71afRFgOx4spUcNqlqyv7c6QxyA4TK+1gIZSnnOL1j/wHQa9xxvpTUKHcpsHyUVQYVcyG3ySayozyJGysXkcOCIK8PN2IVJQvbxvFW3J3bLYl6Rk/vNguEwzLsyOnL9kEW+MQ5l41uiE=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:0b54bcab-c882-4380-93c5-0f0add6bada9, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:49
X-CID-INFO: VERSION:1.1.10, REQID:0b54bcab-c882-4380-93c5-0f0add6bada9, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_
 HamU,ACTION:release,TS:49
X-CID-META: VersionHash:84eae18, CLOUDID:ede04921-1c20-48a5-82a0-25f9c331906d,
 C
 OID:71996c057d7b,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 8e35192a87a243c2a988e77da9329084-20220906
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451122071; Tue, 06 Sep 2022 10:32:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:32:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:32:16 +0800
Message-ID: <e1b486ec70f7e58c8f204bb9b7377716c8acfcdd.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device
 tree Documentations for MT8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 10:32:16 +0800
In-Reply-To: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
 <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thanks for your review, and appreciate for all comments and sugestions.
I misunderstanding enum and const usage.
I'll add another item for mt8188 at next version.

On Tue, 2022-08-23 at 15:51 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 06:32, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > modify VDOSYS0 device tree Documentations for MT8188.
> 
> (...)
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 0882ae86e6c4..d0e6c0dd4dfb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -30,6 +30,8 @@ properties:
> >        - items:
> >            - const: mediatek,mt8183-disp-rdma
> >        - items:
> > +          - enum:
> > +              - mediatek,mt8188-disp-rdma
> >            - const: mediatek,mt8195-disp-rdma
> 
> Why do you change existing bindings?
> 
> Best regards,
> Krzysztof

