Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FB89CA84
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082821128E5;
	Mon,  8 Apr 2024 17:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL0BqglA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640F81128E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712596361; x=1744132361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LM51WNt4LKD9F91xkInIrmNKLU9g81q/kDLyolQS1Zw=;
 b=jL0BqglA6fmkgAUkSVFO0hkWFB5Y8fCSLlnh1O6hVWdcVzJFh5Sq4Yw+
 3PIMx76wG6yAIrn+PpNIgCGQGBKM7hqEdEgMEWUsuTHCpLNQKcGWYMlg6
 PNEVZLqjHYBxjIA/kF3rF6xScst4GU6WStZ7r91YRoT4cStr72UUcOaLH
 wvHEx8NyFhWlg1XgKAIDKBq2b5xusY6Amza7/1tlb1KWL5N0wOcb/Kio7
 aM4yERxV8inhl6DbPolqHiYO/5/qZBPjTYWxJsj44Cz7Crx8xQpAhr+FU
 HO4fdINQsJGqWuIKg3vH5ESH6G4Ekoqc0DL4Y8jzMwBoNG7WMIF98rsVS A==;
X-CSE-ConnectionGUID: sLp95jchTOWJbDaExjWm4g==
X-CSE-MsgGUID: m2DdJAyMQfmU4yHpPwepzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7794000"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7794000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792346"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792346"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:12:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:12:37 +0300
Date: Mon, 8 Apr 2024 20:12:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 15/21] drm/omap: Allow build with COMPILE_TEST=y
Message-ID: <ZhQlheAqYXuAUHk-@intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-16-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Mon, Apr 08, 2024 at 08:04:20PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow omapdrm to be built with COMPILE_TEST=y for greater
> coverage.
> 
> FIXME: Still borked due to ?

In fact not borked anymore. Just forgot to update
the commit message.

> 
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/omapdrm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index 6c49270cb290..85ed92042b74 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_OMAP
>  	tristate "OMAP DRM"
>  	depends on DRM && OF
> -	depends on ARCH_OMAP2PLUS
> +	depends on ARCH_OMAP2PLUS || COMPILE_TEST
>  	select DRM_KMS_HELPER
>  	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>  	select VIDEOMODE_HELPERS
> -- 
> 2.43.2

-- 
Ville Syrjälä
Intel
