Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD65244D1
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 07:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7714410F2B8;
	Thu, 12 May 2022 05:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B0D10F2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 05:20:57 +0000 (UTC)
X-UUID: 05a963d5010b4ed7b551a932eab6e22f-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7afa0bea-c8fe-4450-8bd7-a08ed1d96a38, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:082427f6-13a6-4067-b017-3b2864319134,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 05a963d5010b4ed7b551a932eab6e22f-20220512
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1162334074; Thu, 12 May 2022 13:20:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 13:20:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 12 May 2022 13:20:51 +0800
Message-ID: <a7d3f0d90e45e7845735663d07a8c505113fd789.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] drm/mediatek: fixup crtc event null pointer issue
From: CK Hu <ck.hu@mediatek.com>
To: yongqiang.niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Thu, 12 May 2022 13:20:51 +0800
In-Reply-To: <07e3873240945e8f352ba252c0b9ca727a1a3c2e.camel@mediatek.com>
References: <20220314074239.28507-1-yongqiang.niu@mediatek.com>
 <20220314074239.28507-2-yongqiang.niu@mediatek.com>
 <9f14d6a0aa782a8f6c3e7044fe90d74b80d17ed0.camel@mediatek.com>
 <07e3873240945e8f352ba252c0b9ca727a1a3c2e.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Wed, 2022-05-11 at 18:08 +0800, yongqiang.niu wrote:
> On Mon, 2022-03-28 at 17:34 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Mon, 2022-03-14 at 15:42 +0800, Yongqiang Niu wrote:
> > > if crtc event is null pointer, do not send vblank event
> > 
> > This is a bug-fix, so add a Fixes tag here.
> 
> Fixes tag will be added in next version.
> > 
> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index d661edf7e0fe..265fed446628 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -92,6 +92,9 @@ static void
> > > mtk_drm_crtc_finish_page_flip(struct
> > > mtk_drm_crtc *mtk_crtc)
> > >  	struct drm_crtc *crtc = &mtk_crtc->base;
> > >  	unsigned long flags;
> > >  
> > > +	if (!mtk_crtc->event)
> > > +		return;
> > > +
> > >  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> > >  	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
> > 
> > I think pending_needs_vblank is used to protect this situation. It
> > seems that pending_needs_vblank should be protected by critical
> > section.
> > 
> > Regards,
> > CK
> 
> actually, in the NG case pending_needs_vblank is true, but crtc-
> >event
> is null.

It looks like that other driver access an invalid address which store
mtk_crtc->event, so mediatek drm driver has no bug and we should fix
the bug from other driver. This work around does not fix bug but just
hide the bug. So try to fix this bug in other driver.

Regards,
CK

> 
> > 
> > >  	drm_crtc_vblank_put(crtc);
> > 
> > 
> 
> 

