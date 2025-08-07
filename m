Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC4B1DCE2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 20:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5A310E193;
	Thu,  7 Aug 2025 18:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF9TDFPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7016A10E193
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754590087; x=1786126087;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7H1rVpWbf3l5tKQbNYZlhGFORV7o9SDgT/R+Vfl2LkU=;
 b=LF9TDFPlukzqPr4Pdn/coeD9l1zviwk0fXlVIaqm65K5ZF3falm3yHdW
 2HqAZ2wIGCdEAEssdcVOTMHfi4hK1O45FVcOgCM801WhdPkHE1dMbtt/D
 ThNVrSdqwLxNdthtZjUoCd+abRtuEBK3MJ8TIqMD0sHnkic+i2CDi9uVy
 8OKHP+SoZUaO4MdCjhE/d++mhVMPcQ1B6Bod1vwh0v+pY5yK6msSWJ0Mm
 tMCFzyoO6XGRcM6hgyk6qxBfwtpcKCnUvu1xCrAlL4QnRabGJHtxic40Y
 IY5OwfGYRQKTm4HdlVT0kvDJ60Rha3mlXIqzEo8c0ATR+JpFMYE2VnnR3 A==;
X-CSE-ConnectionGUID: 7tUu8bX8RFS4H0jsOS9O0Q==
X-CSE-MsgGUID: 4cCobkb9Q4yAKXmyhmhTCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60784454"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60784454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:08:06 -0700
X-CSE-ConnectionGUID: d0THkmcPS0GzEri5UiCvYw==
X-CSE-MsgGUID: nL/tGmBzRGCk/KzsqNUFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="170381101"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:08:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: willy@infradead.org, Qianfeng Rong <rongqianfeng@vivo.com>
Subject: Re: [PATCH v2 1/2] drm/locking: remove redundant __GFP_NOWARN
In-Reply-To: <20250807143919.575439-2-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807143919.575439-1-rongqianfeng@vivo.com>
 <20250807143919.575439-2-rongqianfeng@vivo.com>
Date: Thu, 07 Aug 2025 21:07:59 +0300
Message-ID: <2a0a178a0929dc76cd88ec840d52043cd367451d@intel.com>
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

On Thu, 07 Aug 2025, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
> GFP_NOWAIT already includes __GFP_NOWARN, so let's remove the redundant
> __GFP_NOWARN.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index beb91a13a312..58eac20a8138 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -88,7 +88,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>  
>  	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>  
> -	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
> +	return stack_depot_save(entries, n, GFP_NOWAIT);
>  }
>  
>  static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
> @@ -98,7 +98,7 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
>  	unsigned int nr_entries;
>  	char *buf;
>  
> -	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> +	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT);
>  	if (!buf)
>  		return;

-- 
Jani Nikula, Intel
