Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE135BF47
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9CD89B98;
	Mon, 12 Apr 2021 09:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A257189B98
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:05:44 +0000 (UTC)
X-UUID: 1cb2bca09a7548af8b5375aa339b30e2-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nxVXVJ8vQJsktVMC5IOMAtKUWuGPOhkaTBIlEw7fk0U=; 
 b=Xb4/2VUro+JRUF8tk0V9W9R49T9NxidfcrH1w2YAWu4OfyyISxBAkFAOpX2rysyJx783Vjfe6iPZIirUo6EfkwcKCRHJrrbULIHcLbJuJqfl0LEMLbvHWSH+Y0c1JhrzTYizvmuZ9flwyPxkeXtpG1wWb/YWO9xM4RJnylRxygA=;
X-UUID: 1cb2bca09a7548af8b5375aa339b30e2-20210412
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 290505175; Mon, 12 Apr 2021 17:05:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 17:05:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 17:05:29 +0800
Message-ID: <1618218330.16010.13.camel@mtksdaap41>
Subject: Re: [PATCH v1, 3/3] drm/mediatek: gamma set with cmdq
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Mon, 12 Apr 2021 17:05:30 +0800
In-Reply-To: <1618217129.9080.5.camel@mhfsdcap03>
References: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618209347-10816-4-git-send-email-yongqiang.niu@mediatek.com>
 <1618216127.12699.4.camel@mtksdaap41> <1618217129.9080.5.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC4AE128241CC894884240A6A99D87BA6FE31408A987B06BD2CFC36BD64511392000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Mon, 2021-04-12 at 16:45 +0800, Yongqiang Niu wrote:
> On Mon, 2021-04-12 at 16:28 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Mon, 2021-04-12 at 14:35 +0800, Yongqiang Niu wrote:
> > > gamma lut set in vsync active will caused display flash issue
> > > set gamma lut with cmdq 
> > 
> > In MT8173, it's ok to set gammma out of vblank period. Why do you
> > setting gamma in vblank in this patch?
> > 
> > Regards,
> > CK
> > 
> 
> mtk drm driver code has changed many since mt8173, there is no one test
> this in the newest version for mt8173.
> 
> and this issue is random.
> https://partnerissuetracker.corp.google.com/u/1/issues/153842418
> 
> and not all platform will set gamma lut.
> some project platform will not set gamma lut from chrome os
> (crhome os set gamma lut may be with some special panel, like AUO
> B116XTN02.3 in
> https://partnerissuetracker.corp.google.com/u/1/issues/153842418
> )
> 


I could not see the page in partnelissuetracker, If this patch fix some
bug, describe the bug in commit message. It's better that information
include how to reproduce this bug and what kind of error happen. More
information would help us to understand why setting in vblank would fix
this bug.

Regards,
CK

> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  4 ++--
> > >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  7 ++++---
> > >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 11 ++++++-----
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 +++++++++++-------
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++++---
> > >  5 files changed, 28 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > index 64b4528..c8e178e 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > @@ -59,12 +59,12 @@ void mtk_aal_config(struct device *dev, unsigned int w,
> > >  	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
> > >  }
> > >  
> > > -void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
> > > +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> > >  
> > >  	if (aal->data && aal->data->has_gamma)
> > > -		mtk_gamma_set_common(aal->regs, state);
> > > +		mtk_gamma_set_common(aal->regs, &aal->cmdq_reg, state, cmdq_pkt);
> > >  }
> > >  
> > >  void mtk_aal_start(struct device *dev)
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > index 86c3068..c2e7dcb 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > @@ -14,7 +14,7 @@
> > >  void mtk_aal_config(struct device *dev, unsigned int w,
> > >  		    unsigned int h, unsigned int vrefresh,
> > >  		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > > -void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
> > > +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_aal_start(struct device *dev);
> > >  void mtk_aal_stop(struct device *dev);
> > >  
> > > @@ -50,8 +50,9 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > >  		      unsigned int h, unsigned int vrefresh,
> > >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > > -void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
> > > -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
> > > +void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > > +void mtk_gamma_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +			  struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_gamma_start(struct device *dev);
> > >  void mtk_gamma_stop(struct device *dev);
> > >  
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > index 3ebf91e..99a4ff3 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > @@ -55,7 +55,8 @@ void mtk_gamma_clk_disable(struct device *dev)
> > >  	clk_disable_unprepare(gamma->clk);
> > >  }
> > >  
> > > -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
> > > +void mtk_gamma_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +			  struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	unsigned int i, reg;
> > >  	struct drm_color_lut *lut;
> > > @@ -65,23 +66,23 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
> > >  	if (state->gamma_lut) {
> > >  		reg = readl(regs + DISP_GAMMA_CFG);
> > >  		reg = reg | GAMMA_LUT_EN;
> > > -		writel(reg, regs + DISP_GAMMA_CFG);
> > > +		mtk_ddp_write(cmdq_pkt, reg, cmdq_reg, regs, DISP_GAMMA_CFG);
> > >  		lut_base = regs + DISP_GAMMA_LUT;
> > >  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> > >  		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > >  			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
> > >  				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
> > >  				((lut[i].blue >> 6) & LUT_10BIT_MASK);
> > > -			writel(word, (lut_base + i * 4));
> > > +			mtk_ddp_write(cmdq_pkt, word, cmdq_reg, regs, (lut_base + i * 4));
> > >  		}
> > >  	}
> > >  }
> > >  
> > > -void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
> > > +void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > >  
> > > -	mtk_gamma_set_common(gamma->regs, state);
> > > +	mtk_gamma_set_common(gamma->regs, &gamma->cmdq_reg, state, cmdq_pkt);
> > >  }
> > >  
> > >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 8b0de90..73428f0 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -423,6 +423,15 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
> > >  		}
> > >  		mtk_crtc->pending_async_planes = false;
> > >  	}
> > > +
> > > +	if (crtc->state->color_mgmt_changed) {
> > > +		int i;
> > > +
> > > +		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> > > +			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state, cmdq_handle);
> > > +			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > +		}
> > > +	}
> > >  }
> > >  
> > >  static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> > > @@ -464,7 +473,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > >  	if (mtk_crtc->cmdq_client) {
> > >  		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> > > -		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> > > +		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, 2 * PAGE_SIZE);
> > >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > >  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
> > >  		mtk_crtc_ddp_config(crtc, cmdq_handle);
> > > @@ -616,15 +625,10 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  				      struct drm_atomic_state *state)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > -	int i;
> > >  
> > >  	if (mtk_crtc->event)
> > >  		mtk_crtc->pending_needs_vblank = true;
> > > -	if (crtc->state->color_mgmt_changed)
> > > -		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> > > -			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > -			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > -		}
> > > +
> > >  	mtk_drm_crtc_hw_config(mtk_crtc);
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > index bb914d9..bffa58d 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > @@ -60,7 +60,8 @@ struct mtk_ddp_comp_funcs {
> > >  			     struct mtk_plane_state *state,
> > >  			     struct cmdq_pkt *cmdq_pkt);
> > >  	void (*gamma_set)(struct device *dev,
> > > -			  struct drm_crtc_state *state);
> > > +			  struct drm_crtc_state *state,
> > > +			  struct cmdq_pkt *cmdq_pkt);
> > >  	void (*bgclr_in_on)(struct device *dev);
> > >  	void (*bgclr_in_off)(struct device *dev);
> > >  	void (*ctm_set)(struct device *dev,
> > > @@ -160,10 +161,11 @@ static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
> > >  }
> > >  
> > >  static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
> > > -				     struct drm_crtc_state *state)
> > > +				     struct drm_crtc_state *state,
> > > +				     struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	if (comp->funcs && comp->funcs->gamma_set)
> > > -		comp->funcs->gamma_set(comp->dev, state);
> > > +		comp->funcs->gamma_set(comp->dev, state, cmdq_pkt);
> > >  }
> > >  
> > >  static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp)
> > 
> > 
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
