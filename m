Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77B4F568D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 08:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353910E380;
	Wed,  6 Apr 2022 06:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0B810E380
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 06:38:49 +0000 (UTC)
X-UUID: d4e1b5a7c4674690ba3742875695fc36-20220406
X-UUID: d4e1b5a7c4674690ba3742875695fc36-20220406
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 322571076; Wed, 06 Apr 2022 14:38:42 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 14:38:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Apr 2022 14:38:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 14:38:40 +0800
Message-ID: <4940e2e4ecb5f9f6857dc960ea5dbe43c551df77.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <xinlei.lee@mediatek.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Date: Wed, 6 Apr 2022 14:38:40 +0800
In-Reply-To: <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2022-04-01 at 09:38 +0800, Rex-BC Chen wrote:
> On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       |
> > 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > index dd2896a40ff0..a73044c50b5f 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > @@ -22,6 +22,7 @@ properties:
> >        - mediatek,mt7623-dpi
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> > +      - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> >  
> >    reg:
> 
> Hello Xinlei,
> 
> From the dts we use, the dpi node needs other properties for MT8186.
> Please send another patch and add these properties to binding.
> 
> assigned-clocks = <&topckgen CLK_TOP_DPI>;
> assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;

According to [1], the assigned-clocks is initial value. Without this
initial value, I think driver would set this clock again, wouldn't it?

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/clock/clock-bindings.txt

Regards,
CK

> 
> Thanks
> 
> BRs,
> Rex
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!wtF15QZZTCzWfRpxNLjZ1VQQ54i40D8STuOo0h18dtz3es-ksLfYQGTEFlb7lg$
>  

