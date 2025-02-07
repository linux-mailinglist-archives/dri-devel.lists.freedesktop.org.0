Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A265A2BF62
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 10:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA7310EA87;
	Fri,  7 Feb 2025 09:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feDBcuEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488DD10EA87;
 Fri,  7 Feb 2025 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738920653; x=1770456653;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3Es7hVZae1SzcWNkogIQE+cEl9xUcgIWmgHuwXkAJ0U=;
 b=feDBcuEAfAI9VILksaZnvPpZV6dFpymfP4f43d+fhAWoNdddc9//qaQ/
 N59ZOOX12tyaA21UJxaoSruEyra7w0vJyU4wV/2ZTKYvOHE/cE3Rqhe5U
 9B9I+fbvTeCIDH7shsaBJJBPlyXdQtDaLhPswFF95N/0wDzEzWa05+F7r
 keF2Aimbj9vkgqTKMQLxbujYNPA2pCdSZBGs5LlhLT9X5k5dCJ4DanK1V
 P0lDjrK/jI/Vf+6SHiLmRiwa6VVQVyJwv+Fvxod9XqrU3ldWlXzANTMR3
 UwsPv4XdjgirJ/6Qc/MEFbd5o1DhJQs4BEFLYK6b5ZGS7XlGWzeAJjiG9 w==;
X-CSE-ConnectionGUID: 9okjp4s6SfWRIHDF5jOwLw==
X-CSE-MsgGUID: 6ox4kCD/QDuhkl8ADr7mig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57092915"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="57092915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:30:53 -0800
X-CSE-ConnectionGUID: 6HP3vtaeQuCk65k3YX7dmw==
X-CSE-MsgGUID: IuQziQ9XQCWwqZmdXHHhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115565962"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:30:51 -0800
Message-ID: <29d5890ff3cb556f3185c78a755595ed0e6eba7b.camel@linux.intel.com>
Subject: Re: [PATCH v4 07/33] drm/xe: Select DRM_GPUSVM Kconfig
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 10:30:47 +0100
In-Reply-To: <20250129195212.745731-8-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-8-matthew.brost@intel.com>
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
> Xe depends on DRM_GPUSVM for SVM implementation, select it in
> Kconfig.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 99219c16e8aa..60b922f75001 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -39,6 +39,7 @@ config DRM_XE
> =C2=A0	select DRM_TTM_HELPER
> =C2=A0	select DRM_EXEC
> =C2=A0	select DRM_GPUVM
> +	select DRM_GPUSVM
> =C2=A0	select DRM_SCHED
> =C2=A0	select MMU_NOTIFIER
> =C2=A0	select WANT_DEV_COREDUMP

