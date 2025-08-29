Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113EB3BA14
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99310EB8A;
	Fri, 29 Aug 2025 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVQnHdPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46B10E035;
 Fri, 29 Aug 2025 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756467770; x=1788003770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M5YZX/k473bXhW3f1BZQTbpkQWVySIVhxfb29zOKWDk=;
 b=YVQnHdPqqGJvwAk6cS1o3uRcRG5+aA87MoPchnA8no7xazNpTLgNPdIp
 YA0MjFC/h6YYgeDEUuNpljCrP+aWS2+jYqMAs6sqlzRpN1OK5EuP8EJ+z
 xBA7x7GE4c9feUaDWKyZBof7hZ1YW5vB1CaYHC4yr9X3yD0uGynGf1uVZ
 ik6viuvDfCZ+SnmjAYmPemhi2V5dsN99xaAsbIn63HOaHV5rkQlCdL0bk
 Zzbpblpm89tO9x20HgwWm33Qu23nXob3Lof79nyVPYbgGRz4MjcZCuJHG
 JF0inK2JYDiVoRZ2kAi9PDB35jagd2IPAKg5oQ4JmNgIPdRpePAHz5WQN A==;
X-CSE-ConnectionGUID: wAHhQ5hKQsmbhQQ4afDiMA==
X-CSE-MsgGUID: c4xVH7GZQZ+kRxlA+IKpNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70190401"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70190401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:42:49 -0700
X-CSE-ConnectionGUID: oSC9uAjSRUCD1RsCQP7Arg==
X-CSE-MsgGUID: Pg9Kd0A2TYK4elhMPbiOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170257394"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:42:46 -0700
Date: Fri, 29 Aug 2025 13:42:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/4] lib: initial panthor infrastructure
Message-ID: <20250829114243.wkerbxpyngc7h3ha@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
 <20250828130402.2549948-4-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828130402.2549948-4-daniel.almeida@collabora.com>
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
On 2025-08-28 at 10:03:59 -0300, Daniel Almeida wrote:
> Add the basic infrastructure that will be used by the Panthor tests
> themselves.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  lib/igt_panthor.c | 14 ++++++++++++++
>  lib/igt_panthor.h |  8 ++++++++
>  lib/meson.build   |  1 +

Could you squash patch 2 and this one plus one basic test?
imho panthor_query.c is a good candidate for a first
working test, simple enough.

>  3 files changed, 23 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> new file mode 100644
> index 000000000..3e2c29b17
> --- /dev/null
> +++ b/lib/igt_panthor.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt_panthor.h"
> +
> +/**
> + * SECTION:igt_panthor
> + * @short_description: Panthor support library
> + * @title: Panthor
> + * @include: igt.h
> + *
> + * This library provides various auxiliary helper functions for writing Panthor
> + * tests.
> + */
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> new file mode 100644
> index 000000000..c4bee1838
> --- /dev/null
> +++ b/lib/igt_panthor.h
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: MIT

In headers you should use C-ctyle comments:

/* SPDX-License-Identifier: MIT */

> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.

Same here.

Regards,
Kamil

> +
> +#ifndef IGT_PANTHOR_H
> +#define IGT_PANTHOR_H
> +
> +
> +#endif /* IGT_PANTHOR_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index f078dad4e..1738f1b54 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -104,6 +104,7 @@ lib_sources = [
>  	'igt_kmod.c',
>  	'igt_ktap.c',
>  	'igt_panfrost.c',
> +	'igt_panthor.c',
>  	'igt_v3d.c',
>  	'igt_vc4.c',
>  	'igt_vmwgfx.c',
> -- 
> 2.50.1
> 
