Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F59CA71620
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 12:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343F10E6AF;
	Wed, 26 Mar 2025 11:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdPr96O+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4C10E121;
 Wed, 26 Mar 2025 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990172; x=1774526172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pe9hT+8vNs/VCkLVh+laTypGPeET9eix5N3L2/nKLfQ=;
 b=CdPr96O+U9FCKT+Zi8QL4Yc/uF07i4ucqUqtd590tq69OfHEKh3Zfz6r
 qNe9d23GbGmJo6dzq5F6HgatP1ixteOaDIeXO7K8BStd2Ld+GJ7zZRxBN
 yXLfCldeMcc8FE1Ek9uMJccIf83QDI8bPtqit9TQXevSp0m5txkhnaAdV
 hGub7LHJQ5z9hxmhDboKixuNYFF+RDjQdzIfc7GzGX1nNOCx6ieXpuKXd
 RgTKY2exCBzuoJPCY3Ahj9HwMHGXOcqSLMuT73lIah0waPAskyyt5VZ+p
 y9RcRsfI0pDxHuPnjivHi9jcLqZnpZYnS7C5GXRPRWnLVWNhPpCjnKozr A==;
X-CSE-ConnectionGUID: 2xaY2tLgTb+1NRyhP2zWgQ==
X-CSE-MsgGUID: hlE9AORsT2+LI14g69IidQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55649137"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="55649137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 04:56:12 -0700
X-CSE-ConnectionGUID: hiEJXkJ1SfmQCwqmJ/2p0Q==
X-CSE-MsgGUID: f6T5ksUfS46xeY4ToK4dSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129427137"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 04:56:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: update MAINTAINERS
In-Reply-To: <20250227093805.2217658-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250227093805.2217658-1-jani.nikula@intel.com>
Date: Wed, 26 Mar 2025 13:56:05 +0200
Message-ID: <87msd86m5m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 27 Feb 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Update GVT-g MAINTAINERS entry to reflect the current status of
> maintenance and repositories.
>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>

Zhenyu, Zhi, ping? Any input from you?

BR,
Jani.

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  MAINTAINERS | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b69b93f63c6..98374661f5a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11649,13 +11649,10 @@ F:	drivers/gpio/gpio-tangier.c
>  F:	drivers/gpio/gpio-tangier.h
>  
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> -M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> -M:	Zhi Wang <zhi.wang.linux@gmail.com>
> -L:	intel-gvt-dev@lists.freedesktop.org
> -L:	intel-gfx@lists.freedesktop.org
> -S:	Supported
> +R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> +R:	Zhi Wang <zhi.wang.linux@gmail.com>
> +S:	Odd Fixes
>  W:	https://github.com/intel/gvt-linux/wiki
> -T:	git https://github.com/intel/gvt-linux.git
>  F:	drivers/gpu/drm/i915/gvt/
>  
>  INTEL HID EVENT DRIVER

-- 
Jani Nikula, Intel
