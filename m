Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F75A1F8F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 05:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC010E373;
	Fri, 26 Aug 2022 03:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC2310E373
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 03:58:27 +0000 (UTC)
X-UUID: 871b9f6c7bb048f6b15b4c079ca0b368-20220826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n4tr0+lGnjhP1+HG3q5WNy3WWhM2Giyan/ikAAd98CM=; 
 b=Ks7jHF8fgmUWQ5iQHJR2ySFn5w6xqczk3EFZRHqcOvUp7l5NIORuTkAqq4eQxmU3a1NH8mmEG2pFe34pQdKNdMRwqVAb2KyedHD2ETC4wtfk9xpI0/g+G0g2zRmDt2rLUAt156YYxe3eDTVwoejND71rkMtrS5OAdtRVyhYYGmU=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:22be23b3-d457-4188-8f15-e6f6df419beb, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:54
X-CID-INFO: VERSION:1.1.10, REQID:22be23b3-d457-4188-8f15-e6f6df419beb, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_H
 amU,ACTION:release,TS:54
X-CID-META: VersionHash:84eae18, CLOUDID:a0c9aacf-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:2794d5b7ac3e,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 871b9f6c7bb048f6b15b4c079ca0b368-20220826
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 207034274; Fri, 26 Aug 2022 11:58:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 26 Aug 2022 11:58:18 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 26 Aug 2022 11:58:18 +0800
Message-ID: <a78dbe566a352b2375dfaafc277d757db764d642.camel@mediatek.com>
Subject: Re: [PATCH v3,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 26 Aug 2022 11:58:29 +0800
In-Reply-To: <20220824154417.5cbfsgqjwajvplvk@notapiano>
References: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
 <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
 <20220823201622.meedlqvmixf5ukdf@notapiano>
 <447770ead17338241849dbbb2281fa8b4e31aefa.camel@mediatek.com>
 <20220824154417.5cbfsgqjwajvplvk@notapiano>
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

On Wed, 2022-08-24 at 11:44 -0400, Nícolas F. R. A. Prado wrote:
> On Wed, Aug 24, 2022 at 09:59:21AM +0800, xinlei.lee wrote:
> > On Tue, 2022-08-23 at 16:16 -0400, Nícolas F. R. A. Prado wrote:
> > > On Tue, Aug 23, 2022 at 02:18:37PM +0800, xinlei.lee@mediatek.com
> > > wrote:
> > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > Dpi output needs to adjust the output format to dual edge for
> > > > MT8186.
> > > > Because MT8186 HW has been modified at that time, SW needs to
> > > > cooperate.
> > > > And the register (MMSYS) reserved for dpi will be used for
> > > > output
> > > > format control (dual_edge/single_edge).
> > > > 
> > > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > ---
> > > 
> > > [..]
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > 
> > > [..]
> > > >   * @yuv422_en_bit: Enable bit of yuv422.
> > > >   * @csc_enable_bit: Enable bit of CSC.
> > > >   * @pixels_per_iter: Quantity of transferred pixels per
> > > > iteration.
> > > > + * @rgb888_dual_enable: Control output format for mt8186.
> > > 
> > > Let's not mention mt8186 in the description to keep the property
> > > generic. Also,
> > > this description should say what having 'rgb888_dual_enable =
> > > true'
> > > indicates
> > > about the hardware (in this case mt8186) and it currently
> > > doesn't.
> > > 
> > > Let's take a step back. What does 'dual enable' mean in this
> > > context
> > > and how
> > > does it relate to 'dual edge' and the dpi output format? By
> > > answering
> > > those
> > > questions we can find a description (and maybe variable name)
> > > that
> > > makes more
> > > sense.
> > > 
> > > >   */
> > > 
> > > [..]
> > > > @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct
> > > > mtk_dpi
> > > > *dpi)
> > > >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> > > >  			     dpi->output_fmt ==
> > > > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> > > >  			     EDGE_SEL : 0, EDGE_SEL);
> > > > +	if (dpi->conf->rgb888_dual_enable)
> > > > +		mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > > > DPI_RGB888_DDR_CON,
> > > > +					     DPI_FORMAT_MASK,
> > > > NULL);
> > > 
> > > This if block should be further indented.
> > > 
> > > >  	} else {
> > > >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN |
> > > > DDR_4PHASE,
> > > > 0);
> > > >  	}
> > > 
> > > [..]
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > @@ -235,4 +235,8 @@
> > > >  #define MATRIX_SEL_RGB_TO_JPEG		0
> > > >  #define MATRIX_SEL_RGB_TO_BT601		2
> > > >  
> > > > +#define DPI_FORMAT_MASK			0x1
> > > > +#define DPI_RGB888_DDR_CON		BIT(0)
> > > > +#define DPI_RGB565_SDR_CON		BIT(1)
> > > 
> > > I'm not sure if it would make more sense to have these
> > > definitions in
> > > the mmsys
> > > header since they're configurations of a register in mmsys'
> > > iospace... I think
> > > we can keep them here but at least add a comment above:
> > > 
> > > /* Values for DPI configuration in MMSYS address space */
> > > 
> > > Thanks,
> > > Nícolas
> > 
> > Hi Nícolas:
> > Thanks for your careful review!
> > I will modify the description of this member variable and add the
> > hardware state corresponding to the software setting.
> > (eg. rgb888_dual_enable = true the hardware output rgb888_dual_edge
> > format data)
> > 
> > Your suggestion is very necessary, maybe my name is not accurate
> > enough, this flag is to enable RGB888_dual_edge format output. 
> > Would it be better for the variable to be called
> > RGB888_dual_edge_enable then?
> 
> The thing is, we also output in rgb888 dual edge format on mt8183 and
> mt8192,
> and therefore set DDR_EN in mtk_dpi_dual_edge(), right? But, as you
> said, we
> don't need to enable this new rgb888_dual_enable variable on those
> platforms,
> only on mt8186. So that's why I don't think the current
> name/description is
> suitable. If the variable only needs to be set on mt8186, it should
> have a name
> and description that shows what is different between mt8186 and the
> others. But
> without containing the "mt8186" name, since this might happen on
> other SoCs
> later on.
> 
> My understanding is that even though both mt8186 and mt8192 output in
> the rgb888
> dual edge format, only mt8186 is able to configure the edge setting
> in MMSYS (so
> on mt8192 it would be hardwired to dual edge and not possible to
> change). So
> what I propose is
> 
> Name: edge_cfg_in_mmsys
> 
> Description: "If the edge configuration for DPI's output needs to be
> set in MMSYS"
> 
> But maybe since you know the hardware, you might be able to find an
> even better
> name/description.
> 
> Thanks,
> Nícolas
Hi Nícolas:

Thanks for your suggestion.

At present, it is true that only 8186 needs to set this flag when
outputting dual_edge format. 
If other ICs need to modify the output format, they only need to modify
the DPI register. 
On the 8186, DPI MUX (0x400) is required for synchronous modification.
A more detailed explanation of this DPI MUX register is 
bit[0]: dual_edge enable, bit[1]: rgb565_en.
And the priority of bit[1] is higher, the following is the format of
different combinations:
00: SDR enable
01: DDR enable
10: RGB565
11: RGB565
 
The hardware characteristics can be ignored. Based on this situation,
what is your opinion if it is changed to "edge_cfg_in_mmsys"?
Best Regards!
Xinlei

