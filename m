Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03F4CFD7AD
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 12:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C442810E0C9;
	Wed,  7 Jan 2026 11:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQnxUXad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFA810E09B;
 Wed,  7 Jan 2026 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767786585; x=1799322585;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c9dAtQW+NwcoBXMSI3sjPP5VJocRS9bLUFFrxG4570o=;
 b=RQnxUXadsEVTmb7S5F8YBtcOYEwvUePaWU9U+S5y7yAkhBfvedxqf5Th
 v1nDJPza9oVr26SnGsHXR2BxRM86gu+fuwM7lot2hB1x2Vt7KPDK0SmSk
 B7GM5zmGy1Yv2mo/RYOLZEDiA3ynMPNhAlINxFUdNQuZMnGR3ExtAOoQA
 1/+DG0zMfbfhXKjNncxd1s5hLvN/qtU7wiPx4Q5oO9/r4Jywicig/FXaV
 dl/DVP9LaRu4EBeSIo3Mmj5No+c2vZoW1l28/lgJLSD1PWngTSdcza3Gl
 wNNCvGayFvAWualPkzJX/uMKbSTyrtBFfGDLD3FDNR09HP/76cIIZhW3U g==;
X-CSE-ConnectionGUID: hIGQiis0QRypHQVsYsOddQ==
X-CSE-MsgGUID: WzynDgUnTReyLgAoovYllQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69204410"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69204410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 03:49:44 -0800
X-CSE-ConnectionGUID: 1yx4wpkYT++uxIdphJFvAg==
X-CSE-MsgGUID: KJxYPDRJRhSgVAJsqRLT9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202922441"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:49:42 -0800
Date: Wed, 7 Jan 2026 12:49:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH i-g-t 2/3] asahi: Add test infrastruture for asahi DRM
 render driver
Message-ID: <20260107114938.cevehcqjypsdnozh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janne Grunau <j@jannau.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <20260105-asahi-tests-wave1-v1-2-a6c72617e680@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105-asahi-tests-wave1-v1-2-a6c72617e680@jannau.net>
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

Hi Janne,
On 2026-01-05 at 22:03:46 +0100, Janne Grunau wrote:
> Asahi is DRM render-only driver for Apple AGX GPUs found in Apple
> silicon SoCs starting with the Apple M1 family.
> Add a define for the driver, build system support and a helper function
> for DRM_IOCTL_ASAHI_GET_PARAMS. To ensure everything works add an
> initial test for DRM_IOCTL_ASAHI_GET_PARAMS.
> Further tests are expected to require some of the queried parameters.
> 

