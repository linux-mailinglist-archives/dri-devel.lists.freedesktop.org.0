Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FE646FEB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 13:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62810E0F0;
	Thu,  8 Dec 2022 12:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1CB10E49A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 12:42:14 +0000 (UTC)
Date: Thu, 8 Dec 2022 20:42:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1670503332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5aiul5Nlc5NxPPaJ7Jemjsd9o8YzjhFYi2oQ1R9hY0=;
 b=RJSHxWdMc/wNGSpYrMykLoOMsiXZ6F4RmJYbIrDhCQKzdj80bGGx+fquXwfJw2aeURnSXm
 jMU0ZNzSm/sIgyOF7wDat3IBtuF2s7cc7HVK5RD0okHPUmCiCoqqypupkhHJy5ySiZHHVQ
 luVrE617SiXh3IQHwPM7116gyyPntAk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: tzimmermann@suse.de
Subject: Re: [RESEND PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
Message-ID: <20221208124207.GA7628@chq-T47>
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221203102502.3185-1-cai.huoqing@linux.dev>
X-Migadu-Flow: FLOW_OUT
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03 12月 22 18:22:51, Cai Huoqing wrote:
> Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
> marked these drivers obsolete 7 years ago.
> And the mesa UMD of these drm drivers already in deprecated list
> in the link: https://docs.mesa3d.org/systems.html
> 
> 3dfx Glide-->driver/gpu/drm/tdfx
> Matrox-->driver/gpu/drm/mga
> Intel i810-->driver/gpu/drm/i810
> S3 Savage-->drivers/gpu/drm/savage
> ATI Rage 128->drivers/gpu/drm/r128
> Silicon Integrated Systems->drivers/gpu/drm/sis
> VIA Unichrome->drivers/gpu/drm/via
> 
> v1->v2:
> 1.Add drm via driver to the patchset.
> 2.Remove related drm_pciids.
> 3.Remove related drm uapi header files.
> 4.split to series avoid large patch email.
Just ping these patch series.
The v1 comments here,
https://lore.kernel.org/lkml/39d8ac1a-d92f-7cdc-14cd-944342f78c1a@suse.de/

Thanks,
Cai
> 
> Cai Huoqing (10):
>   drm: Remove the obsolete driver-i810
>   drm: Remove the obsolete driver-mga
>   drm: Remove the obsolete driver-r128
>   drm: Remove the obsolete driver-savage
>   drm: Remove the obsolete driver-sis
>   drm: Remove the obsolete driver-tdfx
>   drm: Remove the obsolete driver-via
>   drm: Add comments to Kconfig
>   drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128,
>     sis, via)
>   MAINTAINERS: Remove some obsolete drivers info(tdfx, mga, i810,
>     savage, r128, sis)
> 
>  MAINTAINERS                           |   29 -
>  drivers/gpu/drm/Kconfig               |   59 +-
>  drivers/gpu/drm/Makefile              |    7 -
>  drivers/gpu/drm/i810/Makefile         |    8 -
>  drivers/gpu/drm/i810/i810_dma.c       | 1266 ---------
>  drivers/gpu/drm/i810/i810_drv.c       |  101 -
>  drivers/gpu/drm/i810/i810_drv.h       |  246 --
>  drivers/gpu/drm/mga/Makefile          |   11 -
>  drivers/gpu/drm/mga/mga_dma.c         | 1168 --------
>  drivers/gpu/drm/mga/mga_drv.c         |  104 -
>  drivers/gpu/drm/mga/mga_drv.h         |  685 -----
>  drivers/gpu/drm/mga/mga_ioc32.c       |  197 --
>  drivers/gpu/drm/mga/mga_irq.c         |  169 --
>  drivers/gpu/drm/mga/mga_state.c       | 1099 --------
>  drivers/gpu/drm/mga/mga_warp.c        |  167 --
>  drivers/gpu/drm/r128/Makefile         |   10 -
>  drivers/gpu/drm/r128/ati_pcigart.c    |  228 --
>  drivers/gpu/drm/r128/ati_pcigart.h    |   31 -
>  drivers/gpu/drm/r128/r128_cce.c       |  944 -------
>  drivers/gpu/drm/r128/r128_drv.c       |  116 -
>  drivers/gpu/drm/r128/r128_drv.h       |  544 ----
>  drivers/gpu/drm/r128/r128_ioc32.c     |  199 --
>  drivers/gpu/drm/r128/r128_irq.c       |  118 -
>  drivers/gpu/drm/r128/r128_state.c     | 1641 -----------
>  drivers/gpu/drm/savage/Makefile       |    9 -
>  drivers/gpu/drm/savage/savage_bci.c   | 1082 --------
>  drivers/gpu/drm/savage/savage_drv.c   |   91 -
>  drivers/gpu/drm/savage/savage_drv.h   |  580 ----
>  drivers/gpu/drm/savage/savage_state.c | 1169 --------
>  drivers/gpu/drm/sis/Makefile          |   10 -
>  drivers/gpu/drm/sis/sis_drv.c         |  143 -
>  drivers/gpu/drm/sis/sis_drv.h         |   80 -
>  drivers/gpu/drm/sis/sis_mm.c          |  363 ---
>  drivers/gpu/drm/tdfx/Makefile         |    8 -
>  drivers/gpu/drm/tdfx/tdfx_drv.c       |   90 -
>  drivers/gpu/drm/tdfx/tdfx_drv.h       |   47 -
>  drivers/gpu/drm/via/Makefile          |    8 -
>  drivers/gpu/drm/via/via_3d_reg.h      | 1771 ------------
>  drivers/gpu/drm/via/via_dri1.c        | 3630 -------------------------
>  include/drm/drm_pciids.h              |  112 -
>  include/uapi/drm/i810_drm.h           |  292 --
>  include/uapi/drm/mga_drm.h            |  429 ---
>  include/uapi/drm/r128_drm.h           |  336 ---
>  include/uapi/drm/savage_drm.h         |  220 --
>  include/uapi/drm/sis_drm.h            |   77 -
>  include/uapi/drm/via_drm.h            |  282 --
>  46 files changed, 1 insertion(+), 19975 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i810/Makefile
>  delete mode 100644 drivers/gpu/drm/i810/i810_dma.c
>  delete mode 100644 drivers/gpu/drm/i810/i810_drv.c
>  delete mode 100644 drivers/gpu/drm/i810/i810_drv.h
>  delete mode 100644 drivers/gpu/drm/mga/Makefile
>  delete mode 100644 drivers/gpu/drm/mga/mga_dma.c
>  delete mode 100644 drivers/gpu/drm/mga/mga_drv.c
>  delete mode 100644 drivers/gpu/drm/mga/mga_drv.h
>  delete mode 100644 drivers/gpu/drm/mga/mga_ioc32.c
>  delete mode 100644 drivers/gpu/drm/mga/mga_irq.c
>  delete mode 100644 drivers/gpu/drm/mga/mga_state.c
>  delete mode 100644 drivers/gpu/drm/mga/mga_warp.c
>  delete mode 100644 drivers/gpu/drm/r128/Makefile
>  delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.c
>  delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.h
>  delete mode 100644 drivers/gpu/drm/r128/r128_cce.c
>  delete mode 100644 drivers/gpu/drm/r128/r128_drv.c
>  delete mode 100644 drivers/gpu/drm/r128/r128_drv.h
>  delete mode 100644 drivers/gpu/drm/r128/r128_ioc32.c
>  delete mode 100644 drivers/gpu/drm/r128/r128_irq.c
>  delete mode 100644 drivers/gpu/drm/r128/r128_state.c
>  delete mode 100644 drivers/gpu/drm/savage/Makefile
>  delete mode 100644 drivers/gpu/drm/savage/savage_bci.c
>  delete mode 100644 drivers/gpu/drm/savage/savage_drv.c
>  delete mode 100644 drivers/gpu/drm/savage/savage_drv.h
>  delete mode 100644 drivers/gpu/drm/savage/savage_state.c
>  delete mode 100644 drivers/gpu/drm/sis/Makefile
>  delete mode 100644 drivers/gpu/drm/sis/sis_drv.c
>  delete mode 100644 drivers/gpu/drm/sis/sis_drv.h
>  delete mode 100644 drivers/gpu/drm/sis/sis_mm.c
>  delete mode 100644 drivers/gpu/drm/tdfx/Makefile
>  delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
>  delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.h
>  delete mode 100644 drivers/gpu/drm/via/Makefile
>  delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
>  delete mode 100644 drivers/gpu/drm/via/via_dri1.c
>  delete mode 100644 include/uapi/drm/i810_drm.h
>  delete mode 100644 include/uapi/drm/mga_drm.h
>  delete mode 100644 include/uapi/drm/r128_drm.h
>  delete mode 100644 include/uapi/drm/savage_drm.h
>  delete mode 100644 include/uapi/drm/sis_drm.h
>  delete mode 100644 include/uapi/drm/via_drm.h
> 
> -- 
> 2.25.1
> 
