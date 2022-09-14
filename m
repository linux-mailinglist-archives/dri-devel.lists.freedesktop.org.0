Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F905B7E5E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 03:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3B10E7BB;
	Wed, 14 Sep 2022 01:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8F10E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:36:06 +0000 (UTC)
X-UUID: 807153ac862c4a28b70411e296afe6d7-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mSDfnV9Y8FokxfoaGAcr1iQVtsA9X7BYTGuDMzLt1yo=; 
 b=u6kH5y1fb/rxMAY08rm5Y3VcmDWR0NhtUadKeoLrVe2ufhWnxn15Q/7NV9oRiHetnkRLeljAtrvFtOcL2WDmUaXU4eLFNhLdxI14Y5BDZ5vFEQnn0AT+eLgnCctcarKgofQdobIbIn6mjiIbgbIP75Ol28euf2KrZImyZ3HlsW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:42a2e703-798e-4ad8-b858-c7c80efd12bd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:42a2e703-798e-4ad8-b858-c7c80efd12bd, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:cf1854ec-2856-4fce-b125-09d4c7ebe045,
 B
 ulkID:220914093404SARCJUSD,BulkQuantity:2,Recheck:0,SF:28|17|19|48,TC:nil,
 Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 807153ac862c4a28b70411e296afe6d7-20220914
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 447566403; Wed, 14 Sep 2022 09:36:00 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 14 Sep 2022 09:35:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:35:58 +0800
Message-ID: <cd08cc1ed6765970ba0ad8590bebf7de651e68e3.camel@mediatek.com>
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 14 Sep 2022 09:35:58 +0800
In-Reply-To: <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-5-jason-jh.lin@mediatek.com>
 <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo
 Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the reviews.

On Mon, 2022-09-12 at 12:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> > 2. Add lut_size to gamma driver data for different SoC.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
> >   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22
> > +++++++++++++++++++--
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
> >   5 files changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index a83e5fbc8724..6a05bb56e693 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,6 +51,7 @@ void mtk_gamma_clk_disable(struct device *dev);
> >   void mtk_gamma_config(struct device *dev, unsigned int w,
> >   		      unsigned int h, unsigned int vrefresh,
> >   		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > +unsigned int mtk_gamma_get_lut_size(struct device *dev);
> >   void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> >   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> > struct drm_crtc_state *state);
> >   void mtk_gamma_start(struct device *dev);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index f54a6a618348..e69d0b205b9a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -24,10 +24,12 @@
> >   #define DISP_GAMMA_LUT				0x0700
> >   
> >   #define LUT_10BIT_MASK				0x03ff
> > +#define LUT_SIZE_DEFAULT			512 /* for setting
> > gamma lut from AAL */
> >   
> >   struct mtk_disp_gamma_data {
> >   	bool has_dither;
> >   	bool lut_diff;
> > +	u16 lut_size;
> >   };
> >   
> >   /*
> > @@ -54,18 +56,32 @@ void mtk_gamma_clk_disable(struct device *dev)
> >   	clk_disable_unprepare(gamma->clk);
> >   }
> >   
> > +unsigned int mtk_gamma_get_size(struct device *dev)
> > +{
> > +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > +	unsigned int lut_size = LUT_SIZE_DEFAULT;
> > +
> > +	if (gamma && gamma->data)
> > +		lut_size = gamma->data->lut_size;
> > +
> > +	return lut_size;
> > +}
> > +
> >   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> > struct drm_crtc_state *state)
> >   {
> >   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >   	bool lut_diff = false;
> > +	u16 lut_size = LUT_SIZE_DEFAULT;
> 
> This makes us get a double assignment in case gamma->data is
> populated.
> 
> >   	unsigned int i, reg;
> >   	struct drm_color_lut *lut;
> >   	void __iomem *lut_base;
> >   	u32 word;
> >   	u32 diff[3] = {0};
> >   
> > -	if (gamma && gamma->data)
> > +	if (gamma && gamma->data) {
> >   		lut_diff = gamma->data->lut_diff;
> > +		lut_size = gamma->data->lut_size;
> > +	}
> 
> ...you can avoid it like that:
> 
> } else {
> 	lut_size = LUT_SIZE_DEFAULT;
> }
> 
> 
> Regards,
> Angelo
> 
OK, I'll fix it, but I'll move the gamma priv data handling to the
mtk_gamma_set.

Regards,
Jason-JH.Lin

> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

