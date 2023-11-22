Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1B7F4F0F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 19:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99D010E0A7;
	Wed, 22 Nov 2023 18:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B910E0BC;
 Wed, 22 Nov 2023 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700676880; x=1732212880;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9nZs9NL5PhUrhzlCMNJwhDAN87Ff/7LRKVKu7CSGOkY=;
 b=GVK/hnWYy5qOpffu3M+CKOGtMM7p/OK8+fH84jWicf7655PTKWmX86wC
 RovBx6vkpUvI5ICcWToZoXAH8ng+6m55iFdaDDhxhw2r74oyvIp3Yj6JT
 pOtT9DsDqrSZmONcJY2EzcHor51KymdjshtejoP5XVk14EoDT88j0UWwj
 g2eZy+h+/CRt/6+klewpJJYf3w87XZtn+po/s+G2jYl5B0iJDUNnPKokJ
 QWVGLx6OFa1yoJgJpdtYmpFti+AswqW6vUSWkMZPL3grJ0h2OEl3uI/Jo
 6D2ivbzUtdhj7gOeQM6p26vvJ2GlgnRVOtdXcWRpwn8/l0yosA4gHB/j2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456437983"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="456437983"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833131272"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="833131272"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:14:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 cai.huoqing@linux.dev
Subject: Re: [PATCH 04/14] drm/i915: Include <drm/drm_auth.h>
In-Reply-To: <20231122122449.11588-5-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-5-tzimmermann@suse.de>
Date: Wed, 22 Nov 2023 20:14:32 +0200
Message-ID: <871qchmz93.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> One of the source files includes <drm/drm_auth.h> via <drm/drm_legacy.h>,
> which will be removed. Include drm_auth.h directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b1aa62dfb155d..81a57dd52dfda 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -9,6 +9,7 @@
>  #include <linux/sync_file.h>
>  #include <linux/uaccess.h>
>  
> +#include <drm/drm_auth.h>
>  #include <drm/drm_syncobj.h>
>  
>  #include "display/intel_frontbuffer.h"

-- 
Jani Nikula, Intel
