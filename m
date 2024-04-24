Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52348B09FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819BD10FD30;
	Wed, 24 Apr 2024 12:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmbCwEHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A87310EDEA;
 Wed, 24 Apr 2024 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713962902; x=1745498902;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=C8/UHqH96Shz8uCXa/Hys3yMwU0B5igqVD7bYQFIh5M=;
 b=OmbCwEHgPnCgPi2LwWiyOCZIhdsAdqeJ31+xQjMNapZJMZb6e/rpkwM/
 +XNv/M0GKNiWdaP923F6P1YlUj2gWjvrzOo0xkVN2CMZgByevqIPsLWd3
 eU1TyOzIzE8SytknZ+2q0oEmTpED0EXmaxOIOPK+ieaTed1pzC4r2aNz5
 vsGk2nUnEPHqfWp6qargqL0WYPeYxHgTzGvsChMEbsqC4lMaZBBaFvvTe
 9McWS9nPmhdFwBORYjYepATenw3UTb1PlbvQJ8kxFgB1RJWUJLgL6ZX6K
 mGkBeSK6dyjrWFAKBO5u4M9omVRFjHfdbFGDrlVYuu7UfN5uWqacZSCBv g==;
X-CSE-ConnectionGUID: QHP/nnBURV+3DGizrMvVww==
X-CSE-MsgGUID: UbxoYdIfRcSlBvxD3QIC7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9754943"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9754943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:48:22 -0700
X-CSE-ConnectionGUID: G9mH4NMlSPmcbBR/bXWOsA==
X-CSE-MsgGUID: O0ERnDhZRbuLysTcEC7Gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24718416"
Received: from vgrigo2x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.49])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:48:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] nightly.conf: Update drm-intel URLs, add missing bare
 ssh drm-xe URL
In-Reply-To: <20240424113218.37162-2-ryszard.knop@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424113218.37162-2-ryszard.knop@intel.com>
Date: Wed, 24 Apr 2024 15:48:17 +0300
Message-ID: <87y193orji.fsf@intel.com>
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

On Wed, 24 Apr 2024, Ryszard Knop <ryszard.knop@intel.com> wrote:
> - Switch drm-intel URLs to the new GitLab location.
> - Add a short SSH link for drm-xe for completeness with other blocks.
> - Add a missing tab in drm_tip_config for column alignment.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  nightly.conf | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index 7ef4249f0c67..2971277b0e25 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -30,10 +30,16 @@ https://anongit.freedesktop.org/git/drm/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip.git
>  "
>  drm_tip_repos[drm-xe]="
> +git@gitlab.freedesktop.org:drm/xe/kernel.git
>  https://gitlab.freedesktop.org/drm/xe/kernel.git
>  ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>  "
>  drm_tip_repos[drm-intel]="
> +git@gitlab.freedesktop.org:drm/i915/kernel.git
> +https://gitlab.freedesktop.org/drm/i915/kernel.git
> +ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
> +"
> +drm_old_urls[drm-intel]="
>  ssh://git.freedesktop.org/git/drm/drm-intel
>  ssh://git.freedesktop.org/git/drm-intel
>  git://anongit.freedesktop.org/drm/drm-intel
> @@ -97,6 +103,6 @@ drm_tip_config=(
>  	"drm-xe			drm-xe-next"
>  
>  	"drm-intel		topic/core-for-CI"
> -	"drm-xe		topic/xe-for-CI"
> +	"drm-xe			topic/xe-for-CI"
>  	"drm-intel		topic/thunderbolt-next"
>  ) # DO NOT CHANGE THIS LINE

-- 
Jani Nikula, Intel
