Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4D588EC4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B1D18A3ED;
	Wed,  3 Aug 2022 14:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1F18AD62;
 Wed,  3 Aug 2022 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659537510; x=1691073510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Nqb1+yngeq8ZEFyCg5LpDQx7nLAZOIN90304dKJVByY=;
 b=X8DnD+9wx0LI/TuWKqP1y/qyOP9sVyMd/XeMjTqFOqq2cAY2oNKqJCgm
 scyHRom6IwN4+7ugB3Um0tCJonPzjFBK8ktbyfmXSr7JX/MM4zrSqYtg0
 E1Ss8fEFDaafl8Hhz0m/Z8gT0LFSp03c2crbnL2XCG7P/NY0tsf3khhRl
 0uaiAbcARpJc/3CJZmCxATZN+VgJvU1M8KmbN7pXwGgOhpIEpv18H9J9R
 3ft1McSxGUlbqeYoc61ZYEY0mubZM4Sxb8h6EvCDUpYQO45tqGf4vAEeP
 fp4cbcHjfUps7KKHu3C50VVORizR0gz2yR1qHeYquyVxy0Jx4jQPRq7DE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="276602097"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="276602097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 07:38:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="662107380"
Received: from ns1-mobl.gar.corp.intel.com (HELO localhost) ([10.252.59.244])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:38:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/i915: Use of BARs names instead of numbers
In-Reply-To: <20220803085829.1466903-2-piotr.piorkowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
 <20220803085829.1466903-2-piotr.piorkowski@intel.com>
Date: Wed, 03 Aug 2022 17:38:24 +0300
Message-ID: <87r11xpf33.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Aug 2022, "Piorkowski, Piotr" <piotr.piorkowski@intel.com> wrote:
> From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
>
> At the moment, when we refer to some PCI BAR we use the number of
> this BAR in the code. The meaning of BARs between different platforms
> may be different. Therefore, in order to organize the code,
> let's start using defined names instead of numbers.
>
> v2: Add lost header in cfg_space.c

