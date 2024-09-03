Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4E96A696
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA6910E395;
	Tue,  3 Sep 2024 18:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/s5H/y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BE210E395
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725388333; x=1756924333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bbK/ChdCGWWtAeomVfnTC1pDOginoVo1EJRCCfUvjVM=;
 b=Q/s5H/y1YpmxqIc3emOw5BpOqH8E3aeXmD79YvG/N2tIcXG9nlsO1DmS
 ygjAN+ry0IyVwJVHszIN99jZA7wJ4nJF3/IzsHlUHMDBfGIK36/1MSp2z
 mkok5NUFBUqF3BP7ulu+mmE07EGbXwZvanOvmv/yIyxeS72i0cJaeZjUR
 I4A1UVQQirLg2az+EZzL8v9BpRqfmUKDumU11TmaAC3VENNX1rQ6U0bjp
 RcWnU3B8J56KDH+unEhhS2L58MnVkDxZtyH/rJwNm5gNcdg71CtW86arM
 7lL1gbCwgzHeVRkUQaZ5WzQ/uQeDqEudH/KWpLvOShuwKyvX+XdyUTqAp Q==;
X-CSE-ConnectionGUID: 20zPkhUTTX+WToAjyQ+kgg==
X-CSE-MsgGUID: SKbhEPluSMqzRaKv74k3eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24200701"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="24200701"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 11:24:53 -0700
X-CSE-ConnectionGUID: NCSSc9ELR9Wo/ZrPkYbUTA==
X-CSE-MsgGUID: 33/cm75lSe25cS5w8/mXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69155334"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 11:24:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1slYCw-00000004nza-2Npy; Tue, 03 Sep 2024 21:24:50 +0300
Date: Tue, 3 Sep 2024 21:24:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/mm: annotate drm_mm_node_scanned_block() with
 __maybe_unused
Message-ID: <ZtdUcteHkNDNbZAw@smile.fi.intel.com>
References: <20240903173437.3212437-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903173437.3212437-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 03, 2024 at 08:34:37PM +0300, Jani Nikula wrote:
> Clang build with CONFIG_DRM_DEBUG_MM=n, CONFIG_WERROR=y, and W=1 leads
> to:
> 
>   CC [M]  drivers/gpu/drm/drm_mm.o
> ../drivers/gpu/drm/drm_mm.c:614:20: error: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
>                    ^
> 
> Fix this by annotating drm_mm_node_scanned_block() with __maybe_unused.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


