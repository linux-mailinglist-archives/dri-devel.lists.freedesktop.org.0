Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDCB86126
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 18:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0954A10E8D0;
	Thu, 18 Sep 2025 16:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGvVPrfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8C10E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758213725; x=1789749725;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=XJgOn7HuqNPZj6F8QPvkSK3MbpnxkDjQlATtew5jtfc=;
 b=aGvVPrfQWSIZp4J7HOZoUgLyTNkO2boDI3kk0Cgg12xZi+1zcKV8//R7
 XMGqmXogTSCjhMWc57pYPNUAK2jYqygGwC04GPVMMQ5rcA+GSFGL+4AgX
 GVOM4SNba7pSgIsutMGAVxyVbGFYIbdvtJlKGejwqvR8nTc2KecYuSK9v
 zRXO1RrIHnohwB6+NHWc6FgkZ3+vR5IZ80DKUhJW09orHXTUICky+tkiB
 0ikR5xLRNC2bryWHKnN6SK3wEgGrvrE2J/60SOXaeLen8lV7Wn9iBg3tT
 QKPZL2ArqGu3yRq03cNnQHZRrd4idY6YMeQhx9RUebf1LJNb8Ll5LZQIX w==;
X-CSE-ConnectionGUID: kdATyBpJQlaUB+6tMLNnsQ==
X-CSE-MsgGUID: Q2yEsCUIRSKdARtmECdcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60664991"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60664991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:42:04 -0700
X-CSE-ConnectionGUID: xaa/hob6TEqnujRpfnunkA==
X-CSE-MsgGUID: cRfyA7KfTE2hpKWqOO1GBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="174716867"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:42:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 18 Sep 2025 19:41:59 +0300 (EEST)
To: Lucas De Marchi <lucas.demarchi@intel.com>
cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/xe: Move rebar to its own file
In-Reply-To: <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
Message-ID: <c276f28c-f599-43e3-a4e5-82b3ad286361@linux.intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
 <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1109884702-1758213719=:949"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1109884702-1758213719=:949
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 17 Sep 2025, Lucas De Marchi wrote:

> Now that xe_pci.c calls the rebar directly, it doens't make sense to
> keep it in xe_vram.c since it's closer to the PCI initialization than to
> the vram. Move it to its own file.
>=20
> While at it, add a better comment to document the possible values for
> the vram_bar_size module parameter.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   3 +-
>  drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
>  drivers/gpu/drm/xe/xe_vram.c      | 109 --------------------------------=
-
>  drivers/gpu/drm/xe/xe_vram.h      |   1 -
>  6 files changed, 141 insertions(+), 111 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7a065c98a3b85..5a66d7a53d0db 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
>  =09xe_observation.o \
>  =09xe_pat.o \
>  =09xe_pci.o \
> +=09xe_pci_rebar.o \
>  =09xe_pcode.o \
>  =09xe_pm.o \
>  =09xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1f4120b535137..6cc5e7b6901a8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -27,6 +27,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_rebar.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> @@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const s=
truct pci_device_id *ent)
>  =09if (err)
>  =09=09return err;
> =20
> -=09xe_vram_resize_bar(xe);
> +=09xe_pci_rebar(xe);
> =20
>  =09err =3D xe_device_probe_early(xe);
>  =09/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pc=
i_rebar.c
> new file mode 100644
> index 0000000000000..e04416630b573
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#include "xe_pci_rebar.h"
> +
> +#include <linux/pci.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_bars.h"
> +#include "xe_device_types.h"
> +#include "xe_module.h"
> +
> +#define BAR_SIZE_SHIFT 20
> +
> +static void release_bars(struct pci_dev *pdev)
> +{
> +=09int resno;
> +
> +=09for (resno =3D PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno=
++) {
> +=09=09if (pci_resource_len(pdev, resno))
> +=09=09=09pci_release_resource(pdev, resno);
> +=09}
> +}
> +
> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t =
size)
> +{
> +=09struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +=09int bar_size =3D pci_rebar_bytes_to_size(size);
> +=09int ret;
> +
> +=09release_bars(pdev);
> +
> +=09ret =3D pci_resize_resource(pdev, resno, bar_size);
> +=09if (ret) {
> +=09=09drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider =
enabling 'Resizable BAR' support in your BIOS\n",
> +=09=09=09 resno, 1 << bar_size, ERR_PTR(ret));
> +=09=09return;
> +=09}
> +
> +=09drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> +}
> +
> +void xe_pci_rebar(struct xe_device *xe)
> +{
> +=09int force_vram_bar_size =3D xe_modparam.force_vram_bar_size;
> +=09struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +=09struct pci_bus *root =3D pdev->bus;
> +=09resource_size_t current_size;
> +=09resource_size_t rebar_size;
> +=09struct resource *root_res;
> +=09u32 bar_size_mask;
> +=09u32 pci_cmd;
> +=09int i;
> +
> +=09/* gather some relevant info */
> +=09current_size =3D pci_resource_len(pdev, LMEM_BAR);
> +=09bar_size_mask =3D pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> +
> +=09if (!bar_size_mask)
> +=09=09return;
> +
> +=09/*
> +=09 * Handle force_vram_bar_size:
> +=09 * - negative: resize is disabled
> +=09 * - 0: try to resize to maximum possible
> +=09 * - positive: resize to specific value
> +=09 */
> +=09if (force_vram_bar_size < 0)
> +=09=09return;
> +
> +=09if (force_vram_bar_size) {
> +=09=09u32 bar_size_bit;
> +
> +=09=09rebar_size =3D force_vram_bar_size * (resource_size_t)SZ_1M;
> +
> +=09=09bar_size_bit =3D bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar=
_size));
> +
> +=09=09if (!bar_size_bit) {
> +=09=09=09drm_info(&xe->drm,
> +=09=09=09=09 "Requested size: %lluMiB is not supported by rebar sizes: 0=
x%x. Leaving default: %lluMiB\n",
> +=09=09=09=09 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> =
20);
> +=09=09=09return;
> +=09=09}
> +
> +=09=09rebar_size =3D 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> +
> +=09=09if (rebar_size =3D=3D current_size)
> +=09=09=09return;
> +=09} else {
> +=09=09rebar_size =3D 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> +
> +=09=09/* only resize if larger than current */
> +=09=09if (rebar_size <=3D current_size)
> +=09=09=09return;
> +=09}
> +
> +=09drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\=
n",
> +=09=09 (u64)current_size >> 20, (u64)rebar_size >> 20);

BTW, if you want to do additional cleanups, all these 20 could be replaced=
=20
with ilog(SZ_1M) as it makes more obvious where that number comes from.

But this conflicts anyway with my rebar rework series so perhaps this=20
is not the best time for such cleanup.

--=20
 i.

--8323328-1109884702-1758213719=:949--
