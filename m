Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728453663F
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 19:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7BD10E086;
	Fri, 27 May 2022 17:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C95910E00D;
 Fri, 27 May 2022 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653670833; x=1685206833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tjul+Wdkz0iZL5egZsqCl8R7b7Db0zLor30i4I4LNCo=;
 b=MB07vpuYVAKgPzwzOzuNBFOEnpW5qZbS1BKZvpzpcEdoyYNw2/ycL6nv
 U0H2GZquCCiXwIQvKGqLphQ9cW8lvmjp85kWqOJ32Ejk94Jc9ZiDGhUbd
 u1D9QPMa84fsdQfJ0AAzZRDmRUkXVocOdhLyuCIsyaR7WkO9rqkQ4akZb
 S2gigopUMcBjXHv4eLMXxqYSWhdpNKAZLuSu0Wzp0iiiY9pRd4ZshGSND
 96GaWi9A8hsDqzlAvjbY4S2lM1dOjQkT2hUdbzQ7Le0GP7rqgRtDczPgZ
 h0Pbscrk9hBvj0Yf0WrcGm7A+BOLGSC3I4yd6x3TSQmASx8bpfhmo6drN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="274535365"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="274535365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 10:00:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="643469372"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 10:00:32 -0700
Date: Fri, 27 May 2022 10:00:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [CI] Revert "drm/i915: Add relocation exceptions for
 two other platforms"
Message-ID: <YpEDr+yzOJFb+K/A@mdroper-desk1.amr.corp.intel.com>
References: <20220527081046.2692809-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527081046.2692809-1-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 01:10:46AM -0700, Lucas De Marchi wrote:
> This reverts commit bcefacd359f07dee18795dd80f834acb47fd21eb.
> 
> IGT conversion is ready, so these execptions can already be removed.
> Once CI is clean, this commit will actually be removed from
> topic/core-for-CI.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 21 +++++--------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b279588c0672..c326bd2b444f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -492,27 +492,16 @@ eb_unreserve_vma(struct eb_vma *ev)
>  	ev->flags &= ~__EXEC_OBJECT_RESERVED;
>  }
>  
> -static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
> -{
> -	/*
> -	 * Relocations are disallowed starting from gen12 with Tigerlake
> -	 * as an exception. To unblock CI, we are temporarily allowing it
> -	 * for Rocketlake and Alderlake.
> -	 */
> -	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915) ||
> -	    IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
> -	    IS_ALDERLAKE_P(eb->i915))
> -		return true;
> -
> -	return false;
> -}
> -
>  static int
>  eb_validate_vma(struct i915_execbuffer *eb,
>  		struct drm_i915_gem_exec_object2 *entry,
>  		struct i915_vma *vma)
>  {
> -	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
> +	/* Relocations are disallowed for all platforms after TGL-LP.  This
> +	 * also covers all platforms with local memory.
> +	 */
> +	if (entry->relocation_count &&
> +	    GRAPHICS_VER(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
>  		return -EINVAL;
>  
>  	if (unlikely(entry->flags & eb->invalid_flags))
> -- 
> 2.36.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
