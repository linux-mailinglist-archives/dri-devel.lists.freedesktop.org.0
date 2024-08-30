Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B619660EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 13:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6C10EA8F;
	Fri, 30 Aug 2024 11:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKPYQgsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870DA10EA91
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725018227; x=1756554227;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BppDBUfTxk7hWt6OENvRKCxA8Lzq/CkTXkRuPUHlw7E=;
 b=kKPYQgsPl6WWyoim5IVfZm03qze+BpfVmdxvRk1houm9FS1H6wUMzRMF
 5in88bJULPH2Mlb53rvyHFHiRByk9vl2bk03SpVkClv0wJYxX6dTvzdQy
 xoD4H3xo4axNg+F6y/JMMTfrUKex58nJnFmBEYFSUHe6e/W/XDyujOd7w
 OWCR9VI2bhFquozPGAuPAY6zKtvxVHa9kXmV+SmcAy6M4PVwUZwUei/B9
 H7B2ILstntmHuzgGey5+vXyPs0Y9Pw2QHbA44OK5ifdoWW0YO+B6rcMb+
 6z6vkV5wGSu78fnQ1BQtvovxVXy3oGTG5QttDa2rRTOX1Bb6mExiV293o Q==;
X-CSE-ConnectionGUID: FdA2Iui/SWe+56UeeZB+7w==
X-CSE-MsgGUID: s3o41hI9T2idaVYalNf34w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="13296241"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="13296241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:43:47 -0700
X-CSE-ConnectionGUID: Nd6cmudnRs2lB8s4qvSSvA==
X-CSE-MsgGUID: 5e+k6uwvTqaU/YndVIIKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64373925"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:43:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/mm: Mark drm_mm_interval_tree*() functions
 with __maybe_unused
In-Reply-To: <20240829154640.1120050-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829154640.1120050-1-andriy.shevchenko@linux.intel.com>
Date: Fri, 30 Aug 2024 14:43:38 +0300
Message-ID: <87ttf2utg5.fsf@intel.com>
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

On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> The INTERVAL_TREE_DEFINE() uncoditionally provides a bunch of helper
> functions which in some cases may be not used. This, in particular,
> prevents kernel builds with `make W=1` and CONFIG_WERROR=y:
>
> .../drm/drm_mm.c:152:1: error: unused function 'drm_mm_interval_tree_insert' [-Werror,-Wunused-function]
>   152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   153 |                      u64, __subtree_last,
>       |                      ~~~~~~~~~~~~~~~~~~~~
>   154 |                      START, LAST, static inline, drm_mm_interval_tree)
>       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by marking drm_mm_interval_tree*() functions with __maybe_unused.
>
> Fixes: 202b52b7fbf7 ("drm: Track drm_mm nodes with an interval tree")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

As discussed in [1], the key combo is W=1 and Clang, which enables
detection for unused static inlines.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


[1] https://lore.kernel.org/r/20240829155950.1141978-1-andriy.shevchenko@linux.intel.com


> ---
>  drivers/gpu/drm/drm_mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 5ace481c1901..1ed68d3cd80b 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -151,7 +151,7 @@ static void show_leaks(struct drm_mm *mm) { }
>  
>  INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>  		     u64, __subtree_last,
> -		     START, LAST, static inline, drm_mm_interval_tree)
> +		     START, LAST, static inline __maybe_unused, drm_mm_interval_tree)
>  
>  struct drm_mm_node *
>  __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last)

-- 
Jani Nikula, Intel
