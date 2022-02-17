Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0304B986F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 06:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01BF10E6F3;
	Thu, 17 Feb 2022 05:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0079210E6F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 05:50:51 +0000 (UTC)
X-UUID: c97c01fab3374cb68e55ce739edce8c7-20220217
X-UUID: c97c01fab3374cb68e55ce739edce8c7-20220217
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1612914765; Thu, 17 Feb 2022 13:50:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 13:50:47 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 13:50:46 +0800
Message-ID: <73de8a9631b771cc153996f2921f67fcae306452.camel@mediatek.com>
Subject: Re: [1/3] drm/mediatek: Adjust the timing of mipi signal from LP00
 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Thu, 17 Feb 2022 13:50:57 +0800
In-Reply-To: <41af2aa3b3a39d32e409ec355e59c5f8b1e47f43.camel@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
 <1644589818-13066-2-git-send-email-xinlei.lee@mediatek.com>
 <41af2aa3b3a39d32e409ec355e59c5f8b1e47f43.camel@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-14 at 10:54 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Fri, 2022-02-11 at 22:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to cooperate with patch 3/3 modification,it is necessary
> > to
> > adjust 
> > the position where mipi pulls up the signal.
> 
> After the patch is applied, the series index (3/3) is disappear, so
> do
> not reference series index in commit description. I think this series
> is to adjust the calling sequence, so you could describe as below:
> 
> Old sequence:
> 1. aaa
> 2. bbb
> 3. ccc
> 4. ddd
> 
> New sequence:
> 1. bbb
> 2. aaa
> 3. ddd
> 4. ccc
> 
> and this patch is to adjust 'aaa' and 'bbb'.
> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 5d90d2eb..6d7b66d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -649,14 +649,14 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_phy_timconfig(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_ps_control_vact(dsi);
> >  	mtk_dsi_set_vm_cmd(dsi);
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > +	mtk_dsi_rxtx_control(dsi);
> > +	usleep_range(30, 100);
> > +	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_clk_ulp_mode_leave(dsi);
> >  	mtk_dsi_lane0_ulp_mode_leave(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 0);
> 
> 

Hi CK:

Thanks for your review!
I will be sending out v2 in the near future based on your suggestion.

Best Regards!
xinlei

