Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1FA2C427
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1408210EAC9;
	Fri,  7 Feb 2025 13:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMecvllU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7810EAC9;
 Fri,  7 Feb 2025 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738936490; x=1770472490;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zwQ7efj4QEdk0qKCIrUoo1yDRn9dYKViwCt83mnvyyc=;
 b=eMecvllUt36ZsNymPbBqda3CZyc7s/y1RaNusJm71XDYoswf68A45Pch
 MgCqDzWX8IwHgPa3bFJugrL5an5L34sWX6EBwDH1/ifhXc4A1HroHlufw
 JG9oy+iNVtywA13CWhcR1SV64bl4ZJMX/sRrf8tOaf5KjKVVQDTHrjkcp
 JJjmfxOTL4FDpnNqAFGeQQ2FYo2mYByfWpPjgiA6lwbaU4S6xIxT20/Ym
 E0ca6DAMq9bmzsK62gHnjtLoxaTgtY4SoHuJWaqMNOZEj8ThPg+9f9OqL
 ZpuHSUlptl/4jxh7CXgUfQuB3img9T/lPdSJ/nh4/u3X4mT9okRsP7+iy g==;
X-CSE-ConnectionGUID: 3+zhYuVbTA26BjyN/UTloQ==
X-CSE-MsgGUID: 1bM4ULY7S26Dg+8fCgt8lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57113852"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="57113852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:54:50 -0800
X-CSE-ConnectionGUID: OJeCMkKxREOi9MU/SVSokQ==
X-CSE-MsgGUID: 8Y+5IKX5QymhEnoHHhVx2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116140258"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:54:47 -0800
Message-ID: <d61011585df26476a5dba725ec1044e5d74bd928.camel@linux.intel.com>
Subject: Re: [PATCH v4 27/33] drm/xe: Add BO flags required for SVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:54:45 +0100
In-Reply-To: <20250129195212.745731-28-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-28-matthew.brost@intel.com>
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
> Add XE_BO_FLAG_CPU_ADDR_MIRROR to indicate BO is tied to SVM range.
> While these BO's are kernel allocations, we need a VM reference in
> this
> case which this flag indicates. In addition, we do not support CCS on
> these BO's either. The later can be revisited later.
>=20
> v2:
> =C2=A0- Take VM ref for system allocator BOs
> v3:
> =C2=A0- s/XE_BO_FLAG_SYSTEM_ALLOC/XE_BO_FLAG_CPU_ADDR_MIRROR (Thomas)
> =C2=A0- Better commit message (Thomas)
> =C2=A0- Drop XE_BO_FLAG_SKIP_CLEAR for now
> =C2=A0- Add comment about possibly supporting CCS (Thomas)
> v4:
> =C2=A0- Fix alignment issue (Checkpatch)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I was wondering, since the bo might as well be an external bo and
benefit from finer resv granularity on eviction, (multi-device actually
uses this), can't we drop the bo->vm reference? And, assuming tile is
not needed either (is it)? Can we skip the flag altogether?

/Thomas

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_bo.h |=C2=A0 1 +
> =C2=A02 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e914a60b8afc..20c96709e267 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1239,7 +1239,7 @@ static void xe_ttm_bo_destroy(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0		xe_drm_client_remove_bo(bo);
> =C2=A0#endif
> =C2=A0
> -	if (bo->vm && xe_bo_is_user(bo))
> +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags &
> XE_BO_FLAG_CPU_ADDR_MIRROR))
> =C2=A0		xe_vm_put(bo->vm);
> =C2=A0
> =C2=A0	mutex_lock(&xe->mem_access.vram_userfault.lock);
> @@ -1435,7 +1435,8 @@ struct xe_bo *___xe_bo_create_locked(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0	int err;
> =C2=A0
> =C2=A0	/* Only kernel objects should set GT */
> -	xe_assert(xe, !tile || type =3D=3D ttm_bo_type_kernel);
> +	xe_assert(xe, !tile || type =3D=3D ttm_bo_type_kernel ||
> +		=C2=A0 flags & XE_BO_FLAG_CPU_ADDR_MIRROR);
> =C2=A0
> =C2=A0	if (XE_WARN_ON(!size)) {
> =C2=A0		xe_bo_free(bo);
> @@ -1631,7 +1632,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> =C2=A0	 * by having all the vm's bo refereferences released at vm
> close
> =C2=A0	 * time.
> =C2=A0	 */
> -	if (vm && xe_bo_is_user(bo))
> +	if (vm && (xe_bo_is_user(bo) || bo->flags &
> XE_BO_FLAG_CPU_ADDR_MIRROR))
> =C2=A0		xe_vm_get(vm);
> =C2=A0	bo->vm =3D vm;
> =C2=A0
> @@ -2503,8 +2504,11 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> =C2=A0	 * system memory (i.e., it allows XE_PL_TT placement),
> FlatCCS
> =C2=A0	 * can't be used since there's no CCS storage associated
> with
> =C2=A0	 * non-VRAM addresses.
> +	 *
> +	 * XXX: Can we support CCS with CPU address mirroring?
> =C2=A0	 */
> -	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
> +	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
> +			=C2=A0=C2=A0=C2=A0 (bo->flags &
> XE_BO_FLAG_CPU_ADDR_MIRROR)))
> =C2=A0		return false;
> =C2=A0
> =C2=A0	return true;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index ce55a2bb13f6..c01ed535a8c3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -47,6 +47,7 @@
> =C2=A0					 XE_BO_FLAG_GGTT1 | \
> =C2=A0					 XE_BO_FLAG_GGTT2 | \
> =C2=A0					 XE_BO_FLAG_GGTT3)
> +#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
> =C2=A0
> =C2=A0/* this one is trigger internally only */
> =C2=A0#define XE_BO_FLAG_INTERNAL_TEST	BIT(30)

