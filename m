Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F860769F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 13:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F1410E044;
	Fri, 21 Oct 2022 11:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587FE10E044
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 11:59:07 +0000 (UTC)
X-UUID: 9af27a17997b4497849decca31f83c97-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AuKJv5zVRpNvyNosn7gMSN75X/int55vqM+uQfxNkxE=; 
 b=QEne0TaRdolTmVW+SQQ2EC0LeQTHiLbKKuj872vnnTgv1z76bZC7kxjblXyHg53sNeIc05fbXhhY4unqWYPzMWybb9nvZJscalfzM2AWSlIO6Dx1yOdQC484Od9FjR9RoJbUFwzk6Sm0k7N+wpUFRh2vfzCyWE6hIfnR49ZkuFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:d19f590a-83d9-4e15-b6b7-a9ba698d9879, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:66a1b26c-89d3-4bfa-baad-dc632a24bca3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9af27a17997b4497849decca31f83c97-20221021
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2017664211; Fri, 21 Oct 2022 19:58:58 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 19:58:56 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 21 Oct 2022 19:58:55 +0800
Message-ID: <28c0e6890daeb6bf17779243b23f60fa138b2fd2.camel@mediatek.com>
Subject: Re: [PATCH v12,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 21 Oct 2022 19:59:02 +0800
In-Reply-To: <20221020163310.tpkjvr7pe5vhwylh@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-2-git-send-email-xinlei.lee@mediatek.com>
 <20221020163310.tpkjvr7pe5vhwylh@notapiano>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-10-20 at 12:33 -0400, Nícolas F. R. A. Prado wrote:
> Hi,
> 
> On Wed, Oct 19, 2022 at 10:52:14AM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > The difference between MT8186 and other ICs is that when modifying
> > the
> > output format, we need to modify the mmsys_base+0x400 register to
> > take
> > effect.
> > So when setting the dpi output format, we need to call mmsys_func
> > to set
> 
> mmsys_func isn't something that exists in the code. Instead mention
> the actual
> function name: mtk_mmsys_ddp_dpi_fmt_config.
> 
> > it to MT8186 synchronously.
> 
> 
> Here, before saying that the commit adds all the settings for dpi,
> you could
> have mentioned that the previous commit lacked those, to make it
> clearer:
> 
> Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> output for MT8186")
> lacked some of the possible output formats and also had a wrong
> bitmask.
> 
> 
> > Adding mmsys all the settings that need to be modified with dpi are
> > for
> > mt8186.
> 
> This sentence I would change to the following one:
> 
> Add the missing output formats and fix the bitmask.
> 
> 
> Finally, you're also making the function more HW-agnostic (although
> in my
> opinion this could've been a future separate commit), so it's worth
> mentioning
> it here:
> 
> While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use
> generic formats,
> so that it is slightly easier to extend for other platforms.
> 
> > 
> > Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
> > output for MT8186")
> 
> The fixes tag should be kept in a single line, without wrapping.
> 
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
> >  drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++
> > ------
> >  include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
> >  3 files changed, 33 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index 09b1ccbc0093..035aec1eb616 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -5,9 +5,11 @@
> >  
> >  /* Values for DPI configuration in MMSYS address space */
> >  #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> > -#define DPI_FORMAT_MASK					0x1
> > -#define DPI_RGB888_DDR_CON				BIT(0)
> > -#define DPI_RGB565_SDR_CON				BIT(1)
> > +#define DPI_FORMAT_MASK					GENMASK
> > (1, 0)
> > +#define DPI_RGB888_SDR_CON				0
> > +#define DPI_RGB888_DDR_CON				1
> > +#define DPI_RGB565_SDR_CON				2
> > +#define DPI_RGB565_DDR_CON				3
> 
> These defines should all have a MT8186_ prefix. This will avoid
> confusions now
> that mtk_mmsys_ddp_dpi_fmt_config() is being made more platform-
> agnostic.
> 
> >  
> >  #define MT8186_MMSYS_OVL_CON			0xF04
> >  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index d2c7a87aab87..205f6de45851 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct
> > mtk_mmsys *mmsys, u32 offset, u32 mask,
> >  
> >  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> >  {
> > -	if (val)
> > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > -				      DPI_RGB888_DDR_CON,
> > DPI_FORMAT_MASK);
> > -	else
> > -		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > -				      DPI_RGB565_SDR_CON,
> > DPI_FORMAT_MASK);
> > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > +
> > +	switch (val) {
> > +	case MTK_DPI_RGB888_SDR_CON:
> > +		mtk_mmsys_update_bits(mmsys,
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB888_SDR_CON);
> > +		break;
> > +	case MTK_DPI_RGB565_SDR_CON:
> > +		mtk_mmsys_update_bits(mmsys,
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB565_SDR_CON);
> > +		break;
> > +	case MTK_DPI_RGB565_DDR_CON:
> > +		mtk_mmsys_update_bits(mmsys,
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB565_DDR_CON);
> > +		break;
> > +	case MTK_DPI_RGB888_DDR_CON:
> > +	default:
> > +		mtk_mmsys_update_bits(mmsys,
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB888_DDR_CON);
> > +		break;
> > +	}
> 
> To be honest I don't really see the point of making the function
> slightly more
> platform-agnostic like this. With a single platform making use of it
> it's just
> an unneeded extra abstraction, and it could easily be done when a
> second
> platform starts requiring this as well...
> 
> In any case,
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas
> 
> >  }
> 
> [..]

Hi Nícolas:

Thanks for your detailed reply and correction.
Before sending out the next edition, I have two questions I would like 
to confirm with you in response to your responses:
1.While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use 
generic formats, so that it is slightly easier to extend for other 
platforms.
=> This is to make this mtk_mmsys_ddp_dpi_fmt_config() func more 
general? 
This function may only be used by MT8186, because only MT8186
has 
corresponding modifications on HW, and enables the registers reserved 
in mmsys for dpi use to control the output format. Because this 
register is not defined for other ic, I added control to this function 
call in mtk_dpi.c. If you think there are other ways to make it look 
more generic, where should I correct it?

2. These definitions should all have a MT8186_ prefix. This will avoid 
confusion as mtk_mmsys_ddp_dpi_fmt_config() becomes more platform 
independent.

Honestly, I don't really see the point of making the feature platform-
agnostic like this. Using it on a single platform is just an extra 
abstraction that isn't needed, when a second platform starts needing 
it too, it can be done easily...

=> My understanding here is that prefixing variables with labels is 
more conducive to making functions generic, and can be reused if there 
is such a situation in the future. I understand the importance of 
keeping the function platform agnostic, but as mentioned, it may only 
be used by the MT8186 if there are special cases where other ICs may 
rely on mtk_mmsys_update_bits to create new functions.

The above content is only my understanding. If you have any questions 
or suggestions, we will communicate again.

Looking forward to your reply.

Best Regards!
xinlei

