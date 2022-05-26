Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585DC534A9F
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 09:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD64710F68D;
	Thu, 26 May 2022 07:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E6C10F4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 07:03:38 +0000 (UTC)
X-UUID: 8269ac6b732f4c13af0950215420d768-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:b15ec10b-6098-4f21-995b-6a4bd6e9e238, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:b15ec10b-6098-4f21-995b-6a4bd6e9e238, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:0b768c47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:c3fa04fb1107,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 8269ac6b732f4c13af0950215420d768-20220526
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1084779265; Thu, 26 May 2022 15:03:34 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 26 May 2022 15:03:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 15:03:32 +0800
Message-ID: <995c91a5dbad4512aadc8b2e12502e88b335af5b.camel@mediatek.com>
Subject: Re: [PATCH v21 00/25] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, <linux@roeck-us.net>
Date: Thu, 26 May 2022 15:03:32 +0800
In-Reply-To: <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
 <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
 <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-25 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/05/22 04:47, Rex-BC Chen ha scritto:
> > On Thu, 2022-05-12 at 13:31 +0800, Nancy.Lin wrote:
> > > The hardware path of vdosys1 with DPTx output need to go through
> > > by
> > > several modules, such as, OVL_ADAPTOR and MERGE.
> > > 
> > > Add DRM and these modules support by the patches below:
> > > 
> > > Changes in v21:
> > > - fix reviewer comment
> > >    - fix rdma and ethdr binding doc and dts
> > > 
> 
> ..snip..
> 
> > 
> > Hello Matthias,
> > 
> > Could you also spare some time to give us some suggestion for the
> > mmsys
> > and mutex patches of this series?
> > If we can improve anything, we can do it before 5.19.
> > Thanks for your big support!
> > 
> > BRs,
> > Rex
> > 
> 
> Even though there may be something to further improve, keep in mind
> that we're
> already at v21... that's... a lot of versions, and vdosys0/1 are
> practically
> tied together even though they're coming from two different
> engineers.
> 
> I can confirm that this entire stack works on the new HW as intended
> and that
> there's no regression on older ones, so on all patches you can add
> my:
> 
> [Tested on MT6795, MT8173, MT8192, MT8195]
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> .... BUT! ....
> 
> 
> This series won't apply cleanly anymore on next-20220525 (same for
> vdosys0,
> already pinged Jason about it) because of the commits adding support
> for MT8186,
> so *please rebase this series once again*.
> 
> 
> Cheers,
> Angelo

Hi Angelo,

I will rebase to next-20220525 and resend it soon.

Regards,
Nancy

