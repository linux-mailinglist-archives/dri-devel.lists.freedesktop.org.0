Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD85964365
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07D10E64B;
	Thu, 29 Aug 2024 11:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjSudxre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42D10E64B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724931887; x=1756467887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=swpAJjEIyZMdTtQndrhQNykxbjxtHiW/ZNCU5nFhZNs=;
 b=mjSudxredpYQdyLEENQiwhgzwwhT3k+ZbTvODv7AEG+BqzB8rBwFr8go
 huISRnVKawRUNvpAs447fdIlS0rUj7NUXV70RHqCYyANPcmtBW+V4I48k
 XY/AAek6dtwCcF94oznd3UxX2uCRzt3sE8OxX2946rKs4N9ixX8ujroTI
 CBcYB5jaLEMuf23xPmQqGs4W24HMIjEn2nL5bvQosWKDTNfbqEvkbl57r
 u6FHe80cPkpgJbg6kixTHpNuuae27h2uKV0yUHFhhwKPYBWTgaBESTaY1
 J4MuO0gNhdxfvWgMTd4f4+zJaMNwYOdXO2SI76HLKs7UfsGLVBXa8Fb9u Q==;
X-CSE-ConnectionGUID: goE9WBvFTNuJl/L1pI8z4A==
X-CSE-MsgGUID: Y/7jPP6NRUi1q3dMCSonQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23317367"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23317367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:44:47 -0700
X-CSE-ConnectionGUID: 3hDXrTQASre9T2GC7Ar0TQ==
X-CSE-MsgGUID: L5Ts+onFS4u48+i9NQgLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63609558"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.14])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:44:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, inki.dae@samsung.com
Subject: Re: [PATCH 0/6] drm: conversions to struct drm_edid
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724348429.git.jani.nikula@intel.com>
Date: Thu, 29 Aug 2024 14:44:41 +0300
Message-ID: <87ttf3wo2e.fsf@intel.com>
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

On Thu, 22 Aug 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> The umerged patches from [1] and then some.
>
> BR,
> Jani.
>
> [1] https://lore.kernel.org/r/cover.1715691257.git.jani.nikula@intel.com
>
> Jani Nikula (6):
>   drm/sti/sti_hdmi: convert to struct drm_edid
>   drm/tegra: convert to struct drm_edid
>   drm/ipuv3/parallel: convert to struct drm_edid
>   drm/tiny/gm12u320: convert to struct drm_edid

Pushed the above to drm-misc-next, thanks for the reviews and acks.

>   drm/exynos: hdmi: use display_info for printing display dimensions
>   drm/exynos: hdmi: convert to struct drm_edid

I'll wait for Inki to check these.

BR,
Jani.

>
>  drivers/gpu/drm/exynos/exynos_hdmi.c         | 25 ++++++++++-------
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 ++++++----
>  drivers/gpu/drm/sti/sti_hdmi.c               | 24 +++++++++-------
>  drivers/gpu/drm/tegra/drm.h                  |  2 +-
>  drivers/gpu/drm/tegra/output.c               | 29 ++++++++++++--------
>  drivers/gpu/drm/tiny/gm12u320.c              | 13 +++++++--
>  6 files changed, 66 insertions(+), 41 deletions(-)

-- 
Jani Nikula, Intel
