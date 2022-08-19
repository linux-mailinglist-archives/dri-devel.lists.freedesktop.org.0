Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62E5993E8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 06:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1610E4DF;
	Fri, 19 Aug 2022 04:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460D410E4CC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:13:30 +0000 (UTC)
X-UUID: a63f09ca2c9f4537b6f578f8eb0f0bb8-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oi64ZAN56SKAouCD2c1g9twrjMLE3pr2hOeKSFbJBlc=; 
 b=kLqGjSNz8+1XbllMVOPZaqWOF46ITVExEFcvFk97u5dfpFRFZx+vvpwvBsy/woIzSjfSNqW1OwNA6ua5MTVfF15tr2X+7vri2Ybs2VR0Srvr3RkE091dPV7oAQJsr4qCIEyrbRntJrSe9SKSCPzkqvbbE289PujB7VTS4DwCJSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:698863a8-5ed3-4c7c-bcde-43584b7eef79, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Releas
 e_Ham,ACTION:release,TS:73
X-CID-INFO: VERSION:1.1.10, REQID:698863a8-5ed3-4c7c-bcde-43584b7eef79, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:73
X-CID-META: VersionHash:84eae18, CLOUDID:ee6942af-9535-44a6-aa9b-7f62b79b6ff6,
 C
 OID:d6bf27258396,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: a63f09ca2c9f4537b6f578f8eb0f0bb8-20220819
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 240840742; Fri, 19 Aug 2022 12:13:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 12:13:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 12:13:24 +0800
Message-ID: <12062a2e2957113d40b4bf3c1c62d18418b51a12.camel@mediatek.com>
Subject: Re: [PATCH v25 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 19 Aug 2022 12:13:23 +0800
In-Reply-To: <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
 <20220711075245.10492-8-nancy.lin@mediatek.com>
 <20220818214715.spbyic34szubx3gi@notapiano>
 <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,


On Fri, 2022-08-19 at 10:09 +0800, Nancy.Lin wrote:
> Hi Nicolas,
> 
> Thanks for the review.
> 
> On Thu, 2022-08-18 at 17:47 -0400, Nícolas F. R. A. Prado wrote:
> > Hi Nancy,
> > 
> > On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
> > [..]
> > >  static const struct mtk_mmsys_driver_data
> > > mt2701_mmsys_driver_data
> > > = {
> > >  	.clk_driver = "clk-mt2701-mm",
> > >  	.routes = mmsys_default_routing_table,
> > > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8173_mmsys_driver_data = {
> > >  	.routes = mmsys_default_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > >  
> > >  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data
> > > =
> > > {
> > > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8183_mmsys_driver_data = {
> > >  	.routes = mmsys_mt8183_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > >  
> > >  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data
> > > =
> > > {
> > > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8186_mmsys_driver_data = {
> > >  	.routes = mmsys_mt8186_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> > >  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > 
> > [..]
> > > @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct
> > > platform_device *pdev)
> > >  		return ret;
> > >  	}
> > >  
> > > -	spin_lock_init(&mmsys->lock);
> > > -
> > > -	mmsys->rcdev.owner = THIS_MODULE;
> > > -	mmsys->rcdev.nr_resets = 32;
> > 
> > The number of resets was previously always set to 32, and now
> > you're
> > instead
> > setting it based on num_resets from each machine. The issue is,
> > you're
> > forgetting a bunch of them.
> > 
> > mt8192 didn't get a num_reset, so this commit breaks the display on
> > mt8192 based
> > devices. But mt8192 isn't the only one, there are other platforms
> > missing this
> > property. Please set num_resets to 32 in every single one of them,
> > otherwise
> > there will be display regressions.
> > 
> > Thanks,
> > Nícolas
> 
> It's my mistake. I will set num_resets to 32 for every mmsys driver.
> 
> Thanks,
> Nancy

After review the code, I think only the mmsys driver with the
sw0_rst_offset setting should set num_resets to 32, otherwise it would
set wrong addr in the mtk_mmsys_reset_update() function. Those mmsys
without sw0_rst_offset set should not set num_resets to 32.

Thanks,
Nancy

