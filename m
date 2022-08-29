Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F05A40BE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 03:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4B310F033;
	Mon, 29 Aug 2022 01:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7C510F033
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 01:38:45 +0000 (UTC)
X-UUID: 1a482fe098c047a4bd92a2103bbf35f2-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uxEYn82B/sHqpgo3MNp2dCNDWHB+C6Ht7+1Mdh21l/A=; 
 b=VL+zk3SXGQ94ZjEPouFKLyi28uwwn4na2Avh9I6VTMVmz3c5/sPq7nTjxKly2m5Nsy25RcoK9asbY2CN5mdnT3JZqETqzWgwyHYIwoss+ImJ0W2y2EWX3GFxHK6niznxZjRCUkgI5GHYw/s/I18u4uPUgstrkvEuzNxlYKSuu2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:483f435d-1543-49c4-8beb-26d56369336f, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Releas
 e_Ham,ACTION:release,TS:79
X-CID-INFO: VERSION:1.1.10, REQID:483f435d-1543-49c4-8beb-26d56369336f, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:79
X-CID-META: VersionHash:84eae18, CLOUDID:03cad155-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:40b5ee15392d,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 1a482fe098c047a4bd92a2103bbf35f2-20220829
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 408395691; Mon, 29 Aug 2022 09:38:39 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 09:38:38 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 09:38:37 +0800
Message-ID: <5675b49942f103f348e8bc4bec4cc2a60d4c4b30.camel@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 29 Aug 2022 09:38:47 +0800
In-Reply-To: <20220826132942.k2rnlz5wwi62tity@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
 <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
 <20220826132942.k2rnlz5wwi62tity@notapiano>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-08-26 at 09:29 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Aug 26, 2022 at 02:12:00PM +0800, xinlei.lee wrote:
> > On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> > > 
> > > On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > > > On Tue, Aug 23, 2022 at 02:38:22PM +0800, 
> > > > xinlei.lee@mediatek.com
> > > > wrote:
> > > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > > 
> > > > > Add mmsys function to manipulate dpi output format
> > > > > configuration
> > > > > for MT8186.
> > > > > 
> > > > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > > 
> > > 
> > > Patch looks fine, I'll wait for v4 as there is still some
> > > discussion
> > > on the DRM 
> > > part. Please try to fix the threading problem you had in sending
> > > this
> > > series.
> > > 
> > > Thanks,
> > > Matthias
> > 
> > Hi Matthias:
> > 
> > Thanks for your review.
> > 
> > Before I send the next version, do you mean the treading problem
> > you
> > are talking about is the problem I'm discussing in another patch in
> > this series, or something else?
> 
> Hi Xinlei,
> 
> no, the threading problem Matthias is referring to is the fact that
> this version
> of your series had two cover letters (patch 0) and a patch 2 [1],
> while patch 1
> was sent in a different email thread [2]. The whole series (cover
> letter,
> patches 1 and 2), should have been in the same email thread. Also, I
> noticed
> that your cover letter lists the patches with incorrect prefixes
> "FROMLIST".
> 
> So something weird happened when you sent this version of the series.
> It was ok
> in the previous version. So just make sure this is fixed when you
> send the next
> version of the series (after we finish the discussion on patch 2).
> 
> [1] 
> https://lore.kernel.org/linux-mediatek/1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com/
> [2] 
> https://lore.kernel.org/linux-mediatek/1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com/
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for the thoughtful explanation of this, I may know what caused
the two patches not to be in a series. 
I will fix this and revise the "FROMLIST" tag in the cover letter in
the next version.

Best Regards!
Xinlei

