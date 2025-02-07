Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20250A2C63B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F90E10EB2B;
	Fri,  7 Feb 2025 14:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aboS/FEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29B810E27D;
 Fri,  7 Feb 2025 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738939825; x=1770475825;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZzuOBlQKIfQ0IymbSf+zTHUFlIAPC5vY6dh0Iu43Og8=;
 b=aboS/FEwXAx4SzrOaqDcPNDc2HvOnFKiC3wXmaa1utR2aId+DWXDPwFF
 KSR6QkHRTE4QBkeIBwT/dXrjEOGgaLoaUHUDUZRRfqxquAb4dJPcqb+YP
 RXmUNxljdgnaZKsrMIYfEF1OXfLIC3koyct/vpZEPDuHLDqmUtFWTbD8q
 oSEeoRhyysfmzhkcdITQiI/NxdYKbSq7v62C8chudFqOb4WDnPRO4nvQY
 TlZsR8zRcUHceRyUr3syBvz8iT4bENUd/yTBfQuU6OXwuWFXNTdN7H/1e
 nspSHcDx6uoqvJq4bW44PaSKJPjNp299hCZLRE1P6jOzG8M5X7loZoAz3 Q==;
X-CSE-ConnectionGUID: JNAmE3nASIyyCAJ3QlNPjA==
X-CSE-MsgGUID: /Vc5lln3RxSTHRt19Dmh0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39488054"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39488054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:50:25 -0800
X-CSE-ConnectionGUID: VBBfoUJPQbm/F7iAbgsRwQ==
X-CSE-MsgGUID: u6N9ddfZQIyAq9KByJ2Pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148751172"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:50:23 -0800
Message-ID: <ea703af1eaad0b5c51c09c988d23d73eb3852ec6.camel@linux.intel.com>
Subject: Re: [PATCH v4 32/33] drm/xe: Add always_migrate_to_vram modparam
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 15:50:19 +0100
In-Reply-To: <20250129195212.745731-33-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-33-matthew.brost@intel.com>
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
> Used to show we can bounce memory multiple times which will happen
> once
> a real migration policy is implemented. Can be removed once migration
> policy is implemented.
>=20
> v3:
> =C2=A0- Pull some changes into the previous patch (Thomas)
> =C2=A0- Spell out power of 2 (Thomas)
> =C2=A0- Better commit message (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_module.c | 5 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_module.h | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A03 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 2126e99ede01..192047b3419b 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -30,7 +30,10 @@ struct xe_modparam xe_modparam =3D {
> =C2=A0};
> =C2=A0
> =C2=A0module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size=
,
> uint, 0600);
> -MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> MiB), must be pow2");
> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> MiB), must be power of 2");
> +

This should've really been in previous patch?

With that fixed,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> +module_param_named(always_migrate_to_vram,
> xe_modparam.always_migrate_to_vram, bool, 0444);
> +MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> GPU fault");
> =C2=A0
> =C2=A0module_param_named_unsafe(force_execlist,
> xe_modparam.force_execlist, bool, 0444);
> =C2=A0MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..84339e509c80 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,6 +12,7 @@
> =C2=A0struct xe_modparam {
> =C2=A0	bool force_execlist;
> =C2=A0	bool probe_display;
> +	bool always_migrate_to_vram;
> =C2=A0	u32 force_vram_bar_size;
> =C2=A0	int guc_log_level;
> =C2=A0	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index f291b2eb2073..a96b0afc0e31 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -821,6 +821,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	}
> =C2=A0	drm_exec_fini(&exec);
> =C2=A0
> +	if (xe_modparam.always_migrate_to_vram)
> +		range->migrated =3D false;
> +
> =C2=A0	dma_fence_wait(fence, false);
> =C2=A0	dma_fence_put(fence);
> =C2=A0

