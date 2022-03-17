Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7EE4DBDCA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 05:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD1E10EC33;
	Thu, 17 Mar 2022 04:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7247410EC33
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:48:13 +0000 (UTC)
X-UUID: 6598972e8a0f4dbf97b2b84afa919fb9-20220317
X-UUID: 6598972e8a0f4dbf97b2b84afa919fb9-20220317
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1676542577; Thu, 17 Mar 2022 12:48:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 12:48:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 12:48:07 +0800
Message-ID: <2f3c1f4461267644ab8e2b45e21c61591d245b01.camel@mediatek.com>
Subject: Re: [PATCH V8 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Thu, 17 Mar 2022 12:48:07 +0800
In-Reply-To: <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
References: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
 <20220316115155.17834-2-rex-bc.chen@mediatek.com>
 <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-16 at 16:18 +0100, Krzysztof Kozlowski wrote:
> On 16/03/2022 12:51, Rex-BC Chen wrote:
> > Add aal binding for MT8183.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4
> > +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 61f0ed1e388f..eb0299b80522 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -22,7 +22,9 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > -          - const: mediatek,mt8173-disp-aal
> > +          - enum:
> > +              - mediatek,mt8173-disp-aal
> > +              - mediatek,mt8183-disp-aal
> 
> This should not be under items. You have just one element here, so
> directly "enum" under oneOf.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

OK, I will do this in next version.
Thanks!

BRs,
Rex

