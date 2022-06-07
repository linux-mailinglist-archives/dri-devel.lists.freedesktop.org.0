Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79453F423
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 04:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF8410E51C;
	Tue,  7 Jun 2022 02:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359AE10E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 02:54:36 +0000 (UTC)
X-UUID: 3955505818d04c8b9969c59d09c432d2-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:96f292b6-9e19-4a32-9245-f3bdc58d0a67, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:96f292b6-9e19-4a32-9245-f3bdc58d0a67, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:ea47677e-c8dc-403a-96e8-6237210dceee,
 C
 OID:FAIL,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,Fil
 e:nil,QS:0,BEC:nil
X-UUID: 3955505818d04c8b9969c59d09c432d2-20220607
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 472154471; Tue, 07 Jun 2022 10:54:29 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:54:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 10:54:27 +0800
Message-ID: <6dcb95f2f91d91fc8fd87a86ba988eee0168df19.camel@mediatek.com>
Subject: Re: [PATCH v10 07/21] drm/mediatek: dpi: implement a CK/DE pol
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
Date: Tue, 7 Jun 2022 10:54:27 +0800
In-Reply-To: <356624f3283f9203007ab21bedf15744d86e16f8.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-8-granquet@baylibre.com>
 <356624f3283f9203007ab21bedf15744d86e16f8.camel@mediatek.com>
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

On Mon, 2022-05-30 at 15:44 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Adds a bit of flexibility to support SoCs without CK/DE pol support
> 
> It seems that DP_INTF has no CK/DE pol function. If so, could you
> explain why DP_INTF has this difference with DPI?
> 
> Regards,
> CK
> 

Hello CK,

Dp_intf does not support CK/DE polarity because the polarity
information is not used for eDP and DP while dp_intf is only for eDP
and DP.

I will add this in commit message in next version.

BRs,
Bo-Chen

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4746eb342567..545a1337cc89 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
> >  	bool edge_sel_en;
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> > +	bool is_ck_de_pol;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi
> > *dpi,
> >  			       struct mtk_dpi_polarities *dpi_pol)
> >  {
> >  	unsigned int pol;
> > +	unsigned int mask;
> >  
> > -	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL)
> > > 
> > 
> > -	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL)
> > > 
> > 
> > -	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > HSYNC_POL) |
> > +	mask = HSYNC_POL | VSYNC_POL;
> > +	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > HSYNC_POL) |
> >  	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > VSYNC_POL);
> > -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
> > -		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
> > +	if (dpi->conf->is_ck_de_pol) {
> > +		mask |= CK_POL | DE_POL;
> > +		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
> > +			0 : CK_POL) |
> > +		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
> > +			0 : DE_POL);
> > +	}
> > +
> > +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
> >  }
> >  
> >  static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
> > @@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.max_clock_khz = 300000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.max_clock_khz = 100000,
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 

