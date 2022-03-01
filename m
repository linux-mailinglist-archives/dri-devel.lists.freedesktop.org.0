Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B34C8429
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2210E64E;
	Tue,  1 Mar 2022 06:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DB310E64E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 06:33:29 +0000 (UTC)
X-UUID: b52c1b2a412a4aac830a5595c9cde0f7-20220301
X-UUID: b52c1b2a412a4aac830a5595c9cde0f7-20220301
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 993912549; Tue, 01 Mar 2022 14:33:22 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 14:33:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 14:33:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 14:33:20 +0800
Message-ID: <c92342029f05748426df23d4d95ad178f7acc0f9.camel@mediatek.com>
Subject: Re: [PATCH v4,2/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 1 Mar 2022 14:33:20 +0800
In-Reply-To: <YhfaSqWInwgsu30x@robh.at.kernel.org>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-3-rex-bc.chen@mediatek.com>
 <YhfaSqWInwgsu30x@robh.at.kernel.org>
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
I add comments below:

On Thu, 2022-02-24 at 13:19 -0600, Rob Herring wrote:
> On Tue, Feb 22, 2022 at 01:28:00PM +0800, Rex-BC Chen wrote:
> > Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> > OVL, POSTMASK and RDMA.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml | 7
> > +++++++
> >  .../bindings/display/mediatek/mediatek,ccorr.yaml          | 5
> > +++++
> >  .../bindings/display/mediatek/mediatek,color.yaml          | 1 +
> >  .../bindings/display/mediatek/mediatek,dither.yaml         | 1 +
> >  .../bindings/display/mediatek/mediatek,gamma.yaml          | 1 +
> >  .../bindings/display/mediatek/mediatek,mutex.yaml          | 2 ++
> >  .../bindings/display/mediatek/mediatek,ovl-2l.yaml         | 5
> > +++++
> >  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 5
> > +++++
> >  .../bindings/display/mediatek/mediatek,postmask.yaml       | 5
> > +++++
> >  .../bindings/display/mediatek/mediatek,rdma.yaml           | 1 +
> >  10 files changed, 33 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 225f9dd726d2..3a5416937293 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -23,6 +23,8 @@ properties:
> >      oneOf:
> >        - items:
> >            - const: mediatek,mt8173-disp-aal
> > +      - items:
> > +          - const: mediatek,mt8183-disp-aal
> 
> This patch is for 8186...

I will split it to another commit in next version.

> 
> >        - items:
> >            - enum:
> >                - mediatek,mt2712-disp-aal
> > @@ -31,6 +33,11 @@ properties:
> >                - mediatek,mt8195-disp-aal
> >            - enum:
> >                - mediatek,mt8173-disp-aal
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-disp-aal
> > +          - enum:
> > +              - mediatek,mt8183-disp-aal
> 
> There won't be more than 1 fallback, so use const rather than enum.
> 

I will modify it in next version.

> >  
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > index 6894b6999412..8ac87b5896ac 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > @@ -30,6 +30,11 @@ properties:
> >                - mediatek,mt8195-disp-ccorr
> >            - enum:
> >                - mediatek,mt8192-disp-ccorr
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-disp-ccorr
> > +          - enum:
> > +              - mediatek,mt8183-disp-ccorr
> 
> Same here.

I will modify it in next version.

> 
> >  
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > index bc83155b3b4c..d0a4b9eb71fd 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > @@ -37,6 +37,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8183-disp-color
> > +              - mediatek,mt8186-disp-color
> >                - mediatek,mt8192-disp-color
> >                - mediatek,mt8195-disp-color
> >            - enum:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > index 9d89297f5f1d..9a08514ed909 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > @@ -26,6 +26,7 @@ properties:
> >            - const: mediatek,mt8183-disp-dither
> >        - items:
> >            - enum:
> > +              - mediatek,mt8186-disp-dither
> >                - mediatek,mt8192-disp-dither
> >                - mediatek,mt8195-disp-dither
> >            - enum:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index 247baad147b3..6d96f6736d91 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -27,6 +27,7 @@ properties:
> >            - const: mediatek,mt8183-disp-gamma
> >        - items:
> >            - enum:
> > +              - mediatek,mt8186-disp-gamma
> >                - mediatek,mt8192-disp-gamma
> >                - mediatek,mt8195-disp-gamma
> >            - enum:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex
> > .yaml
> > index 6eca525eced0..55391b5c08c4 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex
> > .yaml
> > @@ -34,6 +34,8 @@ properties:
> >            - const: mediatek,mt8173-disp-mutex
> >        - items:
> >            - const: mediatek,mt8183-disp-mutex
> > +      - items:
> > +          - const: mediatek,mt8186-disp-mutex
> >        - items:
> >            - const: mediatek,mt8192-disp-mutex
> 
> All these single entry cases can be a single enum.
> 

I will modify it in next version.

> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > index 611a2dbdefa4..f7f89485a5ae 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > @@ -25,6 +25,11 @@ properties:
> >            - const: mediatek,mt8183-disp-ovl-2l
> >        - items:
> >            - const: mediatek,mt8192-disp-ovl-2l
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-disp-ovl-2l
> > +          - enum:
> > +              - mediatek,mt8192-disp-ovl-2l
> >  
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > index e71f79bc2dee..110e6b2747bc 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > @@ -40,6 +40,11 @@ properties:
> >                - mediatek,mt8195-disp-ovl
> >            - enum:
> >                - mediatek,mt8183-disp-ovl
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-disp-ovl
> > +          - enum:
> > +              - mediatek,mt8192-disp-ovl
> >  
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > ask.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > ask.yaml
> > index 6ac1da2e8871..22c333d09465 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > ask.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > ask.yaml
> > @@ -23,6 +23,11 @@ properties:
> >      oneOf:
> >        - items:
> >            - const: mediatek,mt8192-disp-postmask
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-disp-postmask
> > +          - enum:
> > +              - mediatek,mt8192-disp-postmask
> >  
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 8ef821641672..4f1c935cdf70 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -39,6 +39,7 @@ properties:
> >                - mediatek,mt2701-disp-rdma
> >        - items:
> >            - enum:
> > +              - mediatek,mt8186-disp-rdma
> >                - mediatek,mt8192-disp-rdma
> >            - enum:
> >                - mediatek,mt8183-disp-rdma
> > -- 
> > 2.18.0
> > 
> > 

BRs,
Rex

