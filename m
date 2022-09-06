Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBE5ADF74
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147310E56F;
	Tue,  6 Sep 2022 06:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E1B10E228
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 02:28:36 +0000 (UTC)
X-UUID: e636a92e8cb948b5add80e87532ed3df-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ndPvRAz0OsNARbIrZSVy1/GA0g4XNxb67xUe/x044fA=; 
 b=C/pl7MHEV8TyU1oeQ+0D8VCZt8iwcWj56IFJ6Tdr0EoBLaxwGGAgkEYz609coV0kWD5AqSrIBlxVArziQ4CPvh+7fqT2GTgrZMMv2liQxeciPed3McRdkNsEti2QoGAdo9YqihQ8+kml1JMg2GZ+4eIDbelSTPZqehuWagVEyvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:d112f261-9b84-4a8b-b422-266528e40505, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:dda94921-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e636a92e8cb948b5add80e87532ed3df-20220906
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 913421802; Tue, 06 Sep 2022 10:28:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:28:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:28:28 +0800
Message-ID: <bc21af63b3babeec577a4b059f6e686f24be9001.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device
 tree Documentations for MT8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 10:28:28 +0800
In-Reply-To: <b0866ca8d749cd06f7b10b2f6eb44bf79d52dafb.camel@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
 <b0866ca8d749cd06f7b10b2f6eb44bf79d52dafb.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 srv_heupstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for your review, and appreciate for all comments and sugestions.
I'll seperate mmsys/mutex/display to different patch and remove all
unnecessary modify at next version

On Mon, 2022-08-22 at 13:36 +0800, CK Hu wrote:
> Hi, Nathan:
> 
> On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > modify VDOSYS0 device tree Documentations for MT8188.
> > 
> > Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml     | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml   | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml   | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml  | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> > ++-
> >  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 1
> > +
> >  .../bindings/display/mediatek/mediatek,postmask.yaml           | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml    |
> > 2 
> 
> Separate the display part to another patch for the maintainer it
> belong
> to.
> 
> > ++
> >  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml       | 1
> > +
> >  10 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6ad023eec193..f26f61069181 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -30,6 +30,7 @@ properties:
> >                - mediatek,mt8173-mmsys
> >                - mediatek,mt8183-mmsys
> >                - mediatek,mt8186-mmsys
> > +              - mediatek,mt8188-mmsys
> >                - mediatek,mt8192-mmsys
> >                - mediatek,mt8195-mmsys
> >                - mediatek,mt8365-mmsys
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > index d4d585485e7b..92741486c24d 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > @@ -31,6 +31,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-aal
> > +              - mediatek,mt8188-disp-aal
> >                - mediatek,mt8192-disp-aal
> >                - mediatek,mt8195-disp-aal
> >            - const: mediatek,mt8183-disp-aal
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > index 63fb02014a56..fe444beff558 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > @@ -27,6 +27,7 @@ properties:
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> >            - enum:
> > +              - mediatek,mt8188-disp-ccorr
> >                - mediatek,mt8195-disp-ccorr
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > index d2f89ee7996f..62306c88f485 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > @@ -37,6 +37,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8183-disp-color
> >                - mediatek,mt8186-disp-color
> > +              - mediatek,mt8188-disp-color
> >                - mediatek,mt8192-disp-color
> >                - mediatek,mt8195-disp-color
> >            - const: mediatek,mt8173-disp-color
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > index 8ad8187c02d1..5c7445c174e5 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > @@ -27,6 +27,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-dither
> > +              - mediatek,mt8188-disp-dither
> >                - mediatek,mt8192-disp-dither
> >                - mediatek,mt8195-disp-dither
> >            - const: mediatek,mt8183-disp-dither
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > index a89ea0ea7542..3d6e20f6eb05 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > @@ -12,7 +12,7 @@ maintainers:
> >  
> >  description: |
> >    Mediatek display gamma correction, namely GAMMA, provides a
> > nonlinear
> > -  operation used to adjust luminance in display system.
> > +  operation used to adjust luminance in?display system.
> 
> It's not necessary to modify this.
> 
> Regards,
> CK
> 
> >    GAMMA device node must be siblings to the central MMSYS_CONFIG
> > node.
> >    For a description of the MMSYS_CONFIG binding, see
> >    Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml
> > @@ -28,6 +28,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-gamma
> > +              - mediatek,mt8188-disp-gamma
> >                - mediatek,mt8192-disp-gamma
> >                - mediatek,mt8195-disp-gamma
> >            - const: mediatek,mt8183-disp-gamma
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > index a2a27d0ca038..065e526f950e 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > @@ -36,6 +36,7 @@ properties:
> >            - const: mediatek,mt2701-disp-ovl
> >        - items:
> >            - enum:
> > +              - mediatek,mt8188-disp-ovl
> >                - mediatek,mt8195-disp-ovl
> >            - const: mediatek,mt8183-disp-ovl
> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > index 654080bfbdfb..27de64495401 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > @@ -26,6 +26,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-postmask
> > +              - mediatek,mt8188-disp-postmask
> >            - const: mediatek,mt8192-disp-postmask
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > index 0882ae86e6c4..d0e6c0dd4dfb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > @@ -30,6 +30,8 @@ properties:
> >        - items:
> >            - const: mediatek,mt8183-disp-rdma
> >        - items:
> > +          - enum:
> > +              - mediatek,mt8188-disp-rdma
> >            - const: mediatek,mt8195-disp-rdma
> >        - items:
> >            - enum:
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > index 627dcc3e8b32..a5212a2a4dcc 100644
> > ---
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > @@ -30,6 +30,7 @@ properties:
> >        - mediatek,mt8173-disp-mutex
> >        - mediatek,mt8183-disp-mutex
> >        - mediatek,mt8186-disp-mutex
> > +      - mediatek,mt8188-disp-mutex
> >        - mediatek,mt8192-disp-mutex
> >        - mediatek,mt8195-disp-mutex
> >  
> 
> 

