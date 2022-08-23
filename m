Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F42D59CE1C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 03:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA63DA956E;
	Tue, 23 Aug 2022 01:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FEBA8209
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 01:53:32 +0000 (UTC)
X-UUID: a88056a079ec4884a4faffe2002e05b4-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g3nooHywkKyg84wSDMeqbnWFzEYEUzOPhPPCJyRH9TQ=; 
 b=O42j0nkGKH8XzkB6CXpksoEkidWE+pQasxKzyJXIeadNpniY4P15D0tXpKX57W5PuhAIUzWfemNDPzthp/3wtkE7ExpaJrTPQfl7Y6HZqJeIW08xIQy+n/0fKEeDNusmEqBxO7ldJo/6HA3Q/bVldEeVy6davAl082l0HUYTPcI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:4a89b6e9-4bdb-4fb2-8653-3744ea918d20, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:d6aa77c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a88056a079ec4884a4faffe2002e05b4-20220823
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626232032; Tue, 23 Aug 2022 09:53:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 09:53:24 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 09:53:24 +0800
Message-ID: <c29ca6a93fb06608d173659aff40e0f6bfed059f.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Tue, 23 Aug 2022 09:53:37 +0800
In-Reply-To: <20220822132350.tw73ph6nnvti6h5i@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
 <20220819185400.aokd53xln6rmc3xk@notapiano>
 <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
 <20220822132350.tw73ph6nnvti6h5i@notapiano>
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

On Mon, 2022-08-22 at 09:23 -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Aug 22, 2022 at 08:50:45PM +0800, xinlei.lee wrote:
> [..]
> > Hi Nícolas:
> > 
> > Thanks for your careful review.
> > I will correct it in the next version:
> > 1. Modify key nouns in the description;
> > 2. Modify the label of jitao to Co-developed-by;
> 
> To be clear, you shouldn't change jitao's signed-off-by to a co-
> developed-by,
> but add a co-developed-by. If you check the link I sent earlier [1],
> it should
> be clear that you should have something like
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html*when-to-use-acked-by-cc-and-co-developed-by__;Iw!!CTRNKA9wMg0ARbw!1bj8UrTx32ihWiD-1dbKF8XsXg4tod3zHr90aemam8bnL_4jgcA9oa44UiF9ILFN9A$
>  
> 
> Thanks,
> Nícolas
> 
> > 3. Macro definition address lowercase problem and function naming.
> > 
> > If there are no other questions, I will send out the second edition
> > in
> > the near future.
> > 
> > Best Regards!
> > xinlei
> > 

Hi Nícolas:

Yes, maybe my statement is not very accurate, thank you for your
explanation.

Best Regards!
Xinlei

