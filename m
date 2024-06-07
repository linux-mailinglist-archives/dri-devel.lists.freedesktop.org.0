Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59579900360
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3C110E00A;
	Fri,  7 Jun 2024 12:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFc77jNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780A10E00A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717763047; x=1749299047;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T8125ejlFGHXH+zMyxlBEkin5nrHb/FzXg7E29LfCHY=;
 b=NFc77jNedfTJ7zjGBpyUO3MR+YhbFRl2jdHmAnbOBPyO7uFZocz6KmGk
 Osqn7Bq27LNtPlvHxDsYsiXVNzl/oqnUfqmWgHDIrQBtSgzGg50OGhM4X
 /7OZgO5Fb1LVOJqXBlJFMd7/88E7kh+zhimmzCigSjNzKmHcU1M4KLPqm
 f36JelCvwJC2z2gLD2GDwcJm0uzK5agpdz2G5M61MJp1LAX8+gP5lc+11
 /poDbuHt1oaSnVMb9lB4dYU6SZBL+baG/B8AGF+diLD00zSQkmHm9F64p
 6LTCRtw5ZVTgPBejVC0at6zNtlppFdo25+Ls1UiefvTNzlD3Gfe4T4cB5 Q==;
X-CSE-ConnectionGUID: HkVQTJ/eSna7TkZwrK61CA==
X-CSE-MsgGUID: HpU06Z2bTtOenAnC6MMuMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39880626"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39880626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:24:06 -0700
X-CSE-ConnectionGUID: kaNUbnJxRJaCm3Pc1ocK3Q==
X-CSE-MsgGUID: EKEwEkJISJ6eU4mp2Febkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38430882"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:24:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH] drm: have config DRM_WERROR depend on !WERROR
In-Reply-To: <20240516083343.1375687-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240516083343.1375687-1-jani.nikula@intel.com>
Date: Fri, 07 Jun 2024 15:24:01 +0300
Message-ID: <87o78dkkke.fsf@intel.com>
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

On Thu, 16 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> If WERROR is already enabled, there's no point in enabling DRM_WERROR or
> asking users about it.

Ping. Any comments? (Besides the one snark.)


BR,
Jani.

>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com
> Fixes: f89632a9e5fa ("drm: Add CONFIG_DRM_WERROR")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 026444eeb5c6..d0aa277fc3bf 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -450,6 +450,7 @@ config DRM_PRIVACY_SCREEN
>  config DRM_WERROR
>  	bool "Compile the drm subsystem with warnings as errors"
>  	depends on DRM && EXPERT
> +	depends on !WERROR
>  	default n
>  	help
>  	  A kernel build should not cause any compiler warnings, and this

-- 
Jani Nikula, Intel
