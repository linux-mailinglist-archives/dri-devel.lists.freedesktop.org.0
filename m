Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE759F3E7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B8610E02C;
	Wed, 24 Aug 2022 07:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B6F10E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 07:03:15 +0000 (UTC)
X-UUID: 817e3383a23a4584ae837f2ed3a7ef6a-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lMuQyAr9SlwVDP6/DkZQVoIxDjM1gUjXyVTKSSbx0n4=; 
 b=QIN7FJJ9Cuj31EkHxKfOGjGFxiFqjci2RDt0bJv8FvK4lhAMF/8riQs7kkZ/1nIUOB02wwDhQf4k1ISmY8SuxtRrg0/cmuYz+hiHBS2uvBciBULcu4Jk+MpKfv7mwLiIR37IabhOczVOJJ/FipZood/j1YLPe923wlzKwykalOY=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:e8d03e62-55a1-4936-88a8-c80778949b9e, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:54
X-CID-INFO: VERSION:1.1.10, REQID:e8d03e62-55a1-4936-88a8-c80778949b9e, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_H
 amU,ACTION:release,TS:54
X-CID-META: VersionHash:84eae18, CLOUDID:78d172cf-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:7848ef601297,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 817e3383a23a4584ae837f2ed3a7ef6a-20220824
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1320387441; Wed, 24 Aug 2022 15:03:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 15:03:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 15:03:06 +0800
Message-ID: <bd375bd58f41647687f993bc5db1eea5f4724c8a.camel@mediatek.com>
Subject: Re: [PATCH 2/3] drm/mediatek: Add gamma lut support for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 24 Aug 2022 15:03:06 +0800
In-Reply-To: <963274fe71207aabd18dcf4d4ef19b490453fcfd.camel@mediatek.com>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-3-zheng-yan.chen@mediatek.com>
 <963274fe71207aabd18dcf4d4ef19b490453fcfd.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-08-23 at 11:18 +0800, CK Hu wrote:
