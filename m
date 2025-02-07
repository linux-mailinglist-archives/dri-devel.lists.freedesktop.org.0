Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFFA2C337
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4AB10E164;
	Fri,  7 Feb 2025 13:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQXF/HV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8CF10E164;
 Fri,  7 Feb 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933494; x=1770469494;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HFj0xRGj+BD/PoSLoh0LUJETDPALaiqjx7zeOTGx2U0=;
 b=nQXF/HV5Dg+Eg3nTAp/fnsS9qpTeeyP+lk7ozrsaO5YEozIrQx2vuoZx
 L9DT0Fl0zHTa7Wov/v3EWxcfa4j2MitBOdMrniX5qSmIDs4zag2Z9f9ys
 w3a80CoSnkXcRtid08NTji6VrEMkXQ0+dtNbrx41rKmbIB8kPAF7Y7nMq
 WoFpaCUKI/dgE6NkoMGQFBZgx8dKrEHG4o+UuEBY+ZIoKbSXxB1xvrxlr
 Q42ur9U1ws1K7rh4OX1zL0rZFRbSC9t7wVy2cV9VKCpuY6EsDS466UMRF
 fwxQua9STYSmUPIS61/UN62+KK1i7zPbiZ0C+2BUH34vSoJ+o/I7Xakth A==;
X-CSE-ConnectionGUID: gaRcXkehSiymCX35GUsMiQ==
X-CSE-MsgGUID: YYGzSixVQKm+zVyIxZUbCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="49814692"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="49814692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:04:53 -0800
X-CSE-ConnectionGUID: kz8wYAALQvG2hkoZ+Bap+A==
X-CSE-MsgGUID: baRWpM83TV+/2OQ6hj/MCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111485174"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:04:50 -0800
Message-ID: <59bb51deb61f3fbc54656b189fa2aef1de9806da.camel@linux.intel.com>
Subject: Re: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:04:46 +0100
In-Reply-To: <20250129195212.745731-20-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-20-matthew.brost@intel.com>
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
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device query
> flag,
> which indicates whether the device supports CPU address mirroring.
> The
> intent is for UMDs to use this query to determine if a VM can be set
> up
> with CPU address mirroring. This flag is implemented by checking if
> the
> device supports GPU faults.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_query.c | 5 ++++-
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A02 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c
> b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..40f56eaf98fa 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -333,8 +333,11 @@ static int query_config(struct xe_device *xe,
> struct drm_xe_device_query *query)
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =3D
> =C2=A0		xe->info.devid | (xe->info.revid << 16);
> =C2=A0	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> -		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =3D
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> =C2=A0			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	if (xe->info.has_usm)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> ;
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> =C2=A0		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K
> : SZ_4K;
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe-
> >info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b86dc1b4c2fe..37e54ca6ffe9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
> =C2=A0 *
> =C2=A0 *=C2=A0=C2=A0=C2=A0 - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is=
 set if the
> device
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has usable VRAM
> + *=C2=A0=C2=A0=C2=A0 - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - F=
lag is set
> if the
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device has CPU address mirroring suppor=
t
> =C2=A0 *=C2=A0 - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alig=
nment
> =C2=A0 *=C2=A0=C2=A0=C2=A0 required by this device, typically SZ_4K or SZ=
_64K
> =C2=A0 *=C2=A0 - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
> =C2=A0#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> =C2=A0#define DRM_XE_QUERY_CONFIG_FLAGS			1
> =C2=A0	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1
> << 1)
> =C2=A0#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> =C2=A0#define DRM_XE_QUERY_CONFIG_VA_BITS			3
> =C2=A0#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4

