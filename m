Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF75B7E4C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 03:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC7A10E7B9;
	Wed, 14 Sep 2022 01:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33CF10E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:28:24 +0000 (UTC)
X-UUID: a8fa960e5b1d4f9f8175c752a8deb27e-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MNDLWoliX3rGDqNWFuUqpggkqLT7w5fZHZd/Ti6Pjz8=; 
 b=trjLQSD9FkOoHtosDVR7GxZpvNOuv+205uCOq6CGkiA8xn98VF3KSdGYVUJ8thw93/7Uo8zLb48bHVQp6o5DVu9YmYyJZBBW/29dQX196oiAqWOPg/cQCEbt6TwhiG88UYkpTU+RDyeMuy8WLN6pqeE+35L/LXDjhaurUNZ1klE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:79e7241e-297f-45ec-8c5c-b360434b0e32, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:b6bd8b5d-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a8fa960e5b1d4f9f8175c752a8deb27e-20220914
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1622579154; Wed, 14 Sep 2022 09:28:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:28:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:28:16 +0800
Message-ID: <ae2f9ec269c143032ab482ab58dc7539dd4e02b9.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 6/9] drm/mediatek: Add gamma support different
 bank_size for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Sep 2022 09:28:16 +0800
In-Reply-To: <3c67e742bdb06e55ba170a0a6dc79e6f6833c0e7.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-7-jason-jh.lin@mediatek.com>
 <3c67e742bdb06e55ba170a0a6dc79e6f6833c0e7.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for the reviews.

On Mon, 2022-09-12 at 13:12 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> > Add multiple bank support for mt8195.
> > If bank size is 0 which means no bank support.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 +++++++++++++------
> > ----
> >  1 file changed, 26 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index be82d15a5204..45da2b6206c8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -21,6 +21,7 @@
> >  #define GAMMA_LUT_EN					BIT(1)
> >  #define GAMMA_DITHERING					BIT(2)
> >  #define DISP_GAMMA_SIZE				0x0030
> > +#define DISP_GAMMA_BANK				0x0100
> >  #define DISP_GAMMA_LUT				0x0700
> >  
> >  #define LUT_10BIT_MASK				0x03ff
> > @@ -33,6 +34,7 @@ struct mtk_disp_gamma_data {
> >  	bool lut_diff;
> >  	u16 lut_size;
> >  	u8 lut_bits;
> > +	u16 bank_size;
> >  };
> >  
> >  /*
> > @@ -75,9 +77,10 @@ void mtk_gamma_set_common(struct device *dev,
> > void
> > __iomem *regs, struct drm_crt
> >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >  	bool lut_diff = false;
> >  	u16 lut_size = LUT_SIZE_DEFAULT;
> > +	u16 bank_size = lut_size;
> >  	u8 lut_bits = LUT_BITS_DEFAULT;
> >  	u8 shift_bits;
> > -	unsigned int i, reg;
> > +	unsigned int i, j, reg, bank_num;
> >  	struct drm_color_lut *lut;
> >  	void __iomem *lut_base;
> >  	u32 word, mask;
> > @@ -87,8 +90,10 @@ void mtk_gamma_set_common(struct device *dev,
> > void
> > __iomem *regs, struct drm_crt
> >  		lut_diff = gamma->data->lut_diff;
> >  		lut_size = gamma->data->lut_size;
> >  		lut_bits = gamma->data->lut_bits;
> > +		bank_size = gamma->data->bank_size;
> >  	}
> >  
> > +	bank_num = lut_size / bank_size;
> >  	shift_bits = LUT_INPUT_BITS - lut_bits;
> >  	mask = GENMASK(lut_bits - 1, 0);
> >  
> > @@ -98,25 +103,27 @@ void mtk_gamma_set_common(struct device *dev,
> > void __iomem *regs, struct drm_crt
> >  		writel(reg, regs + DISP_GAMMA_CFG);
> >  		lut_base = regs + DISP_GAMMA_LUT;
> >  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> > -		for (i = 0; i < lut_size; i++) {
> > -
> > -			if (!lut_diff || (i % 2 == 0)) {
> > -				word = (((lut[i].red >> shift_bits) &
> > mask) << 20) +
> > -					(((lut[i].green >> shift_bits)
> > & mask) << 10) +
> > -					((lut[i].blue >> shift_bits) &
> > mask);
> > -			} else {
> > -				diff[0] = (lut[i].red >> shift_bits) -
> > -					  (lut[i - 1].red >>
> > shift_bits);
> > -				diff[1] = (lut[i].green >> shift_bits)
> > -
> > -					  (lut[i - 1].green >>
> > shift_bits);
> > -				diff[2] = (lut[i].blue >> shift_bits) -
> > -					  (lut[i - 1].blue >>
> > shift_bits);
> > -
> > -				word = ((diff[0] & mask) << 20) +
> > -					((diff[1] & mask) << 10) +
> > -					(diff[2] & mask);
> > +		for (j = 0; j < bank_num; j++) {
> > +			writel(j, regs + DISP_GAMMA_BANK);
> 
> Does mt8173 and mt8183 has this register? If not, do not set this
> register in mt8173 and mt8183.
> 
> Regards,
> CK

mt8173 and mt8183 don't have this register, so I'll fix it.

Regards,
Jason-JH.Lin


