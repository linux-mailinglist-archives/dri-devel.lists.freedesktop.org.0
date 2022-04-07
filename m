Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CE94F71E4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7B210E67C;
	Thu,  7 Apr 2022 02:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8583A10E039
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 02:12:10 +0000 (UTC)
X-UUID: 3419aa46734a4a818a005cb08e4990c4-20220407
X-UUID: 3419aa46734a4a818a005cb08e4990c4-20220407
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1820783282; Thu, 07 Apr 2022 10:11:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 10:11:58 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 10:11:57 +0800
Message-ID: <8d4ec81b31de7acd5105623ea73b5d6e76f33e4f.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Date: Thu, 7 Apr 2022 10:12:25 +0800
In-Reply-To: <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
 <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-04-06 at 10:15 -0500, Rob Herring wrote:
> On Fri, Apr 01, 2022 at 09:38:20AM +0800, Rex-BC Chen wrote:
> > On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml      
> > >  | 1
> > > +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > index dd2896a40ff0..a73044c50b5f 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > @@ -22,6 +22,7 @@ properties:
> > >        - mediatek,mt7623-dpi
> > >        - mediatek,mt8173-dpi
> > >        - mediatek,mt8183-dpi
> > > +      - mediatek,mt8186-dpi
> > >        - mediatek,mt8192-dpi
> > >  
> > >    reg:
> > 
> > Hello Xinlei,
> > 
> > From the dts we use, the dpi node needs other properties for
> > MT8186.
> > Please send another patch and add these properties to binding.
> > 
> > assigned-clocks = <&topckgen CLK_TOP_DPI>;
> > assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> 
> Those are always allowed on any node with 'clocks', so no need to
> add 
> them here.
> 
> Rob

Hi Rob:

Thank you for your review.
I understand your suggestion, and the next version will be sent soon.

Best Regards!
xinlei

