Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EA562BDA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 08:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C710F377;
	Fri,  1 Jul 2022 06:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AF610EEC9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 06:33:55 +0000 (UTC)
X-UUID: 2a33b42c465746d3b16209b88fa5e71e-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:9ce4ab06-5a24-4fff-af8e-5dc743d90deb, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.7, REQID:9ce4ab06-5a24-4fff-af8e-5dc743d90deb, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:87442a2, CLOUDID:d3c94586-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:142d0f4732a5,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2a33b42c465746d3b16209b88fa5e71e-20220701
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1672347802; Fri, 01 Jul 2022 14:33:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 14:33:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 14:33:51 +0800
Message-ID: <81dd89d9b77b3a16068493269f400254f94c609f.camel@mediatek.com>
Subject: Re: [PATCH 2/2] drm: mediatek: Adjust the dpi output format to MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
 <enric.balletbo@collabora.com>
Date: Fri, 1 Jul 2022 14:33:51 +0800
In-Reply-To: <1656645344-12062-3-git-send-email-xinlei.lee@mediatek.com>
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
 <1656645344-12062-3-git-send-email-xinlei.lee@mediatek.com>
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

On Fri, 2022-07-01 at 11:15 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c      | 21 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  5 +++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index e61cd67b978f..82a5209a1dd8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>  

Please reorder this.

>  #include <video/videomode.h>
>  
> @@ -28,6 +29,7 @@
>  #include "mtk_disp_drv.h"
>  #include "mtk_dpi_regs.h"
>  #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>  
>  enum mtk_dpi_out_bit_num {
>  	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -85,6 +87,7 @@ struct mtk_dpi {
>  	struct pinctrl_state *pins_dpi;
>  	u32 output_fmt;
>  	int refcount;
> +	struct device *mmsys_dev;
>  };
>  
>  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> @@ -125,6 +128,7 @@ struct mtk_dpi_conf {
>  	bool edge_sel_en;
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
> +	bool rgb888_dual_enable;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -393,6 +397,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> *dpi)
>  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>  			     dpi->output_fmt ==
> MEDIA_BUS_FMT_RGB888_2X12_LE ?
>  			     EDGE_SEL : 0, EDGE_SEL);
> +	if (dpi->conf->rgb888_dual_enable)
> +		mtk_mmsys_ddp_dpi_confing(dpi->mmsys_dev,
> DPI_RGB888_DDR_CON,
> +					  DPI_FORMAT_MASK, NULL);
>  	} else {
>  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> 0);
>  	}
> @@ -705,8 +712,10 @@ static int mtk_dpi_bind(struct device *dev,
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
> @@ -823,6 +832,15 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  };
>  
> +static const struct mtk_dpi_conf mt8186_conf = {
> +		.cal_factor = mt8183_calculate_factor,
> +		.reg_h_fre_con = 0xe0,
> +		.max_clock_khz = 150000,
> +		.output_fmts = mt8183_output_fmts,
> +		.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +		.rgb888_dual_enable = true,
> +};
> +

please put this between 8183 and 8192.

>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -945,6 +963,9 @@ static const struct of_device_id mtk_dpi_of_ids[]
> = {
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = &mt8192_conf,
>  	},
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = &mt8186_conf,
> +	},

ditto

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> index 3a02fabe1662..24d4cdf3696b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -217,4 +217,9 @@
>  
>  #define EDGE_SEL_EN			BIT(5)
>  #define H_FRE_2N			BIT(25)
> +
> +#define DPI_FORMAT_MASK			0x1
> +#define DPI_RGB888_DDR_CON		BIT(0)
> +#define DPI_RGB565_SDR_CON		BIT(1)
> +
>  #endif /* __MTK_DPI_REGS_H */

