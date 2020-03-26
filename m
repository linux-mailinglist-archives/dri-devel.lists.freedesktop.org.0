Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F65194229
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 15:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3DC8930A;
	Thu, 26 Mar 2020 14:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B38930A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 14:57:32 +0000 (UTC)
X-UUID: 3b0233988805467bb0e81fa145363b3d-20200326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wz22YepjvknPTT9ZKt5FiQJcqf5sA/7i5zIs+ibGrZ4=; 
 b=SqSLOyHXrBpAitkBidGCJ+3b5YisFxhwgjBJdS8wNh0FkMflt3HKNZm8WQoYzI4/2sWCaj/ykWw3b9s8L2bqzC5aJ6HtbONsOdinWnxIOYeFN3FZWHg7c2Axf5XXzD/3bQPei6i8ua9kWNkr/t5bGVWIDnvEwX5Q8zfBa1hmE6Q=;
X-UUID: 3b0233988805467bb0e81fa145363b3d-20200326
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1827274245; Thu, 26 Mar 2020 22:57:25 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 22:57:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Mar 2020 22:57:20 +0800
Message-ID: <1585234641.12089.7.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 00/17] add drm support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 26 Mar 2020 22:57:21 +0800
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F6801C5DB930AB9FF671AA0D74D3E125BF3CAC024BE411DDBC607B4DE40F1C22000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

In [1], Matthias has applied below series to fix mmsys driver probe
problem. Please base on that series to resend your patches.

soc / drm: mediatek: Fix mediatek-drm device probing	soc / drm:
mediatek: Move routing control to mmsys device	clk / soc: mediatek: Move
mt8173 MMSYS to platform driver	dt-bindings: mediatek: Update mmsys
binding to reflect it is a system controller	drm/mediatek: Omit warning
on probe defers

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

Regards,
CK

On Fri, 2020-01-03 at 11:12 +0800, Yongqiang Niu wrote:
> This series are based on 5.5-rc1 and provid 17 patch
> to support mediatek SOC MT8183
> 
> Change since v5
> - fix reviewed issue in v5
> base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
> 
> Change since v4
> - fix reviewed issue in v4
> 
> Change since v3
> - fix reviewed issue in v3
> - fix type error in v3
> - fix conflict with iommu patch
> 
> Change since v2
> - fix reviewed issue in v2
> - add mutex node into dts file
> 
> Changes since v1:
> - fix reviewed issue in v1
> - add dts for mt8183 display nodes
> - adjust display clock control flow in patch 22
> - add vmap support for mediatek drm in patch 23
> - fix page offset issue for mmap function in patch 24
> - enable allow_fb_modifiers for mediatek drm in patch 25
> 
> Yongqiang Niu (17):
>   dt-bindings: mediatek: add rdma_fifo_size description for mt8183
>     display
>   arm64: dts: add display nodes for mt8183
>   drm/mediatek: move dsi/dpi select input into mtk_ddp_sel_in
>   drm/mediatek: make sout select function format same with select input
>   drm/mediatek: add mmsys private data for ddp path config
>   drm/mediatek: add private data for rdma1 to dpi0 connection
>   drm/mediatek: add private data for rdma1 to dsi0 connection
>   drm/mediatek: move rdma sout from mtk_ddp_mout_en into
>     mtk_ddp_sout_sel
>   drm/mediatek: add connection from OVL0 to OVL_2L0
>   drm/mediatek: add connection from RDMA0 to COLOR0
>   drm/mediatek: add connection from RDMA1 to DSI0
>   drm/mediatek: add connection from OVL_2L0 to RDMA0
>   drm/mediatek: add connection from OVL_2L1 to RDMA1
>   drm/mediatek: add connection from DITHER0 to DSI0
>   drm/mediatek: add connection from RDMA0 to DSI0
>   drm/mediatek: add fifo_size into rdma private data
>   drm/mediatek: add support for mediatek SOC MT8183
> 
>  .../bindings/display/mediatek/mediatek,disp.txt    |  13 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 +++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 288 ++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |   7 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  49 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   3 +
>  9 files changed, 435 insertions(+), 70 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
