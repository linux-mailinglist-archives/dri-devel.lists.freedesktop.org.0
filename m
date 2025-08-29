Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BFDB3B9F6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28510EB88;
	Fri, 29 Aug 2025 11:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiBrjVZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933B10E035;
 Fri, 29 Aug 2025 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756467118; x=1788003118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rqZFIZg6hhjuXI2cqRkKrKAgoibbV8tjWAJYKVqXfUk=;
 b=CiBrjVZwtA4mqzUlqESl98qbZWvpZM6kBCb0No8LwvGcONyGrwfcsCe/
 fP3U2LTDs1DyaXkZBfjTKC08ioys3C9PVNx10BIdWQG55nUEYzYrin/np
 8qMyrRh8BSWl8tZCSN0RLhTYr+49AmniJaSjFBeI+4L5wqZ7IboCrjjY0
 Lon2QSr436uriLgeROdA7Ww3WjgZI6WvELktDXFFF1HbhZvJBurf5TUBm
 bnQ/vx2bvB2lVqarmEiPoLPjG0qfUZdkv+Br8KXJZwYXPbL3lQBiYBXhV
 cA7wizRBT3Q/vp7NkWXAotcs6gGd1KhJPscR5+SxejdGHltHWRUIE/jMu w==;
X-CSE-ConnectionGUID: 2xN0tbc7Se27hRevTsVjdw==
X-CSE-MsgGUID: xCjNXAepTweolFaJqEG0fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84155536"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84155536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:31:57 -0700
X-CSE-ConnectionGUID: DVhZKaykSVehyhCfsVbEmA==
X-CSE-MsgGUID: upnz0RL4Qnytrpitnfze+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201303668"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:31:55 -0700
Date: Fri, 29 Aug 2025 13:31:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/4] tests/panthor: add panthor tests
Message-ID: <20250829113151.hb2jcmcy2wq5g5fd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
 <20250828130402.2549948-5-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828130402.2549948-5-daniel.almeida@collabora.com>
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

Hi Daniel,
On 2025-08-28 at 10:04:00 -0300, Daniel Almeida wrote:
> Add an initial test suit covering query device properties, allocating
> memory, binding and unbinding VA ranges through VM_BIND and submitting a
> simple piece of work through GROUP_SUBMIT.

Missing s-o-b here.

> ---
>  lib/igt_panthor.c             | 136 ++++++++++++++++++
>  lib/igt_panthor.h             |  20 +++
>  tests/panthor/meson.build     |   4 +
>  tests/panthor/panthor_gem.c   |  59 ++++++++
>  tests/panthor/panthor_group.c | 264 ++++++++++++++++++++++++++++++++++
>  tests/panthor/panthor_query.c |  25 ++++
>  tests/panthor/panthor_vm.c    |  73 ++++++++++
>  7 files changed, 581 insertions(+)
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 3e2c29b17..c422320c5 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -2,6 +2,9 @@
>  // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
>  
>  #include "igt_panthor.h"
> +#include "drmtest.h"

Keep it in alphabetical order, so "drmtest.h" before "igt_panthor.h"

> +#include "ioctl_wrappers.h"
> +#include "panthor_drm.h"
>  
>  /**
>   * SECTION:igt_panthor
> @@ -12,3 +15,136 @@
>   * This library provides various auxiliary helper functions for writing Panthor
>   * tests.
>   */
> +
> +void igt_panthor_query(int fd, int32_t type, void* data, size_t size, int err)
> +{
> +    struct drm_panthor_dev_query query = {

Here and everywhere below use tabs in beginnig of line,
as checkpatch.pl should tell you. Also, in IGT there is
.checkpatch.conf in root folder, you could reuse it.

Regards,
Kamil

> +        .type = type,
> +        .pointer = (uintptr_t)data,
> +        .size = size,
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
> +    }
> +}

[cut]
