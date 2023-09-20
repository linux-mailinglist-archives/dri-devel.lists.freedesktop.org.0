Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6356F7A76DC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 11:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832E910E46C;
	Wed, 20 Sep 2023 09:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2B710E46C;
 Wed, 20 Sep 2023 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695200928; x=1726736928;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=AfhwoS7uXIFUvf4f5ZkpilRwaDSDXoWJQQj3zfGwfrk=;
 b=EdQHEEzeyWO/4pMYsrtA3ROQKO1nY8VdrFF+EdY3dGXm0qbuqKBW5E2D
 0c5rs5ck6DmWzKbIdHt5Ajh4Odmw4XBL1KgVyk1quYX+H6lL+c5wM8Q2C
 25lnB5AjgTX7b7Ib/9+mJi8TyxKYDeiG9vgwmgF3YXS/vgeN2VhweUbla
 Ij2TS0ZE3jVyYUPIfrRPvKRf6NsQHG7BbUfCpxzW6j6MDRgHlXbZbNeFh
 uGKamvXNiuSKBbsLcV/k0gd9Iw2lXoqwxa9zE0ABJl3OmTQ8z2xabq9eO
 YaY6Ox/rLaOgXeO33cNdtwYTORxnUbXy4L3glVMLP4fmgGAPs21/qHOLG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380075502"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="380075502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781617993"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="781617993"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:08:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Zap some empty lines
In-Reply-To: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
Date: Wed, 20 Sep 2023 12:08:43 +0300
Message-ID: <87r0mtrz38.fsf@intel.com>
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

On Wed, 20 Sep 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Recent refactoring left an unsightly block of empty lines. Remove them.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

One of the harder patches I've reviewed this week.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 87ffc477c3b1..511eba3bbdba 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -646,13 +646,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_TIGERLAKE_UY(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_TIGERLAKE, INTEL_SUBPLATFORM_UY)
>  
> -
> -
> -
> -
> -
> -
> -
>  #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>  	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))

-- 
Jani Nikula, Intel
