Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C100840D1E9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 05:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340B66EA94;
	Thu, 16 Sep 2021 03:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DF26EA94
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 03:05:19 +0000 (UTC)
X-UUID: 32a18a05b87c409e9717969d6a02d5c2-20210916
X-UUID: 32a18a05b87c409e9717969d6a02d5c2-20210916
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 299611125; Thu, 16 Sep 2021 11:05:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 11:05:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 11:05:06 +0800
Message-ID: <607a9a1a0269db8934e8d18940bc25c52a8c60d0.camel@mediatek.com>
Subject: Re: [PATCH v5 04/16] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 11:05:06 +0800
In-Reply-To: <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-5-nancy.lin@mediatek.com>
 <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the review.

On Wed, 2021-09-08 at 00:06 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年9月6日 週一 下午3:15寫道：
> > 
> > Add vdosys1 reset control bit for MT8195 platform.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8195-resets.h
> > b/include/dt-bindings/reset/mt8195-resets.h
> > index a26bccc8b957..eaaa882c09bd 100644
> > --- a/include/dt-bindings/reset/mt8195-resets.h
> > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > @@ -26,4 +26,16 @@
> > 
> >  #define MT8195_TOPRGU_SW_RST_NUM               16
> > 
> > +/* VDOSYS1 */
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC 25
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC 26
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC 27
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC 28
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC 29
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC 51
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC 52
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC 53
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC 54
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC 55
> 
> Maybe you should align the indent style with TOPRGU.
> 
> Regards,
> Chun-Kuang.
> 
OK, I will modify it in the next revision.

Regards,
Nancy Lin

> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> > --
> > 2.18.0
> > 

