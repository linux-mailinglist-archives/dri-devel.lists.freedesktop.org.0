Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34190A842D3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CCE10E987;
	Thu, 10 Apr 2025 12:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="balEMmLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67CA10E98C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744287477; x=1775823477;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/vPxfywetHX+fhqCqSdZetF2ymbYGH4zX8hdF169ROE=;
 b=balEMmLSMNnrff72lOBGNgcMsSmjnGwzB+2BD0HqDbFwnSpPG5dNdwoy
 nBOAFf75/TwiV62w8CuSn1bi6EWB6ivoF3LDEHL4Ngsevs8TsSwU8+Icx
 NGkxyd7kHv9US+B79z1BnMbsExO6jmQNBeomSqSiIIe4VM/U4W8QLSGMM
 E+XntYhdVfWWMwhHjKGba7z2XO3KQGkTPtUrScVbzTX872BHez8upy4ck
 09VvhaALoJM0APIaTESg8Gn8f+fy9rga76LNfu76PMaerLivr1UoLQOS0
 17KIWyc5j69KXs+im7mnTchdS2RLQ051epx+0y643CWIpLkSkcDZ+gJ+b w==;
X-CSE-ConnectionGUID: Cmo3gNcaSze+dd9El2CWtw==
X-CSE-MsgGUID: VJz4XFRETV2MSbtSyHmFag==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56440132"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56440132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:17:53 -0700
X-CSE-ConnectionGUID: sSZ2lsqGSYO2j6YQkDvK8w==
X-CSE-MsgGUID: Cr4hjxX5THeDB8Ct4Z+6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129219759"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:17:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Mark CONFIG_DRM_HEADER_TEST as BROKEN
In-Reply-To: <20250410095014.20471-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250410095014.20471-1-tzimmermann@suse.de>
Date: Thu, 10 Apr 2025 15:17:48 +0300
Message-ID: <87bjt4us5v.fsf@intel.com>
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

On Thu, 10 Apr 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> The flag got lost during a merge. Add it back.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Simona Vetter <simona@ffwll.ch>
> Closes: https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&highlight_names=&date=2025-04-10&show_html=true
> Fixes: 1afba39f9305 ("Merge drm/drm-next into drm-misc-next")
> Acked-by: Simona Vetter <simona@ffwll.ch>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
> index c493743e8aca0..fa6ee76f4d3c5 100644
> --- a/drivers/gpu/drm/Kconfig.debug
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -27,7 +27,7 @@ config DRM_WERROR
>  
>  config DRM_HEADER_TEST
>  	bool "Ensure DRM headers are self-contained and pass kernel-doc"
> -	depends on DRM && EXPERT
> +	depends on DRM && EXPERT && BROKEN
>  	default n
>  	help
>  	  Ensure the DRM subsystem headers both under drivers/gpu/drm and

-- 
Jani Nikula, Intel
