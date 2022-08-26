Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285345A20B3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 08:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321BF10E58B;
	Fri, 26 Aug 2022 06:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EC510E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 06:11:56 +0000 (UTC)
X-UUID: c70afc4e9c12444c8ce0012a7a291c38-20220826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ii+RWHgkkqG3zjNQb1+48ayRNIbfTrluHNBY8ADjOsM=; 
 b=TKb8JkWTT8RiIqEvj0tHO9tesYCJpwo68SVZ2xmH4q7AWSAVfriShkggq3H3ylCJ3IZVCV2euPrVOgf0YXlFKlH6ChOcfvL6pscQvmvp5gVnGlJoXzH5+GJ08eNA11kGMEUh4SGxSkhT4zL+R5rgooLPH4Dtdkmw3uEhILgr7tY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:ce3651fc-e649-45e1-a147-4b8d3eafb022, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Releas
 e_Ham,ACTION:release,TS:79
X-CID-INFO: VERSION:1.1.10, REQID:ce3651fc-e649-45e1-a147-4b8d3eafb022, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:79
X-CID-META: VersionHash:84eae18, CLOUDID:8c5ea455-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:05331216bfbf,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: c70afc4e9c12444c8ce0012a7a291c38-20220826
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2114750083; Fri, 26 Aug 2022 14:11:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 26 Aug 2022 14:11:50 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 26 Aug 2022 14:11:49 +0800
Message-ID: <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "=?ISO-8859-1?Q?N=EDcolas?= F.
 R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 26 Aug 2022 14:12:00 +0800
In-Reply-To: <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> 
> On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com
> > wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Add mmsys function to manipulate dpi output format configuration
> > > for MT8186.
> > > 
> > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> Patch looks fine, I'll wait for v4 as there is still some discussion
> on the DRM 
> part. Please try to fix the threading problem you had in sending this
> series.
> 
> Thanks,
> Matthias

Hi Matthias:

Thanks for your review.

Before I send the next version, do you mean the treading problem you
are talking about is the problem I'm discussing in another patch in
this series, or something else?

Best Regards!
Xinlei

