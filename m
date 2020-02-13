Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A015B78E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 04:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EE76EB21;
	Thu, 13 Feb 2020 03:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2020 03:10:51 UTC
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [216.200.240.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B136EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 03:10:51 +0000 (UTC)
X-UUID: a726eaddffad4e0e8a84623cf2e77221-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0HPDjdt74T111dUFssEsZJlHvxvLqFiiV5OgaDl5UMI=; 
 b=leVPUigmIgi+5lYDpuX29RQSRcbEv8Hm0/47jlB8vwQJ0pTQDGP3gf+0/gGpu4/f8CfzzrdOkesbjHHCf1ijfEGpQhbqPyP9ltKQ6inV2tBm1eGIw6fEZ9Hbsd1Hr/087GcW7Nl/uIu9k3rMFELZYqayoY0VEkIDzyV2Es+EyXY=;
X-UUID: a726eaddffad4e0e8a84623cf2e77221-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 27702398; Wed, 12 Feb 2020 19:05:43 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 18:58:05 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 10:56:49 +0800
Message-ID: <1581562673.24120.3.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 00/12] arm/arm64: mediatek: Fix mmsys device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Thu, 13 Feb 2020 10:57:53 +0800
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, sean.wang@kernel.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:


Would you work on this series in a short time? Some Yongqiang's patches
[1] also modify mmsys driver, and now it depend on your patch to prevent
conflicts. If you would not work on this series in a short time, I would
like to apply Yongqiang's patch without this series.

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=223221

Regards,
CK

On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> [reseding due to wrong mail of Stephen]
> 
> This is version five of the series. It's a long time this wasn't worked on, so
> as a reminder, version four can be found here:
> https://patchwork.kernel.org/cover/10686247/
> 
> The biggest changes this new version does, is to implement the clock probing
> through a platform driver. The corresponding platform device get's created in
> the DRM driver. I converted all the clock drivers to platform drivers and tested
> the approach on the Acer Chromebook R13 (mt8173 based).
> Apart from that I reordered the patches so that the DT bindings update are the first
> patches.
> 
> Changes since v5:
> - re-arrange the patch order
> - generate platform_device for mmsys clock driver inside the DRM driver
> - fix DTS binding accordingly
> - switch all mmsys clock driver to platform probing
> - fix mt8173 platform driver remove function
> - fix probe defer path in HDMI driver
> - fix probe defer path in mtk_mdp_comp
> - fix identation of error messages
> 
> Changes since v4:
> - fix missing regmap accessors in drm diver (patch 1)
> - omit probe deffered warning on all drivers (patch 5)
> - update drm and clk bindings (patch 6 and 7)
> - put mmsys clock part in dts child node of mmsys. Only done
> for HW where no dts backport compatible breakage is expected 
> (either DRM driver not yet implemented or no HW available to
> the public) (patch 9 to 12)
> 
> Changes since v3:
> - use platform device to probe clock driver
> - add Acked-by CK Hu for the probe deferred patch
> 
> Changes since v2:
> - fix kconfig typo (shame on me)
> - delete __initconst from mm_clocks as converted to a platform driver
>   
> Changes since v1:
> - add binding documentation
> - ddp: use regmap_update_bits
> - ddp: ignore EPROBE_DEFER on clock probing
> - mfd: delete mmsys_private
> - add Reviewed-by and Acked-by tags
>  
> MMSYS in Mediatek SoCs has some registers to control clock gates (which is 
> used in the clk driver) and some registers to set the routing and enable
> the differnet blocks of the display subsystem.
> 
> Up to now both drivers, clock and drm are probed with the same device tree
> compatible. But only the first driver get probed, which in effect breaks
> graphics on mt8173 and mt2701.
> 
> This patch uses a platform device registration in the DRM driver, which
> will trigger the probe of the corresponding clock driver. It was tested on the
> bananapi-r2 and the Acer R13 Chromebook.
> 
> 
> Matthias Brugger (12):
>   dt-bindings: display: mediatek: Add mmsys binding description
>   dt-bindings: mediatek: Add compatible for mt7623
>   drm/mediatek: Use regmap for register access
>   drm: mediatek: Omit warning on probe defers
>   media: mtk-mdp: Check return value of of_clk_get
>   clk: mediatek: mt2701: switch mmsys to platform device probing
>   clk: mediatek: mt2712e: switch to platform device probing
>   clk: mediatek: mt6779: switch mmsys to platform device probing
>   clk: mediatek: mt6797: switch to platform device probing
>   clk: mediatek: mt8183: switch mmsys to platform device probing
>   clk: mediatek: mt8173: switch mmsys to platform device probing
>   drm/mediatek: Add support for mmsys through a pdev
> 
>  .../display/mediatek/mediatek,disp.txt        | 30 ++++++-----
>  drivers/clk/mediatek/clk-mt2701-mm.c          | 41 +++++++++-----
>  drivers/clk/mediatek/clk-mt2712-mm.c          | 39 +++++++++-----
>  drivers/clk/mediatek/clk-mt6779-mm.c          | 41 +++++++++-----
>  drivers/clk/mediatek/clk-mt6797-mm.c          | 43 ++++++++++-----
>  drivers/clk/mediatek/clk-mt8173.c             | 51 +++++++++++++++---
>  drivers/clk/mediatek/clk-mt8183-mm.c          | 39 +++++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            | 12 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 54 +++++++++----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 35 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  4 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 ++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 +++
>  19 files changed, 295 insertions(+), 135 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
