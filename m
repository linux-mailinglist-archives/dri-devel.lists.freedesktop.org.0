Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA939903CEC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F1910E57B;
	Tue, 11 Jun 2024 13:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHP9YrFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268A510E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718111857; x=1749647857;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hu2T9TCTTvhR8GVADdOwJLXJU/7SA3TZfiGHGN6aXQk=;
 b=oHP9YrFQy/Vd2LJCtJPqOIqg2l83HnDzUZI3wcBUwQDYrcgXW90FygCJ
 QLiJeIp3IASR2kUPP7wYSUu4/UfePOJqUeltP7TImQ21BRzolt8/fcuvs
 06JTrTGKgS1eoy6VC2cbrBNO1VS3dnM6U4CBklz9/EcntxQJUKCs2ATXv
 8U7tUL/IeGBFw7V9gGShLrUIy/mN3vbp6lmCQesbq4PWvKJe0krQIJKJE
 4RsCTvcRCaIoV41VggvNqAJvW2ustxzqxUPJl3RXz/5jmh94Azb8Q87Zg
 oKYImnJ/fhl7TF1eJQUmT5LbF2AGh9wD0vqgenpwP0/lvNDCBipM+jf18 g==;
X-CSE-ConnectionGUID: 3cxDEyX9Tq2S3E7sjZ83QQ==
X-CSE-MsgGUID: Oi+tHm0dSgGTDKeGNgzHsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26222577"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26222577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:17:37 -0700
X-CSE-ConnectionGUID: yn/O9L5cRgC4HDnOpVDpsQ==
X-CSE-MsgGUID: VZ8jyO6LQkOUEQnFrI+Emw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="62593176"
Received: from unknown (HELO [10.245.245.125]) ([10.245.245.125])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:17:33 -0700
Message-ID: <3c74440727241bf832e4035649f1523fbfc0d58f.camel@linux.intel.com>
Subject: Re: [PATCH v13 11/12] drm/ttm/tests: Correct modules' licenses
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Tue, 11 Jun 2024 15:17:33 +0200
In-Reply-To: <8b17b6bbbf298e692fd99906b3a01da27cb90b44.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
 <8b17b6bbbf298e692fd99906b3a01da27cb90b44.1717420597.git.karolina.stolarek@intel.com>
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

On Mon, 2024-06-03 at 15:36 +0200, Karolina Stolarek wrote:
> The test files are GPL and MIT, so update the definitions
> accordingly.
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_device_test.c=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_pool_test.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_tt_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A06 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index ffcfe5e6709a..b53483ce3570 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -627,4 +627,4 @@ static struct kunit_suite ttm_bo_test_suite =3D {
> =C2=A0
> =C2=A0kunit_test_suites(&ttm_bo_test_suite);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> index 19eaff22e6ae..0f235a834ede 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -209,4 +209,4 @@ static struct kunit_suite ttm_device_test_suite =3D
> {
> =C2=A0
> =C2=A0kunit_test_suites(&ttm_device_test_suite);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index b6ea64488c77..48ab541f821f 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -308,4 +308,4 @@ void ttm_test_devices_fini(struct kunit *test)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 4643f91c6bd5..9070ca43df53 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -433,4 +433,4 @@ static struct kunit_suite ttm_pool_test_suite =3D {
> =C2=A0
> =C2=A0kunit_test_suites(&ttm_pool_test_suite);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index 67584058dadb..b90523422d24 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -332,4 +332,4 @@ static struct kunit_suite ttm_resource_test_suite
> =3D {
> =C2=A0
> =C2=A0kunit_test_suites(&ttm_resource_test_suite);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index a9d75a33acaf..dd9bac7cb7b0 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -398,4 +398,4 @@ static struct kunit_suite ttm_tt_test_suite =3D {
> =C2=A0
> =C2=A0kunit_test_suites(&ttm_tt_test_suite);
> =C2=A0
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL and additional rights");

