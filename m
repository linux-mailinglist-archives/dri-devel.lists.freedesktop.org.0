Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D94D9392
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 06:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26C510E36E;
	Tue, 15 Mar 2022 05:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AC710E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:10:36 +0000 (UTC)
X-UUID: 49df9714f859447aaf6e807022663930-20220315
X-UUID: 49df9714f859447aaf6e807022663930-20220315
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1494091808; Tue, 15 Mar 2022 13:10:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Mar 2022 13:10:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Mar 2022 13:10:21 +0800
Message-ID: <9832dacd50a744afebe9db7fcfda2b4ced572936.camel@mediatek.com>
Subject: Re: [PATCH v15 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 15 Mar 2022 13:10:21 +0800
In-Reply-To: <20220311015506.11232-22-nancy.lin@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
 <20220311015506.11232-22-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> Add driver data of mt8195 vdosys1 to mediatek-drm.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 99f37f8f6639..2a32e5d24f19 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -190,6 +190,12 @@ static const enum mtk_ddp_comp_id
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
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.main_path = mt2701_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -254,6 +260,13 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys0_driver_data = {
>  	.mmsys_dev_num = 2,

With this modification,

Reviewed-by: CK Hu <ck.hu@mediatek.com>


>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data
> = {
> +	.ext_path = mt8195_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
> +	.mmsys_id = 1,
> +	.mmsys_dev_num = 2,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] = {
>  	{ .compatible = "mediatek,mt2701-mmsys",
>  	  .data = &mt2701_mmsys_driver_data},
> @@ -271,6 +284,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8192_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8195-vdosys0",
>  	  .data = &mt8195_vdosys0_driver_data},
> +	{ .compatible = "mediatek,mt8195-vdosys1",
> +	  .data = &mt8195_vdosys1_driver_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

