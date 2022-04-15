Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34E50268E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1C710ECA2;
	Fri, 15 Apr 2022 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2BA10E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 08:13:27 +0000 (UTC)
X-UUID: 8abe4c720f0946c484fbce4e5ca84cf0-20220415
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2c2c4a2e-b4d2-4e51-83d6-68e165bf66ee, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:154e3ea9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8abe4c720f0946c484fbce4e5ca84cf0-20220415
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1508866549; Fri, 15 Apr 2022 16:13:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 16:13:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 16:13:20 +0800
Message-ID: <9b6a3c4b403d15c08f5c4693549fadde50f5bca3.camel@mediatek.com>
Subject: Re: [PATCH v18 08/10] soc: mediatek: add DDP_DOMPONENT_DITHER0 enum
 for mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 15 Apr 2022 16:13:20 +0800
In-Reply-To: <542a3946c33b4a2e7cbb160f0e3bd4479a863ddb.camel@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
 <20220412103114.19922-9-jason-jh.lin@mediatek.com>
 <542a3946c33b4a2e7cbb160f0e3bd4479a863ddb.camel@mediatek.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "fshao@chromium.org" <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Singo Chang =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?=
 <Singo.Chang@mediatek.com>,
 Roy-CW Yeh =?UTF-8?Q?=28=E8=91=89=E4=B8=AD=E7=91=8B=29?=
 <Roy-CW.Yeh@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Moudy Ho =?UTF-8?Q?=28=E4=BD=95=E5=AE=97=E5=8E=9F=29?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rex,

Thank for the reviews.

On Fri, 2022-04-15 at 14:24 +0800, Rex-BC Chen wrote:
> On Tue, 2022-04-12 at 18:31 +0800, jason-jh.lin wrote:
> > The mmsys routing table of mt8195 vdosys0 has 2 DITHER components,
> > so mmsys need to add DDP_COMPONENT_DITHER1 and change all usages of
> > DITHER enum form DDP_COMPONENT_DITHER to DDP_COMPONENT_DITHER0.
> > 
> > But its header need to keep DDP_COMPONENT_DITHER enum
> > until drm/mediatek also changed it.
> 
> Hello Jason,
> 
> IMO, it's strange.
> In this case , I think you sholud squash [v18,08/10] and [v18,09/10].
> Therefore, you don't need to describe this here.
> 

As the CK reply before:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220407030409.9664-4-jason-jh.lin@mediatek.com/#24806029

[v18,08/10] and [v18,09/10] belong to 2 different trees, so I add the
description here.

Regards,
Jason-JH.Lin


> BRs,
> Rex
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

