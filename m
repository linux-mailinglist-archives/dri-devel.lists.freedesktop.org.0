Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66208520AD1
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 03:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4710ED81;
	Tue, 10 May 2022 01:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D2610ED81
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 01:46:34 +0000 (UTC)
X-UUID: 9a9c86386abe48a29363a21d2e2f2da0-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:86441fe8-1ef3-4cda-9e25-0900167e945e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:40952fb3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9a9c86386abe48a29363a21d2e2f2da0-20220510
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 446814698; Tue, 10 May 2022 09:46:29 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 09:46:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 09:46:27 +0800
Message-ID: <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Date: Tue, 10 May 2022 09:46:26 +0800
In-Reply-To: <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
 <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 "airlied@linux.ie" <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-09 at 18:50 +0800, AngeloGioacchino Del Regno wrote:
> Il 09/05/22 12:44, Krzysztof Kozlowski ha scritto:
> > On 09/05/2022 10:54, Rex-BC Chen wrote:
> > > > > +    soc {
> > > > > +        #address-cells = <2>;
> > > > > +        #size-cells = <2>;
> > > > > +
> > > > > +        disp_ethdr@1c114000 {
> > > > 
> > > > No underscores in node name. Generic node names, so display-
> > > > controller?
> > > > 
> > > 
> > > OK, we will change the node name to ethdr like in dts
> > > like this:
> > > ethdr0: ethdr@1c114000 {
> > > ...
> > > }
> > 
> > Is "ethdr" a generic name? Is it an abbreviation of "EnergyTrace™
> > High
> > Dynamic Range"? If yes, it also looks specific to Texas
> > Instruments...
> > 
> > Best regards,
> > Krzysztof
> 
> 
> That's mediatek-drm, and this refers to the HDR block in the display
> IP...
> 
> Though, I have no idea of what "ET" stands for in "ETHDR", so, it
> would be
> definitely nice if MediaTek can write the meaning in the description,
> like
> 
> description:
>    ETHDR (E??? T??? High Dynamic Range) is designed for HDR video and
> ...blah
> 
> Cheers,
> Angelo

Hello Krzysztof and Angelo,

"ET" is actually meaningless.
ET is one of mediatek departments and it's where the engine from.
Therefore, I think we will add description like this:
> ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and
> designed for HDR video...

BRs,
Rex

