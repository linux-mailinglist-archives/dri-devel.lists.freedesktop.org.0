Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CF5AFFF9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 11:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7611A10E458;
	Wed,  7 Sep 2022 09:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6E10E458
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 09:10:01 +0000 (UTC)
X-UUID: dee75b619a8d4534b146c29c92c05185-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Vzld8+goQlqiIqPti/bu+pYq9RTDV3wEJHvdKjJwu3A=; 
 b=Ud+UiFD+TWYBvdt79SyVHqRNpx487pdfOOS15ZBEUxeE/cEQcgL9THztHeI+c4DLnh3mYePUKlyx2Rq3XnMMJQo+uwu9oV7RAdk/3QAXIkrHSwcSl8TpvNIBUth2F+y6Ffmy+9MIPbKuaDBM2pCE+02J5LJNkS02uKDtw1g+ZEk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:ad99b08f-b0b8-4e1b-85cd-4b5cc1d5015e, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:9aaa7e21-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dee75b619a8d4534b146c29c92c05185-20220907
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 934491961; Wed, 07 Sep 2022 17:09:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Sep 2022 17:09:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 7 Sep 2022 17:09:52 +0800
Message-ID: <19ee3ece7d8b728375804a65d061dcab1a7725f0.camel@mediatek.com>
Subject: Re: [PATCH v5,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <chunkuang.hu@kernel.org>,
 <yongqiang.niu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Date: Wed, 7 Sep 2022 17:09:51 +0800
In-Reply-To: <1662384863-17281-3-git-send-email-xinlei.lee@mediatek.com>
References: <1662384863-17281-1-git-send-email-xinlei.lee@mediatek.com>
 <1662384863-17281-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, Xinlei:

On Mon, 2022-09-05 at 21:34 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.

Separate this patch into two patches. One is adding edge_cfg_in_mmsys,
and another one is adding mt8186 dpi support.

I think the default value in mmsys (single edge) should work for some
display so that mmsys hardware use single edge for default value. So I
need you to describe more information why we need dual edge.

> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nílas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c      | 31
> +++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  5 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..ffe4a4b70a0f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>  #include <linux/types.h>
> 
>  #include <video/videomode.h>
> @@ -30,6 +31,7 @@
>  #include "mtk_disp_drv.h"
>  #include "mtk_dpi_regs.h"
>  #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> 
>  enum mtk_dpi_out_bit_num {
>  	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -82,6 +84,7 @@ struct mtk_dpi {
>  	struct pinctrl_state *pins_dpi;
>  	u32 output_fmt;
>  	int refcount;
> +	struct device *mmsys_dev;
>  };
> 
>  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> needs to be set in MMSYS.
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
>  	u32 yuv422_en_bit;
>  	u32 csc_enable_bit;
>  	u32 pixels_per_iter;
> +	bool edge_cfg_in_mmsys;
>  };
> 
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> *dpi)
>  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>  			     dpi->output_fmt ==
> MEDIA_BUS_FMT_RGB888_2X12_LE ?
>  			     EDGE_SEL : 0, EDGE_SEL);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> DPI_RGB888_DDR_CON,
> +						     DPI_FORMAT_MASK);
>  	} else {
>  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> 0);
>  	}
> @@ -778,8 +786,10 @@ static int mtk_dpi_bind(struct device *dev,
> struct device *master, void *data)
>  {
>  	struct mtk_dpi *dpi = dev_get_drvdata(dev);
>  	struct drm_device *drm_dev = data;
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
>  	int ret;
> 
> +	dpi->mmsys_dev = priv->mmsys_dev;
>  	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>  				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
> @@ -930,6 +940,24 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.csc_enable_bit = CSC_ENABLE,
>  };
> 
> +static const struct mtk_dpi_conf mt8186_conf = {
> +	.cal_factor = mt8183_calculate_factor,
> +	.reg_h_fre_con = 0xe0,
> +	.max_clock_khz = 150000,
> +	.output_fmts = mt8183_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +	.edge_cfg_in_mmsys = true,
> +	.pixels_per_iter = 1,
> +	.is_ck_de_pol = true,
> +	.swap_input_support = true,
> +	.support_direct_pin = true,
> +	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
> +};
> +
>  static const struct mtk_dpi_conf mt8192_conf = {
>  	.cal_factor = mt8183_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
> @@ -1080,6 +1108,9 @@ static const struct of_device_id
> mtk_dpi_of_ids[] = {
>  	{ .compatible = "mediatek,mt8183-dpi",
>  	  .data = &mt8183_conf,
>  	},
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = &mt8186_conf,
> +	},
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = &mt8192_conf,
>  	},
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> index 62bd4931b344..779e868ffb1a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -235,4 +235,9 @@
>  #define MATRIX_SEL_RGB_TO_JPEG		0
>  #define MATRIX_SEL_RGB_TO_BT601		2
> 
> +/* Values for DPI configuration in MMSYS address space */
> +#define DPI_FORMAT_MASK			0x1
> +#define DPI_RGB888_DDR_CON		BIT(0)
> +#define DPI_RGB565_SDR_CON		BIT(1)

This is the mmsys register definition, so move these to mmsys driver.

Regards,
CK

> +
>  #endif /* __MTK_DPI_REGS_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f02f8d0e4fc..28eb1ac91c15 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -631,6 +631,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8183-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8195-dp-intf",
> --
> 2.18.0
> 

