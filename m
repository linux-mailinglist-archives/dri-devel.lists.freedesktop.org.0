Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37930CFD67E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 12:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B4F10E057;
	Wed,  7 Jan 2026 11:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jyx8w+q8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41DB10E031;
 Wed,  7 Jan 2026 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767785654; x=1799321654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JAxEZqqz6EJGA/R3k09eGy3oZPfnQZRUgKQUUI8QS7k=;
 b=Jyx8w+q8Urpd6gBhvnx94DWEczY2Tj00pesi+8SQiHDXlS1nu865bpmo
 uzbmRnDWUffpzlD1crS4kTLRpHJb+iuXpvEn8m991kbXtlxOEmKi+GWj1
 kYsIWKyArvPKZ3Fb742SwFGLgQxH0eU1+m3cfvax5pQezOR3XZq2PYk51
 PMBsEC+npYcUCF+cpU85/JZhTsVd7DR1kVugEfvxIpVdx9kA9kiDRZHiN
 fp4j+IlAG0xQuNx1B5bnLdk08WLB6nodwqNNKC0RBDIX+oo6Nx73AMeE0
 i/Cg9XV5AmhFo6yMnqxhpO/eOLxBtTO8Fxpg9qbLbfC1+KxTaSMTwcm0v A==;
X-CSE-ConnectionGUID: yLb9ElDvRmauUAoG2XPIyg==
X-CSE-MsgGUID: sxkS0OGjRvSu7kPxoOKz7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80514558"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="80514558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 03:33:56 -0800
X-CSE-ConnectionGUID: u7gH7FV9STSGYWZVkZ/92g==
X-CSE-MsgGUID: HRFF9JwqQ2GzFHAsdz7WaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="203354662"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:33:55 -0800
Date: Wed, 7 Jan 2026 12:33:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH i-g-t 1/3] drm-uapi/asahi: Initial import of asahi_drm.h
Message-ID: <20260107113335.pwzhci7gdwd2lmtj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janne Grunau <j@jannau.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <20260105-asahi-tests-wave1-v1-1-a6c72617e680@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105-asahi-tests-wave1-v1-1-a6c72617e680@jannau.net>
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
On 2026-01-05 at 22:03:45 +0100, Janne Grunau wrote:
> Import asahi_drm.h from commit 8f0b4cce4481 ("Linux 6.19-rc1").
> "asahi_drm.h" was added for Linux 6.16 and has not been modified so far.
> The kernel driver will be sent upstream in the next few days. The
> userspace drivers (OpenGL, OpenCl and Vulkan) are available in
> mesa 25.2 and later.
> 

+cc Alyssa and Neal

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  include/drm-uapi/asahi_drm.h | 1194 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1194 insertions(+)
> 
> diff --git a/include/drm-uapi/asahi_drm.h b/include/drm-uapi/asahi_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..de67f1c603afd42753982c7ed593619f394df527
> --- /dev/null
> +++ b/include/drm-uapi/asahi_drm.h
> @@ -0,0 +1,1194 @@
> +/* SPDX-License-Identifier: MIT */

Note style comment in C headers. The same should be used in IGT
headers.

> +/*
> + * Copyright (C) The Asahi Linux Contributors

Strange, no year here? As it comes from kernel let it be as is.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> + * Copyright (C) 2018-2023 Collabora Ltd.
> + * Copyright (C) 2014-2018 Broadcom
> + */
> +#ifndef _ASAHI_DRM_H_
> +#define _ASAHI_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: Introduction to the Asahi UAPI
> + *
> + * This documentation describes the Asahi IOCTLs.
> + *
> + * Just a few generic rules about the data passed to the Asahi IOCTLs (cribbed
> + * from Panthor):
> + *
[cut]
