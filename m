Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3B12E35C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 08:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272689CB3;
	Thu,  2 Jan 2020 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4D4489CB3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 07:37:06 +0000 (UTC)
X-UUID: 61fee457429949338280c00d953cb770-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PCH3d6ww20Xcb8eTPquPc5VeMWFXLY/lz4kI3WEDJSA=; 
 b=ptTe+t9wX5cT1eWh3tiaue7/s4w9FkX1JQb8KxZBigS6kJse9P2T4KR3L0eHGs5VUFHm/YaEfqd6GLqgDhgtbM+3zw1iCR7M/krCX5FSpcEpIqZzHgtKZKK/TnuGrDD+AZnbY6zSt42qEiYp5dIbckAD5WUpKeu2ODPR56bxrd4=;
X-UUID: 61fee457429949338280c00d953cb770-20200102
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1369051708; Thu, 02 Jan 2020 15:32:00 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 15:30:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 15:32:24 +0800
Message-ID: <1577950317.12633.3.camel@mtksdaap41>
Subject: Re: [PATCH v6, 13/14] drm/mediatek: add fifo_size into rdma private
 data
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 2 Jan 2020 15:31:57 +0800
In-Reply-To: <1577943764.15116.3.camel@mhfsdcap03>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-14-git-send-email-yongqiang.niu@mediatek.com>
 <1577942440.24650.5.camel@mtksdaap41> <1577943764.15116.3.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 235C97CA29A4272D17AFBE5A53C10D0B4DF8A318DC6B8E23D5887A814BBD57882000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Thu, 2020-01-02 at 13:42 +0800, Yongqiang Niu wrote:
> On Thu, 2020-01-02 at 13:20 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > > the fifo size of rdma in mt8183 is different.
> > > rdma0 fifo size is 5k
> > > rdma1 fifo size is 2k
> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > index 405afef..691480b 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > @@ -62,6 +62,7 @@ struct mtk_disp_rdma {
> > >  	struct mtk_ddp_comp		ddp_comp;
> > >  	struct drm_crtc			*crtc;
> > >  	const struct mtk_disp_rdma_data	*data;
> > > +	u32				fifo_size;
> > >  };
> > >  
> > >  static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
> > > @@ -130,10 +131,16 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> > >  	unsigned int threshold;
> > >  	unsigned int reg;
> > >  	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
> > > +	u32 rdma_fifo_size;
> > >  
> > >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_0, 0xfff, width);
> > >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_1, 0xfffff, height);
> > >  
> > > +	if (rdma->fifo_size)
> > > +		rdma_fifo_size = rdma->fifo_size;
> > > +	else
> > > +		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
> > > +
> > >  	/*
> > >  	 * Enable FIFO underflow since DSI and DPI can't be blocked.
> > >  	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> > > @@ -142,7 +149,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> > >  	 */
> > >  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> > >  	reg = RDMA_FIFO_UNDERFLOW_EN |
> > > -	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
> > > +	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> > >  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> > >  	writel(reg, comp->regs + DISP_REG_RDMA_FIFO_CON);
> > >  }
> > > @@ -284,6 +291,18 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
> > >  		return comp_id;
> > >  	}
> > >  
> > > +	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
> > 
> > "mediatek,rdma_fifo_size" does not exists in binding document.
> > 
> > > +		ret = of_property_read_u32(dev->of_node,
> > > +					   "mediatek,rdma_fifo_size",
> > > +					   &priv->fifo_size);
> > > +		if (ret) {
> > > +			dev_err(dev, "Failed to get rdma fifo size\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		priv->fifo_size *= SZ_1K;
> > 
> > Why not define fifo_size in 'bytes' ?
> > 
> > Regards,
> > CK
> 
> this is align the definition of fifo_size in mtk_disp_rdma_data, it is
> SZ_1K, 
> and the macro RDMA_FIFO_PSEUDO_SIZE calculated with SZ_1K

I mean why not set the fifo size in bytes in device tree. So you need
not to do '*= SZ_1K' here. I think unit of fifo size in kernel is byte.

Regards,
CK

> > 
> > > +	}
> > > +
> > >  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> > >  				&mtk_disp_rdma_funcs);
> > >  	if (ret) {
> > 
> > 
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
