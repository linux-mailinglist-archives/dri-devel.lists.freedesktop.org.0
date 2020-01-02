Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD712E53C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006026E073;
	Thu,  2 Jan 2020 10:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC71A89B4D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 05:44:20 +0000 (UTC)
X-UUID: ff7f549597e94f02bc9f66c7ec3850d8-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=vyS7IWI4BRwbY7rXWub/fMYSKrH1gB0wk72YU/M9xPs=; 
 b=E8aniT6kL8DKFgcVP6lGajjs5ANPZQTKeHZF8HDbx1MvwbvTVM+LqbmzWEUG1vLdu8Da7XyaKivHp7mF94TaFzFfeq9/6z3i1TooERNgyZCkTGagJxUhILdHS4xIuslLf/yn2i1DdnSNT8XTfOiKL8F5CoQPS7xmU4Q836u7xoU=;
X-UUID: ff7f549597e94f02bc9f66c7ec3850d8-20200102
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 790673981; Thu, 02 Jan 2020 13:44:17 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 2 Jan 2020 13:43:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:44:40 +0800
Message-ID: <1577943764.15116.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6, 13/14] drm/mediatek: add fifo_size into rdma private
 data
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 2 Jan 2020 13:42:44 +0800
In-Reply-To: <1577942440.24650.5.camel@mtksdaap41>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-14-git-send-email-yongqiang.niu@mediatek.com>
 <1577942440.24650.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-01-02 at 13:20 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > the fifo size of rdma in mt8183 is different.
> > rdma0 fifo size is 5k
> > rdma1 fifo size is 2k
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > index 405afef..691480b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -62,6 +62,7 @@ struct mtk_disp_rdma {
> >  	struct mtk_ddp_comp		ddp_comp;
> >  	struct drm_crtc			*crtc;
> >  	const struct mtk_disp_rdma_data	*data;
> > +	u32				fifo_size;
> >  };
> >  
> >  static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
> > @@ -130,10 +131,16 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> >  	unsigned int threshold;
> >  	unsigned int reg;
> >  	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
> > +	u32 rdma_fifo_size;
> >  
> >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_0, 0xfff, width);
> >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_1, 0xfffff, height);
> >  
> > +	if (rdma->fifo_size)
> > +		rdma_fifo_size = rdma->fifo_size;
> > +	else
> > +		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
> > +
> >  	/*
> >  	 * Enable FIFO underflow since DSI and DPI can't be blocked.
> >  	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> > @@ -142,7 +149,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> >  	 */
> >  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> >  	reg = RDMA_FIFO_UNDERFLOW_EN |
> > -	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
> > +	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> >  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> >  	writel(reg, comp->regs + DISP_REG_RDMA_FIFO_CON);
> >  }
> > @@ -284,6 +291,18 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
> >  		return comp_id;
> >  	}
> >  
> > +	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
> 
> "mediatek,rdma_fifo_size" does not exists in binding document.
> 
> > +		ret = of_property_read_u32(dev->of_node,
> > +					   "mediatek,rdma_fifo_size",
> > +					   &priv->fifo_size);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to get rdma fifo size\n");
> > +			return ret;
> > +		}
> > +
> > +		priv->fifo_size *= SZ_1K;
> 
> Why not define fifo_size in 'bytes' ?
> 
> Regards,
> CK

this is align the definition of fifo_size in mtk_disp_rdma_data, it is
SZ_1K, 
and the macro RDMA_FIFO_PSEUDO_SIZE calculated with SZ_1K
> 
> > +	}
> > +
> >  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> >  				&mtk_disp_rdma_funcs);
> >  	if (ret) {
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
