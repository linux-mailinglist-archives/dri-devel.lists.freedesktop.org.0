Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C219D925
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98886E149;
	Fri,  3 Apr 2020 14:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ECB6E149
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:31:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 928DA804FC;
 Fri,  3 Apr 2020 16:31:15 +0200 (CEST)
Date: Fri, 3 Apr 2020 16:31:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: delete drm_pci.h
Message-ID: <20200403143114.GA966@ravnborg.org>
References: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
 <20200403110610.2344842-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403110610.2344842-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=UYoTZ2hgAAAA:8 a=e5mUnYsNAAAA:8 a=tKDJa-OWtDIyYV1DLDoA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=V6L1DCqn-8WKw3iEt1hp:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Fri, Apr 03, 2020 at 01:06:10PM +0200, Daniel Vetter wrote:
> It's empty!
> 
> After more than 20 years of OS abstraction layer for pci devices, it's
> kinda gone now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Looks good, and survived my build testing.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_bufs.c               |  2 +-
>  drivers/gpu/drm/drm_dma.c                |  2 +-
>  drivers/gpu/drm/drm_pci.c                |  1 -
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c |  2 --
>  drivers/gpu/drm/r128/ati_pcigart.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_drv.c      |  2 +-
>  include/drm/drm_pci.h                    | 37 ------------------------
>  7 files changed, 5 insertions(+), 44 deletions(-)
>  delete mode 100644 include/drm/drm_pci.h
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index dcabf5698333..ef26ac57f039 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -33,6 +33,7 @@
>  #include <linux/mm.h>
>  #include <linux/mman.h>
>  #include <linux/nospec.h>
> +#include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/vmalloc.h>
> @@ -43,7 +44,6 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_pci.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_legacy.h"
> diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> index a7add55a85b4..d07ba54ec945 100644
> --- a/drivers/gpu/drm/drm_dma.c
> +++ b/drivers/gpu/drm/drm_dma.c
> @@ -34,9 +34,9 @@
>   */
>  
>  #include <linux/export.h>
> +#include <linux/pci.h>
>  
>  #include <drm/drm_drv.h>
> -#include <drm/drm_pci.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_legacy.h"
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 131b7a139fda..75e2b7053f35 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -30,7 +30,6 @@
>  #include <drm/drm.h>
>  #include <drm/drm_agpsupport.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_pci.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_internal.h"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> index 698e22420dc5..7fe9831aa9ba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -10,8 +10,6 @@
>  
>  #include <drm/drm.h> /* for drm_legacy.h! */
>  #include <drm/drm_cache.h>
> -#include <drm/drm_legacy.h> /* for drm_pci.h! */
> -#include <drm/drm_pci.h>
>  
>  #include "gt/intel_gt.h"
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
> index 9b4072f97215..3e76ae5a17ee 100644
> --- a/drivers/gpu/drm/r128/ati_pcigart.c
> +++ b/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -32,9 +32,10 @@
>   */
>  
>  #include <linux/export.h>
> +#include <linux/pci.h>
>  
>  #include <drm/drm_device.h>
> -#include <drm/drm_pci.h>
> +#include <drm/drm_legacy.h>
>  #include <drm/drm_print.h>
>  
>  #include "ati_pcigart.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 59f8186a2415..bbb0883e8ce6 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -36,6 +36,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/pci.h>
>  
>  #include <drm/drm_agpsupport.h>
>  #include <drm/drm_crtc_helper.h>
> @@ -44,7 +45,6 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> -#include <drm/drm_pci.h>
>  #include <drm/drm_pciids.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
> deleted file mode 100644
> index 1bf31131960e..000000000000
> --- a/include/drm/drm_pci.h
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -/*
> - * Internal Header for the Direct Rendering Manager
> - *
> - * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> - * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> - * Copyright (c) 2009-2010, Code Aurora Forum.
> - * All rights reserved.
> - *
> - * Author: Rickard E. (Rik) Faith <faith@valinux.com>
> - * Author: Gareth Hughes <gareth@valinux.com>
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - */
> -
> -#ifndef _DRM_PCI_H_
> -#define _DRM_PCI_H_
> -
> -#include <linux/pci.h>
> -
> -#endif /* _DRM_PCI_H_ */
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
