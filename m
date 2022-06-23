Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FC556F7F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 02:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF3810F56D;
	Thu, 23 Jun 2022 00:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91D10F816
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:33:55 +0000 (UTC)
X-UUID: d13df2de05604eb8b86fd552c77312aa-20220623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:de69d7fa-212f-4b1b-bfa3-b6ca3a7a2bc0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:b14ad71, CLOUDID:fd993638-5e4b-44d7-80b2-bb618cb09d29,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: d13df2de05604eb8b86fd552c77312aa-20220623
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 628153997; Thu, 23 Jun 2022 08:33:47 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 23 Jun 2022 08:33:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 08:33:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 23 Jun 2022 08:33:46 +0800
Message-ID: <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mutex: add suffix 0 to
 DDP_COMPONENT_DITHER for mt8395
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Fabien Parent <fparent@baylibre.com>
Date: Thu, 23 Jun 2022 08:33:45 +0800
In-Reply-To: <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
References: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
 <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Yes, I missed that!
So just forget about this patch and use yours.

Thanks for your help :)

Regard,
Jason-JH.Lin

On Wed, 2022-06-22 at 15:31 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/06/22 15:19, Jason-JH.Lin ha scritto:
> > Add suffix 0 to DDP_COMPONENT_DITHER for mt8395.
> > 
> > Fixes: 141311b856d8 ("soc: mediatek: mutex: add MT8365 support")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> 
> Hello Jason-JH,
> 
> you must've missed my commit, sent two days ago, which is doing the
> same:
> 
> 
https://lore.kernel.org/lkml/20220620102454.131417-1-angelogioacchino.delregno@collabora.com/T/#u
> 
> Anyway, I have avoided to rename the definition, as from what I
> understand
> MT8365 has only one dither mod and that's called "DITHER", not
> "DITHER0"...
> ...but I've added the suffix to the array assignment, as that's what
> we have
> in the enumeration.
> 
> I think that #define MT8365_MUTEX_MOD_DISP_DITHER should be kept as-
> is.
> 
> Also... this commit is not fixing anything, as it was already working
> before,
> so the Fixes tag shouldn't be present.
> 
> Regards,
> Angelo
> 
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index fa8e0ba38803..3b25fd6b91aa 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -130,7 +130,7 @@
> >   #define MT8365_MUTEX_MOD_DISP_CCORR		13
> >   #define MT8365_MUTEX_MOD_DISP_AAL		14
> >   #define MT8365_MUTEX_MOD_DISP_GAMMA		15
> > -#define MT8365_MUTEX_MOD_DISP_DITHER		16
> > +#define MT8365_MUTEX_MOD_DISP_DITHER0		16
> >   #define MT8365_MUTEX_MOD_DISP_DSI0		17
> >   #define MT8365_MUTEX_MOD_DISP_PWM0		20
> >   #define MT8365_MUTEX_MOD_DISP_DPI0		22
> > @@ -358,7 +358,7 @@ static const unsigned int
> > mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >   	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
> >   	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
> >   	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> > -	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> > +	[DDP_COMPONENT_DITHER0] = MT8365_MUTEX_MOD_DISP_DITHER0,
> >   	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
> >   	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
> >   	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

