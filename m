Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666168ACC4A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 13:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEFC112A1F;
	Mon, 22 Apr 2024 11:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k02c+1bR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D16112A1F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713786616; x=1745322616;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gd76lsOo4VGGSyfVLdRqHseFbsa9HDkzoH11UyZQ6eI=;
 b=k02c+1bR1AwwnYXD2Bx6YaoGLP3gX0qQC5imjXLVI8JAxgca1Ig0j6Ca
 DX0oLr9XJIOp71gHASgBlkf7JgAdFr49encfXXFsRWZX0aXbzbTgIUaqp
 jaHLwBGtdZO7kvu8cq43WCfwHZqKml5mMBWwFNsGJRt/EBF8tg7yceTyi
 RzrGv9RxESjBeVvLCi55xtoduwBWijrccmP6BckuUNYre3PkbnHlki4HE
 bSlw8GuOLwr+JFnXlGUezngqSd5Kbh4vem2V19vGmgyti2PKa+CQZRpPP
 21zFlikf5GvX6NQCfSPu3YF7uhxVI/sdpsty1Z7YJp+txAeEwzVhXV/NF w==;
X-CSE-ConnectionGUID: jnVkY1ZmSkqWjqVdcebhKQ==
X-CSE-MsgGUID: 69MzbU9WQf23W9znQUFijg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19871592"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19871592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 04:50:16 -0700
X-CSE-ConnectionGUID: ClJyYI3LQfiTqjN1U6lXYw==
X-CSE-MsgGUID: KltWatPSRn+GzrwENKC0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="61438122"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 04:50:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713780345.git.geert+renesas@glider.be>
Date: Mon, 22 Apr 2024 14:50:09 +0300
Message-ID: <87il09ty4u.fsf@intel.com>
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

On Mon, 22 Apr 2024, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 	Hi all,
>
> As discussed on IRC with Maxime and Arnd, this series reverts the
> conversion of select to depends for various DRM helpers in series
> "[PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
> depends on"[1], and various fixes for it.  This conversion introduced a
> big usability issue when configuring a kernel and enabling DRM drivers
> that use DRM helper code: as drivers now depend on helpers, the user
> needs to know which helpers to enable, before the driver he is
> interested even becomes visible.  The user should not need to know that,
> and drivers should select the helpers they need.
>
> Hence revert back to what we had before, where drivers selected the
> helpers (and any of their dependencies, if they can be met) they need.
> In general, when a symbol selects another symbol, it should just make
> sure the dependencies of the target symbol are met, which may mean
> adding dependencies to the source symbol.

I still disagree with this, because fundamentally the source symbol
really should not have to care about the dependencies of the target
symbol.

That said, I'm not going to keep arguing against this. Whatever.


BR,
Jani.


>
> Thanks for applying!
>
> [1] https://lore.kernel.org/r/20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org/
>
> Geert Uytterhoeven (11):
>   Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
>   Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
>   Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
>   Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
>   Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
>   Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
>   Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
>   Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
>   Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
>   Revert "drm: Make drivers depends on DRM_DW_HDMI"
>   Revert "drm/display: Make all helpers visible and switch to depends
>     on"
>
>  drivers/gpu/drm/Kconfig                 |  8 +++----
>  drivers/gpu/drm/amd/amdgpu/Kconfig      | 12 ++++------
>  drivers/gpu/drm/bridge/Kconfig          | 28 +++++++++++-----------
>  drivers/gpu/drm/bridge/analogix/Kconfig | 18 +++++++-------
>  drivers/gpu/drm/bridge/cadence/Kconfig  |  8 +++----
>  drivers/gpu/drm/bridge/imx/Kconfig      |  4 ++--
>  drivers/gpu/drm/bridge/synopsys/Kconfig |  6 ++---
>  drivers/gpu/drm/display/Kconfig         | 32 ++++++++++---------------
>  drivers/gpu/drm/exynos/Kconfig          |  4 ++--
>  drivers/gpu/drm/i915/Kconfig            |  8 +++----
>  drivers/gpu/drm/imx/ipuv3/Kconfig       |  5 ++--
>  drivers/gpu/drm/ingenic/Kconfig         |  2 +-
>  drivers/gpu/drm/mediatek/Kconfig        |  6 ++---
>  drivers/gpu/drm/meson/Kconfig           |  2 +-
>  drivers/gpu/drm/msm/Kconfig             |  8 +++----
>  drivers/gpu/drm/nouveau/Kconfig         | 10 ++++----
>  drivers/gpu/drm/panel/Kconfig           | 32 ++++++++++++-------------
>  drivers/gpu/drm/radeon/Kconfig          |  8 +++----
>  drivers/gpu/drm/renesas/rcar-du/Kconfig |  2 +-
>  drivers/gpu/drm/rockchip/Kconfig        | 10 ++++----
>  drivers/gpu/drm/sun4i/Kconfig           |  2 +-
>  drivers/gpu/drm/tegra/Kconfig           |  8 +++----
>  drivers/gpu/drm/vc4/Kconfig             | 10 ++++----
>  drivers/gpu/drm/xe/Kconfig              | 13 ++++------
>  drivers/gpu/drm/xlnx/Kconfig            |  8 +++----
>  25 files changed, 116 insertions(+), 138 deletions(-)

-- 
Jani Nikula, Intel
