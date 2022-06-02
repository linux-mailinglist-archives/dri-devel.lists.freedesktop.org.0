Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639253B8DE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4102810F0F7;
	Thu,  2 Jun 2022 12:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E062D10F0F7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:19:11 +0000 (UTC)
X-UUID: ac781e92043f40c1900f3c7729d24e1b-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c68abee3-bff2-47ae-89ee-baf275569339, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:6de0b26e-b02c-4af4-b838-5c14aaa063c7,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: ac781e92043f40c1900f3c7729d24e1b-20220602
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 185878044; Thu, 02 Jun 2022 20:19:06 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 2 Jun 2022 20:19:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 20:19:05 +0800
Message-ID: <1b2c534c189944b388ff7ca9adc013e8878fe37e.camel@mediatek.com>
Subject: Re: [PATCH v10 11/21] drm/mediatek: dpi: move swap_shift to SoC config
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
Date: Thu, 2 Jun 2022 20:19:05 +0800
In-Reply-To: <76ddd49bb2bb46923900b085056ce22d7bfa0b0a.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-12-granquet@baylibre.com>
 <76ddd49bb2bb46923900b085056ce22d7bfa0b0a.camel@mediatek.com>
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

On Mon, 2022-05-30 at 16:38 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Add flexibility by moving the swap shift value to SoC specific
> > config
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6eeda222a973..6d4d8c6ec47d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
> >  	u32 dimension_mask;
> >  	/* HSIZE and VSIZE mask (no shift) */
> >  	u32 hvsize_mask;
> > +	u32 channel_swap_shift;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct
> > mtk_dpi *dpi,
> >  		break;
> >  	}
> >  
> > -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> > CH_SWAP_MASK);
> > +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> > > channel_swap_shift,
> > 
> > +		     CH_SWAP_MASK);
> > From the definiton:
> 
>  #define CH_SWAP				0
> +#define DPINTF_CH_SWAP			BIT(1)
>  #define CH_SWAP_MASK			(0x7 << 0)
> +#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
> 
> This statement should be:
> 
> mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> > channel_swap_shift, CH_SWAP_MASK << dpi->conf->channel_swap_shift);
> 
> dpi->conf->channel_swap_shift is 1 for MT8195-DP_INTF and 0 for
> others.
> And drop the definition of DPINTF_CH_SWAP and DPINTF_CH_SWAP_MASK,
> 
> Regards,
> CK
> 

Hello CK,

I have checked this with Jitao,
it's all shift 1 bit including mask and value.

I will modify like this:
#define DPINTF_CH_SWAP 1

mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
val << dpi->conf-> channel_swap_shift,
CH_SWAP_MASK << dpi->conf->channel_swap_shift);


BR,
Bo-Chen
> 
> >  }
> >  
> >  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> > enable)
> > @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

