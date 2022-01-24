Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E8497952
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCB510EB81;
	Mon, 24 Jan 2022 07:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8D810EB81
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:18:28 +0000 (UTC)
X-UUID: 14d94c71583f415284343dc639647128-20220124
X-UUID: 14d94c71583f415284343dc639647128-20220124
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1884755155; Mon, 24 Jan 2022 15:18:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 24 Jan 2022 15:18:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 15:18:20 +0800
Message-ID: <94cf3379aa648d7366143e2f84bf4e21ad3576c1.camel@mediatek.com>
Subject: Re: [PATCH v11 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
Date: Mon, 24 Jan 2022 15:18:20 +0800
In-Reply-To: <20220110084645.31191-22-nancy.lin@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-22-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Mon, 2022-01-10 at 16:46 +0800, Nancy.Lin wrote:
> Add driver data of mt8195 vdosys1 to mediatek-drm.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 36430f956b4f..e851c56f00b1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -190,6 +190,14 @@ static const enum mtk_ddp_comp_id
> mt8195_mtk_ddp_main[] = {
>  	DDP_COMPONENT_DP_INTF0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_ADAPTOR,
> +	DDP_COMPONENT_MERGE5,
> +	DDP_COMPONENT_DP_INTF1,
> +};
> +
> +static const int mt8195_vdosys1_mtk_cmdq_mbox[] = {-1, 0, -1};

What does this array mean? These number looks so magic.

Regards,
CK

> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -254,6 +262,14 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys0_driver_data = {
>  	.mmsys_dev_num = 2,
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data
> = {
> +	.ext_path = mt8195_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
> +	.mmsys_id = 1,
> +	.mmsys_dev_num = 2,
> +	.mbox_index = mt8195_vdosys1_mtk_cmdq_mbox,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] = {
>  	{ .compatible = "mediatek,mt2701-mmsys",
>  	  .data = &mt2701_mmsys_driver_data},
> @@ -271,6 +287,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8192_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8195-vdosys0",
>  	  .data = &mt8195_vdosys0_driver_data},
> +	{ .compatible = "mediatek,mt8195-vdosys1",
> +	  .data = &mt8195_vdosys1_driver_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

