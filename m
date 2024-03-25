Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992388A47B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98910E113;
	Mon, 25 Mar 2024 14:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTR9dY4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C457510E113
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711376943; x=1742912943;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Tbv1Su0NNi8AuHLkQKdmmbCwzlCEJIxWRZJyCozB3yw=;
 b=CTR9dY4hDJP5SBygexeXObX23KZgBTVnpMBoYhCSp1NipbFNmJCHc2sL
 o9uwRF9+Q6QyLY6uo86I5UJftiiuuBrsNQwZ+7PJTJzGFCN1s5ERA0k3A
 yOeoyQ0uONLS0ULJU8uvLq0eKzqht7un3aqKM7pdNY3+337pdnqzajOv/
 mjj38dyat+PCAYXRqPd/NAdsyiOhtz3tbgTSnBt4IBYFMgUjMkr8tXOwn
 I2XpqPGWtZDgjAweKP6zEFxMTG43+52JysJYv3g6SJKoU+gw5gJWvlFWl
 VaLC+Tg/2AwHswIzAEY7DHVbxYpS3GjKW3X7ji9e4Hjgl/NXyeI6aXxfz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6590695"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6590695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP; 25 Mar 2024 07:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20287822"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:13:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
In-Reply-To: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
Date: Mon, 25 Mar 2024 16:13:50 +0200
Message-ID: <87v85aield.fsf@intel.com>
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

On Mon, 25 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> Jani recently pointed out that the Kconfig symbols are a bit difficult
> to work with at the moment when they depend on each other, and that
> using depends on would be a better idea, but no one really did the work
> so far.
>
> So here it goes :)
>
> It's been tested by comparing the drm-misc-arm, drm-misc-arm64 and
> drm-misc-x86 before and after this series and making sure they are
> identical.
>
> Let me know what you think,
> Maxime

Thanks for doing this, I think this is the right direction!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

That said, 'make olddefconfig' is bound to drop some previously enabled
configs for people, I think in part due to the renames. For example, all
the CEC stuff and DP aux device got deselected for me. It's possibly
going to lead to some grumbling.


>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (12):
>       drm/display: Make DisplayPort AUX bus Kconfig name consistent
>       drm/display: Make DisplayPort tunnel debug Kconfig name consistent
>       drm/display: Make DisplayPort AUX Chardev Kconfig name consistent
>       drm/display: Make DisplayPort CEC-over-AUX Kconfig name consistent
>       drm/display: Reorder Kconfig symbols
>       drm/display: Make all helpers visible and switch to depends on
>       drm: Switch DRM_DISPLAY_HELPER to depends on
>       drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on
>       drm: Switch DRM_DISPLAY_DP_HELPER to depends on
>       drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on
>       drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on
>       drm/bridge: it6505: Remove useless select
>
>  arch/parisc/configs/generic-32bit_defconfig      |  2 +-
>  drivers/gpu/drm/Kconfig                          |  8 +--
>  drivers/gpu/drm/amd/amdgpu/Kconfig               | 12 +++--
>  drivers/gpu/drm/bridge/Kconfig                   | 29 +++++-----
>  drivers/gpu/drm/bridge/analogix/Kconfig          | 16 +++---
>  drivers/gpu/drm/bridge/cadence/Kconfig           |  8 +--
>  drivers/gpu/drm/bridge/synopsys/Kconfig          |  4 +-
>  drivers/gpu/drm/display/Kconfig                  | 68 ++++++++++++------------
>  drivers/gpu/drm/display/Makefile                 |  6 +--
>  drivers/gpu/drm/display/drm_dp_helper.c          |  2 +-
>  drivers/gpu/drm/display/drm_dp_helper_internal.h |  2 +-
>  drivers/gpu/drm/display/drm_dp_tunnel.c          | 10 ++--
>  drivers/gpu/drm/exynos/Kconfig                   |  4 +-
>  drivers/gpu/drm/i915/Kconfig                     |  8 +--
>  drivers/gpu/drm/i915/Kconfig.debug               |  4 +-
>  drivers/gpu/drm/mediatek/Kconfig                 |  6 +--
>  drivers/gpu/drm/msm/Kconfig                      |  8 +--
>  drivers/gpu/drm/nouveau/Kconfig                  | 10 ++--
>  drivers/gpu/drm/panel/Kconfig                    | 32 +++++------
>  drivers/gpu/drm/radeon/Kconfig                   |  8 +--
>  drivers/gpu/drm/rockchip/Kconfig                 |  8 +--
>  drivers/gpu/drm/tegra/Kconfig                    |  8 +--
>  drivers/gpu/drm/vc4/Kconfig                      | 10 ++--
>  drivers/gpu/drm/xe/Kconfig                       | 13 +++--
>  drivers/gpu/drm/xlnx/Kconfig                     |  8 +--
>  include/drm/display/drm_dp_helper.h              |  2 +-
>  26 files changed, 155 insertions(+), 141 deletions(-)
> ---
> base-commit: 5e842d55bad7794823a50f24fd645b58f2ef93ab
> change-id: 20240325-kms-kconfig-helpers-f94991bdd6fa
>
> Best regards,

-- 
Jani Nikula, Intel
