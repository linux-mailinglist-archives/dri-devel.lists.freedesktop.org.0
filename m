Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634994AFCE7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 20:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDD810E593;
	Wed,  9 Feb 2022 19:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768C10E5A1;
 Wed,  9 Feb 2022 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644433717; x=1675969717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rmwT6mNxAEosXnOZ/cm0T+NuPb0cpnr/FxDffj7cBF0=;
 b=m1N0cgUxxAFFvO6hGm5kWU6j5YjosOZCDk+TWFP4kKMIoYtIafd5U/wS
 KcALmrhanwcebXcksGfOAmS7ZUjilOcf9vOySKl0MYAkIj+g9YT5EP6JV
 /IC/nL675kH5MK2tt+KKu1QhP8dg6CY++F1ghqkAgVhmmu+UO9YxV4v+f
 J+JprBNSjC/nr2SFF+6tHKStI60yA4uiSf3ZxE17FgAP3z+FDP1P9xuTw
 t0Ju71YUBYaVKqBPz7K7XAVc6DcCavY/U9Rvyuj2IBUyv36cDI5LLj+7d
 xU4SJ39R9+8rg8OMUmNrPH9B02rK0MUWZ14JUz2Ft8iLNPbu5THK4DOTD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249518500"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="249518500"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 11:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="500091880"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 09 Feb 2022 11:08:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:08:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:08:35 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.020;
 Wed, 9 Feb 2022 11:08:35 -0800
From: "Bloomfield, Jon" <jon.bloomfield@intel.com>
To: "Justen, Jordan L" <jordan.l.justen@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 0/4] GuC HWCONFIG with documentation
Thread-Topic: [Intel-gfx] [PATCH v3 0/4] GuC HWCONFIG with documentation
Thread-Index: AQHYHS+aVmlIyLObGUSXDrJRQV1ARqyLlJfg
Date: Wed, 9 Feb 2022 19:08:08 +0000
Deferred-Delivery: Wed, 9 Feb 2022 19:07:17 +0000
Message-ID: <e4b8110bbd2c486ca1fd9bbdd321048b@intel.com>
References: <20220208210503.869491-1-jordan.l.justen@intel.com>
In-Reply-To: <20220208210503.869491-1-jordan.l.justen@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Jordan Justen
> Sent: Tuesday, February 8, 2022 1:05 PM
> To: intel-gfx <intel-gfx@lists.freedesktop.org>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Subject: [Intel-gfx] [PATCH v3 0/4] GuC HWCONFIG with documentation
>=20
> This is John/Rodrigo's 2 patches with some minor changes, and I added
> 2 patches.
>=20
> "drm/i915/uapi: Add query for hwconfig blob" was changed:
>=20
>  * Rename DRM_I915_QUERY_HWCONFIG_TABLE to
> DRM_I915_QUERY_HWCONFIG_BLOB
>    as requested by Joonas.
>=20
>  * Reword commit message
>=20
>  * I added Acked-by to this patch, but this only applies in the
>    context of this version of the patchset. If my changes are
>    rejected, then please *do not* add my Acked-by to the other series.
>=20
>    In particular, I do not want my Acked-by on the patch if the patch
>    mentions the HWCONFIG format, but is not willing to add that to the
>    actual uAPI.
>=20
>    I also do not want my Acked-by on it if it mentions "consolidation"
>    of this data. Since we are dealing with open source projects (aside
>    from GuC), this doesn't seem appropriate.
>=20
> "drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item" adds a
> struct to the uAPI and documents the return value for
> DRM_I915_QUERY_HWCONFIG_BLOB. (Except, keys / values are still
> deferred to the PRM.)
>=20
> "drm/i915/guc: Verify hwconfig blob matches supported format" does the
> simple verification of the blob to make sure it matches what the uAPI
> documents.
>=20
> v2:
>  * Fix -Werror errors.
>  * Rebase to drm-intel/for-linux-next instead of
>    drm-intel/for-linux-next-gt, as this seems to be what CI wants.
>  * Fix u32 -> __u32. (Sorry, I was first testing in Mesa tree.)
>  * Add commit message for "Verify hwconfig blob" patch as requested by
>    Tvrtko.
>  * Reword text added to i915_drm.h as requested by Tvrtko. (Attempting
>    to indicate the overall blob ends right at the last blob item.)
>=20
> v3:
>  * Add several changes suggested by Tvrtko in the "Verify hwconfig
>    blob", along with some tweaks to i915_drm.h from the feedback for
>    the same patch.
>=20
> John Harrison (1):
>   drm/i915/guc: Add fetch of hwconfig table
>=20
> Jordan Justen (2):
>   drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item
>   drm/i915/guc: Verify hwconfig blob matches supported format
>=20
> Rodrigo Vivi (1):
>   drm/i915/uapi: Add query for hwconfig blob
>=20
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 201 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 ++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
>  drivers/gpu/drm/i915/i915_query.c             |  23 ++
>  include/uapi/drm/i915_drm.h                   |  33 +++
>  9 files changed, 291 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
>=20
> --
> 2.34.1

