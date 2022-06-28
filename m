Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F155BDCF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 05:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF08310E0E6;
	Tue, 28 Jun 2022 03:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5568610E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:23:15 +0000 (UTC)
X-UUID: 1c3e937913cb4a7cbb08ed2e2e96b013-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:b607dd63-0220-4983-ad5c-67f95f3e394a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:87442a2, CLOUDID:1e84f185-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 1c3e937913cb4a7cbb08ed2e2e96b013-20220628
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233349912; Tue, 28 Jun 2022 11:23:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 28 Jun 2022 11:23:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 28 Jun 2022 11:23:08 +0800
Message-ID: <7713b73db7d0f2763661a7e328f4313bd72d497d.camel@mediatek.com>
Subject: Re: [PATCH v14 12/15] drm/mediatek: dpi: Add YUV422 output support
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 28 Jun 2022 11:23:08 +0800
In-Reply-To: <4bc40d79d6f6d3b2bf470a7c09375859a31b5e40.camel@mediatek.com>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-13-rex-bc.chen@mediatek.com>
 <a59a61a81e45fd361774a28a66ffd3d673cb3148.camel@mediatek.com>
 <5b0613b9cc983e24a997c122b2892b35cf8346d3.camel@mediatek.com>
 <c3a2feae4295f3300f723a9bfd8cdf0b1c938c81.camel@mediatek.com>
 <4bc40d79d6f6d3b2bf470a7c09375859a31b5e40.camel@mediatek.com>
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

