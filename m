Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12780170E59
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 03:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A085E6E3A6;
	Thu, 27 Feb 2020 02:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAB626E3A6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 02:19:52 +0000 (UTC)
X-UUID: 23464d44001a40d2a641030f2d998ab9-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K4gGve8y0GjmB4JegJVgO+MM4WVhEqGsHCW/PaLyMBE=; 
 b=NmTxK+hDuJjB44uoqb2qj3OW6lWT6qKXjcslPrTxOlIjF0M6JmpTjx6/+1GSZcRWXz2ieI61kB8O2o3jmaM2Xhl7yJkCPBZq3evrfs8aXvNYGaJelcUFHPCpWDL4WtaOyIiQj0StsM5tyJBAdSWjb1An2aFmO9KplErdHO3WmFo=;
X-UUID: 23464d44001a40d2a641030f2d998ab9-20200227
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 141035688; Thu, 27 Feb 2020 10:19:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 10:18:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 10:19:51 +0800
Message-ID: <1582769985.20746.10.camel@mtksdaap41>
Subject: Re: [PATCH v9 0/4] arm64: mediatek: Fix mt8173 mmsys device probing
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 10:19:45 +0800
In-Reply-To: <20200226105419.632771-1-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 Allison Randal <allison@lohutok.net>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

I would like you to modify mmsys binding document. In current document,
mmsys is a clock controller, but I think it's a system controller
including clock control, routing control, and miscellaneous control in
mmsys partition.

Regards,
CK

On Wed, 2020-02-26 at 11:54 +0100, Enric Balletbo i Serra wrote:
> Dear all,
> 
> Those patches are intended to solve an old standing issue on some
> Mediatek devices (mt8173, mt2701 and mt2712).
> 
> Up to now both drivers, clock and drm are probed with the same device tree
> compatible. But only the first driver gets probed, which in effect breaks
> graphics on those devices.
> 
> The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
> control clock gates (which is used in the clk driver) and some registers
> to set the routing and enable the differnet blocks of the display
> and MDP (Media Data Path) subsystem. On this series the clk driver is
> not a pure clock controller but a system controller that can provide
> access to the shared registers between the different drivers that need
> it (mediatek-drm and mediatek-mdp). Hence the MMSYS clk driver was moved
> to drivers/soc/mediatek and is the entry point (parent) which will trigger
> the probe of the corresponding mediatek-drm driver.
> 
> **IMPORTANT** This series only fixes the issue on mt8173 to make it
> simple and as is the only platform I can test. Similar changes should be
> applied for mt2701 and mt2712 to have display working.
> 
> For reference, here are the links to the old discussions:
> * v8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=244891
> * v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
> * v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
> * v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
> * v4:
>   * https://patchwork.kernel.org/patch/10530871/
>   * https://patchwork.kernel.org/patch/10530883/
>   * https://patchwork.kernel.org/patch/10530885/
>   * https://patchwork.kernel.org/patch/10530911/
>   * https://patchwork.kernel.org/patch/10530913/
> * v3:
>   * https://patchwork.kernel.org/patch/10367857/
>   * https://patchwork.kernel.org/patch/10367861/
>   * https://patchwork.kernel.org/patch/10367877/
>   * https://patchwork.kernel.org/patch/10367875/
>   * https://patchwork.kernel.org/patch/10367885/
>   * https://patchwork.kernel.org/patch/10367883/
>   * https://patchwork.kernel.org/patch/10367889/
>   * https://patchwork.kernel.org/patch/10367907/
>   * https://patchwork.kernel.org/patch/10367909/
>   * https://patchwork.kernel.org/patch/10367905/
> * v2: No relevant discussion, see v3
> * v1:
>   * https://patchwork.kernel.org/patch/10016497/
>   * https://patchwork.kernel.org/patch/10016499/
>   * https://patchwork.kernel.org/patch/10016505/
>   * https://patchwork.kernel.org/patch/10016507/
> 
> Best regards,
>  Enric
> 
> Changes in v9:
> - Move mmsys to drivers/soc/mediatek (CK)
> - Do not move the display routing from the drm driver (CK)
> - Removed from this series because are not needed:
>   * [PATCH v8 5/6] drm/mediatek: Move MMSYS configuration to include/linux/platform_data
> - Removed from this series because are applied:
>   * [PATCH v8 3/6] media: mtk-mdp: Check return value of of_clk_get.
> 
> Changes in v8:
> - Select REGMAP and MFD_SYSCON (Randy Dunlap)
> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> - New patch introduced in this series.
> 
> Changes in v7:
> - Add R-by from CK
> - Free clk_data->clks as well
> - Get rid of private data structure
> 
> Enric Balletbo i Serra (1):
>   drm/mediatek: Fix mediatek-drm device probing
> 
> Matthias Brugger (3):
>   drm/mediatek: Use regmap for register access
>   drm/mediatek: Omit warning on probe defers
>   soc: mediatek: Move mt8173 MMSYS to platform driver
> 
>  drivers/clk/mediatek/clk-mt8173.c         | 104 ----------------
>  drivers/gpu/drm/mediatek/Kconfig          |   2 +
>  drivers/gpu/drm/mediatek/mtk_disp_color.c |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c        |  12 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c   |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  53 ++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h    |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    |  45 ++++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c        |   8 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c       |   4 +-
>  drivers/soc/mediatek/Kconfig              |   7 ++
>  drivers/soc/mediatek/Makefile             |   1 +
>  drivers/soc/mediatek/mt8173-mmsys.c       | 143 ++++++++++++++++++++++
>  16 files changed, 233 insertions(+), 171 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8173-mmsys.c
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
