Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD494FE141
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8910E940;
	Tue, 12 Apr 2022 12:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464A10E940
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:56:13 +0000 (UTC)
X-UUID: 195961d0d3824634bd16168e6558019d-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c7eac565-ae39-4f72-bfa8-f628effbda32, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:47
X-CID-INFO: VERSION:1.1.4, REQID:c7eac565-ae39-4f72-bfa8-f628effbda32, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:47
X-CID-META: VersionHash:faefae9, CLOUDID:5f41e8a8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:IGNORED,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:4,EDM:-3,File:ni
 l,QS:0,BEC:nil
X-UUID: 195961d0d3824634bd16168e6558019d-20220412
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 784011843; Tue, 12 Apr 2022 20:56:09 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:56:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 20:56:07 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 20:56:05 +0800
Message-ID: <07f7e011dce0f443df3f259b9e1a8b4db90dc803.camel@mediatek.com>
Subject: Re: [PATCH v4,2/2] drm/mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Date: Tue, 12 Apr 2022 20:56:36 +0800
In-Reply-To: <17f8b17fee57115fb885e86a4b9aab4e7ed2df86.camel@mediatek.com>
References: <1649645584-13186-1-git-send-email-xinlei.lee@mediatek.com>
 <1649645584-13186-3-git-send-email-xinlei.lee@mediatek.com>
 <17f8b17fee57115fb885e86a4b9aab4e7ed2df86.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 16:20 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Mon, 2022-04-11 at 10:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add the compatible because use different .data in mt8186.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..824d7da41c6a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -815,6 +815,14 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> >  };
> >  
> > +static const struct mtk_dpi_conf mt8186_conf = {
> > +	.cal_factor =  mt8183_calculate_factor,
> > +	.reg_h_fre_con = 0xe0,
> > +	.max_clock_khz = 150000,
> > +	.output_fmts = mt8183_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +};
> > +
> >  static const struct mtk_dpi_conf mt8192_conf = {
> >  	.cal_factor = mt8183_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> > @@ -942,6 +950,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[]
> > = {
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = &mt8183_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = &mt8186_conf,
> 
> If Nicolas' patch [1] is correct, this should be
> 
> .data = &mt8192_conf,
> 
> Could you help to comfirm patch [1] is correct or not?
> 
> [1] 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220408013950.674477-1-nfraprado@collabora.com/
> 
> Regards,
> CK
> 
> > +	},
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = &mt8192_conf,
> >  	},
> 
> 

Hi CK:

Thanks for your review.
I checked that mt8186_conf & mt8192_conf are the same.
In the next version, I will remove mt8186_conf and reuse mt8192_conf.

Best Regards!
xinlei

