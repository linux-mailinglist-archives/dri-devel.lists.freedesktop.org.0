Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B75BFF1A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 15:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33D410E09E;
	Wed, 21 Sep 2022 13:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD80810E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 13:44:33 +0000 (UTC)
X-UUID: 92fd44a6baa8434c91cff4cd4f6ea656-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=azqYiyJdwlDH3D7K1YoWpIx1lUAy1nX7mdHhTOkqnG4=; 
 b=MAMf5j9sFs4oejhy9kdOej/87i9vA8kDAEvP8uDo4pIw0UuFkZHfOYbDGxkQpH8mya1bz/9RlWVOytrM0teFfU6GH9HLp8qahzQ8Y3izZpms26oLpo4vRN96rGIz0jRDdWbZ1BkOrTa8+2aqYqLOzQnEtvOEP6TK1ykCKvm3HKE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:6930d75c-42c4-4930-93b7-ec5c77daa9a4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:6930d75c-42c4-4930-93b7-ec5c77daa9a4, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:c4b26d5e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:22092121442892N8P6VL,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0
X-UUID: 92fd44a6baa8434c91cff4cd4f6ea656-20220921
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 126787450; Wed, 21 Sep 2022 21:44:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 21:44:25 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 21:44:24 +0800
Message-ID: <0607e6fd736e61f14fbb3326dbb09243afc1d671.camel@mediatek.com>
Subject: Re: [PATCH v6,3/3] drm: mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <matthias.bgg@gmail.com>,
 <jason-jh.lin@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Wed, 21 Sep 2022 21:44:25 +0800
In-Reply-To: <9f27f3c589c538319f9383cf284226b52209524d.camel@mediatek.com>
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
 <1663161662-1598-4-git-send-email-xinlei.lee@mediatek.com>
 <9f27f3c589c538319f9383cf284226b52209524d.camel@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-09-21 at 09:42 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Wed, 2022-09-14 at 21:21 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add the compatible because use edge_cfg_in_mmsys in mt8186.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c     | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6e02f02f163c..52bcc4114afd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -942,6 +942,24 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.csc_enable_bit = CSC_ENABLE,
> >  };
> >  
> > +static const struct mtk_dpi_conf mt8186_conf = {
> > +	.cal_factor = mt8183_calculate_factor,
> > +	.reg_h_fre_con = 0xe0,
> > +	.max_clock_khz = 150000,
> > +	.output_fmts = mt8183_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.edge_cfg_in_mmsys = true,
> 
> According to the previous review, edge_cfg_in_mmsys is not necessary,
> so mt8186_conf is identical to mt8192_conf.
> 
> Regards,
> CK
> 
> > +	.pixels_per_iter = 1,
> > +	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> > +	.support_direct_pin = true,
> > +	.dimension_mask = HPW_MASK,
> > +	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> > +	.yuv422_en_bit = YUV422_EN,
> > +	.csc_enable_bit = CSC_ENABLE,
> > +};
> > +
> >  static const struct mtk_dpi_conf mt8192_conf = {
> >  	.cal_factor = mt8183_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> > @@ -1092,6 +1110,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[] = {
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = &mt8183_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = &mt8186_conf,
> > +	},
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = &mt8192_conf,
> >  	},
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 546b79412815..3d32fbc66ac1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -646,6 +646,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8195-dp-intf",
> 
> 

Hi CK:

Thanks for your review.

Because the difference between MT8186 and other ICs is that modifying
the output format requires modifying the mmsys register to take effect.

I think this mt8186_conf needs to be reserved so that we can
distinguish it from the settings of other ICs when setting
dpi_dual_edge.
(the edge_cfg_in mmsys flag inside can prevent other ICs from setting
the mmsys register)

Best Regards!
Xinlei

