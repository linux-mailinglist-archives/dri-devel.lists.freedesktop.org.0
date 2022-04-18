Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3D504B75
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 05:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EA110ED93;
	Mon, 18 Apr 2022 03:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E3010ED90
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 03:58:06 +0000 (UTC)
X-UUID: ea25a7d6522849c189a7d4e46361b833-20220418
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:69bdaea4-6cd1-41b2-ae35-f368e81d687d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:4e1509f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ea25a7d6522849c189a7d4e46361b833-20220418
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1055210589; Mon, 18 Apr 2022 11:58:00 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 11:57:59 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 11:57:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 11:57:59 +0800
Message-ID: <8ac63b04e66de3b1fb1a1ef4547982a345e24ed0.camel@mediatek.com>
Subject: Re: [PATCH v19 10/10] soc: mediatek: remove DDP_DOMPONENT_DITHER enum
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Mon, 18 Apr 2022 11:57:59 +0800
In-Reply-To: <387ede3f-20be-cb84-f343-f68c75eaf5fd@collabora.com>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-11-jason-jh.lin@mediatek.com>
 <387ede3f-20be-cb84-f343-f68c75eaf5fd@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo
 Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the reviews.

On Fri, 2022-04-15 at 12:32 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 10:39, jason-jh.lin ha scritto:
> > After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> > mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> Can you please fix the commit title with:
> soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
> 
> that "from" is important, as you're not removing *an enum*, but *from
> an enum*.
> 
Yes, I agree with you.
I'll fix it in the next version.
Thanks.

Regards,
Jason-JH.Lin

> After that:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> Thanks!
> Angelo
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

