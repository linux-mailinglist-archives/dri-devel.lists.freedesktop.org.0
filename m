Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176FB2B5B4E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810A96E15A;
	Tue, 17 Nov 2020 08:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73BC66E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 03:36:01 +0000 (UTC)
X-UUID: e2e476d0fc7c4aa1b81ec5cb1d41de9c-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9lXqFzp2pUfNGG0hxIdRdfJ3T4i/tYEZMqpOmdgUWe4=; 
 b=PlXc2vZCG1asH23R0XHoXCPmhg31bWBatZXlQMm/ZAShr/xFuvZ/8hNgtwF6mBOYQb5bk38TGoBbY3sMXAS2GBj1+7Eyf4PB3RMSSbKZdTlcEstJXnQPUiLGASoogJ2WdGBoWc0cZ1+S9qc7WrwgBFH+j0/dLbFF+Jelx91nbNo=;
X-UUID: e2e476d0fc7c4aa1b81ec5cb1d41de9c-20201117
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 240982908; Tue, 17 Nov 2020 11:35:56 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Nov 2020 11:35:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Nov 2020 11:35:50 +0800
Message-ID: <1605584151.31607.35.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 11:35:51 +0800
In-Reply-To: <20201116231407.94-3-chunkuang.hu@kernel.org>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B95D2D481DAC4A3038D14ED72C3D9D030F57D0A6ED6B197E021B229AAED557D92000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,
On Tue, 2020-11-17 at 07:14 +0800, Chun-Kuang Hu wrote:
> mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_mipi_dsi_phy driver into phy driver folder.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
You forgot to add acked-by me

> ---
>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 5 +++++
>  .../mediatek/phy-mtk-mipi-dsi-mt8173.c}                    | 2 +-
>  .../mediatek/phy-mtk-mipi-dsi-mt8183.c}                    | 2 +-
>  .../mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c}      | 2 +-
>  .../mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h}      | 0
>  8 files changed, 15 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 24c4890a6e65..2976d21e9a34 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,10 +28,3 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> -
> -config PHY_MTK_MIPI_DSI
> -	tristate "Mediatek MIPI-DSI-PHY Driver"
> -	depends on ARCH_MEDIATEK && OF
> -	select GENERIC_PHY
> -	help
> -	  Support MIPI DSI PHY for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index baa188000543..a892edec5563 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -19,9 +19,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> -
> -phy-mtk-mipi-dsi-drv-objs := mtk_mipi_tx.o \
> -			     mtk_mt8173_mipi_tx.o \
> -			     mtk_mt8183_mipi_tx.o
> -
> -obj-$(CONFIG_PHY_MTK_MIPI_DSI) += phy-mtk-mipi-dsi-drv.o
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 50c5e9306e19..574b8e6398d2 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -42,3 +42,10 @@ config PHY_MTK_HDMI
>  	select GENERIC_PHY
>  	help
>  	  Support HDMI PHY for Mediatek SoCs.
> +
> +config PHY_MTK_MIPI_DSI
> +	tristate "MediaTek MIPI-DSI Driver"
> +	depends on ARCH_MEDIATEK && OF
> +	select GENERIC_PHY
> +	help
> +	  Support MIPI DSI for Mediatek SoCs.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 6325e38709ed..ace660fbed3a 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -11,3 +11,8 @@ phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
>  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
> +
> +phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> +phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
> +phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
> +obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> index f18db14d8b63..7a847954594f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> @@ -4,7 +4,7 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_DSI_CON		0x00
>  #define RG_DSI_LDOCORE_EN		BIT(0)
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> index 9f3e55aeebb2..99108426d57c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> @@ -4,7 +4,7 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_LANE_CON		0x000c
>  #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index f2a892e16c27..18c481251f04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -3,7 +3,7 @@
>   * Copyright (c) 2015 MediaTek Inc.
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
>  {
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.h

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
