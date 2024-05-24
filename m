Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202168CE7E0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2B810ECD1;
	Fri, 24 May 2024 15:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bavy2jpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F210EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716564554; x=1748100554;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q73g5/42kd2HqWksPbm9PKQu+I42W/JxBi3yiobWeaQ=;
 b=bavy2jpR+OJ3v8HRUspo4mY+5rxQutMGMJqJiEiJ8C5VfgfsxMjzGmSH
 D3uxCo229XpkinVtnQpk6fFrZpKnda65XbSE3j2Y+Mk7s02+66HYsmgQs
 C+kbzK4mL5c4tn6y/jBCKSy8BzEyTjjeVFilxoNwzg0XR4nhhX0HvLm6h
 7QsyrU/n8vtUAqANEHUs7lnBMllAHGZtOIQ8+B7PpkuMt8PqN76JEXYi0
 VJhFPKa73mX3/JMRlyFWXpDxQa+PN5QdAkOdRk1n3jASsebHCbhlMCUj0
 Zzl+QFTpUhfJsELQcB91+BC/pszQbXREkAZZiS2cx72QLso4sO2fHmacO Q==;
X-CSE-ConnectionGUID: ZwM2I0iYSu6IQxO+T4Qbvg==
X-CSE-MsgGUID: Nef93r0PSJy6jzTVmPH9Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16776231"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="16776231"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 08:29:12 -0700
X-CSE-ConnectionGUID: 1L0nLEveQy+p+ebcNunsKw==
X-CSE-MsgGUID: LhIH86XcQLi1viVBB0Y+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34550797"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 08:29:10 -0700
Message-ID: <1baa830a0da16d80b163e11cd9ab6cd9d745cfca.camel@linux.intel.com>
Subject: Re: [PATCH v12 10/10] drm/ttm/tests: Add TODO file
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Fri, 24 May 2024 17:29:06 +0200
In-Reply-To: <251d347fa39ec123d4985481df8a4f7613ea8e02.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <251d347fa39ec123d4985481df8a4f7613ea8e02.1715767062.git.karolina.stolarek@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-05-15 at 13:24 +0200, Karolina Stolarek wrote:
> List improvements for the test suite with some notes.
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/ttm/tests/TODO | 25 +++++++++++++++++++++++++
> =C2=A01 file changed, 25 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/ttm/tests/TODO
>=20
> diff --git a/drivers/gpu/drm/ttm/tests/TODO
> b/drivers/gpu/drm/ttm/tests/TODO
> new file mode 100644
> index 000000000000..b48d83b6166e
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/TODO
> @@ -0,0 +1,25 @@
> +TODO
> +=3D=3D=3D=3D=3D
> +
> +- Add a test case where the only evictable BO is busy
> +- Update eviction tests so they use parametrized "from" memory type
> +- Improve mock manager's implementation, e.g. allocate a block of
> +=C2=A0 dummy memory that can be used when testing page mapping functions
> +- Suggestion: Add test cases with external BOs
> +- Suggestion: randomize the number and size of tested buffers in
> +=C2=A0 ttm_bo_validate()
> +- Agree on the naming convention
> +
> +Notes and gotchas
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- These tests are built and run with a UML kernel, because
> +=C2=A0 1) We are interested in hardware-independent testing
> +=C2=A0 2) We don't want to have actual DRM devices interacting with TTM
> +=C2=A0=C2=A0=C2=A0=C2=A0 at the same time as the test one. Getting these=
 to work in
> +=C2=A0=C2=A0=C2=A0=C2=A0 parallel would require some time (...and that's=
 a "todo" in
> itself!)
> +- Triggering ttm_bo_vm_ops callbacks from KUnit (i.e. kernel) might
> be
> +=C2=A0 a challenge, but is worth trying. Look at selftests like
> +=C2=A0 i915/gem/selftests/i915_gem_mman.c for inspiration
> +- The test suite uses UML where ioremap() call returns NULL, meaning
> that
> +=C2=A0 ttm_bo_ioremap() can't be tested, unless we find a way to stub it

