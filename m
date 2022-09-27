Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364615EBABD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 08:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3344F10E463;
	Tue, 27 Sep 2022 06:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ACB10E8A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:31:33 +0000 (UTC)
X-UUID: 6c88f2f91be14dba8a0bd15f36605362-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zgJsGLtFWAgDS95OH6OayatCLuFurS4PvDrsgBpFDyo=; 
 b=PCALu0EhbfPasL9wQeIN0zA8YlX/jYLqz7hjvYMTYTskrkJ0i/l4tLAnlM5Hg2onGl1YzEXgLrmFWyKjISOLzuaQ93ZMiDS01fsH0t1NiuzERp2WnwNP9Lgs0514sRF5g0cVxq5vrLA6qb+oo7cwsNdpuOmTo3uNGY+Dmfx400w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:019c5b6a-17b0-482d-9779-3f56eb5eda86, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:37e058e4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6c88f2f91be14dba8a0bd15f36605362-20220927
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <liangxu.xu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731176722; Tue, 27 Sep 2022 14:31:27 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 14:31:25 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 14:31:25 +0800
Message-ID: <5da3dfcfe7c36b4288d95e7416fb5930a83f1d8e.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Date: Tue, 27 Sep 2022 14:31:26 +0800
In-Reply-To: <fea0d8b3-f9e2-d081-e0c0-d81c9ca405d2@linaro.org>
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
 <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
 <ff6020d05962e202e917644b06eaa2cff7b2bb99.camel@mediatek.com>
 <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
 <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
 <fea0d8b3-f9e2-d081-e0c0-d81c9ca405d2@linaro.org>
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
Cc: devicetree@vger.kernel.org, xinlei.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-26 at 14:53 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 14:12, liangxu.xu wrote:
> > 
> > Can I modify it to the following form:
> > properties:
> >   compatible:
> >     oneOf:
> >       - enum:
> >         - mediatek,mt2701-dpi
> >         - mediatek,mt7623-dpi
> >         - mediatek,mt8173-dpi
> >         - mediatek,mt8183-dpi
> >         - mediatek,mt8186-dpi
> >         - mediatek,mt8192-dpi
> >         - mediatek,mt8195-dp-intf
> >       - items:
> >           - enum:
> >               - mediatek,mt8188-dp-intf
> >           - const: mediatek,mt8195-dp-intf
> > 
> > This means that mt8188 reuses mt8195, so there is no need to add
> > compatible to the driver.
> 
> I am now confused. You send some bindings which do not match DTS and
> driver?
> 
> This has to stop... please post the bindings with the user - DTS and
> optionally driver.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof:

I'm very sorry that my patch made you confused, please ignore this
patch. I will wait for the patch of mt8188 dts to be ready and send it
together. In the later mt8188 dts, I will reuse the compatible of
mt8195.

Best Regards,
LiangXu


