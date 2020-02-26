Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD816F527
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 02:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91996E055;
	Wed, 26 Feb 2020 01:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 017B26E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:40:16 +0000 (UTC)
X-UUID: bce5fd9329344851bbfd60d17dc936bf-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QnRmFmzK3QiGsyx/wln05rmuo5QWWRZM/E9WOlCyH1w=; 
 b=tnz5CLGQO8+9JnX2NcIXJCQ3ueoUvYbl5ftp63xkrs5Bcf8kPoGWhq348JVrZaQhs7izOTbhOZTFYNSQWzesWQCAVyxoRbVkxLBH2eH4UmmZqjkCr8OXVzqMF1mSCYylSOMncO8edY9b/Ss1cFMxi3VvP0p2r3Ie3koSCQ4IA+k=;
X-UUID: bce5fd9329344851bbfd60d17dc936bf-20200226
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 393327314; Wed, 26 Feb 2020 09:40:13 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 09:39:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 09:37:55 +0800
Message-ID: <1582681211.16944.2.camel@mtksdaap41>
Subject: Re: [PATCH v8 2/7] dt-bindings: display: mediatek: update dpi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 26 Feb 2020 09:40:11 +0800
In-Reply-To: <20200225171052.GA6002@bogus>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
 <20200225094057.120144-3-jitao.shi@mediatek.com>
 <20200225171052.GA6002@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-02-25 at 11:10 -0600, Rob Herring wrote:
> On Tue, 25 Feb 2020 17:40:52 +0800, Jitao Shi wrote:
> > Add descriptions about supported chips, including MT2701 & MT8173 &
> > mt8183
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

I think this version is the same as v3 [1] which has been reviewed by
Rob, so I applied this patch i mediatek-drm-next-5.7 [2], thanks.

[1] https://patchwork.kernel.org/patch/10901971/
[2]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.7

Regards,
CK
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
