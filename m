Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC480852F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B5110E848;
	Thu,  7 Dec 2023 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5E10E848
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701943783; x=1733479783;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=stqB4Md+ZZOYLCgF6qapx4pmRrG6lHUghmboWy8jyL4=;
 b=RXD3JAmfnw46dsUHqHVD4jlDXg9H1Vho2QMtDqCQv6j9T2VbrGIbaQxn
 mqNRjf/4melGjl7PIJBOHnLRMYO7ZIbVnXiZAVzGz5Isv3xvCY1Vcf1eG
 ZNDfEnd0D1qeQXP+e+2MzWGq2NET6o2wLnJ0MUKbR3P5F7dmNJuVdMkOt
 jnY4DsOiQx6Cj5Ojh/w2ST2r/Oam9kiN1CDhDr9i3Wh3CllhhzTGlqKrE
 eCsRRkgFzmtp1HN8vXYCXyS0yP9rVGjIbmXaAQQy24pINVgEhdCQES03O
 Jx7+qK0hRSMQXYttjmoHA0bLphzpEZc+5NKyTt9s47m4dJIOO2ChA6jGg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1313257"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1313257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800685910"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800685910"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:09:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/debugfs: drop unneeded DEBUG_FS guard
In-Reply-To: <20231206150201.669055-1-dario.binacchi@amarulasolutions.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231206150201.669055-1-dario.binacchi@amarulasolutions.com>
Date: Thu, 07 Dec 2023 12:09:36 +0200
Message-ID: <87cyvi1fz3.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Dec 2023, Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> The Makefile enables/disables the file compilation depending on
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
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
