Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF03A2C32F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F4892F2;
	Fri,  7 Feb 2025 13:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnayLm0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411E1892F2;
 Fri,  7 Feb 2025 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933373; x=1770469373;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QrCxGbA5XnBZA4e3Bd8itW3yhVcSW2vLdmPno7kOUBE=;
 b=hnayLm0GrS9kp3ag2fzhHysx/wAtmcfgOTorDwki/kLLmRxwxYfhmhUP
 CFaFWvEaK+X5E9/WMbjAfMU2jtH2CggIBO9eIUIknppxYbjWRsggq+ymh
 Omiv2NyQ41ptuvvQeBkCGzpoR2sZdexnOB1xjd9hAXSwpe2sIssDlQP+c
 igCYQrS/mnp0lD4J5f/9f+VZoi5pAdddYhcjV4l9msPIPp9yXFC6oRJGp
 l1eE6NfB5u69+LBcY8HRqL0yIdxX6R65ivSKlMUSPfy+yZZ2CqoYvC4n2
 k164lbcBfv52CpIHuNEWeUuT1qgxnH9qAwEAKB6pxR7W5Pm3jLwjDlrT8 Q==;
X-CSE-ConnectionGUID: D9AxNfj4RX221i6PFmT3/A==
X-CSE-MsgGUID: y408S29hTGWc3HCtuaMoWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50554398"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="50554398"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:02:53 -0800
X-CSE-ConnectionGUID: R42BYW6kSgK5R7ld9B4PaQ==
X-CSE-MsgGUID: 4IoXNJjlTmupGCOQu7zS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142393415"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:02:50 -0800
Message-ID: <4fedc3b10e30134edbbf930e7cde18a29c97202e.camel@linux.intel.com>
Subject: Re: [PATCH v4 18/33] drm/xe: Enable CPU address mirror uAPI
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:02:47 +0100
In-Reply-To: <20250129195212.745731-19-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-19-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Support for CPU address mirror bindings in SRAM fully in place,
> enable the
> implementation.
>=20
> v3:
> =C2=A0- s/system allocator/CPU address mirror (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0 |=C2=A0 6 ------
> =C2=A02 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 56ece53b2069..ee150139470f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -429,6 +429,16 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_svm_has_mapping() - SVM has mappings
> + * @vm: The VM.
> + * @start: Start address.
> + * @end: End address.
> + *
> + * Check if an address range has SVM mappings.
> + *
> + * Return: True is address range has a SVM mapping, False otherwise
> + */
> =C2=A0bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)

Ah, the kerneldoc here should probably go in the previous patch.

/Thomas


> =C2=A0{
> =C2=A0	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d8c78ecd54ec..3ac03e0dc41b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3020,12 +3020,6 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe, struct xe_vm *vm,
> =C2=A0		u16 pat_index =3D (*bind_ops)[i].pat_index;
> =C2=A0		u16 coh_mode;
> =C2=A0
> -		/* FIXME: Disabling CPU address mirror for now */
> -		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
> -			err =3D -EOPNOTSUPP;
> -			goto free_bind_ops;
> -		}
> -
> =C2=A0		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
> =C2=A0				 !xe_vm_in_fault_mode(vm))) {
> =C2=A0			err =3D -EINVAL;

