Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAEB599D6E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 16:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF1510EEFC;
	Fri, 19 Aug 2022 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2897A10E17C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:25:30 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 64F796601DC3;
 Fri, 19 Aug 2022 15:25:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660919128;
 bh=LVvo/H0yD5IHtK3BCe8kCRuEpXJ/0WbPUX2JGtIkvgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BRORHC1ycbpuGPFg/CMbY1HXG9CbZw4mD7QI+HegRtsRqLIKpA/blhXZFcCxxTwSe
 CFPxPAyaltAW76paK8ntAjomzoOPjkNOtVVBeAi2QyofZ2hjkE0B6ZFtIoL8KXYC5H
 9Uwy6/Vbl5vdJpybntjkT4r/XtG+b10BHFnRmqYHar17voYPOQO+atkovGyYsHZTCQ
 I/mrcDhrSCILIKryUZfcVvlp/9NgDGzRHqEtcXYzq9B1XoGhk/ugm6JiJ6a7L5fGo9
 oLDayXKm/kpvfkJ10EN22YLo7a7r7rVTCnpSVRxwt+qj1PZ26gwehcF1fc0feVsogX
 x24TsgoxwUDQw==
Date: Fri, 19 Aug 2022 10:25:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v25 07/10] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Message-ID: <20220819142522.c4o3nrkxfj2r3zd7@notapiano>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
 <20220711075245.10492-8-nancy.lin@mediatek.com>
 <20220818214715.spbyic34szubx3gi@notapiano>
 <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
 <12062a2e2957113d40b4bf3c1c62d18418b51a12.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12062a2e2957113d40b4bf3c1c62d18418b51a12.camel@mediatek.com>
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
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 12:13:23PM +0800, Nancy.Lin wrote:
> Hi Nicolas,
> 
> 
> On Fri, 2022-08-19 at 10:09 +0800, Nancy.Lin wrote:
> > Hi Nicolas,
> > 
> > Thanks for the review.
> > 
> > On Thu, 2022-08-18 at 17:47 -0400, Nícolas F. R. A. Prado wrote:
> > > Hi Nancy,
> > > 
> > > On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
> > > [..]
> > > >  static const struct mtk_mmsys_driver_data
> > > > mt2701_mmsys_driver_data
> > > > = {
> > > >  	.clk_driver = "clk-mt2701-mm",
> > > >  	.routes = mmsys_default_routing_table,
> > > > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > > > mt8173_mmsys_driver_data = {
> > > >  	.routes = mmsys_default_routing_table,
> > > >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > > +	.num_resets = 32,
> > > >  };
> > > >  
> > > >  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data
> > > > =
> > > > {
> > > > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > > > mt8183_mmsys_driver_data = {
> > > >  	.routes = mmsys_mt8183_routing_table,
> > > >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > > +	.num_resets = 32,
> > > >  };
> > > >  
> > > >  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data
> > > > =
> > > > {
> > > > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > > > mt8186_mmsys_driver_data = {
> > > >  	.routes = mmsys_mt8186_routing_table,
> > > >  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> > > >  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > > > +	.num_resets = 32,
> > > >  };
> > > 
> > > [..]
> > > > @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct
> > > > platform_device *pdev)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > -	spin_lock_init(&mmsys->lock);
> > > > -
> > > > -	mmsys->rcdev.owner = THIS_MODULE;
> > > > -	mmsys->rcdev.nr_resets = 32;
> > > 
> > > The number of resets was previously always set to 32, and now
> > > you're
> > > instead
> > > setting it based on num_resets from each machine. The issue is,
> > > you're
> > > forgetting a bunch of them.
> > > 
> > > mt8192 didn't get a num_reset, so this commit breaks the display on
> > > mt8192 based
> > > devices. But mt8192 isn't the only one, there are other platforms
> > > missing this
> > > property. Please set num_resets to 32 in every single one of them,
> > > otherwise
> > > there will be display regressions.
> > > 
> > > Thanks,
> > > Nícolas
> > 
> > It's my mistake. I will set num_resets to 32 for every mmsys driver.
> > 
> > Thanks,
> > Nancy
> 
> After review the code, I think only the mmsys driver with the
> sw0_rst_offset setting should set num_resets to 32, otherwise it would
> set wrong addr in the mtk_mmsys_reset_update() function. Those mmsys
> without sw0_rst_offset set should not set num_resets to 32.

I don't think that's the case. num_resets and sw0_rst_offset are completely
unrelated in the code. sw0_rst_offset just gives the offset from the base
mmsys memory to the register that manages resets; it can be 0 in which case the
reset register would be right at the start of the mmsys iospace.

nr_resets, which is set by num_resets, on the other hand, seems to be used in a
single place: of_reset_simple_xlate() in drivers/reset/core.c. And the logic
there is really simple: if you pass a reset id greater than nr_resets, you will
get an error. So when you leave num_resets unset (0) for any of the platforms,
you're making all reset registrations in the DT fail.

So I'm really confident that we need num_resets = 32 on *all* platforms (except
the ones that have 64 of course, we just can't leave them empty).

Thanks,
Nícolas
