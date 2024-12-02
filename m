Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A29E0254
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB9910E717;
	Mon,  2 Dec 2024 12:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJIzLv7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2A010E717;
 Mon,  2 Dec 2024 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733143225; x=1764679225;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EbkjklxLV9aRH6WbgH+eqNnkztayyqfmwQMXH9fI0lg=;
 b=hJIzLv7iZoGqa6dJ29+9NbjPb1UMOE/wAfbnzY+D6jfefXCOp/vbeCAy
 j24Ctgi33CvxddXENG1BKR9+9Zs+xPHEIohVJ3Shd8otsccDii1Ua02gu
 8xr10rxrMWuhnAapLbzBXL3w/PU26MFXRvuK9rKjX5aPSqwsNHhNfsIVI
 LI22oGPVwXc9loQWiAvHqrzZWaf5zVjdk6h1uc5JVJf6s1yP2QodWwcZi
 Ixy62/Vrr5s4OzuAKYWJ6X6+Xva5c4jtb/Ky5G+yaUutsT660JJT0+z9V
 P6cZ8/FQJFsam2amIE1h0rp6wXgUcbqMI/TMN7W3CTje5fJXGXXEkqXxu A==;
X-CSE-ConnectionGUID: 3bLx9wS2ROWM31DoOxBxVw==
X-CSE-MsgGUID: 6Eso1zjgQveVN/6r0wO1bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36171700"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="36171700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:40:25 -0800
X-CSE-ConnectionGUID: 10eVa+taT+ySrMt5s93lZw==
X-CSE-MsgGUID: 3MAjUqObQ128THiKu23OHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93266908"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:40:22 -0800
Message-ID: <e7734771f599c44b30f9883dab4089c1d7081e75.camel@linux.intel.com>
Subject: Re: [PATCH v2 28/29] drm/xe: Add always_migrate_to_vram modparam
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 13:40:20 +0100
In-Reply-To: <20241016032518.539495-29-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-29-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Used to show we can bounce memory multiple times.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_module.c | 7 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_module.h | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A03 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 77ce9f9ca7a5..088f6caea307 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -25,9 +25,16 @@ struct xe_modparam xe_modparam =3D {
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

Ah, this should probably have been in the previous patch?
pow2 could be spelled out "a power of 2"?


> +
> +module_param_named(always_migrate_to_vram,
> xe_modparam.always_migrate_to_vram, bool, 0444);
> +MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> GPU fault");
> +
> =C2=A0module_param_named_unsafe(force_execlist,
> xe_modparam.force_execlist, bool, 0444);
> =C2=A0MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> =C2=A0
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

Kerneldoc

Thanks,
Thomas


> =C2=A0	u32 force_vram_bar_size;
> =C2=A0	int guc_log_level;
> =C2=A0	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 16e34aaead79..bb386f56a189 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -767,6 +767,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
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

