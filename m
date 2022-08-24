Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7259F12F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 03:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73E10E8EF;
	Wed, 24 Aug 2022 01:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF8E10E285
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 01:59:16 +0000 (UTC)
X-UUID: a65902daac4f4392aff5e84f0aea87b1-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KlPzLGpmgNRlFL0JUMEWUMIjTIqCJVvNroVLdGPggLo=; 
 b=jJ2Oh27Xo7OitJ0TGPqFHvRYBLz05e0sIFLjCwHg76CBsx1MKd5XyOuiWvO6kr6dTWY3/njrSKrrjxX+Rkzqgg8395xFfNTxQu2aXTE/02Pz12PNmPwTEWt8tiURSXH7PVOMjkbitEIW0W8mfDYxDl9opZq1BcLw3z+dYyMefjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:e6181002-933a-4443-ac6d-c4a7d32bd825, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:56eb97c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a65902daac4f4392aff5e84f0aea87b1-20220824
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1258293301; Wed, 24 Aug 2022 09:59:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 09:59:09 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 09:59:08 +0800
Message-ID: <447770ead17338241849dbbb2281fa8b4e31aefa.camel@mediatek.com>
Subject: Re: [PATCH v3,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Wed, 24 Aug 2022 09:59:21 +0800
In-Reply-To: <20220823201622.meedlqvmixf5ukdf@notapiano>
References: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
 <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
 <20220823201622.meedlqvmixf5ukdf@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-08-23 at 16:16 -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 23, 2022 at 02:18:37PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> > Because MT8186 HW has been modified at that time, SW needs to
> > cooperate.
> > And the register (MMSYS) reserved for dpi will be used for output
> > format control (dual_edge/single_edge).
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > ---
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> 
> [..]
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @rgb888_dual_enable: Control output format for mt8186.
> 
> Let's not mention mt8186 in the description to keep the property
> generic. Also,
> this description should say what having 'rgb888_dual_enable = true'
> indicates
> about the hardware (in this case mt8186) and it currently doesn't.
> 
> Let's take a step back. What does 'dual enable' mean in this context
> and how
> does it relate to 'dual edge' and the dpi output format? By answering
> those
> questions we can find a description (and maybe variable name) that
> makes more
> sense.
> 
> >   */
> 
> [..]
> > @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +	if (dpi->conf->rgb888_dual_enable)
> > +		mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > DPI_RGB888_DDR_CON,
> > +					     DPI_FORMAT_MASK, NULL);
> 
> This if block should be further indented.
> 
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> >  	}
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -235,4 +235,8 @@
> >  #define MATRIX_SEL_RGB_TO_JPEG		0
> >  #define MATRIX_SEL_RGB_TO_BT601		2
> >  
> > +#define DPI_FORMAT_MASK			0x1
> > +#define DPI_RGB888_DDR_CON		BIT(0)
> > +#define DPI_RGB565_SDR_CON		BIT(1)
> 
> I'm not sure if it would make more sense to have these definitions in
> the mmsys
> header since they're configurations of a register in mmsys'
> iospace... I think
> we can keep them here but at least add a comment above:
> 
> /* Values for DPI configuration in MMSYS address space */
> 
> Thanks,
> Nícolas

Hi Nícolas:
Thanks for your careful review!
I will modify the description of this member variable and add the
hardware state corresponding to the software setting.
(eg. rgb888_dual_enable = true the hardware output rgb888_dual_edge
format data)

Your suggestion is very necessary, maybe my name is not accurate
enough, this flag is to enable RGB888_dual_edge format output. 
Would it be better for the variable to be called
RGB888_dual_edge_enable then?

Also I'll fix the code formatting issues
and add descriptions to the mmsys registers in the mtk_dpi_regs.h file.

Best Regards!
xinlei

