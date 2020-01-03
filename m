Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D012F40E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 06:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F324E6E179;
	Fri,  3 Jan 2020 05:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52E7C6E179
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 05:13:35 +0000 (UTC)
X-UUID: 6c54cfae75dd4b99ba4a743768849a37-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rdFrZ9Jcx8qzNQWZZwmRMxMHx3C9rWLkOXwKIpvFHjM=; 
 b=THuwtRoKArpk5CFwi9K4tY1xk6K9CouAoQKYCUPz+JPvdomUfDwXjc5OzCGAMoscm5qJHZOnG45OvT4PwmK5a+uUiPGPQBgAFuT4LRCrKi34GIi2vgr7giqta/LrPk7fQC1ZraTT6rv48f4sy7+zuumr1PS6OALhFaRpAd/JC5M=;
X-UUID: 6c54cfae75dd4b99ba4a743768849a37-20200103
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 627967508; Fri, 03 Jan 2020 12:58:25 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 12:57:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 12:58:48 +0800
Message-ID: <1578027500.30178.0.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 00/17] add drm support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 3 Jan 2020 12:58:20 +0800
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB3FFA3455567347BB4B802EBF6FC3E22F76B49220CCA2C99D4FD73A8E25E2142000:8
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

This 'RESEND v6' is different with v6, so I think you should call this
v7.

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
