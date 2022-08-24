Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838D159F135
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 04:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDD3113167;
	Wed, 24 Aug 2022 02:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4F7113144
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 02:03:15 +0000 (UTC)
X-UUID: 335b9a16d0a44c388e92ed439e7c8c9a-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6BmoI/TGEngfvulBKrOES+4OxsAg0U2OO06UXKEFiwg=; 
 b=qJJyUeovkUPNxbn0XsF6reU+2kkACDBW+AoBuIDHuZ9akHX1DcyDNq+eBs1i29ctfQrehZibOVYeXLLFwbb7Mtebyjllu9MQwkpfaQLr5jZQvSBoLdaLiKQiNLjxP1N34zEBfbu9GlXnbKlLSfTiIJchwiHkSNX9WapBIH9vlLc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:2a432e34-6cc3-4366-a97e-08cedc0a04da, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:11f068cf-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 335b9a16d0a44c388e92ed439e7c8c9a-20220824
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1323434797; Wed, 24 Aug 2022 10:03:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 10:03:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:03:08 +0800
Message-ID: <4e2699a291009deb70b135fc5867f3a894764019.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: Add gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 24 Aug 2022 10:03:07 +0800
In-Reply-To: <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
 <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
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

On Tue, 2022-08-23 at 11:38 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 12:19, zheng-yan.chen wrote:
> > mt8195 uses 10bit-to-12bit gamma-LUT, which is different from
> > current 9bit-to-10bit gamma-LUT, so this patch add its own
> > compatible
> > for mt8195.
> 
> I am not sure if this explains the need for change. Is mt8195 still
> compatible with mt8183 or not? Your driver change suggests that it is
> and points that this commit is wrong.
> 
> > 
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
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
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-gamma
> >                - mediatek,mt8192-disp-gamma
> > -              - mediatek,mt8195-disp-gamma
> 
> 
> Best regards,
> Krzysztof

mt8195 is not compatible with mt8183 now, I will change commit message
to:

   mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
current 9bit-to-10bit gamma-LUT.
    
    This patch thus add constant compatible for mt8195, which means
that mt8195 should only use specified mt8195 gamma driver data.    
    
    Also, delete related compatible from enum, to ensure that
    mt8195 will not accidentally get others' gamma driver data and thus
    cause fatal error.

Best regards,
Zheng-Yan Chen