+cc Alyssa and Jean

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  lib/drmtest.c                  |  1 +
>  lib/drmtest.h                  |  1 +
>  lib/igt_asahi.c                | 44 +++++++++++++++++++++++++++++++++
>  lib/igt_asahi.h                | 12 +++++++++
>  lib/meson.build                |  1 +
>  meson.build                    |  8 ++++++
>  tests/asahi/asahi_get_params.c | 55 ++++++++++++++++++++++++++++++++++++++++++
>  tests/asahi/meson.build        | 13 ++++++++++
>  tests/meson.build              |  2 ++
>  9 files changed, 137 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a59cfd2878d0586b1d7ed9ad0de14a14..dc3fe330bf57693fa4f157cf9076e995e64639cb 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -222,6 +222,7 @@ static const struct module {
>  	void (*modprobe)(const char *name);
>  } modules[] = {
>  	{ DRIVER_AMDGPU, "amdgpu" },
> +	{ DRIVER_ASAHI, "asahi" },
>  	{ DRIVER_INTEL, "i915", modprobe_i915 },
>  	{ DRIVER_MSM, "msm" },
>  	{ DRIVER_PANFROST, "panfrost" },
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729bb89577f61875728bd0d6d2a6458756..74cff27ffd3deba4b7664b4f37fbd59143e04f3e 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -58,6 +58,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_VKMS	(1 << 9)
>  #define DRIVER_VIRTIO	(1 << 10)
>  #define DRIVER_PANTHOR	(1 << 11)
> +#define DRIVER_ASAHI	(1 << 12)
>  
>  /*
>   * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
> diff --git a/lib/igt_asahi.c b/lib/igt_asahi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..90d2c190f0dd05e372af0eefaed22d2b2a26eb71
> --- /dev/null
> +++ b/lib/igt_asahi.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Asahi Linux contributors
> +/*
> + * Based on igt_panthor.c
> + */
> +
> +#include "drmtest.h"
> +#include "igt_asahi.h"
> +#include "ioctl_wrappers.h"
> +#include "asahi_drm.h"

This should be before drmtest.h, keep it alphabetical.

> +
> +#include <stdint.h>

System headers should be first ones, so before asahi_drm.h

> +
> +/**
> + * SECTION:igt_asahi
> + * @short_description: asahi support library
> + * @title: Asahi
> + * @include: igt.h
> + *
> + * This Library provides auxiliary helper functions for writing asahi tests.
> + */
> +
> +/**
> + * igt_asahi_get_params:
> + * @fd: device file descriptor
> + * @param_group: which params to query parameters for
> + * @params: pointer to the struct to store the parameters in
> + * @size: size of the params buffer
> + * @err: expected error code, 0 for success
> + */
> +void igt_asahi_get_params(int fd, uint32_t param_group, void *params, size_t size, int err)
> +{
> +	struct drm_asahi_get_params get_params = {
> +		.param_group = param_group,
> +		.pointer = (uintptr_t)params,
> +		.size = size,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params);
> +}
> diff --git a/lib/igt_asahi.h b/lib/igt_asahi.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f0ac3fbf428a8050957eab0e9b259f68b5ecd0cd
> --- /dev/null
> +++ b/lib/igt_asahi.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: MIT

Here it should be C-style comment:

/* SPDX-License-Identifier: MIT */

> +// SPDX-FileCopyrightText: Copyright (C) 2025 Asahi Linux contributors

Same here, look into lib for pathor lib/igt_panthor.h
Note that it differs from lib/igt_panthor.c

> +
> +#ifndef ASAHI_IOCTL_H

Same here, look into panthor lib header, it should be:

#ifndef IGT_ASAHI_H

> +#define ASAHI_IOCTL_H
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +void igt_asahi_get_params(int fd, uint32_t param_group, void *data, size_t size, int err);
> +
> +#endif /* ASAHI_IOCTL_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index d0487fb3ca79faa40640579ce78efd434eb38f86..73e07ea677ebbffa9722de7c28b6c94bc2a53ee0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -105,6 +105,7 @@ lib_sources = [
>  	'uwildmat/uwildmat.c',
>  	'igt_kmod.c',
>  	'igt_ktap.c',
> +	'igt_asahi.c',
>  	'igt_panfrost.c',
>  	'igt_panthor.c',
>  	'igt_v3d.c',
> diff --git a/meson.build b/meson.build
> index 4b2496c01679852c05c575ab4589192b15da149c..1b16a60281e6202b99affbf43d1ab4e098ea6860 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -286,6 +286,7 @@ includedir = get_option('includedir')
>  libdir = get_option('libdir')
>  libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
> +asahidir = join_paths(libexecdir, 'asahi')
>  msmdir = join_paths(libexecdir, 'msm')
>  panfrostdir = join_paths(libexecdir, 'panfrost')
>  panthordir = join_paths(libexecdir, 'panthor')
> @@ -330,6 +331,12 @@ if get_option('use_rpath')
>  	endforeach
>  	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>  
> +	asahi_rpathdir = '$ORIGIN'
> +	foreach p : asahidir.split('/')
> +		asahi_rpathdir = join_paths(asahi_rpathdir, '..')
> +	endforeach
> +	asahi_rpathdir = join_paths(asahi_rpathdir, libdir)
> +
>  	msm_rpathdir = '$ORIGIN'
>  	foreach p : msmdir.split('/')
>  		msm_rpathdir = join_paths(msm_rpathdir, '..')
> @@ -375,6 +382,7 @@ else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
> +	asahi_rpathdir = ''
>  	msm_rpathdir = ''
>  	panfrost_rpathdir = ''
>  	panthor_rpathdir = ''
> diff --git a/tests/asahi/asahi_get_params.c b/tests/asahi/asahi_get_params.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..43482a00418f854cba2417f8f8eb5c6a04e19385
> --- /dev/null
> +++ b/tests/asahi/asahi_get_params.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) Asahi Linux contributors
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_asahi.h"
> +#include "asahi_drm.h"

