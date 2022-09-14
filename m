Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653755B7E46
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 03:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508F10E2E5;
	Wed, 14 Sep 2022 01:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF6610E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:26:20 +0000 (UTC)
X-UUID: 4bc1258a60884717a257b95964a98257-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=L4/UTbLoT54Ap+WkmAw9YNdo09U8g//h3FWaRHVm7nM=; 
 b=gG7lgnh66YqjMMKnbL+r+nvb05OX90lqnE8PH8VyYsQkdHiBPGCfeAPbzX5MUYiqOb/qWaKA5ZYqxZvK2AuCN4Kp9YeUToBRqvcpP16vyK5kpkRwZSP7fKsL8eyCeJzpRlOXQ5wTcmo0tGoN74xvzSs5LxoR+fWvcvx0tBOC0aQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:c52d0e78-144e-4339-b130-11ba5ff0873f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:3cc04bf6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4bc1258a60884717a257b95964a98257-20220914
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1493516472; Wed, 14 Sep 2022 09:26:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 14 Sep 2022 09:26:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:26:15 +0800
Message-ID: <5f151f5e03fd5dd9822c940cfac8cdf211d78f6f.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to
 set gamma
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Sep 2022 09:26:15 +0800
In-Reply-To: <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-9-jason-jh.lin@mediatek.com>
 <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for the reviews.

On Mon, 2022-09-12 at 10:26 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> > Since the bootlaoder may set the RELAY_MODE to gamma be for the
> > kerenl,
> > we have to clear the RELAY_MODE bit to make sure that the gamma is
> > enabled correctly.
> > 
> > Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma
> > module")
> 
> Fixes: 69a4237ab1d1 ("drm/mediatek: Separate gamma module")
> 
> and move this patch to the first patch of this series so this patch
> could be picked to early stable branch.
> 
> Regards,
> CK

Ok, I'll move it to the first patch.
Regards,
Jason-JH.Lin

