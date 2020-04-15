Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E11A9930
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758D6E93B;
	Wed, 15 Apr 2020 09:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241496E930;
 Wed, 15 Apr 2020 09:45:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4E26F8046E;
 Wed, 15 Apr 2020 11:45:14 +0200 (CEST)
Date: Wed, 15 Apr 2020 11:45:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Message-ID: <20200415094512.GA30444@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-54-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=jIQo8A4GAAAA:8 a=e5mUnYsNAAAA:8 a=1gUMNOpLyEigj0iPTqUA:9
 a=CjuIK1q_8ugA:10 a=Lf5xNeLK5dgiOs8hzIjU:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.
On Wed, Apr 15, 2020 at 09:40:28AM +0200, Daniel Vetter wrote:
> Because it is.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  MAINTAINERS                                         |  2 +-
>  drivers/gpu/drm/Kconfig                             |  2 --
>  drivers/gpu/drm/Makefile                            |  1 -
>  drivers/gpu/drm/arc/Kconfig                         | 10 ----------
>  drivers/gpu/drm/arc/Makefile                        |  3 ---
>  drivers/gpu/drm/tiny/Kconfig                        | 10 ++++++++++
>  drivers/gpu/drm/tiny/Makefile                       |  1 +
>  drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} |  0
>  8 files changed, 12 insertions(+), 17 deletions(-)
>  delete mode 100644 drivers/gpu/drm/arc/Kconfig
>  delete mode 100644 drivers/gpu/drm/arc/Makefile
>  rename drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} (100%)

We have "DRM: ARC: add HDMI 2.0 TX encoder support" which
adds another platform driver to drm/arc/
This speaks against the move to tiny IMO

	Sam

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a5cf105ee37..748244b1625b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1295,7 +1295,7 @@ ARC PGU DRM DRIVER
>  M:	Alexey Brodkin <abrodkin@synopsys.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
> -F:	drivers/gpu/drm/arc/
> +F:	drivers/gpu/drm/tiny/arcpgu.c
>  
>  ARCNET NETWORK LAYER
>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 4f4e7fa001c1..a0a89025d6fa 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -354,8 +354,6 @@ source "drivers/gpu/drm/vc4/Kconfig"
>  
>  source "drivers/gpu/drm/etnaviv/Kconfig"
>  
> -source "drivers/gpu/drm/arc/Kconfig"
> -
>  source "drivers/gpu/drm/hisilicon/Kconfig"
>  
>  source "drivers/gpu/drm/mediatek/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2c0e5a7e5953..e69eafbf9e39 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -109,7 +109,6 @@ obj-y			+= panel/
>  obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
>  obj-y			+= hisilicon/
>  obj-$(CONFIG_DRM_ZTE)	+= zte/
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> deleted file mode 100644
> index e8f3d63e0b91..000000000000
> --- a/drivers/gpu/drm/arc/Kconfig
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config DRM_ARCPGU
> -	tristate "ARC PGU"
> -	depends on DRM && OF
> -	select DRM_KMS_CMA_HELPER
> -	select DRM_KMS_HELPER
> -	help
> -	  Choose this option if you have an ARC PGU controller.
> -
> -	  If M is selected the module will be called arcpgu.
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> deleted file mode 100644
> index b26f2495c532..000000000000
> --- a/drivers/gpu/drm/arc/Makefile
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -arcpgu-y := arcpgu_drv.o
> -obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 2b6414f0fa75..9bbaa1a69050 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -1,5 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +config DRM_ARCPGU
> +	tristate "ARC PGU"
> +	depends on DRM && OF
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this option if you have an ARC PGU controller.
> +
> +	  If M is selected the module will be called arcpgu.
> +
>  config DRM_CIRRUS_QEMU
>  	tristate "Cirrus driver for QEMU emulated device"
>  	depends on DRM && PCI && MMU
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 6ae4e9e5a35f..bef6780bdd6f 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
>  obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
>  obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
>  obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/tiny/arcpgu.c
> similarity index 100%
> rename from drivers/gpu/drm/arc/arcpgu_drv.c
> rename to drivers/gpu/drm/tiny/arcpgu.c
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