On Tue, 2022-06-28 at 11:01 +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-28 at 10:38 +0800, CK Hu wrote:
> > On Tue, 2022-06-28 at 10:28 +0800, Rex-BC Chen wrote:
> > > On Tue, 2022-06-28 at 10:15 +0800, CK Hu wrote:
> > > > Hi, Bo-Chen:
> > > > 
> > > > On Fri, 2022-06-24 at 11:09 +0800, Bo-Chen Chen wrote:
> > > > > Dp_intf supports YUV422 as output format. In MT8195 Chrome
> > > > > project,
> > > > > YUV422 output format is used for 4K resolution.
> > > > > 
> > > > > To support this, it is also needed to support color format
> > > > > transfer.
> > > > > Color format transfer is a new feature for both dpi and
> > > > > dpintf
> > > > > of
> > > > > MT8195.
> > > > > 
> > > > > The input format could be RGB888 and output format for
> > > > > dp_intf
> > > > > should
> > > > > be
> > > > > YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to
> > > > > update
> > > > > the
> > > > > DPI_MATRIX_SET register depending on the color format.
> > > > > 
> > > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > > angelogioacchino.delregno@collabora.com>
> > > > > ---
> > > > >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 34
> > > > > ++++++++++++++++++++++++-
> > > > >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
> > > > >  2 files changed, 36 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > index 9e4250356342..438bf3bc5e4a 100644
> > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > @@ -128,6 +128,7 @@ struct mtk_dpi_yc_limit {
> > > > >   * @num_output_fmts: Quantity of supported output formats.
> > > > >   * @is_ck_de_pol: Support CK/DE polarity.
> > > > >   * @swap_input_support: Support input swap function.
> > > > > + * @color_fmt_trans_support: Enable color format transfer.
> > > > >   * @dimension_mask: Mask used for HWIDTH, HPORCH,
> > > > > VSYNC_WIDTH
> > > > > and
> > > > > VSYNC_PORCH
> > > > >   *		    (no shift).
> > > > >   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
> > > > > @@ -144,6 +145,7 @@ struct mtk_dpi_conf {
> > > > >  	u32 num_output_fmts;
> > > > >  	bool is_ck_de_pol;
> > > > >  	bool swap_input_support;
> > > > > +	bool color_fmt_trans_support;
> > > > >  	u32 dimension_mask;
> > > > >  	u32 hvsize_mask;
> > > > >  	u32 channel_swap_shift;
> > > > > @@ -412,6 +414,31 @@ static void
> > > > > mtk_dpi_config_disable_edge(struct
> > > > > mtk_dpi *dpi)
> > > > >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > > > > EDGE_SEL_EN);
> > > > >  }
> > > > >  
> > > > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
> > > > > +			       enum mtk_dpi_out_color_format
> > > > > format)
> > > > > +{
> > > > > +	u32 matrix_sel = 0;
> > > > > +
> > > > > +	if (!dpi->conf->color_fmt_trans_support) {
> > > > > +		dev_info(dpi->dev, "matrix_sel is not
> > > > > supported.\n");
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	switch (format) {
> > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > > 
> > > > I think the transform formula are different for full range and
> > > > non-
> > > > full 
> > > > range. Please make sure '0x2' is for full range or non-full
> > > > range.
> > > > If
> > > > you are not sure, you could provide the transform matrix of
> > > > '0x2'
> > > > so
> > > > we
> > > > could find out it's full or non-full.
> > > > 
> > > > > +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > > > +		if (dpi->mode.hdisplay <= 720)
> > > > > +			matrix_sel = 0x2;
> > > > 
> > > > Symbolize '0x2'.
> > > > 
> > > > > +		break;
> > > > > +	default:
> > > > > +		break;
> > > > > +	}
> > > > > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > > > > INT_MATRIX_SEL_MASK);
> > > > > +}
> > > > > +
> > > > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > > > >  					enum
> > > > > mtk_dpi_out_color_format
> > > > > format)
> > > > >  {
> > > > > @@ -419,6 +446,7 @@ static void
> > > > > mtk_dpi_config_color_format(struct
> > > > > mtk_dpi *dpi,
> > > > >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > > > >  		mtk_dpi_config_yuv422_enable(dpi, false);
> > > > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > > > +		mtk_dpi_matrix_sel(dpi, format);
> > > > 
> > > > Why mt8173 support MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL but it
> > > > does
> > > > not
> > > > call mtk_dpi_matrix_sel()? It seems that mt8173 also need to
> > > > call
> > > > mtk_dpi_matrix_sel() but lost and this patch looks like a bug
> > > > fix
> > > > for
> > > > all SoC DPI driver.
> > > > 
> > > > Regards,
> > > > CK
> > > > 
> > > 
> > > Hello CK,
> > > 
> > > MT8173 does not support MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL as
> > > output
> > > format, the output format is:
> > > 
> > > static const u32 mt8173_output_fmts[] = {
> > > 	MEDIA_BUS_FMT_RGB888_1X24,
> > > };
> > > 
> > > or do I misunderstand?
> > 
> > In the first patch [1], it define
> > 
> > +enum mtk_dpi_out_color_format {
> > +	MTK_DPI_COLOR_FORMAT_RGB,
> > +	MTK_DPI_COLOR_FORMAT_RGB_FULL,
> > +	MTK_DPI_COLOR_FORMAT_YCBCR_444,
> > +	MTK_DPI_COLOR_FORMAT_YCBCR_422,
> > +	MTK_DPI_COLOR_FORMAT_XV_YCC,
> > +	MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> > +	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > +};
> > 
> > and this function also process MTK_DPI_COLOR_FORMAT_YCBCR_444,
> > MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> > MTK_DPI_COLOR_FORMAT_YCBCR_422,
> > and MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL. So I think it want to
> > process
> > output YUV but the caller of mtk_dpi_config_color_format() just
> > pass
> > RGB into this function. If mt8173 does not support YUV output, I
> > think
> > you should remove YUV processing in this function first, and then
> > add
> > back YUV processing in this function.
> > 
> > [1] 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=v5.19-rc4&id=9e629c17aa8d7a75b8c1d99ed42892cd8ba7cdc4
> > 
> > Regards,
> > CK
> > 
> 
> Hello CK,
> 
> I don't think it should be remove. After all, it is accepted and from
> [1], we can see it assgin output format always as RGB.
> +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> 
> After that, it also added patch of supporting changing output
> format[2].
> 
> We have support output as YUV422 now. I think it's ok to just add
> this.
> If we remove them and add them back, I think it is a little bit
> redundant. And I also can add a commit message like "output format
> YUV422 is not support for previous MediaTek SoCs. MT8195 supports
> output format as YUV422.."
> 
> What do you think?

If we have no information about mt8173 support YUV or not, we could
just treat it as not support YUV. I like to make things clean before
apply new feature. If you do not want to remove it, I would send a
patch to remove it.

Regards,
CK

> 
> [2]: 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=v5.19-rc4&id=be63f6e8601ff21139da93623754717e92cbd8db
> 
> BRs,
> Bo-Chen
> > > 
> > > BRs,
> > > Bo-Chen
> > > 
> > > > >  		if (dpi->conf->swap_input_support)
> > > > >  			mtk_dpi_config_swap_input(dpi, false);
> > > > >  		mtk_dpi_config_channel_swap(dpi,
> > > > > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > > > > @@ -426,6 +454,7 @@ static void
> > > > > mtk_dpi_config_color_format(struct
> > > > > mtk_dpi *dpi,
> > > > >  		   (format ==
> > > > > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> > > > >  		mtk_dpi_config_yuv422_enable(dpi, true);
> > > > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > > > +		mtk_dpi_matrix_sel(dpi, format);
> > > > >  		if (dpi->conf->swap_input_support)
> > > > >  			mtk_dpi_config_swap_input(dpi, true);
> > > > >  		else
> > > > > @@ -673,7 +702,10 @@ static int
> > > > > mtk_dpi_bridge_atomic_check(struct
> > > > > drm_bridge *bridge,
> > > > >  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > >  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > >  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > > +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > > > > +		dpi->color_format =
> > > > > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > > > > +	else
> > > > > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > >  
> > > > >  	return 0;
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > index 3a02fabe1662..cca0dccb84a2 100644
> > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > @@ -217,4 +217,7 @@
> > > > >  
> > > > >  #define EDGE_SEL_EN			BIT(5)
> > > > >  #define H_FRE_2N			BIT(25)
> > > > > +
> > > > > +#define DPI_MATRIX_SET		0xB4
> > > > > +#define INT_MATRIX_SEL_MASK		GENMASK(4, 0)
> > > > >  #endif /* __MTK_DPI_REGS_H */
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

