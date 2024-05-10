Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24528C2472
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD70E10E1C3;
	Fri, 10 May 2024 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKH1TJjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA710E1C3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715342767; x=1746878767;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dgXOkmyw1/j9zC83bJnjpSXTj6+ZZajgUDb8wAtQLmU=;
 b=NKH1TJjyQTUH9dwfIMiBeOt5ojjNLqjdZJ7cI2fcMzBUIDccy+y9YS6K
 wRGxYSmJUD9vBaV1XK7LPqAJZ2/TjyQEXawLIAa7aOawCYZ+FSpD+4UIu
 20xl47zTRY6/DMRYIALjNm3ZJvPxXMfLwWgK0QqUAIcrx7THtyYL5UqHC
 bTGfDqUFhb57dn2o6lmWxjVdQ4lth7+f+SCF3o+P9/36aaITInfH8lqcN
 0Q082tZDBMLn0yjVBeR92bZJNgKh5uW3VV2HjL7zVqB9RnB7rmgPCVvFr
 MYIjmxe3kpDjE1hE+RsoWYY3T3Q1gNRSAipumG22bMW99uc3UQ9oOpXmw Q==;
X-CSE-ConnectionGUID: 6jGyfH7aRvGtIAKU8oKDbA==
X-CSE-MsgGUID: MtHwkfkRQvenBjbHdITNxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33832014"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="33832014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:06:07 -0700
X-CSE-ConnectionGUID: zXXZeYnfTZKB80YzPBHfNg==
X-CSE-MsgGUID: ioZ5Oby5S1eLuT8D0UwRjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29657451"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:06:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/5] drm/udl: Clean up Makefile
In-Reply-To: <20240410120928.26487-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-4-tzimmermann@suse.de>
Date: Fri, 10 May 2024 15:06:01 +0300
Message-ID: <87y18hhnx2.fsf@intel.com>
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

On Wed, 10 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Clean up Makefile before listing new object files. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/udl/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
> index 3f6db179455d1..00690741db376 100644
> --- a/drivers/gpu/drm/udl/Makefile
> +++ b/drivers/gpu/drm/udl/Makefile
> @@ -1,4 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -udl-y := udl_drv.o udl_modeset.o udl_main.o udl_transfer.o
> +
> +udl-y := \
> +	udl_drv.o \
> +	udl_main.o \
> +	udl_modeset.o \
> +	udl_transfer.o
>  
>  obj-$(CONFIG_DRM_UDL) := udl.o

-- 
Jani Nikula, Intel