> Hi, Zheng-yan:
> 
> On Mon, 2022-08-22 at 17:19 +0800, zheng-yan.chen wrote:
> > Since the previous gamma_set_common() function is designed for
> > 9bit-to-10bit conversion, which is not feasible for the
> > 10bit-to-12bit conversion in mt8195.
> > 
> > Update the function to fit the need of mt8195.
> > 
> 
> Add Fixes tag [1].
> 
> [1] 
> https://www.kernel.org/doc/html/v5.19/process/submitting-patches.html
> 
> 
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  3 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 97 ++++++++++++++++-
> > --
> > --
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  5 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  2 +
> >  8 files changed, 83 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > index 0f9d7efb61d7..f46d4ab73d6a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > @@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> >  
> >  	if (aal->data && aal->data->has_gamma)
> > -		mtk_gamma_set_common(aal->regs, state, false);
> > +		mtk_gamma_set_common(aal->regs, state);
> >  }
> >  
> >  void mtk_aal_start(struct device *dev)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 33e61a136bbc..b662bf8b1c9d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,8 +51,9 @@ void mtk_gamma_clk_disable(struct device *dev);
> >  void mtk_gamma_config(struct device *dev, unsigned int w,
> >  		      unsigned int h, unsigned int vrefresh,
> >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > +unsigned int mtk_gamma_size(struct device *dev);
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff);
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state);
> >  void mtk_gamma_start(struct device *dev);
> >  void mtk_gamma_stop(struct device *dev);
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index bbd558a036ec..a842e5e1962e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -18,18 +18,26 @@
> >  #define DISP_GAMMA_EN				0x0000
> >  #define GAMMA_EN					BIT(0)
> >  #define DISP_GAMMA_CFG				0x0020
> > +#define RELAY_MODE					BIT(0)
> >  #define GAMMA_LUT_EN					BIT(1)
> >  #define GAMMA_DITHERING					BIT(2)
> >  #define DISP_GAMMA_SIZE				0x0030
> > +#define DISP_GAMMA_BANK				0x0100
> >  #define DISP_GAMMA_LUT				0x0700
> > -
> > +#define DISP_GAMMA_LUT1				0x0b00
> >  #define LUT_10BIT_MASK				0x03ff
> > -
> > +#define TABLE_9BIT_SIZE				512
> > +#define LUT_12BIT_MASK				0x0fff
> > +#define TABLE_10BIT_SIZE			1024
> > +#define BANK_SIZE				256
> >  struct mtk_disp_gamma_data {
> >  	bool has_dither;
> >  	bool lut_diff;
> > +	unsigned int lut_size;
> >  };
> >  
> > +static unsigned int now_lut_size;
> > +static bool now_lut_diff;
> 
> Don't use global variable.
> 
> >  /*
> >   * struct mtk_disp_gamma - DISP_GAMMA driver structure
> >   */
> > @@ -54,40 +62,73 @@ void mtk_gamma_clk_disable(struct device *dev)
> >  	clk_disable_unprepare(gamma->clk);
> >  }
> >  
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff)
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state)
> >  {
> > -	unsigned int i, reg;
> > -	struct drm_color_lut *lut;
> > +	unsigned int i, reg, idx;
> >  	void __iomem *lut_base;
> > -	u32 word;
> > -	u32 diff[3] = {0};
> > +	void __iomem *lut1_base;
> > +	u32 word, word1;
> >  
> >  	if (state->gamma_lut) {
> > +		u32 table_size;
> > +		u32 mask;
> > +		struct drm_color_lut color, even, odd;
> > +		struct drm_color_lut *lut = (struct drm_color_lut
> > *)state->gamma_lut;
> > +		bool lut_12bit = (now_lut_size == TABLE_10BIT_SIZE);
> > +
> >  		reg = readl(regs + DISP_GAMMA_CFG);
> > +		reg = reg & ~RELAY_MODE;
> 
> Why do you modify this for other SoC?
> 
> >  		reg = reg | GAMMA_LUT_EN;
> >  		writel(reg, regs + DISP_GAMMA_CFG);
> >  		lut_base = regs + DISP_GAMMA_LUT;
> > -		lut = (struct drm_color_lut *)state->gamma_lut->data;
> > -		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > +		lut1_base = regs + DISP_GAMMA_LUT1;
> > +		if (lut_12bit) {
> > +			table_size = TABLE_10BIT_SIZE;
> > +			mask = LUT_12BIT_MASK;
> 
> lut_bits and lut_size are independent factor, so use two variable in
> private data for each. And I like to use digital value instead of a
> symbol.
> 
> lut_bits = 10 or 12;
> lut_size = 512 or 1024;
> mask = GENMASK(lut_bits - 1, 0);
> 
> > +		} else {
> > +			table_size = TABLE_9BIT_SIZE;
> > +			mask = LUT_10BIT_MASK;
> > +		}
> >  
> > -			if (!lut_diff || (i % 2 == 0)) {
> > -				word = (((lut[i].red >> 6) &
> > LUT_10BIT_MASK) << 20) +
> > -					(((lut[i].green >> 6) &
> > LUT_10BIT_MASK) << 10) +
> > -					((lut[i].blue >> 6) &
> > LUT_10BIT_MASK);
> > +		for (i = 0; i < table_size; i++) {
> > +			if (!(i % BANK_SIZE) && lut_12bit)
> > +				writel((i / BANK_SIZE), regs +
> > DISP_GAMMA_BANK);
> 
> Group register writing together, so move this to bottom of this for-
> loop.
> 
> > +
> > +			color.red = (lut[i].red >> 6) & mask;
> > +			color.green = (lut[i].green >> 6) & mask;
> > +			color.blue = (lut[i].blue >> 6) & mask;
> 
> Why shift 6 bits for lut 12 bits?
> 
> > +			if ((i % 2) && now_lut_diff) {
> 
> In original code, !lut_diff is first, so I would like you to keep
> this
> order.
> 
> > +				odd = color;
> > +				word = (lut_12bit) ? (((odd.green -
> > even.green) << 12) +
> > +						      (odd.red -
> > even.red))
> > +						   : (((odd.red -
> > even.red) << 20) +
> > +						      ((odd.green -
> > even.green) << 10) +
> > +						      (odd.blue -
> > even.blue));
> > +				word1 = (odd.blue - even.blue);
> 
> I think it's not necessary to create odd and even variable. 
> 
> Regards,
> CK
> 
> >  			} else {
> > -				diff[0] = (lut[i].red >> 6) - (lut[i -
> > 1].red >> 6);
> > -				diff[1] = (lut[i].green >> 6) - (lut[i
> > - 1].green >> 6);
> > -				diff[2] = (lut[i].blue >> 6) - (lut[i -
> > 1].blue >> 6);
> > -
> > -				word = ((diff[0] & LUT_10BIT_MASK) <<
> > 20) +
> > -					((diff[1] & LUT_10BIT_MASK) <<
> > 10) +
> > -					(diff[2] & LUT_10BIT_MASK);
> > +				even = color;
> > +				word =  (lut_12bit) ? ((even.green <<
> > 12) + even.red)
> > +						    : ((even.red << 20)
> > +
> > +						       (even.green <<
> > 10) + even.blue);
> > +				word1 = even.blue;
> >  			}
> > -			writel(word, (lut_base + i * 4));
> > +			idx = (lut_12bit) ? (i % BANK_SIZE) : i;
> > +			writel(word, (lut_base + idx * 4));
> > +			if (lut_12bit)
> > +				writel(word1, (lut1_base + idx * 4));
> >  		}
> >  	}
> >  }
> >  
> > +unsigned int mtk_gamma_size(struct device *dev)
> > +{
> > +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > +
> > +	if (gamma->data)
> > +		return gamma->data->lut_size;
> > +	else
> > +		return 0;
> > +}
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state)
> >  {
> >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > @@ -95,8 +136,7 @@ void mtk_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> >  
> >  	if (gamma->data)
> >  		lut_diff = gamma->data->lut_diff;
> > -
> > -	mtk_gamma_set_common(gamma->regs, state, lut_diff);
> > +	mtk_gamma_set_common(gamma->regs, state);
> >  }
> >  
> >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > @@ -178,6 +218,8 @@ static int mtk_disp_gamma_probe(struct
> > platform_device *pdev)
> >  	ret = component_add(dev, &mtk_disp_gamma_component_ops);
> >  	if (ret)
> >  		dev_err(dev, "Failed to add component: %d\n", ret);
> > +	now_lut_size = priv->data->lut_size;
> > +	now_lut_diff = priv->data->lut_diff;
> >  
> >  	return ret;
> >  }
> > @@ -191,10 +233,17 @@ static int mtk_disp_gamma_remove(struct
> > platform_device *pdev)
> >  
> >  static const struct mtk_disp_gamma_data mt8173_gamma_driver_data =
> > {
> >  	.has_dither = true,
> > +	.lut_size = 512,
> >  };
> >  
> >  static const struct mtk_disp_gamma_data mt8183_gamma_driver_data =
> > {
> >  	.lut_diff = true,
> > +	.lut_size = 512,
> > +};
> > +
> > +static const struct mtk_disp_gamma_data mt8195_gamma_driver_data =
> > {
> > +	.lut_diff = true,
> > +	.lut_size = 1024,
> >  };
> >  
> >  static const struct of_device_id mtk_disp_gamma_driver_dt_match[]
> > =
> > {
> > @@ -202,6 +251,8 @@ static const struct of_device_id
> > mtk_disp_gamma_driver_dt_match[] = {
> >  	  .data = &mt8173_gamma_driver_data},
> >  	{ .compatible = "mediatek,mt8183-disp-gamma",
> >  	  .data = &mt8183_gamma_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-gamma",
> > +	  .data = &mt8195_gamma_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 42cc7052b050..2a6513259562 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -930,9 +930,8 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >  		mtk_crtc->ddp_comp[i] = comp;
> >  
> >  		if (comp->funcs) {
> > -			if (comp->funcs->gamma_set)
> > -				gamma_lut_size = MTK_LUT_SIZE;
> > -
> > +			if (comp->funcs->gamma_set && comp->funcs-
> > > gamma_size)
> > 
> > +				gamma_lut_size = comp->funcs-
> > > gamma_size(comp->dev);
> > 
> >  			if (comp->funcs->ctm_set)
> >  				has_ctm = true;
> >  		}
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > index cb9a36c48d4f..1799853ef89a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > @@ -10,7 +10,6 @@
> >  #include "mtk_drm_ddp_comp.h"
> >  #include "mtk_drm_plane.h"
> >  
> > -#define MTK_LUT_SIZE	512
> >  #define MTK_MAX_BPC	10
> >  #define MTK_MIN_BPC	3
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 2d72cc5ddaba..4c6538a17b88 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -323,6 +323,7 @@ static const struct mtk_ddp_comp_funcs
> > ddp_gamma
> > = {
> >  	.clk_enable = mtk_gamma_clk_enable,
> >  	.clk_disable = mtk_gamma_clk_disable,
> >  	.gamma_set = mtk_gamma_set,
> > +	.gamma_size = mtk_gamma_size,
> >  	.config = mtk_gamma_config,
> >  	.start = mtk_gamma_start,
> >  	.stop = mtk_gamma_stop,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 2d0052c23dcb..bf0cf7f86010 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -59,6 +59,7 @@ struct mtk_ddp_comp_funcs {
> >  	void (*disable_vblank)(struct device *dev);
> >  	unsigned int (*supported_rotations)(struct device *dev);
> >  	unsigned int (*layer_nr)(struct device *dev);
> > +	unsigned int (*gamma_size)(struct device *dev);
> >  	int (*layer_check)(struct device *dev,
> >  			   unsigned int idx,
> >  			   struct mtk_plane_state *state);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 0e4c77724b05..473766be56e1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -567,6 +567,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_GAMMA, },
> >  	{ .compatible = "mediatek,mt8183-disp-gamma",
> >  	  .data = (void *)MTK_DISP_GAMMA, },
> > +	{ .compatible = "mediatek,mt8195-disp-gamma",
> > +	  .data = (void *)MTK_DISP_GAMMA, },
> >  	{ .compatible = "mediatek,mt8195-disp-merge",
> >  	  .data = (void *)MTK_DISP_MERGE },
> >  	{ .compatible = "mediatek,mt2701-disp-mutex",
> 
> 
1. 

> +static unsigned int now_lut_size;
> +static bool now_lut_diff;

Don't use global variable.



	This two variables are only used in mtk_gamma_set_common()
function, which is called by only mtk_aal_gamma_set() and
mtk_gamma_set(). 

	Change definition of mtk_gamma_set_common() to something like
mtk_gamma_set_common( ..., dev)  
			to bring in "lut_size" and "lut_diff" from dev
private data.

2.

void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state
> *state)
>  {
> -     unsigned int i, reg;
> -     struct drm_color_lut *lut;
> +     unsigned int i, reg, idx;
>       void __iomem *lut_base;
> -     u32 word;
> -     u32 diff[3] = {0};
> +     void __iomem *lut1_base;
> +     u32 word, word1;
>  
>       if (state->gamma_lut) {
> +             u32 table_size;
> +             u32 mask;
> +             struct drm_color_lut color, even, odd;
> +             struct drm_color_lut *lut = (struct drm_color_lut
> *)state->gamma_lut;
> +             bool lut_12bit = (now_lut_size == TABLE_10BIT_SIZE);
> +
>               reg = readl(regs + DISP_GAMMA_CFG);
> +             reg = reg & ~RELAY_MODE;

Why do you modify this for other SoC?


	Originally, gamma config initialization is in
mtk_gamma_config() , this function would write GAMMA_DITHERING into
gamma_CFG if .has_dither flag is true.
	
	This writing actually shut down the relay mode of gamma, thus,
in the original version only need to set GAMMA_LUT_EN to make use of
gamma.
	
	However, now .has_dither is false, which means
mtk_gamma_config() won't modify gamma_CFG anymore.
	
	Therefore, I added above code to manually shut down relay mode,
to ensure it running properly.


	 

3.

      reg = reg | GAMMA_LUT_EN;
>               writel(reg, regs + DISP_GAMMA_CFG);
>               lut_base = regs + DISP_GAMMA_LUT;
> -             lut = (struct drm_color_lut *)state->gamma_lut->data;
> -             for (i = 0; i < MTK_LUT_SIZE; i++) {
> +             lut1_base = regs + DISP_GAMMA_LUT1;
> +             if (lut_12bit) {
> +                     table_size = TABLE_10BIT_SIZE;
> +                     mask = LUT_12BIT_MASK;

lut_bits and lut_size are independent factor, so use two variable in
private data for each. And I like to use digital value instead of a
symbol.

lut_bits = 10 or 12;
lut_size = 512 or 1024;
mask = GENMASK(lut_bits - 1, 0);

> +             }


	OK, I will fix it.



4.

> +             for (i = 0; i < table_size; i++) {
> +                     if (!(i % BANK_SIZE) && lut_12bit)
> +                             writel((i / BANK_SIZE), regs +
> DISP_GAMMA_BANK);

Group register writing together, so move this to bottom of this for-
loop.


	OK, I will fix it.



5.

> +                     color.red = (lut[i].red >> 6) & mask;
> +                     color.green = (lut[i].green >> 6) & mask;
> +                     color.blue = (lut[i].blue >> 6) & mask;

Why shift 6 bits for lut 12 bits?


	After testing, I find that right-shift 6bits and mask the
Least-Significant(LS) 12bits bring the correct results.

	It actually make more sense to right-shift 4bits to gain the
12bits, however, when I did this,  the results failed.

	I wonder if this is the test data problem, since the original
test data is for mt8183 10bit lut.
	
	I will contact with designer and try to figure it out.  	



6.
> +                     if ((i % 2) && now_lut_diff) {

In original code, !lut_diff is first, so I would like you to keep this
order.


	OK, I will fix it.



7.
 +                             odd = color;
> +                             word = (lut_12bit) ? (((odd.green -
> even.green) << 12) +
> +                                                   (odd.red -
> even.red))
> +                                                : (((odd.red -
> even.red) << 20) +
> +                                                   ((odd.green -
> even.green) << 10) +
> +                                                   (odd.blue -
> even.blue));
> +                             word1 = (odd.blue - even.blue);

I think it's not necessary to create odd and even variable. 

Regards,
CK


	OK, I will fix it.

