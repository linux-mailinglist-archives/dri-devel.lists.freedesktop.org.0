Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3751B7BBB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 18:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62056EABE;
	Fri, 24 Apr 2020 16:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDC46EABE;
 Fri, 24 Apr 2020 16:38:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4061820031;
 Fri, 24 Apr 2020 18:37:58 +0200 (CEST)
Date: Fri, 24 Apr 2020 18:37:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 37/59] drm/cirrus: Move to drm/tiny
Message-ID: <20200424163756.GB3822@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-38-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-38-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8
 a=7gkXJVJtAAAA:8 a=RYJPnzK0AAAA:8 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8
 a=SbjN3GQ1GeqvrpwrGE8A:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=71IlbOU7e524H-Equz-4:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:12AM +0200, Daniel Vetter wrote:
> Because it is. Huge congrats to everyone who made this kind of
> refactoring happen!
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  MAINTAINERS                               |  2 +-
>  drivers/gpu/drm/Kconfig                   |  2 --
>  drivers/gpu/drm/Makefile                  |  1 -
>  drivers/gpu/drm/cirrus/Kconfig            | 19 -------------------
>  drivers/gpu/drm/cirrus/Makefile           |  2 --
>  drivers/gpu/drm/tiny/Kconfig              | 19 +++++++++++++++++++
>  drivers/gpu/drm/tiny/Makefile             |  1 +
>  drivers/gpu/drm/{cirrus => tiny}/cirrus.c |  0
>  8 files changed, 21 insertions(+), 25 deletions(-)
>  delete mode 100644 drivers/gpu/drm/cirrus/Kconfig
>  delete mode 100644 drivers/gpu/drm/cirrus/Makefile
>  rename drivers/gpu/drm/{cirrus => tiny}/cirrus.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b3255d96d1d..0a5cf105ee37 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5397,7 +5397,7 @@ L:	virtualization@lists.linux-foundation.org
>  S:	Obsolete
>  W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	drivers/gpu/drm/cirrus/
> +F:	drivers/gpu/drm/tiny/cirrus.c
>  
>  DRM DRIVER FOR QXL VIRTUAL GPU
>  M:	Dave Airlie <airlied@redhat.com>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 43594978958e..4f4e7fa001c1 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -310,8 +310,6 @@ source "drivers/gpu/drm/ast/Kconfig"
>  
>  source "drivers/gpu/drm/mgag200/Kconfig"
>  
> -source "drivers/gpu/drm/cirrus/Kconfig"
> -
>  source "drivers/gpu/drm/armada/Kconfig"
>  
>  source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index f34d08c83485..2c0e5a7e5953 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -74,7 +74,6 @@ obj-$(CONFIG_DRM_I915)	+= i915/
>  obj-$(CONFIG_DRM_MGAG200) += mgag200/
>  obj-$(CONFIG_DRM_V3D)  += v3d/
>  obj-$(CONFIG_DRM_VC4)  += vc4/
> -obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus/
>  obj-$(CONFIG_DRM_SIS)   += sis/
>  obj-$(CONFIG_DRM_SAVAGE)+= savage/
>  obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
> diff --git a/drivers/gpu/drm/cirrus/Kconfig b/drivers/gpu/drm/cirrus/Kconfig
> deleted file mode 100644
> index c6bbd988b0e5..000000000000
> --- a/drivers/gpu/drm/cirrus/Kconfig
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config DRM_CIRRUS_QEMU
> -	tristate "Cirrus driver for QEMU emulated device"
> -	depends on DRM && PCI && MMU
> -	select DRM_KMS_HELPER
> -	select DRM_GEM_SHMEM_HELPER
> -	help
> -	 This is a KMS driver for emulated cirrus device in qemu.
> -	 It is *NOT* intended for real cirrus devices. This requires
> -	 the modesetting userspace X.org driver.
> -
> -	 Cirrus is obsolete, the hardware was designed in the 90ies
> -	 and can't keep up with todays needs.  More background:
> -	 https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
> -
> -	 Better alternatives are:
> -	   - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
> -	   - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
> -	   - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
> diff --git a/drivers/gpu/drm/cirrus/Makefile b/drivers/gpu/drm/cirrus/Makefile
> deleted file mode 100644
> index 0c1ed3f99725..000000000000
> --- a/drivers/gpu/drm/cirrus/Makefile
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus.o
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 4160e74e4751..2b6414f0fa75 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -1,5 +1,24 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +config DRM_CIRRUS_QEMU
> +	tristate "Cirrus driver for QEMU emulated device"
> +	depends on DRM && PCI && MMU
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER
> +	help
> +	 This is a KMS driver for emulated cirrus device in qemu.
> +	 It is *NOT* intended for real cirrus devices. This requires
> +	 the modesetting userspace X.org driver.
> +
> +	 Cirrus is obsolete, the hardware was designed in the 90ies
> +	 and can't keep up with todays needs.  More background:
> +	 https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
> +
> +	 Better alternatives are:
> +	   - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
> +	   - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
> +	   - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
> +
>  config DRM_GM12U320
>  	tristate "GM12U320 driver for USB projectors"
>  	depends on DRM && USB
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index c96ceee71453..6ae4e9e5a35f 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
>  obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
>  obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
>  obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> similarity index 100%
> rename from drivers/gpu/drm/cirrus/cirrus.c
> rename to drivers/gpu/drm/tiny/cirrus.c
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
