Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0004D7F7F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 11:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92D10E133;
	Mon, 14 Mar 2022 10:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7788510E133
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 10:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 461EA1F43E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252656;
 bh=yA8iPc1qudE0RmbWKTE0OXypq9/1bFl/sCJMi3gV1Sw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gjrp0g5MeHLNDySyFqs5JRUzilUbUpmVggL+Y3GbxW77VoCvdsRZlx/VqBGFboED6
 yfnkByKHj6qvp+6voxCecxYBybDBxSZAfpqqUia6Gy4T9Mk7K3XbkHJP8NRzAuT5nT
 ocWtki6jabAOjuBYMO5NKNZ35Id2JZ6Vg29//qinOyrYTDPxh1jO9W3kE5wN9dxid/
 gOmOoZOWp2VOfLUEMmv3aV5VW2xVUtbGJ4d6o3CNkjm1Y2J4V7gAyDbhXHhc2dh/al
 3jSz7ci2EWDlHjyeyDnNmMHCGkplQLBZX66U2rXLdSORd8KC8BXRMCwNZmDY+HG13M
 ZYCmjz00HgYoQ==
Message-ID: <2ec34f38-a26a-92c0-0185-cf9cd09c202d@collabora.com>
Date: Mon, 14 Mar 2022 11:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 5/5] drm/mediatek: add display support for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mmsys driver data and compatible for MT8186 in mtk_drm_drv.c.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 33 ++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 247c6ff277ef..c5f88295b434 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -158,6 +158,24 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
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
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>   static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
>   	DDP_COMPONENT_OVL0,
>   	DDP_COMPONENT_OVL_2L0,
> @@ -221,6 +239,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
> +	.main_path = mt8186_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
> +	.ext_path = mt8186_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.main_path = mt8192_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -461,6 +486,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8183-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8186-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8173-disp-od",
> @@ -509,12 +536,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8173-dsi",
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8183-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = (void *)MTK_DSI },
>   	{ }
>   };
>   
> @@ -531,6 +562,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>   	  .data = &mt8173_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8183-mmsys",
>   	  .data = &mt8183_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8186-mmsys",
> +	  .data = &mt8186_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8192-mmsys",
>   	  .data = &mt8192_mmsys_driver_data},
>   	{ }
> 

