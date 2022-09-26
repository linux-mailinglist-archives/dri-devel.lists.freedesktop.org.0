Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9815EA5AD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38FC10E689;
	Mon, 26 Sep 2022 12:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480E610E68B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:12:25 +0000 (UTC)
X-UUID: 8f5644e423b34c31b754cc2b98946fdd-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HG7JKsJhsSJaNaqDyDkeXw8m0Z/XItGCKaefUS4sQlI=; 
 b=lBJcytc5aYQqSxbF3tXHEjzHYdPmoyKd5HIxGQo1IQaBu6matEjNl3sfiCugzefN5kjioa8gk4whExeNos0wwmYsDkYjQT18iEfxhZ/0zqh9hPoZZuD/ZtDtAePGLHnco0CY7UpR2f/hJRrL+eSVr2LjI/9CjWzITlgHwOVTU3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:a2df9ece-6bce-4cde-a11e-ec26f8c4a9c8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:b7f240e4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8f5644e423b34c31b754cc2b98946fdd-20220926
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <liangxu.xu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1344845160; Mon, 26 Sep 2022 20:12:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 20:12:20 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 20:12:19 +0800
Message-ID: <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <liangxu.xu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Date: Mon, 26 Sep 2022 20:12:20 +0800
In-Reply-To: <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
 <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
 <ff6020d05962e202e917644b06eaa2cff7b2bb99.camel@mediatek.com>
 <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
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

On Mon, 2022-09-26 at 08:26 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 04:53, liangxu.xu wrote:
> > On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > > On 23/09/2022 03:42, liangxu.xu@mediatek.com wrote:
> > > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > > 
> > > > Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> > > > 
> > > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
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
> 
> Keep discussions public. You submit a lot of unused compatibles. I
> want
> users to come with them.
> 
> > 
> > The driver change of mt8188 reuses that of mt8195. The driver link
> > is
> > as follows:
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dpi.c?id=48f4230642ee32a97ddf4be492838ce96089f040__;!!CTRNKA9wMg0ARbw!1Rd4E1huTfB_u1FjLXMIKlqMciGL24xsYInu1vg1z9c026cL0PiITklArLfwrMsi3x4$
> >  
> 
> Driver does not support that compa
> > 
> > Best Regards,
> > LiangXu
> > 
> 
> Best regards,
> Krzysztof


Hi Krzysztof:

Can I modify it to the following form:
properties:
  compatible:
    oneOf:
      - enum:
        - mediatek,mt2701-dpi
        - mediatek,mt7623-dpi
        - mediatek,mt8173-dpi
        - mediatek,mt8183-dpi
        - mediatek,mt8186-dpi
        - mediatek,mt8192-dpi
        - mediatek,mt8195-dp-intf
      - items:
          - enum:
              - mediatek,mt8188-dp-intf
          - const: mediatek,mt8195-dp-intf

This means that mt8188 reuses mt8195, so there is no need to add
compatible to the driver.

Best Regards,
LiangXu
> 

