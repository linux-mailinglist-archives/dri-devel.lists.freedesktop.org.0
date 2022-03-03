Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDECB4CBAAE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864E310EC0A;
	Thu,  3 Mar 2022 09:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02FD10EC0A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 09:50:06 +0000 (UTC)
X-UUID: 6458af24639e4c5faa4da39d32278789-20220303
X-UUID: 6458af24639e4c5faa4da39d32278789-20220303
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1526891784; Thu, 03 Mar 2022 17:44:51 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 3 Mar 2022 17:44:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 17:44:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 17:44:49 +0800
Message-ID: <db8c94fc5a7401af2d8a2d8c4135f6e13d6eac08.camel@mediatek.com>
Subject: Re: [PATCH V5 3/6] dt-bindings: display: mediatek: revise enum to
 const
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 3 Mar 2022 17:44:49 +0800
In-Reply-To: <Yh+3fPzns86LSIdi@robh.at.kernel.org>
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-4-rex-bc.chen@mediatek.com>
 <Yh+3fPzns86LSIdi@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

Thanks for your review.
I have sent v6 to fix this error.


https://lore.kernel.org/all/20220303065725.23384-3-rex-bc.chen@mediatek.com/

BRs,
Rex

On Wed, 2022-03-02 at 12:29 -0600, Rob Herring wrote:
> On Tue, Mar 01, 2022 at 04:01:02PM +0800, Rex-BC Chen wrote:
> > There won't be more than 1 fallback for these bindings, so we
> > modify
> > them to use const instead of enum.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 4
> > ++--
> >  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4
> > ++--
> >  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4
> > ++--
> >  7 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 191b56e16bee..bc1c70d089ba 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -31,7 +31,7 @@ properties:
> >                - mediatek,mt8183-disp-aal
> >                - mediatek,mt8192-disp-aal
> >                - mediatek,mt8195-disp-aal
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8173-disp-aal
> 
> Run 'make dt_binding_check'. This will fail.
> 
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > index 6894b6999412..fc40e2981eaa 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > @@ -28,7 +28,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8195-disp-ccorr
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8192-disp-ccorr
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > index bc83155b3b4c..22ed5d368cbe 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > @@ -32,14 +32,14 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-color
> >                - mediatek,mt2712-disp-color
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-color
> >        - items:
> >            - enum:
> >                - mediatek,mt8183-disp-color
> >                - mediatek,mt8192-disp-color
> >                - mediatek,mt8195-disp-color
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8173-disp-color
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > index 9d89297f5f1d..2a82792b2625 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > @@ -28,7 +28,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8192-disp-dither
> >                - mediatek,mt8195-disp-dither
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-dither
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index 247baad147b3..45f88bdf07bb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -29,7 +29,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8192-disp-gamma
> >                - mediatek,mt8195-disp-gamma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-gamma
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > index e71f79bc2dee..88ba3f27b0e4 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > @@ -33,12 +33,12 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-ovl
> >                - mediatek,mt2712-disp-ovl
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-ovl
> >        - items:
> >            - enum:
> >                - mediatek,mt8195-disp-ovl
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-ovl
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 8ef821641672..56368c10d904 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -35,12 +35,12 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-rdma
> >                - mediatek,mt2712-disp-rdma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-rdma
> >        - items:
> >            - enum:
> >                - mediatek,mt8192-disp-rdma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-rdma
> >  
> >    reg:
> > -- 
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-arm-kernel__;!!CTRNKA9wMg0ARbw!xcy2G7LgKWqMWhM9wMaommKbXGVMY6gc6B0zZRk4uP8AWS0KwLAg2O5buJuUVkOXiMa-$
> >  

