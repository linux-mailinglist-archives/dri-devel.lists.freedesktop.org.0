Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8E3094D2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4065F6ECB3;
	Sat, 30 Jan 2021 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DD706E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:59:10 +0000 (UTC)
X-UUID: 60d96d97d3a449958c4afbeaa69f338f-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=O6IOBaAxQfjWwIu5XGkj6uilpVZbfJZL9rj3WI2ksQo=; 
 b=JAkdATioTyv8NTkJq10He3r2NhFs4Fhdz/P10dKvS6L1df2RzAZH4y4/xenvMoDoolN49ugVSlTlJ0LRsLn2OMVVm5AUgnVa/T2Gm9sml74cE4JD8uZYymJKJJzdNGUuG6duRrV1lK6UlFDCYqmiLKu53Nw2R+YxVslVjBwsTTU=;
X-UUID: 60d96d97d3a449958c4afbeaa69f338f-20210129
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1343829428; Fri, 29 Jan 2021 16:59:06 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 16:59:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:59:03 +0800
Message-ID: <1611910743.24406.3.camel@mhfsdcap03>
Subject: Re: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for
 ccorr
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Fri, 29 Jan 2021 16:59:03 +0800
In-Reply-To: <1611909641.31184.11.camel@mtksdaap41>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-7-hsinyi@chromium.org>
 <1611909641.31184.11.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-01-29 at 16:40 +0800, CK Hu wrote:
> Hi, Hsin-Yi:
> 
> On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > matrix bits of mt8183 is 12
> > matrix bits of mt8192 is 13
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > index 0c68090eb1e92..1c7163a12f3b1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > @@ -31,8 +31,10 @@
> >  #define DISP_CCORR_COEF_3			0x008C
> >  #define DISP_CCORR_COEF_4			0x0090
> >  
> > +#define CCORR_MATRIX_BITS			12
> > +
> >  struct mtk_disp_ccorr_data {
> > -	u32 reserved;
> > +	u32 matrix_bits;
> >  };
> >  
> >  /**
> > @@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> >  	uint16_t coeffs[9] = { 0 };
> >  	int i;
> >  	struct cmdq_pkt *cmdq_pkt = NULL;
> > +	u32 matrix_bits;
> >  
> >  	if (!blob)
> >  		return;
> > @@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
> >  	ctm = (struct drm_color_ctm *)blob->data;
> >  	input = ctm->matrix;
> >  
> > -	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> > +	if (ccorr->data)
> > +		matrix_bits = ccorr->data->matrix_bits;
> > +	else
> > +		matrix_bits = CCORR_MATRIX_BITS;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
> >  		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> > +		if (matrix_bits > CCORR_MATRIX_BITS)
> > +			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);
> 
> I think format of MT8192 ccorr coeffs is s1.11, after
> mtk_ctm_s31_32_to_s1_10(), you lose one bit precision. So modify
> mtk_ctm_s31_32_to_s1_10() to get maximum precision.
> 
> Regards,
> CK

mt8183 s2.10, default value 1024
mt8192 s2.11, default value 2048
> 
> > +	}
> >  
> >  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
> >  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> > @@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> > +	.matrix_bits = CCORR_MATRIX_BITS,
> > +};
> > +
> >  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
> > -	{ .compatible = "mediatek,mt8183-disp-ccorr"},
> > +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> > +	  .data = &mt8183_ccorr_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
