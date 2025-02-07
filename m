Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4EA2C638
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4256B10E287;
	Fri,  7 Feb 2025 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSwygug5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC910E1B4;
 Fri,  7 Feb 2025 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738939715; x=1770475715;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zRS6WCmMjM2mi/cD4Po7JAn1AaTfTLzgOVxBK8YtikA=;
 b=LSwygug5XvwLCSVs3Z86a3IwkYp3c5n/QzBvXjassCMl1a8jzwOVZKT2
 w2RewmtUUD6zQkdf+DgAT4Ed3jV4Bm0p9D3GRAtiKD+n0BAXSc0Obsy7U
 DgRbebga06EQTRucthSCsN1mHhd4RildWQ+R83N+LFKEnNzh3bkFzCepm
 qw3WB7Jm6FuiOyPedescLkOLnAcWr92i8kfHy5vFpLrL88BzBLsLGHLQD
 WbzgTMhOJvVzqXQxC+595QXayBNAAWZEtl+2DB8/rAPLYnLJQCTRTMpIa
 jjAsGniPuWxQOhPS0IAqNVgTiGBA7lG2Ur2whCt432ARydDkUVzom9zGr g==;
X-CSE-ConnectionGUID: jeiF46EhQOeh/NmXzJPlwQ==
X-CSE-MsgGUID: 8cgY5MtpT46+Zb/TF5MOIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39487876"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39487876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:48:34 -0800
X-CSE-ConnectionGUID: kt3wGmgjRQG1brrQBycceg==
X-CSE-MsgGUID: gX+GwsCBS5W7dqYtp+NerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148751058"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:48:33 -0800
Message-ID: <8d1216e27755586f2f1dad81eb0bf9eced4202ea.camel@linux.intel.com>
Subject: Re: [PATCH v4 31/33] drm/xe: Add modparam for SVM notifier size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 15:48:29 +0100
In-Reply-To: <20250129195212.745731-32-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-32-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> Useful to experiment with notifier size and how it affects
> performance.
>=20
> v3:
> =C2=A0- Pull missing changes including in following patch (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_module.c | 4 ++++
> =C2=A0drivers/gpu/drm/xe/xe_module.h | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A03 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 0f2c20e9204a..2126e99ede01 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -25,9 +25,13 @@ struct xe_modparam xe_modparam =3D {
> =C2=A0	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> =C2=A0#endif
> =C2=A0	.wedged_mode =3D 1,
> +	.svm_notifier_size =3D 512,
> =C2=A0	/* the rest are 0 by default */
> =C2=A0};
> =C2=A0
> +module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size,
> uint, 0600);
> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> MiB), must be pow2");
> +
> =C2=A0module_param_named_unsafe(force_execlist,
> xe_modparam.force_execlist, bool, 0444);
> =C2=A0MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 161a5e6f717f..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -22,6 +22,7 @@ struct xe_modparam {
> =C2=A0	unsigned int max_vfs;
> =C2=A0#endif
> =C2=A0	int wedged_mode;
> +	u32 svm_notifier_size;
> =C2=A0};
> =C2=A0
> =C2=A0extern struct xe_modparam xe_modparam;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 0df924ca8ed1..f291b2eb2073 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -6,6 +6,7 @@
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> =C2=A0#include "xe_migrate.h"
> +#include "xe_module.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> @@ -596,7 +597,8 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0
> =C2=A0	err =3D drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, xe_svm_devm_owner(vm=
-
> >xe), 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size, SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size,
> xe_modparam.svm_notifier_size * SZ_1M,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_ops, fault_chunk_sizes,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_sizes));
> =C2=A0	if (err)
> =C2=A0		return err;

