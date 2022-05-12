Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7E524260
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 04:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A241810FD9A;
	Thu, 12 May 2022 02:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987CE10FD9B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 02:17:23 +0000 (UTC)
X-UUID: 38bad96f08784a6dbe8b891d503dcfd8-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:88662ae9-b318-41d5-b1c9-794f7582badc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f9038827-a01c-4223-8f5a-12d972216e7b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 38bad96f08784a6dbe8b891d503dcfd8-20220512
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1879245854; Thu, 12 May 2022 10:17:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 10:17:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:17:17 +0800
Message-ID: <fa24a94aaab6f7d38585b454f9f05171873672a3.camel@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 12 May 2022 10:17:17 +0800
In-Reply-To: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
 <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
 <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 "xinlei.lee" <xinlei.lee@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-11 at 09:36 -0500, Rob Herring wrote:
> On Wed, May 11, 2022 at 2:24 AM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
> > >  .../display/mediatek/mediatek,dsi.yaml        | 115
> > > ++++++++++++++++++
> > >  2 files changed, 115 insertions(+), 62 deletions(-)
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > > xt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > > aml
> 
> [...]
> 
> > Hello Rob and Krzysztof,
> > 
> > Can you give us some suggestions for this conversion patch?
> > Thanks!
> 
> You can check status for yourself by looking at PW[1] where you will
> see the review queue is currently ~120 patches and goes back to 5/3.
> If it is in the queue, I will get to it.
> 
> Rob
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

Hello Rob,

Got it.
Thanks for your effort.
I will look at this next time before I send remind mail.

BRs,
Rex

