Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E8524A3BB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 18:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03D86E3B0;
	Wed, 19 Aug 2020 16:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0876E3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:04:41 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AB31720024;
 Wed, 19 Aug 2020 18:04:35 +0200 (CEST)
Date: Wed, 19 Aug 2020 18:04:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
Message-ID: <20200819160434.GA2655@ravnborg.org>
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-4-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819154421.7013-4-chunkuang.hu@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=tnxLhXcf9_o-TLNqnQEA:9 a=CjuIK1q_8ugA:10
 a=6heAxKwa5pAsJatQ0mat:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang

Two small details below.

	Sam

On Wed, Aug 19, 2020 at 11:44:20PM +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_hdmi_phy driver into phy driver folder.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 6 ++++++
>  .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
>  .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
>  .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
>  .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
>  8 files changed, 16 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index ca3cd871a350..65cd03a4be29 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -27,10 +27,3 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> -
> -config PHY_MTK_HDMI
> -    tristate "MediaTek HDMI-PHY Driver"
> -    depends on ARCH_MEDIATEK && OF
> -    select GENERIC_PHY
> -    help
> -          Enable this to support HDMI-PHY
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index fcbef23aa6ce..77b0fd86063d 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -22,9 +22,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> -
> -phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
> -			 mtk_mt2701_hdmi_phy.o \
> -			 mtk_mt8173_hdmi_phy.o
> -
> -obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index dee757c957f2..10f0ec2d5b54 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -35,3 +35,10 @@ config PHY_MTK_XSPHY
>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
>  	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
>  	  multiple USB2.0, USB3.1 GEN2 ports.
> +
> +config PHY_MTK_HDMI
> +    tristate "MediaTek HDMI-PHY Driver"
> +    depends on ARCH_MEDIATEK && OF
> +    select GENERIC_PHY
> +    help
> +          Enable this to support HDMI-PHY
This helptext could use a bit more love and care - it is not obvious
from the help text what this option does.


> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 08a8e6a97b1e..c9a3641f0b16 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -6,3 +6,9 @@
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> +
> +phy-mtk-hdmi-drv-objs := phy-mtk-hdmi.o \
> +			 phy-mtk-hdmi-mt2701.o \
> +			 phy-mtk-hdmi-mt8173.o
> +
The modern syntax is to use -y and not -objs.
And getting rid of '\' would also be nice.
So something like this:

phy-mtk-hdmi-drv-y := phy-mtk-hdmi.o 
phy-mtk-hdmi-drv-y += phy-mtk-hdmi-mt2701.o
phy-mtk-hdmi-drv-y += phy-mtk-hdmi-mt8173.o

Looks much more readable to me.

> +obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index 99fe05cd3598..a6cb1dea3d0c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -4,7 +4,7 @@
>   * Author: Chunhui Dai <chunhui.dai@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0	0x00
>  #define RG_HDMITX_DRV_IBIAS		0
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> index 827b93786fac..6cdfdf5a698a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0		0x00
>  #define RG_HDMITX_PLL_EN		BIT(31)
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi.c
> index fe022acddbef..8fc83f01a720 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  static int mtk_hdmi_phy_power_on(struct phy *phy);
>  static int mtk_hdmi_phy_power_off(struct phy *phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> rename to drivers/phy/mediatek/phy-mtk-hdmi.h
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
