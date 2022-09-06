Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793C5ADF77
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5346510E580;
	Tue,  6 Sep 2022 06:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0518F10E0AC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 02:39:13 +0000 (UTC)
X-UUID: 5ee4d9244ea4438e86c1181dfc0ed1b8-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Dn9b59ppNNvHD6c39h1V+jJIS09fOkViOiiBcMeql2I=; 
 b=BLM7rAdiywad7MgsI7+N30y4AC0wDH3+sF2futYcmp3KzN+euTavAlPUfL3yVwhfFg0myFcZRx/Nat//nIdqKjxcUiXa++H9wJI+q74ou7dRbCNxHBdzG9M2i9pvuSdrJQ2NtljzwkEhNaVxJDxOvoBKw3el8pY//GzfS75mR0E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:43115ed2-4c30-4fdc-afa7-430e5326ab35, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:430dcbd0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5ee4d9244ea4438e86c1181dfc0ed1b8-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 806183322; Tue, 06 Sep 2022 10:39:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:39:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:39:06 +0800
Message-ID: <d2f89e0b4929c6c37f5effe002cdc15b7475e500.camel@mediatek.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 10:39:06 +0800
In-Reply-To: <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-5-nathan.lu@mediatek.com>
 <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 srv_heupstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, lancelot.wu@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for your review, and appreciate for all comments and sugestions.
I'll remove io_start variable at next version.
It will be upstream with vdosys1 patch later.

On Mon, 2022-08-22 at 13:50 +0800, CK Hu wrote:
> Hi, Nathan:
> 
> On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > add driver data of mt8188 vdosys0 to mediatek-drm and the sub
> > driver.
> > 
> > Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> > Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30
> > ++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index d72263c8a621..260514006093 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[]
> > =
> > {
> >  	DDP_COMPONENT_DPI0,
> >  };
> >  
> > +static const unsigned int mt8188_mtk_ddp_main[] = {
> > +	DDP_COMPONENT_OVL0,
> > +	DDP_COMPONENT_RDMA0,
> > +	DDP_COMPONENT_COLOR0,
> > +	DDP_COMPONENT_CCORR,
> > +	DDP_COMPONENT_AAL0,
> > +	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_POSTMASK0,
> > +	DDP_COMPONENT_DITHER0,
> > +	DDP_COMPONENT_DP_INTF0,
> > +};
> > +
> >  static const unsigned int mt8192_mtk_ddp_main[] = {
> >  	DDP_COMPONENT_OVL0,
> >  	DDP_COMPONENT_OVL_2L0,
> > @@ -323,6 +335,20 @@ static const struct mtk_mmsys_match_data
> > mt8186_mmsys_match_data = {
> >  	},
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8188_vdosys0_driver_data
> > = {
> > +	.io_start = 0x1c01d000,
> 
> For only one mmsys, it's not necessary to set io_start.
> 
> Regards,
> CK
> 
> > +	.main_path = mt8188_mtk_ddp_main,
> > +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> > +	.mmsys_dev_num = 1,
> > +};
> > +
> > +static const struct mtk_mmsys_match_data mt8188_mmsys_match_data =
> > {
> > +	.num_drv_data = 1,
> > +	.drv_data = {
> > +		&mt8188_vdosys0_driver_data,
> > +	},
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data
> > =
> > {
> >  	.main_path = mt8192_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> > @@ -376,6 +402,8 @@ static const struct of_device_id
> > mtk_drm_of_ids[]
> > = {
> >  	  .data = &mt8183_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8186-mmsys",
> >  	  .data = &mt8186_mmsys_match_data},
> > +	{ .compatible = "mediatek,mt8188-mmsys",
> > +	  .data = &mt8188_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8192-mmsys",
> >  	  .data = &mt8192_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8195-mmsys",
> > @@ -734,6 +762,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8186-disp-mutex",
> >  	  .data = (void *)MTK_DISP_MUTEX },
> > +	{ .compatible = "mediatek,mt8188-disp-mutex",
> > +	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8192-disp-mutex",
> >  	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8195-disp-mutex",
> 
> 

