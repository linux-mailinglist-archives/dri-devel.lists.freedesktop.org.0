Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB159C001
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E9E14B58B;
	Mon, 22 Aug 2022 13:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EF32BC67
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:01:43 +0000 (UTC)
X-UUID: 03e3e331f39046d39dad1ff30cc088a8-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1i4E44Nv8ZYq/yPV7FLKWZbANFWVm2e1L3wlbPyDfzw=; 
 b=LQ9TCAlakGmvC11y7pJLX1/og2pO1b4AwMjpLjCeYTFlHXFLrfhqcCsHdsSIT2a/UAzyY2X37L3e+xSnK8EUv9XwcL2S38MUNkUPTnA8j0XT4K3CC3dm+ozhExF4Wu5tDB5kKC+Om7W3t0X006Ofp8cVUPKpWpW8EFVLV5cz22w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6cbb6d04-1eef-4b36-b0cd-f3b573e01075, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:42b66cc9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 03e3e331f39046d39dad1ff30cc088a8-20220822
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1538100493; Mon, 22 Aug 2022 21:01:40 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 21:01:38 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 21:01:37 +0800
Message-ID: <6e442f4f95f208734ee9c27819cfe9972b62cf10.camel@mediatek.com>
Subject: Re: [PATCH v2,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 22 Aug 2022 21:01:52 +0800
In-Reply-To: <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
 <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
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
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-08-19 at 14:43 -0400, Nícolas F. R. A. Prado wrote:
> Hi Xinlei,
> 
> On Fri, Aug 05, 2022 at 05:57:41PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> 
> Could you explain a bit more why this is needed? What does this
> configuration
> do? And why is MMSYS involved in a DPI configuration?
> 
> Also, is this a configuration specific to MT8186? I enabled the flag
> on MT8192
> just to test and didn't see any difference in behavior.
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> 
> If Jitao also helped in the writing of this code, then there should
> also be a
> co-developed-by tag for Jitao before the Signed-off-by [1].
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html*when-to-use-acked-by-cc-and-co-developed-by__;Iw!!CTRNKA9wMg0ARbw!wlM0Ma8TeMR5EM0eUg1Z1JIDK_SF5rATf2UtVFJATWlzCSYABFbhD8yIo-_YxePWwQ$
>  
> 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> 
> [..]
> > @@ -151,6 +154,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool rgb888_dual_enable;
> 
> You're missing a description of this property in the struct's comment
> above:
> 
> drivers/gpu/drm/mediatek/mtk_dpi.c:160: warning: Function parameter
> or member 'rgb888_dual_enable' not described in 'mtk_dpi_conf'
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for your careful review.

First of all, MT8186 needs to set this bit of MMSYS because HW has been
modified at that time, SW needs to cooperate.
And the register (MMSYS) reserved for dpi will be used for output
format control (dual_edge/single_edge).
Since it is a modification for
MT8186, setting it on MT8192 will not have any effect.

If there are no other comments, I will revise it in the next edition:
1. Modify the label of jitao to Co-developed-by;
2. Add missing a description of this property in the mtk_dpi_conf.

Best Regards!
Xinlei



