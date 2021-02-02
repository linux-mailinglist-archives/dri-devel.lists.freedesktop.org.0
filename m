Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD830BAA8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 10:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746E26E8EF;
	Tue,  2 Feb 2021 09:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA52C6E8EF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 09:12:54 +0000 (UTC)
X-UUID: b7c13609295b487189aa6c17456b9c0b-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jCOnxeZG3GpW2X1ImEEkRJN+ncbxOPNLGX8aovBzoJA=; 
 b=HHDCAdX5Tr0Gc9JKCRVAmbzxfhop+LiR0CdIqJnwhdpSCtt+CBOzIBVlWKSLiMknclwPOLA3uSMbSAsVTTPXCUWID0wTB4RI+79uOAuoolsyqVeUIi6rrWcL+ULPnaoTOK7gpuxltwR2hFdfA+AgGEGy9dM/it5njBjGk43pMBM=;
X-UUID: b7c13609295b487189aa6c17456b9c0b-20210202
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1535380999; Tue, 02 Feb 2021 17:12:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 17:12:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 17:12:49 +0800
Message-ID: <1612257169.30872.2.camel@mtksdaap41>
Subject: Re: [PATCH v6 8/8] drm/mediatek: add support for mediatek SOC MT8192
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 17:12:49 +0800
In-Reply-To: <20210202081237.774442-9-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-9-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A363715C433DB74E8E57BFD8443DE9B7FDDC4DE180E54AEF2684BDDC0E54DA912000:8
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Tue, 2021-02-02 at 16:12 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> add support for mediatek SOC MT8192

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c |  6 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 20 +++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  6 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 42 +++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 141cb36b9c07b..3a53ebc4e1724 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -205,9 +205,15 @@ static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
>  	.matrix_bits = 10,
>  };
>  
> +static const struct mtk_disp_ccorr_data mt8192_ccorr_driver_data = {
> +	.matrix_bits = 11,
> +};
> +
>  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt8183-disp-ccorr",
>  	  .data = &mt8183_ccorr_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-ccorr",
> +	  .data = &mt8192_ccorr_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 961f87f8d4d15..e266baae586c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -455,6 +455,22 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
>  	.fmt_rgb565_is_0 = true,
>  };
>  
> +static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +};
> +
> +static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 2,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +};
> +
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-ovl",
>  	  .data = &mt2701_ovl_driver_data},
> @@ -464,6 +480,10 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>  	  .data = &mt8183_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = &mt8183_ovl_2l_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-ovl",
> +	  .data = &mt8192_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
> +	  .data = &mt8192_ovl_2l_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 728aaadfea8cf..f123fc00a3935 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -355,6 +355,10 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
>  	.fifo_size = 5 * SZ_1K,
>  };
>  
> +static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
> +	.fifo_size = 5 * SZ_1K,
> +};
> +
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = &mt2701_rdma_driver_data},
> @@ -362,6 +366,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>  	  .data = &mt8173_rdma_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-rdma",
>  	  .data = &mt8183_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-rdma",
> +	  .data = &mt8192_rdma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b013d56d27773..6df551055630c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -147,6 +147,25 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L2,
> +	DDP_COMPONENT_RDMA4,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -186,6 +205,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
> +	.main_path = mt8192_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> +	.ext_path = mt8192_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
> +};
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> @@ -404,22 +430,32 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = (void *)MTK_DISP_OVL_2L },
> +	{ .compatible = "mediatek,mt8192-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8183-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8192-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-wdma",
>  	  .data = (void *)MTK_DISP_WDMA },
>  	{ .compatible = "mediatek,mt8183-disp-ccorr",
>  	  .data = (void *)MTK_DISP_CCORR },
> +	{ .compatible = "mediatek,mt8192-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },
>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-aal",
>  	  .data = (void *)MTK_DISP_AAL},
> +	{ .compatible = "mediatek,mt8192-disp-aal",
> +	  .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = (void *)MTK_DISP_GAMMA, },
>  	{ .compatible = "mediatek,mt8183-disp-gamma",
> @@ -448,12 +484,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8192-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
>  	  .data = (void *)MTK_DISP_PWM },
>  	{ .compatible = "mediatek,mt8173-disp-od",
>  	  .data = (void *)MTK_DISP_OD },
> +	{ .compatible = "mediatek,mt8192-disp-postmask",
> +	  .data = (void *)MTK_DISP_POSTMASK },
>  	{ }
>  };
>  
> @@ -468,6 +508,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>  	  .data = &mt8173_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8183-mmsys",
>  	  .data = &mt8183_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8192-mmsys",
> +	 .data = &mt8192_mmsys_driver_data},
>  	{ }
>  };
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
