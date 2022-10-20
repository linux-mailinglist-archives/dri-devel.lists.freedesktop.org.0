Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B48605B3B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA29810E628;
	Thu, 20 Oct 2022 09:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F610E628
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:32:01 +0000 (UTC)
X-UUID: e31d31f0b2414fdeb3a83931cf99b708-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=42X3hRvH7Qpi+JuM2QnO/7VSSVmzJ58+7zknq3PnIAA=; 
 b=EsBiBsw/4hjaPbIC5k9kKB4DXE7eJt3ERc7psHMoXIkz7QbSAqheUBon/Sn/v9rrdRiEz1iFkro9rSDG+1cdPZcm0cQCvIcMxZ3awEON7kQtYuBBS6zE0TpNjjoPczbF6xW7+MbYtNewpp6w8xrOTDwhjSS7HBmE17nurAPk06c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:8b1c0fc4-932a-4e60-9412-ea87d2d44108, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:73
X-CID-INFO: VERSION:1.1.12, REQID:8b1c0fc4-932a-4e60-9412-ea87d2d44108, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:73
X-CID-META: VersionHash:62cd327, CLOUDID:97c8e4ee-314c-4293-acb8-ca4299dd021f,
 B
 ulkID:2210201633588XNG999P,BulkQuantity:27,Recheck:0,SF:38|28|17|19|48|102
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,C
 OL:0
X-UUID: e31d31f0b2414fdeb3a83931cf99b708-20221020
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 276370861; Thu, 20 Oct 2022 17:31:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3; 
 Thu, 20 Oct 2022 09:31:45 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 17:03:57 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 17:03:56 +0800
Message-ID: <64250c71cee76f4cf35e4dccdb5d2089a2dc5793.camel@mediatek.com>
Subject: Re: [PATCH,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 20 Oct 2022 17:04:03 +0800
In-Reply-To: <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
 <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
 <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-10-20 at 10:33 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/10/22 09:05, xinlei.lee@mediatek.com ha scritto:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > For MT8188, the vdosys0 only supports 1T1P mode, so we need to add
> > the compatible for mt8188 edp-intf.
> > 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
> >   2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 508a6d9..5cefda4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >   	.csc_enable_bit = CSC_ENABLE,
> >   };
> >   
> > +static const struct mtk_dpi_conf mt8188_edpintf_conf = {
> > +	.cal_factor = mt8195_dpintf_calculate_factor,
> > +	.max_clock_khz = 600000,
> > +	.output_fmts = mt8195_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> > +	.pixels_per_iter = 4,
> > +	.input_2pixel = false,
> > +	.dimension_mask = DPINTF_HPW_MASK,
> > +	.hvsize_mask = DPINTF_HSIZE_MASK,
> > +	.channel_swap_shift = DPINTF_CH_SWAP,
> > +	.yuv422_en_bit = DPINTF_YUV422_EN,
> > +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> > +};
> > +
> >   static const struct mtk_dpi_conf mt8192_conf = {
> >   	.cal_factor = mt8183_calculate_factor,
> >   	.reg_h_fre_con = 0xe0,
> > @@ -1079,6 +1093,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[] = {
> >   	{ .compatible = "mediatek,mt8183-dpi",
> >   	  .data = &mt8183_conf,
> >   	},
> > +	{ .compatible = "mediatek,mt8188-edp-intf",
> > +	  .data = &mt8188_edpintf_conf,
> 
> Please rename to:
> 
> mediatek,mt8188-dp-intf
> 
> and
> 
> &mt8188_dpintf_conf
> 
> > +	},
> >   	{ .compatible = "mediatek,mt8192-dpi",
> >   	  .data = &mt8192_conf,
> >   	},
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 91f58db..5732ed8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -631,6 +631,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >   	  .data = (void *)MTK_DPI },
> >   	{ .compatible = "mediatek,mt8183-dpi",
> >   	  .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt8188-edp-intf",
> 
> Same here.
> 
> Regards,
> Angelo
> 

Hi Angelo:

Thanks for your review.
I will modify it in the next version.

Best Regards!
xinlei

