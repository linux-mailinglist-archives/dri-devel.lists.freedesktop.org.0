Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D246076C1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 14:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A2510E002;
	Fri, 21 Oct 2022 12:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449AC8989C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 12:18:25 +0000 (UTC)
X-UUID: 86cdf9ba460b43a1a67e46e80e6dd068-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FStDW140eCPO9COx9UbUWpdicSyZ8YvIB4IHtRNVQQw=; 
 b=kMqATH2PnVPcblctNQgvwWtTlh++IHhLHHRtfwtKO6XON5fF4vCpH3gvVkkkBFw5sJ10EkeKiQ5VMeRUBri7XNlyj6FJzsUxzHqHZRwI9nqI0fzwmVVVon1dzstsBf9Vp/PBZRih/GsGPD8QTxUf3pFpzEvA077e8uaaKkoLJbQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:713257c8-776f-4edf-a7f6-da81ebc2da1f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:73
X-CID-INFO: VERSION:1.1.12, REQID:713257c8-776f-4edf-a7f6-da81ebc2da1f, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:73
X-CID-META: VersionHash:62cd327, CLOUDID:c0f0b26c-89d3-4bfa-baad-dc632a24bca3,
 B
 ulkID:2210210040350PEJ5T85,BulkQuantity:7,Recheck:0,SF:28|17|19|48|102,TC:
 nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 86cdf9ba460b43a1a67e46e80e6dd068-20221021
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1467051895; Fri, 21 Oct 2022 20:18:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 21 Oct 2022 20:18:19 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Oct 2022 20:18:18 +0800
Message-ID: <2e1899236144774d4a1c0224532b11ef7e1f9862.camel@mediatek.com>
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 21 Oct 2022 20:18:25 +0800
In-Reply-To: <20221020164022.vtnumo3fob2sh54w@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
 <20221020164022.vtnumo3fob2sh54w@notapiano>
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

On Thu, 2022-10-20 at 12:40 -0400, Nícolas F. R. A. Prado wrote:
> On Wed, Oct 19, 2022 at 10:52:15AM +0800, xinlei.lee@mediatek.com
> wrote:
> [..]
> > @@ -134,6 +137,7 @@ struct mtk_dpi_yc_limit {
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> > needs to be set in MMSYS.
> 
> As Angelo suggested previously, this could be written slightly
> shorter as 
> 
>   * @edge_cfg_in_mmsys: Edge configuration for DPI output has to be
> set in MMSYS.
> 
> >   */
> 
> [..]
> > @@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_DDR_CON);
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_SDR_CON);
> 
> I know this isn't one of the formats supported by MT8186, but since
> we're using
> platform-agnostic formats now... This else branch in theory could
> also run for a
> format like MEDIA_BUS_FMT_YUYV8_1X16. Would it make sense to set
> MTK_DPI_RGB888_SDR_CON in that case?
> 
> Thanks,
> Nícolas
> 
> >  	}
> 
> [..]

Hi Nícolas:

Thanks for your review!
 
You are right, I understand you think this MTK_DPI_RGB888_SDR_CON 
format seems useless as it will not be set, I confirmed with the 
designer how the setting in mmsys affects the output format of the 
MT8186, this mmsys setting will not be used by other ICs.

As mentioned earlier, the mmsys setting will make the MT8186dpi have 
four output formats, even though the MT8186 dpi may not use them all.

So what needs to change here?

Best Regards!
xinlei