I could bikeshed the macro names for bars, but meh. This is an
improvement.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c |  5 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c     |  7 ++++---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c           |  9 +++++----
>  drivers/gpu/drm/i915/gt/intel_gt.c             |  3 ++-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c    | 13 ++++++-------
>  drivers/gpu/drm/i915/gvt/cfg_space.c           |  5 +++--
>  drivers/gpu/drm/i915/intel_pci_config.h        |  7 +++++++
>  7 files changed, 30 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu=
/drm/i915/display/intel_lpe_audio.c
> index 4970bf146c4a..1e18696aaecf 100644
> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> @@ -73,6 +73,7 @@
>  #include "i915_drv.h"
>  #include "intel_de.h"
>  #include "intel_lpe_audio.h"
> +#include "intel_pci_config.h"
>=20=20
>  #define HAS_LPE_AUDIO(dev_priv) ((dev_priv)->audio.lpe.platdev !=3D NULL)
>=20=20
> @@ -100,9 +101,9 @@ lpe_audio_platdev_create(struct drm_i915_private *dev=
_priv)
>  	rsc[0].flags    =3D IORESOURCE_IRQ;
>  	rsc[0].name     =3D "hdmi-lpe-audio-irq";
>=20=20
> -	rsc[1].start    =3D pci_resource_start(pdev, 0) +
> +	rsc[1].start    =3D pci_resource_start(pdev, GTTMMADR_BAR) +
>  		I915_HDMI_LPE_AUDIO_BASE;
> -	rsc[1].end      =3D pci_resource_start(pdev, 0) +
> +	rsc[1].end      =3D pci_resource_start(pdev, GTTMMADR_BAR) +
>  		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
>  	rsc[1].flags    =3D IORESOURCE_MEM;
>  	rsc[1].name     =3D "hdmi-lpe-audio-mmio";
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm=
/i915/gem/i915_gem_stolen.c
> index 166d0a4b9e8c..c369cfd185bc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -22,6 +22,7 @@
>  #include "i915_utils.h"
>  #include "i915_vgpu.h"
>  #include "intel_mchbar_regs.h"
> +#include "intel_pci_config.h"
>=20=20
>  /*
>   * The BIOS typically reserves some of the system's memory for the exclu=
sive
> @@ -830,7 +831,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i=
915, u16 type,
>  	/* Use DSM base address instead for stolen memory */
>  	dsm_base =3D intel_uncore_read64(uncore, GEN12_DSMBASE);
>  	if (IS_DG1(uncore->i915)) {
> -		lmem_size =3D pci_resource_len(pdev, 2);
> +		lmem_size =3D pci_resource_len(pdev, GEN12_LMEM_BAR);
>  		if (WARN_ON(lmem_size < dsm_base))
>  			return ERR_PTR(-ENODEV);
>  	} else {
> @@ -842,11 +843,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private =
*i915, u16 type,
>  	}
>=20=20
>  	dsm_size =3D lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, 2) < lmem_size) {
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>  		io_start =3D 0;
>  		io_size =3D 0;
>  	} else {
> -		io_start =3D pci_resource_start(pdev, 2) + dsm_base;
> +		io_start =3D pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>  		io_size =3D dsm_size;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 15a915bb4088..8214e07a0f5b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -16,6 +16,7 @@
>  #include "intel_ggtt_gmch.h"
>  #include "intel_gt.h"
>  #include "intel_gt_regs.h"
> +#include "intel_pci_config.h"
>  #include "i915_drv.h"
>  #include "i915_scatterlist.h"
>  #include "i915_utils.h"
> @@ -869,8 +870,8 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, =
u64 size)
>  	u32 pte_flags;
>  	int ret;
>=20=20
> -	GEM_WARN_ON(pci_resource_len(pdev, 0) !=3D gen6_gttmmadr_size(i915));
> -	phys_addr =3D pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
> +	GEM_WARN_ON(pci_resource_len(pdev, GTTMMADR_BAR) !=3D gen6_gttmmadr_siz=
e(i915));
> +	phys_addr =3D pci_resource_start(pdev, GTTMMADR_BAR) + gen6_gttadr_offs=
et(i915);
>=20=20
>  	/*
>  	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
> @@ -930,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	u16 snb_gmch_ctl;
>=20=20
>  	if (!HAS_LMEM(i915)) {
> -		ggtt->gmadr =3D pci_resource(pdev, 2);
> +		ggtt->gmadr =3D pci_resource(pdev, GTT_APERTURE_BAR);
>  		ggtt->mappable_end =3D resource_size(&ggtt->gmadr);
>  	}
>=20=20
> @@ -1084,7 +1085,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>=20=20
> -	ggtt->gmadr =3D pci_resource(pdev, 2);
> +	ggtt->gmadr =3D pci_resource(pdev, GTT_APERTURE_BAR);
>  	ggtt->mappable_end =3D resource_size(&ggtt->gmadr);
>=20=20
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt=
/intel_gt.c
> index f435e06125aa..e4bac2431e41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -26,6 +26,7 @@
>  #include "intel_gt_requests.h"
>  #include "intel_migrate.h"
>  #include "intel_mocs.h"
> +#include "intel_pci_config.h"
>  #include "intel_pm.h"
>  #include "intel_rc6.h"
>  #include "intel_renderstate.h"
> @@ -830,7 +831,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  	unsigned int mmio_bar;
>  	int ret;
>=20=20
> -	mmio_bar =3D GRAPHICS_VER(i915) =3D=3D 2 ? 1 : 0;
> +	mmio_bar =3D GRAPHICS_VER(i915) =3D=3D 2 ? GEN2_GTTMMADR_BAR : GTTMMADR=
_BAR;
>  	phys_addr =3D pci_resource_start(pdev, mmio_bar);
>=20=20
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/dr=
m/i915/gt/intel_region_lmem.c
> index aa6aed837194..1e79d3c8b126 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -6,6 +6,7 @@
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include "intel_memory_region.h"
> +#include "intel_pci_config.h"
>  #include "intel_region_lmem.h"
>  #include "intel_region_ttm.h"
>  #include "gem/i915_gem_lmem.h"
> @@ -45,7 +46,6 @@ _resize_bar(struct drm_i915_private *i915, int resno, r=
esource_size_t size)
>  	drm_info(&i915->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>  }
>=20=20
> -#define LMEM_BAR_NUM 2
>  static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource=
_size_t lmem_size)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> @@ -56,15 +56,14 @@ static void i915_resize_lmem_bar(struct drm_i915_priv=
ate *i915, resource_size_t
>  	u32 pci_cmd;
>  	int i;
>=20=20
> -	current_size =3D roundup_pow_of_two(pci_resource_len(pdev, LMEM_BAR_NUM=
));
> +	current_size =3D roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_B=
AR));
>=20=20
>  	if (i915->params.lmem_bar_size) {
>  		u32 bar_sizes;
>=20=20
>  		rebar_size =3D i915->params.lmem_bar_size *
>  			(resource_size_t)SZ_1M;
> -		bar_sizes =3D pci_rebar_get_possible_sizes(pdev,
> -							 LMEM_BAR_NUM);
> +		bar_sizes =3D pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>=20=20
>  		if (rebar_size =3D=3D current_size)
>  			return;
> @@ -107,7 +106,7 @@ static void i915_resize_lmem_bar(struct drm_i915_priv=
ate *i915, resource_size_t
>  	pci_write_config_dword(pdev, PCI_COMMAND,
>  			       pci_cmd & ~PCI_COMMAND_MEMORY);
>=20=20
> -	_resize_bar(i915, LMEM_BAR_NUM, rebar_size);
> +	_resize_bar(i915, GEN12_LMEM_BAR, rebar_size);
>=20=20
>  	pci_assign_unassigned_bus_resources(pdev->bus);
>  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> @@ -236,8 +235,8 @@ static struct intel_memory_region *setup_lmem(struct =
intel_gt *gt)
>  				  mul_u32_u32(i915->params.lmem_size, SZ_1M));
>  	}
>=20=20
> -	io_start =3D pci_resource_start(pdev, 2);
> -	io_size =3D min(pci_resource_len(pdev, 2), lmem_size);
> +	io_start =3D pci_resource_start(pdev, GEN12_LMEM_BAR);
> +	io_size =3D min(pci_resource_len(pdev, GEN12_LMEM_BAR), lmem_size);
>  	if (!io_size)
>  		return ERR_PTR(-EIO);
>=20=20
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/=
gvt/cfg_space.c
> index dad3a6054335..eef3bba8a41b 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -33,6 +33,7 @@
>=20=20
>  #include "i915_drv.h"
>  #include "gvt.h"
> +#include "intel_pci_config.h"
>=20=20
>  enum {
>  	INTEL_GVT_PCI_BAR_GTTMMIO =3D 0,
> @@ -353,9 +354,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgp=
u,
>  	memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
>=20=20
>  	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =3D
> -		pci_resource_len(pdev, 0);
> +		pci_resource_len(pdev, GTTMMADR_BAR);
>  	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =3D
> -		pci_resource_len(pdev, 2);
> +		pci_resource_len(pdev, GTT_APERTURE_BAR);
>=20=20
>  	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_pci_config.h b/drivers/gpu/drm/i9=
15/intel_pci_config.h
> index 12cd9d4f23de..4977a524ce6f 100644
> --- a/drivers/gpu/drm/i915/intel_pci_config.h
> +++ b/drivers/gpu/drm/i915/intel_pci_config.h
> @@ -6,6 +6,13 @@
>  #ifndef __INTEL_PCI_CONFIG_H__
>  #define __INTEL_PCI_CONFIG_H__
>=20=20
> +/* PCI BARs */
> +#define GTTMMADR_BAR				0
> +#define GEN2_GTTMMADR_BAR			1
> +#define GFXMEM_BAR				2
> +#define GTT_APERTURE_BAR			GFXMEM_BAR
> +#define GEN12_LMEM_BAR				GFXMEM_BAR
> +
>  /* BSM in include/drm/i915_drm.h */
>=20=20
>  #define MCHBAR_I915				0x44

--=20
Jani Nikula, Intel Open Source Graphics Center
