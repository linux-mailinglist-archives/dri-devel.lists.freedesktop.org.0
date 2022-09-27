Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491EF5EBB63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241810E8C9;
	Tue, 27 Sep 2022 07:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492E610E8C9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 07:20:40 +0000 (UTC)
X-UUID: eb9598a124d54877af4d82a9ff4edf1a-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rk7eez5gu7Mxo/ZAdoW1dtp+oG1rsnOuA8m1wARVdBE=; 
 b=NUQUaqPLEHr59AWRkRDSQ3jIQmJpOlsWCfWHdIeBTqeKK/BviBasudlEFf0XsQpcKlgJL9mxGMOy/pdsd+jkY0QCu5/Z7swh4ZUUrMVyi1JU25aNNSuyqyNTqJdOTBpFwTKEKzoO+LtmEVym4ekpa+dhGDPjv4YBX5O41jnChME=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:123dca10-b30f-467e-a450-e93c26a34338, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:571f34a3-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eb9598a124d54877af4d82a9ff4edf1a-20220927
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <liangxu.xu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1811789589; Tue, 27 Sep 2022 15:20:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 15:20:34 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 15:20:33 +0800
Message-ID: <aa8e3a73db99d98cea2b496b95e7629ea9db0ef1.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 27 Sep 2022 15:20:34 +0800
In-Reply-To: <20220926215440.GA2888681-robh@kernel.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
 <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
 <20220926215440.GA2888681-robh@kernel.org>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-26 at 16:54 -0500, Rob Herring wrote:
> On Mon, Sep 26, 2022 at 10:52:04AM +0800, liangxu.xu wrote:
> > On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > > On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > > 
> > > > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > > > 
> > > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > > > ---
> > > 
> > > Where is the DTS? Where are driver changes?
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> > 
> > Hi Krzysztof:
> > 
> > If you want to see the synchronous changes of dts and binding
> > files,
> > then I will attach this binding file changes when sending dts
> > later.
> > 
> > The driver change of mt8188 reuses that of mt8195. The driver link
> > is
> > as follows:
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040__;!!CTRNKA9wMg0ARbw!zWA5kU-1QLhCsHN3BeMSN_gCpc5yrXC0qHv9Qxdqs0o510rEVJNZRrulCCCERJIA-SA$
> >  
> 
> So the 8188 block is backwards compatible with the 8195 block? 
> That's good, but not what your schema says because you have not
> defined 
> a fallback compatible for the driver to use.
> 
> Rob

Hi Rob:

Yes, please ignore this patch. According to krzysztof's suggestion, I
will re-send a patch of mt8188 multiplexing mt8195 compatiable after
the mt8188 dts file exists.

Best Regards
LiangXu

