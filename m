Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5541306D87
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 07:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733E76E8DA;
	Thu, 28 Jan 2021 06:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDB356E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:18:03 +0000 (UTC)
X-UUID: 26fb992c177d4546a7bdb87eef1d8683-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yH+gBipO9hOQRZvMiK6UDJurGb4rGh2uSo1RfKfHNr4=; 
 b=KAEmOXWsiUFzjz1k1G+8SjHI61P1odTYjNHHVllO0qdkV7zEm1Fci1PfuWVgkZi05rgRjgXSLKgKFdRGGqMTFcPyo7dfcaIBMM2Q1GbF8sgkU0FQY727rRT+f3LR11GHF7IQ9JQIu9B8G1OqcKyRlo3mEYNtsYMc9Fj++Pu1s5Q=;
X-UUID: 26fb992c177d4546a7bdb87eef1d8683-20210128
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1174722291; Thu, 28 Jan 2021 14:17:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 14:17:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 14:17:53 +0800
Message-ID: <1611814673.28312.10.camel@mtksdaap41>
Subject: Re: [PATCH v10 9/9] drm/mediatek: add support for mediatek SOC MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:17:53 +0800
In-Reply-To: <20210127045422.2418917-10-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-10-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C777708033CD168A1AAC5B786F1DFA5848CB97E50C292601B42893BA975571EC2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> 1. add ovl private data
> 2. add rdma private data
> 3. add gamma privte data
> 4. add main and external path module for crtc create

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 18 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  6 +++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 45 +++++++++++++++++++++++
>  4 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index c98fe284265d0..93ad76a2dda5e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -179,6 +179,7 @@ static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = &mt8173_gamma_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-gamma"},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 1c295c58a5e82..da7e38a28759b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -424,11 +424,29 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
>  	.fmt_rgb565_is_0 = true,
>  };
>  
> +static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +};
> +
> +static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 2,
> +	.fmt_rgb565_is_0 = true,
> +};
> +
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-ovl",
>  	  .data = &mt2701_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-ovl",
>  	  .data = &mt8173_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = &mt8183_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = &mt8183_ovl_2l_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 04b9542010b00..29fa5f3a05c30 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -355,11 +355,17 @@ static const struct mtk_disp_rdma_data mt8173_rdma_driver_data = {
>  	.fifo_size = SZ_8K,
>  };
>  
> +static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
> +	.fifo_size = 5 * SZ_1K,
> +};
> +
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = &mt2701_rdma_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = &mt8173_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = &mt8183_rdma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 279d3e6f11563..486e73e675ad5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -129,6 +129,24 @@ static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L1,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -161,6 +179,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> +	.main_path = mt8183_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
> +	.ext_path = mt8183_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
> +};
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> @@ -375,12 +400,20 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8173-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-wdma",
>  	  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },
>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",
> @@ -389,22 +422,32 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8183-disp-gamma",
> +	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8183-disp-dither",
> +	  .data = (void *)MTK_DISP_DITHER },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",
>  	  .data = (void *)MTK_DISP_UFOE },
>  	{ .compatible = "mediatek,mt2701-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8183-dsi",
> +	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt2701-dpi",
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8183-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt2701-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2712-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
> @@ -423,6 +466,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>  	  .data = &mt2712_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8173-mmsys",
>  	  .data = &mt8173_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8183-mmsys",
> +	  .data = &mt8183_mmsys_driver_data},
>  	{ }
>  };
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
