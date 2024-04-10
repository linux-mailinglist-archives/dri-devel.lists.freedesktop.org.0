Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D089EFBB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377CA10F250;
	Wed, 10 Apr 2024 10:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiQ6auhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7810F250;
 Wed, 10 Apr 2024 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712744401; x=1744280401;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5j8Kkxxlu0P9ggFLywXXcnTpfS0lrwIdrDvDTKICDF8=;
 b=DiQ6auhCNPkXtUaO5uZB8ZO8uCUcoVGD1tVt+poQBQris3rlHKKSibkY
 81pjMcFU6esJz4zOTlID/jlgwNfmQ3r4xway8C80h2ZZ/uELAgp63CKEH
 A0fQSg6UFdVB1KpXT0tvOxYI7wTliBG741W1aRUrKglO87LCxA3Z/OZCb
 7GthzXIAF/YnSA0AFdW8KFeIUCbLwyS6y7As29lhw42SgznaD0V009Yjw
 A0RiQIL/Oann1S1hrI1hXeAtEGO+xw2z04JmvedrtAhybNhpdOf4KhOOn
 mxyEaNNvSUPwkvBfb7D5OktNmFw7UJDgl5cAcLKwkJgRKVds5grmLPx7/ g==;
X-CSE-ConnectionGUID: XD3IESDlSJ6WOZGzt6uBSQ==
X-CSE-MsgGUID: VMhZJl03QzGS4FDU3uEgFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30580113"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="30580113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:20:00 -0700
X-CSE-ConnectionGUID: C2BmkW0QTA+7mM84We1YEg==
X-CSE-MsgGUID: qho6YzTgTrOpYG6abRqlRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20586786"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:19:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Apr 2024 13:19:51 +0300 (EEST)
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 06/10] drm: move i915_drm.h under include/drm/intel
In-Reply-To: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
Message-ID: <c60a185e-2bc5-10b4-3770-adf811763ace@linux.intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-116869297-1712744391=:1963"
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

--8323328-116869297-1712744391=:1963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Apr 2024, Jani Nikula wrote:

> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
>=20
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  arch/x86/kernel/early-quirks.c             | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c        | 2 +-
>  drivers/gpu/drm/i915/soc/intel_gmch.c      | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
>  drivers/platform/x86/intel_ips.c           | 2 +-
>  include/drm/{ =3D> intel}/i915_drm.h         | 0
>  8 files changed, 7 insertions(+), 7 deletions(-)
>  rename include/drm/{ =3D> intel}/i915_drm.h (100%)
>=20
> diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirk=
s.c
> index 59f4aefc6bc1..5b867c02d2b5 100644
> --- a/arch/x86/kernel/early-quirks.c
> +++ b/arch/x86/kernel/early-quirks.c
> @@ -17,7 +17,7 @@
>  #include <linux/bcma/bcma.h>
>  #include <linux/bcma/bcma_regs.h>
>  #include <linux/platform_data/x86/apple.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
>  #include <drm/i915_pciids.h>
>  #include <asm/pci-direct.h>
>  #include <asm/dma.h>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm=
/i915/gem/i915_gem_stolen.c
> index ad6dd7f3259b..30595b2b63e1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -8,7 +8,7 @@
>  #include <linux/mutex.h>
> =20
>  #include <drm/drm_mm.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
> =20
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 2717699c6591..206a5e0fedf1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -9,7 +9,7 @@
>  #include <linux/stop_machine.h>
> =20
>  #include <drm/drm_managed.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
>  #include <drm/intel/intel-gtt.h>
> =20
>  #include "display/intel_display.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/g=
t/intel_rps.c
> index c9cb2a391942..70176be269d3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -5,7 +5,7 @@
> =20
>  #include <linux/string_helpers.h>
> =20
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
> =20
>  #include "display/intel_display.h"
>  #include "display/intel_display_irq.h"
> diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915=
/soc/intel_gmch.c
> index 40874ebfb64c..734e9f2801ea 100644
> --- a/drivers/gpu/drm/i915/soc/intel_gmch.c
> +++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
> @@ -8,7 +8,7 @@
>  #include <linux/vgaarb.h>
> =20
>  #include <drm/drm_managed.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
> =20
>  #include "i915_drv.h"
>  #include "intel_gmch.h"
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ff2239c0eda5..7af1a48f3b59 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -9,7 +9,7 @@
>  #include <linux/sizes.h>
> =20
>  #include <drm/drm_managed.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
> =20
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/inte=
l_ips.c
> index ba38649cc142..2a88012958eb 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -59,7 +59,7 @@
>  #include <linux/tick.h>
>  #include <linux/timer.h>
>  #include <linux/dmi.h>
> -#include <drm/i915_drm.h>
> +#include <drm/intel/i915_drm.h>
>  #include <asm/msr.h>
>  #include <asm/processor.h>
>  #include "intel_ips.h"
> diff --git a/include/drm/i915_drm.h b/include/drm/intel/i915_drm.h
> similarity index 100%
> rename from include/drm/i915_drm.h
> rename to include/drm/intel/i915_drm.h

Could you please also address the comment in=20
drivers/gpu/drm/i915/intel_pci_config.h.

--=20
 i.

--8323328-116869297-1712744391=:1963--
