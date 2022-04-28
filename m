Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14F512F3F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 11:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7590E10F995;
	Thu, 28 Apr 2022 09:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658C10F999
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:04:50 +0000 (UTC)
X-UUID: d5e5e1c15be14701b430ec2da8fe5c9b-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:69eef4ef-c1ba-4872-944b-ca2a8e8aa176, OB:0,
 LO
 B:20,IP:0,URL:8,TC:0,Content:7,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:69
X-CID-INFO: VERSION:1.1.4, REQID:69eef4ef-c1ba-4872-944b-ca2a8e8aa176, OB:0,
 LOB:
 20,IP:0,URL:8,TC:0,Content:7,EDM:0,RT:0,SF:54,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:69
X-CID-META: VersionHash:faefae9, CLOUDID:54cdcec6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:ad54640fc53c,Recheck:0,SF:28|16|19|48,TC:nil,Content:4,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: d5e5e1c15be14701b430ec2da8fe5c9b-20220428
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875380680; Thu, 28 Apr 2022 17:04:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:04:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:04:44 +0800
Message-ID: <294e27863c250287ca2a8a9a65465b88b99d95fb.camel@mediatek.com>
Subject: Re: [PATCH v3, 1/1] drm/mediatek: add lut diff flag for new gamma
 hardware support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Apr 2022 17:04:44 +0800
In-Reply-To: <ca8309f7fcfe0a307ec465f082361a3d9842d1ec.camel@mediatek.com>
References: <20220428070403.12968-1-yongqiang.niu@mediatek.com>
 <20220428070403.12968-2-yongqiang.niu@mediatek.com>
 <ca8309f7fcfe0a307ec465f082361a3d9842d1ec.camel@mediatek.com>
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
Cc: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-04-28 at 16:35 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2022-04-28 at 15:04 +0800, Yongqiang Niu wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com
> > >
> > 
> > mt8183 gamma module usage is different with before soc,
> > gamma odd(index start from 0) lut value set to hardware
> > register should be
> > the difference of current lut value with last lut value.
> > 
> > for example, chrome os user space set lut
> > like this(only r chanel for example):
> > 2 4 6 8 10 12.
> > 1) mt8183 gamma driver should set the gamma lut to hardware
> > register like this:
> > 2 [2] 6 [8] 10 [2]
> 
> I don't know why you do not modify this to
> 
> 2 [2] 6 [2] 10 [2]
> 
> With this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

this is a type error, fixed in v4
> 
> 
> > the value with [] is the difference value
> > 2)gamma hardware process display data with original lut
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 +++++++++++++++++++
> > ----
> >  3 files changed, 30 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > index f46d4ab73d6a..0f9d7efb61d7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > @@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> >  
> >  	if (aal->data && aal->data->has_gamma)
> > -		mtk_gamma_set_common(aal->regs, state);
> > +		mtk_gamma_set_common(aal->regs, state, false);
> >  }
> >  
> >  void mtk_aal_start(struct device *dev)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 86c3068894b1..3380651c6707 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,7 +51,7 @@ void mtk_gamma_config(struct device *dev,
> > unsigned
> > int w,
> >  		      unsigned int h, unsigned int vrefresh,
> >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state);
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff);
> >  void mtk_gamma_start(struct device *dev);
> >  void mtk_gamma_stop(struct device *dev);
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index 3a5815ab4079..bbd558a036ec 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -27,6 +27,7 @@
> >  
> >  struct mtk_disp_gamma_data {
> >  	bool has_dither;
> > +	bool lut_diff;
> >  };
> >  
> >  /*
> > @@ -53,12 +54,13 @@ void mtk_gamma_clk_disable(struct device *dev)
> >  	clk_disable_unprepare(gamma->clk);
> >  }
> >  
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state)
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff)
> >  {
> >  	unsigned int i, reg;
> >  	struct drm_color_lut *lut;
> >  	void __iomem *lut_base;
> >  	u32 word;
> > +	u32 diff[3] = {0};
> >  
> >  	if (state->gamma_lut) {
> >  		reg = readl(regs + DISP_GAMMA_CFG);
> > @@ -67,9 +69,20 @@ void mtk_gamma_set_common(void __iomem *regs,
> > struct drm_crtc_state *state)
> >  		lut_base = regs + DISP_GAMMA_LUT;
> >  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> >  		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > -			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) <<
> > 20) +
> > -				(((lut[i].green >> 6) & LUT_10BIT_MASK)
> > << 10) +
> > -				((lut[i].blue >> 6) & LUT_10BIT_MASK);
> > +
> > +			if (!lut_diff || (i % 2 == 0)) {
> > +				word = (((lut[i].red >> 6) &
> > LUT_10BIT_MASK) << 20) +
> > +					(((lut[i].green >> 6) &
> > LUT_10BIT_MASK) << 10) +
> > +					((lut[i].blue >> 6) &
> > LUT_10BIT_MASK);
> > +			} else {
> > +				diff[0] = (lut[i].red >> 6) - (lut[i -
> > 1].red >> 6);
> > +				diff[1] = (lut[i].green >> 6) - (lut[i
> > - 1].green >> 6);
> > +				diff[2] = (lut[i].blue >> 6) - (lut[i -
> > 1].blue >> 6);
> > +
> > +				word = ((diff[0] & LUT_10BIT_MASK) <<
> > 20) +
> > +					((diff[1] & LUT_10BIT_MASK) <<
> > 10) +
> > +					(diff[2] & LUT_10BIT_MASK);
> > +			}
> >  			writel(word, (lut_base + i * 4));
> >  		}
> >  	}
> > @@ -78,8 +91,12 @@ void mtk_gamma_set_common(void __iomem *regs,
> > struct drm_crtc_state *state)
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state)
> >  {
> >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > +	bool lut_diff = false;
> > +
> > +	if (gamma->data)
> > +		lut_diff = gamma->data->lut_diff;
> >  
> > -	mtk_gamma_set_common(gamma->regs, state);
> > +	mtk_gamma_set_common(gamma->regs, state, lut_diff);
> >  }
> >  
> >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > @@ -176,10 +193,15 @@ static const struct mtk_disp_gamma_data
> > mt8173_gamma_driver_data = {
> >  	.has_dither = true,
> >  };
> >  
> > +static const struct mtk_disp_gamma_data mt8183_gamma_driver_data =
> > {
> > +	.lut_diff = true,
> > +};
> > +
> >  static const struct of_device_id mtk_disp_gamma_driver_dt_match[]
> > =
> > {
> >  	{ .compatible = "mediatek,mt8173-disp-gamma",
> >  	  .data = &mt8173_gamma_driver_data},
> > -	{ .compatible = "mediatek,mt8183-disp-gamma"},
> > +	{ .compatible = "mediatek,mt8183-disp-gamma",
> > +	  .data = &mt8183_gamma_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> 
> 

