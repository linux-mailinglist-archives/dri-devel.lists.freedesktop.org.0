Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753F8A5075
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476510E99E;
	Mon, 15 Apr 2024 13:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekdyRaR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2E810E99E;
 Mon, 15 Apr 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713186579; x=1744722579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HdIYJlrqP9FL0KZ4Yk9+Yha0XgILYlNmhBjwmpmrZvY=;
 b=ekdyRaR/G171BbpPxg0r3E0povuYG+Ptb4aJUo/ZZGy7dqpXXsSfmtI6
 D0UVc++iXczgZHEgUD03bzbsDWqerEGMEhY+EoT6MmXGGd26YfFvhfec9
 DqazT4boR2i+HXHIyoyFCvv5PFRtn6AC8dvB2MTueCo/n/nQt2kdZYXj2
 2B0Ad91s1KPM0U+it236GcTibwgC4YcT2TsPdzsp6y8cGWTBJ5xB8wID/
 PPV3719oiYiAppK89rDily5iAUV+Ofnx9IcTvrq0X9OgPqU3uMlJW4X+U
 GSTdfzlQfFcn2DvYm/gvbHhH7hg15gECZhnbUNtZO02d2v4biaes5BrfW g==;
X-CSE-ConnectionGUID: FZGMQzGjQbCBjD9bfsB9Ww==
X-CSE-MsgGUID: lyFHlXQWRr+BKOwBY3zHUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8429771"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8429771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:09:39 -0700
X-CSE-ConnectionGUID: eiEvk3Z4SYaNyEsykoW4jw==
X-CSE-MsgGUID: nzlOVtg9RTOk3hgvgORV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22015692"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:09:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>,
 Huang Rui <ray.huang@amd.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
In-Reply-To: <20240410141434.157908-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410141434.157908-1-jani.nikula@intel.com>
Date: Mon, 15 Apr 2024 16:09:22 +0300
Message-ID: <878r1e3h8d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Surprisingly many places depend on debugfs.h to be included via
> drm_print.h. Fix them.

While all of this is trivial, merely adding some includes, please
consider acking the changes to your corner of the kernel.

Thanks,
Jani.

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/panel.c           | 2 ++
>  drivers/gpu/drm/drm_print.c              | 6 +++---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 1 +
>  drivers/gpu/drm/nouveau/dispnv50/crc.c   | 2 ++
>  drivers/gpu/drm/radeon/r100.c            | 1 +
>  drivers/gpu/drm/radeon/r300.c            | 1 +
>  drivers/gpu/drm/radeon/r420.c            | 1 +
>  drivers/gpu/drm/radeon/r600.c            | 3 ++-
>  drivers/gpu/drm/radeon/radeon_fence.c    | 1 +
>  drivers/gpu/drm/radeon/radeon_gem.c      | 1 +
>  drivers/gpu/drm/radeon/radeon_ib.c       | 2 ++
>  drivers/gpu/drm/radeon/radeon_pm.c       | 1 +
>  drivers/gpu/drm/radeon/radeon_ring.c     | 2 ++
>  drivers/gpu/drm/radeon/radeon_ttm.c      | 1 +
>  drivers/gpu/drm/radeon/rs400.c           | 1 +
>  drivers/gpu/drm/radeon/rv515.c           | 1 +
>  drivers/gpu/drm/ttm/ttm_device.c         | 1 +
>  drivers/gpu/drm/ttm/ttm_resource.c       | 3 ++-
>  drivers/gpu/drm/ttm/ttm_tt.c             | 5 +++--
>  include/drm/drm_print.h                  | 2 +-
>  20 files changed, 30 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 7f41525f7a6e..32506524d9a2 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,6 +4,8 @@
>   * Copyright (C) 2017 Broadcom
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 699b7dbffd7b..cf2efb44722c 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -23,13 +23,13 @@
>   * Rob Clark <robdclark@gmail.com>
>   */
>=20=20
> -#include <linux/stdarg.h>
> -
> +#include <linux/debugfs.h>
> +#include <linux/dynamic_debug.h>
>  #include <linux/io.h>
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> -#include <linux/dynamic_debug.h>
> +#include <linux/stdarg.h>
>=20=20
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index e61e9c1b8947..84748add186a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -22,6 +22,7 @@
>   *
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>=20=20
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nou=
veau/dispnv50/crc.c
> index 9c942fbd836d..5936b6b3b15d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: MIT
> +#include <linux/debugfs.h>
>  #include <linux/string.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 86b8b770af19..0b1e19345f43 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
> index 25201b9a5aae..1620f534f55f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
> index eae8a6389f5e..a979662eaa73 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index b5e97d95a19f..087d41e370fd 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -26,11 +26,12 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/slab.h>
>  #include <linux/seq_file.h>
> +#include <linux/slab.h>
>=20=20
>  #include <drm/drm_device.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/rade=
on/radeon_fence.c
> index 9ebe4a0b9a6c..4fb780d96f32 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -30,6 +30,7 @@
>   */
>=20=20
>  #include <linux/atomic.h>
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/kref.h>
>  #include <linux/sched/signal.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index 3fec3acdaf28..2ef201a072f1 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/iosys-map.h>
>  #include <linux/pci.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/=
radeon_ib.c
> index fb9ecf5dbe2b..63d914f3414d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_file.h>
>=20=20
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index 4482c8c5f5ce..2d9d9f46f243 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -21,6 +21,7 @@
>   *          Alex Deucher <alexdeucher@gmail.com>
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeo=
n/radeon_ring.c
> index 38048593bb4a..8d1d458286a8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 2078b0000e22..5c65b6dfb99a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -30,6 +30,7 @@
>   *    Dave Airlie
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pagemap.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs40=
0.c
> index d7f552d441ab..d4d1501e6576 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv51=
5.c
> index 79709d26d983..bbc6ccabf788 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>=20=20
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 76027960054f..434cf0258000 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -27,6 +27,7 @@
>=20=20
>  #define pr_fmt(fmt) "[TTM DEVICE] " fmt
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/mm.h>
>=20=20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index be8d286513f9..4a66b851b67d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,8 +22,9 @@
>   * Authors: Christian K=C3=B6nig
>   */
>=20=20
> -#include <linux/iosys-map.h>
> +#include <linux/debugfs.h>
>  #include <linux/io-mapping.h>
> +#include <linux/iosys-map.h>
>  #include <linux/scatterlist.h>
>=20=20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 578a7c37f00b..474fe7aad2a0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -32,10 +32,11 @@
>  #define pr_fmt(fmt) "[TTM] " fmt
>=20=20
>  #include <linux/cc_platform.h>
> -#include <linux/sched.h>
> -#include <linux/shmem_fs.h>
> +#include <linux/debugfs.h>
>  #include <linux/file.h>
>  #include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/shmem_fs.h>
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9cc473e5d353..561c3b96b6fd 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -30,11 +30,11 @@
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/device.h>
> -#include <linux/debugfs.h>
>  #include <linux/dynamic_debug.h>
>=20=20
>  #include <drm/drm.h>
>=20=20
> +struct debugfs_regset32;
>  struct drm_device;
>=20=20
>  /* Do *not* use outside of drm_print.[ch]! */

--=20
Jani Nikula, Intel
