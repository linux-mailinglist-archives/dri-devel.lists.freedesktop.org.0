Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C25F5028
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 09:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A966B10E038;
	Wed,  5 Oct 2022 07:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D578610E038
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 07:09:07 +0000 (UTC)
X-UUID: 6d33eb611c5c4ea59ddcb9328b5d8be8-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PI8V11iT32Q2jycjSqRqVQTX4d7OUvBcmL01MKyGhek=; 
 b=mw+qhw6kSEYudPk/0CJBJoABZWHa6Os5USGIwcfWV5Nq6SePlaOU0hem2qvDpgxPKgQvBjZPGf9MGug+UiSActLg9oYDrUNE9zNwJXSX16EvXOVREMRWtHNL9RzR2klgY1B5eh+Hhvu4Fhe92MHCUO8ZmBEZ37THCi4K+ba3qhw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:d164eeba-8066-457a-aeaa-0226fb3f0edd, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:40
X-CID-INFO: VERSION:1.1.11, REQID:d164eeba-8066-457a-aeaa-0226fb3f0edd, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:40
X-CID-META: VersionHash:39a5ff1, CLOUDID:45daeb69-c578-4abf-baf4-d93ecc5e701f,
 B
 ulkID:22100515090097W74NHL,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824|102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0
X-UUID: 6d33eb611c5c4ea59ddcb9328b5d8be8-20221005
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1787151296; Wed, 05 Oct 2022 15:08:59 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 15:08:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 15:08:57 +0800
Message-ID: <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 5 Oct 2022 15:08:57 +0800
In-Reply-To: <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
 <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

Do you have any comment for this binding?

Can you help us review the soc/mediatek related patches?

Regards,
Jason-JH.Lin

On Wed, 2022-09-28 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
> > 1. Add mt8195 driver data with compatible "mediatek-mt8195-
> > vdosys0".
> > 2. Add mt8195 routing table settings of vdosys0.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> 
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>

