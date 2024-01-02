Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BD821E0A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 15:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E3110E1A8;
	Tue,  2 Jan 2024 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE21010E1B3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704206938; x=1735742938;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V51w5K1EQfkD+FE5AxSfH4Xycasu1bgRbde+rYFFCpc=;
 b=ioPL8PoFA8ax63ldzFSh8GYySPHOt0Ut1zeq6aFVGt8VF3G2UnccTLRA
 ZqOQU8gD3ddJPOVtIL5KbX3TOQtn+A5NTv0kUtl02STqqEGSAKgGv0nmD
 L0LJddL454G6zU8djiMvopWTv1QohM7FdK0d9zlmQDvssYkEO7MFc3rac
 t0Y40m9gOHDMbakwwH0tF3THFouPuRydZaEZXXJGViEbNrTwtRdZPShs8
 h6dRdwxFfHGRks1SrmxCWkKd/Ug7TGi8pkEndHPIOphjQpNwlZYluKfPV
 asXwdtPhD7pQwy5Vh3eVUCVWbb3HNi6AYwtSjmJseOqr7aGBaJsKLqpJz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4223305"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="4223305"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 06:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="952942909"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="952942909"
Received: from dmaryin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 06:48:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/debugfs: drop unneeded DEBUG_FS guard
In-Reply-To: <20231223183301.78332-1-dario.binacchi@amarulasolutions.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231223183301.78332-1-dario.binacchi@amarulasolutions.com>
Date: Tue, 02 Jan 2024 16:48:42 +0200
Message-ID: <87sf3f23lh.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 23 Dec 2023, Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> The Makefile enables/disables the file compilation depending on
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the patch, pushed to drm-misc-next.

BR,
Jani.

>
> ---
>
> Changes in v2:
> - Add 'Reviewed-by' tag of Jani Nikula
>
>  drivers/gpu/drm/drm_debugfs.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index f291fb4b359f..f80d9cf3e71a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -45,8 +45,6 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> -#if defined(CONFIG_DEBUG_FS)
> -
>  /***************************************************
>   * Initialization, etc.
>   **************************************************/
> @@ -588,5 +586,3 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	debugfs_remove_recursive(crtc->debugfs_entry);
>  	crtc->debugfs_entry = NULL;
>  }
> -
> -#endif /* CONFIG_DEBUG_FS */

-- 
Jani Nikula, Intel
