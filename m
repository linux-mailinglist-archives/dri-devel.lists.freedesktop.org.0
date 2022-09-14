Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021695B7E61
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 03:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388C10E7BC;
	Wed, 14 Sep 2022 01:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D9F10E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:37:05 +0000 (UTC)
X-UUID: 76e21c1ea1564a8aa8d638e30aae8686-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wd1G08HC6flVRDFOB/8mfAvI8N21GR0U87+/DU0QX78=; 
 b=m9INvP0usr9U1of8vPtJUZ6gGcfF9SSRrTpV2O1YwKV+bDcG5EVDtvetf6esF2doqx176VzxNL47qkIhZksYngLvpZrNnQB8snXMDA2D+uPeRqb0q7YIpAsynlvOnoytVIoX5c8SULblSFbjSyi+2oHpC2uiK3T9hURYvpnwuhU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:3cea9fa8-e58f-419a-9ee7-2069c7332467, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:3cea9fa8-e58f-419a-9ee7-2069c7332467, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:45214cf6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220914093702FRCW1R39,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
 Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 76e21c1ea1564a8aa8d638e30aae8686-20220914
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2058943843; Wed, 14 Sep 2022 09:37:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:37:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:37:00 +0800
Message-ID: <374cb457bdd1d77ad5e81b2d24538b6750aebf95.camel@mediatek.com>
Subject: Re: [PATCH v3 5/9] drm/mediatek: Add gamma support different
 lut_bits for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 14 Sep 2022 09:36:58 +0800
In-Reply-To: <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-6-jason-jh.lin@mediatek.com>
 <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the reviews.

On Mon, 2022-09-12 at 12:25 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > Add lut_bits in gamma driver data for each SoC and adjust the usage
> > of lut_bits in mtk_drm_gamma_set_common().
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++
> > -------
> >   1 file changed, 25 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index e69d0b205b9a..155fb5d94d79 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -25,11 +25,14 @@
> >   
> >   #define LUT_10BIT_MASK				0x03ff
> >   #define LUT_SIZE_DEFAULT			512 /* for setting
> > gamma lut from AAL */
> > +#define LUT_BITS_DEFAULT			10
> > +#define LUT_INPUT_BITS				16 /* input lut
> > bit from application */
> >   
> >   struct mtk_disp_gamma_data {
> >   	bool has_dither;
> >   	bool lut_diff;
> >   	u16 lut_size;
> > +	u8 lut_bits;
> >   };
> >   
> >   /*
> > @@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev,
> > void __iomem *regs, struct drm_crt
> >   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >   	bool lut_diff = false;
> >   	u16 lut_size = LUT_SIZE_DEFAULT;
> > +	u8 lut_bits = LUT_BITS_DEFAULT;
> 
> Please fix this double assignment like shown in the comment for patch
> [4/9].
> 
> Thanks,
> Angelo
> 
OK, I'll fix this.
Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

