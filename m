Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E725CFDA68
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8CA10E5A1;
	Wed,  7 Jan 2026 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfJE5rnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A16510E5A1;
 Wed,  7 Jan 2026 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767788804; x=1799324804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8EmLPceCL4w7w3/zyXpDecKjo9S4Jq/4g20J/0v0TmU=;
 b=MfJE5rnVgi0Qg7oZAFBW4Vw1kA8/x6BsC5ssWOgUjk7FMNdgAefndSqw
 S4Y7HeIQ6muKxObsv0eNwGQhXtZ1rCtkQoUdvZQhfrvx75Ma2dISQ7mJI
 V6bILEHP+OLe70ArHdq4SlSAgLj8hiG+RD3YbFawE8JK5GIvel8XPtzOS
 /aiACUTiK10OVyao2R//Efa9x24ej0VsWNnSjOshbgw3Cc54Q4CsCRCrb
 8pSe3cZpvFAuBce9UgFPsqgX6pck78pvzEcNzd4pNpt/YlKMp+/WDIQqQ
 e3vfUqF2cAX+J65ZkH6/4LEC7Y7inhjmUNEH+hPQ3QCS6Wfh/Ve8JIoBP w==;
X-CSE-ConnectionGUID: TCmvt0HiS8OhgEKT0bC0Ew==
X-CSE-MsgGUID: u+THEJM0Tumc/fR+F2sQcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69231521"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69231521"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 04:26:43 -0800
X-CSE-ConnectionGUID: 6rybUvc6QLqFpf9YFPT7lA==
X-CSE-MsgGUID: 5TR7/CppQuyYdhVDkjdOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202121474"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 04:26:42 -0800
Date: Wed, 7 Jan 2026 13:26:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH i-g-t 3/3] tests/asahi: Add test for
 DRM_IOCTL_ASAHI_GET_TIME
Message-ID: <20260107122639.ewxbql4n5qu3z6su@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janne Grunau <j@jannau.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <20260105-asahi-tests-wave1-v1-3-a6c72617e680@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105-asahi-tests-wave1-v1-3-a6c72617e680@jannau.net>
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
On 2026-01-05 at 22:03:47 +0100, Janne Grunau wrote:
> Test that the call succeeds, to subsequent calls do not produce the same
> timestamps and invalid flag values are rejected.
> 

+cc Alyssa and Neal

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  lib/igt_asahi.c              | 14 ++++++++++
>  lib/igt_asahi.h              |  3 +++
>  tests/asahi/asahi_get_time.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/asahi/meson.build      |  1 +
>  4 files changed, 81 insertions(+)
> 
> diff --git a/lib/igt_asahi.c b/lib/igt_asahi.c
> index 90d2c190f0dd05e372af0eefaed22d2b2a26eb71..17ac60749a3a5b03722403386f8b16cc0caeff3c 100644
> --- a/lib/igt_asahi.c
> +++ b/lib/igt_asahi.c
> @@ -42,3 +42,17 @@ void igt_asahi_get_params(int fd, uint32_t param_group, void *params, size_t siz
>  	else
>  		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params);
>  }
> +
> +/**
> + * igt_asahi_get_time:
> + * @fd: device file descriptor
> + * @get_time: pointer to drm_asahi_get_time struct
> + * @err: expected error code, 0 for success
> + */
> +void igt_asahi_get_time(int fd, struct drm_asahi_get_time *get_time, int err)
> +{
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_ASAHI_GET_TIME, get_time, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_TIME, get_time);
> +}
> diff --git a/lib/igt_asahi.h b/lib/igt_asahi.h
> index f0ac3fbf428a8050957eab0e9b259f68b5ecd0cd..a15acc5a08092fae0b3a569c527087082e6fc05c 100644
> --- a/lib/igt_asahi.h
> +++ b/lib/igt_asahi.h
> @@ -7,6 +7,9 @@
>  #include <stddef.h>
>  #include <stdint.h>
>  
> +#include "asahi_drm.h"
> +

imho this should be in previous patch.

>  void igt_asahi_get_params(int fd, uint32_t param_group, void *data, size_t size, int err);
> +void igt_asahi_get_time(int fd, struct drm_asahi_get_time *get_time, int err);
>  
>  #endif /* ASAHI_IOCTL_H */
> diff --git a/tests/asahi/asahi_get_time.c b/tests/asahi/asahi_get_time.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..91c865d0f8c65b410771b491758a81b4d4a96044
> --- /dev/null
> +++ b/tests/asahi/asahi_get_time.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) Asahi Linux contributors
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_asahi.h"

It should be before igt_core.h

> +#include "asahi_drm.h"

Now it is redundant, you have it in igt_asahi.h

> +#include <stdint.h>

Should be first include but it is also redundant as it
is in igt_asahi.h

> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver_render(DRIVER_ASAHI);
> +	}
> +
> +	igt_describe("Query GPU device time.");
> +	igt_subtest("get-time") {
> +		struct drm_asahi_get_time time = {};
> +
> +		igt_asahi_get_time(fd, &time, 0);
> +		// Nothing to assert on, the timestamp could have any value

Use C-style comments:
		/* Nothing to assert on, the timestamp could have any value */
So why not just printing it with igt_info()

> +	}
> +
> +	igt_describe("Query GPU device time twice and compare timestamps.");
> +	igt_subtest("get-time-compare") {
> +		struct drm_asahi_get_time time1 = {};
> +		struct drm_asahi_get_time time2 = {};
> +
> +		igt_asahi_get_time(fd, &time1, 0);
> +
> +		// sleep for 100 micro seconds to ensure

Same here, C-style /* comment... */

> +		usleep(100);
> +
> +		igt_asahi_get_time(fd, &time2, 0);
> +
> +		// assert that the timestamps are different

Same here.

> +		igt_assert(time1.gpu_timestamp != time2.gpu_timestamp);

You could also use igt_assert_noteq so you will get also actual
value printed in case they are the same.

> +	}
> +
> +	igt_describe("Query GPU device time with invalid flags values.");
> +	igt_subtest_group() {
> +		struct drm_asahi_get_time time = {};
> +
> +		igt_subtest("get-time-flags-1") {

imho better name invalid-time-flags-1

> +			time.flags = 1;
> +			igt_asahi_get_time(fd, &time, EINVAL);
> +		}
> +		igt_subtest("get-time-flags-2") {

invalid-time-flags-2

> +			time.flags = 2;
> +			igt_asahi_get_time(fd, &time, EINVAL);
> +		}
> +		igt_subtest("get-time-flags-uint64-max") {

invalid-time-flags-max

All above are minors so after fix imho you could add r-b
from Alyssa and Neal.

Regards,
Kamil

> +			time.flags = UINT64_MAX;
> +			igt_asahi_get_time(fd, &time, EINVAL);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/asahi/meson.build b/tests/asahi/meson.build
> index 909e146295e83f558ef7378f814ded55adaafe2b..2997017924f72443a7b5ad907c52a9976f464810 100644
> --- a/tests/asahi/meson.build
> +++ b/tests/asahi/meson.build
> @@ -1,5 +1,6 @@
>  asahi_progs = [
>  	'asahi_get_params',
> +	'asahi_get_time',
>  ]
>  
>  foreach prog : asahi_progs
> 
> -- 
> 2.52.0
> 
