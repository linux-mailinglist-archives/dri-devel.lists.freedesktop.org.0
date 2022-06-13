Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46E547DD6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 05:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1662B10E470;
	Mon, 13 Jun 2022 03:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46C910E470
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 03:12:41 +0000 (UTC)
X-UUID: f7c315592ef14a779a345bf3483fb912-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:d00b79aa-2c5e-4094-b4fe-cc82990eee57, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:8ad051c6-12ba-4305-bfdf-9aefbdc32516,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: f7c315592ef14a779a345bf3483fb912-20220613
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1170772932; Mon, 13 Jun 2022 11:12:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 13 Jun 2022 11:12:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 11:12:33 +0800
Message-ID: <fc301b26d4e0fea003a9b6c2237eaca16a4929f6.camel@mediatek.com>
Subject: Re: [PATCH v10 08/21] drm/mediatek: dpi: implement a swap_input
 toggle in SoC config
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
Date: Mon, 13 Jun 2022 11:12:33 +0800
In-Reply-To: <2c88fd4c308e86536d5996b3f32f68d05d452e23.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-9-granquet@baylibre.com>
 <2c88fd4c308e86536d5996b3f32f68d05d452e23.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-30 at 15:50 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Adds a bit of flexibility to support SoCs without swap_input
> > support
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 545a1337cc89..454f8563efae 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> >  	bool is_ck_de_pol;
> > +	bool swap_input_support;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -378,18 +379,21 @@ static void
> > mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > -		mtk_dpi_config_swap_input(dpi, false);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> >  	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> >  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, true);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > -		mtk_dpi_config_swap_input(dpi, true);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, true);
> 
> As [1], please keep in touch with Mediatek engineer.
> 
> Regards,
> CK
> 
> [1] 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220218145437.18563-8-granquet@baylibre.com/
> 

Hello CK,

the reason is the hardware design of dp_intf does not support input
swap.
I will add this in commit message.

BRs,
Bo-Chen

> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >  	} else {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, false);
> > -		mtk_dpi_config_swap_input(dpi, false);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >  	}
> >  }
> > @@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 

