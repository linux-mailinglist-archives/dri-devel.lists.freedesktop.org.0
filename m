Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C71875121
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08B410F145;
	Thu,  7 Mar 2024 14:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mp2hOEkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9D310F145
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709820129; x=1741356129;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1qluQbdxldcjdIAzSqLZp9dOHlsvydurHkEmIQx6vvo=;
 b=mp2hOEkqId68WL3KpwpARMiBxWq4RdJKq5v08Q4ixgMHZyVpJC8yM3FF
 GkcjDSyASCgVSjJjGuZFHZS6Lo3fUdBCuMXzqC5Xg7PUxCSp4kM2Vqxq9
 BYH03+eszLsszxwuPQVmhSk4NZtWQwMNrrTxWD02q8vNa6BlalQDDSNIy
 XcJTVXbBjp/A34eyFjpiOxZqjEPbbLxDxJGEyWYSJjZvWFwXq2WEOsTkS
 8/kMmqeeDlS+QgykoCEa8tctBvgCik6qaTCTTIdysdCRFikd1RDp4goJ9
 /1L1K3WmBnH8fPvBqmxQT5v6PIuToJQrpr4eC3utLW30j9qCSCgiCdN1P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4416616"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4416616"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 06:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10540142"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 06:02:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Daniel Stone
 <daniels@collabora.com>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Update drm-misc web page
In-Reply-To: <20240306153841.698693-2-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240306153841.698693-1-mripard@kernel.org>
 <20240306153841.698693-2-mripard@kernel.org>
Date: Thu, 07 Mar 2024 16:02:02 +0200
Message-ID: <87jzmew36t.fsf@intel.com>
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

On Wed, 06 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> This URL gets redirected to the Intel landing page now. Let's switch the
> webpage to freedesktop.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4e33b3a3bc0..cdd3ddd6efb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7019,11 +7019,11 @@ F:	include/uapi/drm/
>  DRM DRIVERS AND MISC GPU PATCHES
>  M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>  M:	Maxime Ripard <mripard@kernel.org>
>  M:	Thomas Zimmermann <tzimmermann@suse.de>
>  S:	Maintained
> -W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

Maybe also add bug tracker link?

B: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues

>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/

-- 
Jani Nikula, Intel
