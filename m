Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36812E544
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812986E088;
	Thu,  2 Jan 2020 10:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF3D789715
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 07:01:40 +0000 (UTC)
X-UUID: 6d68b873afc64aa59e6a0199438765db-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=In6OwDT/YxJiEkeYl7SpJiR0aYr+OGSpKakTOdvs2lk=; 
 b=YUkiflPGEm4wImhJkdA9cRkGXUVtkBJjO+Psmd2HhUHTCR/rlikevJe8w3XQMX3Fh/K8ZvXCq3OmxgFayb5VB9Ih5abwFnmVBPcUoCX3qQycpw4A3CPuo0LqkG3M5j+EOEle4GlpMuMdmEU+bTmtPUfoVh2aTQ9OL7snHXUa3PI=;
X-UUID: 6d68b873afc64aa59e6a0199438765db-20200102
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 296047620; Thu, 02 Jan 2020 15:01:37 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 2 Jan 2020 15:01:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 15:01:59 +0800
Message-ID: <1577948404.15116.18.camel@mhfsdcap03>
Subject: Re: [PATCH v6, 02/14] drm/mediatek: move dsi/dpi select input into
 mtk_ddp_sel_in
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 2 Jan 2020 15:00:04 +0800
In-Reply-To: <1577947234.4925.2.camel@mtksdaap41>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-3-git-send-email-yongqiang.niu@mediatek.com>
 <1577941388.24650.2.camel@mtksdaap41> <1577943579.15116.1.camel@mhfsdcap03>
 <1577944949.32066.1.camel@mtksdaap41> <1577946073.15116.8.camel@mhfsdcap03>
 <1577947234.4925.2.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-01-02 at 14:40 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2020-01-02 at 14:21 +0800, Yongqiang Niu wrote:
> > On Thu, 2020-01-02 at 14:02 +0800, CK Hu wrote:
> > > Hi, Yongqiang:
> > > 
> > > On Thu, 2020-01-02 at 13:39 +0800, Yongqiang Niu wrote:
> > > > On Thu, 2020-01-02 at 13:03 +0800, CK Hu wrote:
> > > > > Hi, Yongqiang:
> > > > > 
> > > > > On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > > > > > move dsi/dpi select input into mtk_ddp_sel_in
> > > > > > 
> > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 10 ++++++----
> > > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > index 39700b9..91c9b19 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > @@ -376,6 +376,12 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > > > > >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > > > > >  		*addr = DISP_REG_CONFIG_DSI_SEL;
> > > > > >  		value = DSI_SEL_IN_BLS;
> > > > > > +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > > > > > +		*addr = DISP_REG_CONFIG_DSI_SEL;
> > > > > > +		value = DSI_SEL_IN_RDMA;
> > > > > 
> > > > > In original code, this is set when cur == DDP_COMPONENT_BLS and next ==
> > > > > DDP_COMPONENT_DPI0. Why do you change the condition?
> > > > > 
> > > > > Regards,
> > > > > CK
> > > > 
> > > > if bls connect with dpi0, rdma1 should connect with dsi0, the condition
> > > > is same with before.
> > > 
> > > You suggest that two crtcs are both enabled. If only one crtc is
> > > enabled, just one of these two would be set.
> > > 
> > > Regards,
> > > CK
> > 
> > OK, i will modify like this
> > else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > 		*addr = DISP_REG_CONFIG_DSI_SEL;
> > 		value = DPI_SEL_IN_RDMA;
> > 	}
> > in mtk_ddp_sel_in.
> > 
> > don't set DISP_REG_CONFIG_DPI_SEL to DPI_SEL_IN_BLS anymore, because
> > DPI_SEL_IN_BLS is zero, it is same with hardware default setting.
> 
> In Bibby's case, there is only the path from BLS to DPI0 and has no path
> from RDMA1 to DSI0, but it need to set these two register. Maybe its
> setting is just for some SoC, so you may use the compatible name to
> judge how to set this two register.
> 
> Regards,
> CK
> 

it the original use case, if bls->dpi0, it set 3 register,
DISP_REG_CONFIG_DPI_SEL set to DPI_SEL_IN_BLS ,and this is 
0, so this is useless setting.

then are only 2 useful setting.
in this patch i have upload, i keep DISP_REG_CONFIG_OUT_SEL
still in mtk_ddp_sout_sel.
and only move DISP_REG_CONFIG_DSI_SEL into mtk_ddp_sel_in.
i suppose this is enough for this use case.
and no need compatible name to control this.
please double confirm.

and there will more and more SOC upstream in the future.
these function will be more complex.
there should be coding one more suitable function to 
handle these connection

> > > 
> > > > > 
> > > > > > +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > > > > > +		*addr = DISP_REG_CONFIG_DPI_SEL;
> > > > > > +		value = DPI_SEL_IN_BLS;
> > > > > >  	} else {
> > > > > >  		value = 0;
> > > > > >  	}
> > > > > > @@ -393,10 +399,6 @@ static void mtk_ddp_sout_sel(struct regmap *config_regs,
> > > > > >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > > > > >  		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> > > > > >  				BLS_TO_DPI_RDMA1_TO_DSI);
> > > > > > -		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> > > > > > -				DSI_SEL_IN_RDMA);
> > > > > > -		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> > > > > > -				DPI_SEL_IN_BLS);
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
