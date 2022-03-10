Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C64D3F4C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 03:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7E010E826;
	Thu, 10 Mar 2022 02:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0210E825
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 02:41:37 +0000 (UTC)
X-UUID: 0187fc527e794af4b7218f3ee2f6f0eb-20220310
X-UUID: 0187fc527e794af4b7218f3ee2f6f0eb-20220310
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1145003533; Thu, 10 Mar 2022 10:41:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 10 Mar 2022 10:41:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Mar 2022 10:41:31 +0800
Message-ID: <9576ee1f2e59b3e719f0d4d5f861e1268821e973.camel@mediatek.com>
Subject: Re: [RESEND v13 07/22] soc: mediatek: mmsys: specify 64BIT
 dependency for MTK_MMSYS
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
Date: Thu, 10 Mar 2022 10:41:31 +0800
In-Reply-To: <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-8-nancy.lin@mediatek.com>
 <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the review.

On Tue, 2022-03-08 at 14:41 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/03/22 10:30, Nancy.Lin ha scritto:
> > Because mtk-mutex change to use unsigned long mutex module type,
> > it should depend 64BIT. This is a preparation for adding support
> > for
> > mt8195 vdosys1 mutex.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/soc/mediatek/Kconfig
> > b/drivers/soc/mediatek/Kconfig
> > index fdd8bc08569e..24f792c46444 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -68,6 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
> >   config MTK_MMSYS
> >   	bool "MediaTek MMSYS Support"
> >   	default ARCH_MEDIATEK
> > +	depends on 64BIT
> >   	depends on HAS_IOMEM
> >   	help
> >   	  Say yes here to add support for the MediaTek Multimedia
> 
> Breaking old platforms is forbidden.
> 
> MT2701 and MT7623N are 32-bit ARM SoCs and:
> - mt2701 needs mmsys only; but
> - mt7623n needs mmsys and mutex.
> 
> Besides, this is an easy fix: just change your unsigned long to a
> fixed size u64.

OK, I will change to use fixed size u64. Thanks for your sugguestion.

Regards,
Nancy

