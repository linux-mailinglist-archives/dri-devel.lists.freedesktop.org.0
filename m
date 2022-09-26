Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA65E9814
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 04:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1EE10E4DB;
	Mon, 26 Sep 2022 02:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1DC10E4DB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:52:12 +0000 (UTC)
X-UUID: 5b12f926ce984ca9a20b24600f2436c9-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=J7zNk55ctYek/Lc3Rk/kqJN4XtzyQcphEfTsz8DV0W4=; 
 b=TDwFywZGWOl6uialaC7BiDdjQ8oSKPgc9fps4OOV/Cx7MGuJrN1hJUoa992AXpsYAfO/2HvjYRhsboiXCaioUCSg1sWg0PlKXlwKLoG7yKrP6SoV7ZgjANFa+j4zR8ICIrOcxpsPvvP4Mlx8Fwab0YfucsRpft1o4vnVbeVI3Jo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:26093cd3-c849-49a5-a0d6-b71efcf1b8e1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:c78806a3-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5b12f926ce984ca9a20b24600f2436c9-20220926
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <liangxu.xu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471381480; Mon, 26 Sep 2022 10:52:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 10:52:05 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 10:52:04 +0800
Message-ID: <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Date: Mon, 26 Sep 2022 10:52:04 +0800
In-Reply-To: <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > From: liangxu xu <liangxu.xu@mediatek.com>
> > 
> > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > 
> > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > ---
> 
> Where is the DTS? Where are driver changes?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof:

If you want to see the synchronous changes of dts and binding files,
then I will attach this binding file changes when sending dts later.

The driver change of mt8188 reuses that of mt8195. The driver link is
as follows:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040

Best Regards,
LiangXu

