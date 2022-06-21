Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE24552E02
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FA41129B5;
	Tue, 21 Jun 2022 09:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7261129B9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:12:39 +0000 (UTC)
X-UUID: 569f04be88c94d0c8d93606e26cfe7c8-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:515177c1-c430-4adf-a027-b7c69ff31e57, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:515177c1-c430-4adf-a027-b7c69ff31e57, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:44f5a22d-1756-4fa3-be7f-474a6e4be921,
 C
 OID:c6e029c02700,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 569f04be88c94d0c8d93606e26cfe7c8-20220621
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2044660626; Tue, 21 Jun 2022 17:12:36 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 21 Jun 2022 17:12:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 17:12:34 +0800
Message-ID: <59a4bdf0800afc445f223d07aac8b5335d6e36e8.camel@mediatek.com>
Subject: Re: [PATCH v12 14/14] drm/mediatek: dpi: Add matrix_sel helper
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 21 Jun 2022 17:12:34 +0800
In-Reply-To: <5907e3fc6a690bb79c2ad9b20f6e353b2ba8c774.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
 <20220620121028.29234-15-rex-bc.chen@mediatek.com>
 <76d86558adba1e043e50ab0e18403038450b8099.camel@mediatek.com>
 <5907e3fc6a690bb79c2ad9b20f6e353b2ba8c774.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Tue, 2022-06-21 at 16:41 +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-21 at 11:33 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > > From: Guillaume Ranquet <granquet@baylibre.com>
> > > 
> > > Matrix selection is a new feature for both dpi and dpintf of
> > > MT8195.
> > > Add a mtk_dpi_matrix_sel() helper to update the DPI_MATRIX_SET
> > > register depending on the color format.
> > 
> > Describe more about what this do.
> > 
> 
> this feature is color format transfer.
> For mt8195, the input format is RGB888 andd output format could be
> YUV422. do you think I should squash this patch into [v12,12/14]
> drm/mediatek: dpi: Add YUV422 output support?

OK, squash these two patches and add this description into commit
message. For RGB input and RGB output, I think this function should be
disabled.

Regards,
CK

> 
> > > 
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 29
> > > +++++++++++++++++++++++++
> > >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
> > >  2 files changed, 32 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > index 220e9b18e2cd..8a9151cb1622 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > @@ -135,6 +135,7 @@ struct mtk_dpi_conf {
> > >  	u32 channel_swap_shift;
> > >  	u32 yuv422_en_bit;
> > >  	u32 csc_enable_bit;
> > > +	bool matrx_sel_support;
> > >  };
> > >  
> > >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32
> > > val,
> > > u32 mask)
> > > @@ -398,6 +399,31 @@ static void
> > > mtk_dpi_config_disable_edge(struct
> > > mtk_dpi *dpi)
> > >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > > EDGE_SEL_EN);
> > >  }
> > >  
> > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
> > > +			       enum mtk_dpi_out_color_format format)
> > > +{
> > > +	u32 matrix_sel = 0;
> > > +
> > > +	if (!dpi->conf->matrx_sel_support) {
> > > +		dev_info(dpi->dev, "matrix_sel is not supported.\n");
> > 
> > So for this SoC, there would be something wrong? I still does not
> > understand what this feature is.
> > 
> > static const struct of_device_id mtk_dpi_of_ids[] = {
> > 	{ .compatible = "mediatek,mt2701-dpi",
> > 	  .data = &mt2701_conf,
> > 	},
> > 	{ .compatible = "mediatek,mt8173-dpi",
> > 	  .data = &mt8173_conf,
> > 	},
> > 	{ .compatible = "mediatek,mt8183-dpi",
> > 	  .data = &mt8183_conf,
> > 	},
> > 	{ .compatible = "mediatek,mt8192-dpi",
> > 	  .data = &mt8192_conf,
> > 	},
> > 	{ },
> > };
> > 
> > > +		return;
> > > +	}
> > > +
> > > +	switch (format) {
> > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > +		if (dpi->mode.hdisplay <= 720)
> > > +			matrix_sel = 0x2;
> > 
> > Symbolize 0x2.
> > 
> > > +		break;
> > > +	default:
> > 
> > If format is MTK_DPI_COLOR_FORMAT_YCBCR_422 first, then format
> > change
> > to MTK_DPI_COLOR_FORMAT_RGB and matrix_sel would still be 0x2. Is
> > this
> > correct?
> > 
> > Regards,
> > CK
> > 
> > > +		break;
> > > +	}
> > > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > > INT_MATRIX_SEL_MASK);
> > > +}
> > > +
> > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > >  					enum mtk_dpi_out_color_format
> > > format)
> > >  {
> > > @@ -405,6 +431,7 @@ static void
> > > mtk_dpi_config_color_format(struct
> > > mtk_dpi *dpi,
> > >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > >  		mtk_dpi_config_yuv422_enable(dpi, false);
> > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > +		mtk_dpi_matrix_sel(dpi, format);
> > >  		if (dpi->conf->swap_input_support)
> > >  			mtk_dpi_config_swap_input(dpi, false);
> > >  		mtk_dpi_config_channel_swap(dpi,
> > > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > > @@ -412,6 +439,7 @@ static void
> > > mtk_dpi_config_color_format(struct
> > > mtk_dpi *dpi,
> > >  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> > >  		mtk_dpi_config_yuv422_enable(dpi, true);
> > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > +		mtk_dpi_matrix_sel(dpi, format);
> > >  		if (dpi->conf->swap_input_support)
> > >  			mtk_dpi_config_swap_input(dpi, true);
> > >  		else
> > > @@ -951,6 +979,7 @@ static const struct mtk_dpi_conf
> > > mt8195_dpintf_conf = {
> > >  	.channel_swap_shift = DPINTF_CH_SWAP,
> > >  	.yuv422_en_bit = DPINTF_YUV422_EN,
> > >  	.csc_enable_bit = DPINTF_CSC_ENABLE,
> > > +	.matrx_sel_support = true,
> > >  };
> > >  
> > >  static int mtk_dpi_probe(struct platform_device *pdev)
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > index f7f0272dbd6a..96c117202d0d 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > @@ -230,4 +230,7 @@
> > >  #define EDGE_SEL_EN			BIT(5)
> > >  #define H_FRE_2N			BIT(25)
> > >  
> > > +#define DPI_MATRIX_SET		0xB4
> > > +#define INT_MATRIX_SEL_MASK	(0x1F << 0)
> > > +
> > >  #endif /* __MTK_DPI_REGS_H */
> > 
> > 
> 
> 