Same here, should be before igt.h

> +#include <stdint.h>

Same here, should be first include, before asahi.h

> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver_render(DRIVER_ASAHI);
> +	}
> +
> +	igt_describe("Query global GPU parameters from device.");
> +	igt_subtest("get-params") {
> +		struct drm_asahi_params_global globals = {};
> +
> +		igt_asahi_get_params(fd, 0, &globals, sizeof(globals), 0);

Could you print all params here, before asserts below?

> +
> +		// Supported GPU generations start with G13G

Use C-style comments, here and in all places below:

		/* Supported GPU generations start with G13G */

> +		igt_assert(globals.gpu_generation >= 13);
> +		// chip id is expected to be non zero
> +		igt_assert(globals.chip_id != 0);
> +		// VM should contain some space
> +		igt_assert(globals.vm_end > globals.vm_start);
> +		// the driver is expected to request some space for the
> +		// kernel in a VM
> +		igt_assert(globals.vm_kernel_min_size > 0);
> +		// the frequency of the clock used to generate timestamps
> +		igt_assert(globals.command_timestamp_frequency_hz > 0);
> +	}
> +
> +	igt_describe("Query global GPU parameters for invalid param_groups.");
> +	igt_subtest_group() {
> +		struct drm_asahi_params_global globals = {};
> +
> +		igt_subtest("get-params-1") {

Better name would be invalid-param-1

> +			igt_asahi_get_params(fd, 1, &globals, sizeof(globals), EINVAL);
> +		}
> +		igt_subtest("get-params-2") {

invalid-param-2

> +			igt_asahi_get_params(fd, 2, &globals, sizeof(globals), EINVAL);
> +		}
> +		igt_subtest("get-params-uint32-max") {

invalid-param-uint32-max

Above are minor fixes to do so after you will fix them
imho you could add Alyssa and Neal r-b.

Regards,
Kamil

> +			igt_asahi_get_params(fd, UINT32_MAX, &globals, sizeof(globals), EINVAL);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/asahi/meson.build b/tests/asahi/meson.build
> new file mode 100644
> index 0000000000000000000000000000000000000000..909e146295e83f558ef7378f814ded55adaafe2b
> --- /dev/null
> +++ b/tests/asahi/meson.build
> @@ -0,0 +1,13 @@
> +asahi_progs = [
> +	'asahi_get_params',
> +]
> +
> +foreach prog : asahi_progs
> +	test_executables += executable(prog,
> +				       prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : asahidir,
> +				       install_rpath : asahi_rpathdir,
> +				       install : true)
> +	test_list += join_paths('asahi', prog)
> +endforeach
> diff --git a/tests/meson.build b/tests/meson.build
> index 169340d7d0937020f04b1720d5570619ce0d3591..ba69c56e7f872cb0050f6508d91318e000be6e97 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -491,6 +491,8 @@ endif
>  
>  subdir('amdgpu')
>  
> +subdir('asahi')
> +
>  subdir('msm')
>  
>  subdir('panfrost')
> 
> -- 
> 2.52.0
> 
