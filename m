Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A45420AF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 03:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2010E4EE;
	Wed,  8 Jun 2022 01:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867910E4EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 01:54:40 +0000 (UTC)
X-UUID: c8c4aa8af07c4a1ba6595dff5f598f1a-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:bdc836d9-e09c-4cf7-a873-b3fde784e7e4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:bdc836d9-e09c-4cf7-a873-b3fde784e7e4, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:82fb02e5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:fb65d8146278,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: c8c4aa8af07c4a1ba6595dff5f598f1a-20220608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1642239935; Wed, 08 Jun 2022 09:54:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 8 Jun 2022 09:54:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 09:54:33 +0800
Message-ID: <1a563a388e78e4eab4d1b9ae7b44f761b1e90865.camel@mediatek.com>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jun 2022 09:54:33 +0800
In-Reply-To: <20220607151119.GA3254370-robh@kernel.org>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
 <20220606051131.14182-2-rex-bc.chen@mediatek.com>
 <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
 <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
 <20220607151119.GA3254370-robh@kernel.org>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Nancy
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-07 at 23:11 +0800, Rob Herring wrote:
> On Mon, Jun 06, 2022 at 09:30:42PM +0800, Rex-BC Chen wrote:
> > On Mon, 2022-06-06 at 20:53 +0800, Rob Herring wrote:
> > > On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> > > > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > > > 
> > > > Add vdosys1 RDMA definition.
> > > > 
> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > Reviewed-by: Krzysztof Kozlowski <
> > > > krzysztof.kozlowski@linaro.org>
> > > > Tested-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > ---
> > > >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88
> > > > +++++++++++++++++++
> > > >  1 file changed, 88 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp
> > > > -
> > > > rdma.yaml
> > > > 
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m
> > > dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/linux-dt-
> > > review/Documentation/devicetree/bindings/display/mediatek/mediate
> > > k,md
> > > p-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-
> > > vdo1-
> > > rdma'}] is not of type 'object', 'boolean'
> > > 	from schema $id: 
> > > 
https://urldefense.com/v3/__http://json-schema.org/draft-07/schema*__;Iw!!CTRNKA9wMg0ARbw!3hhZrSKSWnCN5Bha9laiHlB5JCx9_p-ksaYDZmoCLQRi1tI4KJCcTJQva2vds3j3bwKF$
> > >  
> > > /builds/robherring/linux-dt-
> > > review/Documentation/devicetree/bindings/display/mediatek/mediate
> > > k,md
> > > p-rdma.yaml: ignoring, error in schema: properties: compatible
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > > rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to
> > > match
> > > any schema with compatible: ['mediatek,mt8195-vdo1-rdma']
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > See https://patchwork.ozlabs.org/patch/
> > > 
> > > This check can fail if there are any dependencies. The base for a
> > > patch
> > > series is generally the most recent rc1.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the
> > > above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is
> > > up
> > > to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit.
> > > 
> > 
> > Hello Rob,
> > 
> > We found that if we write this, and the error will disapear:
> >  properties:
> >    compatible:
> > -    - const: mediatek,mt8195-vdo1-rdma
> > +    items:
> > +      - const: mediatek,mt8195-vdo1-rdma
> > 
> > But from Krzysztof's review[1], he adviced us to drop items.
> > 
> > Is there any suggsetion for this error or do we have any
> > misunderstanding?
> 
> The '-' is important.
> 
> compatible:
>   const: mediatek,mt8195-vdo1-rdma

Hello Rob,

Thanks for hint.
I will update this and resend.

BRs,
Rex

