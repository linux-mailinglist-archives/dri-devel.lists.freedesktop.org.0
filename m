Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DBA80D1D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A263E10E6B3;
	Tue,  8 Apr 2025 14:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUivsPgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D903310E6B3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744120810; x=1775656810;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g62DhpF9htYBcWbvXt20kf76a2U33NooGuxj8LQXM2I=;
 b=QUivsPgnZ80UExpgqgRyeT4T5lobQ8BPx94rMsbXjMs0EjZeG+ldVGC1
 6GcPm1uOVhvT3xhlSWM4yjNfQZZW4PIsQ4H0o5YJ/625Ddu+EGSO1DDR2
 LKRI135zJ3AACQ96MSTy/i4OdQrrK60mjK55B+XdpCT20THc2+fNaCL5e
 cwp/iHRgi6mF7jtBwDc0v4G7rhRqnlex1+bQ4IW0pUd+wsustAUwI6qYl
 0/0ajpUcLmAOLZbn1W8TpZnqeUKqNCJP87O7UtatEB8Mn39o+EK4fSwDJ
 e4918c0Xcb6TVPKJU85GK2EHU6VIUvJ5gEFyusiuBWymSJ/Qv0HyQj9Nh w==;
X-CSE-ConnectionGUID: NbCRgG9uQeWiBe+MSvGVCA==
X-CSE-MsgGUID: Ba1oYOvfSJO6LKajN2mLHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33157501"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="33157501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:00:09 -0700
X-CSE-ConnectionGUID: 97kSALiVRRCgbSH9lf+Q4A==
X-CSE-MsgGUID: UEL4KiHHSRypleV0IqsxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133002284"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:00:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH drm-rerere] nightly.conf: Update to
 ssh.gitlab.freedesktop.org
In-Reply-To: <20250408134635.43488-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250408134635.43488-1-lucas.demarchi@intel.com>
Date: Tue, 08 Apr 2025 17:00:04 +0300
Message-ID: <87ldsaycrf.fsf@intel.com>
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

On Tue, 08 Apr 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Add the old url to the old array, and the new one. This will prompt the
> user with the following message when `dim updated-branches` is called:
>
> 	Update drm to new ssh://git@ssh.gitlab.freedesktop.org/drm/kernel.git? (y/N)
>
> ... for each repository it's changing. After that, git should be
> configured with the new repositories.
>
> Note that we are taking the opportunity to be explicit on the protocol,
> adding the ssh:// and dropping the entry without it. It's clearer and
> less entries to maintain.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks for doing this!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Tested-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  nightly.conf | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index 49abf3fb2a727..17961b5cb4e47 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -17,11 +17,12 @@ DIM_MIN_VERSION=1
>  # dim users may freely choose the remote names and URLs from this list.
>  #
>  drm_tip_repos[drm-tip]="
> -git@gitlab.freedesktop.org:drm/tip.git
> +ssh://git@ssh.gitlab.freedesktop.org/drm/tip.git
>  https://gitlab.freedesktop.org/drm/tip.git
> -ssh://git@gitlab.freedesktop.org/drm/tip.git
>  "
>  drm_old_urls[drm-tip]="
> +git@gitlab.freedesktop.org:drm/tip.git
> +ssh://git@gitlab.freedesktop.org/drm/tip.git
>  ssh://git.freedesktop.org/git/drm/drm-tip
>  ssh://git.freedesktop.org/git/drm-tip
>  git://anongit.freedesktop.org/drm/drm-tip
> @@ -30,16 +31,20 @@ https://anongit.freedesktop.org/git/drm/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip.git
>  "
>  drm_tip_repos[drm-xe]="
> -git@gitlab.freedesktop.org:drm/xe/kernel.git
> +ssh://git@ssh.gitlab.freedesktop.org/drm/xe/kernel.git
>  https://gitlab.freedesktop.org/drm/xe/kernel.git
> +"
> +drm_old_urls[drm-xe]="
> +git@gitlab.freedesktop.org:drm/xe/kernel.git
>  ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>  "
>  drm_tip_repos[drm-intel]="
> -git@gitlab.freedesktop.org:drm/i915/kernel.git
> +ssh://git@ssh.gitlab.freedesktop.org/drm/i915/kernel.git
>  https://gitlab.freedesktop.org/drm/i915/kernel.git
> -ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
>  "
>  drm_old_urls[drm-intel]="
> +git@gitlab.freedesktop.org:drm/i915/kernel.git
> +ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
>  ssh://git.freedesktop.org/git/drm/drm-intel
>  ssh://git.freedesktop.org/git/drm-intel
>  git://anongit.freedesktop.org/drm/drm-intel
> @@ -48,11 +53,12 @@ https://anongit.freedesktop.org/git/drm/drm-intel
>  https://anongit.freedesktop.org/git/drm/drm-intel.git
>  "
>  drm_tip_repos[drm-misc]="
> -git@gitlab.freedesktop.org:drm/misc/kernel.git
> +ssh://git@ssh.gitlab.freedesktop.org/drm/misc/kernel.git
>  https://gitlab.freedesktop.org/drm/misc/kernel.git
> -ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
>  "
>  drm_old_urls[drm-misc]="
> +git@gitlab.freedesktop.org:drm/misc/kernel.git
> +ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
>  ssh://git.freedesktop.org/git/drm/drm-misc
>  ssh://git.freedesktop.org/git/drm-misc
>  git://anongit.freedesktop.org/drm/drm-misc
> @@ -61,11 +67,12 @@ https://anongit.freedesktop.org/git/drm/drm-misc
>  https://anongit.freedesktop.org/git/drm/drm-misc.git
>  "
>  drm_tip_repos[drm]="
> -git@gitlab.freedesktop.org:drm/kernel.git
> +ssh://git@ssh.gitlab.freedesktop.org/drm/kernel.git
>  https://gitlab.freedesktop.org/drm/kernel.git
> -ssh://git@gitlab.freedesktop.org/drm/kernel.git
>  "
>  drm_old_urls[drm]="
> +git@gitlab.freedesktop.org:drm/kernel.git
> +ssh://git@gitlab.freedesktop.org/drm/kernel.git
>  ssh://git.freedesktop.org/git/drm/drm
>  git://anongit.freedesktop.org/drm/drm
>  https://anongit.freedesktop.org/git/drm/drm

-- 
Jani Nikula, Intel
