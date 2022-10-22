Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01326608B35
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 12:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554BA10E38C;
	Sat, 22 Oct 2022 10:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0B810E38C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 10:01:57 +0000 (UTC)
X-UUID: 66f1eb40d87d482b83539a80ed225937-20221022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BXeS4KiL1GsZqKt6WGTKpX3gE33/FCx98tbW/aiIaJ4=; 
 b=Jf8qPeJ5ZiaYZ1tZwiyNDbaiK7LdTCqu5OJIwkkW5ZlZbbo6Wxt4JX+Tr2ABsp9Txacd9VRWtvG9gz/vA3ePkOGyQlofaD+JqlQitJrbmOdITPIlG7KteD3atchho7P1adaIo6riEfoIOXa7JP7DzJ2JKVU5Bw7lmFcuyOntz0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:73a05a31-e734-40dc-820b-3f27c91bfea4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:552954e4-e572-4957-be22-d8f73f3158f9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 66f1eb40d87d482b83539a80ed225937-20221022
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1742103474; Sat, 22 Oct 2022 18:01:51 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 22 Oct 2022 18:01:49 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 22 Oct 2022 18:01:49 +0800
Message-ID: <055cc7b19d19a57654e00e9173bada31fc251a10.camel@mediatek.com>
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Sat, 22 Oct 2022 18:01:56 +0800
In-Reply-To: <20221021153912.bddr5g4tm4kch7dn@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
 <20221020164022.vtnumo3fob2sh54w@notapiano>
 <2e1899236144774d4a1c0224532b11ef7e1f9862.camel@mediatek.com>
 <20221021153912.bddr5g4tm4kch7dn@notapiano>
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
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-10-21 at 11:39 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Oct 21, 2022 at 08:18:25PM +0800, xinlei.lee wrote:
> > On Thu, 2022-10-20 at 12:40 -0400, Nícolas F. R. A. Prado wrote:
> > > On Wed, Oct 19, 2022 at 10:52:15AM +0800, xinlei.lee@mediatek.com
> > > wrote:
> 
> [..]
> > > > @@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct
> > > > mtk_dpi
> > > > *dpi)
> > > >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> > > >  			     dpi->output_fmt ==
> > > > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> > > >  			     EDGE_SEL : 0, EDGE_SEL);
> > > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi-
> > > > >mmsys_dev,
> > > > MTK_DPI_RGB888_DDR_CON);
> > > >  	} else {
> > > >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN |
> > > > DDR_4PHASE,
> > > > 0);
> > > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi-
> > > > >mmsys_dev,
> > > > MTK_DPI_RGB888_SDR_CON);
> > > 
> > > I know this isn't one of the formats supported by MT8186, but
> > > since
> > > we're using
> > > platform-agnostic formats now... This else branch in theory could
> > > also run for a
> > > format like MEDIA_BUS_FMT_YUYV8_1X16. Would it make sense to set
> > > MTK_DPI_RGB888_SDR_CON in that case?
> > > 
> > > Thanks,
> > > Nícolas
> > > 
> > > >  	}
> > > 
> > > [..]
> > 
> > Hi Nícolas:
> > 
> > Thanks for your review!
> >  
> > You are right, I understand you think this MTK_DPI_RGB888_SDR_CON 
> > format seems useless as it will not be set, I confirmed with the 
> > designer how the setting in mmsys affects the output format of the 
> > MT8186, this mmsys setting will not be used by other ICs.
> > 
> > As mentioned earlier, the mmsys setting will make the MT8186dpi
> > have 
> > four output formats, even though the MT8186 dpi may not use them
> > all.
> > 
> > So what needs to change here?
> 
> We could check that the format in the else path is a single edge
> RGB888 format
> like MEDIA_BUS_FMT_RGB888_1X24 before setting the mmsys config, but
> there are
> also other formats possible, and I actually don't think it's worth it
> to
> complicate the logic further to protect from an edge-case that can't
> be hit
> yet...
> 
> So just leave it as it is. We can worry about it when/if a non-RGB888 
> single
> edge format needs to be setup on mmsys.
> 
> So,
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas


Hi Nícolas:

Thanks for your review!

Best Regards!
xinlei

