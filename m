Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292305AC8A2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 04:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7F10E123;
	Mon,  5 Sep 2022 02:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84B10E123
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 01:59:58 +0000 (UTC)
X-UUID: 35f887af141e4cda82ea300b8afa496d-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RBTVq5JWRZGciHt3zVoLMLM2akIEZ/UY1juZ7uS87mg=; 
 b=R3j9U1a1mmltwNpfuUxhlYuFMuQh+f2M203UHIHmYH0hmTJHmk2XXEOfIXgaWD6MMvcwybTw+9PqIfl2e3ypq6kSpK753wsaoTvTpkkgxgGP4m3ULMNkfTIa6REX+IUZHpX+ke0I0DrlYVqfXKY9FuDFLkEAksyL+u2tv6tXOWw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:2cb8b398-e193-43fd-a5ef-11e4c1825775, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:93679b56-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 35f887af141e4cda82ea300b8afa496d-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1106842216; Mon, 05 Sep 2022 09:59:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Sep 2022 09:59:50 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Sep 2022 09:59:49 +0800
Message-ID: <8b8edee34e6bfa5d4a87defeedb799be685be867.camel@mediatek.com>
Subject: Re: [PATCH v4,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <yongqiang.niu@mediatek.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Date: Mon, 5 Sep 2022 09:59:55 +0800
In-Reply-To: <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
 <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-08-29 at 11:52 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add mmsys func to manipulate dpi output format config for MT8186.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
> >   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
> >   include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
> >   3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..6eca3445bea3 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,7 @@
> >   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >   #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >   
> > +#define MT8186_DPI_OUTPUT_FORMAT		0x400
> 
> For readability, can we please rename this definition to
> 
> MT8186_MMSYS_DPI_OUTPUT_FORMAT
> 
> Thanks,
> Angelo
> 

Hi Angelo:

ok, I will revise it in the next version.

Best Regards!
Xinlei

