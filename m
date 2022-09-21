Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510625BFF0A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 15:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C58010E40A;
	Wed, 21 Sep 2022 13:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39F810E405
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 13:39:18 +0000 (UTC)
X-UUID: d41d884b4bb343fd82806aaa7238de03-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F+RYld1az5rAHD+UhhQ+OjODHmdk7/9nZ0vdYJZ7ifY=; 
 b=O1RktJJ6eGL4VSj4cxXllXi0y8yAv13QuvCG85uuwYfDVE7ca9UGVzn3/N5FY+bZSk63KXlc4WBLaZME9PtlnVOywfkBRy0IlCe0rU2RtgBxuc09ouepC2XqM2ipoqR5hvzvATMUHvjtX9PDGDHlBSSbppph/za9rvKOSsRz3/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:3ff2154a-b8d8-4184-9b8c-55809f288f0f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:eea06d5e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d41d884b4bb343fd82806aaa7238de03-20220921
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1014021754; Wed, 21 Sep 2022 21:39:02 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 21:39:00 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 21:39:00 +0800
Message-ID: <ed30c8505f49d8186d5b8a3c52d9cf0ca5f86537.camel@mediatek.com>
Subject: Re: [PATCH v6,2/3] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <matthias.bgg@gmail.com>,
 <jason-jh.lin@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Wed, 21 Sep 2022 21:39:00 +0800
In-Reply-To: <6c3de76f1ecf5fb0f4e96469738d383e89cb0eca.camel@mediatek.com>
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
 <1663161662-1598-3-git-send-email-xinlei.lee@mediatek.com>
 <6c3de76f1ecf5fb0f4e96469738d383e89cb0eca.camel@mediatek.com>
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

On Wed, 2022-09-21 at 09:35 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Wed, 2022-09-14 at 21:21 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> > The bridge ic on MT8186 uses the output format of
> > RGB888_dual_edge. 
> 
> I think different sink ic may support different output format, so
> query
> the sink information to decide which outout format.
> 
> > Due
> > to hardware changes, we need to modify the output format
> > corresponding
> > to the mmsys register.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Nís F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index fb0b79704636..6e02f02f163c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >  #include <linux/types.h>
> >  
> >  #include <video/videomode.h>
> > @@ -28,6 +29,7 @@
> >  #include "mtk_disp_drv.h"
> >  #include "mtk_dpi_regs.h"
> >  #include "mtk_drm_ddp_comp.h"
> > +#include "mtk_drm_drv.h"
> >  
> >  enum mtk_dpi_out_bit_num {
> >  	MTK_DPI_OUT_BIT_NUM_8BITS,
> > @@ -58,6 +60,11 @@ enum mtk_dpi_out_color_format {
> >  	MTK_DPI_COLOR_FORMAT_YCBCR_422
> >  };
> >  
> > +enum mtk_dpi_out_format_con {
> > +	MTK_DPI_RGB888_DDR_CON,
> > +	MTK_DPI_RGB565_SDR_CON
> > +};
> > +
> >  struct mtk_dpi {
> >  	struct drm_encoder encoder;
> >  	struct drm_bridge bridge;
> > @@ -80,6 +87,7 @@ struct mtk_dpi {
> >  	struct pinctrl_state *pins_dpi;
> >  	u32 output_fmt;
> >  	int refcount;
> > +	struct device *mmsys_dev;
> >  };
> >  
> >  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> > @@ -133,6 +141,7 @@ struct mtk_dpi_yc_limit {
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> > needs to be set in MMSYS.
> >   */
> >  struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> > @@ -151,6 +160,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool edge_cfg_in_mmsys;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -447,6 +457,8 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_DDR_CON);
> 
> Why do you set a DPI driver defined value MTK_DPI_RGB888_DDR_CON into
> mmsys driver? I think you should set a value which mmsys driver
> understand.
> 
> Regards,
> CK
> 
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> >  	}
> > @@ -776,8 +788,10 @@ static int mtk_dpi_bind(struct device *dev,
> > struct device *master, void *data)
> >  {
> >  	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> >  	struct drm_device *drm_dev = data;
> > +	struct mtk_drm_private *priv = drm_dev->dev_private;
> >  	int ret;
> >  
> > +	dpi->mmsys_dev = priv->mmsys_dev;
> >  	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> >  				      DRM_MODE_ENCODER_TMDS);
> >  	if (ret) {
> 
> 
Hi CK:

Thanks for your review.

Yes, different sink ICs may support other output formats. 
The current DRM architecture supports retrieving the output formats of
all bridges (implemented through .atomic_check &
.atomic_get_output_bus_fmts & .atomic_get_input_bus_fmts in dpi).
If no unified output format is found It will use the default format
output of soc (MEDIA_BUS_FMT_RGB888_2X12_LE is used in mt8186).

The difference between MT8186 and other ICs is that when modifying the
output format, we need to modify the mmsys_base + 0x400 register to
take effect. 
Therefore, if there are other format sink ICs (RGB888_DDR/RGB888_SDR)
in the future, the sink IC needs to add the func implementation
mentioned above needs to be added. 
And the drm architecture will select the appropriate format to change
the dpi output.

I will put the registers that control mmsys in mtk-mmsys.h in the next
release.

Best Regards!
Xinlei

