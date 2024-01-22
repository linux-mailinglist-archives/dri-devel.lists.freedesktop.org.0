Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0E9836CF4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959C810E653;
	Mon, 22 Jan 2024 17:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA310E639;
 Mon, 22 Jan 2024 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705944090; x=1737480090;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kWQHfwN1yi0ttF4juKCo2E5MXvh0hWGgjbREXz8PJQ8=;
 b=LkJ7m296x7DIwIPEUn0o/TVjKHkD70hWTYJbNrXS7RouO4YU+Nhv3ky9
 1S5EPeeZkVjeQf9Q0xDfFimy2ZLvF/P1nU+05jJuqnq173jBZU+VrfbYU
 RLB4VcFh1CxbnPsZeQIH8SIXXqoHiAvmU/0LCP6SSqXx+EmWPJLlvrN3E
 5/5ENZVuNRGks1IgB9k1dLAJt/JuO/zPyHcnSCCzpT2EJabzuMHiFOGHI
 9DLMo+Bm0LEJlapfLrbPi/QvDUtNHrDHue48orR3nxuExVrgI4+PYlvVx
 jtZQVkXPHSWVoGWe6E7RmUBPU3yEhMyuoanezXczwL0V2oriZALHJV+S0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="22750049"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22750049"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="27723905"
Received: from mshelego-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.40.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:21:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: Separate @failing_port list in
 drm_dp_mst_atomic_check_mgr() comment
In-Reply-To: <20231114081033.27343-1-bagasdotme@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114081033.27343-1-bagasdotme@gmail.com>
Date: Mon, 22 Jan 2024 19:21:19 +0200
Message-ID: <87r0i9nv1s.fsf@intel.com>
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
 Bagas Sanjaya <bagasdotme@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> Stephen Rothwell reported htmldocs warnings when merging drm-intel
> tree:
>
> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5484: ERROR: Unexpected indentation.
> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5488: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Separate @failing_port return value list by surrounding it with a
> blank line to fix above warnings.
>
> Fixes: 1cd0a5ea427931 ("drm/dp_mst: Factor out a helper to check the atomic state of a topology manager")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20231114141715.6f435118@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks, pushed to drm-misc-fixes.

BR,
Jani.

> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 0854fe428f173a..b9a98587fbef7f 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5479,6 +5479,7 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
>   *   - 0 if the new state is valid
>   *   - %-ENOSPC, if the new state is invalid, because of BW limitation
>   *         @failing_port is set to:
> + *
>   *         - The non-root port where a BW limit check failed
>   *           with all the ports downstream of @failing_port passing
>   *           the BW limit check.
> @@ -5487,6 +5488,7 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
>   *         - %NULL if the BW limit check failed at the root port
>   *           with all the ports downstream of the root port passing
>   *           the BW limit check.
> + *
>   *   - %-EINVAL, if the new state is invalid, because the root port has
>   *     too many payloads.
>   */
>
> base-commit: 59be90248b422f2924872de0be2867652214096a

-- 
Jani Nikula, Intel
